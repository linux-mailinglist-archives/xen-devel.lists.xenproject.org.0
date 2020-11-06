Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540C2A94D6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 11:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20628.46650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kazOr-0000ek-KU; Fri, 06 Nov 2020 10:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20628.46650; Fri, 06 Nov 2020 10:55:21 +0000
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
	id 1kazOr-0000eJ-HD; Fri, 06 Nov 2020 10:55:21 +0000
Received: by outflank-mailman (input) for mailman id 20628;
 Fri, 06 Nov 2020 10:55:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kazOp-0000dq-Bi
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:55:19 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce82ceec-ef34-4690-bb20-7adb824aad3c;
 Fri, 06 Nov 2020 10:55:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n15so858676wrq.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 02:55:17 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id o7sm1645835wrp.23.2020.11.06.02.55.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:55:15 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kazOp-0000dq-Bi
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 10:55:19 +0000
X-Inumbo-ID: ce82ceec-ef34-4690-bb20-7adb824aad3c
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ce82ceec-ef34-4690-bb20-7adb824aad3c;
	Fri, 06 Nov 2020 10:55:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n15so858676wrq.2
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 02:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZJX2HXtknH9a8H0jD07Jiilcan+PIwNNe10FvbbF2Y=;
        b=OmsE7xQG76TJID1gtWTa+p9QFbUIZOqRZKIKeSHJqwtgPk0xVGSuhnjlJQmLvKK84X
         bplv1sVaa7URAbZkXDwTs+aOw/xfINcYNvzv0wGOJdJ/61Gfk8+hLJj40nHpNUs4C7gB
         HHa6CvkK7BK+MzQK4VYB+VBYi5rp0VO4+vHrTBl8w1NRd/898h9OU2bgJQDSO6fzTdsh
         QvAopmQvzY+o3ncMK7AYRT0Ns1BnXVCBbG9zo63eBpOvVtxAnng18WYoS85BNfe6587x
         5GTQwaS4lO1AMgIAG2UP0tqcFCEmw1T6QCYMjT1MklDpPjFO2uMj7PT7Z9TEGD7gB5wp
         2Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZJX2HXtknH9a8H0jD07Jiilcan+PIwNNe10FvbbF2Y=;
        b=ZSqyYpfGKZSdT8kkLKuZGrThXOamLl69GLOP9oS4LemD83Z2xJiOTyRzvMX6nEnG2v
         P8LsA/M+zGhrfRQtq8hZyf9a3HCH+vpcscd+i8SaFS6jeaS2FkQyEuprJkLcLoAt220n
         vgVKKlLbPovfo/2m3NDqz+PyBpTzDZ15WZb2qOwhZ2QFXtJu8rybhoKSw3Lw+yo3rWki
         DpicpTWf/5/FBlJZ9+7t70zxXGPvgg8fvYw+Jx0zR40mOjQ+wxnxbxZCk9iiMWRDDXjN
         mTdvLpdSSzeZC894eH0gS/H5vD75ITY2ouwbat64uFqTX6TBuZPoQeiqDcTpce+FQ02X
         k1eg==
X-Gm-Message-State: AOAM532v+3DZsyf/aHF5Jok3vHV3AUKydmUNfpqxD8br4xBQ5HSI6YK2
	oNS+WJTKu0hUPFofCCuC8BWqtfCVvoI=
X-Google-Smtp-Source: ABdhPJwRg7O5kOiyupDbpcyg6AeyQdN8e8ZOvWW5nGk1jwIgipAs1X3iqM+p0cbX6T/2Jwrt5d0F6A==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr1973976wru.173.1604660116271;
        Fri, 06 Nov 2020 02:55:16 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id o7sm1645835wrp.23.2020.11.06.02.55.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 02:55:15 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	julien@xen.org,
	rahul.singh@arm.com
Subject: RE: [RFC PATCH 5/6] xen/arm32: Port Linux LL/SC atomics helpers to Xen
Date: Fri,  6 Nov 2020 10:55:14 +0000
Message-Id: <20201106105514.55448-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-6-ash.j.wilding@gmail.com>
References: <20201105185603.24149-6-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

As mentioned in my reply to patch #4 just now, in retrospect I should
have put an intermediate patch between #3 and #4, deleting the existing
headers. This would have made the patch diff for #4 and #5 much easier
to read seeing as they are copying the Linux versions into Xen.

I'll do that for V1 when we get there, but for now to aid in readability
I've pasted the complete header files below.  While doing this I also
spent some time last night tidying up them up to be in line with the Xen
coding style.

Thanks,
Ash.


========================================================================
====             xen/include/asm-arm/arm32/atomic.h                 ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes:
 *      - Drop redundant includes and redirect others to Xen equivalents
 *      - Rename header include guard to reflect Xen directory structure
 *      - Drop atomic64_t helper declarations
 *      - Drop pre-Armv6 support
 *      - Redirect READ_ONCE/WRITE_ONCE to __* equivalents in compiler.h
 *      - Add explicit atomic_add_return() and atomic_sub_return() as
 *           Linux doesn't define these for arm32. Here we just sandwich
 *           the atomic_<op>_return_relaxed() calls with smp_mb()s.
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * Copyright (C) 1996 Russell King.
 * Copyright (C) 2002 Deep Blue Solutions Ltd.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#ifndef __ASM_ARM_ARM32_ATOMIC_H
#define __ASM_ARM_ARM32_ATOMIC_H

#include <xen/compiler.h>
#include <xen/prefetch.h>
#include <xen/types.h>
#include "system.h"
#include "cmpxchg.h"

/*
 * On ARM, ordinary assignment (str instruction) doesn't clear the local
 * strex/ldrex monitor on some implementations. The reason we can use it for
 * atomic_set() is the clrex or dummy strex done on every exception return.
 */
#define atomic_read(v)      __READ_ONCE((v)->counter)
#define atomic_set(v,i)     __WRITE_ONCE(((v)->counter), (i))

/*
 * ARMv6 UP and SMP safe atomic ops.  We use load exclusive and
 * store exclusive to ensure that these are atomic.  We may loop
 * to ensure that the update happens.
 */

#define ATOMIC_OP(op, c_op, asm_op)                                     \
static inline void atomic_##op(int i, atomic_t *v)                      \
{                                                                       \
    unsigned long tmp;                                                  \
    int result;                                                         \
                                                                        \
    prefetchw(&v->counter);                                             \
    __asm__ __volatile__("@ atomic_" #op "\n"                           \
"1:    ldrex    %0, [%3]\n"                                             \
"    " #asm_op "    %0, %0, %4\n"                                       \
"    strex    %1, %0, [%3]\n"                                           \
"    teq    %1, #0\n"                                                   \
"    bne    1b"                                                         \
    : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)                   \
    : "r" (&v->counter), "Ir" (i)                                       \
    : "cc");                                                            \
}                                                                       \

#define ATOMIC_OP_RETURN(op, c_op, asm_op)                              \
static inline int atomic_##op##_return_relaxed(int i, atomic_t *v)      \
{                                                                       \
    unsigned long tmp;                                                  \
    int result;                                                         \
                                                                        \
    prefetchw(&v->counter);                                             \
                                                                        \
    __asm__ __volatile__("@ atomic_" #op "_return\n"                    \
"1:    ldrex    %0, [%3]\n"                                             \
"    " #asm_op "    %0, %0, %4\n"                                       \
"    strex    %1, %0, [%3]\n"                                           \
"    teq    %1, #0\n"                                                   \
"    bne    1b"                                                         \
    : "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)                   \
    : "r" (&v->counter), "Ir" (i)                                       \
    : "cc");                                                            \
                                                                        \
    return result;                                                      \
}

#define ATOMIC_FETCH_OP(op, c_op, asm_op)                               \
static inline int atomic_fetch_##op##_relaxed(int i, atomic_t *v)       \
{                                                                       \
    unsigned long tmp;                                                  \
    int result, val;                                                    \
                                                                        \
    prefetchw(&v->counter);                                             \
                                                                        \
    __asm__ __volatile__("@ atomic_fetch_" #op "\n"                     \
"1:    ldrex    %0, [%4]\n"                                             \
"    " #asm_op "    %1, %0, %5\n"                                       \
"    strex    %2, %1, [%4]\n"                                           \
"    teq    %2, #0\n"                                                   \
"    bne    1b"                                                         \
    : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Qo" (v->counter)      \
    : "r" (&v->counter), "Ir" (i)                                       \
    : "cc");                                                            \
                                                                        \
    return result;                                                      \
}

#define atomic_add_return_relaxed    atomic_add_return_relaxed
#define atomic_sub_return_relaxed    atomic_sub_return_relaxed
#define atomic_fetch_add_relaxed    atomic_fetch_add_relaxed
#define atomic_fetch_sub_relaxed    atomic_fetch_sub_relaxed

#define atomic_fetch_and_relaxed    atomic_fetch_and_relaxed
#define atomic_fetch_andnot_relaxed    atomic_fetch_andnot_relaxed
#define atomic_fetch_or_relaxed        atomic_fetch_or_relaxed
#define atomic_fetch_xor_relaxed    atomic_fetch_xor_relaxed

static inline int atomic_cmpxchg_relaxed(atomic_t *ptr, int old, int new)
{
    int oldval;
    unsigned long res;

    prefetchw(&ptr->counter);

    do {
        __asm__ __volatile__("@ atomic_cmpxchg\n"
        "ldrex    %1, [%3]\n"
        "mov    %0, #0\n"
        "teq    %1, %4\n"
        "strexeq %0, %5, [%3]\n"
            : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
            : "r" (&ptr->counter), "Ir" (old), "r" (new)
            : "cc");
    } while (res);

    return oldval;
}
#define atomic_cmpxchg_relaxed        atomic_cmpxchg_relaxed

static inline int atomic_fetch_add_unless(atomic_t *v, int a, int u)
{
    int oldval, newval;
    unsigned long tmp;

    smp_mb();
    prefetchw(&v->counter);

    __asm__ __volatile__ ("@ atomic_add_unless\n"
"1:    ldrex    %0, [%4]\n"
"    teq    %0, %5\n"
"    beq    2f\n"
"    add    %1, %0, %6\n"
"    strex    %2, %1, [%4]\n"
"    teq    %2, #0\n"
"    bne    1b\n"
"2:"
    : "=&r" (oldval), "=&r" (newval), "=&r" (tmp), "+Qo" (v->counter)
    : "r" (&v->counter), "r" (u), "r" (a)
    : "cc");

    if (oldval != u)
        smp_mb();

    return oldval;
}
#define atomic_fetch_add_unless        atomic_fetch_add_unless

#define ATOMIC_OPS(op, c_op, asm_op)        \
    ATOMIC_OP(op, c_op, asm_op)             \
    ATOMIC_OP_RETURN(op, c_op, asm_op)      \
    ATOMIC_FETCH_OP(op, c_op, asm_op)

ATOMIC_OPS(add, +=, add)
ATOMIC_OPS(sub, -=, sub)

#define atomic_andnot atomic_andnot

#undef ATOMIC_OPS
#define ATOMIC_OPS(op, c_op, asm_op)        \
    ATOMIC_OP(op, c_op, asm_op)             \
    ATOMIC_FETCH_OP(op, c_op, asm_op)

ATOMIC_OPS(and, &=, and)
ATOMIC_OPS(andnot, &= ~, bic)
ATOMIC_OPS(or,  |=, orr)
ATOMIC_OPS(xor, ^=, eor)

#undef ATOMIC_OPS
#undef ATOMIC_FETCH_OP
#undef ATOMIC_OP_RETURN
#undef ATOMIC_OP

#define atomic_xchg(v, new) (xchg(&((v)->counter), new))

/*
 * Linux doesn't define strict atomic_add_return() or atomic_sub_return()
 * for /arch/arm -- Let's manually define these for Xen.
 */

static inline int atomic_add_return(int i, atomic_t *v)
{
    int ret;

    smp_mb();
    ret = atomic_add_return_relaxed(i, v);
    smp_mb();

    return ret;
}
#define atomic_fetch_add(i, v) atomic_add_return(i, v)

static inline int atomic_sub_return(int i, atomic_t *v)
{
    int ret;

    smp_mb();
    ret = atomic_sub_return_relaxed(i, v);
    smp_mb();

    return ret;
}

#endif /* __ASM_ARM_ARM32_ATOMIC_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */




========================================================================
====            xen/include/asm-arm/arm32/cmpxchg.h                 ====
========================================================================

/*
 * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
 *
 * Summary of changes made while porting to Xen:
 *      - Rename header include guard to reflect Xen directory structure
 *      - Drop redundant includes and redirect others to Xen equivalents
 *      - Assume running on Armv7 so drop support for <= Armv6, and drop
 *           workarounds for StrongARM "swp" instruction errata
 *      - Drop local() variants (no callers in Xen)
 *      - Add strict versions of xchg(), cmpxchg(), and cmpxchg64() as
 *           Linux does not provide these
 *      - Keep the compiler happy by updating __cmpxchg64() ptr arg to
 *           be volatile and make the call to prefetchw() correctly cast
 *           ptr to (const volatile *)
 *      - Pull in original Xen arm32 cmpxchg.h definitions of
 *           cmpxchg_timeout*() and cmpxchg64_timeout*() as these are not
 *           provided by Linux and are required for Xen's guest atomics
 *      - Convert tabs to spaces in line with coding style
 *      - Tidy up indentations
 *      - Add Emacs file local variables
 *
 * SPDX-License-Identifier: GPL-2.0
 */
#ifndef __ASM_ARM_ARM32_CMPXCHG_H
#define __ASM_ARM_ARM32_CMPXCHG_H

#include <xen/prefetch.h>
#include <xen/types.h>

extern void __bad_cmpxchg(volatile void *ptr, int size);

static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
{
    unsigned long ret;
    unsigned int tmp;

    prefetchw((const void *)ptr);

    switch (size) {
    case 1:
        asm volatile("@    __xchg1\n"
        "1:    ldrexb    %0, [%3]\n"
        "    strexb    %1, %2, [%3]\n"
        "    teq    %1, #0\n"
        "    bne    1b"
            : "=&r" (ret), "=&r" (tmp)
            : "r" (x), "r" (ptr)
            : "memory", "cc");
        break;
    case 2:
        asm volatile("@    __xchg2\n"
        "1:    ldrexh    %0, [%3]\n"
        "    strexh    %1, %2, [%3]\n"
        "    teq    %1, #0\n"
        "    bne    1b"
            : "=&r" (ret), "=&r" (tmp)
            : "r" (x), "r" (ptr)
            : "memory", "cc");
        break;
    case 4:
        asm volatile("@    __xchg4\n"
        "1:    ldrex    %0, [%3]\n"
        "    strex    %1, %2, [%3]\n"
        "    teq    %1, #0\n"
        "    bne    1b"
            : "=&r" (ret), "=&r" (tmp)
            : "r" (x), "r" (ptr)
            : "memory", "cc");
        break;

    default:
        /* Cause a link-time error, the size is not supported */
        __bad_cmpxchg(ptr, size), ret = 0;
        break;
    }

    return ret;
}

#define xchg_relaxed(ptr, x) ({                        \
    (__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr),        \
                   sizeof(*(ptr)));            \
})

static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
                      unsigned long new, int size)
{
    unsigned long oldval, res;

    prefetchw((const void *)ptr);

    switch (size) {
    case 1:
        do {
            asm volatile("@ __cmpxchg1\n"
            "    ldrexb    %1, [%2]\n"
            "    mov    %0, #0\n"
            "    teq    %1, %3\n"
            "    strexbeq %0, %4, [%2]\n"
                : "=&r" (res), "=&r" (oldval)
                : "r" (ptr), "Ir" (old), "r" (new)
                : "memory", "cc");
        } while (res);
        break;
    case 2:
        do {
            asm volatile("@ __cmpxchg1\n"
            "    ldrexh    %1, [%2]\n"
            "    mov    %0, #0\n"
            "    teq    %1, %3\n"
            "    strexheq %0, %4, [%2]\n"
                : "=&r" (res), "=&r" (oldval)
                : "r" (ptr), "Ir" (old), "r" (new)
                : "memory", "cc");
        } while (res);
        break;
    case 4:
        do {
            asm volatile("@ __cmpxchg4\n"
            "    ldrex    %1, [%2]\n"
            "    mov    %0, #0\n"
            "    teq    %1, %3\n"
            "    strexeq %0, %4, [%2]\n"
                : "=&r" (res), "=&r" (oldval)
                : "r" (ptr), "Ir" (old), "r" (new)
                : "memory", "cc");
        } while (res);
        break;

    default:
        __bad_cmpxchg(ptr, size);
        oldval = 0;
    }

    return oldval;
}

#define cmpxchg_relaxed(ptr,o,n) ({                    \
    (__typeof__(*(ptr)))__cmpxchg((ptr),                \
                      (unsigned long)(o),        \
                      (unsigned long)(n),        \
                      sizeof(*(ptr)));            \
})

static inline unsigned long long __cmpxchg64(volatile unsigned long long *ptr,
                         unsigned long long old,
                         unsigned long long new)
{
    unsigned long long oldval;
    unsigned long res;

    prefetchw((const void *)ptr);

    __asm__ __volatile__(
"1:    ldrexd        %1, %H1, [%3]\n"
"    teq        %1, %4\n"
"    teqeq        %H1, %H4\n"
"    bne        2f\n"
"    strexd        %0, %5, %H5, [%3]\n"
"    teq        %0, #0\n"
"    bne        1b\n"
"2:"
    : "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
    : "r" (ptr), "r" (old), "r" (new)
    : "cc");

    return oldval;
}

#define cmpxchg64_relaxed(ptr, o, n) ({                    \
    (__typeof__(*(ptr)))__cmpxchg64((ptr),                \
                    (unsigned long long)(o),    \
                    (unsigned long long)(n));    \
})


/*
 * Linux doesn't provide strict versions of xchg(), cmpxchg(), and cmpxchg64(),
 * so manually define these for Xen as smp_mb() wrappers around the relaxed
 * variants.
 */

#define xchg(ptr, x) ({ \
    long ret; \
    smp_mb(); \
    ret = xchg_relaxed(ptr, x); \
    smp_mb(); \
    ret; \
})

#define cmpxchg(ptr, o, n) ({ \
    long ret; \
    smp_mb(); \
    ret = cmpxchg_relaxed(ptr, o, n); \
    smp_mb(); \
    ret; \
})

#define cmpxchg64(ptr, o, n) ({ \
    long long ret; \
    smp_mb(); \
    ret = cmpxchg64_relaxed(ptr, o, n); \
    smp_mb(); \
    ret; \
})

/*
 * This code is from the original Xen arm32 cmpxchg.h, from before the
 * Linux 5.10-rc2 atomics helpers were ported over. The only changes
 * here are renaming the macros and functions to explicitly use
 * "timeout" in their names so that they don't clash with the above.
 *
 * We need this here for guest atomics (the only user of the timeout
 * variants).
 */

#define __CMPXCHG_TIMEOUT_CASE(sz, name)                                        \
static inline bool __cmpxchg_timeout_case_##name(volatile void *ptr,            \
                                         unsigned long *old,            \
                                         unsigned long new,             \
                                         bool timeout,                  \
                                         unsigned int max_try)          \
{                                                                       \
        unsigned long oldval;                                           \
        unsigned long res;                                              \
                                                                        \
        do {                                                            \
                asm volatile("@ __cmpxchg_timeout_case_" #name "\n"             \
                "       ldrex" #sz "    %1, [%2]\n"                     \
                "       mov     %0, #0\n"                               \
                "       teq     %1, %3\n"                               \
                "       strex" #sz "eq %0, %4, [%2]\n"                  \
                : "=&r" (res), "=&r" (oldval)                           \
                : "r" (ptr), "Ir" (*old), "r" (new)                     \
                : "memory", "cc");                                      \
                                                                        \
                if (!res)                                               \
                        break;                                          \
        } while (!timeout || ((--max_try) > 0));                        \
                                                                        \
        *old = oldval;                                                  \
                                                                        \
        return !res;                                                    \
}

__CMPXCHG_TIMEOUT_CASE(b, 1)
__CMPXCHG_TIMEOUT_CASE(h, 2)
__CMPXCHG_TIMEOUT_CASE( , 4)

static inline bool __cmpxchg_timeout_case_8(volatile uint64_t *ptr,
                                    uint64_t *old,
                                    uint64_t new,
                                    bool timeout,
                                    unsigned int max_try)
{
        uint64_t oldval;
        uint64_t res;

        do {
                asm volatile(
                "       ldrexd          %1, %H1, [%3]\n"
                "       teq             %1, %4\n"
                "       teqeq           %H1, %H4\n"
                "       movne           %0, #0\n"
                "       movne           %H0, #0\n"
                "       bne             2f\n"
                "       strexd          %0, %5, %H5, [%3]\n"
                "2:"
                : "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
                : "r" (ptr), "r" (*old), "r" (new)
                : "memory", "cc");
                if (!res)
                        break;
        } while (!timeout || ((--max_try) > 0));

        *old = oldval;

        return !res;
}

static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
                                        unsigned long new, int size,
                                        bool timeout, unsigned int max_try)
{
        prefetchw((const void *)ptr);

        switch (size) {
        case 1:
                return __cmpxchg_timeout_case_1(ptr, old, new, timeout, max_try);
        case 2:
                return __cmpxchg_timeout_case_2(ptr, old, new, timeout, max_try);
        case 4:
                return __cmpxchg_timeout_case_4(ptr, old, new, timeout, max_try);
        default:
                __bad_cmpxchg(ptr, size);
                return false;
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
static always_inline bool __cmpxchg64_timeout(volatile uint64_t *ptr,
                                              uint64_t *old,
                                              uint64_t new,
                                              unsigned int max_try)
{
    bool ret;

    smp_mb();
    ret = __cmpxchg_timeout_case_8(ptr, old, new, true, max_try);
    smp_mb();

    return ret;
}

#endif /* __ASM_ARM_ARM32_CMPXCHG_H */
/*
 * Local variables:
 * mode: C
 * c-file-style: "BSD"
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 */

