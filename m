Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45D838D20
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670373.1043092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSEjc-000292-3X; Tue, 23 Jan 2024 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670373.1043092; Tue, 23 Jan 2024 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSEjb-000271-Vd; Tue, 23 Jan 2024 11:14:27 +0000
Received: by outflank-mailman (input) for mailman id 670373;
 Tue, 23 Jan 2024 11:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSEjZ-00026a-T5
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:14:26 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90bd029e-b9e0-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 12:14:24 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cdf69bb732so43736881fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 03:14:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v5-20020a02cba5000000b0046eb8a6889fsm2797735jap.31.2024.01.23.03.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:14:23 -0800 (PST)
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
X-Inumbo-ID: 90bd029e-b9e0-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706008464; x=1706613264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c06H0LkK52AvnK2NUzVm4BcSjtSEovFRv7ldEQYSZ1Q=;
        b=VXTqMQht/OP3QMv591XSep3flvbkScu38q0HhBOfJ9NZbmcpBB305IBFZqBN6fb9TK
         Kazij6rlT9ZVVZPYazpmJ/QQc5VS9KVymo6wHXQwQVLXD96gFCakyGpkcYNUqY1bCoS2
         UwH8PZHUm/EMYvvpZCj79rPjztd/xDVIuyol8K08D5Eo0IBqs9zgSf8r2hjCUi6dOkab
         ixNC7t2B4KDltoRj67euqga2UOuyGGbmFvgsysJpLX2SkJuz56XVcpt8Tq7YCdOTo+Rd
         ow+IbiWIbfboqlHd2NrJSy3S8TYLRIckwU/A1IUoijPpRqQkHZTHe6acnBvNBrm9GJgI
         4s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706008464; x=1706613264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c06H0LkK52AvnK2NUzVm4BcSjtSEovFRv7ldEQYSZ1Q=;
        b=j7bCCbt/j9lPMe28UVAqEAWz7n6SwCrc2VE3bL/Gz4USmiwXJbATqIEMmeG0O/qZqc
         kBSKQB8vs8SNIQ6PlJcltcYpCzMLyE6kq7y2qdBnbgMJ2vKNmI5/A0rJ+UwprNliu9VL
         XiYLA6dLY6Y1AXRsh6WarWPFKaXsq4EazcW4kJ0JSk3/6kXolZXOAQJu00DveHcp94u8
         tDe2NgGJo1t5fLYqiThlrkXg21ouFwyJnqwqrx9VUDJcJ9Uq9Dand/2HStfg8Bg7/Kw3
         ZdgGIywecwXdktZTOZSS1K0ZSFsj7HAt0jEE2HbaULBEiORMAw2Jj5WVHr11nEg3/77A
         ynMg==
X-Gm-Message-State: AOJu0YwJHFtuR3PqzjgkuMZ/jAwI2TKw3Ss1X1IPqSoi78NRplbQFI8d
	t0UUxgKxCT8KDguJ9A9QIStC7RtJuBdbKjho/V/TtzMFyB+VWT45UWZ0+fbe4g==
X-Google-Smtp-Source: AGHT+IGLov3UNyTussKFY5A/SYVM3aSGlvtBk1Z4KDsvbg+FK1OOZ+K/F1gS2mwAaeo0CI6k9a6W3g==
X-Received: by 2002:a2e:b711:0:b0:2cd:418:a38 with SMTP id j17-20020a2eb711000000b002cd04180a38mr1197403ljo.136.1706008464258;
        Tue, 23 Jan 2024 03:14:24 -0800 (PST)
Message-ID: <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
Date: Tue, 23 Jan 2024 12:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
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
In-Reply-To: <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/fence.h
> +++ b/xen/arch/riscv/include/asm/fence.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef _ASM_RISCV_FENCE_H
>  #define _ASM_RISCV_FENCE_H
>  
> @@ -11,3 +11,12 @@
>  #endif
>  
>  #endif	/* _ASM_RISCV_FENCE_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Surely all of this wants doing in the previous patch, where the header
is introduced?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
>  config GENERIC_BUG_FRAME
>  	bool
>  
> +config GENERIC_FIND_NEXT_BIT
> +	bool

There's no need for this, as ...

> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
>  lib-y += bsearch.o
>  lib-y += ctors.o
>  lib-y += ctype.o
> +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find-next-bit.o

... you're moving this to lib/. Or have you encountered any issue
with building this uniformly, and you forgot to mention this in
the description?

> --- /dev/null
> +++ b/xen/lib/find-next-bit.c
> @@ -0,0 +1,281 @@
> +/* find_next_bit.c: fallback find next bit implementation
> + *
> + * Copyright (C) 2004 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +#include <xen/bitops.h>
> +
> +#include <asm/byteorder.h>
> +
> +#ifndef find_next_bit
> +/*
> + * Find the next set bit in a memory region.
> + */
> +unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
> +			    unsigned long offset)
> +{
> +	const unsigned long *p = addr + BIT_WORD(offset);
> +	unsigned long result = offset & ~(BITS_PER_LONG-1);
> +	unsigned long tmp;
> +
> +	if (offset >= size)
> +		return size;
> +	size -= result;
> +	offset %= BITS_PER_LONG;
> +	if (offset) {
> +		tmp = *(p++);
> +		tmp &= (~0UL << offset);
> +		if (size < BITS_PER_LONG)
> +			goto found_first;
> +		if (tmp)
> +			goto found_middle;
> +		size -= BITS_PER_LONG;
> +		result += BITS_PER_LONG;
> +	}
> +	while (size & ~(BITS_PER_LONG-1)) {
> +		if ((tmp = *(p++)))
> +			goto found_middle;
> +		result += BITS_PER_LONG;
> +		size -= BITS_PER_LONG;
> +	}
> +	if (!size)
> +		return result;
> +	tmp = *p;
> +
> +found_first:
> +	tmp &= (~0UL >> (BITS_PER_LONG - size));
> +	if (tmp == 0UL)		/* Are any bits set? */
> +		return result + size;	/* Nope. */
> +found_middle:
> +	return result + __ffs(tmp);
> +}
> +EXPORT_SYMBOL(find_next_bit);
> +#endif
> +
> +#ifndef find_next_zero_bit
> +/*
> + * This implementation of find_{first,next}_zero_bit was stolen from
> + * Linus' asm-alpha/bitops.h.
> + */
> +unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
> +				 unsigned long offset)
> +{
> +	const unsigned long *p = addr + BIT_WORD(offset);
> +	unsigned long result = offset & ~(BITS_PER_LONG-1);
> +	unsigned long tmp;
> +
> +	if (offset >= size)
> +		return size;
> +	size -= result;
> +	offset %= BITS_PER_LONG;
> +	if (offset) {
> +		tmp = *(p++);
> +		tmp |= ~0UL >> (BITS_PER_LONG - offset);
> +		if (size < BITS_PER_LONG)
> +			goto found_first;
> +		if (~tmp)
> +			goto found_middle;
> +		size -= BITS_PER_LONG;
> +		result += BITS_PER_LONG;
> +	}
> +	while (size & ~(BITS_PER_LONG-1)) {
> +		if (~(tmp = *(p++)))
> +			goto found_middle;
> +		result += BITS_PER_LONG;
> +		size -= BITS_PER_LONG;
> +	}
> +	if (!size)
> +		return result;
> +	tmp = *p;
> +
> +found_first:
> +	tmp |= ~0UL << size;
> +	if (tmp == ~0UL)	/* Are any bits zero? */
> +		return result + size;	/* Nope. */
> +found_middle:
> +	return result + ffz(tmp);
> +}
> +EXPORT_SYMBOL(find_next_zero_bit);
> +#endif
> +
> +#ifndef find_first_bit
> +/*
> + * Find the first set bit in a memory region.
> + */
> +unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
> +{
> +	const unsigned long *p = addr;
> +	unsigned long result = 0;
> +	unsigned long tmp;
> +
> +	while (size & ~(BITS_PER_LONG-1)) {
> +		if ((tmp = *(p++)))
> +			goto found;
> +		result += BITS_PER_LONG;
> +		size -= BITS_PER_LONG;
> +	}
> +	if (!size)
> +		return result;
> +
> +	tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
> +	if (tmp == 0UL)		/* Are any bits set? */
> +		return result + size;	/* Nope. */
> +found:
> +	return result + __ffs(tmp);
> +}
> +EXPORT_SYMBOL(find_first_bit);
> +#endif
> +
> +#ifndef find_first_zero_bit
> +/*
> + * Find the first cleared bit in a memory region.
> + */
> +unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
> +{
> +	const unsigned long *p = addr;
> +	unsigned long result = 0;
> +	unsigned long tmp;
> +
> +	while (size & ~(BITS_PER_LONG-1)) {
> +		if (~(tmp = *(p++)))
> +			goto found;
> +		result += BITS_PER_LONG;
> +		size -= BITS_PER_LONG;
> +	}
> +	if (!size)
> +		return result;
> +
> +	tmp = (*p) | (~0UL << size);
> +	if (tmp == ~0UL)	/* Are any bits zero? */
> +		return result + size;	/* Nope. */
> +found:
> +	return result + ffz(tmp);
> +}
> +EXPORT_SYMBOL(find_first_zero_bit);
> +#endif
> +
> +#ifdef __BIG_ENDIAN
> +
> +/* include/linux/byteorder does not support "unsigned long" type */
> +static inline unsigned long ext2_swabp(const unsigned long * x)
> +{
> +#if BITS_PER_LONG == 64
> +	return (unsigned long) __swab64p((u64 *) x);
> +#elif BITS_PER_LONG == 32
> +	return (unsigned long) __swab32p((u32 *) x);
> +#else
> +#error BITS_PER_LONG not defined
> +#endif
> +}
> +
> +/* include/linux/byteorder doesn't support "unsigned long" type */
> +static inline unsigned long ext2_swab(const unsigned long y)
> +{
> +#if BITS_PER_LONG == 64
> +	return (unsigned long) __swab64((u64) y);
> +#elif BITS_PER_LONG == 32
> +	return (unsigned long) __swab32((u32) y);
> +#else
> +#error BITS_PER_LONG not defined
> +#endif
> +}
> +
> +#ifndef find_next_zero_bit_le
> +unsigned long find_next_zero_bit_le(const void *addr, unsigned
> +		long size, unsigned long offset)
> +{
> +	const unsigned long *p = addr;
> +	unsigned long result = offset & ~(BITS_PER_LONG - 1);
> +	unsigned long tmp;
> +
> +	if (offset >= size)
> +		return size;
> +	p += BIT_WORD(offset);
> +	size -= result;
> +	offset &= (BITS_PER_LONG - 1UL);
> +	if (offset) {
> +		tmp = ext2_swabp(p++);
> +		tmp |= (~0UL >> (BITS_PER_LONG - offset));
> +		if (size < BITS_PER_LONG)
> +			goto found_first;
> +		if (~tmp)
> +			goto found_middle;
> +		size -= BITS_PER_LONG;
> +		result += BITS_PER_LONG;
> +	}
> +
> +	while (size & ~(BITS_PER_LONG - 1)) {
> +		if (~(tmp = *(p++)))
> +			goto found_middle_swap;
> +		result += BITS_PER_LONG;
> +		size -= BITS_PER_LONG;
> +	}
> +	if (!size)
> +		return result;
> +	tmp = ext2_swabp(p);
> +found_first:
> +	tmp |= ~0UL << size;
> +	if (tmp == ~0UL)	/* Are any bits zero? */
> +		return result + size; /* Nope. Skip ffz */
> +found_middle:
> +	return result + ffz(tmp);
> +
> +found_middle_swap:
> +	return result + ffz(ext2_swab(tmp));
> +}
> +EXPORT_SYMBOL(find_next_zero_bit_le);
> +#endif
> +
> +#ifndef find_next_bit_le
> +unsigned long find_next_bit_le(const void *addr, unsigned
> +		long size, unsigned long offset)
> +{
> +	const unsigned long *p = addr;
> +	unsigned long result = offset & ~(BITS_PER_LONG - 1);
> +	unsigned long tmp;
> +
> +	if (offset >= size)
> +		return size;
> +	p += BIT_WORD(offset);
> +	size -= result;
> +	offset &= (BITS_PER_LONG - 1UL);
> +	if (offset) {
> +		tmp = ext2_swabp(p++);
> +		tmp &= (~0UL << offset);
> +		if (size < BITS_PER_LONG)
> +			goto found_first;
> +		if (tmp)
> +			goto found_middle;
> +		size -= BITS_PER_LONG;
> +		result += BITS_PER_LONG;
> +	}
> +
> +	while (size & ~(BITS_PER_LONG - 1)) {
> +		tmp = *(p++);
> +		if (tmp)
> +			goto found_middle_swap;
> +		result += BITS_PER_LONG;
> +		size -= BITS_PER_LONG;
> +	}
> +	if (!size)
> +		return result;
> +	tmp = ext2_swabp(p);
> +found_first:
> +	tmp &= (~0UL >> (BITS_PER_LONG - size));
> +	if (tmp == 0UL)		/* Are any bits set? */
> +		return result + size; /* Nope. */
> +found_middle:
> +	return result + __ffs(tmp);
> +
> +found_middle_swap:
> +	return result + __ffs(ext2_swab(tmp));
> +}
> +EXPORT_SYMBOL(find_next_bit_le);
> +#endif
> +
> +#endif /* __BIG_ENDIAN */

I was going to ask that you convince git to actually present a proper
diff, to make visible what changes. But other than the description says
you don't really move the file, you copy it. Judging from further titles
there's also nowhere you'd make Arm actually use this now generic code.

Jan

