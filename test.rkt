#lang racket/gui

(define (make-notes-list)
  (reverse
   (apply append
          (for/list ((octave '(2 3 4)))
            (for/list ((note '("C" "D" "E" "F" "G" "A" "B")))
              (format "~a-~a" note octave))))))
    

(define frame (new frame% [label "rackseq"]))
(define hp (new horizontal-panel%
                [parent frame]
                [alignment '(center center)]))
(for ((i (in-range 16)))
  (let ((vp (new vertical-panel%
                 [parent hp]
                 [alignment '(center center)])))
    
    (let ((l (format "b~s" i)))
      (new choice%
           [parent vp]
           [label ""]
           [choices (make-notes-list)]
           [callback
            (lambda (button event) (printf "~s\n" l))])
      (new check-box%
           [parent vp]
           [label ""]
           [callback
            (lambda (button event) (printf "~s\n" l))])
      )))

  (send frame show #t)


