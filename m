Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB5A6AF9E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 22:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923184.1326830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvN7D-0003CB-PN; Thu, 20 Mar 2025 21:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923184.1326830; Thu, 20 Mar 2025 21:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvN7D-0003AB-MN; Thu, 20 Mar 2025 21:07:47 +0000
Received: by outflank-mailman (input) for mailman id 923184;
 Thu, 20 Mar 2025 21:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6xy=WH=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1tvN7C-00030s-MY
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 21:07:46 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5de2412a-05cf-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 22:07:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE7E44498F;
 Thu, 20 Mar 2025 21:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75D7C4CEDD;
 Thu, 20 Mar 2025 21:07:42 +0000 (UTC)
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
X-Inumbo-ID: 5de2412a-05cf-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742504863;
	bh=v7wcyw9rqZ7FU5j+lNAT5Amx/qAm9xGjFmzsiAtT9y4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TpAc2m+ivCJpGi6vqoswsYUiSo31PQDBe/s/ugZ0TJPY8KkGsXdqeK9VXKlNvDsCM
	 64+OA8/jbD7PeF178I0i4Q1drybW7tN60oUpIh58dTexYz8z32r6AT9tIliLJMF3Ez
	 8316CpjFPiFs8d+gJ5u9RK7lSWBDrhj10feHHmSfrfC29ddw5dkr2PGpb2LIwKF9Dx
	 4GwSlSnFYBeHGExbazA+XYo+ioM5fWTJRCttEEjAWuWKGPCym/ngjjevQqWYlek/6+
	 DUKXkGEXKxQrkQbIJQLzfB5/zucptJ3Dh3r4kGKWmabuKgmyo01PPPr6+VSMOmybYc
	 SVsXaiTL83WyA==
Date: Thu, 20 Mar 2025 16:07:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <20250320210741.GA1099701@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219092059.90850-4-roger.pau@citrix.com>

On Wed, Feb 19, 2025 at 10:20:57AM +0100, Roger Pau Monne wrote:
> Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both
> MSI and MSI-X entries globally, regardless of the IRQ chip they are using.
> Only Xen sets the pci_msi_ignore_mask when routing physical interrupts over
> event channels, to prevent PCI code from attempting to toggle the maskbit,
> as it's Xen that controls the bit.
> 
> However, the pci_msi_ignore_mask being global will affect devices that use
> MSI interrupts but are not routing those interrupts over event channels
> (not using the Xen pIRQ chip).  One example is devices behind a VMD PCI
> bridge.  In that scenario the VMD bridge configures MSI(-X) using the
> normal IRQ chip (the pIRQ one in the Xen case), and devices behind the
> bridge configure the MSI entries using indexes into the VMD bridge MSI
> table.  The VMD bridge then demultiplexes such interrupts and delivers to
> the destination device(s).  Having pci_msi_ignore_mask set in that scenario
> prevents (un)masking of MSI entries for devices behind the VMD bridge.
> 
> Move the signaling of no entry masking into the MSI domain flags, as that
> allows setting it on a per-domain basis.  Set it for the Xen MSI domain
> that uses the pIRQ chip, while leaving it unset for the rest of the
> cases.
> 
> Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> with Xen dropping usage the variable is unneeded.
> 
> This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> 
> Albeit Devices behind a VMD bridge are not known to Xen, that doesn't mean
> Linux cannot use them.  By inhibiting the usage of
> VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
> bodge devices behind a VMD bridge do work fine when use from a Linux Xen
> hardware domain.  That's the whole point of the series.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Juergen Gross <jgross@suse.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I assume you'll merge this series via the Xen tree.  Let me know if
otherwise.

> ---
> Changes since v2:
>  - Fix subject line.
> 
> Changes since v1:
>  - Fix build.
>  - Expand commit message.
> ---
>  arch/x86/pci/xen.c    |  8 ++------
>  drivers/pci/msi/msi.c | 37 +++++++++++++++++++++----------------
>  include/linux/msi.h   |  3 ++-
>  kernel/irq/msi.c      |  2 +-
>  4 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 0f2fe524f60d..b8755cde2419 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -436,7 +436,8 @@ static struct msi_domain_ops xen_pci_msi_domain_ops = {
>  };
>  
>  static struct msi_domain_info xen_pci_msi_domain_info = {
> -	.flags			= MSI_FLAG_PCI_MSIX | MSI_FLAG_FREE_MSI_DESCS | MSI_FLAG_DEV_SYSFS,
> +	.flags			= MSI_FLAG_PCI_MSIX | MSI_FLAG_FREE_MSI_DESCS |
> +				  MSI_FLAG_DEV_SYSFS | MSI_FLAG_NO_MASK,
>  	.ops			= &xen_pci_msi_domain_ops,
>  };
>  
> @@ -484,11 +485,6 @@ static __init void xen_setup_pci_msi(void)
>  	 * in allocating the native domain and never use it.
>  	 */
>  	x86_init.irqs.create_pci_msi_domain = xen_create_pci_msi_domain;
> -	/*
> -	 * With XEN PIRQ/Eventchannels in use PCI/MSI[-X] masking is solely
> -	 * controlled by the hypervisor.
> -	 */
> -	pci_msi_ignore_mask = 1;
>  }
>  
>  #else /* CONFIG_PCI_MSI */
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 2f647cac4cae..4c8c2b57b5f6 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -10,12 +10,12 @@
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/irq.h>
> +#include <linux/irqdomain.h>
>  
>  #include "../pci.h"
>  #include "msi.h"
>  
>  int pci_msi_enable = 1;
> -int pci_msi_ignore_mask;
>  
>  /**
>   * pci_msi_supported - check whether MSI may be enabled on a device
> @@ -285,6 +285,8 @@ static void pci_msi_set_enable(struct pci_dev *dev, int enable)
>  static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
>  			      struct irq_affinity_desc *masks)
>  {
> +	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
> +	const struct msi_domain_info *info = d->host_data;
>  	struct msi_desc desc;
>  	u16 control;
>  
> @@ -295,8 +297,7 @@ static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
>  	/* Lies, damned lies, and MSIs */
>  	if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
>  		control |= PCI_MSI_FLAGS_MASKBIT;
> -	/* Respect XEN's mask disabling */
> -	if (pci_msi_ignore_mask)
> +	if (info->flags & MSI_FLAG_NO_MASK)
>  		control &= ~PCI_MSI_FLAGS_MASKBIT;
>  
>  	desc.nvec_used			= nvec;
> @@ -604,12 +605,15 @@ static void __iomem *msix_map_region(struct pci_dev *dev,
>   */
>  void msix_prepare_msi_desc(struct pci_dev *dev, struct msi_desc *desc)
>  {
> +	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
> +	const struct msi_domain_info *info = d->host_data;
> +
>  	desc->nvec_used				= 1;
>  	desc->pci.msi_attrib.is_msix		= 1;
>  	desc->pci.msi_attrib.is_64		= 1;
>  	desc->pci.msi_attrib.default_irq	= dev->irq;
>  	desc->pci.mask_base			= dev->msix_base;
> -	desc->pci.msi_attrib.can_mask		= !pci_msi_ignore_mask &&
> +	desc->pci.msi_attrib.can_mask		= !(info->flags & MSI_FLAG_NO_MASK) &&
>  						  !desc->pci.msi_attrib.is_virtual;
>  
>  	if (desc->pci.msi_attrib.can_mask) {
> @@ -659,9 +663,6 @@ static void msix_mask_all(void __iomem *base, int tsize)
>  	u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
>  	int i;
>  
> -	if (pci_msi_ignore_mask)
> -		return;
> -
>  	for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
>  		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  }
> @@ -714,6 +715,8 @@ static int msix_setup_interrupts(struct pci_dev *dev, struct msix_entry *entries
>  static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
>  				int nvec, struct irq_affinity *affd)
>  {
> +	const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
> +	const struct msi_domain_info *info = d->host_data;
>  	int ret, tsize;
>  	u16 control;
>  
> @@ -744,15 +747,17 @@ static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
>  	/* Disable INTX */
>  	pci_intx_for_msi(dev, 0);
>  
> -	/*
> -	 * Ensure that all table entries are masked to prevent
> -	 * stale entries from firing in a crash kernel.
> -	 *
> -	 * Done late to deal with a broken Marvell NVME device
> -	 * which takes the MSI-X mask bits into account even
> -	 * when MSI-X is disabled, which prevents MSI delivery.
> -	 */
> -	msix_mask_all(dev->msix_base, tsize);
> +	if (!(info->flags & MSI_FLAG_NO_MASK)) {
> +		/*
> +		 * Ensure that all table entries are masked to prevent
> +		 * stale entries from firing in a crash kernel.
> +		 *
> +		 * Done late to deal with a broken Marvell NVME device
> +		 * which takes the MSI-X mask bits into account even
> +		 * when MSI-X is disabled, which prevents MSI delivery.
> +		 */
> +		msix_mask_all(dev->msix_base, tsize);
> +	}
>  	pci_msix_clear_and_set_ctrl(dev, PCI_MSIX_FLAGS_MASKALL, 0);
>  
>  	pcibios_free_irq(dev);
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index b10093c4d00e..59a421fc42bf 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -73,7 +73,6 @@ struct msi_msg {
>  	};
>  };
>  
> -extern int pci_msi_ignore_mask;
>  /* Helper functions */
>  struct msi_desc;
>  struct pci_dev;
> @@ -556,6 +555,8 @@ enum {
>  	MSI_FLAG_PCI_MSIX_ALLOC_DYN	= (1 << 20),
>  	/* PCI MSIs cannot be steered separately to CPU cores */
>  	MSI_FLAG_NO_AFFINITY		= (1 << 21),
> +	/* Inhibit usage of entry masking */
> +	MSI_FLAG_NO_MASK		= (1 << 22),
>  };
>  
>  /**
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index 396a067a8a56..7682c36cbccc 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1143,7 +1143,7 @@ static bool msi_check_reservation_mode(struct irq_domain *domain,
>  	if (!(info->flags & MSI_FLAG_MUST_REACTIVATE))
>  		return false;
>  
> -	if (IS_ENABLED(CONFIG_PCI_MSI) && pci_msi_ignore_mask)
> +	if (info->flags & MSI_FLAG_NO_MASK)
>  		return false;
>  
>  	/*
> -- 
> 2.46.0
> 

