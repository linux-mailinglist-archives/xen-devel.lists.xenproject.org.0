Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3C89BA1F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701833.1096350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkHR-0002xF-P4; Mon, 08 Apr 2024 08:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701833.1096350; Mon, 08 Apr 2024 08:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkHR-0002uW-LT; Mon, 08 Apr 2024 08:23:05 +0000
Received: by outflank-mailman (input) for mailman id 701833;
 Mon, 08 Apr 2024 08:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtkHP-0002uO-9P
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:23:03 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3635e7fa-f581-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 10:23:00 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4164c9debf6so7080345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 01:23:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a05600c3d8600b004167ef77060sm1517865wmb.17.2024.04.08.01.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 01:22:59 -0700 (PDT)
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
X-Inumbo-ID: 3635e7fa-f581-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712564580; x=1713169380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAdkuJMvFV49gPfSslaOKGO5CQkAepCjA528G9RZArs=;
        b=PHAH+RywhUC5OS+REGxggepSn80ZN91nXucqgXnJ0dza6jypheTet45NJje1QwIEW2
         fBjMM+G0RqGqGHte/zG9b518l8ksB5e0stlcNqrFgNJVxU2M7Z8JHIsbwUo5Upha5e5A
         rPbq44Hd748HIpEAPQvCHgsdoBKuo3BPQSGKwC4QdbxeK7owXP+8zW3TOlBGtuh2Hy6p
         EbTQTxwbw3wNPtflRXNscguQtzLNg4TwN+YpcfB+56bupNZz1+/KgauCzHdGHXj9QP/a
         PX3E4Osaw12hqykj4Jh10Dla13/6TqYO1yU3uOBID4fd+R/rhxCUc0rL/5tFkYdWzlfy
         INEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564580; x=1713169380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAdkuJMvFV49gPfSslaOKGO5CQkAepCjA528G9RZArs=;
        b=jqBN+YcYqBRoOp3Xg7TiQXFPC27W83Ks6Mo2FMGtky4fkTNX4M9cx3iel5f4cDiStz
         eqOmYcVpNHfY/TtKq1hK9ih6qA/ftma1rL5AqNMq4hXye4b1wvM3bR0P5NOGplNhdKbg
         qoZ+mDV2Opby2PexLJkBMTz1mT5UAhY75a1VF1jb+rC7VXtjDLvb4gQ3SM8BOwpAYYV4
         HLoj3EJ9EekyLH+pLzGjmGdBI2UOdWinHVADj2n2UtPT7YgLZ8tkuX15Kdw/1aeP9dLf
         KBww9Rcb++3aYeb68/lj6wyS80g4juJpyAQnFEuGAo+YkU6l+2vQphBl9KVIyKssT1fz
         Rm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQU2o5AU93YS7Vu2A6sjlGXhYXJTv0chFbePgdaL1q0nB1FxGptE9eNUTwJFpoSozXW/cQbYKbHNB+MRERUkiKy9ddyvZ+ZthXdl1rQZk=
X-Gm-Message-State: AOJu0YyUAu8ZPlQazYnazULzPQlGGpziJRPIW4NuRrkSP8lekGrdw3g1
	BGmq7/hP2AVLukvy9MwTL9bcPDQeVLSWPuWUGDuztzuZHBGN5a1VknU2oU6ypw==
X-Google-Smtp-Source: AGHT+IFmYS67GfiujKY0Jt5GbikhneqIMCdqyVEB+vrHmDOFc/Zezi9sK8b60C+y3TTwu/l5SanETw==
X-Received: by 2002:a05:600c:3b1d:b0:415:6121:5171 with SMTP id m29-20020a05600c3b1d00b0041561215171mr5743439wms.32.1712564580011;
        Mon, 08 Apr 2024 01:23:00 -0700 (PDT)
Message-ID: <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
Date: Mon, 8 Apr 2024 10:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/19] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <6a6c4ef8663d9da8c8a2aba4baf0286f31566edf.1712137031.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <6a6c4ef8663d9da8c8a2aba4baf0286f31566edf.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:20, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,261 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Taken and modified from Linux.
> + *
> + * The following changes were done:
> + * - * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated
> + *     to use__*xchg_generic()
> + * - drop casts in write_atomic() as they are unnecessary
> + * - drop introduction of WRITE_ONCE() and READ_ONCE().
> + *   Xen provides ACCESS_ONCE()
> + * - remove zero-length array access in read_atomic()
> + * - drop defines similar to pattern
> + *   #define atomic_add_return_relaxed   atomic_add_return_relaxed
> + * - move not RISC-V specific functions to asm-generic/atomics-ops.h
> + * 
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2024 Vates SAS
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#include <xen/atomic.h>
> +
> +#include <asm/cmpxchg.h>
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +void __bad_atomic_size(void);
> +
> +/*
> + * Legacy from Linux kernel. For some reason they wanted to have ordered
> + * read/write access. Thereby read* is used instead of read*_cpu()
> + */
> +static always_inline void read_atomic_size(const volatile void *p,
> +                                           void *res,
> +                                           unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: *(uint8_t *)res = readb(p); break;
> +    case 2: *(uint16_t *)res = readw(p); break;
> +    case 4: *(uint32_t *)res = readl(p); break;
> +#ifndef CONFIG_RISCV_32
> +    case 8: *(uint32_t *)res = readq(p); break;
> +#endif
> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                                   \
> +    union { typeof(*(p)) val; char c[sizeof(*(p))]; } x_;   \
> +    read_atomic_size(p, x_.c, sizeof(*(p)));                \
> +    x_.val;                                                 \
> +})
> +
> +static always_inline void _write_atomic(volatile void *p,
> +                                       unsigned long x, unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: writeb(x, p); break;
> +    case 2: writew(x, p); break;
> +    case 4: writel(x, p); break;
> +#ifndef CONFIG_RISCV_32
> +    case 8: writeq(x, p); break;
> +#endif
> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define write_atomic(p, x)                              \
> +({                                                      \
> +    typeof(*(p)) x_ = (x);                              \
> +    _write_atomic((p), x_, sizeof(*(p)));               \
> +    x_;                                                 \
> +})
> +
> +static always_inline void _add_sized(volatile void *p,
> +                                     unsigned long x, unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1: writeb(read_atomic((volatile uint8_t *)p) + x, p); break;
> +    case 2: writew(read_atomic((volatile uint16_t *)p) + x, p); break;
> +    case 4: writel(read_atomic((volatile uint32_t *)p) + x, p); break;
> +#ifndef CONFIG_RISCV_32
> +    case 8: writeq(read_atomic((volatile uint64_t *)p) + x, p); break;
> +#endif

Any particular reason for using read_atomic() but write{b,w,l,q}() here?

> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define add_sized(p, x)                                 \
> +({                                                      \
> +    typeof(*(p)) x_ = (x);                              \
> +    _add_sized((p), x_, sizeof(*(p)));                  \
> +})
> +
> +#define __atomic_acquire_fence() \
> +    asm volatile ( RISCV_ACQUIRE_BARRIER "" ::: "memory" )
> +
> +#define __atomic_release_fence() \
> +    asm volatile ( RISCV_RELEASE_BARRIER "" ::: "memory" )

There isn't any need for the "" in these two, is there?

> +/*
> + * First, the atomic ops that have no ordering constraints and therefor don't
> + * have the AQ or RL bits set.  These don't return anything, so there's only
> + * one version to worry about.
> + */
> +#define ATOMIC_OP(op, asm_op, unary_op, asm_type, c_type, prefix)  \
> +static inline                                               \
> +void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
> +{                                                           \
> +    asm volatile (                                          \
> +        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
> +        : "+A" (v->counter)                                 \
> +        : "r" (unary_op i)                                  \
> +        : "memory" );                                       \
> +}                                                           \
> +
> +/*
> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
> + * last argument for ATOMIC_OP isn't used.
> + */
> +#define ATOMIC_OPS(op, asm_op, unary_op)                    \
> +        ATOMIC_OP (op, asm_op, unary_op, w, int,   )
> +
> +ATOMIC_OPS(add, add, +)
> +ATOMIC_OPS(sub, add, -)
> +ATOMIC_OPS(and, and, +)
> +ATOMIC_OPS( or,  or, +)
> +ATOMIC_OPS(xor, xor, +)
> +
> +#undef ATOMIC_OP
> +#undef ATOMIC_OPS
> +
> +#include <asm-generic/atomic-ops.h>
> +
> +/*
> + * Atomic ops that have ordered variant.
> + * There's two flavors of these: the arithmatic ops have both fetch and return
> + * versions, while the logical ops only have fetch versions.
> + */
> +#define ATOMIC_FETCH_OP(op, asm_op, unary_op, asm_type, c_type, prefix) \
> +static inline                                                       \
> +c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v) \
> +{                                                                   \
> +    register c_type ret;                                            \
> +    asm volatile (                                                  \
> +        "   amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"          \
> +        : "+A" (v->counter), "=r" (ret)                             \
> +        : "r" (unary_op i)                                          \
> +        : "memory" );                                               \
> +    return ret;                                                     \
> +}
> +
> +#define ATOMIC_OP_RETURN(op, asm_op, c_op, unary_op, asm_type, c_type, prefix) \
> +static inline                                                           \
> +c_type atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)  \
> +{                                                                       \
> +        return atomic##prefix##_fetch_##op(i, v) c_op (unary_op i);     \

Nit: Too deep indentation.

> +}
> +
> +/*
> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
> + * last argument of ATOMIC_FETCH_OP, ATOMIC_OP_RETURN isn't used.
> + */
> +#define ATOMIC_OPS(op, asm_op, c_op, unary_op)                          \
> +        ATOMIC_FETCH_OP( op, asm_op,       unary_op, w, int,   )        \
> +        ATOMIC_OP_RETURN(op, asm_op, c_op, unary_op, w, int,   )
> +
> +ATOMIC_OPS(add, add, +, +)
> +ATOMIC_OPS(sub, add, +, -)
> +
> +#undef ATOMIC_OPS
> +
> +#define ATOMIC_OPS(op, asm_op, unary_op) \
> +        ATOMIC_FETCH_OP(op, asm_op, unary_op, w, int,   )
> +
> +ATOMIC_OPS(and, and, +)
> +ATOMIC_OPS( or,  or, +)
> +ATOMIC_OPS(xor, xor, +)

The + isn't really needed here as a macro argument; ATOMIC_OPS() itself could
pass it to ATOMIC_FETCH_OP(). I also wonder why ATOMIC_OPS() has both "op" and
"asm_op", when both are uniformly the same.

> +#undef ATOMIC_OPS
> +
> +#undef ATOMIC_FETCH_OP
> +#undef ATOMIC_OP_RETURN
> +
> +/* This is required to provide a full barrier on success. */
> +static inline int atomic_add_unless(atomic_t *v, int a, int u)
> +{
> +    int prev, rc;
> +
> +    asm volatile (
> +        "0: lr.w     %[p],  %[c]\n"
> +        "   beq      %[p],  %[u], 1f\n"
> +        "   add      %[rc], %[p], %[a]\n"
> +        "   sc.w.aqrl  %[rc], %[rc], %[c]\n"
> +        "   bnez     %[rc], 0b\n"
> +        "1:\n"
> +        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
> +        : [a] "r" (a), [u] "r" (u)
> +        : "memory");
> +    return prev;
> +}
> +
> +static inline int atomic_sub_if_positive(atomic_t *v, int offset)
> +{
> +    int prev, rc;
> +
> +    asm volatile (
> +        "0: lr.w     %[p],  %[c]\n"
> +        "   sub      %[rc], %[p], %[o]\n"
> +        "   bltz     %[rc], 1f\n"
> +        "   sc.w.aqrl  %[rc], %[rc], %[c]\n"
> +        "   bnez     %[rc], 0b\n"
> +        "1:\n"
> +        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
> +        : [o] "r" (offset)
> +        : "memory" );
> +    return prev - offset;
> +}
> +
> +/*
> + * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
> + * {cmp,}xchg and the operations that return.
> + */
> +#define ATOMIC_OP(c_t, prefix, size)                            \
> +static inline                                                   \
> +c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)         \
> +{                                                               \
> +    return __xchg(&v->counter, n, size);                        \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
> +{                                                               \
> +    return __cmpxchg(&v->counter, o, n, size);                  \
> +}
> +
> +#define ATOMIC_OPS() \
> +    ATOMIC_OP(int,   , 4)

Can't the two inline functions use sizeof(*v), sizeof(v->counter), sizeof(c_t),
or sizeof(n) instead of passing a literal 4 here?

Jan

