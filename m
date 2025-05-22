Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B256AC0FEF
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994273.1377330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7ot-0004tE-7B; Thu, 22 May 2025 15:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994273.1377330; Thu, 22 May 2025 15:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7ot-0004qA-4T; Thu, 22 May 2025 15:26:55 +0000
Received: by outflank-mailman (input) for mailman id 994273;
 Thu, 22 May 2025 15:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI7os-0004q4-1t
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:26:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ef3da2f-3721-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:26:51 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad51ef2424bso1301331066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:26:50 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498d05sm1106889966b.149.2025.05.22.08.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:26:50 -0700 (PDT)
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
X-Inumbo-ID: 2ef3da2f-3721-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747927610; x=1748532410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3IKMIDfnGzqMyfIXj44a4dok1PV18dQ4mP+tjrajBc=;
        b=IlB6QErKLrACjiwxv3tSDVXS3lWTc2QA9KVDDQB6RYWlnCQa0LAE7O5Gz6KUkQoYxY
         kNmmTbLyqJ1kYYxRd2AO8ukFbEdsLeOLYINjTAJbRw1iqjJLONYzOI3MH2lkR6yKU4F5
         PIoQH7AW+zhGXYTd3n02BQj4XHsKuA7zZyfAUvC8fHVA+c6UPwAsOLio15qep8GGNdhq
         L0BOkGdt9Y2ni0bykFuhB0jZqs/zyO6Rf2YMHKz1lPmT+NY+KK0T44tL/rE6ACz/N7KC
         dgevsEvDc98OmseU6SdfZt/Z81mYpSILzkobD8+tWKumey00dHQMU67TDu2uGceHG0zQ
         sndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927610; x=1748532410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3IKMIDfnGzqMyfIXj44a4dok1PV18dQ4mP+tjrajBc=;
        b=wnKcG9wQvsTYjKLIaXIJRrwS8H8lDlBqYOpYReEVkEgDegjoiwqJPXVzqCPaWIMSmC
         oS1HIJuwHmgyEyu0V3zFcNZRp2ETGnvbpmlUDjL+LvLSbQSF176IN15vZEbaWfMWc5Mr
         PgiTK6IxZTcNJvJ87rENOE0+nx8M8An5Wj47/Yja0G6XPxXHRegfq4/8coiJXKpK+Hm9
         2weLr/gSr9IogNlp9ULbfW5OPnhXhZqSeS0ayIxIg6fhxtrRC5F1HMt/VCVeeGd2516z
         cbizSW3N5RsWNqvlJubRN6gCG8m7Q4Y2zGjsBFJIUudARmv1O8iIhANDS4Zh6qf2+V89
         jPKw==
X-Forwarded-Encrypted: i=1; AJvYcCUZUmjHjl/jMrJyVVSKnLPWmfS/msI+/+im/3dzBztr7jAkGvFwIaCkS4uIM/7szgkKg1uPgiC7wwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQlhsgVEVtfGv7NlS2/s2wmDnV4NILDVDYA8ScYVdTH0kAwHNJ
	DIevgvXnYH1hduw2m0oepgfEA/EQgYsYiLj/kFoFaYu6NUl/SmrpANjm09hHWh95lA==
X-Gm-Gg: ASbGncsvPZzpdF32OxSbHIxnIL/6+ipk9siBEhHlVs9qS4UQXXgI6ESTX3YRC5MLcy9
	QjyfDHzmHasOacyKB+wn38uNqatILCDrC1jzaIvDMiPd6DVbsHIm8Wyh4BGm6BNgZhiGm8BRBF5
	s1spBLo3buZsP0PE59PdwIhBecMiNvyc6OHd24eA30gsRmL5no3+uobivps0+cT3WGhnCy3ana2
	CbYSaJkxAnySL/k+QyJI/QVacQPn3eRY0bXdULo1y6rcPSIhMR2h9qx3SPf2V1dEr7whtpOAh+A
	bCHTub8Xc/KAn9s4Ndk=
X-Google-Smtp-Source: AGHT+IGjyEHs7fWOD4uwDOriIouD9c4tgfl0GETpwffTGQvJnz6EJnplxTs2+3kVFUkIY3CYmvN00Q==
X-Received: by 2002:a17:907:7f03:b0:ad1:77ae:d18e with SMTP id a640c23a62f3a-ad52d606a59mr2284826766b.56.1747927610403;
        Thu, 22 May 2025 08:26:50 -0700 (PDT)
Message-ID: <058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com>
Date: Thu, 22 May 2025 17:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <cf642d2ce83fdd9f32638b1c45ad5fef26d4992b.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf642d2ce83fdd9f32638b1c45ad5fef26d4992b.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic-priv.h
> + *
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

Nit: This one conforms to neither prior nor current rules.

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -9,19 +9,113 @@
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
>  
>  #include <asm/device.h>
> +#include <asm/imsic.h>
>  #include <asm/intc.h>
> +#include <asm/riscv_encoding.h>
> +
> +#define APLIC_DEFAULT_PRIORITY  1
> +
> +/* The maximum number of wired interrupt sources supported by APLIC domain. */
> +#define APLIC_MAX_NUM_WIRED_IRQ_SOURCES 1023

Wait - what's "wired" here? There's only MSI you said elsewhere?

Further - how's this 1023 related to any of the other uses of that number?
Is this by chance ARRAY_SIZE(aplic.regs->sourcecfg)? If so, it wants
expressing like that, to allow making the connection.

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
> +        writel(~0U, &aplic.regs->clrie[i]);
> +
> +    /* Set interrupt type and default priority for all interrupts */
> +    for ( i = 0; i < aplic_info.num_irqs; i++ )
> +    {
> +        writel(0, &aplic.regs->sourcecfg[i]);
> +        /*
> +         * Low bits of target register contains Interrupt Priority bits which
> +         * can't be zero according to AIA spec.
> +         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
> +         */
> +        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
> +    }
> +
> +    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
> +}
> +
> +static int __init cf_check aplic_init(void)
> +{
> +    dt_phandle imsic_phandle;
> +    const __be32 *prop;
> +    uint64_t size, paddr;
> +    const struct dt_device_node *imsic_node;
> +    const struct dt_device_node *node = aplic_info.node;
> +    int rc;
> +
> +    /* Check for associated imsic node */
> +    if ( !dt_property_read_u32(node, "msi-parent", &imsic_phandle) )
> +        panic("%s: IDC mode not supported\n", node->full_name);
> +
> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
> +    if ( !imsic_node )
> +        panic("%s: unable to find IMSIC node\n", node->full_name);
> +
> +    rc = imsic_init(imsic_node);
> +    if ( rc == IRQ_M_EXT )
> +        /* Machine mode imsic node, ignore this aplic node */
> +        return 0;
> +    else if ( rc )

As before: No "else" please when the earlier if() ends in an unconditional
control flow change.

> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);
> +
> +    /* Find out number of interrupt sources */
> +    if ( !dt_property_read_u32(node, "riscv,num-sources",
> +                               &aplic_info.num_irqs) )
> +        panic("%s: failed to get number of interrupt sources\n",
> +              node->full_name);
> +
> +    if ( aplic_info.num_irqs > APLIC_MAX_NUM_WIRED_IRQ_SOURCES )
> +        panic("%s: too big number of riscv,num-source: %u\n",
> +               __func__, aplic_info.num_irqs);

Is it actually necessary to panic() in this case? Can't you just lower
.num_irqs instead (rendering higher IRQs,if any, non-functional)?

> +    prop = dt_get_property(node, "reg", NULL);
> +    dt_get_range(&prop, node, &paddr, &size);
> +    if ( !paddr )
> +        panic("%s: first MMIO resource not found\n", node->full_name);
> +
> +    aplic.paddr_start = paddr;
> +    aplic.size = size;
> +
> +    aplic.regs = ioremap(paddr, size);

Doesn't size need to match certain constraints? If too low, you may
need to panic(), while if too high you may not need to map the entire
range?

Does paddr perhaps also need to match certain contraints, like having
the low so many bits clear?

> +static struct intc_hw_operations __ro_after_init aplic_ops = {
> +    .info                = &aplic_info,
> +    .init                = aplic_init,
> +};

Why's this __ro_after_init and not simply const? I can't spot any write
to it.

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

Wants updating again.

> +#include <xen/types.h>
> +
> +#include <asm/imsic.h>
> +
> +#define APLIC_DOMAINCFG_IE      BIT(8, UL)
> +#define APLIC_DOMAINCFG_DM      BIT(2, UL)

Why UL when ...

> +struct aplic_regs {
> +    uint32_t domaincfg;

... this is just 32 bits wide?

Jan

