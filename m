Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B1252193
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 22:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAfEQ-0000ig-OQ; Tue, 25 Aug 2020 20:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQdE=CD=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1kAfEP-0000iU-5l
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 20:07:45 +0000
X-Inumbo-ID: 193d7d35-9c84-4cce-8b97-42fe050d7b41
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 193d7d35-9c84-4cce-8b97-42fe050d7b41;
 Tue, 25 Aug 2020 20:07:44 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C17D20738;
 Tue, 25 Aug 2020 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598386063;
 bh=YaQswRXI+GSH/he6lrf1zXvIORSUoUcZRaf2KaM0aQg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=j4zLeGo92A7idyLdF9wx1padjR1BkvijWirrN+DxgEJ80bcdC8FpwVMDmsikynYYX
 RflhFTwDDlLvi1z9ipQILUK45Xl/2KD6J8/5T+6i73r3Mswi/bzbfgcBEU8cEMdf1a
 EPw7h59JF5ItUvWJik/+iH27NdtyTyyC3QhM2pvw=
Date: Tue, 25 Aug 2020 15:07:42 -0500
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
Subject: Re: [patch RFC 30/38] PCI/MSI: Allow to disable arch fallbacks
Message-ID: <20200825200742.GA1924669@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821002948.285988229@linutronix.de>
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

On Fri, Aug 21, 2020 at 02:24:54AM +0200, Thomas Gleixner wrote:
> If an architecture does not require the MSI setup/teardown fallback
> functions, then allow them to be replaced by stub functions which emit a
> warning.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Question/comment below.

> ---
>  drivers/pci/Kconfig |    3 +++
>  drivers/pci/msi.c   |    3 ++-
>  include/linux/msi.h |   31 ++++++++++++++++++++++++++-----
>  3 files changed, 31 insertions(+), 6 deletions(-)
> 
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -56,6 +56,9 @@ config PCI_MSI_IRQ_DOMAIN
>  	depends on PCI_MSI
>  	select GENERIC_MSI_IRQ_DOMAIN
>  
> +config PCI_MSI_DISABLE_ARCH_FALLBACKS
> +	bool
> +
>  config PCI_QUIRKS
>  	default y
>  	bool "Enable PCI quirk workarounds" if EXPERT
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -58,8 +58,8 @@ static void pci_msi_teardown_msi_irqs(st
>  #define pci_msi_teardown_msi_irqs	arch_teardown_msi_irqs
>  #endif
>  
> +#ifndef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS
>  /* Arch hooks */
> -
>  int __weak arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc)
>  {
>  	struct msi_controller *chip = dev->bus->msi;
> @@ -132,6 +132,7 @@ void __weak arch_teardown_msi_irqs(struc
>  {
>  	return default_teardown_msi_irqs(dev);
>  }
> +#endif /* !CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS */
>  
>  static void default_restore_msi_irq(struct pci_dev *dev, int irq)
>  {
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -193,17 +193,38 @@ void pci_msi_mask_irq(struct irq_data *d
>  void pci_msi_unmask_irq(struct irq_data *data);
>  
>  /*
> - * The arch hooks to setup up msi irqs. Those functions are
> - * implemented as weak symbols so that they /can/ be overriden by
> - * architecture specific code if needed.
> + * The arch hooks to setup up msi irqs. Default functions are implemented
> + * as weak symbols so that they /can/ be overriden by architecture specific
> + * code if needed.
> + *
> + * They can be replaced by stubs with warnings via
> + * CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS when the architecture fully
> + * utilizes direct irqdomain based setup.

Do you expect *all* arches to eventually use direct irqdomain setup?
And in that case, to remove the config option?

If not, it seems like it'd be nicer to have the burden on the arches
that need/want to use arch-specific code instead of on the arches that
do things generically.

>   */
> +#ifndef CONFIG_PCI_MSI_DISABLE_ARCH_FALLBACKS
>  int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc);
>  void arch_teardown_msi_irq(unsigned int irq);
>  int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
>  void arch_teardown_msi_irqs(struct pci_dev *dev);
> -void arch_restore_msi_irqs(struct pci_dev *dev);
> -
>  void default_teardown_msi_irqs(struct pci_dev *dev);
> +#else
> +static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
> +{
> +	WARN_ON_ONCE(1);
> +	return -ENODEV;
> +}
> +
> +static inline void arch_teardown_msi_irqs(struct pci_dev *dev)
> +{
> +	WARN_ON_ONCE(1);
> +}
> +#endif
> +
> +/*
> + * The restore hooks are still available as they are useful even
> + * for fully irq domain based setups. Courtesy to XEN/X86.
> + */
> +void arch_restore_msi_irqs(struct pci_dev *dev);
>  void default_restore_msi_irqs(struct pci_dev *dev);
>  
>  struct msi_controller {
> 

