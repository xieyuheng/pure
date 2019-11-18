{-# OPTIONS --prop #-}

module category.transformation where

open import basic

open import category
open category-t

open import category.functor
open functor-t

record transformation-t
  {lv : level-t}
  (dom cod : category-t lv)
  (src tar : functor-t dom cod)
  : type (lsucc lv) where
  field
    path :
      (a : dom .object-t) ->
      cod .morphism-t (src .map a) (tar .map a)
    naturality :
      {a b : dom .object-t}
      (f : dom .morphism-t a b) ->
      the-eqv-t (cod .morphism-t (src .map a) (tar .map b))
        (cod .compose (path a) (tar .fmap f))
        (cod .compose (src .fmap f) (path b))
