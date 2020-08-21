Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D040224CA38
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:17:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wbn-0002Bg-3i; Fri, 21 Aug 2020 02:16:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wbm-0002Bb-6I
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:16:46 +0000
X-Inumbo-ID: ae2affa3-6c43-4e51-9de2-a225919c9871
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae2affa3-6c43-4e51-9de2-a225919c9871;
 Fri, 21 Aug 2020 02:16:44 +0000 (UTC)
Message-Id: <20200821002945.695825784@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=n+9JzjgCW829xt57cBjdIpc/3IF3JudgknsVK2IiGtk=;
 b=hduGjMZbM0/qwLquCj86fWVEcSBPc0Iv1xA1asxyvWI+3WaJk/FZv3obiS9pdKi2N4Xi55
 g2B24e5RBCG7WKFAQnorS3FWxwuVXn4z6S30wQ9GCVD8rtp+77IWCQCGVnhsf3znLjLhSM
 aQmZw2lG8elAmC//IGUjNVWAb+xaLL0KKz9IZ14ZS5Czuz7wC08nu5Y+pBKinVQ49JiyCU
 CXbMGhzaoeBIvlaaHMr23nvutvRUEOUuFrM649Lo5JGWcrMEOw972tIYLaoecwN/uLHyl2
 R6g+Wh1VCvbaQYIhXKJhJnK8aiSLIDvD0enema4nF0KLI5Yj7n1BELeKwzCgbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=n+9JzjgCW829xt57cBjdIpc/3IF3JudgknsVK2IiGtk=;
 b=54vZUbSCVLbmLl/kEHzdwLB30JzHXmmLwe5GfkEeAMeKUbcsXnsiboZQzVlzf/vQeQ28JW
 WkKbSmHVLKTXoHDw==
Date: Fri, 21 Aug 2020 02:24:28 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-hyperv@vger.kernel.org, iommu@lists.linux-foundation.org,
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
Subject: [patch RFC 04/38] x86/irq: Add allocation type for parent domain
 retrieval
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="x86-irq--Add-allocation-flag-for-domain-retrieval.patch"
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

irq_remapping_ir_irq_domain() is used to retrieve the remapping parent
domain for an allocation type. irq_remapping_irq_domain() is for retrieving
the actual device domain for allocating interrupts for a device.

The two functions are similar and can be unified by using explicit modes
for parent irq domain retrieval.

Add X86_IRQ_ALLOC_TYPE_IOAPIC/HPET_GET_PARENT and use it in the iommu
implementations. Drop the parent domain retrieval for PCI_MSI/X as that is
unused.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: x86@kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Jon Derrick <jonathan.derrick@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 arch/x86/include/asm/hw_irq.h       |    2 ++
 arch/x86/kernel/apic/io_apic.c      |    2 +-
 arch/x86/kernel/apic/msi.c          |    2 +-
 drivers/iommu/amd/iommu.c           |    8 ++++++++
 drivers/iommu/hyperv-iommu.c        |    2 +-
 drivers/iommu/intel/irq_remapping.c |    8 ++------
 6 files changed, 15 insertions(+), 9 deletions(-)

--- a/arch/x86/include/asm/hw_irq.h
+++ b/arch/x86/include/asm/hw_irq.h
@@ -40,6 +40,8 @@ enum irq_alloc_type {
 	X86_IRQ_ALLOC_TYPE_PCI_MSIX,
 	X86_IRQ_ALLOC_TYPE_DMAR,
 	X86_IRQ_ALLOC_TYPE_UV,
+	X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT,
+	X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT,
 };
 
 struct irq_alloc_info {
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2296,7 +2296,7 @@ static int mp_irqdomain_create(int ioapi
 		return 0;
 
 	init_irq_alloc_info(&info, NULL);
-	info.type = X86_IRQ_ALLOC_TYPE_IOAPIC;
+	info.type = X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT;
 	info.ioapic_id = mpc_ioapic_id(ioapic);
 	parent = irq_remapping_get_ir_irq_domain(&info);
 	if (!parent)
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -476,7 +476,7 @@ struct irq_domain *hpet_create_irq_domai
 	domain_info->data = (void *)(long)hpet_id;
 
 	init_irq_alloc_info(&info, NULL);
-	info.type = X86_IRQ_ALLOC_TYPE_HPET;
+	info.type = X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT;
 	info.hpet_id = hpet_id;
 	parent = irq_remapping_get_ir_irq_domain(&info);
 	if (parent == NULL)
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3534,6 +3534,14 @@ static struct irq_domain *get_ir_irq_dom
 	if (!info)
 		return NULL;
 
+	switch (info->type) {
+	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
+	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
+		break;
+	default:
+		return NULL;
+	}
+
 	devid = get_devid(info);
 	if (devid >= 0) {
 		iommu = amd_iommu_rlookup_table[devid];
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -184,7 +184,7 @@ static int __init hyperv_enable_irq_rema
 
 static struct irq_domain *hyperv_get_ir_irq_domain(struct irq_alloc_info *info)
 {
-	if (info->type == X86_IRQ_ALLOC_TYPE_IOAPIC)
+	if (info->type == X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT)
 		return ioapic_ir_domain;
 	else
 		return NULL;
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1109,16 +1109,12 @@ static struct irq_domain *intel_get_ir_i
 		return NULL;
 
 	switch (info->type) {
-	case X86_IRQ_ALLOC_TYPE_IOAPIC:
+	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
 		iommu = map_ioapic_to_ir(info->ioapic_id);
 		break;
-	case X86_IRQ_ALLOC_TYPE_HPET:
+	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
 		iommu = map_hpet_to_ir(info->hpet_id);
 		break;
-	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
-	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		iommu = map_dev_to_ir(info->msi_dev);
-		break;
 	default:
 		BUG_ON(1);
 		break;


