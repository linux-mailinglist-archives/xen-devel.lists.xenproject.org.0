Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457AA87BEC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 11:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949451.1345983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GAj-0000gN-D8; Mon, 14 Apr 2025 09:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949451.1345983; Mon, 14 Apr 2025 09:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GAj-0000e6-9c; Mon, 14 Apr 2025 09:32:09 +0000
Received: by outflank-mailman (input) for mailman id 949451;
 Mon, 14 Apr 2025 09:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4GAi-0000dz-F5
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 09:32:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53bcb45d-1913-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 11:32:05 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso33757385e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 02:32:05 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:5948:62cb:7cd1:ada3?
 (p200300cab71f2f7e594862cb7cd1ada3.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:5948:62cb:7cd1:ada3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cb29sm10443853f8f.76.2025.04.14.02.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 02:32:03 -0700 (PDT)
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
X-Inumbo-ID: 53bcb45d-1913-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744623124; x=1745227924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/zJAwQGWO7yYeKuPelAIdkwx8gqTyoWrkRl42WQg1iI=;
        b=DAGyOFwvyj+tqjeIHzM3QZV8ko1vXkcjz0eCNnXpvSQ28Wi7gKOqGPPP0rAoJgz9se
         uvPGg8jgCgQee10LLleDC2u1bEqFC8RkEznyEiysL/S845pUufsHppBX1KfVAG69nJ7O
         K4YwdblUTHZrdjqLdq8bcBQj0UBTaraEMKSmdOfrmRDIhZ7MucH/49lv78Q0OLq66DoP
         f8EJmhRNpMdSs3pM5Lgi20OkYj0b172R4CdWjpVQdTACHr3JTpNTmXVrP7pHjbIeXpXP
         Yw3w1wX5CFQbPzYoPP7DP5+4WnjoTd4QejziezIOn6lxGlgdmhdQD1hngv7JoQUqjj3z
         jn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623124; x=1745227924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zJAwQGWO7yYeKuPelAIdkwx8gqTyoWrkRl42WQg1iI=;
        b=HsjglLJA+hZUo0F6eXyAIgQE4EX3GXVhYRAEZEyqcUDuIofxuejVUG0xbev6aNOeKY
         VFuXihjV2BLUH4jR9fhS5FtKrIuFiRB0ZZkgF7LVXCR/oQXpXXMWAnxn3eK8KzVQ818W
         dx6ziE74nD79N9u3hp6AvW9k+SAVJEgQwaU0HLC6nGwygXbPWp0YA14uDig5K7XwoZcb
         wCok8cbTdLmCLX+C3e03BfSW24TLgdyVBBjyeBb4YT46KhoGPjSmF957AhN+rXd1ZObl
         XP/Dnm4H9PGzBcAkSV8iCQk4KfobNDHfRIKXHgZvvFfVw/rHLklwcJ86s56GTsS3r7VV
         zDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5/T3MhpsINH52l7u4+0dg5bDvtdma2/xloeQAJM76zQluDPMn9k/rt9YpSyvbQHbJyFLb7l+iXTo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaCyO+rLE51ERBc+9mYdbvzLE8NNxPWrIx4xmYwJRzIj5KpKX8
	RCeqo7kYrfr8mCv+2GtAjRJehhZ4cHcWgi3mVxLIBfiI2KSNSzOULYVxYMdN9A==
X-Gm-Gg: ASbGnctrwZ0ZQoC2AyhW2ck5TaQ6JRBlAkKATszL5835v4j7srVYooQLeZGlFZRd1qa
	tXaKyofOeLVQW3YGFRo4kJbv+QLSWGXICXZ6ak8l+1TWDbHCc7DWP6UjkDltCkKNfdmgrATubVN
	gjIQn0JmvXLmN//8Qwbw8ORSnFG/S+7mOGvdksvlJhlNyHMXF7+KjD3wJbGBOoHJJr0FmM3vk8J
	TAc9dMjXbHiv7pTbxMXRsvO/+ZJXhyPNSTSJN0I3S+di7eaBw6bww9vpvguDy+Y95dVDzihyavO
	M6miyfNOpwrABfEiR4clLdg/4Nlp2LVjNC+ImhAFqcu7Jp02Tk+aJ6Ib88YwARG+nck73yZG7by
	zenRSyOJXapQXdrcmG9L0xJqVjHaYSh0L6vLv09srYapYptA7zIu6KURPssgDIkOZLvs9JnNM0g
	I=
X-Google-Smtp-Source: AGHT+IESid8hvrimgTd+ToMA+b6gxajuy9w+id/Ay73GWOxKT5q94LXMyinSPfnWLcPdaVH/JR98bQ==
X-Received: by 2002:a5d:6da4:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-39ea51d108bmr9570135f8f.3.1744623124241;
        Mon, 14 Apr 2025 02:32:04 -0700 (PDT)
Message-ID: <78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com>
Date: Mon, 14 Apr 2025 11:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/14] xen/riscv: imsic_init() implementation
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
 <09e0fcd64f97062441a68102ead520b818150fe9.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <09e0fcd64f97062441a68102ead520b818150fe9.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/imsic.c
> @@ -0,0 +1,286 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/imsic.c
> + *
> + * RISC-V Incoming MSI Controller support
> + *
> + * (c) 2023 Microchip Technology Inc.
> + * (c) 2024 Vates

No 2025 here (if already the years matter)?

> + */
> +
> +#include <xen/const.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/macros.h>
> +#include <xen/xmalloc.h>
> +
> +#include <asm/imsic.h>
> +
> +static struct imsic_config imsic_cfg;
> +
> +const struct imsic_config *imsic_get_config(void)

Does this need to return a pointer to non-const?

> +{
> +    return &imsic_cfg;
> +}
> +
> +static int __init imsic_get_parent_hartid(struct dt_device_node *node,
> +                                          unsigned int index,
> +                                          unsigned long *hartid)
> +{
> +    int res;
> +    unsigned long hart;
> +    struct dt_phandle_args args;
> +
> +    /* Try the new-style interrupts-extended first */

The comment says "first", but then ...

> +    res = dt_parse_phandle_with_args(node, "interrupts-extended",
> +                                     "#interrupt-cells", index, &args);
> +    if ( !res )
> +    {
> +        res = riscv_of_processor_hartid(args.np->parent, &hart);
> +        if ( res < 0 )
> +            return -EINVAL;
> +
> +        *hartid = hart;
> +    }
> +    return res;
> +}

... nothing else is being tried.

Also, nit: Blank line please ahead of the main "return" of a function.

Further - any particular reason to discard riscv_of_processor_hartid()'s
error code on the error path?

> +
> +

Nit: No double blank lines please (and I wish I wouldn't need to repeat
this any further).

> +static int imsic_parse_node(struct dt_device_node *node,
> +                     unsigned int *nr_parent_irqs)
> +{
> +    int rc;
> +    unsigned int tmp;
> +    paddr_t base_addr;
> +
> +    /* Find number of parent interrupts */
> +    *nr_parent_irqs = dt_number_of_irq(node);
> +    if ( !*nr_parent_irqs )
> +    {
> +        printk(XENLOG_ERR "%s: no parent irqs available\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of guest index bits in MSI address */
> +    rc = dt_property_read_u32(node, "riscv,guest-index-bits",
> +                              &imsic_cfg.guest_index_bits);
> +    if ( !rc )

It is confusing to store a bool return value in a local "int" variable,
just to then use it as boolean. Is the local var needed at all here?

> +        imsic_cfg.guest_index_bits = 0;
> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
> +    if ( tmp < imsic_cfg.guest_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: guest index bits too big\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of HART index bits */
> +    rc = dt_property_read_u32(node, "riscv,hart-index-bits",
> +                              &imsic_cfg.hart_index_bits);
> +    if ( !rc )
> +    {
> +        /* Assume default value */
> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
> +            imsic_cfg.hart_index_bits++;
> +    }
> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
> +          imsic_cfg.guest_index_bits;

    tmp -= imsic_cfg.guest_index_bits;

? (And then similarly further down.)

> +    if ( tmp < imsic_cfg.hart_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: HART index bits too big\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of group index bits */
> +    rc = dt_property_read_u32(node, "riscv,group-index-bits",
> +                              &imsic_cfg.group_index_bits);
> +    if ( !rc )
> +        imsic_cfg.group_index_bits = 0;
> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT -
> +          imsic_cfg.guest_index_bits - imsic_cfg.hart_index_bits;
> +    if ( tmp < imsic_cfg.group_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: group index bits too big\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find first bit position of group index */
> +    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
> +    rc = dt_property_read_u32(node, "riscv,group-index-shift",
> +                              &imsic_cfg.group_index_shift);
> +    if ( !rc )
> +        imsic_cfg.group_index_shift = tmp;
> +    if ( imsic_cfg.group_index_shift < tmp )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too small\n", node->name);
> +        return -ENOENT;
> +    }
> +    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
> +    if ( tmp >= BITS_PER_LONG )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too big\n", node->name);
> +        return -EINVAL;
> +    }
> +
> +    /* Find number of interrupt identities */
> +    rc = dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids);
> +    if ( !rc )
> +    {
> +        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
> +               node->name);
> +        return -ENOENT;
> +    }
> +
> +    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
> +         (imsic_cfg.nr_ids >= IMSIC_MAX_ID) ||

Something named "max" normally wants to decribe the highest valid value,
not the first out-of-range one.

> +         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )
> +    {
> +        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
> +               node->name);
> +        return -EINVAL;
> +    }
> +
> +    /* Compute base address */
> +    imsic_cfg.nr_mmios = 0;
> +    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
> +    if (rc)

Nit: Style.

> +    {
> +        printk(XENLOG_ERR "%s: first MMIO resource not found\n", node->name);
> +        return -EINVAL;

Discarding "rc" again?

> +    }
> +
> +    imsic_cfg.base_addr = base_addr;
> +    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
> +                   imsic_cfg.hart_index_bits +
> +                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
> +    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
> +                   imsic_cfg.group_index_shift);

Besides indentation being bogus here, why is it that you need to mask bits
off of the value read from DT? Wouldn't the expectation be that you get back
the true base address?

> +    /* Find number of MMIO register sets */
> +    imsic_cfg.nr_mmios++;
> +    while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) )
> +        imsic_cfg.nr_mmios++;

And the base addresses of these aren't of interest? Oh, I see they're
fetched again further down.

Also - use do-while here?

> +    return 0;
> +}
> +
> +int __init imsic_init(struct dt_device_node *node)
> +{
> +    int rc;
> +    unsigned long reloff, hartid;
> +    uint32_t nr_parent_irqs, index, nr_handlers = 0;
> +    paddr_t base_addr;
> +
> +    /* Parse IMSIC node */
> +    rc = imsic_parse_node(node, &nr_parent_irqs);
> +    if ( rc )
> +        return rc;
> +
> +    /* Allocate MMIO resource array */
> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, imsic_cfg.nr_mmios);
> +    if ( !imsic_cfg.mmios )
> +        return -ENOMEM;
> +
> +    /* check MMIO register sets */
> +    for ( int i = 0; i < imsic_cfg.nr_mmios; i++ )

No plain int please for anything that can only be non-negative.

> +    {
> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
> +                                   &imsic_cfg.mmios[i].size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%s:  unable to parse MMIO regset %d\n",
> +                   node->name, i);
> +            goto imsic_init_err;
> +        }
> +
> +        base_addr = imsic_cfg.mmios[i].base_addr;
> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
> +                   imsic_cfg.hart_index_bits +
> +                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
> +                   imsic_cfg.group_index_shift);

Indentation again.

> +        if ( base_addr != imsic_cfg.base_addr )
> +        {
> +            rc = -EINVAL;
> +            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
> +                   node->name, i);
> +            goto imsic_init_err;
> +        }

Oh, all of the addresses need to (sufficiently) match.

> +    }
> +
> +    /* Configure handlers for target CPUs */
> +    for ( int i = 0; i < nr_parent_irqs; i++ )
> +    {
> +        rc = imsic_get_parent_hartid(node, i, &hartid);
> +        if ( rc )
> +        {
> +            printk(XENLOG_WARNING "%s: hart ID for parent irq%d not found\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        if ( hartid > NR_CPUS )
> +        {
> +            printk(XENLOG_WARNING "%s: unsupported hart ID=%lu for parent irq%d\n",
> +                   node->name, hartid, i);
> +            continue;
> +        }
> +
> +        /* Find MMIO location of MSI page */
> +        index = imsic_cfg.nr_mmios;
> +        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
> +        for ( int j = 0; imsic_cfg.nr_mmios; j++ )
> +        {
> +            if ( reloff < imsic_cfg.mmios[j].size )
> +            {
> +                index = j;
> +                break;
> +            }
> +
> +            /*
> +             * MMIO region size may not be aligned to
> +             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
> +             * if holes are present.
> +             */
> +            reloff -= ROUNDUP(imsic_cfg.mmios[j].size,
> +                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
> +        }
> +
> +        if ( index >= imsic_cfg.nr_mmios )
> +        {
> +            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%d\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        if ( !IS_ALIGNED(imsic_cfg.msi[hartid].base_addr + reloff, PAGE_SIZE) )
> +        {
> +            printk(XENLOG_WARNING "%s: MMIO address 0x%lx is not aligned on a page\n",
> +                   node->name, imsic_cfg.msi[hartid].base_addr + reloff);
> +            imsic_cfg.msi[hartid].offset = 0;
> +            imsic_cfg.msi[hartid].base_addr = 0;
> +            continue;
> +        }
> +
> +        imsic_cfg.mmios[index].harts[hartid] = true;
> +        imsic_cfg.msi[hartid].base_addr = imsic_cfg.mmios[index].base_addr;
> +        imsic_cfg.msi[hartid].offset = reloff;
> +        nr_handlers++;
> +    }
> +
> +    if ( !nr_handlers )
> +    {
> +        printk(XENLOG_ERR "%s: No CPU handlers found\n", node->name);
> +        rc = -ENODEV;
> +        goto imsic_init_err;
> +    }
> +
> +    return 0;
> +
> +imsic_init_err:

Labels indented by at least one blank please.

> +    xfree(imsic_cfg.mmios);

Better use XFREE() in cases like this one?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/imsic.h
> + *
> + * RISC-V Incoming MSI Controller support
> + *
> + * (c) 2023 Microchip Technology Inc.
> + */
> +
> +#ifndef ASM__RISCV__IMSIC_H
> +#define ASM__RISCV__IMSIC_H
> +
> +#include <xen/types.h>
> +
> +#define IMSIC_MMIO_PAGE_SHIFT   12
> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
> +
> +#define IMSIC_MIN_ID            63
> +#define IMSIC_MAX_ID            2048
> +
> +struct imsic_msi {
> +    paddr_t base_addr;
> +    unsigned long offset;
> +};
> +
> +struct imsic_mmios {
> +    paddr_t base_addr;
> +    unsigned long size;
> +    bool harts[NR_CPUS];

An array of bool - won't a bitmap do here? Even then I wouldn't be overly
happy to see it dimensioned by NR_CPUS.

> +};
> +
> +struct imsic_config {
> +    /* base address */
> +    paddr_t base_addr;
> +
> +    /* Bits representing Guest index, HART index, and Group index */
> +    unsigned int guest_index_bits;
> +    unsigned int hart_index_bits;
> +    unsigned int group_index_bits;
> +    unsigned int group_index_shift;
> +
> +    /* imsic phandle */
> +    unsigned int phandle;
> +
> +    /* number of parent irq */
> +    unsigned int nr_parent_irqs;
> +
> +    /* number off interrupt identities */
> +    unsigned int nr_ids;
> +
> +    /* mmios */
> +    unsigned int nr_mmios;
> +    struct imsic_mmios *mmios;
> +
> +    /* MSI */
> +    struct imsic_msi msi[NR_CPUS];

You surely can avoid wasting perhaps a lot of memory by allocating this
based on the number of CPUs in use?

> +};
> +
> +struct dt_device_node;
> +int imsic_init(struct dt_device_node *n);

Misra demands that parameter names match between declaration and definition.

> +struct imsic_config;

I don't think you need this, as it's ...

> +const struct imsic_config *imsic_get_config(void);

... not used as parameter type (where its scope would otherwise be wrongly
limited).

Jan

