Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF080F3B9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653334.1019808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD63v-0005qI-JJ; Tue, 12 Dec 2023 16:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653334.1019808; Tue, 12 Dec 2023 16:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD63v-0005no-GK; Tue, 12 Dec 2023 16:56:51 +0000
Received: by outflank-mailman (input) for mailman id 653334;
 Tue, 12 Dec 2023 16:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD63u-0005ni-8U
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:56:50 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70b4d5a8-990f-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:56:49 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3362216835eso1774171f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:56:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600004c400b0033621fe3a29sm4873600wri.26.2023.12.12.08.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 08:56:48 -0800 (PST)
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
X-Inumbo-ID: 70b4d5a8-990f-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702400208; x=1703005008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/SpRd50Am3tUfGGJ9jxm4j84jDGow0Q/IazYwMhXIE=;
        b=D7f5XrlXf2XlaehObIappM+I/MMMiTGelRqXjwUJI3dq9+2dN8Q67s4/eoL6oLNhnF
         KWT7MUdKuwUQbTFfLLYet/S7myKDgfjO/OJ84ujXBfnsvv62Lp93U6zYzuQ6T4tpf202
         IUqcYoI97W+vPxW28x6XSs1jYd2FE5lFCy5Em4tFBQHiGTozJ+BlqF8JxWInHsCn6p/R
         eM3XxMaGa+0Eu7u02imIFPEyzzNdMYSKfYcamuOLaX5Dvq2j5L0elRT7c7Loh3SNOV5L
         sFx6/V+HvevFpatltdUUTBW8DwahJGabvG0c9UHN+51hWblBMoT225wF+udoq+B686Xs
         3SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400208; x=1703005008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/SpRd50Am3tUfGGJ9jxm4j84jDGow0Q/IazYwMhXIE=;
        b=qdvqNgsjn37aF1rPTRN2rtQTDJ9haMUMvmFsqefvhCycdsSNItbluYyT7EOCJ4xSmq
         qSA19MOj0pxv2iOsFWVG2MFl327fgn7Z5cVkMB3TLQgAZyzU9gM6B6sksOGB8clEbNB9
         KXERUwEpBf5skpLIfy5EEqKKH3/sTdU+YYHGRhsM/mTXZu96trs9oAN4rKHxbziHKzJN
         7L/Jl9Rpj1UTlb1HLcJz65XMsbHjlp7lVO831TUgghRclWkt1Ykc4b34thrCE/CfubZB
         VqaDscgqhrHA8PXBaALgvXP/XG3wtqbKe2UcSimPSXZ8k76gjP2Tb6oTXftWNl3Y0+pX
         KA8w==
X-Gm-Message-State: AOJu0Yy105Fkx4f7JJzbGn4grxRJEPoKaCT4uFMxeEHiskXR24Pe/l3E
	Fyu9fPY5FL9ms/wI5RsX46Fk
X-Google-Smtp-Source: AGHT+IENmjcvsuYxUcKUIaq1IcF2lnlMoVhbn5Vxn2eJAgaMGRWZr5npubxyGRcqLADgqA/mNM7doQ==
X-Received: by 2002:a05:6000:50a:b0:336:26b2:be75 with SMTP id a10-20020a056000050a00b0033626b2be75mr1647748wrf.36.1702400208527;
        Tue, 12 Dec 2023 08:56:48 -0800 (PST)
Message-ID: <84f3f223-9c51-4e38-8ed0-38f32b01c8f8@suse.com>
Date: Tue, 12 Dec 2023 17:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: introduce asm/io.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <5fdef2f1039c4c7c9d213e77f4d3dec3ada9c1d6.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5fdef2f1039c4c7c9d213e77f4d3dec3ada9c1d6.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - Nothing changed. Only rebase.
> ---
>  xen/arch/riscv/include/asm/io.h | 134 ++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/io.h
> 
> diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
> new file mode 100644
> index 0000000000..987fddf902
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Taken and modified from Linux.

Somewhat similar the the previous patch, further style related adjustments
may or may not wants making depending on how close to the original the
result is. Same request therefore here as just mentioned there. One further
question though:

> + * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
> + *   which was based on arch/arm/include/io.h
> + *
> + * Copyright (C) 1996-2000 Russell King
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2014 Regents of the University of California
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
> +#define ioremap_nocache(addr, size) ioremap((addr), (size))
> +#define ioremap_wc(addr, size) ioremap((addr), (size))
> +#define ioremap_wt(addr, size) ioremap((addr), (size))
> +
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

If all of these are plain loads and stores, is it really necessary to use
inline assembly in the first place? Even more so that you don't properly
make the compiler aware of which range of memory you access.

Jan

