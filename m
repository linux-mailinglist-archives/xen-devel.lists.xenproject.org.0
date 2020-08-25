Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E12521C2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 22:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAfN0-0001aa-Oc; Tue, 25 Aug 2020 20:16:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQdE=CD=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1kAfMz-0001aV-UU
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 20:16:37 +0000
X-Inumbo-ID: de8e27a4-1554-48f7-a077-aeccd1b7ee55
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de8e27a4-1554-48f7-a077-aeccd1b7ee55;
 Tue, 25 Aug 2020 20:16:37 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 067E02074D;
 Tue, 25 Aug 2020 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598386596;
 bh=D7Rw2PMoe8IDZOMsNEwXYiBG5PbxcS/orkj8Yivovec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ov+X/vU+a12BRBzFUckIxiGJXa6k21v6DegMqYXhC5Zng0n4wC039Oo6Bh3gFLV6x
 5vD3ZwCEzBTgAbeasiFHcdum1DtDxjLMC1uSLEqHlzqHo8MC0nxm4f0VoTgli+T0Qr
 kEY+uzx7LZz3MSVAGwF8UOQyU/JHe/YeVdDsMVuw=
Date: Tue, 25 Aug 2020 15:16:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch RFC 21/38] PCI: MSI: Provide
 pci_dev_has_special_msi_domain() helper
Message-ID: <20200825201634.GA1924972@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821002947.373714034@linutronix.de>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 21, 2020 at 02:24:45AM +0200, Thomas Gleixner wrote:
> Provide a helper function to check whether a PCI device is handled by a
> non-standard PCI/MSI domain. This will be used to exclude such devices
> which hang of a special bus, e.g. VMD, to be excluded from the irq domain
> override in irq remapping.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

s|PCI: MSI:|PCI/MSI:| in the subject if feasible.

> ---
>  drivers/pci/msi.c   |   22 ++++++++++++++++++++++
>  include/linux/msi.h |    1 +
>  2 files changed, 23 insertions(+)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1553,4 +1553,26 @@ struct irq_domain *pci_msi_get_device_do
>  					     DOMAIN_BUS_PCI_MSI);
>  	return dom;
>  }
> +
> +/**
> + * pci_dev_has_special_msi_domain - Check whether the device is handled by
> + *				    a non-standard PCI-MSI domain
> + * @pdev:	The PCI device to check.
> + *
> + * Returns: True if the device irqdomain or the bus irqdomain is
> + * non-standard PCI/MSI.
> + */
> +bool pci_dev_has_special_msi_domain(struct pci_dev *pdev)
> +{
> +	struct irq_domain *dom = dev_get_msi_domain(&pdev->dev);
> +
> +	if (!dom)
> +		dom = dev_get_msi_domain(&pdev->bus->dev);
> +
> +	if (!dom)
> +		return true;
> +
> +	return dom->bus_token != DOMAIN_BUS_PCI_MSI;
> +}
> +
>  #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -374,6 +374,7 @@ int pci_msi_domain_check_cap(struct irq_
>  			     struct msi_domain_info *info, struct device *dev);
>  u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
>  struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
> +bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
>  #else
>  static inline struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
>  {
> 

