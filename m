Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD88738A2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 15:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689343.1074195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhs1y-0004yr-48; Wed, 06 Mar 2024 14:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689343.1074195; Wed, 06 Mar 2024 14:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhs1y-0004xH-1Q; Wed, 06 Mar 2024 14:14:02 +0000
Received: by outflank-mailman (input) for mailman id 689343;
 Wed, 06 Mar 2024 14:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhs1w-0004xB-NX
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 14:14:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5718ff6-dbc3-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 15:13:57 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so627837066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 06:13:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv25-20020a170907209900b00a3ee9305b02sm7144797ejb.20.2024.03.06.06.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 06:13:56 -0800 (PST)
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
X-Inumbo-ID: c5718ff6-dbc3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709734437; x=1710339237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osycwpkQt/2CypUYKFLY9a62f0HXbFU/hnJEHqXTGpY=;
        b=KIqLrGl9q/iEp6lojGhRM5uaszHrGGlu7J76Vwj5HlEIEZXLXfSwPCPJUxUoky43dJ
         myzlcScHOp/Y7fJdbfta/XQoStrZQ1ZYtXUqccz4XU+fdV+WgkxbbotRmm1+j6p8rf+s
         zdxgqHOGDExR8QnqXEipG3ZHPGx9DGdZWHn4hSCq0QoC9/27CCjKjGnozqtzXJVFEFfZ
         9RI+hwf2gTujskoADYSBkKjFIKTN340bB18MeYUD+YopC1fws9S2dv2vUkAk9qEywNTY
         QMajRYsK1daOtds+X/blmhCuR+paBrlo5ilPI/alGucrdiZqk9Xv2gRdRQBamapeBfYN
         6wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709734437; x=1710339237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osycwpkQt/2CypUYKFLY9a62f0HXbFU/hnJEHqXTGpY=;
        b=AwdgWBsa6YQ6ZBO6nQb5nZiUpmEMxfWPkMb3K3EgQ+8vAcB9vPrPdmcqJ0mUePU5Fh
         GiJ/iHHaoE+GgaaUr7H81fzzzS3jgPbWLsOZsAtFOj1WAHja5Sh1z0UAfGoYH/om6Imf
         1z6dFNoA+EJ5XmXkIUktYCO2RfDbojE5gCQ3e59wlr+LOVvQIthfmOjsFIj4pvKcETaA
         XvBFOIUO+KCBov6DCfFmJSqdPrE/KZNLcaxINUEiLECD1WBVI6g45hxVxaqp9vjejvW6
         2o05bSIoopnvqoPK/NvRWlJr4H91IaY1fcunL9vB+NiLzwKdIoWh+vjH7ylopvV5ozJG
         DHJg==
X-Forwarded-Encrypted: i=1; AJvYcCUFQYQykn6Z+ZvPzTbDAbAGMKIN72+SQetF/n+nu6yJqJJwktM2Oy21s111EHj3T1JrsOy5ZTZMwRSGX1HIu7qYt5+tL0Q9SlbyHSuTeIQ=
X-Gm-Message-State: AOJu0Ywg4oby+QQm2Xd/D/n/4qEVvAOb9atET6qSaNGO5xTLk0TZbftY
	/4dXYkJ+niC5gs+x3u4RakFWcp5C09uaiCPqyJSMqBq6cohvlTh8UFiDgNi+sw==
X-Google-Smtp-Source: AGHT+IFTfYd1LAKFQqlBfqXAaRZd5BoYH4kwrdE2sFYuaT7gAwzeOg3kieZlGIHNUGrLRE8HyREebw==
X-Received: by 2002:a17:906:57d4:b0:a45:a2cc:eb8b with SMTP id u20-20020a17090657d400b00a45a2cceb8bmr3876212ejr.13.1709734436725;
        Wed, 06 Mar 2024 06:13:56 -0800 (PST)
Message-ID: <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
Date: Wed, 6 Mar 2024 15:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + *  The header taken form Linux 6.4.0-rc1 and is based on
> + *  arch/riscv/include/asm/mmio.h with the following changes:
> + *   - drop forcing of endianess for read*(), write*() functions as
> + *     no matter what CPU endianness, what endianness a particular device
> + *     (and hence its MMIO region(s)) is using is entirely independent.
> + *     Hence conversion, where necessary, needs to occur at a layer up.
> + *     Another one reason to drop endianess conversion is:
> + *     https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-3-hch@lst.de/
> + *     One of the answers of the author of the commit:
> + *       And we don't know if Linux will be around if that ever changes.
> + *       The point is:
> + *        a) the current RISC-V spec is LE only
> + *        b) the current linux port is LE only except for this little bit
> + *       There is no point in leaving just this bitrotting code around.  It
> + *       just confuses developers, (very very slightly) slows down compiles
> +  *      and will bitrot.  It also won't be any significant help to a future

Nit: Stray extra leading blank.

> + *       developer down the road doing a hypothetical BE RISC-V Linux port.
> + *   - drop unused argument of __io_ar() macros.
> + *   - drop "#define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}"
> + *     as they are unnessary.

Nit: unnecessary (also ...

> + *   - Adopt the Xen code style for this header, considering that significant changes
> + *     are not anticipated in the future.
> + *     In the event of any issues, adapting them to Xen style should be easily
> + *     manageable.
> + *   - drop unnessary __r variables in macros read*_cpu()

... again here)

> + * Copyright (C) 1996-2000 Russell King
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2014 Regents of the University of California
> + * Copyright (C) 2024 Vates
> + */
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
> +#define ioremap_nocache(addr, size) ioremap(addr, size)
> +#define ioremap_wc(addr, size) ioremap(addr, size)
> +#define ioremap_wt(addr, size) ioremap(addr, size)
> +
> +/* Generic IO read/write.  These perform native-endian accesses. */
> +static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r" (addr) );
> +}

I realize this is like Linux has it, but how is the compiler to know that
*addr is being access here? If the omission of respective constraints here
and below is intentional, I think a comment (covering all instances) is
needed. Note that while supposedly cloned from Arm code, Arm variants do
have such constraints in Linux.

I'm sorry for not having paid (enough) attention earlier.

> +static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sh %0, 0(%1)" : : "r" (val), "r" (addr) );
> +}
> +
> +static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sw %0, 0(%1)" : : "r" (val), "r" (addr) );
> +}
> +
> +#ifdef CONFIG_64BIT
> +static inline void __raw_writeq(u64 val, volatile void __iomem *addr)

uint64_t please

> +{
> +    asm volatile ( "sd %0, 0(%1)" : : "r" (val), "r" (addr) );
> +}
> +#endif
> +
> +static inline uint8_t __raw_readb(const volatile void __iomem *addr)
> +{
> +    uint8_t val;
> +
> +    asm volatile ( "lb %0, 0(%1)" : "=r" (val) : "r" (addr) );
> +    return val;
> +}
> +
> +static inline uint16_t __raw_readw(const volatile void __iomem *addr)
> +{
> +    uint16_t val;
> +
> +    asm volatile ( "lh %0, 0(%1)" : "=r" (val) : "r" (addr) );
> +    return val;
> +}
> +
> +static inline uint32_t __raw_readl(const volatile void __iomem *addr)
> +{
> +    uint32_t val;
> +
> +    asm volatile ( "lw %0, 0(%1)" : "=r" (val) : "r" (addr) );
> +    return val;
> +}
> +
> +#ifdef CONFIG_64BIT
> +static inline u64 __raw_readq(const volatile void __iomem *addr)

uint64_t please

> +{
> +    u64 val;

and again

> +    asm volatile ( "ld %0, 0(%1)" : "=r" (val) : "r" (addr) );
> +    return val;
> +}
> +#endif
> +
> +/*
> + * Unordered I/O memory access primitives.  These are even more relaxed than
> + * the relaxed versions, as they don't even order accesses between successive
> + * operations to the I/O regions.
> + */
> +#define readb_cpu(c)        __raw_readb(c)
> +#define readw_cpu(c)        __raw_readw(c)
> +#define readl_cpu(c)        __raw_readl(c)
> +
> +#define writeb_cpu(v, c)    __raw_writeb(v, c)
> +#define writew_cpu(v, c)    __raw_writew(v, c)
> +#define writel_cpu(v, c)    __raw_writel(v, c)
> +
> +#ifdef CONFIG_64BIT
> +#define readq_cpu(c)        __raw_readq(c)
> +#define writeq_cpu(v, c)    __raw_writeq(v, c)
> +#endif
> +
> +/*
> + * I/O memory access primitives. Reads are ordered relative to any
> + * following Normal memory access. Writes are ordered relative to any prior
> + * Normal memory access.  The memory barriers here are necessary as RISC-V
> + * doesn't define any ordering between the memory space and the I/O space.
> + */
> +#define __io_br()   do { } while (0)
> +#define __io_ar()   asm volatile ( "fence i,r" : : : "memory" );
> +#define __io_bw()   asm volatile ( "fence w,o" : : : "memory" );
> +#define __io_aw()   do { } while (0)
> +
> +#define readb(c)    ({ uint8_t  v; __io_br(); v = readb_cpu(c); __io_ar(); v; })
> +#define readw(c)    ({ uint16_t v; __io_br(); v = readw_cpu(c); __io_ar(); v; })
> +#define readl(c)    ({ uint32_t v; __io_br(); v = readl_cpu(c); __io_ar(); v; })
> +
> +#define writeb(v, c)    ({ __io_bw(); writeb_cpu(v, c); __io_aw(); })
> +#define writew(v, c)    ({ __io_bw(); writew_cpu(v, c); __io_aw(); })
> +#define writel(v, c)    ({ __io_bw(); writel_cpu(v, c); __io_aw(); })
> +
> +#ifdef CONFIG_64BIT
> +#define readq(c)        ({ uint64_t v; __io_br(); v = readq_cpu(c); __io_ar(); v; })
> +#define writeq(v, c)    ({ __io_bw(); writeq_cpu(v, c); __io_aw(); })
> +#endif

Overall looks much tidier now, thanks.

Jan

