Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1126A306D0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885190.1294973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmSg-00058L-Ne; Tue, 11 Feb 2025 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885190.1294973; Tue, 11 Feb 2025 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmSg-00056G-Kn; Tue, 11 Feb 2025 09:21:46 +0000
Received: by outflank-mailman (input) for mailman id 885190;
 Tue, 11 Feb 2025 09:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thmSe-0004Wg-NI
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:21:44 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9917301e-e859-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:21:39 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21f6f18b474so39391105ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:21:39 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3650e6c0sm90842385ad.22.2025.02.11.01.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 01:21:37 -0800 (PST)
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
X-Inumbo-ID: 9917301e-e859-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739265698; x=1739870498; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G6iTFPwrQnvC7Hy2XmcKbbReVWjtB84/Dmlkfgvn7hg=;
        b=IK76wLJAZZG2pZZYyQdNQhRWz6TrNwWUdlKTeJBY/VaEfRDZk1DxohPq2/IEwZgJgj
         971cY5qOp+X3bYf+bCw0mkxVJ0Teh9KWjFJ3CIXJhBatP3+2X4mtPsZgUb4DDfQytWZv
         zgjrjr7yNwwwkUe8cNko8lMWUl+aDUgKa9Cwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265698; x=1739870498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6iTFPwrQnvC7Hy2XmcKbbReVWjtB84/Dmlkfgvn7hg=;
        b=FWQhrZ7JwkVSlhPb0vGcDq13uoA/SS+kHDV1EUldHFpJbfym4XwiRu88nY0zdCRTRC
         FX1nZm3Xl3JwS0UVWnSvTbXhQ0MYdgiBs0fpOFTEshVc9MJxB+jXEJVMBzI1hnuo1sQ0
         UXFvvOmvPVtQdxWP5SYXuyqyZ94S+LQth2SIozgE81KAWvj1iZQqp94FvqrVi8zL+08i
         BhAWQh2cEymex32aSB9NgYas+9p+eu+XSQWkd6ZX6j+qa2U1Ws61yqV7H7LS5/77kaXs
         lFqWOyIMYc2uQCiLaEBLbDIe/8F6BJbhKHnP/u3A+DhSSWXiVfxM6jn3Sh5GZEA7txKx
         jRMQ==
X-Gm-Message-State: AOJu0Yy8ih4OZnvfLgn9i2f32/XdWW7mCFOUR7QCkyDPTCDKw3SNoSER
	djD673c3HkjuqfhavwFFNObhJ1umYnRIPc0G4Uj1ZmYmAc9m6+hZe4KxAAGf2XA=
X-Gm-Gg: ASbGncsJ/ClXpW9Ze5SXEL41e6VMh0rORaJYFE1d0hNv7Rb02x3QuSXpyMswVxJqBzW
	SONVLkgJBjL1l6cbx7nOqqCHotS2v54CCIbKyYiD52G++msHsoqWEwyV6C7Gwq0mNbQakMGz4Dy
	Fo9FEa/zFNrQu7jJWnFOJDd08O0qBNt+r8DKApx1zTCsqvbrQIpOGTXDpRcIWCj6fU6iPzu489s
	IkXqYkBfOanN2OB5Xn9eNvV4Avy7w/tr/DVjfYTekoO7hPLjNLQPTxiLj3CiVweavoziV4UIhn5
	cPs2WdApU8CqvJTevSto
X-Google-Smtp-Source: AGHT+IHfarUfwLkABpqKJACCM8PaYufOSiaH09zA1z2XEpebVQmpkVT3dWuIHIOWmD+oISwUotbERA==
X-Received: by 2002:a17:902:ef09:b0:216:386e:dbc with SMTP id d9443c01a7336-21f4e6c22e7mr243028245ad.13.1739265698351;
        Tue, 11 Feb 2025 01:21:38 -0800 (PST)
Date: Tue, 11 Feb 2025 10:21:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v8] vpci: Add resizable bar support
Message-ID: <Z6sWnK1BYxArBq--@macbook.local>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211022257.1690366-1-Jiqian.Chen@amd.com>

On Tue, Feb 11, 2025 at 10:22:57AM +0800, Jiqian Chen wrote:
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
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Hi all,
> v7->v8 changes:
> * Modified commit message and some comments.
> * Deleted unused function vpci_hw_write32.
> 
> Best regards,
> Jiqian Chen.
> 
> v6->v7 changes:
> * Deleted codes that add register for PCI_REBAR_CAP, and added comments to explain why.
> * Added comments to explain why use "continue" when fail to add register for PCI_REBAR_CTRL.
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
>  xen/drivers/vpci/rebar.c   | 131 +++++++++++++++++++++++++++++++++++++
>  xen/include/xen/pci_regs.h |  15 +++++
>  xen/include/xen/vpci.h     |   1 +
>  4 files changed, 148 insertions(+), 1 deletion(-)
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
> index 000000000000..794f1168adf8
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,131 @@
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

Since you define index as const you could also do the same with size.
Can adjust at commit, but I also don't have a strong opinion about
it.

Thanks, Roger.

