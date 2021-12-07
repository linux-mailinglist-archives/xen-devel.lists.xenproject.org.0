Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157F046C63A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241942.418567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhgZ-0001vx-PK; Tue, 07 Dec 2021 21:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241942.418567; Tue, 07 Dec 2021 21:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhgZ-0001tg-Lg; Tue, 07 Dec 2021 21:07:39 +0000
Received: by outflank-mailman (input) for mailman id 241942;
 Tue, 07 Dec 2021 21:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhgY-00079Y-8d
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:07:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3dc61ec-57a1-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 22:07:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 84C38CE1E71;
 Tue,  7 Dec 2021 21:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581B4C341C1;
 Tue,  7 Dec 2021 21:07:33 +0000 (UTC)
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
X-Inumbo-ID: b3dc61ec-57a1-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638911253;
	bh=rm/dgcDZc26i41jsxR6lRThsXaeA0YmeED/ioZkcqVA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BDdTrFkGJqYMJkfZ24oGmCiYwWtwgaeqkDVS5p2+B5BGbBbquzqVbFjKhGA0ixp87
	 rnOFnZ92k4XK4XDydZfkwDbkfCqBPGS0SbpJn+sBIeWcxjTutLZrkk9Ud5DPYG0h8v
	 88ar8YXxyzMmXIQrc1a30nTQH8kMyPf4MsY+bEr3GH1lcDmrgEwrTeoB2rT92+dp9P
	 5zzU60myih/j0KuEzC1En46GwRrs9gKAtcTrgY+aSxFlCu25mkmg6cKbrpO6lKzpiW
	 IyEg6CN8avQj1nYchkGYRODTUlePd5GO54TQBkd++HIZNqGURT8y/MEIEhVKPPMovS
	 yfBSXDw+n4jRw==
Date: Tue, 7 Dec 2021 15:07:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	linux-ntb@googlegroups.com
Subject: Re: [patch V2 09/31] PCI/MSI: Let core code free MSI descriptors
Message-ID: <20211207210732.GA78249@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210748.089085131@linutronix.de>

On Mon, Dec 06, 2021 at 11:51:16PM +0100, Thomas Gleixner wrote:
> Set the domain info flag which tells the core code to free the MSI
> descriptors from msi_domain_free_irqs() and add an explicit call to the
> core function into the legacy code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |    3 ++-
>  drivers/pci/msi/legacy.c    |    1 +
>  drivers/pci/msi/msi.c       |   14 --------------
>  3 files changed, 3 insertions(+), 15 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -171,7 +171,8 @@ struct irq_domain *pci_msi_create_irq_do
>  	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
>  		pci_msi_domain_update_chip_ops(info);
>  
> -	info->flags |= MSI_FLAG_ACTIVATE_EARLY | MSI_FLAG_DEV_SYSFS;
> +	info->flags |= MSI_FLAG_ACTIVATE_EARLY | MSI_FLAG_DEV_SYSFS |
> +		       MSI_FLAG_FREE_MSI_DESCS;
>  	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
>  		info->flags |= MSI_FLAG_MUST_REACTIVATE;
>  
> --- a/drivers/pci/msi/legacy.c
> +++ b/drivers/pci/msi/legacy.c
> @@ -80,4 +80,5 @@ void pci_msi_legacy_teardown_msi_irqs(st
>  {
>  	msi_device_destroy_sysfs(&dev->dev);
>  	arch_teardown_msi_irqs(dev);
> +	msi_free_msi_descs(&dev->dev);
>  }
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -224,22 +224,8 @@ EXPORT_SYMBOL_GPL(pci_write_msi_msg);
>  
>  static void free_msi_irqs(struct pci_dev *dev)
>  {
> -	struct list_head *msi_list = dev_to_msi_list(&dev->dev);
> -	struct msi_desc *entry, *tmp;
> -	int i;
> -
> -	for_each_pci_msi_entry(entry, dev)
> -		if (entry->irq)
> -			for (i = 0; i < entry->nvec_used; i++)
> -				BUG_ON(irq_has_action(entry->irq + i));
> -
>  	pci_msi_teardown_msi_irqs(dev);
>  
> -	list_for_each_entry_safe(entry, tmp, msi_list, list) {
> -		list_del(&entry->list);
> -		free_msi_entry(entry);
> -	}
> -
>  	if (dev->msix_base) {
>  		iounmap(dev->msix_base);
>  		dev->msix_base = NULL;
> 

