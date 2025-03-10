Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F095A58EE0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906276.1313734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZ3K-00024C-Or; Mon, 10 Mar 2025 09:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906276.1313734; Mon, 10 Mar 2025 09:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZ3K-00022U-LF; Mon, 10 Mar 2025 09:04:02 +0000
Received: by outflank-mailman (input) for mailman id 906276;
 Mon, 10 Mar 2025 09:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKOj=V5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1trZ3J-0001qd-56
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:04:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ac99580-fd8e-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 10:03:59 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2b10bea16so18599866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:03:59 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac283e4d50csm322617166b.175.2025.03.10.02.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:03:58 -0700 (PDT)
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
X-Inumbo-ID: 9ac99580-fd8e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741597439; x=1742202239; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8hu8ZQsUKK5QBrOl69DO8IdswJx6xSlr1Qh4X16VMs=;
        b=mzQtQU8oZ5LWIoBlcRLLYbBgZIrey6wwKgf9YmuiMie3cXkmz6jhIgifdDDcpCPgk6
         B3ZbK7A4E0lhCxaVdkg0oOa62YmQDVpRDu8DVcXJUU/oQ719Cu1nralUrlYXj7YnGhK8
         08iAAkfn+pvHmh0H2UkBUeJzDnxjfkNd2Z5NrtSyDG1O2tk1oaZU1b44a9RpaKtPfWhS
         Syzism5tMTiibJbAUiYbOXrBXfj7m69tl/lmJSHu5GCG6VglnsBlJgqRrJHOAr1NioH9
         zx3bTK0D/PdmuZmO6qlWSWUyime0VUMIVrWjrFgaNEd8+eiUf94UIyK+2Zu8VMN65vvt
         A/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597439; x=1742202239;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8hu8ZQsUKK5QBrOl69DO8IdswJx6xSlr1Qh4X16VMs=;
        b=ZYrYR8VieDg2e7iRMJxW+ShtmYA5XPZE4qbkE+OnVsZAelXzStRbDRKsEEePpqNbzB
         khLmLK1oPrD3cfsXDYOkUH21g5nzkWqxx9xL9rckJdjykxGxmFl+6biO1N7rEUkQXtyg
         xld7gGlVSM6rZWoVJXUU5vE8hCHCEh+XrbNmMkUAqY+peSd/0jPnPdn8K9f1dn5mybJy
         1BCp71w/qQix0zr6WZ/GHVVYaicj5seYtkA+H+Sm1EZnLMysPNoPuzEfTmjESMuEBbvY
         ZuqCdsc7CqGhUJo8sqdc6zLQ/imZ1gva9BKoS5aLUzYXeCTibiHKvBNr1pHtbDGvA+S9
         Qc+A==
X-Forwarded-Encrypted: i=1; AJvYcCVWF03ZGIlLgzMdQDTFKAZMw8b7ik/4ugB2IzJzdnaMSAVMy9e1OCjvje1wsP6400evJZxdSi6I8L8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/zXq9hZw3NsRppKKrpwufXI+o/NvnckFORz1Zez6+SWUM/yGJ
	zFvmSWnXhQvapWJRN/4TANJaL5Qds8sPKMcukjN6Rta0/lB40g9oxQugMA==
X-Gm-Gg: ASbGncvm1AxVokh/C6YKFPGbe7gkvMgBfhfXWPBLBPJJREf9YTirBgu6zvFW4GfV6j4
	bCnEeSHq87uvVmXJ4oUv/5juBaUuQ/IyM/jLQ8NYWH096o30d1HaiGOJlFxJrnlkgyvIdgPmMDD
	GvX++hQCLnCnOPR9mj/vGtxQiVnaa9FvJY69Vh3WaQ0XNrw3RRTn6GDlyDXxPuyhfXzm8yIXlNb
	DQhsYafk9KYsKzfTZuUexdwgWLD+A59JkItpytFHmtwn8smPq9ct2DVrHn1xymP0EuNpTvU/OTD
	ai/6ZXkOnh6R0pu1O9Tl8vUYRe5RNcN4f9M62XYuDPuqXaTOGUsg3UNO+3woR//fg4+oUBwskbH
	X6jkwBtvtB0b5Pu+gCq7r
X-Google-Smtp-Source: AGHT+IFbTLEQAhRGHCz+l5QPDnR48NwK1ENrsA/1vF62xBZWNIarNEbKI8aoGpJdsOO7mV3riOrhAQ==
X-Received: by 2002:a17:907:1ca3:b0:ab7:b30:42ed with SMTP id a640c23a62f3a-ac2521295eamr1569415966b.0.1741597438629;
        Mon, 10 Mar 2025 02:03:58 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------40uO6hPC8HAGbShqZOiaZI6O"
Message-ID: <b773c2d7-b005-4671-90b9-2382dbb25cd2@gmail.com>
Date: Mon, 10 Mar 2025 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] vpci: Add resizable bar support
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20250224032433.1879630-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250224032433.1879630-1-Jiqian.Chen@amd.com>

This is a multi-part message in MIME format.
--------------40uO6hPC8HAGbShqZOiaZI6O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/25 4:24 AM, Jiqian Chen wrote:
> Some devices, like AMDGPU, support resizable bar capability,
> but vpci of Xen doesn't support this feature, so they fail
> to resize bars and then cause probing failure.
>
> According to PCIe spec, each bar that supports resizing has
> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> handlers to support resizing the size of BARs.
>
> Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
> is read-only register and the hardware domain already gets
> access to it without needing any setup.
>
> Signed-off-by: Jiqian Chen<Jiqian.Chen@amd.com>
> ---
> Hi all,
> v8->v9 changes:
> * Changed "size" to be const in function rebar_ctrl_write.
> * Delete sentence that describes PVH dom0 doesn't support resizable BARs in
>    SUPPORT.md since this patch is to support it
> * Added an entry to CHANGELOG.md to note Rebar is supported for PVH dom0.
>
> Best regards,
> Jiqian Chen.
>
> v7->v8 changes:
> * Modified commit message and some comments.
> * Deleted unused function vpci_hw_write32.
>
> v6->v7 changes:
> * Deleted codes that add register for PCI_REBAR_CAP, and added comments to explain why.
> * Added comments to explain why use "continue" when fail to add register for PCI_REBAR_CTRL.
>
> v5->v6 changes:
> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
>    from register.
> * Added the index of BAR to error messages.
> * Changed to "continue" instead of "return an error" when vpci_add_register failed.
>
> v4->v5 changes:
> * Called pci_size_mem_bar in rebar_ctrl_write to get addr and size of BAR instead of setting
>    their values directly after writing new size to hardware.
> * Changed from "return" to "continue" when index/type of BAR are not correct during initializing
>    BAR.
> * Corrected the value of PCI_REBAR_CTRL_BAR_SIZE from "0x00001F00" to "0x00003F00".
> * Renamed PCI_REBAR_SIZE_BIAS to PCI_REBAR_CTRL_SIZE_BIAS.
> * Re-defined "PCI_REBAR_CAP_SHIFT 4" to "PCI_REBAR_CAP_SIZES_MASK 0xFFFFFFF0U".
>
> v3->v4 changes:
> * Removed PCI_REBAR_CAP_SIZES since it was not needed, and added
>    PCI_REBAR_CAP_SHIFT and PCI_REBAR_CTRL_SIZES.
> * Added parameter resizable_sizes to struct vpci_bar to cache the support resizable sizes and
>    added the logic in init_rebar().
> * Changed PCI_REBAR_CAP to PCI_REBAR_CAP(n) (4+8*(n)), changed PCI_REBAR_CTRL to
>    PCI_REBAR_CTRL(n) (8+8*(n)).
> * Added domain info of pci_dev to printings of init_rebar().
>
> v2->v3 changes:
> * Used "bar->enabled" to replace "pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY",
>    and added comments why it needs this check.
> * Added "!is_hardware_domain(pdev->domain)" check in init_rebar() to return EOPNOTSUPP for domUs.
> * Moved BAR type and index check into init_rebar(), then only need to check once.
> * Added 'U' suffix for macro PCI_REBAR_CAP_SIZES.
> * Added macro PCI_REBAR_SIZE_BIAS to represent 20.
> TODO: need to hide ReBar capability from hardware domain when init_rebar() fails.
>
> v1->v2 changes:
> * In rebar_ctrl_write, to check if memory decoding is enabled, and added
>    some checks for the type of Bar.
> * Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
>    no write limitation of dom0.
> * And has many other minor modifications as well.
> ---
>   CHANGELOG.md               |   2 +
>   SUPPORT.md                 |   2 +-
>   xen/drivers/vpci/Makefile  |   2 +-
>   xen/drivers/vpci/rebar.c   | 131 +++++++++++++++++++++++++++++++++++++
>   xen/include/xen/pci_regs.h |  15 +++++
>   xen/include/xen/vpci.h     |   1 +
>   6 files changed, 151 insertions(+), 2 deletions(-)
>   create mode 100644 xen/drivers/vpci/rebar.c
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1979166820a8..9659dc2df9a1 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ### Changed
>   
>   ### Added
> + - On x86:
> +    - Resizable BARs is supported for PVH dom0.

Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii


>   
>   ### Removed
>   
> diff --git a/SUPPORT.md b/SUPPORT.md
> index e1f4769bd8b5..91cb6f8ed264 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -170,7 +170,7 @@ unexpected behavior or issues on some hardware.
>   
>   At least the following features are missing on a PVH dom0:
>   
> -  * PCI SR-IOV and Resizable BARs.
> +  * PCI SR-IOV.
>   
>     * Native NMI forwarding (nmi=dom0 command line option).
>   
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 1a1413b93e76..a7c8a30a8956 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += vpci.o header.o
> +obj-y += vpci.o header.o rebar.o
>   obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> new file mode 100644
> index 000000000000..793937449af7
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Jiqian Chen<Jiqian.Chen@amd.com>
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
> +    const uint64_t size = PCI_REBAR_CTRL_SIZE(val);
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
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, index, rc);
> +            /*
> +             * Ideally we would hide the ReBar capability on error, but code
> +             * for doing so still needs to be written. Use continue instead
> +             * to keep any already setup register hooks, as returning an
> +             * error will cause the hardware domain to get unmediated access
> +             * to all device registers.
> +             */
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
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index 250ba106dbd3..2f1d0d63e962 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -459,6 +459,7 @@
>   #define PCI_EXT_CAP_ID_ARI	14
>   #define PCI_EXT_CAP_ID_ATS	15
>   #define PCI_EXT_CAP_ID_SRIOV	16
> +#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
>   
>   /* Advanced Error Reporting */
>   #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
> @@ -541,6 +542,20 @@
>   #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
>   #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
>   
> +/* Resizable BARs */
> +#define PCI_REBAR_CAP(n)	(4 + 8 * (n))	/* capability register */
> +#define  PCI_REBAR_CAP_SIZES_MASK	0xFFFFFFF0U	/* supported BAR sizes in CAP */
> +#define PCI_REBAR_CTRL(n)	(8 + 8 * (n))	/* control register */
> +#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007	/* BAR index */
> +#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
> +#define  PCI_REBAR_CTRL_BAR_SIZE	0x00003F00	/* BAR size */
> +#define  PCI_REBAR_CTRL_SIZES_MASK	0xFFFF0000U	/* supported BAR sizes in CTRL */
> +
> +#define PCI_REBAR_CTRL_SIZE_BIAS	20
> +#define PCI_REBAR_CTRL_SIZE(v) \
> +            (1ULL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
> +                      + PCI_REBAR_CTRL_SIZE_BIAS))
> +
>   /*
>    * Hypertransport sub capability types
>    *
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 41e7c3bc2791..807401b2eaa2 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -100,6 +100,7 @@ struct vpci {
>               /* Guest address. */
>               uint64_t guest_addr;
>               uint64_t size;
> +            uint64_t resizable_sizes;
>               struct rangeset *mem;
>               enum {
>                   VPCI_BAR_EMPTY,
--------------40uO6hPC8HAGbShqZOiaZI6O
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/24/25 4:24 AM, Jiqian Chen wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250224032433.1879630-1-Jiqian.Chen@amd.com">
      <pre wrap="" class="moz-quote-pre">Some devices, like AMDGPU, support resizable bar capability,
but vpci of Xen doesn't support this feature, so they fail
to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers to support resizing the size of BARs.

Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
is read-only register and the hardware domain already gets
access to it without needing any setup.

Signed-off-by: Jiqian Chen <a class="moz-txt-link-rfc2396E" href="mailto:Jiqian.Chen@amd.com">&lt;Jiqian.Chen@amd.com&gt;</a>
---
Hi all,
v8-&gt;v9 changes:
* Changed "size" to be const in function rebar_ctrl_write.
* Delete sentence that describes PVH dom0 doesn't support resizable BARs in
  SUPPORT.md since this patch is to support it
* Added an entry to CHANGELOG.md to note Rebar is supported for PVH dom0.

Best regards,
Jiqian Chen.

v7-&gt;v8 changes:
* Modified commit message and some comments.
* Deleted unused function vpci_hw_write32.

v6-&gt;v7 changes:
* Deleted codes that add register for PCI_REBAR_CAP, and added comments to explain why.
* Added comments to explain why use "continue" when fail to add register for PCI_REBAR_CTRL.

v5-&gt;v6 changes:
* Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
* In rebar_ctrl_write used "bar - pdev-&gt;vpci-&gt;header.bars" to get index instead of reading
  from register.
* Added the index of BAR to error messages.
* Changed to "continue" instead of "return an error" when vpci_add_register failed.

v4-&gt;v5 changes:
* Called pci_size_mem_bar in rebar_ctrl_write to get addr and size of BAR instead of setting
  their values directly after writing new size to hardware.
* Changed from "return" to "continue" when index/type of BAR are not correct during initializing
  BAR.
* Corrected the value of PCI_REBAR_CTRL_BAR_SIZE from "0x00001F00" to "0x00003F00".
* Renamed PCI_REBAR_SIZE_BIAS to PCI_REBAR_CTRL_SIZE_BIAS.
* Re-defined "PCI_REBAR_CAP_SHIFT 4" to "PCI_REBAR_CAP_SIZES_MASK 0xFFFFFFF0U".

v3-&gt;v4 changes:
* Removed PCI_REBAR_CAP_SIZES since it was not needed, and added
  PCI_REBAR_CAP_SHIFT and PCI_REBAR_CTRL_SIZES.
* Added parameter resizable_sizes to struct vpci_bar to cache the support resizable sizes and
  added the logic in init_rebar().
* Changed PCI_REBAR_CAP to PCI_REBAR_CAP(n) (4+8*(n)), changed PCI_REBAR_CTRL to
  PCI_REBAR_CTRL(n) (8+8*(n)).
* Added domain info of pci_dev to printings of init_rebar().

v2-&gt;v3 changes:
* Used "bar-&gt;enabled" to replace "pci_conf_read16(pdev-&gt;sbdf, PCI_COMMAND) &amp; PCI_COMMAND_MEMORY",
  and added comments why it needs this check.
* Added "!is_hardware_domain(pdev-&gt;domain)" check in init_rebar() to return EOPNOTSUPP for domUs.
* Moved BAR type and index check into init_rebar(), then only need to check once.
* Added 'U' suffix for macro PCI_REBAR_CAP_SIZES.
* Added macro PCI_REBAR_SIZE_BIAS to represent 20.
TODO: need to hide ReBar capability from hardware domain when init_rebar() fails.

v1-&gt;v2 changes:
* In rebar_ctrl_write, to check if memory decoding is enabled, and added
  some checks for the type of Bar.
* Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
  no write limitation of dom0.
* And has many other minor modifications as well.
---
 CHANGELOG.md               |   2 +
 SUPPORT.md                 |   2 +-
 xen/drivers/vpci/Makefile  |   2 +-
 xen/drivers/vpci/rebar.c   | 131 +++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h |  15 +++++
 xen/include/xen/vpci.h     |   1 +
 6 files changed, 151 insertions(+), 2 deletions(-)
 create mode 100644 xen/drivers/vpci/rebar.c

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820a8..9659dc2df9a1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 ### Changed
 
 ### Added
+ - On x86:
+    - Resizable BARs is supported for PVH dom0.</pre>
    </blockquote>
    <pre>Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20250224032433.1879630-1-Jiqian.Chen@amd.com">
      <pre wrap="" class="moz-quote-pre">
 
 ### Removed
 
diff --git a/SUPPORT.md b/SUPPORT.md
index e1f4769bd8b5..91cb6f8ed264 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -170,7 +170,7 @@ unexpected behavior or issues on some hardware.
 
 At least the following features are missing on a PVH dom0:
 
-  * PCI SR-IOV and Resizable BARs.
+  * PCI SR-IOV.
 
   * Native NMI forwarding (nmi=dom0 command line option).
 
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 1a1413b93e76..a7c8a30a8956 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1,2 +1,2 @@
-obj-y += vpci.o header.o
+obj-y += vpci.o header.o rebar.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
new file mode 100644
index 000000000000..793937449af7
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Jiqian Chen <a class="moz-txt-link-rfc2396E" href="mailto:Jiqian.Chen@amd.com">&lt;Jiqian.Chen@amd.com&gt;</a>
+ */
+
+#include &lt;xen/sched.h&gt;
+#include &lt;xen/vpci.h&gt;
+
+static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
+                                      unsigned int reg,
+                                      uint32_t val,
+                                      void *data)
+{
+    struct vpci_bar *bar = data;
+    const unsigned int index = bar - pdev-&gt;vpci-&gt;header.bars;
+    const uint64_t size = PCI_REBAR_CTRL_SIZE(val);
+
+    if ( bar-&gt;enabled )
+    {
+        /*
+         * Refuse to resize a BAR while memory decoding is enabled, as
+         * otherwise the size of the mapped region in the p2m would become
+         * stale with the newly set BAR size, and the position of the BAR
+         * would be reset to undefined.  Note the PCIe specification also
+         * forbids resizing a BAR with memory decoding enabled.
+         */
+        if ( size != bar-&gt;size )
+            gprintk(XENLOG_ERR,
+                    "%pp: refuse to resize BAR#%u with memory decoding enabled\n",
+                    &amp;pdev-&gt;sbdf, index);
+        return;
+    }
+
+    if ( !((size &gt;&gt; PCI_REBAR_CTRL_SIZE_BIAS) &amp; bar-&gt;resizable_sizes) )
+        gprintk(XENLOG_WARNING,
+                "%pp: new BAR#%u size %#lx is not supported by hardware\n",
+                &amp;pdev-&gt;sbdf, index, size);
+
+    pci_conf_write32(pdev-&gt;sbdf, reg, val);
+
+    pci_size_mem_bar(pdev-&gt;sbdf,
+                     PCI_BASE_ADDRESS_0 + index * 4,
+                     &amp;bar-&gt;addr,
+                     &amp;bar-&gt;size,
+                     (index == PCI_HEADER_NORMAL_NR_BARS - 1) ?
+                      PCI_BAR_LAST : 0);
+    bar-&gt;guest_addr = bar-&gt;addr;
+}
+
+static int cf_check init_rebar(struct pci_dev *pdev)
+{
+    uint32_t ctrl;
+    unsigned int nbars;
+    unsigned int rebar_offset = pci_find_ext_capability(pdev-&gt;sbdf,
+                                                        PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset )
+        return 0;
+
+    if ( !is_hardware_domain(pdev-&gt;domain) )
+    {
+        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
+               &amp;pdev-&gt;sbdf, pdev-&gt;domain);
+        return -EOPNOTSUPP;
+    }
+
+    ctrl = pci_conf_read32(pdev-&gt;sbdf, rebar_offset + PCI_REBAR_CTRL(0));
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+    for ( unsigned int i = 0; i &lt; nbars; i++ )
+    {
+        int rc;
+        struct vpci_bar *bar;
+        unsigned int index;
+
+        ctrl = pci_conf_read32(pdev-&gt;sbdf, rebar_offset + PCI_REBAR_CTRL(i));
+        index = ctrl &amp; PCI_REBAR_CTRL_BAR_IDX;
+        if ( index &gt;= PCI_HEADER_NORMAL_NR_BARS )
+        {
+            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
+                   pdev-&gt;domain, &amp;pdev-&gt;sbdf, index);
+            continue;
+        }
+
+        bar = &amp;pdev-&gt;vpci-&gt;header.bars[index];
+        if ( bar-&gt;type != VPCI_BAR_MEM64_LO &amp;&amp; bar-&gt;type != VPCI_BAR_MEM32 )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
+                   pdev-&gt;domain, &amp;pdev-&gt;sbdf, index);
+            continue;
+        }
+
+        rc = vpci_add_register(pdev-&gt;vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
+                   pdev-&gt;domain, &amp;pdev-&gt;sbdf, index, rc);
+            /*
+             * Ideally we would hide the ReBar capability on error, but code
+             * for doing so still needs to be written. Use continue instead
+             * to keep any already setup register hooks, as returning an
+             * error will cause the hardware domain to get unmediated access
+             * to all device registers.
+             */
+            continue;
+        }
+
+        bar-&gt;resizable_sizes =
+            MASK_EXTR(pci_conf_read32(pdev-&gt;sbdf,
+                                      rebar_offset + PCI_REBAR_CAP(i)),
+                      PCI_REBAR_CAP_SIZES_MASK);
+        bar-&gt;resizable_sizes |=
+            (((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES_MASK) &lt;&lt; 32) /
+             ISOLATE_LSB(PCI_REBAR_CAP_SIZES_MASK));
+    }
+
+    return 0;
+}
+REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 250ba106dbd3..2f1d0d63e962 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -459,6 +459,7 @@
 #define PCI_EXT_CAP_ID_ARI	14
 #define PCI_EXT_CAP_ID_ATS	15
 #define PCI_EXT_CAP_ID_SRIOV	16
+#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
 
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
@@ -541,6 +542,20 @@
 #define  PCI_VNDR_HEADER_REV(x)	(((x) &gt;&gt; 16) &amp; 0xf)
 #define  PCI_VNDR_HEADER_LEN(x)	(((x) &gt;&gt; 20) &amp; 0xfff)
 
+/* Resizable BARs */
+#define PCI_REBAR_CAP(n)	(4 + 8 * (n))	/* capability register */
+#define  PCI_REBAR_CAP_SIZES_MASK	0xFFFFFFF0U	/* supported BAR sizes in CAP */
+#define PCI_REBAR_CTRL(n)	(8 + 8 * (n))	/* control register */
+#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007	/* BAR index */
+#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0	/* # of resizable BARs */
+#define  PCI_REBAR_CTRL_BAR_SIZE	0x00003F00	/* BAR size */
+#define  PCI_REBAR_CTRL_SIZES_MASK	0xFFFF0000U	/* supported BAR sizes in CTRL */
+
+#define PCI_REBAR_CTRL_SIZE_BIAS	20
+#define PCI_REBAR_CTRL_SIZE(v) \
+            (1ULL &lt;&lt; (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) \
+                      + PCI_REBAR_CTRL_SIZE_BIAS))
+
 /*
  * Hypertransport sub capability types
  *
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc2791..807401b2eaa2 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -100,6 +100,7 @@ struct vpci {
             /* Guest address. */
             uint64_t guest_addr;
             uint64_t size;
+            uint64_t resizable_sizes;
             struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
</pre>
    </blockquote>
  </body>
</html>

--------------40uO6hPC8HAGbShqZOiaZI6O--

