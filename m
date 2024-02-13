Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9A852F9D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679855.1057592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZr5y-0006ZD-BZ; Tue, 13 Feb 2024 11:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679855.1057592; Tue, 13 Feb 2024 11:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZr5y-0006Vo-8O; Tue, 13 Feb 2024 11:37:02 +0000
Received: by outflank-mailman (input) for mailman id 679855;
 Tue, 13 Feb 2024 11:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZr5w-0005wr-O6
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:37:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32e71da8-ca64-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:36:59 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso14953925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:36:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0033aedaea1b2sm9357452wrm.30.2024.02.13.03.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:36:58 -0800 (PST)
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
X-Inumbo-ID: 32e71da8-ca64-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707824219; x=1708429019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8HVVCKdR2JQf6NX1jGQ1/KKxoyowqEyolTxOAblmNk=;
        b=EFdk5SHSdLeY4T8F8pjwINywM3Fq77AaDJ7xNXsRMYkdUt3tBPr/nDBSI+MzLPL+Uw
         Co7plS4WSHUzYWS/FeuYXLJpz8rHJ7nSOfrA7SIJR8+WLBdTSkGhXEdIFrrtZCCedPUo
         z8y2McT97aGtRQeSFVoKAyBitDTzI/vtHqp2roI4mLr7U9FoRs61jyabMNVGV3o+Mis6
         FS5pDL0lW607bGftxj8qs6ru8j0Ma/0a0RSeKCA9vkNwbefEhqk4o+avcYe7DHCEMHQk
         O24INN3Ak/I6AviJNM0jSC2evtNOLMNUICqCGSmuaKeTD/WGUqOgf1A7ZFZA80erM1gU
         jq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824219; x=1708429019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8HVVCKdR2JQf6NX1jGQ1/KKxoyowqEyolTxOAblmNk=;
        b=k4zPBmwmWeqigsFLauxfGot+DERfbetSaez4ftTRSDp5B3icYIIuF1t1rEPnc2zIbO
         hiLIuryY8tcQj3kCo7/vUn9bx7jUf0ov3fITGn9reOxP6QfNeMEuwoTMZPkni+x444F1
         o0EWEJKTbM0maKzMb+Dd/5i1Jmc+eyLyovp7YNC7wrbIYkNqhpOjpwovXxh4glQEXnUz
         Gc3sCh0rPTNcDvtRHuXPVjj1gXuxdvXH5MN7F1UbnfWVJF1TIGCVE/jPoqrfoPmbnVrE
         d98YHFVIIIAiQUsduPSqVtR34xg6DS94ZA3HBqdREwbFoaiBRvkuew00oTrHybrY/h8E
         ZDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnd0A86nl6z7iqj9iAF2u25gGmOLAOcwd4R+zjIOanTS9pYzvQ0pmB/5FBoKaajt2sIcwg3wunaMyH4qjKUE9LFETH6ukwmPErcmdrHXo=
X-Gm-Message-State: AOJu0YxU2rb9EgMSjYmksa6iA0RbgLLmfDMYgbSEa5zG20P9Wkwx7XgK
	Vi8yCBrgCcZX/ePM7sEucxmgH+3DbX/4Qui78SMlQmvh84JISz7vPPqZLOXGzA==
X-Google-Smtp-Source: AGHT+IEIhXSxrrgCus0ENH/r51WtOjRNxoISbc+g0Bv+dnXpqSJvu+KEDWUzn5JH3T41RG+guh020Q==
X-Received: by 2002:a05:600c:1d07:b0:410:cf4f:68e1 with SMTP id l7-20020a05600c1d0700b00410cf4f68e1mr4387021wms.2.1707824219045;
        Tue, 13 Feb 2024 03:36:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsRC6LTP5gVZDasTnIopEXjnB4sjt/oeJvEJ/4Yj55HsOmZkAro/1XFhO3AI967qv/RJlZUgDmkLnIShacMVWG29zJ2ujQI6owvTNYEZMuKk3SEfaJbf5HeQAqqct5KbNcBrrp5tyArfcDt0XyYJvhueCwid2ubeQNa9LOCjdsnD2ZG7/t1FA5LML+Kne72MFw4/EhJil14munIW7CZalpleJo7xozM7xmYJ6DcpIUuES3LNOP77u3w/1n1Z210XYcvOeHEcJCJQuWPyyeH7byKx1DOoZtOEAMQYiNi8W1rleQy3TGyGww
Message-ID: <134e09c9-776a-4261-a28b-137d109b62ef@suse.com>
Date: Tue, 13 Feb 2024 12:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/30] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> From: Bobby Eshleman <bobbyeshleman@gmail.com>
> 
> Additionally, this patch introduces macros in fence.h,
> which are utilized in atomic.h.

These are used in an earlier patch already, so either you want to
re-order the series, or you want to move that introduction ahead.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,395 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Taken and modified from Linux.
> + *
> + * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated to use
> + * __*xchg_generic()
> + * 
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2021 Vates SAS
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#include <xen/atomic.h>
> +#include <asm/cmpxchg.h>
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +void __bad_atomic_size(void);
> +
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

Why is it the MMIO primitives you use here, i.e. not read<X>_cpu()?
It's RAM you're accessing after all.

Also - no CONFIG_64BIT conditional here (like you have in the other
patch)?

> +    default: __bad_atomic_size(); break;
> +    }
> +}
> +
> +#define read_atomic(p) ({                               \
> +    union { typeof(*p) val; char c[0]; } x_;            \
> +    read_atomic_size(p, x_.c, sizeof(*p));              \

I'll be curious for how much longer gcc will tolerate this accessing
of a zero-length array, without issuing at least a warning. I'd
recommend using sizeof(*(p)) as the array dimension right away. (From
this not also the missing parentheses in what you have.)

> +    x_.val;                                             \
> +})
> +
> +#define write_atomic(p, x)                              \
> +({                                                      \
> +    typeof(*p) x__ = (x);                               \
> +    switch ( sizeof(*p) )                               \
> +    {                                                   \
> +    case 1: writeb((uint8_t)x__,  p); break;            \
> +    case 2: writew((uint16_t)x__, p); break;            \
> +    case 4: writel((uint32_t)x__, p); break;            \
> +    case 8: writeq((uint64_t)x__, p); break;            \

Are the casts actually necessary here?

> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +    x__;                                                \
> +})
> +
> +#define add_sized(p, x)                                 \
> +({                                                      \
> +    typeof(*(p)) x__ = (x);                             \
> +    switch ( sizeof(*(p)) )                             \
> +    {                                                   \
> +    case 1: writeb(read_atomic(p) + x__, p); break;     \
> +    case 2: writew(read_atomic(p) + x__, p); break;     \
> +    case 4: writel(read_atomic(p) + x__, p); break;     \
> +    default: __bad_atomic_size(); break;                \
> +    }                                                   \
> +})
> +
> +/*
> + *  __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
> + *               non-scalar types unchanged.
> + *
> + * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
> + * is not type-compatible with 'signed char', and we define a separate case.
> + */
> +#define __scalar_type_to_expr_cases(type)               \
> +    unsigned type:  (unsigned type)0,                   \
> +    signed type:    (signed type)0
> +
> +#define __unqual_scalar_typeof(x) typeof(               \
> +    _Generic((x),                                       \
> +        char:  (char)0,                                 \
> +        __scalar_type_to_expr_cases(char),              \
> +        __scalar_type_to_expr_cases(short),             \
> +        __scalar_type_to_expr_cases(int),               \
> +        __scalar_type_to_expr_cases(long),              \
> +        __scalar_type_to_expr_cases(long long),         \
> +        default: (x)))

This isn't RISC-V specific, is it? In which case it wants moving to,
perhaps, xen/macros.h (and then also have the leading underscores
dropped).

> +#define READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
> +#define WRITE_ONCE(x, val)                                      \
> +    do {                                                        \
> +        *(volatile typeof(x) *)&(x) = (val);                    \
> +    } while (0)

In Xen we use ACCESS_ONCE(); any reason you need to introduce
{READ,WRITE}_ONCE() in addition? Without them, __unqual_scalar_typeof()
may then also not be needed (or, if there's a need to enhance it, may
then be needed for ACCESS_ONCE()). Which in turn raises the question
why only READ_ONCE() uses it here.

> +#define __atomic_acquire_fence() \
> +    __asm__ __volatile__( RISCV_ACQUIRE_BARRIER "" ::: "memory" )

Missing blank here and ...

> +#define __atomic_release_fence() \
> +    __asm__ __volatile__( RISCV_RELEASE_BARRIER "" ::: "memory" );

... here, and stray semicolon additionally just here.

> +static inline int atomic_read(const atomic_t *v)
> +{
> +    return READ_ONCE(v->counter);
> +}
> +
> +static inline int _atomic_read(atomic_t v)
> +{
> +    return v.counter;
> +}
> +
> +static inline void atomic_set(atomic_t *v, int i)
> +{
> +    WRITE_ONCE(v->counter, i);
> +}
> +
> +static inline void _atomic_set(atomic_t *v, int i)
> +{
> +    v->counter = i;
> +}
> +
> +static inline int atomic_sub_and_test(int i, atomic_t *v)
> +{
> +    return atomic_sub_return(i, v) == 0;
> +}
> +
> +static inline void atomic_inc(atomic_t *v)
> +{
> +    atomic_add(1, v);
> +}
> +
> +static inline int atomic_inc_return(atomic_t *v)
> +{
> +    return atomic_add_return(1, v);
> +}
> +
> +static inline void atomic_dec(atomic_t *v)
> +{
> +    atomic_sub(1, v);
> +}
> +
> +static inline int atomic_dec_return(atomic_t *v)
> +{
> +    return atomic_sub_return(1, v);
> +}
> +
> +static inline int atomic_dec_and_test(atomic_t *v)
> +{
> +    return atomic_sub_return(1, v) == 0;
> +}
> +
> +static inline int atomic_add_negative(int i, atomic_t *v)
> +{
> +    return atomic_add_return(i, v) < 0;
> +}
> +
> +static inline int atomic_inc_and_test(atomic_t *v)
> +{
> +    return atomic_add_return(1, v) == 0;
> +}

None of these look RISC-V-specific. Perhaps worth having something in
asm-generic/ that can be utilized here?

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

So the last three parameters are to be ready to also support
atomic64, without actually doing so right now?

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

I'm somewhat confused by the comment: It first talks of 4 variants, but
then says there are only 2 (arithmetic) or 1 (logical) ones.

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
> +
> +ATOMIC_OPS(add, add, +,  i)
> +ATOMIC_OPS(sub, add, +, -i)
> +
> +#define atomic_add_return_relaxed   atomic_add_return_relaxed
> +#define atomic_sub_return_relaxed   atomic_sub_return_relaxed
> +#define atomic_add_return   atomic_add_return
> +#define atomic_sub_return   atomic_sub_return
> +
> +#define atomic_fetch_add_relaxed    atomic_fetch_add_relaxed
> +#define atomic_fetch_sub_relaxed    atomic_fetch_sub_relaxed
> +#define atomic_fetch_add    atomic_fetch_add
> +#define atomic_fetch_sub    atomic_fetch_sub

What are all of these #define-s (any yet more further down) about?

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
> +        : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> +        : [o]"r" (offset)

Nit: Blanks please between ] and ".

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fence.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_RISCV_FENCE_H
> +#define _ASM_RISCV_FENCE_H
> +
> +#define RISCV_ACQUIRE_BARRIER   "\tfence r , rw\n"
> +#define RISCV_RELEASE_BARRIER   "\tfence rw,  w\n"

Seeing that another "fence rw, rw" appears in this patch, I'm now pretty
sure you want to add e.g. RISCV_FULL_BARRIER here as well.

Jan

