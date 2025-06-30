Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453CAEE0B3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 16:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029137.1402881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFUN-0006XW-St; Mon, 30 Jun 2025 14:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029137.1402881; Mon, 30 Jun 2025 14:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWFUN-0006VI-Q3; Mon, 30 Jun 2025 14:28:07 +0000
Received: by outflank-mailman (input) for mailman id 1029137;
 Mon, 30 Jun 2025 14:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWFUM-0006VC-0C
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 14:28:06 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e08a87f-55be-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 16:28:02 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1691584f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 07:28:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e300468esm8355889a12.7.2025.06.30.07.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 07:28:01 -0700 (PDT)
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
X-Inumbo-ID: 6e08a87f-55be-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751293682; x=1751898482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tNAzRwSUmpb40GYW3sbkxbQ/2GJEtF2fvN/x6Jdlwwo=;
        b=JwmTqcQ6SHLiJD+1WOa+To8jaSpKh9QeMNzOPIHC+O1xFRZ2Yfbkq5n6iaTR4c1Rm0
         2tiQ1yHl/OE6jeqYPGNLSVN1e27D7861wXulNaNrr0n6hdwI/d0ddYcfemZ7f8dm/j7m
         DjbfttAnxsoprfUGhgYCcF1L0Du2vzpy+E9rHxkdDkP3DGo7CUn5ZMKOYhZMbzYIazS+
         7vZTx/A5Jrq4BKKkxEgHx0AVVjp9iES2imeupJjcC5UZ2FNvohGX4DUZJnUBPQ9dwyMO
         XaiaX32jpPE0v0TWI/hKfROc8B78GdyB7XTvvFvIf2md72qFj2aBsTbZv3zJH0NRVYui
         tSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293682; x=1751898482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNAzRwSUmpb40GYW3sbkxbQ/2GJEtF2fvN/x6Jdlwwo=;
        b=oD1ClyDOjs2KXXo4J6UnSsXaKh5+uuCFOKAtL34Cqx1gHbhjdqaGiM3ecHCWnzg5JX
         LxwnoGs5h74gjUKHSqBD6KxYxN3yAe74+CSsLkrpNyzFwaNuGDZQlOWJQB3FrrtgKMcZ
         caFNiDeaSyVD+/jrM6AaDYls3JZD7UTdJGRY0l8pwkH9zgtw+q37ZPeTELcVcHzzoV9H
         4opIHP36ujZXKuRADW7kwhOJ5C/TQ+3CKDqdR/sAXKQ6wtVc7urITXU+eeKZZeJVfrWK
         yBU8+lFXgyNXeL1G1exBy64vEHfR634Vr9Tg3UktT12JfGHR/DfUYM5P25OF1KyzcfU2
         1LxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZK0AixFF31NAT7wpVKKR0gnhTht5RyeG9ViiAY+6fs12gEo4KD/8E+9kSkqS6S5Ti+yLIIW+R05o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyhs51xCUz+vvBIKntgb4YEbl7WydWU4jQTv039MKlCRI8Wa6lf
	iRpN96CTu7EjO2YjQRno2bmv6/+XNyqzq95YeEHbo5SNBP9d9VNK6Ff0AHyq8m556g==
X-Gm-Gg: ASbGncuU3igsRd4CxzrpMj4RWKHrs49MaK1190FEcvgkhBq2LfzqiRJqrrbGjsrVVNX
	1/Gxfzu+KlZ+Jud/2gt5G9Ou2cFge1rHphgbsNjTUWPBJ0v9WWa63T8RhC03TVYhAz9d4718HLA
	6dmwiaP8owtSv77TFMwzreQEcrLcI2jtYv66SH0U9J/ZGD3eiagsWcI8que1wm/IQh3cfxKoumV
	SqEbtYJUcb8MQApfUORpnC7MBTFgWXVO6mwPaTsxqtXfn9qgvIxr3H6/1pV/QBYu0SU3c6d9A74
	WD9JpzPrTsaS6LtbJ4x8duvk/RiHnvmcFuod04/rszP79Gbm4llfiG+4TsuhtGYIwP0FmfUE2C+
	l/NvuzzHCfwOQIVLxxYrJHOIty9tU3u4TGsCyyYoV7lxqtdc=
X-Google-Smtp-Source: AGHT+IHHGfWC8YLezkbzCmhGV8Qs5Go3t/7edFFahQom+qMY9Xy30I8L1bLuvexpti0+fT1ZNxxLqg==
X-Received: by 2002:adf:9d8b:0:b0:3a5:2f23:3789 with SMTP id ffacd0b85a97d-3a8f4b0ab87mr9350179f8f.15.1751293681992;
        Mon, 30 Jun 2025 07:28:01 -0700 (PDT)
Message-ID: <2d06fcf9-0aa8-48d7-84bd-4dd700a22da8@suse.com>
Date: Mon, 30 Jun 2025 16:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
 <0b366c5b7c8d34a98c8ec4bedf1f00b070a6fae1.1749825782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b366c5b7c8d34a98c8ec4bedf1f00b070a6fae1.1749825782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:48, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/imsic.c
> @@ -0,0 +1,369 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/imsic.c
> + *
> + * RISC-V Incoming MSI Controller support
> + *
> + * (c) Microchip Technology Inc.
> + * (c) Vates
> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/const.h>
> +#include <xen/cpumask.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/macros.h>
> +#include <xen/smp.h>
> +#include <xen/spinlock.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <asm/imsic.h>
> +
> +#define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
> +
> +struct imsic_mmios {
> +    paddr_t base_addr;
> +    unsigned long size;
> +};
> +
> +static struct imsic_config imsic_cfg;
> +
> +/* Callers aren't intended to changed imsic_cfg so return const. */
> +const struct imsic_config *imsic_get_config(void)
> +{
> +    return &imsic_cfg;
> +}
> +
> +static int __init imsic_get_parent_hartid(const struct dt_device_node *node,
> +                                          unsigned int index,
> +                                          unsigned long *hartid)
> +{
> +    int res;
> +    struct dt_phandle_args args;
> +
> +    res = dt_parse_phandle_with_args(node, "interrupts-extended",
> +                                     "#interrupt-cells", index, &args);
> +    if ( !res )
> +        res = dt_processor_hartid(args.np->parent, hartid);
> +
> +    return res;
> +}
> +
> +/*
> + * Parses IMSIC DT node.
> + *
> + * Returns 0 if initialization is successful, a negative value on failure,
> + * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
> + * which should be ignored by the hypervisor.
> + */
> +static int imsic_parse_node(const struct dt_device_node *node,
> +                            unsigned int *nr_parent_irqs,
> +                            unsigned int *nr_mmios)
> +{
> +    int rc;
> +    unsigned int tmp;
> +    paddr_t base_addr;
> +    uint32_t *irq_range;
> +
> +    *nr_parent_irqs = dt_number_of_irq(node);
> +    if ( !*nr_parent_irqs )
> +        panic("%s: irq_num can't be 0. Check %s node\n", __func__,
> +              dt_node_full_name(node));
> +
> +    irq_range = xvzalloc_array(uint32_t, *nr_parent_irqs * 2);
> +    if ( !irq_range )
> +        panic("%s: irq_range[] allocation failed\n", __func__);
> +
> +    if ( (rc = dt_property_read_u32_array(node, "interrupts-extended",
> +                                    irq_range, *nr_parent_irqs * 2)) )

Nit: Indentation.

> +        panic("%s: unable to find interrupt-extended in %s node: %d\n",
> +              __func__, dt_node_full_name(node), rc);
> +
> +    /* Check that interrupts-extended property is well-formed. */
> +    for ( unsigned int i = 2; i < (*nr_parent_irqs * 2); i += 2 )
> +    {
> +        if ( irq_range[i + 1] != irq_range[1] )
> +            panic("%s: mode[%u] != %u\n", __func__, i + 1, irq_range[1]);
> +    }
> +
> +    if ( irq_range[1] == IRQ_M_EXT )
> +    {
> +        /* Machine mode imsic node, ignore it. */
> +        xfree(irq_range);

xvfree()

> +        return IRQ_M_EXT;
> +    }
> +
> +    xfree(irq_range);

Again.

> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
> +                               &imsic_cfg.guest_index_bits) )
> +        imsic_cfg.guest_index_bits = 0;
> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
> +    if ( tmp < imsic_cfg.guest_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
> +               dt_node_name(node));
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of HART index bits */
> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
> +                               &imsic_cfg.hart_index_bits) )
> +        /* Assume default value */
> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1);
> +    tmp -= imsic_cfg.guest_index_bits;
> +    if ( tmp < imsic_cfg.hart_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: HART index bits too big\n",
> +               dt_node_name(node));
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of group index bits */
> +    if ( !dt_property_read_u32(node, "riscv,group-index-bits",
> +                               &imsic_cfg.group_index_bits) )
> +        imsic_cfg.group_index_bits = 0;
> +    tmp -= imsic_cfg.hart_index_bits;
> +    if ( tmp < imsic_cfg.group_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: group index bits too big\n",
> +               dt_node_name(node));
> +        return -ENOENT;
> +    }
> +
> +    /* Find first bit position of group index */
> +    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
> +    if ( !dt_property_read_u32(node, "riscv,group-index-shift",
> +                               &imsic_cfg.group_index_shift) )
> +        imsic_cfg.group_index_shift = tmp;
> +    if ( imsic_cfg.group_index_shift < tmp )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too small\n",
> +               dt_node_name(node));
> +        return -ENOENT;
> +    }
> +    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
> +    if ( tmp >= BITS_PER_LONG )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too big\n",
> +               dt_node_name(node));
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of interrupt identities */
> +    if ( !dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids) )
> +    {
> +        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
> +               node->name);
> +        return -ENOENT;
> +    }
> +
> +    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
> +         (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
> +    {
> +        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
> +               node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Compute base address */
> +    *nr_mmios = 0;
> +    rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%s: first MMIO resource not found: %d\n",
> +               dt_node_name(node), rc);
> +        return rc;
> +    }
> +
> +    imsic_cfg.base_addr = base_addr;
> +    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
> +                                 imsic_cfg.hart_index_bits +
> +                                 IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
> +    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
> +                             imsic_cfg.group_index_shift);
> +
> +    /* Find number of MMIO register sets */
> +    do {
> +        (*nr_mmios)++;

Just to mention, this can be had without the need for parentheses: ++*nr_mmios;

> +    } while ( !dt_device_get_address(node, *nr_mmios, &base_addr, NULL) );
> +
> +    return 0;
> +}
> +
> +/*
> + * Initialize the imsic_cfg structure based on the IMSIC DT node.
> + *
> + * Returns 0 if initialization is successful, a negative value on failure,
> + * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
> + * which should be ignored by the hypervisor.
> + */
> +int __init imsic_init(const struct dt_device_node *node)
> +{
> +    int rc;
> +    unsigned long reloff, hartid;
> +    unsigned int nr_parent_irqs, index, nr_handlers = 0;
> +    paddr_t base_addr;
> +    unsigned int nr_mmios;
> +    struct imsic_mmios *mmios;
> +    struct imsic_msi *msi = NULL;
> +
> +    /* Parse IMSIC node */
> +    rc = imsic_parse_node(node, &nr_parent_irqs, &nr_mmios);
> +    /*
> +     * If machine mode imsic node => ignore it.
> +     * If rc < 0 => parsing of IMSIC DT node failed.
> +     */
> +    if ( (rc == IRQ_M_EXT) || (rc < 0) )
> +        return rc;
> +
> +    /* Allocate MMIO resource array */
> +    mmios = xvzalloc_array(struct imsic_mmios, nr_mmios);
> +    if ( !mmios )
> +    {
> +        rc = -ENOMEM;
> +        goto imsic_init_err;
> +    }
> +
> +    msi = xvzalloc_array(struct imsic_msi, nr_parent_irqs);
> +    if ( !msi )
> +    {
> +        rc = -ENOMEM;
> +        goto imsic_init_err;
> +    }
> +
> +    /* Check MMIO register sets */
> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
> +    {
> +        unsigned int guest_bits = imsic_cfg.guest_index_bits;
> +        unsigned long expected_mmio_size =
> +            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
> +
> +        rc = dt_device_get_address(node, i, &mmios[i].base_addr,
> +                                   &mmios[i].size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
> +                   node->name, i);
> +            goto imsic_init_err;
> +        }
> +
> +        base_addr = mmios[i].base_addr;
> +        base_addr &= ~(BIT(guest_bits +
> +                           imsic_cfg.hart_index_bits +
> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
> +                       imsic_cfg.group_index_shift);
> +        if ( base_addr != imsic_cfg.base_addr )
> +        {
> +            rc = -EINVAL;
> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
> +                   node->name, i);
> +            goto imsic_init_err;
> +        }
> +
> +        if ( mmios[i].size != expected_mmio_size )
> +        {
> +            rc = -EINVAL;
> +            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, expected MMIO size: %ld\n",
> +                   node->name, mmios[i].size, expected_mmio_size);
> +            goto imsic_init_err;
> +        }
> +    }
> +
> +    /* Configure handlers for target CPUs */
> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
> +    {
> +        unsigned int cpu;
> +
> +        rc = imsic_get_parent_hartid(node, i, &hartid);
> +        if ( rc )
> +        {
> +            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        cpu = hartid_to_cpuid(hartid);
> +
> +        /*
> +         * If .base_addr is not 0, it indicates that the CPU has already been
> +         * found.
> +         * In this case, skip re-initialization to avoid duplicate setup.
> +         * Also, print a warning message to signal that the DTS should be
> +         * reviewed for possible duplication.
> +         */
> +        if ( msi[cpu].base_addr )
> +        {
> +            printk("%s: cpu%d is found twice in interrupts-extended prop\n",
> +                  node->name, cpu);

%u please for unsigned int arguments.

> +            continue;
> +        }
> +
> +        if ( cpu >= num_possible_cpus() )
> +        {
> +            printk(XENLOG_WARNING "%s: unsupported hart ID=%#lx for parent irq%u\n",
> +                   node->name, hartid, i);
> +            continue;
> +        }
> +
> +        /* Find MMIO location of MSI page */
> +        reloff = i * IMSIC_HART_SIZE(imsic_cfg.guest_index_bits);
> +        for ( index = 0; index < nr_mmios; index++ )
> +        {
> +            if ( reloff < mmios[index].size )
> +                break;
> +
> +            /*
> +             * MMIO region size may not be aligned to
> +             * IMSIC_HART_SIZE(guest_index_bits) if
> +             * holes are present.
> +             */
> +            reloff -= ROUNDUP(mmios[index].size,
> +                      IMSIC_HART_SIZE(imsic_cfg.guest_index_bits));

Nit: Indentation again.

> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -3,6 +3,7 @@
>  #define ASM__RISCV__SMP_H
>  
>  #include <xen/cpumask.h>
> +#include <xen/macros.h>
>  #include <xen/percpu.h>
>  
>  #include <asm/current.h>
> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>      return pcpu_info[cpuid].hart_id;
>  }
>  
> +static inline unsigned int hartid_to_cpuid(unsigned long hartid)
> +{
> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )

We had been there before, I think: Why "cpuid", not "cpu" (as we have it about
everywhere else)?

Jan

