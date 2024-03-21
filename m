Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C33885989
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 14:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696398.1087298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnI4y-0008Vu-Ix; Thu, 21 Mar 2024 13:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696398.1087298; Thu, 21 Mar 2024 13:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnI4y-0008Tv-G8; Thu, 21 Mar 2024 13:03:32 +0000
Received: by outflank-mailman (input) for mailman id 696398;
 Thu, 21 Mar 2024 13:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnI4w-0008Tp-P3
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 13:03:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68cbe05a-e783-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 14:03:28 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so1179345a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 06:03:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 eo12-20020a056402530c00b0056bced75f05sm427581edb.77.2024.03.21.06.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 06:03:27 -0700 (PDT)
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
X-Inumbo-ID: 68cbe05a-e783-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711026207; x=1711631007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPZw3NeSP7icVBlGeA7Bx7Y/cSSmhmpJ4ZWAtkFAa6s=;
        b=CKtnx7hTZk/DEXZRSsR28GUlKgg3WhYIIMdVfwRUE3nxGUt0o1UqtW5pppd7kvFVbX
         gU2BvbZw5aU+3nXpYXCcd3aRhL37QYKAPNpOtXrd82KRfNCxxlbaOtp/IgSXmuXmxgXa
         BxA0iwSSv4MKgGiZaz4lfRtTb2/7vDcjHznAjzhv+znweFgQiFUzK5EeEWJbpNgg/xHb
         6Hnbxd+pC9sgVw6X8h5IIujYYxyVi0IEWJ+JBNcqXnl6rmLmzn9JFeZCnDtTx9b8OtYQ
         2wTp17o+F4vRokTE8VDwubc3PBHOFf6A5ByhYwowIPrpFwZkdv8s5pmEo9D7qkKl3Rgt
         OqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711026207; x=1711631007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPZw3NeSP7icVBlGeA7Bx7Y/cSSmhmpJ4ZWAtkFAa6s=;
        b=rSFafRCCSquaO5sm+wVxHOoXZ18Q1Ut+hLfFFe4FMyx+gGvR5QSH5P/54NIaBaKRcW
         jj84Cl5vtkcceKGGzAZD0Ir3AtURISx9jK8gr+2XbQOMx0u57pzJTjirAUjKTD0kjFSe
         M4MwL9L+0QNbNgo8mAkED8TD+OXYdGBVcakvK3CIaJrn17/wFM2OZCNcl2NXVBJ2bep7
         Rv2Hlucq6ksYqUvrIg1J743eTg2DOZw294d8ZPf+V58vyrJKWXW537s4azZvuS1dB90p
         0w1IXl7qfZly8sK1CSITOILpiC8bgxjacg6lkhY0JJ2hIJJ4eroNMKO1P10qWQeCXBv9
         hyLg==
X-Forwarded-Encrypted: i=1; AJvYcCXIKB+aT4drehZ4kFCWhs1wNP5q8R/E07C2fEUz1g6pLRTpQxl1o4KzdTkmOHcVJ+eQVulFhUezC+ECYuEO4ZQ6QmjEuyTqjW9HdprK6sc=
X-Gm-Message-State: AOJu0YwWI/DKth1SXgQOI5En3HlqeT1/zLqFO0Bgq9GaUwLJ4Y9piE6H
	+vBOsHa6nXc5FvA3jCALlnv2Jlu+jODRTNNIEDekqiIGRGRqc6KnNDf7VS/2yg==
X-Google-Smtp-Source: AGHT+IFox8XiI8dXU6lrOcSnqRZtVEqlR9mS7uofBcOrpSLH6QfV98LheEpcynaSMBeGLDNNFaPa6g==
X-Received: by 2002:a05:6402:e07:b0:567:4694:159 with SMTP id h7-20020a0564020e0700b0056746940159mr13265884edh.26.1711026207347;
        Thu, 21 Mar 2024 06:03:27 -0700 (PDT)
Message-ID: <78a86041-72e2-410f-b6a7-212656b0dba3@suse.com>
Date: Thu, 21 Mar 2024 14:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/20] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <22ee9c8cc62c76cfb799fed800636e7c8bf25a17.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <22ee9c8cc62c76cfb799fed800636e7c8bf25a17.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> Initially the patch was introduced by Bobby, who takes the header from
> Linux kernel.
> 
> The following changes were done on top of Linux kernel header:
>  - atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated
>      to use__*xchg_generic()
>  - drop casts in write_atomic() as they are unnecessary
>  - drop introduction of WRITE_ONCE() and READ_ONCE().
>    Xen provides ACCESS_ONCE()

Here and in the code comment: While this may be describing what you did
on top of what Bobby had, here you're describing differences to the Linux
header.

>  - remove zero-length array access in read_atomic()
>  - drop defines similar to pattern

pattern? Which one? Oh, wait, ...

>  - #define atomic_add_return_relaxed   atomic_add_return_relaxed

... this line really isn't a separate bullet point.

> Changes in V6:
>  - drop atomic##prefix##_{cmp}xchg_{release, aquire, relaxed} as they aren't used
>    by Xen
>  - code style fixes.
>  - %s/__asm__ __volatile__/asm volatile

Btw, this is another activity that could do with being carried out
consistently through the series.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,263 @@
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
> + * read/write access. Thereby read* is used instead of read<X>_cpu()

Either read<X> and read<X>_cpu() or read* and read*_cpu(), please.

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

Nit: Excess blank before =.

Also - no #ifdef here to be RV32-ready?

> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                                   \
> +    union { typeof(*(p)) val; char c[sizeof(*(p))]; } x_;   \

One trailing underscore here, but ...

> +    read_atomic_size(p, x_.c, sizeof(*(p)));                \
> +    x_.val;                                                 \
> +})
> +
> +#define write_atomic(p, x)                              \
> +({                                                      \
> +    typeof(*(p)) x__ = (x);                             \

... two here and ...

> +    switch ( sizeof(*(p)) )                             \
> +    {                                                   \
> +    case 1: writeb(x__, p); break;                      \
> +    case 2: writew(x__, p); break;                      \
> +    case 4: writel(x__, p); break;                      \
> +    case 8: writeq(x__, p); break;                      \
> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +    x__;                                                \
> +})
> +
> +#define add_sized(p, x)                                 \
> +({                                                      \
> +    typeof(*(p)) x__ = (x);                             \

... here?

> +    switch ( sizeof(*(p)) )                             \
> +    {                                                   \
> +    case 1: writeb(read_atomic(p) + x__, p); break;     \
> +    case 2: writew(read_atomic(p) + x__, p); break;     \
> +    case 4: writel(read_atomic(p) + x__, p); break;     \
> +    case 8: writeq(read_atomic(p) + x__, p); break;     \
> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +})
> +
> +#define __atomic_acquire_fence() \
> +    asm volatile ( RISCV_ACQUIRE_BARRIER "" ::: "memory" )
> +
> +#define __atomic_release_fence() \
> +    asm volatile ( RISCV_RELEASE_BARRIER "" ::: "memory" )
> +
> +/*
> + * First, the atomic ops that have no ordering constraints and therefor don't
> + * have the AQ or RL bits set.  These don't return anything, so there's only
> + * one version to worry about.
> + */
> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)  \
> +static inline                                               \
> +void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
> +{                                                           \
> +    asm volatile (                                          \
> +        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
> +        : "+A" (v->counter)                                 \
> +        : "r" (I)                                           \

Btw, I consider this pretty confusing. At the 1st and 2nd glance this
looks like a mistake, i.e. as if i was meant. Imo ...

> +        : "memory" );                                       \
> +}                                                           \
> +
> +/*
> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
> + * last argument for ATOMIC_OP isn't used.
> + */
> +#define ATOMIC_OPS(op, asm_op, I)                           \
> +        ATOMIC_OP (op, asm_op, I, w, int,   )
> +
> +ATOMIC_OPS(add, add,  i)
> +ATOMIC_OPS(sub, add, -i)
> +ATOMIC_OPS(and, and,  i)
> +ATOMIC_OPS( or,  or,  i)
> +ATOMIC_OPS(xor, xor,  i)

... here you want to only pass the (unary) operator (and leaving that blank
is as fine as using +).

> +#undef ATOMIC_OP
> +#undef ATOMIC_OPS
> +
> +#include <asm-generic/atomic-ops.h>
> +
> +/*
> + * Atomic ops that have ordered, relaxed, acquire, and release variants.

Only the first is implemented afaict; imo the comment would better reflect
that one way or another.

> + * There's two flavors of these: the arithmatic ops have both fetch and return
> + * versions, while the logical ops only have fetch versions.
> + */
> +#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)    \
> +static inline                                                       \
> +c_type atomic##prefix##_fetch_##op##_relaxed(c_type i,              \
> +                         atomic##prefix##_t *v)                     \
> +{                                                                   \
> +    register c_type ret;                                            \
> +    asm volatile (                                                  \
> +        "   amo" #asm_op "." #asm_type " %1, %2, %0"                \
> +        : "+A" (v->counter), "=r" (ret)                             \
> +        : "r" (I)                                                   \
> +        : "memory" );                                               \
> +    return ret;                                                     \
> +}                                                                   \

Actually a relaxed form is provided here, but does that have any user?

> +static inline                                                       \
> +c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v) \
> +{                                                                   \
> +    register c_type ret;                                            \
> +    asm volatile (                                                  \
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

I (or whatever the replacement expression is going to be following the
earlier comment) wants parenthesizing here.

> +}
> +
> +/*
> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
> + * last argument of ATOMIC_FETCH_OP, ATOMIC_OP_RETURN isn't used.
> + */
> +#define ATOMIC_OPS(op, asm_op, c_op, I)                                 \
> +        ATOMIC_FETCH_OP( op, asm_op,       I, w, int,   )               \
> +        ATOMIC_OP_RETURN(op, asm_op, c_op, I, w, int,   )
> +
> +ATOMIC_OPS(add, add, +,  i)
> +ATOMIC_OPS(sub, add, +, -i)
> +
> +#undef ATOMIC_OPS
> +
> +#define ATOMIC_OPS(op, asm_op, I) \
> +        ATOMIC_FETCH_OP(op, asm_op, I, w, int,   )
> +
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
> +    asm volatile (
> +        "0: lr.w     %[p],  %[c]\n"
> +        "   beq      %[p],  %[u], 1f\n"
> +        "   add      %[rc], %[p], %[a]\n"
> +        "   sc.w.rl  %[rc], %[rc], %[c]\n"
> +        "   bnez     %[rc], 0b\n"
> +        RISCV_FULL_BARRIER

With this and no .aq on the load, why the .rl on the store?

> +        "1:\n"
> +        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
> +        : [a] "r" (a), [u] "r" (u)
> +        : "memory");
> +    return prev;
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
> +    return __xchg(&(v->counter), n, size);                      \

No need for the inner parentheses, just like ...

> +}                                                               \
> +static inline                                                   \
> +c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
> +{                                                               \
> +    return __cmpxchg(&v->counter, o, n, size);                  \

... you have it here.

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
> +    asm volatile (
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

This probably would be nicer if sitting next to atomic_add_unless().

> --- /dev/null
> +++ b/xen/include/asm-generic/atomic-ops.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The header provides default implementations for every xen/atomic.h-provided
> + * forward inline declaration that can be synthesized from other atomic
> + * functions.

Or from scratch, as e.g. ...

> + */
> +#ifndef _ASM_GENERIC_ATOMIC_OPS_H_
> +#define _ASM_GENERIC_ATOMIC_OPS_H_
> +
> +#include <xen/atomic.h>
> +#include <xen/lib.h>
> +
> +#ifndef ATOMIC_READ
> +static inline int atomic_read(const atomic_t *v)
> +{
> +    return ACCESS_ONCE(v->counter);
> +}
> +#endif
> +
> +#ifndef _ATOMIC_READ
> +static inline int _atomic_read(atomic_t v)
> +{
> +    return v.counter;
> +}
> +#endif
> +
> +#ifndef ATOMIC_SET
> +static inline void atomic_set(atomic_t *v, int i)
> +{
> +    ACCESS_ONCE(v->counter) = i;
> +}
> +#endif
> +
> +#ifndef _ATOMIC_SET
> +static inline void _atomic_set(atomic_t *v, int i)
> +{
> +    v->counter = i;
> +}
> +#endif

... all of these.

> +#ifndef ATOMIC_SUB_AND_TEST
> +static inline int atomic_sub_and_test(int i, atomic_t *v)
> +{
> +    return atomic_sub_return(i, v) == 0;
> +}
> +#endif
> +
> +#ifndef ATOMIC_INC
> +static inline void atomic_inc(atomic_t *v)
> +{
> +    atomic_add(1, v);
> +}
> +#endif
> +
> +#ifndef ATOMIC_INC_RETURN
> +static inline int atomic_inc_return(atomic_t *v)
> +{
> +    return atomic_add_return(1, v);
> +}
> +#endif
> +
> +#ifndef ATOMIC_DEC
> +static inline void atomic_dec(atomic_t *v)
> +{
> +    atomic_sub(1, v);
> +}
> +#endif
> +
> +#ifndef ATOMIC_DEC_RETURN
> +static inline int atomic_dec_return(atomic_t *v)
> +{
> +    return atomic_sub_return(1, v);
> +}
> +#endif
> +
> +#ifndef ATOMIC_DEC_AND_TEST
> +static inline int atomic_dec_and_test(atomic_t *v)
> +{
> +    return atomic_sub_return(1, v) == 0;
> +}
> +#endif
> +
> +#ifndef ATOMIC_ADD_NEGATIVE
> +static inline int atomic_add_negative(int i, atomic_t *v)
> +{
> +    return atomic_add_return(i, v) < 0;
> +}
> +#endif
> +
> +#ifndef ATOMIC_INC_AND_TEST
> +static inline int atomic_inc_and_test(atomic_t *v)
> +{
> +    return atomic_add_return(1, v) == 0;
> +}
> +#endif

Can this be moved up a little, perhaps next to the other inc-s (or else
next to dec_and_test), please?

Jan

