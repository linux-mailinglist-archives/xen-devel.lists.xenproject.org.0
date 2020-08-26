Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F2252DD8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:06:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAuCO-0001uX-5R; Wed, 26 Aug 2020 12:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7v-000821-7s
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:02:03 +0000
X-Inumbo-ID: 1f6e8fec-3dc5-47b1-83ae-07b0ebb34895
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f6e8fec-3dc5-47b1-83ae-07b0ebb34895;
 Wed, 26 Aug 2020 12:01:18 +0000 (UTC)
Message-Id: <20200826112332.466405395@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=89XPEkckD89IfTs8VAAqcd4o41MEAYm/sOozj0geDOg=;
 b=HMD/wlLhTHMvFXL2bx4mCcQOKT+ixvGwF2qI93R+aoOqNq4it4vzsMoz5TFAT7HNuF/Q4Z
 ozbVP2cd0vtreGNQBzgsoW1kNQ4wK+hDkAuAwoNW9u9v0biQTJ7aVyQ+Qw4anhYj1c/4ib
 7IG6A50E1d9ZWMkPKpyKbK/N7i+EUJdoHXnsOIIOp6Q9FAwFxEoVLdoLijAMICm+WCsVSS
 +6m3acw50POm3JxDYeR2K9ABDzEnQswCh5pojcSKtzO7mJ0KGRVuSOECe1oq0sl40ZZdjD
 YCeKdogswY1hLq7REUddMY+PV5cNlemDrTlZHi2lBVc9Sjvk0HxplhjiQuzgJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=89XPEkckD89IfTs8VAAqcd4o41MEAYm/sOozj0geDOg=;
 b=qa93UyHf7KLkUY+QElTTgU9c5nhPppap1YZaHP//Y6Wmo7i3Cm3G1wtgDIG8qqOivwL85Z
 Zn63dlzuUYvLdsBA==
Date: Wed, 26 Aug 2020 13:16:46 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch V2 18/46] x86/msi: Consolidate MSI allocation
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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

From: Thomas Gleixner <tglx@linutronix.de>

Convert the interrupt remap drivers to retrieve the pci device from the msi
descriptor and use info::hwirq.

This is the first step to prepare x86 for using the generic MSI domain ops.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/x86/include/asm/hw_irq.h       |    8 --------
 arch/x86/kernel/apic/msi.c          |    7 +++----
 drivers/iommu/amd/iommu.c           |    5 +++--
 drivers/iommu/intel/irq_remapping.c |    4 ++--
 drivers/pci/controller/pci-hyperv.c |    2 +-
 5 files changed, 9 insertions(+), 17 deletions(-)

--- a/arch/x86/include/asm/hw_irq.h
+++ b/arch/x86/include/asm/hw_irq.h
@@ -85,14 +85,6 @@ struct irq_alloc_info {
 	union {
 		struct ioapic_alloc_info	ioapic;
 		struct uv_alloc_info		uv;
-
-		int		unused;
-#ifdef	CONFIG_PCI_MSI
-		struct {
-			struct pci_dev	*msi_dev;
-			irq_hw_number_t	msi_hwirq;
-		};
-#endif
 	};
 };
 
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -189,7 +189,6 @@ int native_setup_msi_irqs(struct pci_dev
 
 	init_irq_alloc_info(&info, NULL);
 	info.type = X86_IRQ_ALLOC_TYPE_PCI_MSI;
-	info.msi_dev = dev;
 
 	domain = irq_remapping_get_irq_domain(&info);
 	if (domain == NULL)
@@ -208,7 +207,7 @@ void native_teardown_msi_irq(unsigned in
 static irq_hw_number_t pci_msi_get_hwirq(struct msi_domain_info *info,
 					 msi_alloc_info_t *arg)
 {
-	return arg->msi_hwirq;
+	return arg->hwirq;
 }
 
 int pci_msi_prepare(struct irq_domain *domain, struct device *dev, int nvec,
@@ -218,7 +217,6 @@ int pci_msi_prepare(struct irq_domain *d
 	struct msi_desc *desc = first_pci_msi_entry(pdev);
 
 	init_irq_alloc_info(arg, NULL);
-	arg->msi_dev = pdev;
 	if (desc->msi_attrib.is_msix) {
 		arg->type = X86_IRQ_ALLOC_TYPE_PCI_MSIX;
 	} else {
@@ -232,7 +230,8 @@ EXPORT_SYMBOL_GPL(pci_msi_prepare);
 
 void pci_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
 {
-	arg->msi_hwirq = pci_msi_domain_calc_hwirq(desc);
+	arg->desc = desc;
+	arg->hwirq = pci_msi_domain_calc_hwirq(desc);
 }
 EXPORT_SYMBOL_GPL(pci_msi_set_desc);
 
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3514,7 +3514,7 @@ static int get_devid(struct irq_alloc_in
 		return get_hpet_devid(info->devid);
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		return get_device_id(&info->msi_dev->dev);
+		return get_device_id(msi_desc_to_dev(info->desc));
 	default:
 		WARN_ON_ONCE(1);
 		return -1;
@@ -3688,7 +3688,8 @@ static int irq_remapping_alloc(struct ir
 		   info->type == X86_IRQ_ALLOC_TYPE_PCI_MSIX) {
 		bool align = (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI);
 
-		index = alloc_irq_index(devid, nr_irqs, align, info->msi_dev);
+		index = alloc_irq_index(devid, nr_irqs, align,
+					msi_desc_to_pci_dev(info->desc));
 	} else {
 		index = alloc_irq_index(devid, nr_irqs, false, NULL);
 	}
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1118,7 +1118,7 @@ static struct irq_domain *intel_get_irq_
 		return map_hpet_to_ir(info->devid);
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		return map_dev_to_ir(info->msi_dev);
+		return map_dev_to_ir(msi_desc_to_pci_dev(info->desc));
 	default:
 		WARN_ON_ONCE(1);
 		return NULL;
@@ -1287,7 +1287,7 @@ static void intel_irq_remapping_prepare_
 		if (info->type == X86_IRQ_ALLOC_TYPE_HPET)
 			set_hpet_sid(irte, info->devid);
 		else
-			set_msi_sid(irte, info->msi_dev);
+			set_msi_sid(irte, msi_desc_to_pci_dev(info->desc));
 
 		msg->address_hi = MSI_ADDR_BASE_HI;
 		msg->data = sub_handle;
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -1534,7 +1534,7 @@ static struct irq_chip hv_msi_irq_chip =
 static irq_hw_number_t hv_msi_domain_ops_get_hwirq(struct msi_domain_info *info,
 						   msi_alloc_info_t *arg)
 {
-	return arg->msi_hwirq;
+	return arg->hwirq;
 }
 
 static struct msi_domain_ops hv_msi_ops = {



