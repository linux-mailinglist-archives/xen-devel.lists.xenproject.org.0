Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7908836A72
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 17:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670019.1042579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRx9I-0005eK-1g; Mon, 22 Jan 2024 16:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670019.1042579; Mon, 22 Jan 2024 16:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRx9H-0005cj-VE; Mon, 22 Jan 2024 16:27:47 +0000
Received: by outflank-mailman (input) for mailman id 670019;
 Mon, 22 Jan 2024 16:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRx9F-0005cZ-Sc
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 16:27:45 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b10c012-b943-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 17:27:43 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so43706771fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 08:27:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ds11-20020a056638284b00b0046ebd521561sm2305440jab.41.2024.01.22.08.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 08:27:42 -0800 (PST)
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
X-Inumbo-ID: 2b10c012-b943-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705940863; x=1706545663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbO6XI0O7nDBZSphJ0CiEP2A+ycKfNSk0yFkAJE58hA=;
        b=UGOxTwYP+mlIILlAdI6msmCDH3Kqa0R/paEDLIMODni9uNi7GfsJO6dHAUMmJdXryu
         6gtjBtdaWeVgmpreYqR+4rAjLg2x6ym9yrc/LLk5h+4ngiRRtYYj2DgUPUSwMVzold3k
         5MIEj5T27DRrGhH3bjrDX4DSV5moBhgo0OTEVJYtNG4j3cL4N8Bd59jxeiSfgOzmb/aY
         gp8KaM7WJ3OudbDd4k4hl/hNpgbc1VtzHzSCtOBCzr1cxHlCrIBB9YabD/5JyAIcHr7B
         mAEdNhC/q5tfmN1+ZvDbZvAguhTcLf/TFQR0mNkRc8GPjimOhRo3D5hGU3ZXbmbImDO5
         kh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705940863; x=1706545663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbO6XI0O7nDBZSphJ0CiEP2A+ycKfNSk0yFkAJE58hA=;
        b=IFAUfnU1QJwOcE7pUanYszAVSkw2spu58Qnd8htr8rcw78p2BCXh9JEWC3EaHiQuQE
         bPblT/A6K4z7pQdpOz99fFM/CwJ0MdhpGDJHOr5n1e0ylUMJbAgaGctfODfhmolknzqj
         WF8MgCTaWsZYWOPj00G15XQD/7aTiKt/HYY61a62RADPICyM+lJHCcMDJCKEUwOgqWSw
         W+sLM799cmOwUzzrOHj6Ucnmyb6kj5Gyz+XUTs16lwCyuO466vQ5ja2mUE9wSy+MUSM7
         hREPSVyYlBsb6Vkw0ACm9rpU+d6y4DthGIxa6IYsY9wv63wDXPpf0y7Ozi/MDqxe+Kkt
         /8GQ==
X-Gm-Message-State: AOJu0YxYL077UInr7Qu/m8uz+wTQ/pgd6LBLkJMn8zLSp3shWpIA8Fo7
	4i+37ssFOgtMM30Bnd93dY4q54XCnUWKxq0bqr4PMKUQ+mQHewPmveWuW2+paA==
X-Google-Smtp-Source: AGHT+IFdKjrHP6SNj6Oxg4Kvx/9LSyPFQZVVNgrhhfwvzpGf1KXcbbxz0JYcaxX6qm+RncSNXkqKCg==
X-Received: by 2002:a2e:9e45:0:b0:2cc:9cf1:aec2 with SMTP id g5-20020a2e9e45000000b002cc9cf1aec2mr1945615ljk.24.1705940862692;
        Mon, 22 Jan 2024 08:27:42 -0800 (PST)
Message-ID: <8ee35a76-f3ef-4143-93ef-8e6089f82a80@suse.com>
Date: Mon, 22 Jan 2024 17:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,496 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2014 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_CMPXCHG_H
> +#define _ASM_RISCV_CMPXCHG_H
> +
> +#include <xen/compiler.h>
> +#include <xen/lib.h>
> +
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +#define __xchg_relaxed(ptr, new, size) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \
> +    __typeof__(new) new__ = (new); \
> +    __typeof__(*(ptr)) ret__; \

I expect the types of new and *ptr want to actually match. Which
you then want to enforce, so that issues at use sites would either
be reported by the compiler, or be permitted by a type conversion
of new.

> +    switch (size) \
> +	{ \

Nit: Hard tab left here. (Also again you want to either stick to
Linux style or fully switch to Xen style.)

> +    case 4: \
> +        asm volatile( \
> +            "	amoswap.w %0, %2, %1\n" \

I don't think a leading tab (or leading whitespace in general) is
needed in single-line-output asm()s. The trailing \n also isn't
needed if I'm not mistaken.

> +            : "=r" (ret__), "+A" (*ptr__) \
> +            : "r" (new__) \
> +            : "memory" ); \
> +        break; \
> +    case 8: \
> +        asm volatile( \
> +            "	amoswap.d %0, %2, %1\n" \
> +            : "=r" (ret__), "+A" (*ptr__) \
> +            : "r" (new__) \
> +            : "memory" ); \
> +        break; \
> +    default: \
> +        ASSERT_UNREACHABLE(); \

If at all possible this wants to trigger a build failure, not a runtime
one.

> +    } \
> +    ret__; \
> +})
> +
> +#define xchg_relaxed(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr))) __xchg_relaxed((ptr), x_, sizeof(*(ptr))); \

Nit: Stray blank after cast. For readability I'd also suggest to
drop parentheses in cases like the first argument passed to
__xchg_relaxed() here.

> +})

For both: What does "relaxed" describe? I'm asking because it's not
really clear whether the memory clobbers are actually needed.

> +#define __xchg_acquire(ptr, new, size) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \
> +    __typeof__(new) new__ = (new); \
> +    __typeof__(*(ptr)) ret__; \
> +    switch (size) \
> +	{ \
> +    case 4: \
> +        asm volatile( \
> +            "	amoswap.w %0, %2, %1\n" \
> +            RISCV_ACQUIRE_BARRIER \
> +            : "=r" (ret__), "+A" (*ptr__) \
> +            : "r" (new__) \
> +            : "memory" ); \
> +        break; \
> +    case 8: \
> +        asm volatile( \
> +            "	amoswap.d %0, %2, %1\n" \
> +            RISCV_ACQUIRE_BARRIER \
> +            : "=r" (ret__), "+A" (*ptr__) \
> +            : "r" (new__) \
> +            : "memory" ); \
> +        break; \
> +    default: \
> +        ASSERT_UNREACHABLE(); \
> +    } \
> +    ret__; \
> +})

If I'm not mistaken this differs from __xchg_relaxed() only in the use
of RISCV_ACQUIRE_BARRIER, and ...

> +#define xchg_acquire(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr))) __xchg_acquire((ptr), x_, sizeof(*(ptr))); \
> +})
> +
> +#define __xchg_release(ptr, new, size) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \
> +    __typeof__(new) new__ = (new); \
> +    __typeof__(*(ptr)) ret__; \
> +    switch (size) \
> +	{ \
> +    case 4: \
> +        asm volatile ( \
> +            RISCV_RELEASE_BARRIER \
> +            "	amoswap.w %0, %2, %1\n" \
> +            : "=r" (ret__), "+A" (*ptr__) \
> +            : "r" (new__) \
> +            : "memory"); \
> +        break; \
> +    case 8: \
> +        asm volatile ( \
> +            RISCV_RELEASE_BARRIER \
> +            "	amoswap.d %0, %2, %1\n" \
> +            : "=r" (ret__), "+A" (*ptr__) \
> +            : "r" (new__) \
> +            : "memory"); \
> +        break; \
> +    default: \
> +        ASSERT_UNREACHABLE(); \
> +    } \
> +    ret__; \
> +})

this only in the use of RISCV_RELEASE_BARRIER. If so they likely want
folding, to limit redundancy and make eventual updating easier. (Same
for the cmpxchg helper further down, as it seems.)

> +#define xchg_release(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr))) __xchg_release((ptr), x_, sizeof(*(ptr))); \
> +})
> +
> +static always_inline uint32_t __xchg_case_4(volatile uint32_t *ptr,
> +                                            uint32_t new)
> +{
> +    __typeof__(*(ptr)) ret;
> +
> +    asm volatile (
> +        "   amoswap.w.aqrl %0, %2, %1\n"
> +        : "=r" (ret), "+A" (*ptr)
> +        : "r" (new)
> +        : "memory" );
> +
> +    return ret;
> +}
> +
> +static always_inline uint64_t __xchg_case_8(volatile uint64_t *ptr,
> +                                            uint64_t new)
> +{
> +    __typeof__(*(ptr)) ret;
> +
> +    asm volatile( \
> +        "   amoswap.d.aqrl %0, %2, %1\n" \
> +        : "=r" (ret), "+A" (*ptr) \
> +        : "r" (new) \
> +        : "memory" ); \
> +
> +    return ret;
> +}
> +
> +static always_inline unsigned short __cmpxchg_case_2(volatile uint32_t *ptr,
> +                                                     uint32_t old,
> +                                                     uint32_t new);

Don't you consistently mean uint16_t here (incl the return type) and ...

> +static always_inline unsigned short __cmpxchg_case_1(volatile uint32_t *ptr,
> +                                                     uint32_t old,
> +                                                     uint32_t new);

... uint8_t here?

> +static inline unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
> +{
> +    switch (size) {
> +    case 1:
> +        return __cmpxchg_case_1(ptr, (uint32_t)-1, x);
> +    case 2:
> +        return __cmpxchg_case_2(ptr, (uint32_t)-1, x);

How are these going to work? You'll compare against ~0, and if the value
in memory isn't ~0, memory won't be updated; you will only (correctly)
return the value found in memory.

Or wait - looking at __cmpxchg_case_{1,2}() far further down, you ignore
"old" there. Which apparently means they'll work for the use here, but
not for the use in __cmpxchg().

> +    case 4:
> +        return __xchg_case_4(ptr, x);
> +    case 8:
> +        return __xchg_case_8(ptr, x);
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +
> +    return -1;
> +}
> +
> +#define xchg(ptr,x) \
> +({ \
> +    __typeof__(*(ptr)) ret__; \
> +    ret__ = (__typeof__(*(ptr))) \
> +            __xchg((ptr), (unsigned long)(x), sizeof(*(ptr))); \
> +    ret__; \
> +})
> +
> +#define xchg32(ptr, x) \
> +({ \
> +    BUILD_BUG_ON(sizeof(*(ptr)) != 4); \
> +    xchg((ptr), (x)); \
> +})
> +
> +#define xchg64(ptr, x) \
> +({ \
> +    BUILD_BUG_ON(sizeof(*(ptr)) != 8); \
> +    xchg((ptr), (x)); \
> +})

What are these two (and their cmpxchg counterparts) needed for?

> +/*
> + * Atomic compare and exchange.  Compare OLD with MEM, if identical,
> + * store NEW in MEM.  Return the initial value in MEM.  Success is
> + * indicated by comparing RETURN with OLD.
> + */
> +#define __cmpxchg_relaxed(ptr, old, new, size) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \
> +    __typeof__(*(ptr)) __old = (old); \

Leftover leading underscores?

> +    __typeof__(*(ptr)) new__ = (new); \

Related to my earlier comment on types needing to be compatible - see
how here you're using "ptr" throughout.

> +    __typeof__(*(ptr)) ret__; \
> +    register unsigned int __rc; \

More leftover leading underscores?

> +static always_inline unsigned short __cmpxchg_case_2(volatile uint32_t *ptr,
> +                                                     uint32_t old,
> +                                                     uint32_t new)
> +{
> +    (void) old;
> +
> +    if (((unsigned long)ptr & 3) == 3)
> +    {
> +#ifdef CONFIG_64BIT
> +        return __emulate_cmpxchg_case1_2((uint64_t *)ptr, new,
> +                                         readq, __cmpxchg_case_8, 0xffffU);

What if ((unsigned long)ptr & 7) == 7 (which is a sub-case of what the
if() above checks for? Isn't it more reasonable to require aligned
16-bit quantities here? Or if mis-aligned addresses are okay, you could
as well emulate using __cmpxchg_case_4().

Also you shouldn't be casting away volatile (here and below). Avoiding
the casts (by suitable using volatile void * parameter types) would
likely be best.

Jan

