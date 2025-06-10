Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B1AD3C85
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011040.1389334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0j2-0005Sy-EW; Tue, 10 Jun 2025 15:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011040.1389334; Tue, 10 Jun 2025 15:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0j2-0005Qd-Bb; Tue, 10 Jun 2025 15:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1011040;
 Tue, 10 Jun 2025 15:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP0j0-0005QX-Rf
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:17:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec89b6c-460d-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 17:17:17 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4530921461aso22357035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:17:17 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f04dsm12510034f8f.73.2025.06.10.08.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:17:16 -0700 (PDT)
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
X-Inumbo-ID: fec89b6c-460d-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749568637; x=1750173437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b+EI1t4yLwz4LE9dJEOj7asJ8CJKXkDQIPd3rCYuxJE=;
        b=DHC4Coe3zPyeEjCloJbk8Z+BY92QI0i6yS4RPRHonCmNKcj4ai9z3Jse8o0PYQlglj
         rWBalsypyC718XyuYi2hLsKCrKToUAagFwJiFd8jL8Zo5lb/bzohfxbO7oxJFBSblevc
         3uzqqyD8y6Iw3pCAcDFsEKyGnmO8ZO4cplsdIgEJM/OvK+IVmDRJjtS1gk8e9GPbKtAN
         gYLO0t+2znKHS3zzb2MZR1GaYXDzJPnLeuHcalxyWxXqCYLR2RlMufuqBdvYd6qHIMAU
         UkuuNhfX9wlin7ucfHLd6F19WNro8RZoTUsMMalWKBNIN71LApHe3WNyomO95poTQeEM
         FAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568637; x=1750173437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+EI1t4yLwz4LE9dJEOj7asJ8CJKXkDQIPd3rCYuxJE=;
        b=aP0DPDazoNqufOAodNPSyT0ruE60LRB3/VLYrwy1K3Vrm1XDRrIjZakIulSQpLC5KT
         1YJNoW+zNuuMW1Qc4cKhO4V1eSgzCZvZyqD4qw+NYrUp1YRYzEqSNdow597pi8g0YGRx
         BkFqhv807iQNu/1z6e7BWwzsLSSWZZjYREMYmQbawtbInLocGDd1giikDPSXcDDOnv4Y
         XG65euTbnscqeBDlPdNy2Z0JTt0dd3it+EffUYsjEcXSfkjuUHQY0LbDH/QSChkFHA7j
         z88XAP7v89M7JSifMuSw+QuEK2oISEFq91DnxCkajyIjCH9qtBJqVDhTum/2dO6w6ZZ5
         x5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUY0gyndMO3wkTJeZ33g8OT2FT4mlltbkQuM/qj5hbvtZwyjO61MAOouGX6X0mAWitdzoPDiTrzI4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz17uduoot9psYpuNTvb/hFyBfTV7Cy5TCWbVgUT48hRDbjzyqf
	3sL9KQ+j+zMSmaHAnI+yWoociIdwKyYAV6/pYFpB9I43XxCqjtT/6H4rSKuqrDqvhw==
X-Gm-Gg: ASbGncsHDVw1guJwiOEJHB+5V4+D4O5xAxklrWK5r4KQNqCTIny7plTYYFj9hQkPzJa
	pKM/ZV+c6PfYhxyHj/uobh07C0TYFbWy7PK+627SGtGUAo20KpMt38AtUBFCkFJ1QZoWktsjooo
	48l/iJL9/k4rMhcaUUStCilpWfa4JPSMmcx1JbUi6zPP4yBKse4mEzvkOvNMynPRZ+3hrs30agO
	RLTE1A07CHNRAwHNLaGu99Oq41naq1Sc1Aaerc8gEPKsRz73JjqFKTTXefBn6RMchXFmtnKSzm+
	+7e3C566FFLjKkX6dFTDT0EZj9qOo3k/mbAnb8Slspn8LvE87//1YSaxQwoiVyaeavn/+RPArPc
	Am1pF1upaEs57r9hGesEnn5+j4GghlJh7Hpd2+I/1hLNSfFo6+pmJKaIEsUENeT8MkmRRiiQLO6
	E3cMFQjutRHz0Q1jlkinBx
X-Google-Smtp-Source: AGHT+IEK/l8vRvV8bzq+OsDJafI7PCcN9/JhQgBohhVEiRXPqIdQFNvmrpCDz3GXJR1cyausbfI0aA==
X-Received: by 2002:a05:6000:188f:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a531453ce7mr13059408f8f.0.1749568636615;
        Tue, 10 Jun 2025 08:17:16 -0700 (PDT)
Message-ID: <910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com>
Date: Tue, 10 Jun 2025 17:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <a0816fb00eec29327146b828fa460b5a444e26a7.1749121437.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a0816fb00eec29327146b828fa460b5a444e26a7.1749121437.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 17:58, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/imsic.c
> @@ -0,0 +1,358 @@
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
> +#define IMSIC_HART_SIZE(guest_bits_) (BIT(guest_bits_, U) * IMSIC_MMIO_PAGE_SZ)

Minor: Any particular reason for the trailing underscore here?

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
> +            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, "
> +                   "expeced MMIO size: %ld\n", node->name, mmios[i].size,

To aid grep-ability, please avoid wrapping format strings across lines.
(Same at least once more elsewhere.)

> +                   expected_mmio_size);
> +            goto imsic_init_err;
> +        }
> +    }
> +
> +    /* Configure handlers for target CPUs */
> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
> +    {
> +        unsigned long cpu;

Along the lines of questions on earlier versions: Any reason this isn't
unsigned int?

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
> +        if ( cpu >= num_possible_cpus() )
> +        {
> +            printk(XENLOG_WARNING "%s: unsupported hart ID=%#lx for parent "
> +                   "irq%u\n", node->name, hartid, i);
> +            continue;
> +        }
> +
> +        /* Find MMIO location of MSI page */
> +        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;

Any reason to open-code IMSIC_HART_SIZE() here and ...

> +        for ( index = 0; index < nr_mmios; index++ )
> +        {
> +            if ( reloff < mmios[index].size )
> +                break;
> +
> +            /*
> +             * MMIO region size may not be aligned to
> +             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
> +             * if holes are present.
> +             */
> +            reloff -= ROUNDUP(mmios[index].size,
> +                      BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);

... here?

> +        }
> +
> +        if ( index == nr_mmios )
> +        {
> +            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        if ( !IS_ALIGNED(msi[cpu].base_addr + reloff,

DYM mmios[index].base_addr here, considering that ...

> +                         IMSIC_MMIO_PAGE_SZ) )
> +        {
> +            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on "
> +                   "a page\n", node->name, msi[cpu].base_addr + reloff);
> +            msi[cpu].offset = 0;
> +            msi[cpu].base_addr = 0;
> +            continue;
> +        }
> +
> +        msi[cpu].base_addr = mmios[index].base_addr;
> +        msi[cpu].offset = reloff;

msi[cpu] is set only here?

Also is the setting to zero of both fields on the "continue" path really
needed, seeing that the array starts out zero-filled? Can the same CPU
be found twice, making it necessary(?) to invalidate the array slot later?

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
> +    imsic_cfg.msi = msi;
> +
> +    XFREE(mmios);

No need to use the macro, and you really mean xvfree() now.

> +    return 0;
> +
> + imsic_init_err:
> +    XFREE(mmios);
> +    XFREE(msi);

Same here.

Jan

