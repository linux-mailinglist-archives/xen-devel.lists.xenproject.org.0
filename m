Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C9AB8202
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984978.1370927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUYM-0007MW-WA; Thu, 15 May 2025 09:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984978.1370927; Thu, 15 May 2025 09:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUYM-0007K3-TF; Thu, 15 May 2025 09:06:58 +0000
Received: by outflank-mailman (input) for mailman id 984978;
 Thu, 15 May 2025 09:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFUYL-0007Jx-L7
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:06:57 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f35b9212-316b-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 11:06:56 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fbfdf7d353so916165a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:06:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad503e3f65esm204338966b.6.2025.05.15.02.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:06:49 -0700 (PDT)
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
X-Inumbo-ID: f35b9212-316b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747300016; x=1747904816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NBx8Oe3ymnLl1c5WuSuXHwGtzlWPF6LmHmV05T4Qiz8=;
        b=Pc7OMihkVenlBQ54RrbGoNQqqhezWWXLQbFRP3IjhkasdS8PD4iWak65X446fTo1F1
         LAHF6o5Iwsghil3FFCDqIaIl81hlevlpRapUvZUnKrcFrWFPQ4eSWrwMPK7EmY5n2X+i
         qTEdrxwzyhNXaR/hHNEzbDT9BED9omogrnpfQnrSnsPWrr/NBE4FUY025BLQjc1Q+Qaa
         eE56mkDgVf1tUcYrj2NfETvJFh6FkLFSwgy/F22PcAhgwutGJMXHmiT7sxgvdjpNOWzk
         AJDQKCCQpp0JobTDP4YXi5xxg6eriDSWYjbXXTbVJa2lslxcBdHuG5eatR8hvOCFJrBY
         9M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300016; x=1747904816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBx8Oe3ymnLl1c5WuSuXHwGtzlWPF6LmHmV05T4Qiz8=;
        b=XMq9qa3id3MZ+S9dIoqOUKoNo0p2HBbyFjDP0M+kN07juATvJBrsRyTLnCl/2NKUt8
         d0jIvdohcDgP8/T7JkSjDHMLaQRbDm++TCoC/y0CQDvS6YU907NC95o6X2/lS6EIOU8U
         S7D3PbVwN1JlekJiRyqddoW9OGt1KndaMku8/LKBF+2PjK7xyVcXJ+nGNOawMC2vWfRq
         wnN60vUpYT9HzI0V5EHbYXvwhphecKmTIHL7xFegipyWWS/9TQEHowgRGYzfJla52EF1
         52qIlZCoACzQntsaoAzuUfpsafvT83m1Fh725CgYMfj1LbZe5kRa4GP+xRfhvEynIPX0
         MaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWto0YTq/egla09nyIeGMRlaC8TtKhcwLvd874fGl82pMKT+Wr7lG+5gfY7OeqDrHb1NqUHFBLpQ2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyzd9Sk+k0N+FxwEgfIrHUFluVeXE2DaudFOSg10Tl68Rg+qvXr
	rya9dX9jPuIBr030Ehok1ARTO5z4aJP+WdNgOyYy+PWrJ19sE/dKNfI1rJKbXg==
X-Gm-Gg: ASbGnctVmkfK//KkBC7ezNJ2pXKJzuzNEip5dmuKFnTiSbDf6SNADRMVPXlAHHv3Ocp
	IabIqr7fidbVlR8718fvUPEN3hdUO28MK3+1jb7T7RkXsOm07YYp9bt0m42iMfS4XLkeZSVDGWM
	8ulRgKSX9JQl2gysXtRM1Amh+eav6uaCwNoy3FmXF2D67EriL5P/4PmJEEE7M1kUvMWZ0084C0h
	IJIpJBZDOtqQjcyArmHbq+a0DFu33bdTE7pmoqyIzV9oG7x/L54m8GwNM4rDr8XHj80UOosE5t2
	7oksA/61vMdPcn1rYVmTctZoPVga90n9D84RKdNUR6Cr4yDcoOfBvPes/m6u05/hKg4BT18fcwm
	gqd2CzmTPk4FxiY7/ZfGErzq4MNspCrFp9FfEdbP4VDnVYiI=
X-Google-Smtp-Source: AGHT+IFB4x3yNW3+PX1J+ptQeYR922si1KC3PKQbdEdL6a6nd3XTr77Yg3QS2j2qyZFEBvLzyHDBBA==
X-Received: by 2002:a17:907:72c7:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ad4f7150549mr647844666b.28.1747300009560;
        Thu, 15 May 2025 02:06:49 -0700 (PDT)
Message-ID: <057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com>
Date: Thu, 15 May 2025 11:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <9129b10432dfc7ff8ba451842204342171da7dc1.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9129b10432dfc7ff8ba451842204342171da7dc1.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic.h

If already you have such in a comment, please have it be correct.

> + * Private part of aplic.h header.
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + * Copyright (c) Vates.
> + */
> +
> +#ifndef ASM__RISCV_PRIV_APLIC_H
> +#define ASM__RISCV_PRIV_APLIC_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/aplic.h>
> +#include <asm/imsic.h>
> +
> +struct aplic_priv {
> +    /* base physical address and size */
> +    paddr_t paddr_start;
> +    size_t  size;
> +
> +    /* registers */
> +    volatile struct aplic_regs *regs;

This looks to also want __iomem.

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -9,19 +9,121 @@
>   * Copyright (c) 2024-2025 Vates
>   */
>  
> +#include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
> +#include <xen/mm.h>
>  #include <xen/sections.h>
>  #include <xen/types.h>
> +#include <xen/vmap.h>
> +
> +#include "aplic-priv.h"

Besides this, are there going to be any other files including this private
header? If not, why have the header in the first place?

>  #include <asm/device.h>
> +#include <asm/imsic.h>
>  #include <asm/intc.h>
> +#include <asm/riscv_encoding.h>
> +
> +#define APLIC_DEFAULT_PRIORITY  1
> +
> +static struct aplic_priv aplic;
>  
>  static struct intc_info __ro_after_init aplic_info = {
>      .hw_version = INTC_APLIC,
>  };
>  
> +static void __init aplic_init_hw_interrupts(void)
> +{
> +    unsigned int i;
> +
> +    /* Disable all interrupts */
> +    for ( i = 0; i < ARRAY_SIZE(aplic.regs->clrie); i++)
> +        writel(-1U, &aplic.regs->clrie[i]);

Imo it's better to use ~0U.

> +    /* Set interrupt type and default priority for all interrupts */
> +    for ( i = 1; i <= aplic_info.num_irqs; i++ )
> +    {
> +        writel(0, &aplic.regs->sourcecfg[i - 1]);

What guarantees the loop to not run past the array's size?

> +        /*
> +         * Low bits of target register contains Interrupt Priority bits which
> +         * can't be zero according to AIA spec.
> +         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
> +         */
> +        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i - 1]);
> +    }

Seeing the subtractions of 1 here, why's the loop header not simply

    for ( i = 0; i < aplic_info.num_irqs; i++ )

(i.e. the more conventional form)?

> +    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
> +}
> +
> +static int __init cf_check aplic_init(void)
> +{
> +    int rc;
> +    dt_phandle imsic_phandle;
> +    uint32_t irq_range[num_possible_cpus() * 2];

Are you going to have enough stack space when num_possible_cpus() is pretty
large?

> +    const __be32 *prop;
> +    uint64_t size, paddr;
> +    struct dt_device_node *imsic_node;

Pointer-to-const?

> +    const struct dt_device_node *node = aplic_info.node;
> +
> +    /* Check for associated imsic node */
> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
> +    if ( !rc )
> +        panic("%s: IDC mode not supported\n", node->full_name);
> +
> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
> +    if ( !imsic_node )
> +        panic("%s: unable to find IMSIC node\n", node->full_name);
> +
> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
> +                                    irq_range, ARRAY_SIZE(irq_range));
> +    if ( rc )
> +        panic("%s: unable to find interrupt-extended in %s node\n",
> +              __func__, imsic_node->full_name);
> +
> +    if ( irq_range[1] == IRQ_M_EXT )

How do you know the array has had 2 or ...

> +        /* Machine mode imsic node, ignore this aplic node */
> +        return 0;
> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(irq_range); i += 2 )
> +    {
> +        if ( irq_range[i + 1] != irq_range[1] )
> +            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
> +    }

... or even all of the slots populated? Anything not populated by the DT
function will still have the stack contents that had been left by earlier
call chains. (The loop also makes little sense to start from 0.)

I'm also puzzled by there not being any further use of the values later
in the function.

> +    rc = imsic_init(imsic_node);
> +    if ( rc )
> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);
> +
> +    /* Find out number of interrupt sources */
> +    rc = dt_property_read_u32(node, "riscv,num-sources", &aplic_info.num_irqs);
> +    if ( !rc )

Assigning a bool return value to an int local var, which generally hold
error codes, is confusing. I don't think you really need to use a local
variable here.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/asm/include/aplic.h
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + */
> +
> +#ifndef ASM__RISCV__APLIC_H
> +#define ASM__RISCV__APLIC_H
> +
> +#include <xen/types.h>
> +
> +#include <asm/imsic.h>
> +
> +#define APLIC_DOMAINCFG_IE      BIT(8, UL)
> +#define APLIC_DOMAINCFG_DM      BIT(2, UL)
> +
> +struct aplic_regs {
> +    uint32_t domaincfg;
> +    uint32_t sourcecfg[1023];
> +    uint8_t _reserved1[0xBC0];
> +
> +    uint32_t mmsiaddrcfg;
> +    uint32_t mmsiaddrcfgh;
> +    uint32_t smsiaddrcfg;
> +    uint32_t smsiaddrcfgh;
> +    uint8_t _reserved2[0x30];
> +
> +    uint32_t setip[32];
> +    uint8_t _reserved3[92];
> +
> +    uint32_t setipnum;
> +    uint8_t _reserved4[0x20];
> +
> +    uint32_t in_clrip[32];
> +    uint8_t _reserved5[92];
> +
> +    uint32_t clripnum;
> +    uint8_t _reserved6[32];
> +
> +    uint32_t setie[32];
> +    uint8_t _reserved7[92];
> +
> +    uint32_t setienum;
> +    uint8_t _reserved8[32];
> +
> +    uint32_t clrie[32];
> +    uint8_t _reserved9[92];
> +
> +    uint32_t clrienum;
> +    uint8_t _reserved10[32];
> +
> +    uint32_t setipnum_le;
> +    uint32_t setipnum_be;
> +    uint8_t _reserved11[4088];

I think you want to be consistent with the dimensions of at least all the
_reserved*[] fields - use decimal or use hex everywhere. Even better would
be if that was consistent across all array dimensions.

Jan

