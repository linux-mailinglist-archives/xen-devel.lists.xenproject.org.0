Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A117BA87CD2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949524.1346034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GgJ-0001yE-2s; Mon, 14 Apr 2025 10:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949524.1346034; Mon, 14 Apr 2025 10:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GgI-0001vC-Vs; Mon, 14 Apr 2025 10:04:46 +0000
Received: by outflank-mailman (input) for mailman id 949524;
 Mon, 14 Apr 2025 10:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4GgH-0001v6-UA
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:04:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c4c55b-1917-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:04:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so33012135e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:04:44 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:5948:62cb:7cd1:ada3?
 (p200300cab71f2f7e594862cb7cd1ada3.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:5948:62cb:7cd1:ada3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d802sm179956965e9.1.2025.04.14.03.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:04:43 -0700 (PDT)
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
X-Inumbo-ID: e3c4c55b-1917-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744625084; x=1745229884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lZByXNsJeVL76OgNfArCw/XNKZ9DCbfDK2JLJrf2OGk=;
        b=UaOlZp4LtnL2pDKsHkYU2QSq4Gai3mzQdizeeRrzuRDtQhLjqjlDpQp73krOJ8uQzY
         5CSmCUC3p/cROLKdMNMw4zWTHCrndbGNthzQZNd8ylWIxKFgGElQUSjS4NZdWxD39PGZ
         DmcDqH7lHjXEPrffIbpXxQ/3JQWv/znyUco6cHPtnYYR/ILE6YLfK7LwwpY7EUaj/RpN
         pwelYwcrD4S7f7hlGkHr9kZofNLfabJJplJZgXIJa94F4xHW+1H8BbU3uxpAQRcfY1Md
         gUsrlPBgEKJ98ZEi/QlL+BW7bTjwapfyevFt1STU1SB1Ff6raTpj3SgqA/fq2zi5VErZ
         vQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625084; x=1745229884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZByXNsJeVL76OgNfArCw/XNKZ9DCbfDK2JLJrf2OGk=;
        b=ko3+WP84NNrXw7b0cZxcSB+jJLjTyKS3zBnezg61jMWkoICOQHTWW+gl4lEy4zV110
         YQRbKKVT6wpJU/ZAmCUrYtaKmq4v/3KHQR0MQVKJM+0ZmDtKEYh+fze0BFoVS39AMDtS
         Sf3Bz8LDuKS+3zCUxsC5jvCaUpzydOGQ6mjxR2CzXvi3VdC5k02LsM1wLLQwBHa8u1Hx
         EcYjYoWJNb2bmQgKsIYnPQ0Zaf+JBvScon+tA4GXZaV4pV56sjG5NX+dVDIyG4Fk5Ol9
         EPmIXRpNRIrwX4VWgHBZixLpjKk7qPxHG0uzRFnjJsfm9ennr7x7k0wFSEfSso74Ub12
         S8cA==
X-Forwarded-Encrypted: i=1; AJvYcCXBA3hjvbQJUgrwtXHqf0JqzT/jicWAT/HYTRjA7hOmlEYzOWBjvDy6S11EtcCixBbI2wwBHJ5EH1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFHfq4ufxhkR6arJCdBLsVRUhbPU/p56wgMh0nBYyWxuKXE5TH
	IGVekHrsdzBOhzFBVIa4Bhc1MnHrAl6W5LG5rvkt1/HxwBAANfWu9mukesXzAA==
X-Gm-Gg: ASbGnctJ2Oxlm5hHMY/smkFr2EBS10xlZgN5jyrVBEf1kFswsVTkg89j2iWzc3n25yq
	cw99FoII/QTen1P6wIMYB5BCiIQJcnl0clIWUPi5FYIaXIgo/aYWlh+/xxi89fR+KyHlJSL10K1
	f9l2rK7CVyxaTiy3YF450euAmzYWTP6lJSSd3yK3S/pJMdHGBzjjldTXdys/EWJG38hSEz1lIw3
	cXa2IXi41NAlQkQhUnjAqdReXU2ZtnTmk5bYI8B0vDG9KzFHNXN6Lgfm4yKshuJqMrveCWvkAjp
	lTR5XwAjrwgTEmRlYmVulq6I/IDUvBSAPPPQjkPXnaVrqRxX5FAfObVLmgKYOhISG3bTAWXrZow
	BRGBMuezg+xbv+IVzWBLojSQswgkX7oq5fNCLGHkGBowPyT0MwXBBRZRro/mtSQF2mpn7mAnje5
	7HAXVcCb5ifA==
X-Google-Smtp-Source: AGHT+IHd8upMeByDfn/olWGXLzs55OeXoe6mWiwDybNxH3bRqfZ16tPeRdHpqd6fy5hAjLtA0dTs7g==
X-Received: by 2002:a05:600c:8705:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43f3a9b0201mr117257715e9.27.1744625083851;
        Mon, 14 Apr 2025 03:04:43 -0700 (PDT)
Message-ID: <a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com>
Date: Mon, 14 Apr 2025 12:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/14] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -9,19 +9,112 @@
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
>  
> +#include <asm/aplic.h>
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
> +    int i;
> +
> +    /* Disable all interrupts */
> +    for ( i = 0; i <= aplic_info.nr_irqs; i += 32 )
> +        aplic.regs->clrie[i] = -1U;
> +
> +    /* Set interrupt type and default priority for all interrupts */
> +    for ( i = 1; i <= aplic_info.nr_irqs; i++ )
> +    {
> +        aplic.regs->sourcecfg[i - 1] = 0;
> +        aplic.regs->target[i - 1] = APLIC_DEFAULT_PRIORITY;

A field named "target" is written with a priority value?

> +    }
> +
> +    /* Clear APLIC domaincfg */
> +    aplic.regs->domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;

The statement doesn't like like there was any "clearing" here.

> +}
> +
> +static int __init aplic_init(void)
> +{
> +    int rc;
> +    dt_phandle imsic_phandle;
> +    uint32_t irq_range[2];
> +    const __be32 *prop;
> +    uint64_t size, paddr;
> +    struct dt_device_node *imsic_node;
> +    const struct dt_device_node *node = aplic_info.node;
> +
> +    /* check for associated imsic node */

Nit: Comment style (also elsewhere).

> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
> +    if ( !rc )
> +        panic("%s: IDC mode not supported\n", node->full_name);
> +
> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
> +    if ( !imsic_node )
> +        panic("%s: unable to find IMSIC node\n", node->full_name);
> +
> +    /* check imsic mode */
> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
> +                                    irq_range, ARRAY_SIZE(irq_range));
> +    if ( rc && (rc != -EOVERFLOW) )
> +        panic("%s: unable to find interrupt-extended in %s node\n",
> +               node->full_name, imsic_node->full_name);

Why exactly is EOVERFLOW tolerable here?

> +    if ( irq_range[1] == IRQ_M_EXT )
> +        /* machine mode imsic node, ignore this aplic node */
> +        return 0;
> +
> +    rc = imsic_init(imsic_node);
> +    if ( rc )
> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);
> +
> +    /* Find out number of interrupt sources */
> +    rc = dt_property_read_u32(node, "riscv,num-sources", &aplic_info.nr_irqs);
> +    if ( !rc )
> +        panic("%s: failed to get number of interrupt sources\n",
> +              node->full_name);
> +
> +    prop = dt_get_property(node, "reg", NULL);
> +    dt_get_range(&prop, node, &paddr, &size);
> +    if ( !paddr )
> +        panic("%s: first MMIO resource not found\n", node->full_name);
> +
> +    aplic.paddr_start = paddr;
> +    aplic.paddr_end = paddr + size;
> +    aplic.size = size;

Why do all three need recording? Isn't a (start,size) tuple sufficient
(and unambiguous)?

> +    aplic.regs = ioremap(paddr, size);
> +    if ( !aplic.regs )
> +        panic("%s: unable to map\n", node->full_name);
> +
> +    /* Setup initial state APLIC interrupts */
> +    aplic_init_hw_interrupts();
> +
> +    return 0;
> +}
> +
> +static const struct intc_hw_operations __ro_after_init aplic_ops = {

const or __ro_after_init?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic.h
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) 2023 Microchip.
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
> +
> +    uint32_t genmsi;
> +    uint32_t target[1023];
> +};
> +
> +struct aplic_priv {
> +    /* base physical address and size */
> +    paddr_t paddr_start;
> +    paddr_t paddr_end;
> +    size_t  size;
> +
> +    /* registers */
> +    volatile struct aplic_regs *regs;
> +
> +    /* imsic configuration */
> +    const struct imsic_config *imsic_cfg;
> +};
> +
> +#endif /* ASM__RISCV__APLIC_H */

Does all of this really need to live in a non-private header?

> --- a/xen/arch/riscv/include/asm/irq.h
> +++ b/xen/arch/riscv/include/asm/irq.h
> @@ -27,7 +27,6 @@
>  #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
>  
>  /* TODO */
> -#define nr_irqs 0U

How come this is simply no longer needed, i.e. without any replacement?
Hmm, looks like the only use in common code has gone away. Yet then this
still doesn't really look to belong here (especially if not mentioned in
the description).

Jan

