Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE79D0E3A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 11:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839220.1255039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyoy-0007y1-5S; Mon, 18 Nov 2024 10:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839220.1255039; Mon, 18 Nov 2024 10:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyoy-0007vv-2X; Mon, 18 Nov 2024 10:17:28 +0000
Received: by outflank-mailman (input) for mailman id 839220;
 Mon, 18 Nov 2024 10:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8X+B=SN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tCyow-0007vp-Id
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 10:17:26 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c676eea-a596-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 11:17:21 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cfd2978f95so386458a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 02:17:21 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfc10752e9sm1223497a12.16.2024.11.18.02.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 02:17:20 -0800 (PST)
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
X-Inumbo-ID: 4c676eea-a596-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRjNjc2ZWVhLWE1OTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTI1MDQxLjg5NzgyNCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731925041; x=1732529841; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12MjGwe0bjJ+eVWWTynNlOxU7nzavy2fQeRegQh3Z4E=;
        b=UgxfsMNlpdXcJBmgqTJ1Y1dbEBCv+D73+OmKwAzAadE+chgghYE/tnlkpV+D+KE+H/
         8dpfnKhvuOt1KQ2DYI8kdGGtRrk7QH87Tc9nICGMbK9uviO4WvhUWNNpZtNx/TjaDozv
         tuUcH9Yg3AD2Q3c2isqDLHd0DIrh2J6um02v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731925041; x=1732529841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12MjGwe0bjJ+eVWWTynNlOxU7nzavy2fQeRegQh3Z4E=;
        b=JNYSN60wEy6fSHy0G3OXqzepl/EXvFIN4JtuyqBSydhFNuRGgr5mffQo/hQ47OwOoW
         k49Bz8kFWUeghjd4wGW5zhAKwStv84kkrl4jzVvP88DfTXGdLMVBEpMvRx7PqJwPutY2
         26h51vJ8eVsNXgj8RSST9RWf4KI2K0aOE74law80SjgB8H80OlR+akzdAvbscKNk7/NZ
         qHtmALeXPDaB9Anj/5rcaeXs/6tv9d233sbFporZFYFOtl9Ys/zLrvAtdKNmjZ7T3Lss
         x9tRsDFDvz/4lnB9Ioy1dujtFoU8g7l+L1YFj88WeLLoHha2V0sZxGX6/CgZ0y2b+bm9
         pNFw==
X-Gm-Message-State: AOJu0YzoUUf4RWi8JcsiwNb2eWxhP1RBo3mwu88g/c9u4FXzPf9EI+nB
	sdPrbqIxpJ3kXml6Bjr81Ck5x5r7PfjwViAIzDauVKP04vBd4DZkCNz6x61EgRE=
X-Google-Smtp-Source: AGHT+IHegocbXzKPtWTvQ24L9f6T+bxJN1JeDu70l3t50cCQdoPrGPihozPySbyczm9tGIEEI/CyAg==
X-Received: by 2002:a05:6402:40cb:b0:5cf:924f:9968 with SMTP id 4fb4d7f45d1cf-5cf924fa185mr6667436a12.2.1731925040890;
        Mon, 18 Nov 2024 02:17:20 -0800 (PST)
Date: Mon, 18 Nov 2024 11:17:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzsUL3dnjl5x0-si@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241113080027.244240-1-Jiqian.Chen@amd.com>

On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> Some devices, like discrete GPU of amd, support resizable bar capability,
> but vpci of Xen doesn't support this feature, so they fail to resize bars
> and then cause probing failure.
> 
> According to PCIe spec, each bar that support resizing has two registers,
> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> corresponding handler into vpci.
> 
> PCI_REBAR_CAP is RO, only provide reading.
> 
> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> setting the new size.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/drivers/vpci/Makefile  |  2 +-
>  xen/drivers/vpci/rebar.c   | 89 ++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/pci_regs.h | 11 +++++
>  3 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 xen/drivers/vpci/rebar.c
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 1a1413b93e76..a7c8a30a8956 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += vpci.o header.o
> +obj-y += vpci.o header.o rebar.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> new file mode 100644
> index 000000000000..84dbd84b0745
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

The GPL-2.0 identifier is deprecated, either use GPL-2.0-or-later or
GPL-2.0-only.

> +/*
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> + */
> +
> +#include <xen/hypercall.h>
> +#include <xen/vpci.h>
> +
> +/*
> + * The number value of the BAR Size in PCI_REBAR_CTRL register reprent:
> + * 0    1 MB (2^20 bytes)
> + * 1    2 MB (2^21 bytes)
> + * 2    4 MB (2^22 bytes)
> + *  ...
> + * 43   8 EB (2^63 bytes)
> + */
> +#define PCI_REBAR_CTRL_BAR_UNIT (1ULL << 20)
> +
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    uint32_t ctrl, index;

index should better be unsigned int, as it's the BAR index [0, 5], and
so fits perfectly in an unsigned int.

> +    struct vpci_bar *bars = pdev->vpci->header.bars;

You could pass bars as the data parameter.

Additionally you need to check that memory decoding is not enabled for
the device, otherwise attempting to change the BAR size will lead to
the active p2m mappings getting out of sync w.r.t. the new BAR size.

> +
> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
> +    if ( ctrl == val )
> +        return;

I would still carry out the write in this case, as that's what the
owner of the device requested.

> +
> +    ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> +    if ( ctrl != ( val & ~PCI_REBAR_CTRL_BAR_SIZE ) )
                     ^ extra space here and         ^ here
> +        return;

The feature only being exposed to dom0 ATM, I would suggest we allow
it to write any bits it wants in the control register, as that would
be what the OS would do when not running as a guest.

> +
> +    index = ctrl & PCI_REBAR_CTRL_BAR_IDX;

Some sanity checking of the BAR index might be good.  At least a check
that the BAR is of type VPCI_BAR_MEM64_LO or VPCI_BAR_MEM32.

> +    bars[index].size = (1 << ((val & PCI_REBAR_CTRL_BAR_SIZE) >>
> +                              PCI_REBAR_CTRL_BAR_SHIFT)) *
> +                       PCI_REBAR_CTRL_BAR_UNIT;

This would better be a macro in pci_regs.h I think, and you need to
use 1UL, plus using MASK_EXTR() simplifies it:

PCI_REBAR_CTRL_SIZE(v) (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))

> +
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +}
> +
> +static int cf_check init_rebar(struct pci_dev *pdev)
> +{
> +    unsigned int rebar_offset;
> +    uint32_t ctrl, nbars;

nbars can be unsigned int.

> +    int rc = 0;
> +
> +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset )
> +        return rc;

Just return 0, it's clearer than having to figure out what rc is set
to.

> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
> +    nbars = (ctrl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;

MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK).

> +
> +    for ( int i = 0; i < nbars; i++, rebar_offset += 8 ) {

unsigned int, and defined outside of the loop.  Also coding style:
braces need to be on a newline.

You could even reduce the scope of rc by defining it inside the
loop.

> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, NULL,
> +                               rebar_offset + PCI_REBAR_CAP, 4, NULL);

I'm not sure we want to limit dom0 writes to the capabilities
registers, as said above dom0 gets unfiltered access to almost all
registers, so it can do what it would otherwise do when running on
native hardware.

> +        if ( rc ) {
> +            printk("%s: %pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
> +                   __func__, &pdev->sbdf, rc);
> +            break;
> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL, 4, NULL);
> +        if ( rc ) {
> +            printk("%s: %pp: add register for PCI_REBAR_CTRL failed (rc=%d)\n",
> +                   __func__, &pdev->sbdf, rc);

IMO I think you can forego printing __func__, and just use:

"%pp: add register for PCI_REBAR_CTRL failed: %d\n"

> +            break;
> +        }
> +    }
> +
> +    return rc;
> +}
> +REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index 250ba106dbd3..5d2aa130916e 100644
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
> @@ -541,6 +542,16 @@
>  #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>  #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>  
> +/* Resizable BARs */
> +#define PCI_REBAR_CAP		4	/* capability register */
> +#define  PCI_REBAR_CAP_SIZES		0x00FFFFF0  /* supported BAR sizes */
> +#define PCI_REBAR_CTRL		8	/* control register */
> +#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007  /* BAR index */
> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
> +#define  PCI_REBAR_CTRL_NBAR_SHIFT	5	    /* shift for # of BARs */
> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
> +#define  PCI_REBAR_CTRL_BAR_SHIFT	8	    /* shift for BAR size */

If you use MASK_EXTR() there's no need for the _SHIFT macros I think?

Thanks, Roger.

