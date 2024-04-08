Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B589B9AD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701809.1096320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtk0o-0004Bt-Ux; Mon, 08 Apr 2024 08:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701809.1096320; Mon, 08 Apr 2024 08:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtk0o-00049f-S5; Mon, 08 Apr 2024 08:05:54 +0000
Received: by outflank-mailman (input) for mailman id 701809;
 Mon, 08 Apr 2024 08:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtk0o-00049Y-29
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:05:54 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f53771-f57e-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 10:05:51 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4166ccac761so4954375e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 01:05:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b004148d7b889asm16237185wmq.8.2024.04.08.01.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 01:05:50 -0700 (PDT)
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
X-Inumbo-ID: d0f53771-f57e-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712563551; x=1713168351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lW2ln+QvW0iEele4c5G7ovJo6MTwK+Ol4TB9pvJK4Io=;
        b=crtvSuHwpIv4z5Nb1xPYJ8C8L8KLysonazYd6+kIzDJoASCn1eV01TogoY9/GmUZ5S
         d+1cIa6bssHMa4jZOcHgdRAx3Go2C81kItWsVIMziufuE1JbT3966g7B98k9fD6quxaZ
         U65AzFQlWhFzJ8rDoDDTasw9GqsVzb2ukS9V/dONvHmxOdB12ZRI0A7rK1Wb5dlyv70H
         zMKCSTesL2EAPKxUJbWuMWwtYeSpQM33qHPnGramOWcjcK7//iPNeojszsU3RyuYpNWO
         wAuD3Qa3s6N53AVzmyIap/8wn3ST4lPHqLSPIxpdF/g+QMfQmCjh5ZXk0FkoA/aq6wYE
         UBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563551; x=1713168351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lW2ln+QvW0iEele4c5G7ovJo6MTwK+Ol4TB9pvJK4Io=;
        b=pCqwjysEhIIbPyoIG9eYGCxYEDPCJATeLEi05KvQl128/GAD039f5nW1Fs2iBB1yZO
         IXZF/FB7VhCIMFUT4LwRIkP162YZfrMAjoQoqgaiTeT4ChX8S4KtWSu+3/tAMFCti2Us
         9Q7YayqxUHPxHR4VyyttO1XJZVni87omd/Im+P44DxL4G5BQSJ5QVNvFcPdOhmx+1m2v
         lmprB1CDXvREuy7rYHgUeQlp3x9nfbUMkgHhMOdhDfzx/bTFyuYOot/xNqg7YnPEj7QU
         2IN6oURB12HFdmy4yB2QDxZsvc71061OUTSBmSOudb2oCh7AdWw6+JRrrF7UZidPVDMZ
         5miw==
X-Forwarded-Encrypted: i=1; AJvYcCUPOHsSlnfk5OdwR5trbBcAlIbT/aRSJZ9cfbnVjmb+HlK/cHDBKOhHp4DYcWZVyjQQn18EkABfPpJnvqDQgPjSJ84eZlvqPKkoM1DfE0c=
X-Gm-Message-State: AOJu0YwHGkAD+SgAFPspijM87AruQh57T+8MCuhAvZHR53SfEaTFW/f3
	ggKn0NadIuTHXImO5xDvuEuMBVUuPVnu6avE+2iE3swpYRjm2XUZ7bHVrkpI7g==
X-Google-Smtp-Source: AGHT+IEAQAhdfpZ1rIZsIS3tVAEffIDQ2pookerf+1ZiyRfsVGoCsGtVNV9ZghJpizsqmi9+zIpwMw==
X-Received: by 2002:a05:600c:1d29:b0:416:648f:8f4c with SMTP id l41-20020a05600c1d2900b00416648f8f4cmr2402025wms.25.1712563551028;
        Mon, 08 Apr 2024 01:05:51 -0700 (PDT)
Message-ID: <d330d827-d128-4278-9f90-41ee40c434a5@suse.com>
Date: Mon, 8 Apr 2024 10:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/19] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <347fe73b80601aec26e2dba5beefe7b3036943e3.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <347fe73b80601aec26e2dba5beefe7b3036943e3.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:20, Oleksii Kurochko wrote:
> The header taken form Linux 6.4.0-rc1 and is based on
> arch/riscv/include/asm/mmio.h with the following changes:
> - drop forcing of endianess for read*(), write*() functions as
>   no matter what CPU endianness, what endianness a particular device
>   (and hence its MMIO region(s)) is using is entirely independent.
>   Hence conversion, where necessary, needs to occur at a layer up.
>   Another one reason to drop endianess conversion here is:
>   https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-3-hch@lst.de/
>   One of the answers of the author of the commit:
>     And we don't know if Linux will be around if that ever changes.
>     The point is:
>      a) the current RISC-V spec is LE only
>      b) the current linux port is LE only except for this little bit
>     There is no point in leaving just this bitrotting code around.  It
>     just confuses developers, (very very slightly) slows down compiles
>     and will bitrot.  It also won't be any significant help to a future
>     developer down the road doing a hypothetical BE RISC-V Linux port.
> - drop unused argument of __io_ar() macros.
> - drop "#define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}"
>   as they are unnecessary.
> - Adopt the Xen code style for this header, considering that significant changes
>   are not anticipated in the future.
>   In the event of any issues, adapting them to Xen style should be easily
>   manageable.
> - drop unnecessary  __r variables in macros read*_cpu()
> - update inline assembler constraints for addr argument for
>   __raw_read{b,w,l,q} and __raw_write{b,w,l,q} to tell a compiler that
>  *addr will be accessed.
> - add stubs for __raw_readq() and __raw_writeq() for RISCV_32
> 
> Addionally, to the header was added definions of ioremap_*().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
despite ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -0,0 +1,168 @@
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
> + *   - drop "#define _raw_{read,write}{b,w,l,q} _raw_{read,write}{b,w,l,q}"
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
> +    asm volatile ( "sb %1, %0"
> +                   : "=m" (*(volatile uint8_t __force *)addr) : "r" (val) );
> +}
> +
> +static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sh %1, %0"
> +                   : "=m" (*(volatile uint16_t __force *)addr) : "r" (val) );
> +}
> +
> +static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
> +{
> +    asm volatile ( "sw %1, %0"
> +                   : "=m" (*(volatile uint32_t __force *)addr) : "r" (val) );
> +}
> +
> +static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
> +{
> +#ifdef CONFIG_RISCV_32
> +    BUILD_BUG_ON("unimplemented");
> +#else
> +    asm volatile ( "sd %1, %0"
> +                   : "=m" (*(volatile uint64_t __force *)addr) : "r" (val) );
> +#endif
> +}

... this and its read counterpart likely being in need of re-doing by anyone
wanting to enable RV32 support.

Jan

