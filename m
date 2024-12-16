Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8899F2E26
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857659.1269881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8Hg-0004HO-IG; Mon, 16 Dec 2024 10:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857659.1269881; Mon, 16 Dec 2024 10:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8Hg-0004EF-Eq; Mon, 16 Dec 2024 10:25:04 +0000
Received: by outflank-mailman (input) for mailman id 857659;
 Mon, 16 Dec 2024 10:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3c03=TJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tN8Hf-0004E9-0l
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:25:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01f5dd16-bb98-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 11:25:01 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so937438766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 02:25:01 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96359511sm319784166b.122.2024.12.16.02.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 02:25:00 -0800 (PST)
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
X-Inumbo-ID: 01f5dd16-bb98-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734344701; x=1734949501; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhE706MTljb2DcXw01XpFkphNKUAEqeYg0XT/RdYUsI=;
        b=d8gybSyPF9OvkLEzUlYj8N/30g7mQ95e3qc1nwRJCJEVgMFJV/iJWDHoyoXv34Fw6G
         e50lnS0lyhMrjDTQ0DlCDV+DAqOVASu/kJZEazOmttjgak/r5gaAa0AOknZj2tMwVMsr
         mbh+SaVq2U8dkwWo5vpUQLYN+18m1+wYQhL8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734344701; x=1734949501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhE706MTljb2DcXw01XpFkphNKUAEqeYg0XT/RdYUsI=;
        b=PUfp2UxsAHMroIGq9wlWfD8lPsH2zlYBPfxl2kTPQcT1RW3TsPUYDqmxDbSdZsztEw
         gynGKhK/zPY5kjckk+9VD43MGCJ8x5zhRIX7qnwcIghce2p0jfRR38P4E3CryX8U9G7U
         Tgwvldv7p/HMVVrJjUqQuqpzbWUOaX73mo11GdiGiRBqQHwdSe5H36/CbNVU9KRusaj6
         zukmlb8GRO3INt+AXoCFKBK45b81A3pjWTF+FBMyOmASmgmWZ/goUglp8VORE2NX3yeq
         jqiOrbcZ8W19zVR+WuKGue2fd/Rb9U71spGBozUK2HDY+MBaliVeMFxmewpMmYvV4Gk6
         OqJQ==
X-Gm-Message-State: AOJu0YwoSxdipkY03PMkSmn4l/LhxDCE2tpaN2maGKBlxo3rFFnoVB7L
	p6uTts8biN7u4eNiLxh3XlxoLQ1YRbXBDyF7lOj1KxHjeX21Qz3YL1oSPj43Gp0=
X-Gm-Gg: ASbGnctooq9dq+/lLLpzo6RZDiJR1jo6M8rEfISi1GFoDWeWZPu+i9wwCim7l37bwyH
	b51dP4FHMo6fhypnaxy2CeV7+J69cHZZHu8mNQvWuZos1oGxtkPgvS89j/Fnto+a6K3fHKmscqs
	0q2pDcgnQQBBIsvp/ZFEf0+OpliubZRpNbyyNk6aNW3f5zBDhMdtG4OUrmH+CyW6Xu64gW8cl1x
	ljXz4YciysbAnmzk3GMy6i/4Tz64XVbzeI5bvHEiEeUZSecPpbmsWdC10iGNw==
X-Google-Smtp-Source: AGHT+IFi3bK5aCk1yxtXnD0AsNpSdOVrIMvobhoFCwp4megDO7TgEkWhwmbV+hAKzrSVhwmNlFLQKA==
X-Received: by 2002:a17:907:971c:b0:aab:9341:e1bd with SMTP id a640c23a62f3a-aab9341e235mr646021766b.11.1734344700946;
        Mon, 16 Dec 2024 02:25:00 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3] vpci: Add resizable bar support
Message-ID: <Z1__--RWN68hsOCX@macbook.local>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213054232.2638640-1-Jiqian.Chen@amd.com>

On Fri, Dec 13, 2024 at 01:42:32PM +0800, Jiqian Chen wrote:
> Some devices, like discrete GPU of amd, support resizable bar
> capability, but vpci of Xen doesn't support this feature, so
> they fail to resize bars and then cause probing failure.
> 
> According to PCIe spec, each bar that supports resizing has
> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> handlers for them to support resizing the size of BARs.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> Hi all,
> v2->v3 changes:
> * Used "bar->enabled" to replace "pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY",
>   and added comments why it needs this check.
> * Added "!is_hardware_domain(pdev->domain)" check in init_rebar() to return EOPNOTSUPP for domUs.
> * Moved BAR type and index check into init_rebar(), then only need to check once.
> * Added 'U' suffix for macro PCI_REBAR_CAP_SIZES.
> * Added macro PCI_REBAR_SIZE_BIAS to represent 20.
> 
> TODO: need to hide ReBar capability from hardware domain when init_rebar() fails.
> 
> Best regards,
> Jiqian Chen.
> 
> v1->v2 changes:
> * In rebar_ctrl_write, to check if memory decoding is enabled, and added
>   some checks for the type of Bar.
> * Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
>   no write limitation of dom0.
> * And has many other minor modifications as well.
> ---
>  xen/drivers/vpci/Makefile  |   2 +-
>  xen/drivers/vpci/rebar.c   | 130 +++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c    |   6 ++
>  xen/include/xen/pci_regs.h |  13 ++++
>  xen/include/xen/vpci.h     |   2 +
>  5 files changed, 152 insertions(+), 1 deletion(-)
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
> index 000000000000..39432c3271a4
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> + */
> +
> +#include <xen/hypercall.h>

Do you really need the hypercall header?

> +#include <xen/vpci.h>
> +
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    uint64_t size;
> +    struct vpci_bar *bar = data;
> +
> +    size = PCI_REBAR_CTRL_SIZE(val);
> +    if ( bar->enabled )
> +    {
> +        if ( size == bar->size )
> +            return;
> +
> +        /*

Indentation

> +        * Refuse to resize a BAR while memory decoding is enabled, as
> +        * otherwise the size of the mapped region in the p2m would become
> +        * stale with the newly set BAR size, and the position of the BAR
> +        * would be reset to undefined.  Note the PCIe specification also
> +        * forbids resizing a BAR with memory decoding enabled.
> +        */
> +        gprintk(XENLOG_ERR,
> +                "%pp: refuse to resize BAR with memory decoding enabled\n",
> +                &pdev->sbdf);
> +        return;
> +    }

Nit: just realized this could be made shorter:

if ( bar->enabled )
{
   /*
    * Refuse to resize a BAR while memory decoding is enabled, as
    * otherwise the size of the mapped region in the p2m would become
    * stale with the newly set BAR size, and the position of the BAR
    * would be reset to undefined.  Note the PCIe specification also
    * forbids resizing a BAR with memory decoding enabled.
    */
    if ( size != bar->size )
        gprintk(XENLOG_ERR,
                "%pp: refuse to resize BAR with memory decoding enabled\n",
                &pdev->sbdf);

    return;
}

> +
> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) &
> +           MASK_EXTR(pci_conf_read32(pdev->sbdf,
> +                                     reg - PCI_REBAR_CTRL + PCI_REBAR_CAP),
> +                                     PCI_REBAR_CAP_SIZES)) )

Would it be possible to cache this information.  It's my understand
the supported sizes won't change, and hence Xen could read and cache
them in init_rebar() to avoid repeated reads to the register on every
access?

> +        gprintk(XENLOG_WARNING,
> +                "%pp: new size %#lx is not supported by hardware\n",
> +                &pdev->sbdf, size);
> +
> +    bar->size = size;
> +    bar->addr = 0;
> +    bar->guest_addr = 0;
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +}
> +
> +static int cf_check init_rebar(struct pci_dev *pdev)
> +{
> +    uint32_t ctrl;
> +    unsigned int rebar_offset, nbars;
> +
> +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);

You can do the init at definition:

    uint32_t ctrl;
    unsigned int nbars;
    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
                                                        PCI_EXT_CAP_ID_REBAR);


> +
> +    if ( !rebar_offset )
> +        return 0;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        printk("ReBar is not supported for domUs\n");

This needs a bit more information IMO:

printk(XENLOG_ERR
       "%pd %pp: resizable BAR capability not supported for unprivileged domains\n",
       pdev->domain, &pdev->sbdf);

I wonder if this should instead be an XSM check, but that would
require a new XSM hook to process permissions for PCI capabilities.

> +        return -EOPNOTSUPP;
> +    }
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +
> +    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
> +    {
> +        int rc;
> +        unsigned int index;
> +        struct vpci_bar *bars = pdev->vpci->header.bars;
> +
> +        index = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL) &
> +                PCI_REBAR_CTRL_BAR_IDX;

You could initialize index at definition.

> +
> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> +        {
> +            /*
> +             * TODO: for failed pathes, need to hide ReBar capability
> +             * from hardware domain instead of returning an error.
> +             */
> +            printk("%pp: BAR number %u in REBAR_CTRL register is too big\n",
> +                   &pdev->sdf, index);

XENLOG_ERR, plus we could print the domain the device was assigned to
(pdev->domain).

> +            return -EINVAL;
> +        }
> +
> +        if ( bars[index].type != VPCI_BAR_MEM64_LO &&
> +             bars[index].type != VPCI_BAR_MEM32 )
> +        {
> +            printk("%pp: BAR%u is not in memory space\n", &pdev->sbdf, index);
> +            return -EINVAL;
> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> +                               rebar_offset + PCI_REBAR_CAP, 4, NULL);
> +        if ( rc )
> +        {
> +            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
> +                   &pdev->sbdf, rc);
> +            return rc;
> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL, 4,
> +                               &bars[index]);
> +        if ( rc )
> +        {
> +            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
> +                   &pdev->sbdf, rc);
> +            return rc;
> +        }

All the log messages above need the XENLOG_ERR prefix, plus possibly
printing the assigned domain.

Thanks, Roger.

