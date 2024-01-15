Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8B82DE0E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667536.1038902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQHS-0003KK-Lx; Mon, 15 Jan 2024 16:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667536.1038902; Mon, 15 Jan 2024 16:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQHS-0003IF-JL; Mon, 15 Jan 2024 16:57:46 +0000
Received: by outflank-mailman (input) for mailman id 667536;
 Mon, 15 Jan 2024 16:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPQHQ-0003I6-R2
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:57:44 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3280d25a-b3c7-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 17:57:42 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3377d45c178so4046482f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:57:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h10-20020adf9cca000000b00337afd67f40sm743410wre.1.2024.01.15.08.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 08:57:41 -0800 (PST)
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
X-Inumbo-ID: 3280d25a-b3c7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705337862; x=1705942662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4fSiXYYvn6DzFWiSOodaMBkMpNATUVGIXjGxzfXFrc=;
        b=QOueYT0b1VKE13Wbq6alP0OVxcaTht0pHNO/g0AkA2lkspCkbaPbe6BKqSHQ2Tf60U
         QNZm8znuqFRDpNM1TPkPal6TUed6P68X3VR+4FbRF5KMC/Trjhag4xRtozktr1vcTDAs
         LNR1KmbbNpOydWNrKYOnDkv6hhcXg0/mxW0i6itGieQsBfc5r3bGhHJo58XF+7J9ATFs
         1RZJe6uy29X3JN+0YFHPvsoxQe34epv6OEfpc3DRz+K6/Bj3fsFLsuKBUXzRCWwTgXlz
         DB3DQ13gMK33u4BBRxmxmFYZXYQrtCND3NJmmXrVNhzJ/ptH3DivvmuRKmx9eDB23QUi
         ZuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337862; x=1705942662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4fSiXYYvn6DzFWiSOodaMBkMpNATUVGIXjGxzfXFrc=;
        b=vKLPaXbgvXvmDap6uoU48djwDxxUl8IEy1/cuNbz+mEMAvgNrmROYATzgsPjqiID6+
         NUYm5HS6zy3SPm4XOQ5hCmFqfcrWKvZMYq0M8WNzp7VhH0ez/vnKhQyqKp4rPlgW2D/R
         Q1OkQGoABL+DJwPcm+/2qwEd55FxXwFtcXEsBK7gE2f/+8GCgseB5Aq/BvMnbz0ngBHC
         QsFiOkvjwJGah0SvJRj3ds+1DhKTiakp9IqQNq9HJSa2NkOo4dKql0BtGAHjnzSj3vUn
         Z0mudNstl7Oy5jGtttoxfL+u2N3x0Dm5E8ZEOX7vrowUh6rQZVE+vlhHZ9O/beJv2j0N
         h0oA==
X-Gm-Message-State: AOJu0YxevTWyzynLsJgU4LFpATDmapg3oQRn/aE3M5WFK8cQkoPIWKDG
	CGll90QBKPeLfZRGt/UaYPIPm1zYSnV1
X-Google-Smtp-Source: AGHT+IFNaOJXeqV4T+X3U07/HWezPTcGbhnyC0fHA7va+N46JC4ZHCkFl9BkPb8vXznL38FZatxONg==
X-Received: by 2002:a05:6000:1089:b0:337:2994:15b7 with SMTP id y9-20020a056000108900b00337299415b7mr3227181wrw.125.1705337861716;
        Mon, 15 Jan 2024 08:57:41 -0800 (PST)
Message-ID: <895a60ba-547c-4064-9e4b-4ebf07dea5fb@suse.com>
Date: Mon, 15 Jan 2024 17:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/34] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <5d2c032481792a3fe5bd5f1cae42d95f6e9b54b1.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5d2c032481792a3fe5bd5f1cae42d95f6e9b54b1.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
> + *   which was based on arch/arm/include/io.h
> + *
> + * Copyright (C) 1996-2000 Russell King
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2014 Regents of the University of California
> + */
> +
> +
> +#ifndef _ASM_RISCV_IO_H
> +#define _ASM_RISCV_IO_H
> +
> +#include <asm/byteorder.h>
> +
> +/*
> + * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
> + * change the properties of memory regions.  This should be fixed by the
> + * upcoming platform spec.
> + */
> +#define ioremap_nocache(addr, size) ioremap((addr), (size))
> +#define ioremap_wc(addr, size) ioremap((addr), (size))
> +#define ioremap_wt(addr, size) ioremap((addr), (size))

Nit: No need for the inner parentheses.

> +/* Generic IO read/write.  These perform native-endian accesses. */
> +#define __raw_writeb __raw_writeb
> +static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
> +{
> +	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +
> +#define __raw_writew __raw_writew
> +static inline void __raw_writew(u16 val, volatile void __iomem *addr)
> +{
> +	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +
> +#define __raw_writel __raw_writel
> +static inline void __raw_writel(u32 val, volatile void __iomem *addr)
> +{
> +	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +
> +#ifdef CONFIG_64BIT
> +#define __raw_writeq __raw_writeq
> +static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
> +{
> +	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
> +}
> +#endif
> +
> +#define __raw_readb __raw_readb
> +static inline u8 __raw_readb(const volatile void __iomem *addr)
> +{
> +	u8 val;
> +
> +	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +
> +#define __raw_readw __raw_readw
> +static inline u16 __raw_readw(const volatile void __iomem *addr)
> +{
> +	u16 val;
> +
> +	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +
> +#define __raw_readl __raw_readl
> +static inline u32 __raw_readl(const volatile void __iomem *addr)
> +{
> +	u32 val;
> +
> +	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +
> +#ifdef CONFIG_64BIT
> +#define __raw_readq __raw_readq
> +static inline u64 __raw_readq(const volatile void __iomem *addr)
> +{
> +	u64 val;
> +
> +	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
> +	return val;
> +}
> +#endif
> +
> +/*
> + * Unordered I/O memory access primitives.  These are even more relaxed than
> + * the relaxed versions, as they don't even order accesses between successive
> + * operations to the I/O regions.
> + */
> +#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r; })
> +#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
> +#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
> +
> +#define writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
> +#define writew_cpu(v,c)		((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
> +#define writel_cpu(v,c)		((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
> +
> +#ifdef CONFIG_64BIT
> +#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
> +#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
> +#endif

How come there are endianness assumptions here on the MMIO accessed?

As a file-wide remark: While I don't mind you using u<N> here for now,
presumably to stay close to Linux, eventually - as we make progress with
the conversion to uint<N>_t - this will need to diverge anyway.

> +/*
> + * I/O memory access primitives. Reads are ordered relative to any
> + * following Normal memory access. Writes are ordered relative to any prior
> + * Normal memory access.  The memory barriers here are necessary as RISC-V
> + * doesn't define any ordering between the memory space and the I/O space.
> + */
> +#define __io_br()	do {} while (0)

Nit: Why are this and ...

> +#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : : "memory");
> +#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory");
> +#define __io_aw()	do { } while (0)

... this not expanding exactly the same?

Jan

