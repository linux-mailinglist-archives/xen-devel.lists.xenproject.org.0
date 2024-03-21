Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED458858D8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 13:09:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696369.1087241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnHCw-0005AW-Aq; Thu, 21 Mar 2024 12:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696369.1087241; Thu, 21 Mar 2024 12:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnHCw-00058g-8G; Thu, 21 Mar 2024 12:07:42 +0000
Received: by outflank-mailman (input) for mailman id 696369;
 Thu, 21 Mar 2024 12:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnHCu-00058Z-Jc
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 12:07:40 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c8bf8e7-e77b-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 13:07:39 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56b85146589so1595086a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 05:07:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402194600b0056b98d7ba00sm2844903edz.90.2024.03.21.05.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 05:07:38 -0700 (PDT)
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
X-Inumbo-ID: 9c8bf8e7-e77b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711022858; x=1711627658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Naf6fdsrjhZmarDA1/mhVYCS6cRC/yYk4xwHbjtdDZ4=;
        b=Rpa+Jo1670mCGXho32ql0SDOtcjjw3ly3T0QTPzyAaANjy3xhZJ7Fw1E1k2KaNAU9Z
         MrHbMUd3YaSQ+P8lwyDA2qj4n3a5vuF3siAII2o425C8i670FB9PFIFTS88+8olBB3pd
         v4VuSYRxv2oblaNfhmSKRhMQl3UvQ7DaAHpw2t4IuPzmYLQQQUvU6v55+8oGw9IUyJ2F
         9G/gpieDP0sZP7TW3f8A3UvNnoEor0YXXFMTEXmOuRaiawMiPCCD5ChDdfmHRjW5C8/J
         vReESjLY3Nsur4uQ3vR1FFj1d7T2iAs+t/inep9RpgqfMVdzXxbag6lhGaUktuN5ZKxf
         le6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711022858; x=1711627658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Naf6fdsrjhZmarDA1/mhVYCS6cRC/yYk4xwHbjtdDZ4=;
        b=cRnpeyyVBSHztBRnJsesi5VAhlApEKDVDFCoWPtdFYiJv5Cm7OkitEYuL4rhvxyOGD
         aqgLw6eHPWxRgkdA2zxeuckjKAD+3vMxXOAMybZDp7C254DcU61dkRGqACHDBv2YZ853
         3tX5o65nGDTCx3DlUgpL6CClHVGeygVt4+cjLq82/j4Z4lLPOkKMGrCO9T0J29aV9kvx
         AQRa5mCVlUia6phN+WkwHpO3OtY9Hhji0nOYNJbJP7eieB18QANRuLGbDxPO1bxfMGF0
         C1Wp8C90imwOISM4X2HyYZt9xf1AK7LalYhG9Ss2e64du0lQV7I0SE7w4ktYmuCpN/8s
         hOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxHCxO6MJbYIx+pd8pVG+fUqhtyb/O5Atf4fcJmraD5cs5Cw0O9a3do87qQK6gFNA2z6DutaEMbECokdhaHGTd0yY/6pibh3CzcQvhCw0=
X-Gm-Message-State: AOJu0YxaW9El6H5tvlBTu5ohGR6/F3ENSqdWdKnhtcW7CRh7lSnFcXr7
	7lI7kH6Ote8QsuyCggOsZI1lqqXF+RXWqPHY4rDoZRsHVppmu0Az7M6rs6mWnQ==
X-Google-Smtp-Source: AGHT+IGfmMDdaDceIWPeliVXAqupSLgPxvm98nkBQRdKdWxinxewKZaH8SNjKdJ6kOA11LBzeMGX6g==
X-Received: by 2002:a05:6402:5409:b0:568:d143:dab2 with SMTP id ev9-20020a056402540900b00568d143dab2mr2054972edb.19.1711022858351;
        Thu, 21 Mar 2024 05:07:38 -0700 (PDT)
Message-ID: <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
Date: Thu, 21 Mar 2024 13:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> The header was taken from Linux kernl 6.4.0-rc1.
> 
> Addionally, were updated:
> * add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
>   access.
> * replace tabs with spaces
> * replace __* variale with *__
> * introduce generic version of xchg_* and cmpxchg_*.
> * drop {cmp}xchg{release,relaxed,acquire} as Xen doesn't use them

With this, ...

> * drop barries and use instruction suffixices instead ( .aq, .rl, .aqrl )
> 
> Implementation of 4- and 8-byte cases were updated according to the spec:
> ```
>               ....
> Linux Construct         RVWMO AMO Mapping
> atomic <op> relaxed     amo<op>.{w|d}
> atomic <op> acquire     amo<op>.{w|d}.aq
> atomic <op> release     amo<op>.{w|d}.rl
> atomic <op>             amo<op>.{w|d}.aqrl
> Linux Construct         RVWMO LR/SC Mapping
> atomic <op> relaxed     loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
> atomic <op> acquire     loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
> atomic <op> release     loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez loop OR
>                         fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ; bnez loop
> atomic <op>             loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez loop
> 
> Table A.5: Mappings from Linux memory primitives to RISC-V primitives
> 
> ```

... I consider quoting this table in full, without any further remarks, as
confusing: Three of the lines each are inapplicable now, aiui.

Further what are the two * telling us? Quite likely they aren't there just
accidentally.

Finally, why sc.{w|d}.aqrl when in principle one would expect just
sc.{w|d}.rl?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,209 @@
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
> +#define __amoswap_generic(ptr, new, ret, sfx) \

As before / elsewhere: Is there a strong need for two leading underscores
here? Using just one would already be standard compliant afaict.

> +({ \
> +    asm volatile ( \
> +        " amoswap" sfx " %0, %2, %1" \
> +        : "=r" (ret), "+A" (*ptr) \
> +        : "r" (new) \
> +        : "memory" ); \
> +})

This doesn't need the ({ }) (anymore?):

#define __amoswap_generic(ptr, new, ret, sfx) \
    asm volatile ( \
        " amoswap" sfx " %0, %2, %1" \
        : "=r" (ret), "+A" (*(ptr)) \
        : "r" (new) \
        : "memory" )

(note also the added parentheses).

> +/*
> + * For LR and SC, the A extension requires that the address held in rs1 be
> + * naturally aligned to the size of the operand (i.e., eight-byte aligned
> + * for 64-bit words and four-byte aligned for 32-bit words).
> + * If the address is not naturally aligned, an address-misaligned exception
> + * or an access-fault exception will be generated.
> + *
> + * Thereby:
> + * - for 1-byte xchg access the containing word by clearing low two bits
> + * - for 2-byte xchg ccess the containing word by clearing bit 1.

Nit: "access"

> + * If resulting 4-byte access is still misalgined, it will fault just as
> + * non-emulated 4-byte access would.
> + */
> +#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
> +({ \
> +    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*(ptr)))); \
> +    unsigned int new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*(ptr)))) * BITS_PER_BYTE; \

You parenthesize ptr here correctly, but not in the line above.

Instead of "_pos" in the name, maybe better "_bit"?

Finally, here and elsewhere, please limit line length to 80 chars. (Omitting
the 0x here would help a little, but not quite enough. Question is whether
these wouldn't better be sizeof(*aligned_ptr) anyway.)

> +    unsigned long mask = GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
> +    unsigned int new_ = new << new_val_pos; \

Similarly new wants parenthesizing here.

> +    unsigned int old; \
> +    unsigned int scratch; \
> +    \
> +    asm volatile ( \
> +        "0: lr.w" lr_sfx " %[old], %[aligned_ptr]\n" \
> +        "   and  %[scratch], %[old], %z[nmask]\n" \
> +        "   or   %[scratch], %[scratch], %z[new_]\n" \
> +        "   sc.w" sc_sfx " %[scratch], %[scratch], %[aligned_ptr]\n" \
> +        "   bnez %[scratch], 0b\n" \
> +        : [old] "=&r" (old), [scratch] "=&r" (scratch), [aligned_ptr] "+A" (*aligned_ptr) \

While for the variable name aligned_ptr is likely helpful, for the operand
name just ptr would certainly do?

> +        : [new_] "rJ" (new_), [nmask] "rJ" (~mask) \

Neither mask nor ~mask can be 0. Hence J here and the z modifier above
look pointless. (new_, otoh, can be 0, so allowing x0 to be used in that
case is certainly desirable.)

As to using ~mask here: Now that we look to have settled on requiring
Zbb, you could use andn instead of and, thus allowing the same register
to be used in the asm() and ...

> +        : "memory" ); \
> +    \
> +    (__typeof__(*(ptr)))((old & mask) >> new_val_pos); \

... for this calculation.

> +})
> +
> +static always_inline unsigned long __xchg(volatile void *ptr, unsigned long new, int size)
> +{
> +    unsigned long ret;
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        ret = emulate_xchg_1_2((volatile uint8_t *)ptr, new, ".aq", ".aqrl");
> +        break;
> +    case 2:
> +        ret = emulate_xchg_1_2((volatile uint16_t *)ptr, new, ".aq", ".aqrl");
> +        break;
> +    case 4:
> +        __amoswap_generic((volatile uint32_t *)ptr, new, ret, ".w.aqrl");
> +        break;
> +#ifndef CONFIG_32BIT

There's no 32BIT Kconfig symbol; all we have is a 64BIT one.

> +    case 8:
> +        __amoswap_generic((volatile uint64_t *)ptr, new, ret, ".d.aqrl");
> +        break;
> +#endif
> +    default:
> +        STATIC_ASSERT_UNREACHABLE();
> +    }
> +
> +    return ret;
> +}
> +
> +#define xchg(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) n_ = (x); \
> +    (__typeof__(*(ptr))) \
> +        __xchg((ptr), (unsigned long)(n_), sizeof(*(ptr))); \

Nit: While excess parentheses "only" harm readability, they would
nevertheless better be omitted (here: the first argument passed).

> +})
> +
> +#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx)	\
> + ({ \
> +    register unsigned int rc; \

Nit: We don't normally use "register", unless accompanied by asm() tying
a variable to a specific one.

> +    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
> +    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \

The casts aren't very nice to have here; I take they're needed for
cmpxchg_ptr() to compile?

> +    asm volatile( \

Nit: Missing blank once again. Would be really nice if you could go
through and sort this uniformly for the series.

> +        "0: lr" lr_sfx " %0, %2\n" \
> +        "   bne  %0, %z3, 1f\n" \
> +        "   sc" sc_sfx " %1, %z4, %2\n" \
> +        "   bnez %1, 0b\n" \
> +        "1:\n" \
> +        : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
> +        : "rJ" (old__), "rJ" (new__) \

Please could I talk you into using named operands here, too?

Also ptr here is lacking parentheses again.

> +        : "memory"); \

And yet another missing blank.

> + })

At the use site this construct having a normal return value (rather
than ret being passed in) would overall look more natural.

> +/*
> + * For LR and SC, the A extension requires that the address held in rs1 be
> + * naturally aligned to the size of the operand (i.e., eight-byte aligned
> + * for 64-bit words and four-byte aligned for 32-bit words).
> + * If the address is not naturally aligned, an address-misaligned exception
> + * or an access-fault exception will be generated.
> + *
> + * Thereby:
> + * - for 1-byte xchg access the containing word by clearing low two bits
> + * - for 2-byte xchg ccess the containing word by clearing first bit.
> + * 
> + * If resulting 4-byte access is still misalgined, it will fault just as
> + * non-emulated 4-byte access would.
> + *
> + * old_val was casted to unsigned long for cmpxchgptr()
> + */
> +#define emulate_cmpxchg_1_2(ptr, old, new, lr_sfx, sc_sfx) \
> +({ \
> +    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*(ptr)))); \
> +    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*(ptr)))) * BITS_PER_BYTE; \
> +    unsigned long mask = GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
> +    unsigned int old_ = old << new_val_pos; \
> +    unsigned int new_ = new << new_val_pos; \
> +    unsigned int old_val; \
> +    unsigned int scratch; \
> +    \
> +    __asm__ __volatile__ ( \
> +        "0: lr.w" lr_sfx " %[scratch], %[aligned_ptr]\n" \
> +        "   and  %[old_val], %[scratch], %z[mask]\n" \
> +        "   bne  %[old_val], %z[old_], 1f\n" \
> +        "   xor  %[scratch], %[old_val], %[scratch]\n" \

To be honest I was hoping this line would come with a brief comment.

> +        "   or   %[scratch], %[scratch], %z[new_]\n" \
> +        "   sc.w" sc_sfx " %[scratch], %[scratch], %[aligned_ptr]\n" \
> +        "   bnez %[scratch], 0b\n" \
> +        "1:\n" \
> +        : [old_val] "=&r" (old_val), [scratch] "=&r" (scratch), [aligned_ptr] "+A" (*aligned_ptr) \
> +        : [old_] "rJ" (old_), [new_] "rJ" (new_), \
> +          [mask] "rJ" (mask) \
> +        : "memory" ); \
> +    \
> +    (__typeof__(*(ptr)))((unsigned long)old_val >> new_val_pos); \
> +})

A few of the comments for emulate_xchg_1_2() apply here as well.

> +/*
> + * Atomic compare and exchange.  Compare OLD with MEM, if identical,
> + * store NEW in MEM.  Return the initial value in MEM.  Success is
> + * indicated by comparing RETURN with OLD.
> + */
> +static always_inline unsigned long __cmpxchg(volatile void *ptr,
> +                         unsigned long old,
> +                         unsigned long new,
> +                         int size)

Nit: Inappropriate indentation.

Jan

