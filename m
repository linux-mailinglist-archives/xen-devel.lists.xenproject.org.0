Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D2885914
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 13:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696383.1087271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnHVt-0001Z7-Ft; Thu, 21 Mar 2024 12:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696383.1087271; Thu, 21 Mar 2024 12:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnHVt-0001W8-Cr; Thu, 21 Mar 2024 12:27:17 +0000
Received: by outflank-mailman (input) for mailman id 696383;
 Thu, 21 Mar 2024 12:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnHVs-0001W0-5W
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 12:27:16 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a5ff57-e77e-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 13:27:13 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56b857bac38so484889a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 05:27:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x6-20020a056402414600b00568803d97d1sm674674eda.9.2024.03.21.05.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 05:27:12 -0700 (PDT)
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
X-Inumbo-ID: 58a5ff57-e77e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711024033; x=1711628833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0o1+SBcMgeogLeSgpnjSdauxk6lVd8QSvIuz9XJ6608=;
        b=SGevtqnkz/S83KPL3kTn3tj/oQZv2w/sInlU8dGG8xcPXjeoOReyqLAViBFYctGrr5
         QAa1hMMA1d9AbJZyZynAUUlGyZolf73gz7Bo/+QPkWVkcy+hi9fN3kYIljEsBBj1lZwi
         RWvnMZQtpNH3TO5E8TyFO5T8+EZ1IhuUf5HPsyXSLYsW1HNqdrrqNFR077etLRTApNvQ
         Pw1IMfTrUN6EB77h276jxINFE5y0uG4pQmrzzKdUvUefXfNXazCGPmuEpKn5b1IiGo08
         +PBNF8zKUUvW+mk128ABtJDj9p11ITrUvfPXU1y4NKCl2sWRrZi9QGbvCujf1Roiv+oO
         /GRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711024033; x=1711628833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0o1+SBcMgeogLeSgpnjSdauxk6lVd8QSvIuz9XJ6608=;
        b=XAFAID0IQZJA8rHWX+DoUUm9O3sVgfa6MSI3oJRrFAxy/HEngog3l2mlYbYXrGVInX
         BnpSTj5rnROsE5DvVeu4PBtLgCnbl2yExC6wVb1Nz/VgYvy0BOjXim4s4z07cD2P7ct1
         /UigBnN+gMrD8jWZ3icmBTXJmOfQrALG4Z7xYGOpsRZfKV4wZBdt8Fqed/phBy46rswQ
         cuK0KrlDOfQPqTb/AgXtld4N0Cn4UpbWvznyJDTvFy2WNIhptHCYgLnLqLWBF4Gxeyc2
         B8WrP6BergytwZ6KjKF4NhFINzTHuj4wQU5NVobMDc7/thTzEq45J/lW4XO6NrzHXu6C
         u8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUXeh1i4ecTXHl6vuv52cUCsTwy1nTRxYZSb5TyKCFJFPHN3dW7Mt2Mm2ZvQeSw0KEyRpfKsdcqZOHk8wOyuUIc+NS8DpIjhf5+UW8rogQ=
X-Gm-Message-State: AOJu0YxcDAS/qYFN3L2zCMZaE7LFWdVbyYwNvEj5f03Oj9PF8HCzqlV1
	DRtGSMgLQfbE2EaEpmi7gD+cnu2iIo+GqiK0CqP41MLiksQSjkLhXtn0Bkequw==
X-Google-Smtp-Source: AGHT+IED+GktLOGS84LK1blPzWOrNneh6wYw07UjeFM8uXotVDHq7qzYFclqBKUFVDXcGPIWHbTJJg==
X-Received: by 2002:a50:c192:0:b0:565:6e34:da30 with SMTP id m18-20020a50c192000000b005656e34da30mr1583644edf.21.1711024032987;
        Thu, 21 Mar 2024 05:27:12 -0700 (PDT)
Message-ID: <49dd40b6-4558-4e0c-b6ab-eee5b814dd8d@suse.com>
Date: Thu, 21 Mar 2024 13:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/20] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <dae9f595e5afd1e6a46149919e6689afe263e1ce.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dae9f595e5afd1e6a46149919e6689afe263e1ce.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -0,0 +1,167 @@
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
> + *      and will bitrot.  It also won't be any significant help to a future
> + *       developer down the road doing a hypothetical BE RISC-V Linux port.
> + *   - drop unused argument of __io_ar() macros.
> + *   - drop "#define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}"

In the commit message I'm not worried as much, but at least here the odd mention
of d as suffixes would better be purged.

> + *     as they are unnecessary.
> + *   - Adopt the Xen code style for this header, considering that significant
> + *     changes are not anticipated in the future.
> + *     In the event of any issues, adapting them to Xen style should be easily
> + *     manageable.
> + *   - drop unnecessary __r variables in macros read*_cpu()
> + *   - update inline assembler constraints for addr argument for
> + *     __raw_read{b,w,l,q} and __raw_write{b,w,l,q} to tell a compiler that
> + *     *addr will be accessed.
> + *
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
> +    asm volatile ( "sb %1, %0" : "=m" (*(volatile uint8_t __force *)addr) : "r" (val) );

Please respect line length restrictions.

> +}
> +
> +static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sh %1, %0" : "=m" (*(volatile uint16_t __force *)addr) : "r" (val) );
> +}
> +
> +static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sw %1, %0" : "=m" (*(volatile uint32_t __force *)addr) : "r" (val) );
> +}
> +
> +#ifdef CONFIG_RISCV_32
> +static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
> +{
> +    BUILD_BUG_ON("unimplemented\n");
> +}
> +#else
> +static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sd %1, %0" : "=m" (*(volatile uint64_t __force *)addr) : "r" (val) );
> +}
> +#endif

Please avoid code duplication if it easily can be avoided:

static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
{
#ifdef CONFIG_RISCV_32
    BUILD_BUG_ON("unimplemented");
#else
    asm volatile ( "sd %1, %0" : "=m" (*(volatile uint64_t __force *)addr) : "r" (val) );
#endif
}

(Note also the dropped \n.)

> +static inline uint8_t __raw_readb(const volatile void __iomem *addr)
> +{
> +    uint8_t val;
> +
> +    asm volatile ( "lb %0, %1" : "=r" (val) : "m" (*(volatile uint8_t __force *)addr) );

Please don't cast away const.

> +    return val;
> +}
> +
> +static inline uint16_t __raw_readw(const volatile void __iomem *addr)
> +{
> +    uint16_t val;
> +
> +    asm volatile ( "lh %0, %1" : "=r" (val) : "m" (*(volatile uint16_t __force *)addr) );
> +    return val;
> +}
> +
> +static inline uint32_t __raw_readl(const volatile void __iomem *addr)
> +{
> +    uint32_t val;
> +
> +    asm volatile ( "lw %0, %1" : "=r" (val) : "m" (*(volatile uint32_t __force *)addr) );
> +    return val;
> +}
> +
> +#ifdef CONFIG_RISCV_32
> +static inline uint64_t __raw_readq(const volatile void __iomem *addr)
> +{
> +    BUILD_BUG_ON("unimplemented\n");
> +    return 0;
> +}
> +#else
> +static inline uint64_t __raw_readq(const volatile void __iomem *addr)
> +{
> +    uint64_t val;
> +
> +    asm volatile ( "ld %0, %1" : "=r" (val) : "m" (*(volatile uint64_t __force *)addr) );
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
> +#define readq_cpu(c)        __raw_readq(c)
> +#define writeq_cpu(v, c)    __raw_writeq(v, c)

Since (now?) outside of any #ifdef (which is okay with me), why not each
grouped with their respective 3 siblings?

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

I'm wary of "v" as a macro local: What if at a use site there's

    x = readb(v);

? That'll fail to compile, provided at the use site v is actually a pointer,
but the reason for the error won't necessarily be obvious. (Hence why in the
past people did prefix underscores on such local variable names, while now
we're advocating for suffixes.)

> +#define readw(c)    ({ uint16_t v; __io_br(); v = readw_cpu(c); __io_ar(); v; })
> +#define readl(c)    ({ uint32_t v; __io_br(); v = readl_cpu(c); __io_ar(); v; })
> +
> +#define writeb(v, c)    ({ __io_bw(); writeb_cpu(v, c); __io_aw(); })
> +#define writew(v, c)    ({ __io_bw(); writew_cpu(v, c); __io_aw(); })
> +#define writel(v, c)    ({ __io_bw(); writel_cpu(v, c); __io_aw(); })
> +
> +#define readq(c)        ({ uint64_t v; __io_br(); v = readq_cpu(c); __io_ar(); v; })
> +#define writeq(v, c)    ({ __io_bw(); writeq_cpu(v, c); __io_aw(); })

Same here then.

Jan

