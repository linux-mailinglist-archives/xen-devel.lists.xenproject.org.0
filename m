Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB924CA3B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wbx-0002EG-RP; Fri, 21 Aug 2020 02:16:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wbw-0002BQ-TE
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:16:56 +0000
X-Inumbo-ID: cdd2cbe3-6b76-43d4-bcd0-fe92985ebc5f
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdd2cbe3-6b76-43d4-bcd0-fe92985ebc5f;
 Fri, 21 Aug 2020 02:16:42 +0000 (UTC)
Message-Id: <20200821002945.595723096@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=aZajyY2bgQUgD6w0Oy2gZDy5W+Nr6UhttbpOe6imkbA=;
 b=z5Zw6T7F6WO9tHaOZCWjbBUxhqTz80VOEZ80VDKul4uGQaropOgQb6BcKPfj/9Wlvj5p+r
 OP36RCtabudX4KoYj9f608pdj9pLU9TRu1Q3jtMOtO2cYjb9lxPGXC6A8Lyaz2v72ig0o8
 84sWINgu7TugbF6XX7w85aAfwgzIeXnvMNqvoAI/8Eq1C3pkfYf6UrIPEz0UbebgaIlkom
 eLiT4D2PzUU0fqRqXin5XBuzprxYDvLYrh1l2/kyVxDcs0G9GpxWgzhl5sC/gcvvvzfgGq
 tBUculjkto8xPUOMY648x8PhGxobEoviHKsPdc7al8ctqVpYclUAG75TwMSj7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=aZajyY2bgQUgD6w0Oy2gZDy5W+Nr6UhttbpOe6imkbA=;
 b=2vc2HTalu8tDHI7RloIWqmjANph7va74Zeuk1d1Pk4AqNK9Vj801oDy0Rg8AK4F2IiwyPc
 a3lZ5AHBdtqfsYBg==
Date: Fri, 21 Aug 2020 02:24:27 +0200
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
 Jonathan Derrick <jonathan.derrick@intel.com>,
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
Subject: [patch RFC 03/38] x86/irq: Rename X86_IRQ_ALLOC_TYPE_MSI* to reflect
 PCI dependency
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename="x86-irq--Rename-X86_IRQ_ALLOC_TYPE_MSI"
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

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org
---
 arch/x86/include/asm/hw_irq.h       |    4 ++--
 arch/x86/kernel/apic/msi.c          |    6 +++---
 drivers/iommu/amd/iommu.c           |   24 ++++++++++++------------
 drivers/iommu/intel/irq_remapping.c |   18 +++++++++---------
 4 files changed, 26 insertions(+), 26 deletions(-)

--- a/arch/x86/include/asm/hw_irq.h
+++ b/arch/x86/include/asm/hw_irq.h
@@ -36,8 +36,8 @@ struct msi_desc;
 enum irq_alloc_type {
 	X86_IRQ_ALLOC_TYPE_IOAPIC = 1,
 	X86_IRQ_ALLOC_TYPE_HPET,
-	X86_IRQ_ALLOC_TYPE_MSI,
-	X86_IRQ_ALLOC_TYPE_MSIX,
+	X86_IRQ_ALLOC_TYPE_PCI_MSI,
+	X86_IRQ_ALLOC_TYPE_PCI_MSIX,
 	X86_IRQ_ALLOC_TYPE_DMAR,
 	X86_IRQ_ALLOC_TYPE_UV,
 };
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -188,7 +188,7 @@ int native_setup_msi_irqs(struct pci_dev
 	struct irq_alloc_info info;
 
 	init_irq_alloc_info(&info, NULL);
-	info.type = X86_IRQ_ALLOC_TYPE_MSI;
+	info.type = X86_IRQ_ALLOC_TYPE_PCI_MSI;
 	info.msi_dev = dev;
 
 	domain = irq_remapping_get_irq_domain(&info);
@@ -220,9 +220,9 @@ int pci_msi_prepare(struct irq_domain *d
 	init_irq_alloc_info(arg, NULL);
 	arg->msi_dev = pdev;
 	if (desc->msi_attrib.is_msix) {
-		arg->type = X86_IRQ_ALLOC_TYPE_MSIX;
+		arg->type = X86_IRQ_ALLOC_TYPE_PCI_MSIX;
 	} else {
-		arg->type = X86_IRQ_ALLOC_TYPE_MSI;
+		arg->type = X86_IRQ_ALLOC_TYPE_PCI_MSI;
 		arg->flags |= X86_IRQ_ALLOC_CONTIGUOUS_VECTORS;
 	}
 
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3514,8 +3514,8 @@ static int get_devid(struct irq_alloc_in
 	case X86_IRQ_ALLOC_TYPE_HPET:
 		devid     = get_hpet_devid(info->hpet_id);
 		break;
-	case X86_IRQ_ALLOC_TYPE_MSI:
-	case X86_IRQ_ALLOC_TYPE_MSIX:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		devid = get_device_id(&info->msi_dev->dev);
 		break;
 	default:
@@ -3553,8 +3553,8 @@ static struct irq_domain *get_irq_domain
 		return NULL;
 
 	switch (info->type) {
-	case X86_IRQ_ALLOC_TYPE_MSI:
-	case X86_IRQ_ALLOC_TYPE_MSIX:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		devid = get_device_id(&info->msi_dev->dev);
 		if (devid < 0)
 			return NULL;
@@ -3615,8 +3615,8 @@ static void irq_remapping_prepare_irte(s
 		break;
 
 	case X86_IRQ_ALLOC_TYPE_HPET:
-	case X86_IRQ_ALLOC_TYPE_MSI:
-	case X86_IRQ_ALLOC_TYPE_MSIX:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		msg->address_hi = MSI_ADDR_BASE_HI;
 		msg->address_lo = MSI_ADDR_BASE_LO;
 		msg->data = irte_info->index;
@@ -3660,15 +3660,15 @@ static int irq_remapping_alloc(struct ir
 
 	if (!info)
 		return -EINVAL;
-	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_MSI &&
-	    info->type != X86_IRQ_ALLOC_TYPE_MSIX)
+	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
+	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
 		return -EINVAL;
 
 	/*
 	 * With IRQ remapping enabled, don't need contiguous CPU vectors
 	 * to support multiple MSI interrupts.
 	 */
-	if (info->type == X86_IRQ_ALLOC_TYPE_MSI)
+	if (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI)
 		info->flags &= ~X86_IRQ_ALLOC_CONTIGUOUS_VECTORS;
 
 	devid = get_devid(info);
@@ -3700,9 +3700,9 @@ static int irq_remapping_alloc(struct ir
 		} else {
 			index = -ENOMEM;
 		}
-	} else if (info->type == X86_IRQ_ALLOC_TYPE_MSI ||
-		   info->type == X86_IRQ_ALLOC_TYPE_MSIX) {
-		bool align = (info->type == X86_IRQ_ALLOC_TYPE_MSI);
+	} else if (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI ||
+		   info->type == X86_IRQ_ALLOC_TYPE_PCI_MSIX) {
+		bool align = (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI);
 
 		index = alloc_irq_index(devid, nr_irqs, align, info->msi_dev);
 	} else {
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1115,8 +1115,8 @@ static struct irq_domain *intel_get_ir_i
 	case X86_IRQ_ALLOC_TYPE_HPET:
 		iommu = map_hpet_to_ir(info->hpet_id);
 		break;
-	case X86_IRQ_ALLOC_TYPE_MSI:
-	case X86_IRQ_ALLOC_TYPE_MSIX:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		iommu = map_dev_to_ir(info->msi_dev);
 		break;
 	default:
@@ -1135,8 +1135,8 @@ static struct irq_domain *intel_get_irq_
 		return NULL;
 
 	switch (info->type) {
-	case X86_IRQ_ALLOC_TYPE_MSI:
-	case X86_IRQ_ALLOC_TYPE_MSIX:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		iommu = map_dev_to_ir(info->msi_dev);
 		if (iommu)
 			return iommu->ir_msi_domain;
@@ -1306,8 +1306,8 @@ static void intel_irq_remapping_prepare_
 		break;
 
 	case X86_IRQ_ALLOC_TYPE_HPET:
-	case X86_IRQ_ALLOC_TYPE_MSI:
-	case X86_IRQ_ALLOC_TYPE_MSIX:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
 		if (info->type == X86_IRQ_ALLOC_TYPE_HPET)
 			set_hpet_sid(irte, info->hpet_id);
 		else
@@ -1362,15 +1362,15 @@ static int intel_irq_remapping_alloc(str
 
 	if (!info || !iommu)
 		return -EINVAL;
-	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_MSI &&
-	    info->type != X86_IRQ_ALLOC_TYPE_MSIX)
+	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
+	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
 		return -EINVAL;
 
 	/*
 	 * With IRQ remapping enabled, don't need contiguous CPU vectors
 	 * to support multiple MSI interrupts.
 	 */
-	if (info->type == X86_IRQ_ALLOC_TYPE_MSI)
+	if (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI)
 		info->flags &= ~X86_IRQ_ALLOC_CONTIGUOUS_VECTORS;
 
 	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);


