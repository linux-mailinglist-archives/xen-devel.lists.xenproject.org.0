Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC6851890
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679671.1057256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYhB-000749-W2; Mon, 12 Feb 2024 15:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679671.1057256; Mon, 12 Feb 2024 15:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYhB-00071w-TJ; Mon, 12 Feb 2024 15:58:13 +0000
Received: by outflank-mailman (input) for mailman id 679671;
 Mon, 12 Feb 2024 15:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZYhB-00071p-CA
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:58:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8542707e-c9bf-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 16:58:10 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-410cb93185dso9300315e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:58:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f5-20020a5d58e5000000b0033b44456463sm7107513wrd.106.2024.02.12.07.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:58:09 -0800 (PST)
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
X-Inumbo-ID: 8542707e-c9bf-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707753490; x=1708358290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxyytBCybEJ9xwwyC0iUeDNb8txuTqOL2xSCNBB8rOo=;
        b=FbH9dB81LHPFuLjsandLrCc6xujj42xiZMRkt4PF2kL/rVYgovguWUP4lYWi5mis7C
         CobMyQyklcdblmL7gVtsTqK/MGjTmU+/WUFNwkBmPRDyQp6/HyDyXE8KZ51f7OLyDTzv
         AD0t+zvgvX2s0ueCOEuticJzOmXE2+UJFJ72B3s+yFEd7Oe30R4NrpEC6AdP9nfnO31a
         YnglSN7jQUIUnkM+Hnr+2AreWNxBSeLRLJqlE3LkO2CqQo7aERE0wQOxl/m1ZPEwg6CL
         VEPnEPSm+a4ixb5RI87r/bHiTRcyFJtk/gvHapzRShgGrBnZenTjg94TTIoT9kRxei13
         XERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753490; x=1708358290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxyytBCybEJ9xwwyC0iUeDNb8txuTqOL2xSCNBB8rOo=;
        b=nSA6cFSUvGC9CDKdzvXs9/ZR3ZUp64vEcMfcB4TneXMRf5IjF8J6PjAurWygwKi99T
         fMFB+ow4DAzvZ2KbjnJrm7iGrNKsQy0yvkB8qNs1Be0J12/CvZ/ob1XCs20xgkSf1pzF
         FOjW8ny3uf1z5qoZ1bvRsr8l5D09QDNT75YblP7p0ugF5Lj1/vc20jT3g4I/IjO+GqbM
         8V68vO0+7OG445VA+TGdIfpv5GP8f93XZkGn1gPRcKM42AqaOVUQTZ/v/gYCqb/W1D6r
         5oI9qfIszp+JwgLux509lphQ+EjLHZ23whynREGvn1fVYlgChXrpKwnGJNyZ93fsu3rt
         BcWQ==
X-Gm-Message-State: AOJu0Yz4n6xYK/UYp7YOuLa9uYBhgilkv4CAuLohN7YaBRJvsMh6O9TQ
	ywZ90N8gYV47UeSjuDVgsAzX0RUvtoZklcSuj77Zxe8gsrYd0pj+XQE65oxKUA==
X-Google-Smtp-Source: AGHT+IHWg0jS2UcCDrCg5lV5iPqpp0sgSYV32ELxcgnNGrp6LTvsrTyRgRJWA2idT/sw70wCNM6gkQ==
X-Received: by 2002:a5d:4485:0:b0:33b:3275:2721 with SMTP id j5-20020a5d4485000000b0033b32752721mr5470532wrq.40.1707753490091;
        Mon, 12 Feb 2024 07:58:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdtcBZyUzsTeFDiAuEO3DU+heyss5o3FtycotVQHvFBPKmDNKp+EB4Rr/blNR5hc8/SI///WNKG6XQxFoa8LzucGlfygFITNX5Ny4xXxK3ebQQ7ErmQ51QR5gd5rYBXWxDw2nrGD4zMfGVl4tHE2ltCvbBa8RZ4vq+54UeU2LIBx98qlJX1P4efLbUb4I/BUJrhxLyH+WBjZYdj47mL6RXQvNnDtjGIu7w9C4vnn+LAvpUWXFX5mR8M429qCQW/+Z5Y944xvmBJNDvzudB1lVW1jJUefRX9vW7ifoRgyJocQZsratqAkA=
Message-ID: <b13fd044-c6db-45ab-83d0-3d02221967ed@suse.com>
Date: Mon, 12 Feb 2024 16:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/30] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#include <asm-generic/bitops/bitops-bits.h>

Especially with ...

> +/* Based on linux/arch/include/linux/bits.h */
> +
> +#define BIT_MASK(nr)        (1UL << ((nr) % BITS_PER_LONG))
> +#define BIT_WORD(nr)        ((nr) / BITS_PER_LONG)

... these it's not entirely obvious why bitops-bits.h would be needed
here.

> +#define __set_bit(n,p)      set_bit(n,p)
> +#define __clear_bit(n,p)    clear_bit(n,p)

Nit (as before?): Missing blanks after commas.

> +/* Based on linux/arch/include/asm/bitops.h */
> +
> +#if ( BITS_PER_LONG == 64 )

Imo the parentheses here make things only harder to read.

> +#define __AMO(op)   "amo" #op ".d"
> +#elif ( BITS_PER_LONG == 32 )
> +#define __AMO(op)   "amo" #op ".w"
> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)   \

The revision log says __test_and_* were renamed. Same anomaly for
__test_and_op_bit() then.

> +({                                                      \
> +    unsigned long __res, __mask;                        \

Leftover leading underscores?

> +    __mask = BIT_MASK(nr);                              \
> +    __asm__ __volatile__ (                              \
> +        __AMO(op) #ord " %0, %2, %1"                    \
> +        : "=r" (__res), "+A" (addr[BIT_WORD(nr)])       \
> +        : "r" (mod(__mask))                             \
> +        : "memory");                                    \
> +    ((__res & __mask) != 0);                            \
> +})
> +
> +#define __op_bit_ord(op, mod, nr, addr, ord)    \
> +    __asm__ __volatile__ (                      \
> +        __AMO(op) #ord " zero, %1, %0"          \
> +        : "+A" (addr[BIT_WORD(nr)])             \
> +        : "r" (mod(BIT_MASK(nr)))               \
> +        : "memory");
> +
> +#define __test_and_op_bit(op, mod, nr, addr)    \
> +    __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> +#define __op_bit(op, mod, nr, addr) \
> +    __op_bit_ord(op, mod, nr, addr, )
> +
> +/* Bitmask modifiers */
> +#define __NOP(x)    (x)
> +#define __NOT(x)    (~(x))

Here the (double) leading underscores are truly worrying: Simple
names like this aren't impossible to be assigned meaninb by a compiler.

> +/**
> + * __test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation may be reordered on other architectures than x86.
> + */
> +static inline int test_and_set_bit(int nr, volatile void *p)
> +{
> +    volatile uint32_t *addr = p;

With BIT_WORD() / BIT_MASK() being long-based, is the use of uint32_t
here actually correct?

> +    return __test_and_op_bit(or, __NOP, nr, addr);
> +}
> +
> +/**
> + * __test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation can be reordered on other architectures other than x86.

Nit: double "other" (and I think it's the 1st one that wants dropping,
not - as the earlier comment suggests - the 2nd one). Question is: Are
the comments correct? Both resolve to something which is (also) at
least a compiler barrier. Same concern also applies further down, to
at least set_bit() and clear_bit().

> + */
> +static inline int test_and_clear_bit(int nr, volatile void *p)
> +{
> +    volatile uint32_t *addr = p;
> +
> +    return __test_and_op_bit(and, __NOT, nr, addr);
> +}
> +
> +/**
> + * set_bit - Atomically set a bit in memory
> + * @nr: the bit to set
> + * @addr: the address to start counting from
> + *
> + * Note: there are no guarantees that this function will not be reordered
> + * on non x86 architectures, so if you are writing portable code,
> + * make sure not to rely on its reordering guarantees.
> + *
> + * Note that @nr may be almost arbitrarily large; this function is not
> + * restricted to acting on a single-word quantity.
> + */
> +static inline void set_bit(int nr, volatile void *p)
> +{
> +    volatile uint32_t *addr = p;
> +
> +    __op_bit(or, __NOP, nr, addr);
> +}
> +
> +/**
> + * clear_bit - Clears a bit in memory
> + * @nr: Bit to clear
> + * @addr: Address to start counting from
> + *
> + * Note: there are no guarantees that this function will not be reordered
> + * on non x86 architectures, so if you are writing portable code,
> + * make sure not to rely on its reordering guarantees.
> + */
> +static inline void clear_bit(int nr, volatile void *p)
> +{
> +    volatile uint32_t *addr = p;
> +
> +    __op_bit(and, __NOT, nr, addr);
> +}
> +
> +/**
> + * test_and_change_bit - Change a bit and return its old value

How come this one's different? I notice the comments are the same (and
hence as confusing) in Linux; are you sure they're applicable there?

> + * @nr: Bit to change
> + * @addr: Address to count from
> + *
> + * This operation is atomic and cannot be reordered.
> + * It also implies a memory barrier.
> + */
> +static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
> +{
> +	return __test_and_op_bit(xor, __NOP, nr, addr);
> +}
> +
> +#undef __test_and_op_bit
> +#undef __op_bit
> +#undef __NOP
> +#undef __NOT
> +#undef __AMO
> +
> +#include <asm-generic/bitops/generic-non-atomic.h>
> +
> +#define __test_and_set_bit generic___test_and_set_bit
> +#define __test_and_clear_bit generic___test_and_clear_bit
> +#define __test_and_change_bit generic___test_and_change_bit
> +
> +#include <asm-generic/bitops/fls.h>
> +#include <asm-generic/bitops/flsl.h>
> +#include <asm-generic/bitops/__ffs.h>
> +#include <asm-generic/bitops/ffs.h>
> +#include <asm-generic/bitops/ffsl.h>
> +#include <asm-generic/bitops/ffz.h>
> +#include <asm-generic/bitops/find-first-set-bit.h>
> +#include <asm-generic/bitops/hweight.h>
> +#include <asm-generic/bitops/test-bit.h>

To be honest there's too much stuff being added here to asm-generic/,
all in one go. I'll see about commenting on the remaining parts here,
but I'd like to ask that you seriously consider splitting.

Jan

