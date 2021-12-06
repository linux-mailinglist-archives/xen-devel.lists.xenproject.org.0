Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A4646AD16
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240055.416335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmC-0003Oz-9l; Mon, 06 Dec 2021 22:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240055.416335; Mon, 06 Dec 2021 22:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmB-0003Fk-Vg; Mon, 06 Dec 2021 22:48:03 +0000
Received: by outflank-mailman (input) for mailman id 240055;
 Mon, 06 Dec 2021 22:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMeD-0004dp-1f
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aec87b3-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:48 +0100 (CET)
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
X-Inumbo-ID: 6aec87b3-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210439.400844376@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lGS+IkXmE+9GAo5xc0vZ9k4XzYRWim7AXuJ3Yf4prmo=;
	b=1rdh0uBIjRFPVJb0NRyQpQptlV/IqltLenr45mOonGb1VHJ/Kb/bZxEHCMdNY6i8Rsl3lU
	3LeqeuR5+/TelAqjf8r4Ks6XK/KIFolBHpOGsdFI5iWQZCh4EyUbbBQRP/UsEqSSd34PqQ
	CGWYXx1l3Ha6SI6sGKdzCI+pjUM3G9v435Md6e0/lLQECkoMsR/nFZ+ZQi1wRTh82GNKIa
	VkCD8Ru4e1/yyGWEO+6kuMDv7hVYoHw87sh+R9wOR482T4v06q6RFEL7LzlekMOKFNQ0af
	GGFaLu61fEzOgmHosPLGbKXOzPYbBO79MG2SX62W7byRtHXl19o2mfrKF/oTmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=lGS+IkXmE+9GAo5xc0vZ9k4XzYRWim7AXuJ3Yf4prmo=;
	b=ePEtkTTGN09IiG05GytAFMd60ZI7x21kGECcBweiIwUP3OufMZOiTYfQXaXuKmiMIqGKKl
	Sec95JNvjvlYv9Bg==
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
 xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V2 32/36] iommu/arm-smmu-v3: Use msi_get_virq()
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:47 +0100 (CET)

Let the core code fiddle with the MSI descriptor retrieval.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3154,7 +3154,6 @@ static void arm_smmu_write_msi_msg(struc
 
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
-	struct msi_desc *desc;
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
 	struct device *dev = smmu->dev;
 
@@ -3182,21 +3181,9 @@ static void arm_smmu_setup_msis(struct a
 		return;
 	}
 
-	for_each_msi_entry(desc, dev) {
-		switch (desc->msi_index) {
-		case EVTQ_MSI_INDEX:
-			smmu->evtq.q.irq = desc->irq;
-			break;
-		case GERROR_MSI_INDEX:
-			smmu->gerr_irq = desc->irq;
-			break;
-		case PRIQ_MSI_INDEX:
-			smmu->priq.q.irq = desc->irq;
-			break;
-		default:	/* Unknown */
-			continue;
-		}
-	}
+	smmu->evtq.q.irq = msi_get_virq(dev, EVTQ_MSI_INDEX);
+	smmu->gerr_irq = msi_get_virq(dev, GERROR_MSI_INDEX);
+	smmu->priq.q.irq = msi_get_virq(dev, PRIQ_MSI_INDEX);
 
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, arm_smmu_free_msis, dev);


