Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C995446AD14
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240050.416310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMm4-0001tM-T8; Mon, 06 Dec 2021 22:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240050.416310; Mon, 06 Dec 2021 22:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMm4-0001o5-Fc; Mon, 06 Dec 2021 22:47:56 +0000
Received: by outflank-mailman (input) for mailman id 240050;
 Mon, 06 Dec 2021 22:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMe4-0004ul-Ue
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:41 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 661cc391-56e5-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:39:40 +0100 (CET)
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
X-Inumbo-ID: 661cc391-56e5-11ec-8a4d-196798b21f7b
Message-ID: <20211206210439.128089025@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yTGriMSBQw12ZMYwEGW0S48cT2DY3/1yk7kZdgU1pmY=;
	b=abvHkvl7MHes9mfOR9bqibGGIq+vx064Sx/2IoxZNFoXq1/arNYeM7Fbw9vyud2BFpcCyl
	8gYXLi5T6uox7YrF/wkwGrMbOYbu8YeDNLMftUhInxY9rK7K3bLobmPm3i1yFDmDTt3Sz8
	FivfavzedB+NMyNAHZGsBXI5xY3YXl5/y7Z8BJwltsgNA86ygdtVAKJ9/QL9NYaT4aF83x
	FfUbp+918U2Of/Jb3GGCZN/G6A6CFJdtTNeZeidruI3SVzDwS/Wqx5Mwzt5+j9ENoiITfF
	2EmWdlKv5+TyJK4oh9mDVyz937Nyh0L46t/la0gvE9sDn8q0Hx5sEwvmQSn/0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yTGriMSBQw12ZMYwEGW0S48cT2DY3/1yk7kZdgU1pmY=;
	b=1N0K5YuxqLac5NJ0H3KkeMbsgwgxSEc2RhXJyC59uy5mjovjdeMAYcA2crOwpjyQKiRZJy
	VIAHD13n0j3h8SAA==
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
 Robin Murphy <robin.murphy@arm.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V2 27/36] genirq/msi: Provide interface to retrieve Linux
 interrupt number
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:39 +0100 (CET)

This allows drivers to retrieve the Linux interrupt number instead of
fiddling with MSI descriptors.

msi_get_virq() returns the Linux interrupt number or 0 in case that there
is no entry for the given MSI index.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Simplify the implementation and let PCI deal with the PCI specialities - Marc
---
 include/linux/msi.h |    2 ++
 kernel/irq/msi.c    |   36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -170,6 +170,8 @@ static inline bool msi_device_has_proper
 static inline void msi_device_set_properties(struct device *dev, unsigned long prop) { }
 #endif
 
+unsigned int msi_get_virq(struct device *dev, unsigned int index);
+
 /* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
 #define dev_to_msi_list(dev)		(&(dev)->msi_list)
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -129,6 +129,42 @@ int msi_setup_device_data(struct device
 	return 0;
 }
 
+/**
+ * msi_get_virq - Return Linux interrupt number of a MSI interrupt
+ * @dev:	Device to operate on
+ * @index:	MSI interrupt index to look for (0-based)
+ *
+ * Return: The Linux interrupt number on success (> 0), 0 if not found
+ */
+unsigned int msi_get_virq(struct device *dev, unsigned int index)
+{
+	struct msi_desc *desc;
+	bool pcimsi;
+
+	if (!dev->msi.data)
+		return 0;
+
+	pcimsi = msi_device_has_property(dev, MSI_PROP_PCI_MSI);
+
+	for_each_msi_entry(desc, dev) {
+		/* PCI-MSI has only one descriptor for multiple interrupts. */
+		if (pcimsi) {
+			if (desc->irq && index < desc->nvec_used)
+				return desc->irq + index;
+			break;
+		}
+
+		/*
+		 * PCI-MSIX and platform MSI use a descriptor per
+		 * interrupt.
+		 */
+		if (desc->msi_index == index)
+			return desc->irq;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(msi_get_virq);
+
 #ifdef CONFIG_SYSFS
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)


