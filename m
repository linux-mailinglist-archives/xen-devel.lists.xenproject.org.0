Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1E470DC4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244427.422963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoMW-0005nD-Ja; Fri, 10 Dec 2021 22:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244427.422963; Fri, 10 Dec 2021 22:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoMW-0005i8-AD; Fri, 10 Dec 2021 22:27:32 +0000
Received: by outflank-mailman (input) for mailman id 244427;
 Fri, 10 Dec 2021 22:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEX-0005LK-7I
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:17 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35f551b7-5a07-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 23:19:15 +0100 (CET)
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
X-Inumbo-ID: 35f551b7-5a07-11ec-a74f-db008197e53d
Message-ID: <20211210221814.413638645@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BJ+aqs3JuUQKsO3BctVmpLd9eqalaNFkDGZVaSssIBc=;
	b=k/FA321vEFQTINsiDiktMyGPAyhH0HOHkZCclSezrG6bfDxcSWJw0pc09HhkATrVcTQ6ri
	hnJjId+gly+fkrlDn4DuEhi3WKCGyjqiHTOcCpB52ZRAbAlk8habGeq2T/0GeNVFzgwAUX
	gBYdqBwe05ZWKm3yEV/1OxDlUqa0cigus0DWgFdbJPJ3vmGOLYue6+Yu0syUb0lGxp8xak
	nCGKDUWTtT6OhnSQVJaIIJbUTVpVhD0RKT+dIybCA5QzlH4gkNx1aOI/cQQwg1kIu/Xa68
	3n73qNCpmi67D9qbeVEYTKMdvPJ/PoUE6K25W1WCB/0MML/YeRi7L9UO6zR/BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BJ+aqs3JuUQKsO3BctVmpLd9eqalaNFkDGZVaSssIBc=;
	b=NFgEqEdfXbDDPrssrqajhRF703gPYTQxCVwQC4iBxAZurkrpMLpoBqiXkuwb3ZKXaHsc93
	9WV1M1CndmpxrRBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Cedric Le Goater <clg@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V3 20/35] platform-msi: Use msi_desc::msi_index
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:14 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

Use the common msi_index member and get rid of the pointless wrapper struct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/base/platform-msi.c                 |   10 +++++-----
 drivers/dma/qcom/hidma.c                    |    4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |    4 ++--
 drivers/mailbox/bcm-flexrm-mailbox.c        |    4 ++--
 include/linux/msi.h                         |   10 ----------
 5 files changed, 11 insertions(+), 21 deletions(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -40,7 +40,7 @@ static irq_hw_number_t platform_msi_calc
 {
 	u32 devid = desc->dev->msi.data->platform_data->devid;
 
-	return (devid << (32 - DEV_ID_SHIFT)) | desc->platform.msi_index;
+	return (devid << (32 - DEV_ID_SHIFT)) | desc->msi_index;
 }
 
 static void platform_msi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
@@ -112,8 +112,8 @@ static void platform_msi_free_descs(stru
 	struct msi_desc *desc, *tmp;
 
 	list_for_each_entry_safe(desc, tmp, dev_to_msi_list(dev), list) {
-		if (desc->platform.msi_index >= base &&
-		    desc->platform.msi_index < (base + nvec)) {
+		if (desc->msi_index >= base &&
+		    desc->msi_index < (base + nvec)) {
 			list_del(&desc->list);
 			free_msi_entry(desc);
 		}
@@ -129,7 +129,7 @@ static int platform_msi_alloc_descs_with
 	if (!list_empty(dev_to_msi_list(dev))) {
 		desc = list_last_entry(dev_to_msi_list(dev),
 				       struct msi_desc, list);
-		base = desc->platform.msi_index + 1;
+		base = desc->msi_index + 1;
 	}
 
 	for (i = 0; i < nvec; i++) {
@@ -137,7 +137,7 @@ static int platform_msi_alloc_descs_with
 		if (!desc)
 			break;
 
-		desc->platform.msi_index = base + i;
+		desc->msi_index = base + i;
 		desc->irq = virq ? virq + i : 0;
 
 		list_add_tail(&desc->list, dev_to_msi_list(dev));
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -666,7 +666,7 @@ static void hidma_write_msi_msg(struct m
 	struct device *dev = msi_desc_to_dev(desc);
 	struct hidma_dev *dmadev = dev_get_drvdata(dev);
 
-	if (!desc->platform.msi_index) {
+	if (!desc->msi_index) {
 		writel(msg->address_lo, dmadev->dev_evca + 0x118);
 		writel(msg->address_hi, dmadev->dev_evca + 0x11C);
 		writel(msg->data, dmadev->dev_evca + 0x120);
@@ -702,7 +702,7 @@ static int hidma_request_msi(struct hidm
 		return rc;
 
 	for_each_msi_entry(desc, &pdev->dev) {
-		if (!desc->platform.msi_index)
+		if (!desc->msi_index)
 			dmadev->msi_virqbase = desc->irq;
 
 		rc = devm_request_irq(&pdev->dev, desc->irq,
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3142,7 +3142,7 @@ static void arm_smmu_write_msi_msg(struc
 	phys_addr_t doorbell;
 	struct device *dev = msi_desc_to_dev(desc);
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
-	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->platform.msi_index];
+	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
 
 	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
 	doorbell &= MSI_CFG0_ADDR_MASK;
@@ -3183,7 +3183,7 @@ static void arm_smmu_setup_msis(struct a
 	}
 
 	for_each_msi_entry(desc, dev) {
-		switch (desc->platform.msi_index) {
+		switch (desc->msi_index) {
 		case EVTQ_MSI_INDEX:
 			smmu->evtq.q.irq = desc->irq;
 			break;
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -1484,7 +1484,7 @@ static void flexrm_mbox_msi_write(struct
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct flexrm_mbox *mbox = dev_get_drvdata(dev);
-	struct flexrm_ring *ring = &mbox->rings[desc->platform.msi_index];
+	struct flexrm_ring *ring = &mbox->rings[desc->msi_index];
 
 	/* Configure per-Ring MSI registers */
 	writel_relaxed(msg->address_lo, ring->regs + RING_MSI_ADDR_LS);
@@ -1609,7 +1609,7 @@ static int flexrm_mbox_probe(struct plat
 
 	/* Save alloced IRQ numbers for each ring */
 	for_each_msi_entry(desc, dev) {
-		ring = &mbox->rings[desc->platform.msi_index];
+		ring = &mbox->rings[desc->msi_index];
 		ring->irq = desc->irq;
 	}
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -107,14 +107,6 @@ struct pci_msi_desc {
 };
 
 /**
- * platform_msi_desc - Platform device specific msi descriptor data
- * @msi_index:		The index of the MSI descriptor for multi MSI
- */
-struct platform_msi_desc {
-	u16				msi_index;
-};
-
-/**
  * fsl_mc_msi_desc - FSL-MC device specific msi descriptor data
  * @msi_index:		The index of the MSI descriptor
  */
@@ -145,7 +137,6 @@ struct ti_sci_inta_msi_desc {
  *
  * @msi_index:	Index of the msi descriptor
  * @pci:	[PCI]	    PCI speficic msi descriptor data
- * @platform:	[platform]  Platform device specific msi descriptor data
  * @fsl_mc:	[fsl-mc]    FSL MC device specific msi descriptor data
  * @inta:	[INTA]	    TISCI based INTA specific msi descriptor data
  */
@@ -167,7 +158,6 @@ struct msi_desc {
 	u16				msi_index;
 	union {
 		struct pci_msi_desc		pci;
-		struct platform_msi_desc	platform;
 		struct fsl_mc_msi_desc		fsl_mc;
 		struct ti_sci_inta_msi_desc	inta;
 	};


