Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFA2A94D7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 11:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20627.46638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kazOg-0000bo-7T; Fri, 06 Nov 2020 10:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20627.46638; Fri, 06 Nov 2020 10:55:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kazOg-0000bO-3l; Fri, 06 Nov 2020 10:55:10 +0000
Received: by outflank-mailman (input) for mailman id 20627;
 Fri, 06 Nov 2020 10:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kazOe-0000bI-L3
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:55:08 +0000
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06db3de-763b-44c8-b798-6e21abfabedf;
 Fri, 06 Nov 2020 10:55:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id h2so947403wmm.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 02:55:05 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id m20sm154250wrg.81.2020.11.06.02.55.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:55:02 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kazOe-0000bI-L3
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:55:08 +0000
X-Inumbo-ID: a06db3de-763b-44c8-b798-6e21abfabedf
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a06db3de-763b-44c8-b798-6e21abfabedf;
	Fri, 06 Nov 2020 10:55:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id h2so947403wmm.0
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 02:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3VZImL60NGG7RFdtXowdKLIl126llFB85n9FHuUleYg=;
        b=j9HkE8Wf1rHxLbWyroLJ7mwNbONvWlIA/cNM+qzZkVBs6OcUJDLrIHvcAKEa3WcH6f
         bWi7gd5oHU3D1/xqp1rQOGmLYZKwvZmRnOkmiK/eNMtrDtLjIqprz0dSIpRwv6RcIufR
         jxeOxe7NAas3YWyZJgam+3MwBnyZu8p+Ow2dcva+88AndRTDDNd0ZtWNBY72DNnxK+mD
         eKN1u51Jn/dLt4Tv6UAp73k+sjVq7jT1FyNfvaLYdEuqkSONRCmR8FvlKXDILm+VH8aq
         AhDOes26BVPyvsDDjfZ9TRgCSwiBeOiLhvDrunDkPL1lCW8Y35on8uIE44tZPuO90gk9
         oyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3VZImL60NGG7RFdtXowdKLIl126llFB85n9FHuUleYg=;
        b=Z3Tdv872CrTdXi2hkAwqQ44Q7x/iNgK4ULJRSoyNZ2bq8KoV3m3Lg7ZVK1a3+Fbm93
         rAEaroH1192N0Qj1L295HLNsr4So3N0vOBgTSuOdlkz9UTdJl93INXcetSC9M1K+fL+E
         5br0nRD5AJH6WYQwci6zLJRc46jzFjBJrfCIg0zcjpqvnzkb4zkjmJpYyrGZ1u2zaYbb
         fFcj4rjiY9/4yazh0d3WA9HMmhao1lP1aA84ML2Ins1pQEob3cMjt8lsjqYB8InmkuvR
         PMK5M3ssgx80TrfRlIcNAWMJSf4KEqYolvkKVWjdyimyYMITw/Xi9qWaJQ4lmtqvMJtV
         GpeA==
X-Gm-Message-State: AOAM532SH6PFehfU5O3Ckg4XcxjYtiEIOYYkvu+++NYlGAC4Ji9jQ42M
	4CvpqSDJ54CeMP4btCUfVLgDcGtg/vk=
X-Google-Smtp-Source: ABdhPJzPZ7T7F/WcSfK4wr3+0wn4srf8gI2opX+FQ2roS6wyPQJ/tB0hq+1sf7xAxHQDbqKNAJtkHQ==
X-Received: by 2002:a1c:cc01:: with SMTP id h1mr1904127wmb.114.1604660103774;
        Fri, 06 Nov 2020 02:55:03 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id m20sm154250wrg.81.2020.11.06.02.55.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 02:55:02 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	julien@xen.org,
	rahul.singh@arm.com
Subject: RE: [RFC PATCH 4/6] xen/arm64: Port Linux LL/SC and LSE atomics helpers to Xen
Date: Fri,  6 Nov 2020 10:55:01 +0000
Message-Id: <20201106105501.55396-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-5-ash.j.wilding@gmail.com>
References: <20201105185603.24149-5-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

In retrospect I should have put an intermediate patch between #3 and #4,
deleting the existing headers. This would have made the patch diff for
#4 and #5 much easier to read seeing as they are copying the Linux
versions wholesale into Xen.

I'll do that for V1 when we get there, but for now to aid in readability
I've pasted the complete header files below. While doing this I also
spent some time last night tidying up them up to be in line with the Xen
coding style.

Similar email incoming on patch #5 too.

Thanks,
Ash.


========================================================================
====             xen/include/asm-arm/arm64/atomic.h                 ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes:
 *      - Rename header include guard to reflect Xen directory structure
 *      - Drop redundant includes and redirect others to Xen equivalents
 *      - Rename declarations from arch_atomic_<op>() to atomic_<op>()
 *      - Drop atomic64_t helper declarations
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * Copyright (C) 1996 Russell King.
 * Copyright (C) 2002 Deep Blue Solutions Ltd.
 * Copyright (C) 2012 ARM Ltd.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#ifndef __ASM_ARM_ARM64_ATOMIC_H
#define __ASM_ARM_ARM64_ATOMIC_H

#include <xen/compiler.h>
#include <xen/types.h>

#include "lse.h"
#include "cmpxchg.h"

#define ATOMIC_OP(op)                               \
static inline void op(int i, atomic_t *v)           \
{                                                   \
    __lse_ll_sc_body(op, i, v);                     \
}

ATOMIC_OP(atomic_andnot)
ATOMIC_OP(atomic_or)
ATOMIC_OP(atomic_xor)
ATOMIC_OP(atomic_add)
ATOMIC_OP(atomic_and)
ATOMIC_OP(atomic_sub)

#undef ATOMIC_OP

#define ATOMIC_FETCH_OP(name, op)                   \
static inline int op##name(int i, atomic_t *v)      \
{                                                   \
    return __lse_ll_sc_body(op##name, i, v);        \
}

#define ATOMIC_FETCH_OPS(op)            \
    ATOMIC_FETCH_OP(_relaxed, op)       \
    ATOMIC_FETCH_OP(_acquire, op)       \
    ATOMIC_FETCH_OP(_release, op)       \
    ATOMIC_FETCH_OP(        , op)

ATOMIC_FETCH_OPS(atomic_fetch_andnot)
ATOMIC_FETCH_OPS(atomic_fetch_or)
ATOMIC_FETCH_OPS(atomic_fetch_xor)
ATOMIC_FETCH_OPS(atomic_fetch_add)
ATOMIC_FETCH_OPS(atomic_fetch_and)
ATOMIC_FETCH_OPS(atomic_fetch_sub)
ATOMIC_FETCH_OPS(atomic_add_return)
ATOMIC_FETCH_OPS(atomic_sub_return)

#undef ATOMIC_FETCH_OP
#undef ATOMIC_FETCH_OPS
#define atomic_read(v)              __READ_ONCE((v)->counter)
#define atomic_set(v, i)            __WRITE_ONCE(((v)->counter), (i))

#define atomic_add_return_relaxed       atomic_add_return_relaxed
#define atomic_add_return_acquire       atomic_add_return_acquire
#define atomic_add_return_release       atomic_add_return_release
#define atomic_add_return               atomic_add_return

#define atomic_sub_return_relaxed       atomic_sub_return_relaxed
#define atomic_sub_return_acquire       atomic_sub_return_acquire
#define atomic_sub_return_release       atomic_sub_return_release
#define atomic_sub_return               atomic_sub_return

#define atomic_fetch_add_relaxed        atomic_fetch_add_relaxed
#define atomic_fetch_add_acquire        atomic_fetch_add_acquire
#define atomic_fetch_add_release        atomic_fetch_add_release
#define atomic_fetch_add                atomic_fetch_add

#define atomic_fetch_sub_relaxed        atomic_fetch_sub_relaxed
#define atomic_fetch_sub_acquire        atomic_fetch_sub_acquire
#define atomic_fetch_sub_release        atomic_fetch_sub_release
#define atomic_fetch_sub                atomic_fetch_sub

#define atomic_fetch_and_relaxed        atomic_fetch_and_relaxed
#define atomic_fetch_and_acquire        atomic_fetch_and_acquire
#define atomic_fetch_and_release        atomic_fetch_and_release
#define atomic_fetch_and                atomic_fetch_and

#define atomic_fetch_andnot_relaxed     atomic_fetch_andnot_relaxed
#define atomic_fetch_andnot_acquire     atomic_fetch_andnot_acquire
#define atomic_fetch_andnot_release     atomic_fetch_andnot_release
#define atomic_fetch_andnot             atomic_fetch_andnot

#define atomic_fetch_or_relaxed         atomic_fetch_or_relaxed
#define atomic_fetch_or_acquire         atomic_fetch_or_acquire
#define atomic_fetch_or_release         atomic_fetch_or_release
#define atomic_fetch_or                 atomic_fetch_or

#define atomic_fetch_xor_relaxed        atomic_fetch_xor_relaxed
#define atomic_fetch_xor_acquire        atomic_fetch_xor_acquire
#define atomic_fetch_xor_release        atomic_fetch_xor_release
#define atomic_fetch_xor                atomic_fetch_xor

#define atomic_xchg_relaxed(v, new) \
    xchg_relaxed(&((v)->counter), (new))
#define atomic_xchg_acquire(v, new) \
    xchg_acquire(&((v)->counter), (new))
#define atomic_xchg_release(v, new) \
    xchg_release(&((v)->counter), (new))
#define atomic_xchg(v, new) \
    xchg(&((v)->counter), (new))

#define atomic_cmpxchg_relaxed(v, old, new) \
    cmpxchg_relaxed(&((v)->counter), (old), (new))
#define atomic_cmpxchg_acquire(v, old, new) \
    cmpxchg_acquire(&((v)->counter), (old), (new))
#define atomic_cmpxchg_release(v, old, new) \
    cmpxchg_release(&((v)->counter), (old), (new))

#define atomic_andnot            atomic_andnot

#endif /* __ASM_ARM_ARM64_ATOMIC_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */




========================================================================
====          xen/include/asm-arm/arm64/atomic_ll_sc.h              ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes:
 *      - Rename header include guard to reflect Xen directory structure
 *      - Redirect includes to Xen equivalents
 *      - Drop atomic64_t helper definitions
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * Copyright (C) 1996 Russell King.
 * Copyright (C) 2002 Deep Blue Solutions Ltd.
 * Copyright (C) 2012 ARM Ltd.
 * SPDX-License-Identifier: GPL-2.0-only
 */

#ifndef __ASM_ARM_ARM64_ATOMIC_LL_SC_H
#define __ASM_ARM_ARM64_ATOMIC_LL_SC_H

#include <xen/stringify.h>

#ifdef CONFIG_ARM64_LSE_ATOMICS
#define __LL_SC_FALLBACK(asm_ops)           \
"    b    3f\n"                             \
"    .subsection    1\n"                    \
"3:\n"                                      \
asm_ops "\n"                                \
"    b    4f\n"                             \
"    .previous\n"                           \
"4:\n"
#else
#define __LL_SC_FALLBACK(asm_ops) asm_ops
#endif

#ifndef CONFIG_CC_HAS_K_CONSTRAINT
#define K
#endif

/*
 * AArch64 UP and SMP safe atomic ops.  We use load exclusive and
 * store exclusive to ensure that these are atomic.  We may loop
 * to ensure that the update happens.
 */

#define ATOMIC_OP(op, asm_op, constraint)                               \
static inline void                                                      \
__ll_sc_atomic_##op(int i, atomic_t *v)                                 \
{                                                                       \
    unsigned long tmp;                                                  \
    int result;                                                         \
                                                                        \
    asm volatile("// atomic_" #op "\n"                                  \
    __LL_SC_FALLBACK(                                                   \
"    prfm    pstl1strm, %2\n"                                           \
"1:    ldxr    %w0, %2\n"                                               \
"    " #asm_op "    %w0, %w0, %w3\n"                                    \
"    stxr    %w1, %w0, %2\n"                                            \
"    cbnz    %w1, 1b\n")                                                \
    : "=&r" (result), "=&r" (tmp), "+Q" (v->counter)                    \
    : __stringify(constraint) "r" (i));                                 \
}

#define ATOMIC_OP_RETURN(name, mb, acq, rel, cl, op, asm_op, constraint)\
static inline int                                                       \
__ll_sc_atomic_##op##_return##name(int i, atomic_t *v)                  \
{                                                                       \
    unsigned long tmp;                                                  \
    int result;                                                         \
                                                                        \
    asm volatile("// atomic_" #op "_return" #name "\n"                  \
    __LL_SC_FALLBACK(                                                   \
"    prfm    pstl1strm, %2\n"                                           \
"1:    ld" #acq "xr    %w0, %2\n"                                       \
"    " #asm_op "    %w0, %w0, %w3\n"                                    \
"    st" #rel "xr    %w1, %w0, %2\n"                                    \
"    cbnz    %w1, 1b\n"                                                 \
"    " #mb )                                                            \
    : "=&r" (result), "=&r" (tmp), "+Q" (v->counter)                    \
    : __stringify(constraint) "r" (i)                                   \
    : cl);                                                              \
                                                                        \
    return result;                                                      \
}

#define ATOMIC_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint) \
static inline int                                                       \
__ll_sc_atomic_fetch_##op##name(int i, atomic_t *v)                     \
{                                                                       \
    unsigned long tmp;                                                  \
    int val, result;                                                    \
                                                                        \
    asm volatile("// atomic_fetch_" #op #name "\n"                      \
    __LL_SC_FALLBACK(                                                   \
"    prfm    pstl1strm, %3\n"                                           \
"1:    ld" #acq "xr    %w0, %3\n"                                       \
"    " #asm_op "    %w1, %w0, %w4\n"                                    \
"    st" #rel "xr    %w2, %w1, %3\n"                                    \
"    cbnz    %w2, 1b\n"                                                 \
"    " #mb )                                                            \
    : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter)       \
    : __stringify(constraint) "r" (i)                                   \
    : cl);                                                              \
                                                                        \
    return result;                                                      \
}

#define ATOMIC_OPS(...)                                                 \
    ATOMIC_OP(__VA_ARGS__)                                              \
    ATOMIC_OP_RETURN(        , dmb ish,  , l, "memory", __VA_ARGS__)    \
    ATOMIC_OP_RETURN(_relaxed,        ,  ,  ,         , __VA_ARGS__)    \
    ATOMIC_OP_RETURN(_acquire,        , a,  , "memory", __VA_ARGS__)    \
    ATOMIC_OP_RETURN(_release,        ,  , l, "memory", __VA_ARGS__)    \
    ATOMIC_FETCH_OP (        , dmb ish,  , l, "memory", __VA_ARGS__)    \
    ATOMIC_FETCH_OP (_relaxed,        ,  ,  ,         , __VA_ARGS__)    \
    ATOMIC_FETCH_OP (_acquire,        , a,  , "memory", __VA_ARGS__)    \
    ATOMIC_FETCH_OP (_release,        ,  , l, "memory", __VA_ARGS__)

ATOMIC_OPS(add, add, I)
ATOMIC_OPS(sub, sub, J)

#undef ATOMIC_OPS
#define ATOMIC_OPS(...)                                                 \
    ATOMIC_OP(__VA_ARGS__)                                              \
    ATOMIC_FETCH_OP (        , dmb ish,  , l, "memory", __VA_ARGS__)    \
    ATOMIC_FETCH_OP (_relaxed,        ,  ,  ,         , __VA_ARGS__)    \
    ATOMIC_FETCH_OP (_acquire,        , a,  , "memory", __VA_ARGS__)    \
    ATOMIC_FETCH_OP (_release,        ,  , l, "memory", __VA_ARGS__)

ATOMIC_OPS(and, and, K)
ATOMIC_OPS(or, orr, K)
ATOMIC_OPS(xor, eor, K)
/*
 * GAS converts the mysterious and undocumented BIC (immediate) alias to
 * an AND (immediate) instruction with the immediate inverted. We don't
 * have a constraint for this, so fall back to register.
 */
ATOMIC_OPS(andnot, bic, )

#undef ATOMIC_OPS
#undef ATOMIC_FETCH_OP
#undef ATOMIC_OP_RETURN
#undef ATOMIC_OP

#define __CMPXCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl, constraint)  \
static inline u##sz                                                     \
__ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,                    \
                     unsigned long old,                                 \
                     u##sz new)                                         \
{                                                                       \
    unsigned long tmp;                                                  \
    u##sz oldval;                                                       \
                                                                        \
    /*                                                                  \
     * Sub-word sizes require explicit casting so that the compare      \
     * part of the cmpxchg doesn't end up interpreting non-zero         \
     * upper bits of the register containing "old".                     \
     */                                                                 \
    if (sz < 32)                                                        \
        old = (u##sz)old;                                               \
                                                                        \
    asm volatile(                                                       \
    __LL_SC_FALLBACK(                                                   \
    "    prfm    pstl1strm, %[v]\n"                                     \
    "1:    ld" #acq "xr" #sfx "\t%" #w "[oldval], %[v]\n"               \
    "    eor    %" #w "[tmp], %" #w "[oldval], %" #w "[old]\n"          \
    "    cbnz    %" #w "[tmp], 2f\n"                                    \
    "    st" #rel "xr" #sfx "\t%w[tmp], %" #w "[new], %[v]\n"           \
    "    cbnz    %w[tmp], 1b\n"                                         \
    "    " #mb "\n"                                                     \
    "2:")                                                               \
    : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval),                       \
      [v] "+Q" (*(u##sz *)ptr)                                          \
    : [old] __stringify(constraint) "r" (old), [new] "r" (new)          \
    : cl);                                                              \
                                                                        \
    return oldval;                                                      \
}

/*
 * Earlier versions of GCC (no later than 8.1.0) appear to incorrectly
 * handle the 'K' constraint for the value 4294967295 - thus we use no
 * constraint for 32 bit operations.
 */
__CMPXCHG_CASE(w, b,     ,  8,        ,  ,  ,         , K)
__CMPXCHG_CASE(w, h,     , 16,        ,  ,  ,         , K)
__CMPXCHG_CASE(w,  ,     , 32,        ,  ,  ,         , K)
__CMPXCHG_CASE( ,  ,     , 64,        ,  ,  ,         , L)
__CMPXCHG_CASE(w, b, acq_,  8,        , a,  , "memory", K)
__CMPXCHG_CASE(w, h, acq_, 16,        , a,  , "memory", K)
__CMPXCHG_CASE(w,  , acq_, 32,        , a,  , "memory", K)
__CMPXCHG_CASE( ,  , acq_, 64,        , a,  , "memory", L)
__CMPXCHG_CASE(w, b, rel_,  8,        ,  , l, "memory", K)
__CMPXCHG_CASE(w, h, rel_, 16,        ,  , l, "memory", K)
__CMPXCHG_CASE(w,  , rel_, 32,        ,  , l, "memory", K)
__CMPXCHG_CASE( ,  , rel_, 64,        ,  , l, "memory", L)
__CMPXCHG_CASE(w, b,  mb_,  8, dmb ish,  , l, "memory", K)
__CMPXCHG_CASE(w, h,  mb_, 16, dmb ish,  , l, "memory", K)
__CMPXCHG_CASE(w,  ,  mb_, 32, dmb ish,  , l, "memory", K)
__CMPXCHG_CASE( ,  ,  mb_, 64, dmb ish,  , l, "memory", L)

#undef __CMPXCHG_CASE

#define __CMPXCHG_DBL(name, mb, rel, cl)                                \
static inline long                                                      \
__ll_sc__cmpxchg_double##name(unsigned long old1,                       \
                      unsigned long old2,                               \
                      unsigned long new1,                               \
                      unsigned long new2,                               \
                      volatile void *ptr)                               \
{                                                                       \
    unsigned long tmp, ret;                                             \
                                                                        \
    asm volatile("// __cmpxchg_double" #name "\n"                       \
    __LL_SC_FALLBACK(                                                   \
    "    prfm    pstl1strm, %2\n"                                       \
    "1:    ldxp    %0, %1, %2\n"                                        \
    "    eor    %0, %0, %3\n"                                           \
    "    eor    %1, %1, %4\n"                                           \
    "    orr    %1, %0, %1\n"                                           \
    "    cbnz    %1, 2f\n"                                              \
    "    st" #rel "xp    %w0, %5, %6, %2\n"                             \
    "    cbnz    %w0, 1b\n"                                             \
    "    " #mb "\n"                                                     \
    "2:")                                                               \
    : "=&r" (tmp), "=&r" (ret), "+Q" (*(unsigned long *)ptr)            \
    : "r" (old1), "r" (old2), "r" (new1), "r" (new2)                    \
    : cl);                                                              \
                                                                        \
    return ret;                                                         \
}

__CMPXCHG_DBL(   ,        ,  ,         )
__CMPXCHG_DBL(_mb, dmb ish, l, "memory")

#undef __CMPXCHG_DBL
#undef K

#endif    /* __ASM_ARM_ARM64_ATOMIC_LL_SC_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */




========================================================================
====           xen/include/asm-arm/arm64/atomic_lse.h               ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes:
 *      - Rename header include guard to reflect Xen directory structure
 *      - Drop atomic64_t helper definitions
 *      - Switch __always_inline qualifier to always_inline
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * Copyright (C) 1996 Russell King.
 * Copyright (C) 2002 Deep Blue Solutions Ltd.
 * Copyright (C) 2012 ARM Ltd.
 * SPDX-License-Identifier: GPL-2.0-only
 */

#ifndef __ASM_ARM_ARM64_ATOMIC_LSE_H
#define __ASM_ARM_ARM64_ATOMIC_LSE_H

#define ATOMIC_OP(op, asm_op)                                           \
static inline void __lse_atomic_##op(int i, atomic_t *v)                \
{                                                                       \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
"    " #asm_op "    %w[i], %[v]\n"                                      \
    : [i] "+r" (i), [v] "+Q" (v->counter)                               \
    : "r" (v));                                                         \
}

ATOMIC_OP(andnot, stclr)
ATOMIC_OP(or, stset)
ATOMIC_OP(xor, steor)
ATOMIC_OP(add, stadd)

#undef ATOMIC_OP

#define ATOMIC_FETCH_OP(name, mb, op, asm_op, cl...)                    \
static inline int __lse_atomic_fetch_##op##name(int i, atomic_t *v)     \
{                                                                       \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
"    " #asm_op #mb "    %w[i], %w[i], %[v]"                             \
    : [i] "+r" (i), [v] "+Q" (v->counter)                               \
    : "r" (v)                                                           \
    : cl);                                                              \
                                                                        \
    return i;                                                           \
}

#define ATOMIC_FETCH_OPS(op, asm_op)                                    \
    ATOMIC_FETCH_OP(_relaxed,   , op, asm_op)                           \
    ATOMIC_FETCH_OP(_acquire,  a, op, asm_op, "memory")                 \
    ATOMIC_FETCH_OP(_release,  l, op, asm_op, "memory")                 \
    ATOMIC_FETCH_OP(        , al, op, asm_op, "memory")

ATOMIC_FETCH_OPS(andnot, ldclr)
ATOMIC_FETCH_OPS(or, ldset)
ATOMIC_FETCH_OPS(xor, ldeor)
ATOMIC_FETCH_OPS(add, ldadd)

#undef ATOMIC_FETCH_OP
#undef ATOMIC_FETCH_OPS

#define ATOMIC_OP_ADD_RETURN(name, mb, cl...)                           \
static inline int __lse_atomic_add_return##name(int i, atomic_t *v)     \
{                                                                       \
    u32 tmp;                                                            \
                                                                        \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
    "    ldadd" #mb "    %w[i], %w[tmp], %[v]\n"                        \
    "    add    %w[i], %w[i], %w[tmp]"                                  \
    : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)            \
    : "r" (v)                                                           \
    : cl);                                                              \
                                                                        \
    return i;                                                           \
}

ATOMIC_OP_ADD_RETURN(_relaxed,   )
ATOMIC_OP_ADD_RETURN(_acquire,  a, "memory")
ATOMIC_OP_ADD_RETURN(_release,  l, "memory")
ATOMIC_OP_ADD_RETURN(        , al, "memory")

#undef ATOMIC_OP_ADD_RETURN

static inline void __lse_atomic_and(int i, atomic_t *v)
{
    asm volatile(
    __LSE_PREAMBLE
    "    mvn    %w[i], %w[i]\n"
    "    stclr    %w[i], %[v]"
    : [i] "+&r" (i), [v] "+Q" (v->counter)
    : "r" (v));
}

#define ATOMIC_FETCH_OP_AND(name, mb, cl...)                            \
static inline int __lse_atomic_fetch_and##name(int i, atomic_t *v)      \
{                                                                       \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
    "    mvn    %w[i], %w[i]\n"                                         \
    "    ldclr" #mb "    %w[i], %w[i], %[v]"                            \
    : [i] "+&r" (i), [v] "+Q" (v->counter)                              \
    : "r" (v)                                                           \
    : cl);                                                              \
                                                                        \
    return i;                                                           \
}

ATOMIC_FETCH_OP_AND(_relaxed,   )
ATOMIC_FETCH_OP_AND(_acquire,  a, "memory")
ATOMIC_FETCH_OP_AND(_release,  l, "memory")
ATOMIC_FETCH_OP_AND(        , al, "memory")

#undef ATOMIC_FETCH_OP_AND

static inline void __lse_atomic_sub(int i, atomic_t *v)
{
    asm volatile(
    __LSE_PREAMBLE
    "    neg    %w[i], %w[i]\n"
    "    stadd    %w[i], %[v]"
    : [i] "+&r" (i), [v] "+Q" (v->counter)
    : "r" (v));
}

#define ATOMIC_OP_SUB_RETURN(name, mb, cl...)                           \
static inline int __lse_atomic_sub_return##name(int i, atomic_t *v)     \
{                                                                       \
    u32 tmp;                                                            \
                                                                        \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
    "    neg    %w[i], %w[i]\n"                                         \
    "    ldadd" #mb "    %w[i], %w[tmp], %[v]\n"                        \
    "    add    %w[i], %w[i], %w[tmp]"                                  \
    : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)           \
    : "r" (v)                                                           \
    : cl);                                                              \
                                                                        \
    return i;                                                           \
}

ATOMIC_OP_SUB_RETURN(_relaxed,   )
ATOMIC_OP_SUB_RETURN(_acquire,  a, "memory")
ATOMIC_OP_SUB_RETURN(_release,  l, "memory")
ATOMIC_OP_SUB_RETURN(        , al, "memory")

#undef ATOMIC_OP_SUB_RETURN

#define ATOMIC_FETCH_OP_SUB(name, mb, cl...)                            \
static inline int __lse_atomic_fetch_sub##name(int i, atomic_t *v)      \
{                                                                       \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
    "    neg    %w[i], %w[i]\n"                                         \
    "    ldadd" #mb "    %w[i], %w[i], %[v]"                            \
    : [i] "+&r" (i), [v] "+Q" (v->counter)                              \
    : "r" (v)                                                           \
    : cl);                                                              \
                                                                        \
    return i;                                                           \
}

ATOMIC_FETCH_OP_SUB(_relaxed,   )
ATOMIC_FETCH_OP_SUB(_acquire,  a, "memory")
ATOMIC_FETCH_OP_SUB(_release,  l, "memory")
ATOMIC_FETCH_OP_SUB(        , al, "memory")

#undef ATOMIC_FETCH_OP_SUB

#define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)                     \
static always_inline u##sz                                              \
__lse__cmpxchg_case_##name##sz(volatile void *ptr,                      \
                          u##sz old,                                    \
                          u##sz new)                                    \
{                                                                       \
    register unsigned long x0 asm ("x0") = (unsigned long)ptr;          \
    register u##sz x1 asm ("x1") = old;                                 \
    register u##sz x2 asm ("x2") = new;                                 \
    unsigned long tmp;                                                  \
                                                                        \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
    "    mov    %" #w "[tmp], %" #w "[old]\n"                           \
    "    cas" #mb #sfx "\t%" #w "[tmp], %" #w "[new], %[v]\n"           \
    "    mov    %" #w "[ret], %" #w "[tmp]"                             \
    : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr),                \
      [tmp] "=&r" (tmp)                                                 \
    : [old] "r" (x1), [new] "r" (x2)                                    \
    : cl);                                                              \
                                                                        \
    return x0;                                                          \
}

__CMPXCHG_CASE(w, b,     ,  8,   )
__CMPXCHG_CASE(w, h,     , 16,   )
__CMPXCHG_CASE(w,  ,     , 32,   )
__CMPXCHG_CASE(x,  ,     , 64,   )
__CMPXCHG_CASE(w, b, acq_,  8,  a, "memory")
__CMPXCHG_CASE(w, h, acq_, 16,  a, "memory")
__CMPXCHG_CASE(w,  , acq_, 32,  a, "memory")
__CMPXCHG_CASE(x,  , acq_, 64,  a, "memory")
__CMPXCHG_CASE(w, b, rel_,  8,  l, "memory")
__CMPXCHG_CASE(w, h, rel_, 16,  l, "memory")
__CMPXCHG_CASE(w,  , rel_, 32,  l, "memory")
__CMPXCHG_CASE(x,  , rel_, 64,  l, "memory")
__CMPXCHG_CASE(w, b,  mb_,  8, al, "memory")
__CMPXCHG_CASE(w, h,  mb_, 16, al, "memory")
__CMPXCHG_CASE(w,  ,  mb_, 32, al, "memory")
__CMPXCHG_CASE(x,  ,  mb_, 64, al, "memory")

#undef __CMPXCHG_CASE

#define __CMPXCHG_DBL(name, mb, cl...)                                  \
static always_inline long                                               \
__lse__cmpxchg_double##name(unsigned long old1,                         \
                     unsigned long old2,                                \
                     unsigned long new1,                                \
                     unsigned long new2,                                \
                     volatile void *ptr)                                \
{                                                                       \
    unsigned long oldval1 = old1;                                       \
    unsigned long oldval2 = old2;                                       \
    register unsigned long x0 asm ("x0") = old1;                        \
    register unsigned long x1 asm ("x1") = old2;                        \
    register unsigned long x2 asm ("x2") = new1;                        \
    register unsigned long x3 asm ("x3") = new2;                        \
    register unsigned long x4 asm ("x4") = (unsigned long)ptr;          \
                                                                        \
    asm volatile(                                                       \
    __LSE_PREAMBLE                                                      \
    "    casp" #mb "\t%[old1], %[old2], %[new1], %[new2], %[v]\n"       \
    "    eor    %[old1], %[old1], %[oldval1]\n"                         \
    "    eor    %[old2], %[old2], %[oldval2]\n"                         \
    "    orr    %[old1], %[old1], %[old2]"                              \
    : [old1] "+&r" (x0), [old2] "+&r" (x1),                             \
      [v] "+Q" (*(unsigned long *)ptr)                                  \
    : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4),                 \
      [oldval1] "r" (oldval1), [oldval2] "r" (oldval2)                  \
    : cl);                                                              \
                                                                        \
    return x0;                                                          \
}

__CMPXCHG_DBL(   ,   )
__CMPXCHG_DBL(_mb, al, "memory")

#undef __CMPXCHG_DBL

#endif    /* __ASM_ARM_ARM64_ATOMIC_LSE_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */




========================================================================
====             xen/include/asm-arm/arm64/cmpxchg.h                ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes:
 *      - Rename header include guard to reflect Xen directory structure
 *      - Drop redundant includes and redirect others to Xen equivalents
 *      - Rename definitions from arch_xchg_<qual>() to xchg_<qual>()
 *      - Switch __always_inline qualifier to always_inline
 *      - Switch usage of BUILD_BUG() to returning __bad_cmpxchg()
 *      - Pull in original Xen arm64 cmpxchg.h definitions of
 *           cmpxchg_timeout*() and cmpxchg64_timeout*() as these are not
 *           provided by Linux and are required for Xen's guest atomics
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * Copyright (C) 2012 ARM Ltd.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#ifndef __ASM_ARM_ARM64_CMPXCHG_H
#define __ASM_ARM_ARM64_CMPXCHG_H

#include <asm/bug.h>
#include "lse.h"

extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);

/*
 * We need separate acquire parameters for ll/sc and lse, since the full
 * barrier case is generated as release+dmb for the former and
 * acquire+release for the latter.
 */
#define __XCHG_CASE(w, sfx, name, sz, mb, nop_lse, acq, acq_lse, rel, cl)   \
static inline u##sz __xchg_case_##name##sz(u##sz x, volatile void *ptr)     \
{                                                                           \
    u##sz ret;                                                              \
    unsigned long tmp;                                                      \
                                                                            \
    asm volatile(ARM64_LSE_ATOMIC_INSN(                                     \
    /* LL/SC */                                                             \
    "    prfm    pstl1strm, %2\n"                                           \
    "1:    ld" #acq "xr" #sfx "\t%" #w "0, %2\n"                            \
    "    st" #rel "xr" #sfx "\t%w1, %" #w "3, %2\n"                         \
    "    cbnz    %w1, 1b\n"                                                 \
    "    " #mb,                                                             \
    /* LSE atomics */                                                       \
    "    swp" #acq_lse #rel #sfx "\t%" #w "3, %" #w "0, %2\n"               \
        "nop\n"                                                             \
        "nop\n"                                                             \
        "nop\n"                                                             \
    "    " #nop_lse)                                                        \
    : "=&r" (ret), "=&r" (tmp), "+Q" (*(u##sz *)ptr)                        \
    : "r" (x)                                                               \
    : cl);                                                                  \
                                                                            \
    return ret;                                                             \
}

__XCHG_CASE(w, b,     ,  8,        ,    ,  ,  ,  ,         )
__XCHG_CASE(w, h,     , 16,        ,    ,  ,  ,  ,         )
__XCHG_CASE(w,  ,     , 32,        ,    ,  ,  ,  ,         )
__XCHG_CASE( ,  ,     , 64,        ,    ,  ,  ,  ,         )
__XCHG_CASE(w, b, acq_,  8,        ,    , a, a,  , "memory")
__XCHG_CASE(w, h, acq_, 16,        ,    , a, a,  , "memory")
__XCHG_CASE(w,  , acq_, 32,        ,    , a, a,  , "memory")
__XCHG_CASE( ,  , acq_, 64,        ,    , a, a,  , "memory")
__XCHG_CASE(w, b, rel_,  8,        ,    ,  ,  , l, "memory")
__XCHG_CASE(w, h, rel_, 16,        ,    ,  ,  , l, "memory")
__XCHG_CASE(w,  , rel_, 32,        ,    ,  ,  , l, "memory")
__XCHG_CASE( ,  , rel_, 64,        ,    ,  ,  , l, "memory")
__XCHG_CASE(w, b,  mb_,  8, dmb ish, nop,  , a, l, "memory")
__XCHG_CASE(w, h,  mb_, 16, dmb ish, nop,  , a, l, "memory")
__XCHG_CASE(w,  ,  mb_, 32, dmb ish, nop,  , a, l, "memory")
__XCHG_CASE( ,  ,  mb_, 64, dmb ish, nop,  , a, l, "memory")

#undef __XCHG_CASE

#define __XCHG_GEN(sfx)                                                 \
static always_inline  unsigned long __xchg##sfx(unsigned long x,        \
                    volatile void *ptr,                                 \
                    int size)                                           \
{                                                                       \
    switch (size) {                                                     \
    case 1:                                                             \
        return __xchg_case##sfx##_8(x, ptr);                            \
    case 2:                                                             \
        return __xchg_case##sfx##_16(x, ptr);                           \
    case 4:                                                             \
        return __xchg_case##sfx##_32(x, ptr);                           \
    case 8:                                                             \
        return __xchg_case##sfx##_64(x, ptr);                           \
    default:                                                            \
        return __bad_cmpxchg(ptr, size);                                \
    }                                                                   \
                                                                        \
    unreachable();                                                      \
}

__XCHG_GEN()
__XCHG_GEN(_acq)
__XCHG_GEN(_rel)
__XCHG_GEN(_mb)

#undef __XCHG_GEN

#define __xchg_wrapper(sfx, ptr, x)                                     \
({                                                                      \
    __typeof__(*(ptr)) __ret;                                           \
    __ret = (__typeof__(*(ptr)))                                        \
        __xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr)));         \
    __ret;                                                              \
})

/* xchg */
#define xchg_relaxed(...)    __xchg_wrapper(    , __VA_ARGS__)
#define xchg_acquire(...)    __xchg_wrapper(_acq, __VA_ARGS__)
#define xchg_release(...)    __xchg_wrapper(_rel, __VA_ARGS__)
#define xchg(...)        __xchg_wrapper( _mb, __VA_ARGS__)

#define __CMPXCHG_CASE(name, sz)                                        \
static inline u##sz __cmpxchg_case_##name##sz(volatile void *ptr,       \
                          u##sz old,                                    \
                          u##sz new)                                    \
{                                                                       \
    return __lse_ll_sc_body(_cmpxchg_case_##name##sz,                   \
                ptr, old, new);                                         \
}

__CMPXCHG_CASE(    ,  8)
__CMPXCHG_CASE(    , 16)
__CMPXCHG_CASE(    , 32)
__CMPXCHG_CASE(    , 64)
__CMPXCHG_CASE(acq_,  8)
__CMPXCHG_CASE(acq_, 16)
__CMPXCHG_CASE(acq_, 32)
__CMPXCHG_CASE(acq_, 64)
__CMPXCHG_CASE(rel_,  8)
__CMPXCHG_CASE(rel_, 16)
__CMPXCHG_CASE(rel_, 32)
__CMPXCHG_CASE(rel_, 64)
__CMPXCHG_CASE(mb_,  8)
__CMPXCHG_CASE(mb_, 16)
__CMPXCHG_CASE(mb_, 32)
__CMPXCHG_CASE(mb_, 64)

#undef __CMPXCHG_CASE

#define __CMPXCHG_DBL(name)                                             \
static inline long __cmpxchg_double##name(unsigned long old1,           \
                     unsigned long old2,                                \
                     unsigned long new1,                                \
                     unsigned long new2,                                \
                     volatile void *ptr)                                \
{                                                                       \
    return __lse_ll_sc_body(_cmpxchg_double##name,                      \
                old1, old2, new1, new2, ptr);                           \
}

__CMPXCHG_DBL(   )
__CMPXCHG_DBL(_mb)

#undef __CMPXCHG_DBL

#define __CMPXCHG_GEN(sfx)                                              \
static always_inline unsigned long __cmpxchg##sfx(volatile void *ptr,   \
                       unsigned long old,                               \
                       unsigned long new,                               \
                       int size)                                        \
{                                                                       \
    switch (size) {                                                     \
    case 1:                                                             \
        return __cmpxchg_case##sfx##_8(ptr, old, new);                  \
    case 2:                                                             \
        return __cmpxchg_case##sfx##_16(ptr, old, new);                 \
    case 4:                                                             \
        return __cmpxchg_case##sfx##_32(ptr, old, new);                 \
    case 8:                                                             \
        return __cmpxchg_case##sfx##_64(ptr, old, new);                 \
    default:                                                            \
        return __bad_cmpxchg(ptr, size);                                \
    }                                                                   \
                                                                        \
    unreachable();                                                      \
}

__CMPXCHG_GEN()
__CMPXCHG_GEN(_acq)
__CMPXCHG_GEN(_rel)
__CMPXCHG_GEN(_mb)

#undef __CMPXCHG_GEN

#define __cmpxchg_wrapper(sfx, ptr, o, n)                               \
({                                                                      \
    __typeof__(*(ptr)) __ret;                                           \
    __ret = (__typeof__(*(ptr)))                                        \
        __cmpxchg##sfx((ptr), (unsigned long)(o),                       \
                (unsigned long)(n), sizeof(*(ptr)));                    \
    __ret;                                                              \
})

/* cmpxchg */
#define cmpxchg_relaxed(...)    __cmpxchg_wrapper(    , __VA_ARGS__)
#define cmpxchg_acquire(...)    __cmpxchg_wrapper(_acq, __VA_ARGS__)
#define cmpxchg_release(...)    __cmpxchg_wrapper(_rel, __VA_ARGS__)
#define cmpxchg(...)        __cmpxchg_wrapper( _mb, __VA_ARGS__)
#define cmpxchg_local        cmpxchg_relaxed

/* cmpxchg64 */
#define cmpxchg64_relaxed        cmpxchg_relaxed
#define cmpxchg64_acquire        cmpxchg_acquire
#define cmpxchg64_release        cmpxchg_release
#define cmpxchg64            cmpxchg
#define cmpxchg64_local        cmpxchg_local

/* cmpxchg_double */
#define system_has_cmpxchg_double()     1

#define __cmpxchg_double_check(ptr1, ptr2)                              \
({                                                                      \
    if (sizeof(*(ptr1)) != 8)                                           \
        return __bad_cmpxchg(ptr, size);                                \
    VM_BUG_ON((unsigned long *)(ptr2) - (unsigned long *)(ptr1) != 1);  \
})

#define cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)                          \
({                                                                          \
    int __ret;                                                              \
    __cmpxchg_double_check(ptr1, ptr2);                                     \
    __ret = !__cmpxchg_double_mb((unsigned long)(o1), (unsigned long)(o2),  \
                     (unsigned long)(n1), (unsigned long)(n2),              \
                     ptr1);                                                 \
    __ret;                                                                  \
})

#define cmpxchg_double_local(ptr1, ptr2, o1, o2, n1, n2)                    \
({                                                                          \
    int __ret;                                                              \
    __cmpxchg_double_check(ptr1, ptr2);                                     \
    __ret = !__cmpxchg_double((unsigned long)(o1), (unsigned long)(o2),     \
                  (unsigned long)(n1), (unsigned long)(n2),                 \
                  ptr1);                                                    \
    __ret;                                                                  \
})

#define __CMPWAIT_CASE(w, sfx, sz)                                      \
static inline void __cmpwait_case_##sz(volatile void *ptr,              \
                       unsigned long val)                               \
{                                                                       \
    unsigned long tmp;                                                  \
                                                                        \
    asm volatile(                                                       \
    "    sevl\n"                                                        \
    "    wfe\n"                                                         \
    "    ldxr" #sfx "\t%" #w "[tmp], %[v]\n"                            \
    "    eor    %" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"             \
    "    cbnz    %" #w "[tmp], 1f\n"                                    \
    "    wfe\n"                                                         \
    "1:"                                                                \
    : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr)               \
    : [val] "r" (val));                                                 \
}

__CMPWAIT_CASE(w, b, 8);
__CMPWAIT_CASE(w, h, 16);
__CMPWAIT_CASE(w,  , 32);
__CMPWAIT_CASE( ,  , 64);

#undef __CMPWAIT_CASE

#define __CMPWAIT_GEN(sfx)                                              \
static always_inline void __cmpwait##sfx(volatile void *ptr,            \
                  unsigned long val,                                    \
                  int size)                                             \
{                                                                       \
    switch (size) {                                                     \
    case 1:                                                             \
        return __cmpwait_case##sfx##_8(ptr, (u8)val);                   \
    case 2:                                                             \
        return __cmpwait_case##sfx##_16(ptr, (u16)val);                 \
    case 4:                                                             \
        return __cmpwait_case##sfx##_32(ptr, val);                      \
    case 8:                                                             \
        return __cmpwait_case##sfx##_64(ptr, val);                      \
    default:                                                            \
        __bad_cmpxchg(ptr, size);                                       \
    }                                                                   \
                                                                        \
    unreachable();                                                      \
}

__CMPWAIT_GEN()

#undef __CMPWAIT_GEN

#define __cmpwait_relaxed(ptr, val) \
    __cmpwait((ptr), (unsigned long)(val), sizeof(*(ptr)))

/*
 * This code is from the original Xen arm32 cmpxchg.h, from before the
 * Linux 5.10-rc2 atomics helpers were ported over. The only changes
 * here are renaming the macros and functions to explicitly use
 * "timeout" in their names so that they don't clash with the above.
 *
 * We need this here for guest atomics (the only user of the timeout
 * variants).
 */

#define __CMPXCHG_TIMEOUT_CASE(w, sz, name)                             \
static inline bool __cmpxchg_timeout_case_##name(volatile void *ptr,    \
                                         unsigned long *old,            \
                                         unsigned long new,             \
                                         bool timeout,                  \
                                         unsigned int max_try)          \
{                                                                       \
        unsigned long oldval;                                           \
        unsigned long res;                                              \
                                                                        \
        do {                                                            \
                asm volatile("// __cmpxchg_timeout_case_" #name "\n"    \
                "       ldxr" #sz "     %" #w "1, %2\n"                 \
                "       mov     %w0, #0\n"                              \
                "       cmp     %" #w "1, %" #w "3\n"                   \
                "       b.ne    1f\n"                                   \
                "       stxr" #sz "     %w0, %" #w "4, %2\n"            \
                "1:\n"                                                  \
                : "=&r" (res), "=&r" (oldval),                          \
                  "+Q" (*(unsigned long *)ptr)                          \
                : "Ir" (*old), "r" (new)                                \
                : "cc");                                                \
                                                                        \
                if (!res)                                               \
                        break;                                          \
        } while (!timeout || ((--max_try) > 0));                        \
                                                                        \
        *old = oldval;                                                  \
                                                                        \
        return !res;                                                    \
}

__CMPXCHG_TIMEOUT_CASE(w, b, 1)
__CMPXCHG_TIMEOUT_CASE(w, h, 2)
__CMPXCHG_TIMEOUT_CASE(w,  , 4)
__CMPXCHG_TIMEOUT_CASE( ,  , 8)

static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
                                        unsigned long new, int size,
                                        bool timeout, unsigned int max_try)
{
        switch (size) {
        case 1:
                return __cmpxchg_timeout_case_1(ptr, old, new, timeout, max_try);
        case 2:
                return __cmpxchg_timeout_case_2(ptr, old, new, timeout, max_try);
        case 4:
                return __cmpxchg_timeout_case_4(ptr, old, new, timeout, max_try);
        case 8:
                return __cmpxchg_timeout_case_8(ptr, old, new, timeout, max_try);
        default:
                return __bad_cmpxchg(ptr, size);
        }

        ASSERT_UNREACHABLE();
}

/*
 * The helper may fail to update the memory if the action takes too long.
 *
 * @old: On call the value pointed contains the expected old value. It will be
 * updated to the actual old value.
 * @max_try: Maximum number of iterations
 *
 * The helper will return true when the update has succeeded (i.e no
 * timeout) and false if the update has failed.
 */
static always_inline bool __cmpxchg_timeout(volatile void *ptr,
                                            unsigned long *old,
                                            unsigned long new,
                                            int size,
                                            unsigned int max_try)
{
        bool ret;

        smp_mb();
        ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
        smp_mb();

        return ret;
}

#define __cmpxchg64_timeout(ptr, old, new, max_try)     \
        __cmpxchg_timeout(ptr, old, new, 8, max_try)


#endif    /* __ASM_ARM_ARM64_CMPXCHG_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */




========================================================================
====               xen/include/asm-arm/arm64/lse.h                  ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes:
 *      - Rename header include guard to reflect Xen directory structure
 *      - Drop redundant includes and redirect others to Xen equivalents
 *      - Modify hwcap check to use cpus_have_cap()
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __ASM_ARM_ARM64_LSE_H
#define __ASM_ARM_ARM64_LSE_H

#include "atomic_ll_sc.h"

#ifdef CONFIG_ARM64_LSE_ATOMICS

#define __LSE_PREAMBLE    ".arch_extension lse\n"

#include <xen/compiler.h>
#include <xen/stringify.h>
#include <xen/types.h>

#include <asm/alternative.h>

#include "atomic_lse.h"

static inline bool system_uses_lse_atomics(void)
{
    return cpus_have_cap(ARM64_HAS_LSE_ATOMICS);
}

#define __lse_ll_sc_body(op, ...)           \
({                                          \
    system_uses_lse_atomics() ?             \
        __lse_##op(__VA_ARGS__) :           \
        __ll_sc_##op(__VA_ARGS__);          \
})

/* In-line patching at runtime */
#define ARM64_LSE_ATOMIC_INSN(llsc, lse)    \
    ALTERNATIVE(llsc, __LSE_PREAMBLE lse, ARM64_HAS_LSE_ATOMICS)

#else    /* CONFIG_ARM64_LSE_ATOMICS */

static inline bool system_uses_lse_atomics(void) { return false; }

#define __lse_ll_sc_body(op, ...)        __ll_sc_##op(__VA_ARGS__)

#define ARM64_LSE_ATOMIC_INSN(llsc, lse)    llsc

#endif    /* CONFIG_ARM64_LSE_ATOMICS */
#endif    /* __ASM_ARM_ARM64_LSE_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */








