Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5846C628
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241921.418524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhfz-0007nK-Hs; Tue, 07 Dec 2021 21:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241921.418524; Tue, 07 Dec 2021 21:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhfz-0007kv-8D; Tue, 07 Dec 2021 21:07:03 +0000
Received: by outflank-mailman (input) for mailman id 241921;
 Tue, 07 Dec 2021 21:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhXW-0004h1-Mw
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 20:58:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 660c5fe8-57a0-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 21:58:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FF13B81E92;
 Tue,  7 Dec 2021 20:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4B6C341C3;
 Tue,  7 Dec 2021 20:58:11 +0000 (UTC)
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
X-Inumbo-ID: 660c5fe8-57a0-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638910692;
	bh=mKk8CFP6CJrrE5nazjOj8lJlCLeQEHsGLEd20u/74iY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=m6v2l2upjdgPf9w2JTHnTqJo1IQhsUtXrf8F9Vikgt6+Z8JqCK5xTJ6F2LKLBJXQk
	 f1feWsiex81V9M40VjQRY77dpHbpD+YmBN2/r2JsoxH2g2LiC+DUIcON3qHLEuh8Gz
	 NS6nDZmsa9Hrr+xtsG+VdRDrQGZcy670xHqNHikhH4k3q1XX1eLrZK8iiGqA/IMnEQ
	 FGWo8oJA6eAk1Fsb1P04L/6yLfhUvAWrjKF8GwSnqFoyeEQDmyRKL99yFYxSQnHXA8
	 H6M+S6xb4uWxb4Amw+dIX3H7cHFGQYQknXpKDLlndF8FSRGQgNUUZsQJZtz3LOqh0f
	 LsDHp544cDXEg==
Date: Tue, 7 Dec 2021 14:58:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 16/23] PCI/MSI: Split out CONFIG_PCI_MSI independent
 part
Message-ID: <20211207205810.GA76983@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.710137730@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:49PM +0100, Thomas Gleixner wrote:
> These functions are required even when CONFIG_PCI_MSI is not set. Move them
> to their own file.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/Makefile     |    3 ++-
>  drivers/pci/msi/msi.c        |   39 ---------------------------------------
>  drivers/pci/msi/pcidev_msi.c |   43 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+), 40 deletions(-)
> 
> --- a/drivers/pci/msi/Makefile
> +++ b/drivers/pci/msi/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Makefile for the PCI/MSI
> -obj-$(CONFIG_PCI)		+= msi.o
> +obj-$(CONFIG_PCI)		+= pcidev_msi.o
> +obj-$(CONFIG_PCI_MSI)		+= msi.o
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -18,8 +18,6 @@
>  
>  #include "../pci.h"
>  
> -#ifdef CONFIG_PCI_MSI
> -
>  static int pci_msi_enable = 1;
>  int pci_msi_ignore_mask;
>  
> @@ -1493,40 +1491,3 @@ bool pci_dev_has_special_msi_domain(stru
>  }
>  
>  #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
> -#endif /* CONFIG_PCI_MSI */
> -
> -void pci_msi_init(struct pci_dev *dev)
> -{
> -	u16 ctrl;
> -
> -	/*
> -	 * Disable the MSI hardware to avoid screaming interrupts
> -	 * during boot.  This is the power on reset default so
> -	 * usually this should be a noop.
> -	 */
> -	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
> -	if (!dev->msi_cap)
> -		return;
> -
> -	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
> -	if (ctrl & PCI_MSI_FLAGS_ENABLE)
> -		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
> -				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
> -
> -	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -		dev->no_64bit_msi = 1;
> -}
> -
> -void pci_msix_init(struct pci_dev *dev)
> -{
> -	u16 ctrl;
> -
> -	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
> -	if (!dev->msix_cap)
> -		return;
> -
> -	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
> -	if (ctrl & PCI_MSIX_FLAGS_ENABLE)
> -		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
> -				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
> -}
> --- /dev/null
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MSI[X} related functions which are available unconditionally.
> + */
> +#include "../pci.h"
> +
> +/*
> + * Disable the MSI[X] hardware to avoid screaming interrupts during boot.
> + * This is the power on reset default so usually this should be a noop.
> + */
> +
> +void pci_msi_init(struct pci_dev *dev)
> +{
> +	u16 ctrl;
> +
> +	dev->msi_cap = pci_find_capability(dev, PCI_CAP_ID_MSI);
> +	if (!dev->msi_cap)
> +		return;
> +
> +	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &ctrl);
> +	if (ctrl & PCI_MSI_FLAGS_ENABLE) {
> +		pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS,
> +				      ctrl & ~PCI_MSI_FLAGS_ENABLE);
> +	}
> +
> +	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> +		dev->no_64bit_msi = 1;
> +}
> +
> +void pci_msix_init(struct pci_dev *dev)
> +{
> +	u16 ctrl;
> +
> +	dev->msix_cap = pci_find_capability(dev, PCI_CAP_ID_MSIX);
> +	if (!dev->msix_cap)
> +		return;
> +
> +	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &ctrl);
> +	if (ctrl & PCI_MSIX_FLAGS_ENABLE) {
> +		pci_write_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS,
> +				      ctrl & ~PCI_MSIX_FLAGS_ENABLE);
> +	}
> +}
> 

