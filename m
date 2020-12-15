Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED992DB3D9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 19:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54758.95305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpFD9-00052r-Uc; Tue, 15 Dec 2020 18:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54758.95305; Tue, 15 Dec 2020 18:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpFD9-00052S-R7; Tue, 15 Dec 2020 18:38:11 +0000
Received: by outflank-mailman (input) for mailman id 54758;
 Tue, 15 Dec 2020 18:38:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpFD7-00052M-NB
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 18:38:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpFD7-0005Cr-Fk; Tue, 15 Dec 2020 18:38:09 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpFD7-0002c7-50; Tue, 15 Dec 2020 18:38:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LALxq+qUWS03eoWYacC62lznzYhwKjKvDAm+Not7hYI=; b=PzCbbQjwNFvq8huJNniOJipY31
	H9W6hJIFQoLRQwB0iI74uynj2IxZp1hZJQY1PMyVRyU1eZctpvdw5ATLaXJtOxVUxMwN3ljKLj9kr
	NC8safmcThESLIq/lCZLp9nHQq/4sig7UzPxxjXWT8VY9/gEDyWd7C4RYIYgPnwvfICU=;
Subject: Re: [RFC PATCH v2 08/15] xen/arm64: port Linux's arm64 atomic_ll_sc.h
 to Xen
To: Ash Wilding <ash.j.wilding@gmail.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, rahul.singh@arm.com
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
 <20201111215203.80336-9-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <17e5fe0b-cb9f-0411-1862-363d9dc4385f@xen.org>
Date: Tue, 15 Dec 2020 18:38:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201111215203.80336-9-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ash,

On 11/11/2020 21:51, Ash Wilding wrote:
> From: Ash Wilding <ash.j.wilding@gmail.com>
> 
> Most of the "work" here is simply deleting the atomic64_t helper
> definitions as we don't have an atomic64_t type in Xen.

There is some request to support atomic64_t in Xen. I would suggest to 
keep as this would be simpler to support it in the future.

Although, we can probably just revert part of the patch when this is 
necessary.

> 
> Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
> ---
>   xen/include/asm-arm/arm64/atomic_ll_sc.h | 134 +----------------------

I think we want to update README.LinuxPrimitives also with the new 
baseline for the helpers.

>   1 file changed, 6 insertions(+), 128 deletions(-)
> 
> diff --git a/xen/include/asm-arm/arm64/atomic_ll_sc.h b/xen/include/asm-arm/arm64/atomic_ll_sc.h
> index e1009c0f94..20b0cb174e 100644
> --- a/xen/include/asm-arm/arm64/atomic_ll_sc.h
> +++ b/xen/include/asm-arm/arm64/atomic_ll_sc.h
> @@ -1,16 +1,16 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Based on arch/arm/include/asm/atomic.h
> + * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
>    *
>    * Copyright (C) 1996 Russell King.
>    * Copyright (C) 2002 Deep Blue Solutions Ltd.
>    * Copyright (C) 2012 ARM Ltd.
> + * SPDX-License-Identifier: GPL-2.0-only

May I ask why the SDPX license was moved around?

>    */
>   
> -#ifndef __ASM_ATOMIC_LL_SC_H
> -#define __ASM_ATOMIC_LL_SC_H
> +#ifndef __ASM_ARM_ARM64_ATOMIC_LL_SC_H
> +#define __ASM_ARM_ARM64_ATOMIC_LL_SC_H

I would suggest to keep the Linux guards.

>   
> -#include <linux/stringify.h>
> +#include <xen/stringify.h>
>   
>   #ifdef CONFIG_ARM64_LSE_ATOMICS
>   #define __LL_SC_FALLBACK(asm_ops)					\
> @@ -134,128 +134,6 @@ ATOMIC_OPS(andnot, bic, )
>   #undef ATOMIC_OP_RETURN
>   #undef ATOMIC_OP
>   
> -#define ATOMIC64_OP(op, asm_op, constraint)				\
> -static inline void							\
> -__ll_sc_atomic64_##op(s64 i, atomic64_t *v)				\
> -{									\
> -	s64 result;							\
> -	unsigned long tmp;						\
> -									\
> -	asm volatile("// atomic64_" #op "\n"				\
> -	__LL_SC_FALLBACK(						\
> -"	prfm	pstl1strm, %2\n"					\
> -"1:	ldxr	%0, %2\n"						\
> -"	" #asm_op "	%0, %0, %3\n"					\
> -"	stxr	%w1, %0, %2\n"						\
> -"	cbnz	%w1, 1b")						\
> -	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
> -	: __stringify(constraint) "r" (i));				\
> -}
> -
> -#define ATOMIC64_OP_RETURN(name, mb, acq, rel, cl, op, asm_op, constraint)\
> -static inline long							\
> -__ll_sc_atomic64_##op##_return##name(s64 i, atomic64_t *v)		\
> -{									\
> -	s64 result;							\
> -	unsigned long tmp;						\
> -									\
> -	asm volatile("// atomic64_" #op "_return" #name "\n"		\
> -	__LL_SC_FALLBACK(						\
> -"	prfm	pstl1strm, %2\n"					\
> -"1:	ld" #acq "xr	%0, %2\n"					\
> -"	" #asm_op "	%0, %0, %3\n"					\
> -"	st" #rel "xr	%w1, %0, %2\n"					\
> -"	cbnz	%w1, 1b\n"						\
> -"	" #mb )								\
> -	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
> -	: __stringify(constraint) "r" (i)				\
> -	: cl);								\
> -									\
> -	return result;							\
> -}
> -
> -#define ATOMIC64_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint)\
> -static inline long							\
> -__ll_sc_atomic64_fetch_##op##name(s64 i, atomic64_t *v)		\
> -{									\
> -	s64 result, val;						\
> -	unsigned long tmp;						\
> -									\
> -	asm volatile("// atomic64_fetch_" #op #name "\n"		\
> -	__LL_SC_FALLBACK(						\
> -"	prfm	pstl1strm, %3\n"					\
> -"1:	ld" #acq "xr	%0, %3\n"					\
> -"	" #asm_op "	%1, %0, %4\n"					\
> -"	st" #rel "xr	%w2, %1, %3\n"					\
> -"	cbnz	%w2, 1b\n"						\
> -"	" #mb )								\
> -	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter)	\
> -	: __stringify(constraint) "r" (i)				\
> -	: cl);								\
> -									\
> -	return result;							\
> -}
> -
> -#define ATOMIC64_OPS(...)						\
> -	ATOMIC64_OP(__VA_ARGS__)					\
> -	ATOMIC64_OP_RETURN(, dmb ish,  , l, "memory", __VA_ARGS__)	\
> -	ATOMIC64_OP_RETURN(_relaxed,,  ,  ,         , __VA_ARGS__)	\
> -	ATOMIC64_OP_RETURN(_acquire,, a,  , "memory", __VA_ARGS__)	\
> -	ATOMIC64_OP_RETURN(_release,,  , l, "memory", __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (, dmb ish,  , l, "memory", __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (_relaxed,,  ,  ,         , __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (_acquire,, a,  , "memory", __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (_release,,  , l, "memory", __VA_ARGS__)
> -
> -ATOMIC64_OPS(add, add, I)
> -ATOMIC64_OPS(sub, sub, J)
> -
> -#undef ATOMIC64_OPS
> -#define ATOMIC64_OPS(...)						\
> -	ATOMIC64_OP(__VA_ARGS__)					\
> -	ATOMIC64_FETCH_OP (, dmb ish,  , l, "memory", __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (_relaxed,,  ,  ,         , __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (_acquire,, a,  , "memory", __VA_ARGS__)	\
> -	ATOMIC64_FETCH_OP (_release,,  , l, "memory", __VA_ARGS__)
> -
> -ATOMIC64_OPS(and, and, L)
> -ATOMIC64_OPS(or, orr, L)
> -ATOMIC64_OPS(xor, eor, L)
> -/*
> - * GAS converts the mysterious and undocumented BIC (immediate) alias to
> - * an AND (immediate) instruction with the immediate inverted. We don't
> - * have a constraint for this, so fall back to register.
> - */
> -ATOMIC64_OPS(andnot, bic, )
> -
> -#undef ATOMIC64_OPS
> -#undef ATOMIC64_FETCH_OP
> -#undef ATOMIC64_OP_RETURN
> -#undef ATOMIC64_OP
> -
> -static inline s64
> -__ll_sc_atomic64_dec_if_positive(atomic64_t *v)
> -{
> -	s64 result;
> -	unsigned long tmp;
> -
> -	asm volatile("// atomic64_dec_if_positive\n"
> -	__LL_SC_FALLBACK(
> -"	prfm	pstl1strm, %2\n"
> -"1:	ldxr	%0, %2\n"
> -"	subs	%0, %0, #1\n"
> -"	b.lt	2f\n"
> -"	stlxr	%w1, %0, %2\n"
> -"	cbnz	%w1, 1b\n"
> -"	dmb	ish\n"
> -"2:")
> -	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
> -	:
> -	: "cc", "memory");
> -
> -	return result;
> -}
> -
>   #define __CMPXCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl, constraint)	\
>   static inline u##sz							\
>   __ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
> @@ -350,4 +228,4 @@ __CMPXCHG_DBL(_mb, dmb ish, l, "memory")
>   #undef __CMPXCHG_DBL
>   #undef K
>   
> -#endif	/* __ASM_ATOMIC_LL_SC_H */
> \ No newline at end of file
> +#endif	/* __ASM_ARM_ARM64_ATOMIC_LL_SC_H */
> \ No newline at end of file
> 

Cheers,

-- 
Julien Grall

