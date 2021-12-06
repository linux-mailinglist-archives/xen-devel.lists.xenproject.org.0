Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60846AC3F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239929.416055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbj-0004z1-Dc; Mon, 06 Dec 2021 22:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239929.416055; Mon, 06 Dec 2021 22:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbj-0004vy-8f; Mon, 06 Dec 2021 22:37:15 +0000
Received: by outflank-mailman (input) for mailman id 239929;
 Mon, 06 Dec 2021 22:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSk-0001m5-4Q
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:58 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2dcfdd6-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:27:56 +0100 (CET)
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
X-Inumbo-ID: c2dcfdd6-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210224.925241961@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=;
	b=XU5P0R3+ZvbfRzdT7eITdUZpVffQhu3mwMQxHIuYgaoigDHKPoocQDa8qE3Uaf7sAC1A9a
	Js9g6cNcn6mG5wi/DOPiYiYl3E8Zz14cSLHuVeGnH6q1kq55XyN9gRmcVHSh5M702eeuzS
	bamXvbJtwYpQ7EnWUWKX/KSbvsAjwKbfyZz1Ddew/kluJQEYrt+sgElwsfwUoFZGHB3SW5
	JWhsk59n5A4ddQt8nalxZK/oiN+HIb+DfnIB5bCE/+7f4xAhtXvdT/dZztFeYnEkP4j9ik
	qGpniZKbYB7qVDkE7feBPxpsBYMFmfBZX4PgA2J+mwXW3+TPFkwcsLvleDUFdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=FXX41Qfq2rmX4Pnl0ZDgGggJiyIMhnsIgHBe+OGHmI0=;
	b=5xLy8ejXtHWFxftIt7uUy/JNMg6lFP0zokUkUY/UbBvVYESVtltZxcFPpywZO0EAeM6axN
	GP3uFRXwCiRvoiAg==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:56 +0100 (CET)

It's only required for PCI/MSI. So no point in having it in every struct
device.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch
---
 drivers/base/core.c    |    1 -
 drivers/pci/msi/msi.c  |    2 +-
 drivers/pci/probe.c    |    4 +++-
 include/linux/device.h |    2 --
 include/linux/pci.h    |    1 +
 5 files changed, 5 insertions(+), 5 deletions(-)

--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
 	device_pm_init(dev);
 	set_dev_node(dev, NUMA_NO_NODE);
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spin_lock_init(&dev->msi_lock);
 	INIT_LIST_HEAD(&dev->msi_list);
 #endif
 	INIT_LIST_HEAD(&dev->links.consumers);
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
 
 static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
 {
-	raw_spinlock_t *lock = &desc->dev->msi_lock;
+	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
 	unsigned long flags;
 
 	if (!desc->pci.msi_attrib.can_mask)
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2311,7 +2311,9 @@ struct pci_dev *pci_alloc_dev(struct pci
 	INIT_LIST_HEAD(&dev->bus_list);
 	dev->dev.type = &pci_dev_type;
 	dev->bus = pci_bus_get(bus);
-
+#ifdef CONFIG_PCI_MSI
+	raw_spin_lock_init(&dev->msi_lock);
+#endif
 	return dev;
 }
 EXPORT_SYMBOL(pci_alloc_dev);
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -407,7 +407,6 @@ struct dev_links_info {
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
  *		See Documentation/driver-api/pin-control.rst for details.
- * @msi_lock:	Lock to protect MSI mask cache and mask register
  * @msi_list:	Hosts MSI descriptors
  * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
@@ -508,7 +507,6 @@ struct device {
 	struct dev_pin_info	*pins;
 #endif
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spinlock_t		msi_lock;
 	struct list_head	msi_list;
 #endif
 #ifdef CONFIG_DMA_OPS
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -474,6 +474,7 @@ struct pci_dev {
 #endif
 #ifdef CONFIG_PCI_MSI
 	void __iomem	*msix_base;
+	raw_spinlock_t	msi_lock;
 	const struct attribute_group **msi_irq_groups;
 #endif
 	struct pci_vpd	vpd;


