Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A8A2AEAF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 18:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883055.1293141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg5VD-0002yc-Cw; Thu, 06 Feb 2025 17:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883055.1293141; Thu, 06 Feb 2025 17:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg5VD-0002wb-A8; Thu, 06 Feb 2025 17:17:23 +0000
Received: by outflank-mailman (input) for mailman id 883055;
 Thu, 06 Feb 2025 17:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg5VB-0002wV-Tp
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 17:17:21 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3843e757-e4ae-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 18:17:19 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283dedso11570785e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 09:17:19 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae129sm25275555e9.17.2025.02.06.09.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 09:17:18 -0800 (PST)
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
X-Inumbo-ID: 3843e757-e4ae-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738862239; x=1739467039; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90kAG+S1f4glylAPfmb8Fw4bMhXPn2Ey2cyUShMslH4=;
        b=EaQV/WG/piObEW1+ABfKPbhMLVvVOIEfdbcmzPrK3ruP4IitSC1DkiGQdfEedbhPMI
         iBXzkz2VB/I3LMrMS5O9rktk0v7CLpoNl6/I76LBdiVZg1nYQrLla4p17yEBZDtWK181
         Y4QZf+/xudfI2I0dmL1tcOHckCw/y1SOhVAhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862239; x=1739467039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90kAG+S1f4glylAPfmb8Fw4bMhXPn2Ey2cyUShMslH4=;
        b=h5hqwumvXLp0I1xKim8N0hpmUj0JnCcaKw0tfSQqgtpcCgtz6zT77yRlt4NFuaCui9
         z3AhHnQHcZFwPYGwsFsnfa5WLbDwGGrHF9HadeQKNAgTr2u+Mczybgi5MLVjg2dlQNHc
         L1MIVczDlUeUOS1uUg8c6btpJpMOB/h9KS806M5OLPDyzDOPg/ynpcIJMp/Lt0oXKvHZ
         iy5LcCi0h0FE0Pjg0udbPlYwJ5uXC9OnxcJM3kckc95aS7jTavxZLfEZO2GCX37K3bwV
         Ay4jH2oHu7Fir4gzvk8nYweSJvaZeAvL6wq///QGW6R1DrNZNmIuvXTWXj1KO4pvUmuc
         cEUQ==
X-Gm-Message-State: AOJu0YyZX9WJHwccRAjkVDueZ7hzJzKr5fVto3Fyh8dexuceUMQGGdym
	DvTm6hSWVR52LAQj1Xk5qWCk2Zg2qKcvFHWrenYBfoe+QnFSSQ2HYyIzICdoU70=
X-Gm-Gg: ASbGnctX3q+/NN/zF+E7qg/GUR+5ngXmXIoF+jZwQzSNfScevGIqvKwB5gdB9nlSe/1
	UOcGCdpKJ6XtXnzJ993mivT+Pio9s9lNLVX9AyTZyHJNM6U/iDj0gFED9eYRk5lY2RMj/lt/40S
	uKZoXgczBC409VbBTbOb1gnmG08s/iS4pu5GcCGSx0EdcN0qOZJ+x3GYS2ukjBXDSw8h2k4T8Wo
	hyW7JQwhiJbAbU0V14QbPLBnpn7LjJhwyMIlL/t4C5RStNNOPizOqq9uOl73UnTR/+gKXIL3pvx
	1fUZZHP3PAC3umKuf9FL
X-Google-Smtp-Source: AGHT+IFsGO5MaCu3lcz6oCW3oVaJ7+mCwfyfBEFNAkseMSPhvBcgCy4CLUGXAIOANXX6qXpk3ECVQw==
X-Received: by 2002:a05:600c:3c84:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43924991e0cmr2415995e9.14.1738862238497;
        Thu, 06 Feb 2025 09:17:18 -0800 (PST)
Date: Thu, 6 Feb 2025 18:17:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v7] vpci: Add resizable bar support
Message-ID: <Z6TunU-OESSdTIMa@macbook.local>
References: <20250206093900.1410342-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206093900.1410342-1-Jiqian.Chen@amd.com>

On Thu, Feb 06, 2025 at 05:39:00PM +0800, Jiqian Chen wrote:
> Some devices, like discrete GPU of amd, support resizable bar
                                     ^ AMD?

> capability, but vpci of Xen doesn't support this feature, so
> they fail to resize bars and then cause probing failure.
> 
> According to PCIe spec, each bar that supports resizing has
> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> handlers for them to support resizing the size of BARs.

You need to update the commit message to note Xen will only trap
PCI_REBAR_CTRL, as PCI_REBAR_CAP is read-only and the hardware domain
will already get access to it without needing any setup.

> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Just one comment about you not needing to introduce vpci_hw_write32()
anymore.  The rest are nits to comments, which I'm not even sure are
better than your proposed text.

> ---
> Hi all,
> v6->v7 changes:
> * Deleted codes that add register for PCI_REBAR_CAP, and added comments to explain why.
> * Added comments to explain why use "continue" when fail to add register for PCI_REBAR_CTRL.
> 
> Best regards,
> Jiqian Chen.
> 
> v5->v6 changes:
> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
>   from register.
> * Added the index of BAR to error messages.
> * Changed to "continue" instead of "return an error" when vpci_add_register failed.
> 
> v4->v5 changes:
> * Called pci_size_mem_bar in rebar_ctrl_write to get addr and size of BAR instead of setting
>   their values directly after writing new size to hardware.
> * Changed from "return" to "continue" when index/type of BAR are not correct during initializing
>   BAR.
> * Corrected the value of PCI_REBAR_CTRL_BAR_SIZE from "0x00001F00" to "0x00003F00".
> * Renamed PCI_REBAR_SIZE_BIAS to PCI_REBAR_CTRL_SIZE_BIAS.
> * Re-defined "PCI_REBAR_CAP_SHIFT 4" to "PCI_REBAR_CAP_SIZES_MASK 0xFFFFFFF0U".
> 
> v3->v4 changes:
> * Removed PCI_REBAR_CAP_SIZES since it was not needed, and added
>   PCI_REBAR_CAP_SHIFT and PCI_REBAR_CTRL_SIZES.
> * Added parameter resizable_sizes to struct vpci_bar to cache the support resizable sizes and
>   added the logic in init_rebar().
> * Changed PCI_REBAR_CAP to PCI_REBAR_CAP(n) (4+8*(n)), changed PCI_REBAR_CTRL to
>   PCI_REBAR_CTRL(n) (8+8*(n)).
> * Added domain info of pci_dev to printings of init_rebar().
> 
> v2->v3 changes:
> * Used "bar->enabled" to replace "pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY",
>   and added comments why it needs this check.
> * Added "!is_hardware_domain(pdev->domain)" check in init_rebar() to return EOPNOTSUPP for domUs.
> * Moved BAR type and index check into init_rebar(), then only need to check once.
> * Added 'U' suffix for macro PCI_REBAR_CAP_SIZES.
> * Added macro PCI_REBAR_SIZE_BIAS to represent 20.
> TODO: need to hide ReBar capability from hardware domain when init_rebar() fails.
> 
> v1->v2 changes:
> * In rebar_ctrl_write, to check if memory decoding is enabled, and added
>   some checks for the type of Bar.
> * Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
>   no write limitation of dom0.
> * And has many other minor modifications as well.
> ---
>  xen/drivers/vpci/Makefile  |   2 +-
>  xen/drivers/vpci/rebar.c   | 136 +++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c    |   6 ++
>  xen/include/xen/pci_regs.h |  15 ++++
>  xen/include/xen/vpci.h     |   3 +
>  5 files changed, 161 insertions(+), 1 deletion(-)
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
> index 000000000000..64b56a9567fa
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
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
> +    const unsigned int index = bar - pdev->vpci->header.bars;
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
> +                    "%pp: refuse to resize BAR#%u with memory decoding enabled\n",
> +                    &pdev->sbdf, index);
> +        return;
> +    }
> +
> +    if ( !((size >> PCI_REBAR_CTRL_SIZE_BIAS) & bar->resizable_sizes) )
> +        gprintk(XENLOG_WARNING,
> +                "%pp: new BAR#%u size %#lx is not supported by hardware\n",
> +                &pdev->sbdf, index, size);
> +
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +
> +    pci_size_mem_bar(pdev->sbdf,
> +                     PCI_BASE_ADDRESS_0 + index * 4,
> +                     &bar->addr,
> +                     &bar->size,
> +                     (index == PCI_HEADER_NORMAL_NR_BARS - 1) ?
> +                      PCI_BAR_LAST : 0);
> +    bar->guest_addr = bar->addr;
> +}
> +
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
> +    for ( unsigned int i = 0; i < nbars; i++ )
> +    {
> +        int rc;
> +        struct vpci_bar *bar;
> +        unsigned int index;
> +
> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> +                   pdev->domain, &pdev->sbdf, index);
> +            continue;
> +        }
> +
> +        bar = &pdev->vpci->header.bars[index];
> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> +                   pdev->domain, &pdev->sbdf, index);
> +            continue;
> +        }
> +
> +        /*
> +         * Here not to add register for PCI_REBAR_CAP since it is read-only

"Here not to add" doesn't read right to me (but I'm not a native
speaker), I would rather use:

"Don't add a handler for PCI_REBAR_CAP since it is read-only ..."

TBH I would even drop the comment from here, at the end we allow the
hardware domain unmediated access to a lot of read-only devices, and
there's no comment for each of them.

> +         * register without other specific operations, and hardware domain
> +         * has no limitation of read/write access to all PCI config space.
> +         */
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, index, rc);
> +            /*
> +             * Ideally we would hide the ReBar capability here, but code
> +             * for doing so still needs to be written. And using continue
> +             * can keep any possible hooks working, instead, returning
> +             * failure would cause all vPCI hooks down and hardware domain
> +             * has entirely unmediated access to the device, which is worse.
> +             */

"Ideally we would hide the ReBar capability on error, but code for
doing so still needs to be written. Use continue instead to keep any
already setup register hooks, as returning an error will cause
the hardware domain to get unmediated access to all device registers."

Seems slightly easier to parse IMO (again I'm not a native speaker, so
your proposed comment might be better).

> +            continue;
> +        }
> +
> +        bar->resizable_sizes =
> +            MASK_EXTR(pci_conf_read32(pdev->sbdf,
> +                                      rebar_offset + PCI_REBAR_CAP(i)),
> +                      PCI_REBAR_CAP_SIZES_MASK);
> +        bar->resizable_sizes |=
> +            (((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES_MASK) << 32) /
> +             ISOLATE_LSB(PCI_REBAR_CAP_SIZES_MASK));
> +    }
> +
> +    return 0;
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
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1e6aa5d799b9..3349b98389b8 100644
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

I think you now longer need to introduce vpci_hw_write32() since it's
not used anywhere in this patch.

Thanks, Roger.

