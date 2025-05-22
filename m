Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1AAC0EA2
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994128.1377175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7Cb-0008FM-Fg; Thu, 22 May 2025 14:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994128.1377175; Thu, 22 May 2025 14:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7Cb-0008Dv-Cx; Thu, 22 May 2025 14:47:21 +0000
Received: by outflank-mailman (input) for mailman id 994128;
 Thu, 22 May 2025 14:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI7CZ-0008Dn-Tg
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:47:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8c7e7a9-371b-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:47:18 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad5533c468cso842549566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:47:18 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d2720b7sm1075601866b.70.2025.05.22.07.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:47:17 -0700 (PDT)
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
X-Inumbo-ID: a8c7e7a9-371b-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747925238; x=1748530038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOZxNsCX6wG3tpIQHO5zMjjXtstA1cqpxf8cNPhrzes=;
        b=XZ8oscRsqFnTjX9m5xuikm25MCulVemHbOsPY/TjHn0ZuHKxl/tm8v9iJnYJdY5Lqd
         JLI7S9sYANp9b/JevXGblqHMAVOGn9Jek4su8a58XbcXVhJh0LdR4iStsI86fL/tVnJ0
         31R0Ern+fM/R3n8sflhlxIutWfYo+gPU/WLScRQcPRv8QLm10ooRodclMHR6zwJzDSk9
         lSFhFC+Gq2z7MVFTCTRSApR+mEn0zmHvnxg2dNh3v6G0jiPvkEgen4kwkMjPG4p087N+
         sFlkEw8fq8to9bHLBGvo+z2EkIAk/s1fZNvYtcvFKBbchc3gFD8577g53knc/kTxfkSs
         yoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925238; x=1748530038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOZxNsCX6wG3tpIQHO5zMjjXtstA1cqpxf8cNPhrzes=;
        b=EadAFTo/N4O5+hcw4hkgdmWpyCccvcMZv2BV2O94Z8Ha4RJC9aEIk7/QRE0jfJIzH8
         KbSEGdZ0uS4qN/wcK2Oc/Hzv1XiwcMfZ2qtuPmgjncp/k8FHnzrDTTtaRmXZF0jH0T/q
         U9aIgZ9k6efpprtU9dpXGoxsGqBAas4i40xVrsRXJpat5QaONanU6drjPBri3TntN3xz
         1sNN5OpHnfIiflifZUmTvyH+/9Vh5BpceSW7p7hgJUbx5wXBZzOPvOVNkbQQq5tG34UH
         loqS98BwnE3Lz8/HB4/010N1By3uwQ5mw/pX25LpQSVcpeqC+xd4oeI3/tSfAC6sF3MC
         M/cw==
X-Forwarded-Encrypted: i=1; AJvYcCVObyYqBbFpKpniouOdnhRGXHLfMh6RzKk9SNcisunbCUgqZdu30snLFlltJf2tzbJT0ytricbG36w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxuby4XxugXCH4tRhAvfePVAvUmFjyqO0KL/TsG5rvMpK8EV8np
	6Zrw40DxSV5bEV++lpy7sNwltJfscLEBDbKY2RpuaEH7v5ar/NkZlQPHxwX2y5Cz7Q==
X-Gm-Gg: ASbGncuwy0kume+NfFIKuh9h4ezZs66JaOawu/86wnpLJ09gFKRzgz+FSOqhp5a2TJA
	9d/jt/OO8FM+lRzNPgBcwaQun6EyJS0TZkNinf6eohLKI8ZZMJ2RpCQDJyfrDeHBL1JalPU0ysw
	76TiSywP985YFTNHMAmM/KB66sfTAPW09RBEipJ4cXq6SOYjwjpXCFMkOnybI9k4gpvZINbq9tB
	/ZYzvEJzuwwrV1pz0qoPE2giq9MJqXdU62frElAq5me6PbIOgzJ8OuoVqkVqok5klouSeDOdQvA
	VYq0kvE22RQ7wZV2mVzQ/de7PTmrPQ==
X-Google-Smtp-Source: AGHT+IFvLG2r0FNKYXg+YicOYkmTMCbUk3UmFoba8PeD9m8xcef5QzUH/0PBx4h/5ZusWIoHKzimOA==
X-Received: by 2002:a17:907:3e03:b0:ad4:c55e:ef8b with SMTP id a640c23a62f3a-ad536f9db9emr2044586466b.48.1747925237702;
        Thu, 22 May 2025 07:47:17 -0700 (PDT)
Message-ID: <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
Date: Thu, 22 May 2025 16:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
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
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/imsic.c
> @@ -0,0 +1,354 @@
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
> +#include <xen/xmalloc.h>
> +
> +#include <asm/imsic.h>
> +
> +static struct imsic_config imsic_cfg;
> +
> +/* Callers aren't expected to changed imsic_cfg so return const. */
> +const struct imsic_config *imsic_get_config(void)
> +{
> +    return &imsic_cfg;
> +}

Minor remark regarding the comment: Consider replacing "expected" by "supposed"
or "intended"?

> +/*
> + * Parses IMSIC DT node.
> + *
> + * Returns 0 if initialization is successful, a negative value on failure,
> + * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
> + * which should be ignored by the hypervisor.
> + */
> +static int imsic_parse_node(const struct dt_device_node *node,
> +                            unsigned int *nr_parent_irqs)
> +{
> +    int rc;
> +    unsigned int tmp;
> +    paddr_t base_addr;
> +    uint32_t *irq_range;
> +
> +    *nr_parent_irqs = dt_number_of_irq(node);
> +    if ( !*nr_parent_irqs )
> +        panic("%s: irq_num can be 0. Check %s node\n", __func__,
> +              dt_node_full_name(node));

DYM "can't be"?

> +    irq_range = xzalloc_array(uint32_t, *nr_parent_irqs * 2);
> +    if ( !irq_range )
> +        panic("%s: irq_range[] allocation failed\n", __func__);
> +
> +    if ( (rc = dt_property_read_u32_array(node, "interrupts-extended",
> +                                    irq_range, *nr_parent_irqs * 2)) )
> +        panic("%s: unable to find interrupt-extended in %s node: %d\n",
> +              __func__, dt_node_full_name(node), rc);
> +
> +    if ( irq_range[1] == IRQ_M_EXT )
> +    {
> +        /* Machine mode imsic node, ignore it. */
> +        rc = IRQ_M_EXT;
> +        goto cleanup;
> +    }

Wouldn't this better be done ...

> +    /* Check that interrupts-extended property is well-formed. */
> +    for ( unsigned int i = 2; i < (*nr_parent_irqs * 2); i += 2 )
> +    {
> +        if ( irq_range[i + 1] != irq_range[1] )
> +            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
> +    }

... after this consistency check?

Also %u please when you log unsigned values.

> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
> +                               &imsic_cfg.guest_index_bits) )
> +        imsic_cfg.guest_index_bits = 0;
> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
> +    if ( tmp < imsic_cfg.guest_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
> +               dt_node_name(node));
> +        rc = -ENOENT;
> +        goto cleanup;
> +    }
> +
> +    /* Find number of HART index bits */
> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
> +                               &imsic_cfg.hart_index_bits) )
> +    {
> +        /* Assume default value */
> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
> +            imsic_cfg.hart_index_bits++;

Since fls() returns a 1-based bit number, isn't it rather that in the
exact-power-of-2 case you'd need to subtract 1?

> +    }
> +    tmp -= imsic_cfg.guest_index_bits;
> +    if ( tmp < imsic_cfg.hart_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: HART index bits too big\n",
> +               dt_node_name(node));
> +        rc = -ENOENT;
> +        goto cleanup;
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
> +        rc = -ENOENT;
> +        goto cleanup;
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
> +        rc = -ENOENT;
> +        goto cleanup;
> +    }
> +    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
> +    if ( tmp >= BITS_PER_LONG )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too big\n",
> +               dt_node_name(node));
> +        rc = -EINVAL;
> +        goto cleanup;
> +    }
> +
> +    /* Find number of interrupt identities */
> +    if ( !dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids) )
> +    {
> +        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
> +               node->name);
> +        rc = -ENOENT;
> +        goto cleanup;
> +    }
> +
> +    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
> +         (imsic_cfg.nr_ids > IMSIC_MAX_ID) ||
> +         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )

Now that you've explained to me what the deal is with these constants: Isn't
the 1st of the three checks redundant with the last one?

> +    {
> +        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
> +               node->name);
> +        rc = -EINVAL;
> +        goto cleanup;
> +    }
> +
> +    /* Compute base address */
> +    imsic_cfg.nr_mmios = 0;
> +    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%s: first MMIO resource not found: %d\n",
> +               dt_node_name(node), rc);
> +        goto cleanup;
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
> +        imsic_cfg.nr_mmios++;
> +    } while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) );
> +
> + cleanup:
> +    xfree(irq_range);

Afacit you could free this array way earlier. That would then simplify quite
a few of the error paths, I think.

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
> +
> +    /* Parse IMSIC node */
> +    rc = imsic_parse_node(node, &nr_parent_irqs);
> +    /*
> +     * If machine mode imsic node => ignore it.
> +     * If rc < 0 => parsing of IMSIC DT node failed.
> +     */
> +    if ( (rc == IRQ_M_EXT) || rc )
> +        return rc;

The former of the checks is redundant with the latter. Did you perhaps mean
"rc < 0" for that one?

> +    nr_mmios = imsic_cfg.nr_mmios;
> +
> +    /* Allocate MMIO resource array */
> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);

How large can this and ...

> +    if ( !imsic_cfg.mmios )
> +    {
> +        rc = -ENOMEM;
> +        goto imsic_init_err;
> +    }
> +
> +    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);

... this array grow (in principle)? I think you're aware that in principle
new code is expected to use xvmalloc() and friends unless there are specific
reasons speaking against that.

> +    if ( !imsic_cfg.msi )
> +    {
> +        rc = -ENOMEM;
> +        goto imsic_init_err;
> +    }
> +
> +    /* Check MMIO register sets */
> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
> +    {
> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
> +        {
> +            rc = -ENOMEM;
> +            goto imsic_init_err;
> +        }
> +
> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
> +                                   &imsic_cfg.mmios[i].size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
> +                   node->name, i);
> +            goto imsic_init_err;
> +        }
> +
> +        base_addr = imsic_cfg.mmios[i].base_addr;
> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
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

Maybe just for my own understanding: There's no similar check for the
sizes to match / be consistent wanted / needed?

> +    }
> +
> +    /* Configure handlers for target CPUs */
> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
> +    {
> +        unsigned long xen_cpuid;
> +
> +        rc = imsic_get_parent_hartid(node, i, &hartid);
> +        if ( rc )
> +        {
> +            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        xen_cpuid = hartid_to_cpuid(hartid);

I'm probably biased by "cpuid" having different meaning on x86, but: To
be consistent with variable names elsewhere, couldn't this variable simply
be named "cpu"? With the other item named "hartid" there's no ambiguity
there anymore.

> +        if ( xen_cpuid >= num_possible_cpus() )
> +        {
> +            printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%u\n",
> +                   node->name, hartid, i);

The message continues to be ambiguous (to me as a non-RISC-V person at
least): You log a hart ID, while you say "cpu ID". Also, as I think I
said elsewhere already, the hart ID may better be logged using %#lx.

> +            continue;
> +        }
> +
> +        /* Find MMIO location of MSI page */
> +        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
> +        for ( index = 0; index < nr_mmios; index++ )
> +        {
> +            if ( reloff < imsic_cfg.mmios[index].size )
> +                break;
> +
> +            /*
> +             * MMIO region size may not be aligned to
> +             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
> +             * if holes are present.
> +             */
> +            reloff -= ROUNDUP(imsic_cfg.mmios[index].size,
> +                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);

Nit: Indentation once again.

> +        }
> +
> +        if ( index == nr_mmios )
> +        {
> +            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        if ( !IS_ALIGNED(imsic_cfg.msi[xen_cpuid].base_addr + reloff, PAGE_SIZE) )

If this is the crucial thing to check, ...

> +        {
> +            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on a page\n",
> +                   node->name, imsic_cfg.msi[xen_cpuid].base_addr + reloff);
> +            imsic_cfg.msi[xen_cpuid].offset = 0;
> +            imsic_cfg.msi[xen_cpuid].base_addr = 0;
> +            continue;
> +        }
> +
> +        cpumask_set_cpu(xen_cpuid, imsic_cfg.mmios[index].cpus);
> +
> +        imsic_cfg.msi[xen_cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
> +        imsic_cfg.msi[xen_cpuid].offset = reloff;

... why is it that the two parts are stored separately? If their sum needs to
be page-aligned, I'd kind of expect it's only ever the sum which is used?

Also is it really PAGE_SHIFT or rather IMSIC_MMIO_PAGE_SHIFT that needs
chacking against?

Further please pay attention to line length limits - there are at least two
violations around my earlier comment here.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/include/asm/imsic.h
> + *
> + * RISC-V Incoming MSI Controller support
> + *
> + * (c) Microchip Technology Inc.
> + */
> +
> +#ifndef ASM__RISCV__IMSIC_H
> +#define ASM__RISCV__IMSIC_H

Please update according to the most recent naming rules change (all it takes
may be to shrink the double underscores).

> +#include <xen/types.h>
> +
> +#define IMSIC_MMIO_PAGE_SHIFT   12
> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
> +
> +#define IMSIC_MIN_ID            63
> +#define IMSIC_MAX_ID            2047
> +
> +struct imsic_msi {
> +    paddr_t base_addr;
> +    unsigned long offset;
> +};
> +
> +struct imsic_mmios {
> +    paddr_t base_addr;
> +    unsigned long size;
> +    cpumask_var_t cpus;
> +};
> +
> +struct imsic_config {
> +    /* Base address */
> +    paddr_t base_addr;
> +
> +    /* Bits representing Guest index, HART index, and Group index */
> +    unsigned int guest_index_bits;
> +    unsigned int hart_index_bits;
> +    unsigned int group_index_bits;
> +    unsigned int group_index_shift;
> +
> +    /* IMSIC phandle */
> +    unsigned int phandle;
> +
> +    /* Number of parent irq */
> +    unsigned int nr_parent_irqs;
> +
> +    /* Number off interrupt identities */
> +    unsigned int nr_ids;
> +
> +    /* MMIOs */
> +    unsigned int nr_mmios;
> +    struct imsic_mmios *mmios;

Are the contents of this and ...

> +    /* MSI */
> +    struct imsic_msi *msi;

... this array ever changing post-init? If not, the pointers here may want
to be pointer-to-const (requiring local variables in the function populating
the field).

> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>      return pcpu_info[cpuid].hart_id;
>  }
>  
> +static inline unsigned long hartid_to_cpuid(unsigned long hartid)
> +{
> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
> +    {
> +        if ( hartid == cpuid_to_hartid(cpuid) )
> +            return cpuid;
> +    }
> +
> +    /* hartid isn't valid for some reason */
> +    return NR_CPUS;
> +}

Considering the values being returned, why's the function's return type
"unsigned long"?

Why the use of ARRAY_SIZE() in the loop header? You don't use pcpu_info[]
in the loop body.

Finally - on big systems this is going to be pretty inefficient a lookup.
This may want to at least have a TODO comment attached.

Jan

