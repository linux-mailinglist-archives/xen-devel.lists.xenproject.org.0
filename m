Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E146C5F9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241886.418457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhdP-00049A-E8; Tue, 07 Dec 2021 21:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241886.418457; Tue, 07 Dec 2021 21:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhdP-00046K-A2; Tue, 07 Dec 2021 21:04:23 +0000
Received: by outflank-mailman (input) for mailman id 241886;
 Tue, 07 Dec 2021 21:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhdN-0003Ww-AD
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:04:21 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ddb28b9-57a1-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 22:04:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0B225CE1E6D;
 Tue,  7 Dec 2021 21:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EFCC341C3;
 Tue,  7 Dec 2021 21:04:15 +0000 (UTC)
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
X-Inumbo-ID: 3ddb28b9-57a1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638911056;
	bh=Xo6O3jGlzOANOmR4B4AaNenI/3W1MbWz8sJEDkoXKaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=U244wwsKXfLaRSba10m6gANWp5kb5rrKjuv8gVTFk236rfqvdIer5hktfEtuaXLPq
	 BJ3e6kiGjgdY/544N3aZs5NyCPVUyrijSIV4zfcTm8y+ZSmfE/rUj+EdTDlvhYv6lh
	 6LGuSbitHQ2cBwVEDjbUKzVmrdMZGhbfZZZZyAqNq8+VrLZV2Hbhb0Yx12m1M5hGK0
	 i7S8L5dDlelB4EdCDNKZH9QgFSFwAL3gwNRVDlp95/CQ6bo58UgFcjHZVwlu5rUY4b
	 8JDHSpfF/UG/BKzFhhHH1qVx91UaU9AaWRpxNjJFeZGYwBjD168V/EE2a6WPNO+j76
	 DtG1dxs1QDegA==
Date: Tue, 7 Dec 2021 15:04:14 -0600
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
Subject: Re: [patch V2 08/36] PCI/MSI: Let the irq code handle sysfs groups
Message-ID: <20211207210414.GA77702@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210438.091930107@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:09PM +0100, Thomas Gleixner wrote:
> Set the domain info flag which makes the core code handle sysfs groups and
> put an explicit invocation into the legacy code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |    2 +-
>  drivers/pci/msi/legacy.c    |    6 +++++-
>  drivers/pci/msi/msi.c       |   23 -----------------------
>  include/linux/pci.h         |    1 -
>  4 files changed, 6 insertions(+), 26 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -159,7 +159,7 @@ struct irq_domain *pci_msi_create_irq_do
>  	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
>  		pci_msi_domain_update_chip_ops(info);
>  
> -	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
> +	info->flags |= MSI_FLAG_ACTIVATE_EARLY | MSI_FLAG_DEV_SYSFS;
>  	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
>  		info->flags |= MSI_FLAG_MUST_REACTIVATE;
>  
> --- a/drivers/pci/msi/legacy.c
> +++ b/drivers/pci/msi/legacy.c
> @@ -70,10 +70,14 @@ int pci_msi_legacy_setup_msi_irqs(struct
>  {
>  	int ret = arch_setup_msi_irqs(dev, nvec, type);
>  
> -	return pci_msi_setup_check_result(dev, type, ret);
> +	ret = pci_msi_setup_check_result(dev, type, ret);
> +	if (!ret)
> +		ret = msi_device_populate_sysfs(&dev->dev);
> +	return ret;
>  }
>  
>  void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
>  {
> +	msi_device_destroy_sysfs(&dev->dev);
>  	arch_teardown_msi_irqs(dev);
>  }
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -233,11 +233,6 @@ static void free_msi_irqs(struct pci_dev
>  			for (i = 0; i < entry->nvec_used; i++)
>  				BUG_ON(irq_has_action(entry->irq + i));
>  
> -	if (dev->msi_irq_groups) {
> -		msi_destroy_sysfs(&dev->dev, dev->msi_irq_groups);
> -		dev->msi_irq_groups = NULL;
> -	}
> -
>  	pci_msi_teardown_msi_irqs(dev);
>  
>  	list_for_each_entry_safe(entry, tmp, msi_list, list) {
> @@ -417,7 +412,6 @@ static int msi_verify_entries(struct pci
>  static int msi_capability_init(struct pci_dev *dev, int nvec,
>  			       struct irq_affinity *affd)
>  {
> -	const struct attribute_group **groups;
>  	struct msi_desc *entry;
>  	int ret;
>  
> @@ -441,14 +435,6 @@ static int msi_capability_init(struct pc
>  	if (ret)
>  		goto err;
>  
> -	groups = msi_populate_sysfs(&dev->dev);
> -	if (IS_ERR(groups)) {
> -		ret = PTR_ERR(groups);
> -		goto err;
> -	}
> -
> -	dev->msi_irq_groups = groups;
> -
>  	/* Set MSI enabled bits	*/
>  	pci_intx_for_msi(dev, 0);
>  	pci_msi_set_enable(dev, 1);
> @@ -576,7 +562,6 @@ static void msix_mask_all(void __iomem *
>  static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
>  				int nvec, struct irq_affinity *affd)
>  {
> -	const struct attribute_group **groups;
>  	void __iomem *base;
>  	int ret, tsize;
>  	u16 control;
> @@ -618,14 +603,6 @@ static int msix_capability_init(struct p
>  
>  	msix_update_entries(dev, entries);
>  
> -	groups = msi_populate_sysfs(&dev->dev);
> -	if (IS_ERR(groups)) {
> -		ret = PTR_ERR(groups);
> -		goto out_free;
> -	}
> -
> -	dev->msi_irq_groups = groups;
> -
>  	/* Set MSI-X enabled bits and unmask the function */
>  	pci_intx_for_msi(dev, 0);
>  	dev->msix_enabled = 1;
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -475,7 +475,6 @@ struct pci_dev {
>  #ifdef CONFIG_PCI_MSI
>  	void __iomem	*msix_base;
>  	raw_spinlock_t	msi_lock;
> -	const struct attribute_group **msi_irq_groups;
>  #endif
>  	struct pci_vpd	vpd;
>  #ifdef CONFIG_PCIE_DPC
> 

