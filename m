Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17A24CA2D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wbs-0002Ch-R4; Fri, 21 Aug 2020 02:16:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wbr-0002Bb-3m
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:16:51 +0000
X-Inumbo-ID: 723cd253-2f52-4de1-96e7-ea7c3c90bb0e
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 723cd253-2f52-4de1-96e7-ea7c3c90bb0e;
 Fri, 21 Aug 2020 02:16:45 +0000 (UTC)
Message-Id: <20200821002945.804797850@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Qu+7FKLOcLL66ZIh2kkYhCRZlvPg4izTcWMNSWqGAVg=;
 b=AbJw0WBBJU7N+y9z9LJq0rg6joNTq9fAO/5xpYZgQmoU83d473FH3juufzFqjCxaz7kD3X
 rGB8Yu7EG20FrtQed/17Um9CuVL73NdPKYQA+mySHdH23c3cly2oXdEW/RBVhUAMgnEpz1
 RdtJdEaplAHJdPK3RSUUAkwfQpaWWYDePYO8SJYHT8A3d3pudH2HB8pybVwNE9Jd99biTR
 Jhs3VB70Or9sFuZiUyr/w2+TSs+47/lRsL7txihyq9ByFmbHnWgP/jkKKFMquT0BmYMUbZ
 YPr1qCYb+GOXohIMEtjMUsFjWptoZWnswjYruPNKsZDtCWwG/JlrroTCA9L3xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Qu+7FKLOcLL66ZIh2kkYhCRZlvPg4izTcWMNSWqGAVg=;
 b=1Ral7jAZ2QZLHZbmUKB/eMrJyyHwt7NibfZJnj8yCzsnH6ODz7XOB8qvm4nSfkqDQUMzIz
 tssPLziYLTewlUDg==
Date: Fri, 21 Aug 2020 02:24:29 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Lu Baolu <baolu.lu@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Wei Liu <wei.liu@kernel.org>,
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
Subject: [patch RFC 05/38] iommu/vt-d: Consolidate irq domain getter
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="iommu-vt-d--Consolidate-irq-domain-getter.patch"
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

The irq domain request mode is now indicated in irq_alloc_info::type.

Consolidate the two getter functions into one.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/irq_remapping.c |   67 ++++++++++++------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -204,35 +204,40 @@ static int modify_irte(struct irq_2_iomm
 	return rc;
 }
 
-static struct intel_iommu *map_hpet_to_ir(u8 hpet_id)
+static struct irq_domain *map_hpet_to_ir(u8 hpet_id)
 {
 	int i;
 
-	for (i = 0; i < MAX_HPET_TBS; i++)
+	for (i = 0; i < MAX_HPET_TBS; i++) {
 		if (ir_hpet[i].id == hpet_id && ir_hpet[i].iommu)
-			return ir_hpet[i].iommu;
+			return ir_hpet[i].iommu->ir_domain;
+	}
 	return NULL;
 }
 
-static struct intel_iommu *map_ioapic_to_ir(int apic)
+static struct intel_iommu *map_ioapic_to_iommu(int apic)
 {
 	int i;
 
-	for (i = 0; i < MAX_IO_APICS; i++)
+	for (i = 0; i < MAX_IO_APICS; i++) {
 		if (ir_ioapic[i].id == apic && ir_ioapic[i].iommu)
 			return ir_ioapic[i].iommu;
+	}
 	return NULL;
 }
 
-static struct intel_iommu *map_dev_to_ir(struct pci_dev *dev)
+static struct irq_domain *map_ioapic_to_ir(int apic)
 {
-	struct dmar_drhd_unit *drhd;
+	struct intel_iommu *iommu = map_ioapic_to_iommu(apic);
 
-	drhd = dmar_find_matched_drhd_unit(dev);
-	if (!drhd)
-		return NULL;
+	return iommu ? iommu->ir_domain : NULL;
+}
+
+static struct irq_domain *map_dev_to_ir(struct pci_dev *dev)
+{
+	struct dmar_drhd_unit *drhd = dmar_find_matched_drhd_unit(dev);
 
-	return drhd->iommu;
+	return drhd ? drhd->iommu->ir_msi_domain : NULL;
 }
 
 static int clear_entries(struct irq_2_iommu *irq_iommu)
@@ -996,7 +1001,7 @@ static int __init parse_ioapics_under_ir
 
 	for (ioapic_idx = 0; ioapic_idx < nr_ioapics; ioapic_idx++) {
 		int ioapic_id = mpc_ioapic_id(ioapic_idx);
-		if (!map_ioapic_to_ir(ioapic_id)) {
+		if (!map_ioapic_to_iommu(ioapic_id)) {
 			pr_err(FW_BUG "ioapic %d has no mapping iommu, "
 			       "interrupt remapping will be disabled\n",
 			       ioapic_id);
@@ -1101,47 +1106,23 @@ static void prepare_irte(struct irte *ir
 	irte->redir_hint = 1;
 }
 
-static struct irq_domain *intel_get_ir_irq_domain(struct irq_alloc_info *info)
+static struct irq_domain *intel_get_irq_domain(struct irq_alloc_info *info)
 {
-	struct intel_iommu *iommu = NULL;
-
 	if (!info)
 		return NULL;
 
 	switch (info->type) {
 	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
-		iommu = map_ioapic_to_ir(info->ioapic_id);
-		break;
+		return map_ioapic_to_ir(info->ioapic_id);
 	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
-		iommu = map_hpet_to_ir(info->hpet_id);
-		break;
-	default:
-		BUG_ON(1);
-		break;
-	}
-
-	return iommu ? iommu->ir_domain : NULL;
-}
-
-static struct irq_domain *intel_get_irq_domain(struct irq_alloc_info *info)
-{
-	struct intel_iommu *iommu;
-
-	if (!info)
-		return NULL;
-
-	switch (info->type) {
+		return map_hpet_to_ir(info->hpet_id);
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		iommu = map_dev_to_ir(info->msi_dev);
-		if (iommu)
-			return iommu->ir_msi_domain;
-		break;
+		return map_dev_to_ir(info->msi_dev);
 	default:
-		break;
+		WARN_ON_ONCE(1);
+		return NULL;
 	}
-
-	return NULL;
 }
 
 struct irq_remap_ops intel_irq_remap_ops = {
@@ -1150,7 +1131,7 @@ struct irq_remap_ops intel_irq_remap_ops
 	.disable		= disable_irq_remapping,
 	.reenable		= reenable_irq_remapping,
 	.enable_faulting	= enable_drhd_fault_handling,
-	.get_ir_irq_domain	= intel_get_ir_irq_domain,
+	.get_ir_irq_domain	= intel_get_irq_domain,
 	.get_irq_domain		= intel_get_irq_domain,
 };
 


