Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4472F82DDD4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667522.1038872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQ5A-0006uy-1T; Mon, 15 Jan 2024 16:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667522.1038872; Mon, 15 Jan 2024 16:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQ59-0006sD-Uf; Mon, 15 Jan 2024 16:45:03 +0000
Received: by outflank-mailman (input) for mailman id 667522;
 Mon, 15 Jan 2024 16:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPQ58-0006s7-Df
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:45:02 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bed2121-b3c5-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 17:44:59 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337874b8164so3881138f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:44:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f6-20020adfb606000000b00336aa190139sm12264240wre.5.2024.01.15.08.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 08:44:58 -0800 (PST)
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
X-Inumbo-ID: 6bed2121-b3c5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705337099; x=1705941899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOEFBxLaLG7oVRmQSbtvUXSuPQjg+OG4PIh8V1z/iYY=;
        b=ESV4kN1Czdgq+xanj7SMQO52EGuONLlUUzhiDyms+glkZ5EyE4MJWKcdleFwuiHtnd
         BzPn/ElOShKU+MF/4JZ4DKyUknTffwQ7PJPXNyPtQtRPdXzfI5aYkoRTKFCiBWT/5gl8
         5q5op/Qy6+wI5M5p0fp3bxBfsy+XROiW6iMPEG/c2xxuj4uJMlhiCRN2YuNxKz276HKg
         crtgCRcXzLP/WYAov+7y0TfTeUR0rItDeo9tyojQWEdJk1ZQIQl18RwEwfrtuZ1LQNx2
         b/a9AHqtvPQC29+ZLz0G3mT7LzX2hWAdVA7FhoqFl5xVJA4Ousks+rrlrcwJVvtlkIqb
         N+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337099; x=1705941899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOEFBxLaLG7oVRmQSbtvUXSuPQjg+OG4PIh8V1z/iYY=;
        b=dVbSqVCPitP/hqQatbmht0T5YvA1HiY1yNpio3J7jmRkYLao6wUqxPIAnI3EgIpFX2
         7BJyUgwX3704+nLMgLaLSW5YUlDxrsZL4BM+N/sxQc+uGu44FIrm3wUO2AC/ZiAs6aZO
         BzzWDOPlWVlkEfs25DFI8OsocA0gHJCQYWpQ4VlfXcXjKclXSe3J09ujmsQ1WLcSZA8Q
         32Rxer/S6Js2DI7g+ZdT5r/+M4kT7dwaLM6Ga41KRGmoWdV00KkwGqBP8e165Jkptt8b
         uNNLYRzchdhIDjinanA4eYFp+LBIW8nsGgSX+BNCJGoiVWEWAWZLiU5UXkE1kBFt4wmw
         XAUQ==
X-Gm-Message-State: AOJu0YxIeHSZk0CQmtuOU9oVuIg8apfSwdTIaGjKcvPbAPcUEh3YsN4J
	SKXsgvcga/xdu5xbHR67qIwpgtkMKvpX
X-Google-Smtp-Source: AGHT+IHulxzQ4LRGKxWh4Xy6E/noRG8nmq5zJXu/oWmi6T2La0rZYuH5nYyHVk2kQsmJdYLmLMHlpQ==
X-Received: by 2002:adf:9b8d:0:b0:336:5ec6:e9c4 with SMTP id d13-20020adf9b8d000000b003365ec6e9c4mr3938991wrc.34.1705337099093;
        Mon, 15 Jan 2024 08:44:59 -0800 (PST)
Message-ID: <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
Date: Mon, 15 Jan 2024 17:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -0,0 +1,267 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2012 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_BITOPS_H
> +#define _ASM_RISCV_BITOPS_H
> +
> +#include <asm/system.h>
> +
> +#include <asm-generic/bitops/bitops-bits.h>
> +
> +/* Based on linux/arch/include/linux/bits.h */
> +
> +#define BIT_MASK(nr)        (1UL << ((nr) % BITS_PER_LONG))
> +#define BIT_WORD(nr)        ((nr) / BITS_PER_LONG)
> +
> +#define __set_bit(n,p)      set_bit(n,p)
> +#define __clear_bit(n,p)    clear_bit(n,p)
> +
> +/* Based on linux/arch/include/asm/bitops.h */
> +
> +#if ( BITS_PER_LONG == 64 )
> +#define __AMO(op)   "amo" #op ".d"
> +#elif ( BITS_PER_LONG == 32 )
> +#define __AMO(op)   "amo" #op ".w"
> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
> +({								\
> +    unsigned long __res, __mask;				\
> +    __mask = BIT_MASK(nr);					\
> +    __asm__ __volatile__ (					\
> +        __AMO(op) #ord " %0, %2, %1"			\
> +        : "=r" (__res), "+A" (addr[BIT_WORD(nr)])	\
> +        : "r" (mod(__mask))				\
> +        : "memory");					\
> +    ((__res & __mask) != 0);				\
> +})

Despite the taking from Linux I think the overall result wants to be
consistent formatting-wise: You switched to blank indentation (which
is fine), but you left tabs as padding for the line continuation
characters.

> +#define __op_bit_ord(op, mod, nr, addr, ord)			\
> +    __asm__ __volatile__ (					\
> +        __AMO(op) #ord " zero, %1, %0"			\
> +        : "+A" (addr[BIT_WORD(nr)])			\
> +        : "r" (mod(BIT_MASK(nr)))			\
> +        : "memory");
> +
> +#define __test_and_op_bit(op, mod, nr, addr) 			\

(At least) here you even use a mix.

> +    __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> +#define __op_bit(op, mod, nr, addr)				\
> +    __op_bit_ord(op, mod, nr, addr, )
> +
> +/* Bitmask modifiers */
> +#define __NOP(x)	(x)
> +#define __NOT(x)	(~(x))
> +
> +/**
> + * __test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation may be reordered on other architectures than x86.
> + */
> +static inline int __test_and_set_bit(int nr, volatile void *p)
> +{
> +    volatile uint32_t *addr = p;
> +
> +    return __test_and_op_bit(or, __NOP, nr, addr);
> +}
> +
> +/**
> + * __test_and_clear_bit - Clear a bit and return its old value
> + * @nr: Bit to clear
> + * @addr: Address to count from
> + *
> + * This operation can be reordered on other architectures other than x86.
> + */
> +static inline int __test_and_clear_bit(int nr, volatile void *p)
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
> +#undef __test_and_op_bit
> +#undef __op_bit
> +#undef __NOP
> +#undef __NOT
> +#undef __AMO
> +
> +#define test_and_set_bit   __test_and_set_bit
> +#define test_and_clear_bit __test_and_clear_bit

I realize test-and-change have no present users, despite being made
available by Arm and x86, but I think they would better be provided
right away, rather than someone introducing a use then needing to
fiddle with RISC-V (and apparently also PPC) code.

I'm also puzzled by this aliasing: Aren't there cheaper non-atomic
insn forms that could be used for the double-underscore-prefixed
variants?

> +/* Based on linux/include/asm-generic/bitops/find.h */
> +
> +#ifndef find_next_bit

What is this to guard against?

> +/**
> + * find_next_bit - find the next set bit in a memory region
> + * @addr: The address to base the search on
> + * @offset: The bitnumber to start searching at
> + * @size: The bitmap size in bits
> + */
> +extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
> +        size, unsigned long offset);
> +#endif
> +
> +#ifndef find_next_zero_bit
> +/**
> + * find_next_zero_bit - find the next cleared bit in a memory region
> + * @addr: The address to base the search on
> + * @offset: The bitnumber to start searching at
> + * @size: The bitmap size in bits
> + */
> +extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
> +        long size, unsigned long offset);
> +#endif
> +
> +/**
> + * find_first_bit - find the first set bit in a memory region
> + * @addr: The address to start the search at
> + * @size: The maximum size to search
> + *
> + * Returns the bit number of the first set bit.
> + */
> +extern unsigned long find_first_bit(const unsigned long *addr,
> +                    unsigned long size);
> +
> +/**
> + * find_first_zero_bit - find the first cleared bit in a memory region
> + * @addr: The address to start the search at
> + * @size: The maximum size to search
> + *
> + * Returns the bit number of the first cleared bit.
> + */
> +extern unsigned long find_first_zero_bit(const unsigned long *addr,
> +                     unsigned long size);
> +
> +/**
> + * ffs - find first bit in word.
> + * @word: The word to search
> + *
> + * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
> + */
> +static inline unsigned long __ffs(unsigned long word)
> +{
> +    int num = 0;

I understand it's this way in Linux, so there may be reasons to keep it
like that. Generally though we'd prefer unsigned here, and the type of
a variable used for the return value of a function would also better be
in sync with the function's return type (which I don't think needs to
be "unsigned long" either; "unsigned int" would apparently suffice).

> +#if BITS_PER_LONG == 64
> +    if ((word & 0xffffffff) == 0) {
> +        num += 32;
> +        word >>= 32;
> +    }

You're ending up with neither Xen nor Linux style this way. May I
suggest to settle on either?

> +#endif
> +    if ((word & 0xffff) == 0) {
> +        num += 16;
> +        word >>= 16;
> +    }
> +    if ((word & 0xff) == 0) {
> +        num += 8;
> +        word >>= 8;
> +    }
> +    if ((word & 0xf) == 0) {
> +        num += 4;
> +        word >>= 4;
> +    }
> +    if ((word & 0x3) == 0) {
> +        num += 2;
> +        word >>= 2;
> +    }
> +    if ((word & 0x1) == 0)
> +        num += 1;
> +    return num;
> +}
> +
> +/**
> + * ffsl - find first bit in long.
> + * @word: The word to search
> + *
> + * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
> + */
> +static inline unsigned int ffsl(unsigned long word)
> +{
> +    int num = 1;
> +
> +    if (!word)
> +        return 0;
> +
> +#if BITS_PER_LONG == 64
> +    if ((word & 0xffffffff) == 0) {
> +        num += 32;
> +        word >>= 32;
> +    }
> +#endif
> +    if ((word & 0xffff) == 0) {
> +        num += 16;
> +        word >>= 16;
> +    }
> +    if ((word & 0xff) == 0) {
> +        num += 8;
> +        word >>= 8;
> +    }
> +    if ((word & 0xf) == 0) {
> +        num += 4;
> +        word >>= 4;
> +    }
> +    if ((word & 0x3) == 0) {
> +        num += 2;
> +        word >>= 2;
> +    }
> +    if ((word & 0x1) == 0)
> +        num += 1;
> +    return num;
> +}

What's RISC-V-specific about the above? IOW why ...

> +#include <asm-generic/bitops/fls.h>
> +#include <asm-generic/bitops/flsl.h>
> +#include <asm-generic/bitops/ffs.h>
> +#include <asm-generic/bitops/ffz.h>

... can't those two also come from respective generic headers?

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> +#define _ASM_GENERIC_BITOPS_BITS_H_
> +
> +#define BITOP_BITS_PER_WORD     32
> +#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))

Why 1UL and not just 1U, when bits per word is 32?

> +#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
> +#define BITS_PER_BYTE           8
> +
> +#endif /* _ASM_GENERIC_BITOPS_BITS_H_ */
> \ No newline at end of file

Nit: I did comment on such before (and there's at least one more
further down).

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/ffs.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FFS_H_
> +#define _ASM_GENERIC_BITOPS_FFS_H_
> +
> +#include <xen/macros.h>
> +
> +#define ffs(x) ({ unsigned int t_ = (x); fls(ISOLATE_LSB(t_)); })
> +
> +#endif /* _ASM_GENERIC_BITOPS_FFS_H_ */
> diff --git a/xen/include/asm-generic/bitops/ffz.h b/xen/include/asm-generic/bitops/ffz.h
> new file mode 100644
> index 0000000000..92c35455d5
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/ffz.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FFZ_H_
> +#define _ASM_GENERIC_BITOPS_FFZ_H_
> +
> +/*
> + * ffz - find first zero in word.
> + * @word: The word to search
> + *
> + * Undefined if no zero exists, so code should check against ~0UL first.
> + */
> +#define ffz(x)  __ffs(~(x))

For a generic header I'd like to see consistency: ffz() may expand to
ffs(), and __ffz() may expand to __ffs(). A mix like you have it above
wants at least explaining in the description. (I don't understand
anyway why both ffs() and __ffs() would be needed. We don't have any
__ffs() on x86 afaics.)

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/find-first-bit-set.h

This file name, if it really needs to be this long, wants to match ...

> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_
> +#define _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_
> +
> +/**
> + * find_first_set_bit - find the first set bit in @word
> + * @word: the word to search
> + *
> + * Returns the bit-number of the first set bit (first bit being 0).
> + * The input must *not* be zero.
> + */
> +static inline unsigned int find_first_set_bit(unsigned long word)

... the function implemented herein.

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/fls.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> +#define _ASM_GENERIC_BITOPS_FLS_H_
> +
> +/**
> + * fls - find last (most-significant) bit set
> + * @x: the word to search
> + *
> + * This is defined the same way as ffs.
> + * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
> + */
> +
> +static inline int fls(unsigned int x)
> +{
> +    return generic_fls(x);
> +}

Seing this, why would e.g. ffsl() not use generic_ffsl() then?

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/hweight.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_HWEIGHT_H_
> +#define _ASM_GENERIC_BITOPS_HWEIGHT_H_
> +
> +/*
> + * hweightN - returns the hamming weight of a N-bit word
> + * @x: the word to weigh
> + *
> + * The Hamming Weight of a number is the total number of bits set in it.
> + */
> +#define hweight64(x) generic_hweight64(x)
> +
> +#endif /* _ASM_GENERIC_BITOPS_HWEIGHT_H_ */

Do we really need this? An arch not having suitable insns (RISC-V has,
iirc) can easily have this one #define (or the ip to four ones when
also covering the other widths) in its asm header.

> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/test-bit.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
> +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
> +
> +/**
> + * test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static inline int test_bit(int nr, const volatile void *addr)
> +{
> +    const volatile unsigned int *p = addr;

With BITOP_BITS_PER_WORD I think you really mean uint32_t here.
Also you want to make sure asm-generic/bitops/bitops-bits.h is
really in use here, or else an arch overriding / not using that
header may end up screwed.

Jan

> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
> +}
> +
> +#endif /* _ASM_GENERIC_BITOPS_TESTBIT_H_ */
> \ No newline at end of file


