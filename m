Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B567846AD20
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240077.416450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmb-0000hM-LB; Mon, 06 Dec 2021 22:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240077.416450; Mon, 06 Dec 2021 22:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmb-0000YB-6i; Mon, 06 Dec 2021 22:48:29 +0000
Received: by outflank-mailman (input) for mailman id 240077;
 Mon, 06 Dec 2021 22:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdq-0004ul-Ub
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc0e3b3-56e5-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:39:26 +0100 (CET)
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
X-Inumbo-ID: 5dc0e3b3-56e5-11ec-8a4d-196798b21f7b
Message-ID: <20211206210438.634566968@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=22kiva9JQ6H45N/BOYxKJH09o/YfXdpwUv48in1Qe9g=;
	b=nFlB/ZfAFV290eYeaq7YAleaoxlr5J/DYFZ2Nq0+kVCGwKiCDKsS0JHzsD3GRMLXU+qV7j
	fra1pXggf1FZlOZCNMPIxkiO3JccQ5fVaiEY4+wxZ8vfIfEPgFxqSqOEDhxvLBTtU1gzKY
	qsFpt6Tnx+hQcBuljGc2PBclIz+d+ynQZYG+ACQWiOyQUmhPmvu6dr2LKWPRaEB1D1qXsF
	2A0umNkHhXupulP3JfDQWZ0OTfW1qVObZkyPWFJX6TXvls5XDLaIdBIVLG1YsfbYg5gpU0
	8IofU2+b58NPrtDCOWVDCJmuc6BYOXMLrVmDAZ5XjTrebsqoMme+mHo5LfCXtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=22kiva9JQ6H45N/BOYxKJH09o/YfXdpwUv48in1Qe9g=;
	b=kZidNZ0rKz6u6g4sF+G5QgHXRDluyP5cIqQcaPX0b7qjkPXhcQchyCEpOUgYZQx5OduRon
	leuupQ2MYvos0eAQ==
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
Subject: [patch V2 18/36] genirq/msi: Add msi_device_data::properties
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:25 +0100 (CET)

Add a properties field which allows core code to store information for easy
retrieval in order to replace MSI descriptor fiddling.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Add a setter function to prepare for future changes
---
 include/linux/msi.h |   17 +++++++++++++++++
 kernel/irq/msi.c    |   24 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -4,6 +4,7 @@
 
 #include <linux/cpumask.h>
 #include <linux/list.h>
+#include <linux/bits.h>
 #include <asm/msi.h>
 
 /* Dummy shadow structures if an architecture does not define them */
@@ -153,6 +154,22 @@ struct msi_device_data {
 
 int msi_setup_device_data(struct device *dev);
 
+/* MSI device properties */
+#define MSI_PROP_PCI_MSI		BIT(0)
+#define MSI_PROP_PCI_MSIX		BIT(1)
+#define MSI_PROP_64BIT			BIT(2)
+
+#ifdef CONFIG_GENERIC_MSI_IRQ
+bool msi_device_has_property(struct device *dev, unsigned long prop);
+void msi_device_set_properties(struct device *dev, unsigned long prop);
+#else
+static inline bool msi_device_has_property(struct device *dev, unsigned long prop)
+{
+	return false;
+}
+static inline void msi_device_set_properties(struct device *dev, unsigned long prop) { }
+#endif
+
 /* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
 #define dev_to_msi_list(dev)		(&(dev)->msi_list)
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -60,6 +60,30 @@ void free_msi_entry(struct msi_desc *ent
 	kfree(entry);
 }
 
+/**
+ * msi_device_set_properties - Set device specific MSI properties
+ * @dev:	Pointer to the device which is queried
+ * @prop:	Properties to set
+ */
+void msi_device_set_properties(struct device *dev, unsigned long prop)
+{
+	if (WARN_ON_ONCE(!dev->msi.data))
+		return ;
+	dev->msi.data->properties = 0;
+}
+
+/**
+ * msi_device_has_property - Check whether a device has a specific MSI property
+ * @dev:	Pointer to the device which is queried
+ * @prop:	Property to check for
+ */
+bool msi_device_has_property(struct device *dev, unsigned long prop)
+{
+	if (!dev->msi.data)
+		return false;
+	return !!(dev->msi.data->properties & prop);
+}
+
 void __get_cached_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
 	*msg = entry->msg;


