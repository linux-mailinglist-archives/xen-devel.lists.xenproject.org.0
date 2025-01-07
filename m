Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE8A03BD5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 11:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866242.1277545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6U0-00006O-Ej; Tue, 07 Jan 2025 10:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866242.1277545; Tue, 07 Jan 2025 10:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV6U0-0008Ux-Bw; Tue, 07 Jan 2025 10:06:44 +0000
Received: by outflank-mailman (input) for mailman id 866242;
 Tue, 07 Jan 2025 10:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV6Tz-0008Un-7K
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 10:06:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14311491-ccdf-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 11:06:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so57094065e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 02:06:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366112e780sm589836755e9.0.2025.01.07.02.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 02:06:34 -0800 (PST)
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
X-Inumbo-ID: 14311491-ccdf-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736244395; x=1736849195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KLu4EnhRkzXZFOz3MUBfyv1LwXe4+XWqJZeoSPt2Aww=;
        b=OLX51DKQfNi/1su5013Jui45C+zydZKdIo5LJgQNoDhhh2EX+N4lLqh9jS0BJNzutC
         /GSvL9v3anwRwBI7vKE3Mg4ItRRwK6/0PvsjbPZIhEcBMDlzmPQkcFf5ZM4wv8D18Pxi
         Yho+y3qH47bp8dUpRDcLucwQPl96wZ9aJ1qyvmxHpCj7l2y0QHmWKWN3SvP4E4/sELyH
         AkVCryZJacSM2NwRMoUgl3IFeygNZ/L7cy55NTCS8So4B1P+CtA7xd+nU1EiKdUc33bC
         QzRsqDsVLqqDBk45ve8pygzseGCm1CUrWI0mYyCgzuL7mZwSzH4OC+acXYBE8rleX+Jb
         Bmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736244395; x=1736849195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLu4EnhRkzXZFOz3MUBfyv1LwXe4+XWqJZeoSPt2Aww=;
        b=ZEHv/embs/Qkov1mTpkS8Z3YonNj97PBAVF8huiq5RVryIwuPJ/N7mWFn4q4Zdy7+5
         Vik7KS56e8v6LercWQq++fdGE5KnhZXYOmrLMlKsiAg/w3aEpHqb/Gdq8yj3ihmPmWSC
         pllDKSOMRhhREjLLEdbXQLEtYhBx9x3wN7pxjfITbo3FB7cX46BdLV6NDhfrGbh2Kf4H
         z9Ed/0bzrN2pFoA82Y4CLNVHxs8NxEJ5Ctw37vwue0GcJGn2wYx1qzEjDuFYqJa27oES
         HYg7n5BpY9PO3IWI2Ajs5pTb4fprojCOnhWyPDo8e4lqb/oyexN57DKYwVjkoBPH59px
         HliA==
X-Forwarded-Encrypted: i=1; AJvYcCVFo8XcPcQqdVFKUXzKBbLc0HP0L8znmtvtuzZzq4pr5STyQsSiu+dbt/FhUKhWuQiTNnoYz5BDaDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlOncRPbCz+RppJng73LXiowenQ9ozdlJlb3ghR5kt/Zb7JRB0
	ebI532s967pd45w8q+QZn0O38TDwgzT4+z83gt7p2YPL2KKWjSpGzXdWCGeuaA==
X-Gm-Gg: ASbGnct0VHNWBKWDciRKoo/lO0iJgUKTDIULMPFdfn5Kg4bgp1gPOV+gXy2uW7gOsEi
	aDczbV3DBiMgwgtOmOndAmQEI80AZEZcIXHXFZ2kfAFGQuudGAXYmSou6NObItK29o3Y30M2wJy
	ihUZQqHUXaLpRp6vQ/LfPByBeHF/u52eIxyuhnGam8DRamTmrEyauRopunIjkVnwY9ZVVc8lgJ6
	2GVIforQRk05wbhT8Muken/3VEgcRdTwZPOXMs/xOgwyDJ3D0wCxRG67ij5lvCCj5USZAn69kqv
	MYqa65DG6XO4+gYh/+SGw56xW78PNqwMXqnoNez7uA==
X-Google-Smtp-Source: AGHT+IFwDF7VK6SjN3AsYjI21za3FE7kZBul4dVyBSzNlQJBdJ0EUnrvnPpGKNCNapiXeES9V2gRZw==
X-Received: by 2002:a05:600c:35cb:b0:436:1af4:5e07 with SMTP id 5b1f17b1804b1-43668548867mr408217565e9.1.1736244395481;
        Tue, 07 Jan 2025 02:06:35 -0800 (PST)
Message-ID: <d904c816-da83-418a-9bff-9988660af546@suse.com>
Date: Tue, 7 Jan 2025 11:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] vpci: Add resizable bar support
To: Jiqian Chen <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2024 06:21, Jiqian Chen wrote:
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> +
> +    if ( bar->enabled )
> +    {
> +        /*
> +         * Refuse to resize a BAR while memory decoding is enabled, as
> +         * otherwise the size of the mapped region in the p2m would become
> +         * stale with the newly set BAR size, and the position of the BAR
> +         * would be reset to undefined.  Note the PCIe specification also
> +         * forbids resizing a BAR with memory decoding enabled.
> +         */
> +        if ( size != bar->size )
> +            gprintk(XENLOG_ERR,
> +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
> +                    &pdev->sbdf);
> +        return;
> +    }
> +
> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
> +        gprintk(XENLOG_WARNING,
> +                "%pp: new size %#lx is not supported by hardware\n",
> +                &pdev->sbdf, size);
> +
> +    bar->size = size;

Shouldn't at least this be in an "else" to the if() above?

> +    bar->addr = 0;

For maximum compatibility with the behavior on bare metal, would we
perhaps better ...

> +    bar->guest_addr = 0;
> +    pci_conf_write32(pdev->sbdf, reg, val);

... re-read the BAR from hardware after this write?

Similar consideration may apply to ->guest_addr: Driver writers knowing
how their hardware behaves may expect that merely some of the bits of
the address get cleared (if the size increases).

> +static int cf_check init_rebar(struct pci_dev *pdev)
> +{
> +    uint32_t ctrl;
> +    unsigned int nbars;
> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> +                                                        PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset )
> +        return 0;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +
> +    for ( unsigned int i = 0; i < nbars; i++ )
> +    {
> +        int rc;
> +        struct vpci_bar *bar;
> +        unsigned int index;
> +
> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;;

Nit: No double semicolons please.

> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> +        {
> +            /*
> +             * TODO: for failed pathes, need to hide ReBar capability
> +             * from hardware domain instead of returning an error.
> +             */
> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> +                   pdev->domain, &pdev->sbdf, index);
> +            return -EINVAL;

With the TODO unaddressed, is it actually appropriate to return an error
here? Shouldn't we continue in a best effort manner? (Question also to
Roger as the maintainer.)

> +        }
> +
> +        bar = &pdev->vpci->header.bars[index];
> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> +                   pdev->domain, &pdev->sbdf, index);
> +            return -EINVAL;

Same question here then.

> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, rc);
> +            return rc;
> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, rc);
> +            return rc;
> +        }
> +
> +        bar->resizable_sizes |=
> +            (pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CAP(i)) >>
> +             PCI_REBAR_CAP_SHIFT);

Imo this would better use = in place of |= and (see also below) would also
better use MASK_EXTR() just like ...

> +        bar->resizable_sizes |=
> +            ((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES) <<
> +             (32 - PCI_REBAR_CAP_SHIFT));

... this one does.

Further I think you want to truncate the value for 32-bit BARs, such that
rebar_ctrl_write() would properly reject attempts to set sizes of 4G and
above for them.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
>      pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> +void cf_check vpci_hw_write32(
> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
> +{
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +}

This function is being added just to handle writing of a r/o register.
Can't you better re-use vpci_ignored_write()?

> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -459,6 +459,7 @@
>  #define PCI_EXT_CAP_ID_ARI	14
>  #define PCI_EXT_CAP_ID_ATS	15
>  #define PCI_EXT_CAP_ID_SRIOV	16
> +#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
>  
>  /* Advanced Error Reporting */
>  #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
> @@ -541,6 +542,19 @@
>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>  
> +/* Resizable BARs */
> +#define PCI_REBAR_SIZE_BIAS	20

I think it would be best if all register definitions came first, and
auxiliary ones followed afterwards (maybe even separated by a brief
comment for clarity).

> +#define PCI_REBAR_CAP(n)    	(4 + 8 * (n))	/* capability register */
> +#define  PCI_REBAR_CAP_SHIFT		4		/* shift for supported BAR sizes */
> +#define PCI_REBAR_CTRL(n)   	(8 + 8 * (n))	/* control register */

Something's odd with the padding here. Please be consistent with the use
of whitespace (ought to be only hard tabs here afaict).

> +#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007	/* BAR index */
> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00	/* BAR size */

This field is 6 bits wide in the spec I'm looking at. Or else BAR sizes
2^^52 and up can't be encoded.

> +#define  PCI_REBAR_CTRL_SIZE(v) \
> +            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
> +                     + PCI_REBAR_SIZE_BIAS))
> +#define  PCI_REBAR_CTRL_SIZES		0xFFFF0000U	/* supported BAR sizes */

PCI_REBAR_CAP_SHIFT and PCI_REBAR_CTRL_SIZES don't fit together very well.
Imo both want representing as masks.

Jan

