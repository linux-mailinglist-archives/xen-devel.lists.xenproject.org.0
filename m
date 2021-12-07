Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AD46C60F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241899.418490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muheS-0005po-D8; Tue, 07 Dec 2021 21:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241899.418490; Tue, 07 Dec 2021 21:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muheS-0005nX-8u; Tue, 07 Dec 2021 21:05:28 +0000
Received: by outflank-mailman (input) for mailman id 241899;
 Tue, 07 Dec 2021 21:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muheR-0005Sw-06
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:05:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66278998-57a1-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 22:05:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A06AFB81E86;
 Tue,  7 Dec 2021 21:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C0FC341C3;
 Tue,  7 Dec 2021 21:05:23 +0000 (UTC)
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
X-Inumbo-ID: 66278998-57a1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638911124;
	bh=SSlqi2avER7Dt/gWeQCpUUK2WPs6V3REpcTbyOpLSVo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CQtpmV/VopSugovJYtB6rKgOASfGm+plq9ohd+c4gicwGabcfRU6ytOddQjW3Ve3g
	 tNsgaOjeq555aKWCr9jX9ODfSAmC5gTVJ3vse/nmE/bt6EDI8IgNQkIg/STXmf+7zE
	 U64SEr9asqbhWIQiNhiBgpiH/BRtSY7WmUh34L91oWrRiTQR4AmZqrtRLVMJBHFyQ9
	 UasPXsz2PYCPtfItiij1woyf8fHZ+e13Xx+SVxc9GVYIn8V5Hs0PkqB4OagIliTaI+
	 V7FpgXy1X/0HnHOAWVtqEJ1pP+FwItrm6eFFL4yJzWnlD+4qQ//Q8RNQddmclqTqgt
	 UL3+7UtH4ejJw==
Date: Tue, 7 Dec 2021 15:05:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 25/36] PCI/MSI: Provide MSI_FLAG_MSIX_CONTIGUOUS
Message-ID: <20211207210522.GA77919@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210439.021277807@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:36PM +0100, Thomas Gleixner wrote:
> Provide a domain info flag which makes the core code check for a contiguous
> MSI-X index on allocation. That's simpler than checking it at some other
> domain callback in architecture code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |   16 ++++++++++++++--
>  include/linux/msi.h         |    2 ++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -89,9 +89,21 @@ static int pci_msi_domain_check_cap(stru
>  	if (pci_msi_desc_is_multi_msi(desc) &&
>  	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
>  		return 1;
> -	else if (desc->pci.msi_attrib.is_msix && !(info->flags & MSI_FLAG_PCI_MSIX))
> -		return -ENOTSUPP;
>  
> +	if (desc->pci.msi_attrib.is_msix) {
> +		if (!(info->flags & MSI_FLAG_PCI_MSIX))
> +			return -ENOTSUPP;
> +
> +		if (info->flags & MSI_FLAG_MSIX_CONTIGUOUS) {
> +			unsigned int idx = 0;
> +
> +			/* Check for gaps in the entry indices */
> +			for_each_msi_entry(desc, dev) {
> +				if (desc->msi_index != idx++)
> +					return -ENOTSUPP;
> +			}
> +		}
> +	}
>  	return 0;
>  }
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -376,6 +376,8 @@ enum {
>  	MSI_FLAG_LEVEL_CAPABLE		= (1 << 6),
>  	/* Populate sysfs on alloc() and destroy it on free() */
>  	MSI_FLAG_DEV_SYSFS		= (1 << 7),
> +	/* MSI-X entries must be contiguous */
> +	MSI_FLAG_MSIX_CONTIGUOUS	= (1 << 8),
>  };
>  
>  int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
> 

