Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0F46AD1E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240071.416423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmV-0007lW-AD; Mon, 06 Dec 2021 22:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240071.416423; Mon, 06 Dec 2021 22:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmV-0007bN-28; Mon, 06 Dec 2021 22:48:23 +0000
Received: by outflank-mailman (input) for mailman id 240071;
 Mon, 06 Dec 2021 22:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMds-0004ul-2m
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:28 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e790e71-56e5-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:39:27 +0100 (CET)
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
X-Inumbo-ID: 5e790e71-56e5-11ec-8a4d-196798b21f7b
Message-ID: <20211206210438.688216619@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rDy+I3ErSIwPbhu7X1CCkhe4PGVkrX5FRQ61OeZYbi0=;
	b=rdxELXqqCUvF6w5maDZkJ1DUVcE8xtOFQuqB//kVE8LutIsp9x7oY88xYjjcJZGehvl20I
	R+i6TJmT/vTW79Nv4ctZJYRheEWHSoWoguFGJMgyW+Y78A4gZheDTRjB7MKWo1i1SNciQv
	MAkGYA8bGBoVVnZcIEV3q2C/xmLuWz4pSytUusJpxR9xdD6KElclS1+2OYVVTkq2CTV5v0
	K7Qk55Cr9KK7t23ybVmifYXu8ldnDmpJ27OX5lTB0ymWjBlgUMjTEseTLZ8Qod83UjgC9D
	tbU/slR0lNW5luPAEZ2uA0pSeOSKTDgFQBd2KUoEvNi5EWLt9sMAqB45SFUrIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rDy+I3ErSIwPbhu7X1CCkhe4PGVkrX5FRQ61OeZYbi0=;
	b=tGgA6BqJjARLsTeCWAn17BXxaUG282LmcuxVJy035n8FdUpejfTN0J30/E3k5C2sIwZD1h
	pHsGs8TzGh+VOpBg==
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
Subject: [patch V2 19/36] PCI/MSI: Store properties in device::msi::data
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:26 +0100 (CET)

Store the properties which are interesting for various places so the MSI
descriptor fiddling can be removed.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Use the setter function
---
 drivers/pci/msi/msi.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -244,6 +244,8 @@ static void free_msi_irqs(struct pci_dev
 		iounmap(dev->msix_base);
 		dev->msix_base = NULL;
 	}
+
+	msi_device_set_properties(&dev->dev, 0);
 }
 
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
@@ -341,6 +343,7 @@ msi_setup_entry(struct pci_dev *dev, int
 {
 	struct irq_affinity_desc *masks = NULL;
 	struct msi_desc *entry;
+	unsigned long prop;
 	u16 control;
 
 	if (affd)
@@ -372,6 +375,10 @@ msi_setup_entry(struct pci_dev *dev, int
 	if (entry->pci.msi_attrib.can_mask)
 		pci_read_config_dword(dev, entry->pci.mask_pos, &entry->pci.msi_mask);
 
+	prop = MSI_PROP_PCI_MSI;
+	if (entry->pci.msi_attrib.is_64)
+		prop |= MSI_PROP_64BIT;
+	msi_device_set_properties(&dev->dev, prop);
 out:
 	kfree(masks);
 	return entry;
@@ -514,6 +521,7 @@ static int msix_setup_entries(struct pci
 		if (masks)
 			curmsk++;
 	}
+	msi_device_set_properties(&dev->dev, MSI_PROP_PCI_MSIX | MSI_PROP_64BIT);
 	ret = 0;
 out:
 	kfree(masks);


