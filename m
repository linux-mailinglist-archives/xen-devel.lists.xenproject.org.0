Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812EE873AB5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 16:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689377.1074265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhtFT-0004R2-6x; Wed, 06 Mar 2024 15:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689377.1074265; Wed, 06 Mar 2024 15:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhtFT-0004Ox-42; Wed, 06 Mar 2024 15:32:03 +0000
Received: by outflank-mailman (input) for mailman id 689377;
 Wed, 06 Mar 2024 15:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhtFR-0004Or-6T
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 15:32:01 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac484a6f-dbce-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 16:31:59 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a45bdf6e9c2so81000066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 07:31:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h17-20020a1709063c1100b00a42da3b6518sm7349399ejg.18.2024.03.06.07.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 07:31:58 -0800 (PST)
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
X-Inumbo-ID: ac484a6f-dbce-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709739119; x=1710343919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7Bno0hyAUQO1crnpfNA0n5AIEwPTsHHAoqNPjU9xGg=;
        b=StuTVdS/IH7cC2OZ93VUaWqm77kcu6kqR6+cmD8tHKUcAvDuhYK4h3ktoTHzvVhkRr
         iAARe6OUqMNvg1OE2gIgFGZyEOIBC+bmlCgTyfitpEfJ8O4OSjQlSg7ESuwWGMcX1NTS
         JB+QfYDaGBkOWkj4LlsDDWFEb0fSv4lgeCKgzqAKBt5PrOQSbU9PD1GxnjNU7wphgimV
         F6Z5mgVVMe9Xw/s9RzRuorRmyi8zLR1APK5VJXmcYGS+gSD1PYnEp//ZZ4JRIJ/p/7EK
         NXVSCNeJyO6KkeZNSIeNm0ENuBa0qLr0bx/H/apBNqkF3z8x/9eFQVyNjCM4eoWNHzE1
         Ye1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739119; x=1710343919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7Bno0hyAUQO1crnpfNA0n5AIEwPTsHHAoqNPjU9xGg=;
        b=OqGg8dU66Alb122RAf2c0RMSl+WOTXjaso64aH8bCprqCnIxOIqeT+iXkT72bpG4CI
         sOL+OM7dL4maYbj9EeGkV8wbPv6ygb6d186nrO/DndWv6b3sBEjFFi8rVKZpjc7wKXPt
         EUc2d6q5fBbOGZtjwkKmtQr+DN5g2rvXXqGj5IMxJXskxLJIPjXUg0jL+/JuA5uMUSby
         /jaSYvRtQt3DCoPxSXiNZWMGW2otJJ6R61w01Jp0BHZ6qhpm78ND0A+h4umvYfHzfBTe
         IMl6dKAfjksWSGDl1Qh+q2izhE4SNhv+iCCAmal2yrzXAxsmRqtcLevQKIcdJIuv3IQa
         6aJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfuSD+O24mWM3iUw9OF2vdj+aAUFrny+bhjG1YWXhvbwAHbknhWv9RrpgMwlYpoZFeBBQh+/NMRHgJPVCHLxao0RDepQMa0pl+kkVYahk=
X-Gm-Message-State: AOJu0Yyu/gUBi4L0yvP9tfdpkqUy7NEqyuLoXhcfnb54to/lPTep5JyF
	M2jerkrq+stFQsdTeA9FdJNYjydyOxxw/47h3ipZVUM7eD9OycjqAt3aMj14Lg==
X-Google-Smtp-Source: AGHT+IEpqExf5FjnbJqWEbz37JG1rVb5Ojr5R869FFikWQZEPQdBh2EoDEFhZYNWx0sSwRxt7HQ1bw==
X-Received: by 2002:a17:906:348b:b0:a45:a348:32ad with SMTP id g11-20020a170906348b00b00a45a34832admr4055294ejb.74.1709739119019;
        Wed, 06 Mar 2024 07:31:59 -0800 (PST)
Message-ID: <3d9b0fa3-d100-4e73-b5d5-782ef58e331a@suse.com>
Date: Wed, 6 Mar 2024 16:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/23] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <85ad8c86901d045beed228947d4c3faf277af3ca.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <85ad8c86901d045beed228947d4c3faf277af3ca.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,296 @@
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
> +#include <asm-generic/atomic-ops.h>

While, because of the forward decls in xen/atomic.h, having this #include
works, I wonder if it wouldn't better be placed further down. The compiler
will likely have an easier time when it sees the inline definitions ahead
of any uses.

> +void __bad_atomic_size(void);
> +
> +/*
> + * Legacy from Linux kernel. For some reason they wanted to have ordered
> + * read/write access. Thereby read* is used instead of read<X>_cpu()
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
> +    case 8: *(uint32_t *)res  = readq(p); break;

This is the point where the lack of constraints in io.h (see my respective
comment) becomes actually harmful: You're accessing not MMIO, but compiler-
visible variables here. It needs to know which ones are read ...

> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                               \
> +    union { typeof(*p) val; char c[sizeof(*p)]; } x_;   \
> +    read_atomic_size(p, x_.c, sizeof(*p));              \
> +    x_.val;                                             \
> +})
> +
> +#define write_atomic(p, x)                              \
> +({                                                      \
> +    typeof(*p) x__ = (x);                               \
> +    switch ( sizeof(*p) )                               \
> +    {                                                   \
> +    case 1: writeb(x__,  p); break;                     \
> +    case 2: writew(x__, p); break;                      \
> +    case 4: writel(x__, p); break;                      \
> +    case 8: writeq(x__, p); break;                      \

... or written.

Nit: There's a stray blank in the writeb() invocation.

> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +    x__;                                                \
> +})
> +
> +#define add_sized(p, x)                                 \
> +({                                                      \
> +    typeof(*(p)) x__ = (x);                             \
> +    switch ( sizeof(*(p)) )                             \

Like you have it here, {read,write}_atomic() also need p properly
parenthesized. There look to be more parenthesization issues further
down.

> +    {                                                   \
> +    case 1: writeb(read_atomic(p) + x__, p); break;     \
> +    case 2: writew(read_atomic(p) + x__, p); break;     \
> +    case 4: writel(read_atomic(p) + x__, p); break;     \
> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +})

Any reason this doesn't have an 8-byte case? x86'es at least has one.

> +#define __atomic_acquire_fence() \
> +    __asm__ __volatile__ ( RISCV_ACQUIRE_BARRIER "" ::: "memory" )
> +
> +#define __atomic_release_fence() \
> +    __asm__ __volatile__ ( RISCV_RELEASE_BARRIER "" ::: "memory" )

Elsewhere you use asm volatile() - why __asm__ __volatile__() here?
Or why not there (cmpxchg.h, io.h)?

> +/*
> + * First, the atomic ops that have no ordering constraints and therefor don't
> + * have the AQ or RL bits set.  These don't return anything, so there's only
> + * one version to worry about.
> + */
> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)  \
> +static inline                                               \
> +void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
> +{                                                           \
> +    __asm__ __volatile__ (                                  \
> +        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
> +        : "+A" (v->counter)                                 \
> +        : "r" (I)                                           \
> +        : "memory" );                                       \
> +}                                                           \
> +
> +#define ATOMIC_OPS(op, asm_op, I)                           \
> +        ATOMIC_OP (op, asm_op, I, w, int,   )
> +
> +ATOMIC_OPS(add, add,  i)
> +ATOMIC_OPS(sub, add, -i)
> +ATOMIC_OPS(and, and,  i)
> +ATOMIC_OPS( or,  or,  i)
> +ATOMIC_OPS(xor, xor,  i)
> +
> +#undef ATOMIC_OP
> +#undef ATOMIC_OPS
> +
> +/*
> + * Atomic ops that have ordered, relaxed, acquire, and release variants.
> + * There's two flavors of these: the arithmatic ops have both fetch and return
> + * versions, while the logical ops only have fetch versions.
> + */
> +#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)    \
> +static inline                                                       \
> +c_type atomic##prefix##_fetch_##op##_relaxed(c_type i,              \
> +                         atomic##prefix##_t *v)                     \
> +{                                                                   \
> +    register c_type ret;                                            \
> +    __asm__ __volatile__ (                                          \
> +        "   amo" #asm_op "." #asm_type " %1, %2, %0"                \
> +        : "+A" (v->counter), "=r" (ret)                             \
> +        : "r" (I)                                                   \
> +        : "memory" );                                               \
> +    return ret;                                                     \
> +}                                                                   \
> +static inline                                                       \
> +c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v) \
> +{                                                                   \
> +    register c_type ret;                                            \
> +    __asm__ __volatile__ (                                          \
> +        "   amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"          \
> +        : "+A" (v->counter), "=r" (ret)                             \
> +        : "r" (I)                                                   \
> +        : "memory" );                                               \
> +    return ret;                                                     \
> +}
> +
> +#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix) \
> +static inline                                                           \
> +c_type atomic##prefix##_##op##_return_relaxed(c_type i,                 \
> +                          atomic##prefix##_t *v)                        \
> +{                                                                       \
> +        return atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;      \
> +}                                                                       \
> +static inline                                                           \
> +c_type atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)  \
> +{                                                                       \
> +        return atomic##prefix##_fetch_##op(i, v) c_op I;                \
> +}
> +
> +#define ATOMIC_OPS(op, asm_op, c_op, I)                                 \
> +        ATOMIC_FETCH_OP( op, asm_op,       I, w, int,   )               \
> +        ATOMIC_OP_RETURN(op, asm_op, c_op, I, w, int,   )

What purpose is the last macro argument when you only ever pass nothing
for it (here and ...

> +ATOMIC_OPS(add, add, +,  i)
> +ATOMIC_OPS(sub, add, +, -i)
> +
> +#undef ATOMIC_OPS
> +
> +#define ATOMIC_OPS(op, asm_op, I) \
> +        ATOMIC_FETCH_OP(op, asm_op, I, w, int,   )

... here)?

> +ATOMIC_OPS(and, and, i)
> +ATOMIC_OPS( or,  or, i)
> +ATOMIC_OPS(xor, xor, i)
> +
> +#undef ATOMIC_OPS
> +
> +#undef ATOMIC_FETCH_OP
> +#undef ATOMIC_OP_RETURN
> +
> +/* This is required to provide a full barrier on success. */
> +static inline int atomic_add_unless(atomic_t *v, int a, int u)
> +{
> +       int prev, rc;
> +
> +    __asm__ __volatile__ (
> +        "0: lr.w     %[p],  %[c]\n"
> +        "   beq      %[p],  %[u], 1f\n"
> +        "   add      %[rc], %[p], %[a]\n"
> +        "   sc.w.rl  %[rc], %[rc], %[c]\n"
> +        "   bnez     %[rc], 0b\n"
> +        RISCV_FULL_BARRIER
> +        "1:\n"
> +        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
> +        : [a] "r" (a), [u] "r" (u)
> +        : "memory");
> +    return prev;
> +}
> +
> +/*
> + * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
> + * {cmp,}xchg and the operations that return, so they need a full barrier.
> + */
> +#define ATOMIC_OP(c_t, prefix, size)                            \
> +static inline                                                   \
> +c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n) \
> +{                                                               \
> +    return __xchg_generic(&(v->counter), n, size, "", "", "");  \

The inner parentheses aren't really needed here, are they?

> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n) \
> +{                                                               \
> +    return __xchg_generic(&(v->counter), n, size,               \
> +                          "", "", RISCV_ACQUIRE_BARRIER);       \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n) \
> +{                                                               \
> +    return __xchg_generic(&(v->counter), n, size,               \
> +                          "", RISCV_RELEASE_BARRIER, "");       \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)         \
> +{                                                               \
> +    return __xchg_generic(&(v->counter), n, size,               \
> +                          ".aqrl", "", "");                     \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,     \
> +                     c_t o, c_t n)                              \
> +{                                                               \
> +    return __cmpxchg_generic(&(v->counter), o, n, size,         \
> +                             "", "", "");                       \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,     \
> +                     c_t o, c_t n)                              \
> +{                                                               \
> +    return __cmpxchg_generic(&(v->counter), o, n, size,         \
> +                             "", "", RISCV_ACQUIRE_BARRIER);    \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,     \
> +                     c_t o, c_t n)                              \
> +{	                                                            \

A hard tab looks to have been left here.

> +    return __cmpxchg_generic(&(v->counter), o, n, size,         \
> +                             "", RISCV_RELEASE_BARRIER, "");    \
> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
> +{                                                               \
> +    return __cmpxchg_generic(&(v->counter), o, n, size,         \
> +                             ".rl", "", " fence rw, rw\n");     \
> +}
> +
> +#define ATOMIC_OPS() \
> +    ATOMIC_OP(int,   , 4)
> +
> +ATOMIC_OPS()
> +
> +#undef ATOMIC_OPS
> +#undef ATOMIC_OP
> +
> +static inline int atomic_sub_if_positive(atomic_t *v, int offset)
> +{
> +       int prev, rc;
> +
> +    __asm__ __volatile__ (
> +        "0: lr.w     %[p],  %[c]\n"
> +        "   sub      %[rc], %[p], %[o]\n"
> +        "   bltz     %[rc], 1f\n"
> +        "   sc.w.rl  %[rc], %[rc], %[c]\n"
> +        "   bnez     %[rc], 0b\n"
> +        "   fence    rw, rw\n"
> +        "1:\n"
> +        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
> +        : [o] "r" (offset)
> +        : "memory" );
> +    return prev - offset;
> +}
> +
> +#define atomic_dec_if_positive(v)	atomic_sub_if_positive(v, 1)

Hmm, PPC for some reason also has the latter, but for both: Are they indeed
going to be needed in RISC-V code? They certainly look unnecessary for the
purpose of this series (allowing common code to build).

> --- /dev/null
> +++ b/xen/include/asm-generic/atomic-ops.h
> @@ -0,0 +1,92 @@
> +#/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_ATOMIC_OPS_H_
> +#define _ASM_GENERIC_ATOMIC_OPS_H_
> +
> +#include <xen/atomic.h>
> +#include <xen/lib.h>

If I'm not mistaken this header provides default implementations for every
xen/atomic.h-provided forward inline declaration that can be synthesized
from other atomic functions. I think a comment to this effect would want
adding somewhere here.

Jan

