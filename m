Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B822E252D67
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu7X-0008Vq-JL; Wed, 26 Aug 2020 12:01:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7W-000821-6b
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:38 +0000
X-Inumbo-ID: 3dc09510-3310-4632-b7d6-bdec49ed1e77
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dc09510-3310-4632-b7d6-bdec49ed1e77;
 Wed, 26 Aug 2020 12:01:08 +0000 (UTC)
Message-Id: <20200826112331.634777249@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=uwvQNHvaNg/Fdy2Gl3KxXB78ZUpQmA3m1yJB61BHx4U=;
 b=cZkMF/YWULZ4Uotab3k3IXi4r4hFFnpiFtt6iNZpjY2glC7/xkFk3cB9PgaOU/8JGRxOjj
 S7I9iF8wESVzg+xDMZUKVy8Vbe6zq6LwxfCfOp+LsiBpSu672pJYhA6gZdh8IxY2xC6rKX
 3u6zI+8BnB3zMleeiIPXmH/Awu4yF5kC4ReV65SghuOIimGB2BYzAAK9x10MHqSwRaGKkj
 LB3rdDrHqSkWruYzPDa2OvgoiLXf78uxrzp0kxWXqNqww4EKoeJth428QKttN0aAkXjd92
 XLLJA91DUCN7cD4uJ1Gh1vWIc9GqgAIi7jZWF3Ewak/+mo/C3yFdrghRZhkL4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=uwvQNHvaNg/Fdy2Gl3KxXB78ZUpQmA3m1yJB61BHx4U=;
 b=c+I8epgL/HK82KFtaXiIHgczMaYB4MS5Q6XB/264Q9Abn3goTn6OI8aEnTusT/a/dZRKM7
 fW0BwXcA8NuxczDQ==
Date: Wed, 26 Aug 2020 13:16:38 +0200
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
Subject: [patch V2 10/46] iommu/amd: Consolidate irq domain getter
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

The irq domain request mode is now indicated in irq_alloc_info::type.

Consolidate the two getter functions into one.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 drivers/iommu/amd/iommu.c |   65 ++++++++++++++--------------------------------
 1 file changed, 21 insertions(+), 44 deletions(-)

--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3505,77 +3505,54 @@ static void irte_ga_clear_allocated(stru
 
 static int get_devid(struct irq_alloc_info *info)
 {
-	int devid = -1;
-
 	switch (info->type) {
 	case X86_IRQ_ALLOC_TYPE_IOAPIC:
-		devid     = get_ioapic_devid(info->ioapic_id);
-		break;
+	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
+		return get_ioapic_devid(info->ioapic_id);
 	case X86_IRQ_ALLOC_TYPE_HPET:
-		devid     = get_hpet_devid(info->hpet_id);
-		break;
+	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
+		return get_hpet_devid(info->hpet_id);
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		devid = get_device_id(&info->msi_dev->dev);
-		break;
+		return get_device_id(&info->msi_dev->dev);
 	default:
-		BUG_ON(1);
-		break;
+		WARN_ON_ONCE(1);
+		return -1;
 	}
-
-	return devid;
 }
 
-static struct irq_domain *get_ir_irq_domain(struct irq_alloc_info *info)
+static struct irq_domain *get_irq_domain_for_devid(struct irq_alloc_info *info,
+						   int devid)
 {
-	struct amd_iommu *iommu;
-	int devid;
+	struct amd_iommu *iommu = amd_iommu_rlookup_table[devid];
 
-	if (!info)
+	if (!iommu)
 		return NULL;
 
 	switch (info->type) {
 	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
 	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
-		break;
+		return iommu->ir_domain;
+	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
+	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
+		return iommu->msi_domain;
 	default:
+		WARN_ON_ONCE(1);
 		return NULL;
 	}
-
-	devid = get_devid(info);
-	if (devid >= 0) {
-		iommu = amd_iommu_rlookup_table[devid];
-		if (iommu)
-			return iommu->ir_domain;
-	}
-
-	return NULL;
 }
 
 static struct irq_domain *get_irq_domain(struct irq_alloc_info *info)
 {
-	struct amd_iommu *iommu;
 	int devid;
 
 	if (!info)
 		return NULL;
 
-	switch (info->type) {
-	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
-	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		devid = get_device_id(&info->msi_dev->dev);
-		if (devid < 0)
-			return NULL;
-
-		iommu = amd_iommu_rlookup_table[devid];
-		if (iommu)
-			return iommu->msi_domain;
-		break;
-	default:
-		break;
-	}
-
-	return NULL;
+	devid = get_devid(info);
+	if (devid < 0)
+		return NULL;
+	return get_irq_domain_for_devid(info, devid);
 }
 
 struct irq_remap_ops amd_iommu_irq_ops = {
@@ -3584,7 +3561,7 @@ struct irq_remap_ops amd_iommu_irq_ops =
 	.disable		= amd_iommu_disable,
 	.reenable		= amd_iommu_reenable,
 	.enable_faulting	= amd_iommu_enable_faulting,
-	.get_ir_irq_domain	= get_ir_irq_domain,
+	.get_ir_irq_domain	= get_irq_domain,
 	.get_irq_domain		= get_irq_domain,
 };
 



