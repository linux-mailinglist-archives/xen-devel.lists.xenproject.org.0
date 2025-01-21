Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4EA17979
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 09:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875170.1285550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta9uI-00035v-3U; Tue, 21 Jan 2025 08:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875170.1285550; Tue, 21 Jan 2025 08:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta9uI-00034S-06; Tue, 21 Jan 2025 08:46:46 +0000
Received: by outflank-mailman (input) for mailman id 875170;
 Tue, 21 Jan 2025 08:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ta9uG-00034M-DD
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 08:46:44 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c7cbe75-d7d4-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 09:46:42 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso1239784966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 00:46:42 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f2903esm726241066b.109.2025.01.21.00.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 00:46:41 -0800 (PST)
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
X-Inumbo-ID: 3c7cbe75-d7d4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737449202; x=1738054002; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2FgS81LB4NBRN++NAOxJ72iP2ET8JVvetObbwk8eQFs=;
        b=n0N/rD4J/J9tGw5EcK2K7+1xuetbEflsKxqmS0WLPway1HpnSXShonhPcnJLYfKlkg
         +RCRRCPr/18tzAc+F+/m1vJPYEN/4KA7AgQczvBnR9ObXVrIqGBt/qOyE6aqNCAmpJ9O
         ooVZgn/3cL1DxR9mleShRxmWTv8Rq1s4nJDlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737449202; x=1738054002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FgS81LB4NBRN++NAOxJ72iP2ET8JVvetObbwk8eQFs=;
        b=bsxJ4cfwW/UdP2IzGoIJvLZ2DXktiZNBBsYPwtyAVkIYy91lMP1T17oJDL8Yn5bSwF
         mX470Dio2yl1ZHGKsK3AoH2GmntSgLIXwkPB+ZyFJwY2TwtoytHXAQajDvFGlpwFCkrI
         eNer+yblNpuW6zKsH44ionbg2iKmphwqbXVGH5fHf7PViVQQgf5Fo1cf73qw/Ehx9OYw
         KrRrSqpd3dk8+zLFTe7bk7HoeoBNZaLd7tdMeNTzIFNyAIRDEo6xG8dtWYq1tPq7a2Gi
         tW8+lU7H03UfTd4ckQuvRJry3b+AMrYYfErQApqR27fQJ1SPCVMbbvmX6Y7eyw9N1Qjo
         YKMg==
X-Gm-Message-State: AOJu0YxSBmOdzsPed6S0qKWaLP/ouZFn0ngz6BIYZcff++0n75Yt6fCP
	0nAoVLqK8al0Uz4mVAFEAWcDM5HFINlxzpcgrTJdhbezJwRxCXjTw599/Z1MMrk=
X-Gm-Gg: ASbGnctz61nYczl29ZfDbspce3p4KVkY+Dor7BndNI78q4ERQ3HjZ86cNQYJAKbHXf+
	6kjhnZeNFcXBP0VDzNQLFeXcoga8o2xc/SMlOOrankzEBRrtqn4FU7RauTWRdE8vbpAk+8qGgoE
	4OpIWf5uW1F8InrZRHf9tkIPZ/FDYpycMZYuOTnggoaD6t+AmSmeK31iuX6N8F780dsI4nw1UkJ
	hgAZPHcyCvPBFhbJnVnHHF0vON85NUYTbRED4rDeitnDLnXKpUEe9kqzBMb0BqYqFwSLQulhU53
	EwHg
X-Google-Smtp-Source: AGHT+IH639w8V3BtUp5cxLcBjQetbapqpzOXln19CAP+ZqrDHOwP5XxOdyunw5Ijrqx20JiuObdrsQ==
X-Received: by 2002:a17:906:c156:b0:ab3:3283:faf9 with SMTP id a640c23a62f3a-ab38cd63286mr1133294666b.24.1737449201615;
        Tue, 21 Jan 2025 00:46:41 -0800 (PST)
Date: Tue, 21 Jan 2025 09:46:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5] vpci: Add resizable bar support
Message-ID: <Z49e8NmROzke-tYc@macbook.local>
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114032636.3698383-1-Jiqian.Chen@amd.com>

On Tue, Jan 14, 2025 at 11:26:36AM +0800, Jiqian Chen wrote:
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
> v4->v5 changes:
> * Called pci_size_mem_bar in rebar_ctrl_write to get addr and size of BAR instead of setting
>   their values directly after writing new size to hardware.
> * Changed from "return" to "continue" when index/type of BAR are not correct during initializing
>   BAR.
> * Corrected the value of PCI_REBAR_CTRL_BAR_SIZE from "0x00001F00" to "0x00003F00".
> * Renamed PCI_REBAR_SIZE_BIAS to PCI_REBAR_CTRL_SIZE_BIAS.
> * Re-defined "PCI_REBAR_CAP_SHIFT 4" to "PCI_REBAR_CAP_SIZES_MASK 0xFFFFFFF0U".
> 
> Best regards,
> Jiqian Chen.
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
>  xen/drivers/vpci/rebar.c   | 135 +++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c    |   6 ++
>  xen/include/xen/pci_regs.h |  14 ++++
>  xen/include/xen/vpci.h     |   3 +
>  5 files changed, 159 insertions(+), 1 deletion(-)
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
> index 000000000000..ed22a75e16fd
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,135 @@
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
> +    unsigned int index;
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
> +    if ( !((size >> PCI_REBAR_CTRL_SIZE_BIAS) & bar->resizable_sizes) )
> +        gprintk(XENLOG_WARNING,
> +                "%pp: new size %#lx is not supported by hardware\n",
> +                &pdev->sbdf, size);
> +
> +    pci_conf_write32(pdev->sbdf, reg, val);
> +
> +    index = pci_conf_read32(pdev->sbdf, reg) & PCI_REBAR_CTRL_BAR_IDX;

No need for the PCI config space access, you can get the index using:

bar - pdev->vpci->header.bars

In fact you could define the local variables as:

struct vpci_bar *bar = data;
const unsigned int index = bar - pdev->vpci->header.bars;
uint64_t size = PCI_REBAR_CTRL_SIZE(val);

And use index in the error messages also:

"%pp: refuse to resize BAR#u with memory decoding enabled\n"
"%pp: new BAR#%u size %#lx is not supported by hardware\n",

> +    pci_size_mem_bar(pdev->sbdf, PCI_BASE_ADDRESS_0 + index * 4, &bar->addr,
> +                     &bar->size, ((index == PCI_HEADER_NORMAL_NR_BARS - 1) ?
> +                                  PCI_BAR_LAST : 0));

Seeing as Jan already asked you to fix indentation here, I think you
can also drop the outermost parentheses from the last argument.

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
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> +        if ( rc )
> +        {
> +            /*
> +             * TODO: for failed pathes, need to hide ReBar capability
> +             * from hardware domain instead of returning an error.
> +             */
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

I think we said we wanted to attempt to continue here, rather than
returning an error and thus removing all vPCI handlers from the
device?

Error messages should also contain the BAR index IMO:

"%pd %pp: BAR%u fail to add reg of REBAR_{CAP,CTRL} rc=%d\n"

Thanks, Roger.

