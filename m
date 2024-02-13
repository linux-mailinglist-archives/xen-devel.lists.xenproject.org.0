Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B59852E1C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 11:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679836.1057552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZqAb-0004ze-60; Tue, 13 Feb 2024 10:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679836.1057552; Tue, 13 Feb 2024 10:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZqAb-0004wS-2q; Tue, 13 Feb 2024 10:37:45 +0000
Received: by outflank-mailman (input) for mailman id 679836;
 Tue, 13 Feb 2024 10:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZqAZ-0004wM-E8
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 10:37:43 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e99cd0ed-ca5b-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 11:37:40 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2652101f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 02:37:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d66c6000000b00337d5cd0d8asm9147439wrw.90.2024.02.13.02.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 02:37:39 -0800 (PST)
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
X-Inumbo-ID: e99cd0ed-ca5b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707820660; x=1708425460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EN1HYj0UUp3SXtRVAvgiI8RUuy9KS8jyzA8NlNUJeUE=;
        b=ZPmRvx/aCYY/lbdb+ez/nTyR6pjcKiIiqw9nNpAHem/MklUSDd+DEkcCP4OIWpVyuA
         Wxacn0Rr06DiS30TZyZu/r0Qfv4PHpPrKYK8ohORwKn5Rxxw35GclZwitn4pp1dSeQBv
         Ov5Qw+RWhYqmsYgvQsh7QPE41o5MRza44ix0PtPHX9/Vm7GtnJRD0FYEaTrTaUhGIHVP
         YbQZtkv78o0FUKpMs0QNNnxT/2i6NUP//ufaU9fs+FvHOw+6HoY/24fjFAVHjP5dCSJQ
         DNp7Z8RL0qIvzTSl8hWOQDEYzvgkoBh5qpRGLJtx1JrriN00GYEN1WfCVFDZ6OIIsAAZ
         g+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820660; x=1708425460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EN1HYj0UUp3SXtRVAvgiI8RUuy9KS8jyzA8NlNUJeUE=;
        b=sdUoq1O6RuOLufJMPyfaHqimIL7nO2pG6BA6O1pCGLOy75Tux54HlP+jmYqeIfj9aO
         jlYFcYlPGhb09/SXmTJVUCXPv/MKKBv/iN2funVXTUoArML2WyKLpoQAGpZd0UFedvZS
         sSI+lwmiFHQPTG0X4gDxrTGh6SozVw2fexK3bT89Z6K4LauQ6sm458KNYiG3x8ToJYTi
         Mj4xXB9hK7LKrjpXA2CApugxO0dkhXft+1ii3tFnzwAobgmU8jd45JQqdEWYi/GFjYfV
         B0zlwLhrPRBzehIk8e0Xk/RcbzLaYuSu6s11vuQEx/X6HF+cesubs0peNmhgtMCx8Hx7
         AupQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE7P5v7DAFXf7JO10u/lU/I+LzTBvytNBWtGffmCxqJybzYsFsrO6zrQUY4M7USxtVtHBf+SJ6qarBylei/mh49kujyqgwZdY8oXsHRyo=
X-Gm-Message-State: AOJu0YzsRXEqyMUc9PtHlfeOrTCKZUdI87EMMyA0hxomILs+2Hv70XXW
	9+dszNDcIf50Ksaqjjr+KjF5Sa70rqdCREaEK0nxZ1DoeIuSUhskP994mij+Tg==
X-Google-Smtp-Source: AGHT+IFyOyLTzs7H6GCMbIvO7pJX3sch+i0SKAU/kb0VQlej+IDBZLbuZurg1XeS+kkfW7XdjctoZg==
X-Received: by 2002:a5d:6382:0:b0:33b:1fda:5226 with SMTP id p2-20020a5d6382000000b0033b1fda5226mr6696231wru.38.1707820660018;
        Tue, 13 Feb 2024 02:37:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2o2muSE/byK9n1YDKqsKUbcB9vqVK39ZWJR2OIjJToIh44JI1FWVBANZvJY9Qvfhty21RNDtJOUv9W/TJzphj98zHmWhc3wbLbK3ipXetVn4vu8PMeoBAYADhmyRAUhrxOanTL0dSl42cCl8gBicn2axNR95o1sIkaJ6bx5kr9bLA5tovGXPnDISofc9PTmEwiSP/N7jDZ8MBtP2mj84pySEmk5ZasfqV1zmE8nSoHrHfeVZ1iDTRWDYIMmioXYkt6062OIdGzZEzgJwEGaFRjcl/jJSSJPFwH5e+Lo1XHu/aquZx83w=
Message-ID: <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
Date: Tue, 13 Feb 2024 11:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,237 @@
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
> +#define ALIGN_DOWN(addr, size)  ((addr) & (~((size) - 1)))

This feels risky: Consider what happens when someone passes 2U as 2nd argument.
The cheapest adjustment to make would be to use 1UL in the expression.

> +#define __amoswap_generic(ptr, new, ret, sfx, release_barrier, acquire_barrier) \
> +({ \
> +    asm volatile( \
> +        release_barrier \
> +        " amoswap" sfx " %0, %2, %1\n" \

While I won't insist, the revision log says \n were dropped from asm()
where not needed. A separator is needed here only if ...

> +        acquire_barrier \

... this isn't blank. Which imo suggests that the separator should be
part of the argument passed in. But yes, one can view this differently,
hence why I said I won't insist.

As to the naming of the two  - I'd generally suggest to make as litte
implications as possible: It doesn't really matter here whether it's
acquire or release; that matters at the use sites. What matters here
is that one is a "pre" barrier and the other is a "post" one.

> +        : "=r" (ret), "+A" (*ptr) \
> +        : "r" (new) \
> +        : "memory" ); \
> +})
> +
> +#define emulate_xchg_1_2(ptr, new, ret, release_barrier, acquire_barrier) \
> +({ \
> +    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned long)ptr, 4); \

You now appear to assume that this macro is only used with inputs not
crossing word boundaries. That's okay as long as suitably guaranteed
at the use sites, but imo wants saying in a comment.

> +    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr))) * BITS_PER_BYTE; \

Why 0x8 (i.e. spanning 64 bits), not 4 (matching the uint32_t use
above)?

> +    uint8_t mask_size = sizeof(*ptr) * BITS_PER_BYTE; \
> +    uint8_t mask_h = mask_l + mask_size - 1; \
> +    unsigned long mask = GENMASK(mask_h, mask_l); \

Personally I find this confusing, naming-wise: GENMASK() takes bit
positions as inputs, not masks. (Initially, because of this, I
thought the calculations all can't be quite right.)

> +    unsigned long new_ = (unsigned long)(new) << mask_l; \
> +    unsigned long ret_; \
> +    unsigned long rc; \

Similarly, why unsigned long here?

I also wonder about the mix of underscore suffixed (or not) variable
names here.

> +    \
> +    asm volatile( \

Nit: Missing blank before opening parenthesis.

> +        release_barrier \
> +        "0: lr.d %0, %2\n" \

Even here it's an 8-byte access. Even if - didn't check - the insn was
okay to use with just a 4-byte aligned pointer, wouldn't it make sense
then to 8-byte align it, and be consistent throughout this macro wrt
the base unit acted upon? Alternatively, why not use lr.w here, thus
reducing possible collisions between multiple CPUs accessing the same
cache line?

> +        "   and  %1, %0, %z4\n" \
> +        "   or   %1, %1, %z3\n" \
> +        "   sc.d %1, %1, %2\n" \
> +        "   bnez %1, 0b\n" \
> +        acquire_barrier \
> +        : "=&r" (ret_), "=&r" (rc), "+A" (*ptr_32b_aligned) \
> +        : "rJ" (new_), "rJ" (~mask) \

I think that as soon as there are more than 2 or maybe 3 operands,
legibility is vastly improved by using named asm() operands.

> +        : "memory"); \

Nit: Missing blank before closing parenthesis.

> +    \
> +    ret = (__typeof__(*(ptr)))((ret_ & mask) >> mask_l); \
> +})

Why does "ret" need to be a macro argument? If you had only the
expression here, not the the assigment, ...

> +#define __xchg_generic(ptr, new, size, sfx, release_barrier, acquire_barrier) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \

Is this local variable really needed? Can't you use "ptr" directly
in the three macro invocations?

> +    __typeof__(*(ptr)) new__ = (new); \
> +    __typeof__(*(ptr)) ret__; \
> +    switch (size) \
> +    { \
> +    case 1: \
> +    case 2: \
> +        emulate_xchg_1_2(ptr__, new__, ret__, release_barrier, acquire_barrier); \

... this would become

        ret__ = emulate_xchg_1_2(ptr__, new__, release_barrier, acquire_barrier); \

But, unlike assumed above, there's no enforcement here that a 2-byte
quantity won't cross a word, double-word, cache line, or even page
boundary. That might be okay if then the code would simply crash (like
the AMO insns emitted further down would), but aiui silent misbehavior
would result.

Also nit: The switch() higher up is (still/again) missing blanks.

> +        break; \
> +    case 4: \
> +        __amoswap_generic(ptr__, new__, ret__,\
> +                          ".w" sfx,  release_barrier, acquire_barrier); \
> +        break; \
> +    case 8: \
> +        __amoswap_generic(ptr__, new__, ret__,\
> +                          ".d" sfx,  release_barrier, acquire_barrier); \
> +        break; \
> +    default: \
> +        STATIC_ASSERT_UNREACHABLE(); \
> +    } \
> +    ret__; \
> +})
> +
> +#define xchg_relaxed(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), "", "", ""); \
> +})
> +
> +#define xchg_acquire(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), \
> +                                       "", "", RISCV_ACQUIRE_BARRIER); \
> +})
> +
> +#define xchg_release(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)),\
> +                                       "", RISCV_RELEASE_BARRIER, ""); \
> +})
> +
> +#define xchg(ptr,x) \
> +({ \
> +    __typeof__(*(ptr)) ret__; \
> +    ret__ = (__typeof__(*(ptr))) \
> +            __xchg_generic(ptr, (unsigned long)(x), sizeof(*(ptr)), \
> +                           ".aqrl", "", ""); \

The .aqrl doesn't look to affect the (emulated) 1- and 2-byte cases.

Further, amoswap also exists in release-only and acquire-only forms.
Why do you prefer explicit barrier insns over those? (Looks to
similarly apply to the emulation path as well as to the cmpxchg
machinery then, as both lr and sc also come in all four possible
acquire/release forms. Perhaps for the emulation path using
explicit barriers is better, in case the acquire/release forms of
lr/sc - being used inside the loop - might perform worse.)

> +    ret__; \
> +})
> +
> +#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx, release_barrier, acquire_barrier)	\
> + ({ \
> +    register unsigned int rc; \
> +    asm volatile( \
> +        release_barrier \
> +        "0: lr" lr_sfx " %0, %2\n" \
> +        "   bne  %0, %z3, 1f\n" \
> +        "   sc" sc_sfx " %1, %z4, %2\n" \
> +        "   bnez %1, 0b\n" \
> +        acquire_barrier \
> +        "1:\n" \
> +        : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
> +        : "rJ" (old), "rJ" (new) \
> +        : "memory"); \
> + })
> +
> +#define emulate_cmpxchg_1_2(ptr, old, new, ret, sc_sfx, release_barrier, acquire_barrier) \
> +({ \
> +    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned long)ptr, 4); \
> +    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr))) * BITS_PER_BYTE; \
> +    uint8_t mask_size = sizeof(*ptr) * BITS_PER_BYTE; \
> +    uint8_t mask_h = mask_l + mask_size - 1; \
> +    unsigned long mask = GENMASK(mask_h, mask_l); \
> +    unsigned long old_ = (unsigned long)(old) << mask_l; \
> +    unsigned long new_ = (unsigned long)(new) << mask_l; \
> +    unsigned long ret_; \
> +    unsigned long rc; \
> +    \
> +    __asm__ __volatile__ ( \
> +        release_barrier \
> +        "0: lr.d %0, %2\n" \
> +        "   and  %1, %0, %z5\n" \
> +        "   bne  %1, %z3, 1f\n" \
> +        "   and  %1, %0, %z6\n" \

Isn't this equivalent to

        "   xor  %1, %1, %0\n" \

this eliminating one (likely register) input?

Furthermore with the above and ...

> +        "   or   %1, %1, %z4\n" \
> +        "   sc.d" sc_sfx " %1, %1, %2\n" \
> +        "   bnez %1, 0b\n" \

... this re-written to

        "   xor  %0, %1, %0\n" \
        "   or   %0, %0, %z4\n" \
        "   sc.d" sc_sfx " %0, %0, %2\n" \
        "   bnez %0, 0b\n" \

you'd then no longer clobber the ret_ & mask you've already calculated
in %1, so ...

> +        acquire_barrier \
> +        "1:\n" \
> +        : "=&r" (ret_), "=&r" (rc), "+A" (*ptr_32b_aligned) \
> +        : "rJ" (old_), "rJ" (new_), \
> +          "rJ" (mask), "rJ" (~mask) \
> +        : "memory"); \
> +    \
> +    ret = (__typeof__(*(ptr)))((ret_ & mask) >> mask_l); \

... you could use rc here. (Of course variable naming or use then may
want changing, assuming I understand why "rc" is named the way it is.)

> +})
> +
> +/*
> + * Atomic compare and exchange.  Compare OLD with MEM, if identical,
> + * store NEW in MEM.  Return the initial value in MEM.  Success is
> + * indicated by comparing RETURN with OLD.
> + */
> +#define __cmpxchg_generic(ptr, old, new, size, sc_sfx, release_barrier, acquire_barrier) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \
> +    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
> +    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \
> +    __typeof__(*(ptr)) ret__; \
> +    switch (size) \
> +    { \
> +    case 1: \
> +    case 2: \
> +        emulate_cmpxchg_1_2(ptr, old, new, ret__,\
> +                            sc_sfx, release_barrier, acquire_barrier); \
> +        break; \
> +    case 4: \
> +        __generic_cmpxchg(ptr__, old__, new__, ret__, \
> +                          ".w", ".w"sc_sfx, release_barrier, acquire_barrier); \
> +        break; \
> +    case 8: \
> +        __generic_cmpxchg(ptr__, old__, new__, ret__, \
> +                          ".d", ".d"sc_sfx, release_barrier, acquire_barrier); \
> +        break; \
> +    default: \
> +        STATIC_ASSERT_UNREACHABLE(); \
> +    } \
> +    ret__; \
> +})
> +
> +#define cmpxchg_relaxed(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) o_ = (o); \
> +    __typeof__(*(ptr)) n_ = (n); \
> +    (__typeof__(*(ptr)))__cmpxchg_generic(ptr, \
> +                    o_, n_, sizeof(*(ptr)), "", "", ""); \
> +})
> +
> +#define cmpxchg_acquire(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) o_ = (o); \
> +    __typeof__(*(ptr)) n_ = (n); \
> +    (__typeof__(*(ptr)))__cmpxchg_generic(ptr, o_, n_, sizeof(*(ptr)), \
> +                                          "", "", RISCV_ACQUIRE_BARRIER); \
> +})
> +
> +#define cmpxchg_release(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) o_ = (o); \
> +    __typeof__(*(ptr)) n_ = (n); \
> +    (__typeof__(*(ptr)))__cmpxchg_release(ptr, o_, n_, sizeof(*(ptr)), \
> +                                          "", RISCV_RELEASE_BARRIER, ""); \
> +})
> +
> +#define cmpxchg(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) ret__; \
> +    ret__ = (__typeof__(*(ptr))) \
> +            __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
> +                              sizeof(*(ptr)), ".rl", "", " fence rw, rw\n"); \

No RISCV_..._BARRIER for use here and ...

> +    ret__; \
> +})
> +
> +#define __cmpxchg(ptr, o, n, s) \
> +({ \
> +    __typeof__(*(ptr)) ret__; \
> +    ret__ = (__typeof__(*(ptr))) \
> +            __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
> +                              s, ".rl", "", " fence rw, rw\n"); \

... here? And anyway, wouldn't it make sense to have

#define cmpxchg(ptr, o, n) __cmpxchg(ptr, o, n, sizeof(*(ptr))

to limit redundancy?

Plus wouldn't

#define __cmpxchg(ptr, o, n, s) \
    ((__typeof__(*(ptr))) \
     __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
                       s, ".rl", "", " fence rw, rw\n"))

be shorter and thus easier to follow as well? As I notice only now,
this would apparently apply further up as well.

Jan

