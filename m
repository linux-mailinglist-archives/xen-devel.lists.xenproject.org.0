Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C643846C5F3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241881.418446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhct-0003a8-4Z; Tue, 07 Dec 2021 21:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241881.418446; Tue, 07 Dec 2021 21:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhct-0003Xi-1I; Tue, 07 Dec 2021 21:03:51 +0000
Received: by outflank-mailman (input) for mailman id 241881;
 Tue, 07 Dec 2021 21:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhcr-0003XP-RQ
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:03:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4a3ead-57a1-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 22:03:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 644DEB81E83;
 Tue,  7 Dec 2021 21:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3146C341C3;
 Tue,  7 Dec 2021 21:03:46 +0000 (UTC)
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
X-Inumbo-ID: 2c4a3ead-57a1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638911027;
	bh=vdg+fdIoCSHr3OuhnQ0WRPeCcsFTBIQTTd4u0ji8WKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BWMnoqb5zI+AmfRiWx3hI7UPFSjiK/sP2RxrS/8pFSfaQGXzC3HU5dj9jSSkTmxbf
	 ycQhxHGG+Fcj7qVvDrSdgVJzP+m2Fjh741SbIXpMXFhrEEquIdcMBPdXl+aCsQmDEI
	 3zeK6GYY3etemeN1yu/6VsPnz0YoMH8zSdcDzIsPZqnlh4gHq48kIVDNWK7rfFTy1S
	 gUW/xdBLJLcAxyL2Qhdnp0jAybfRKhRZLoNsDlD33Kr8AWcXVe4iBXGW98+dAzo2jz
	 rnorth7z8Yvh3+kr56v1pmkD4iYXulFwuR50cFJdivxqVn0FvmmJNz1QRCJTf0dRQk
	 vTu+UFqcSYVkw==
Date: Tue, 7 Dec 2021 15:03:45 -0600
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
Subject: Re: [patch V2 03/36] PCI/MSI: Allocate MSI device data on first use
Message-ID: <20211207210345.GA77648@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210437.821900680@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:00PM +0100, Thomas Gleixner wrote:
> Allocate MSI device data on first use, i.e. when a PCI driver invokes one
> of the PCI/MSI enablement functions.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/msi.c |   20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -889,10 +889,12 @@ static int __pci_enable_msi_range(struct
>  /* deprecated, don't use */
>  int pci_enable_msi(struct pci_dev *dev)
>  {
> -	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
> -	if (rc < 0)
> -		return rc;
> -	return 0;
> +	int rc = msi_setup_device_data(&dev->dev);
> +
> +	if (!rc)
> +		rc = __pci_enable_msi_range(dev, 1, 1, NULL);
> +
> +	return rc < 0 ? rc : 0;
>  }
>  EXPORT_SYMBOL(pci_enable_msi);
>  
> @@ -947,7 +949,11 @@ static int __pci_enable_msix_range(struc
>  int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
>  		int minvec, int maxvec)
>  {
> -	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
> +	int ret = msi_setup_device_data(&dev->dev);
> +
> +	if (!ret)
> +		ret = __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
> +	return ret;
>  }
>  EXPORT_SYMBOL(pci_enable_msix_range);
>  
> @@ -974,8 +980,12 @@ int pci_alloc_irq_vectors_affinity(struc
>  				   struct irq_affinity *affd)
>  {
>  	struct irq_affinity msi_default_affd = {0};
> +	int ret = msi_setup_device_data(&dev->dev);
>  	int nvecs = -ENOSPC;
>  
> +	if (ret)
> +		return ret;
> +
>  	if (flags & PCI_IRQ_AFFINITY) {
>  		if (!affd)
>  			affd = &msi_default_affd;
> 

