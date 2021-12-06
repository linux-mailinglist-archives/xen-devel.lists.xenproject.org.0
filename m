Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C950B46AD3E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240125.416540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMp9-0000FM-P3; Mon, 06 Dec 2021 22:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240125.416540; Mon, 06 Dec 2021 22:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMp9-0000CH-Kn; Mon, 06 Dec 2021 22:51:07 +0000
Received: by outflank-mailman (input) for mailman id 240125;
 Mon, 06 Dec 2021 22:51:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMp7-0008NM-P5
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:05 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe202d97-56e6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:51:04 +0100 (CET)
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
X-Inumbo-ID: fe202d97-56e6-11ec-a5e1-b9374ead2679
Message-ID: <20211206210747.650487479@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oGMiasuEUP4gSPR4Np59QOd3p0f+7TdfKQ+z0X714rk=;
	b=AeE2TL7t3Fs/zk2b8u7XU/RPKp0PKDcHb6o1LQsk6FQYiqMSSE2yPSahkMyfBPRnVqIfZl
	vlXmcYajjDHevBFb9P6jtevmccnnf014R8N+Br8323yG4RME1FG5B8OXNPkb1U/20+QWBi
	MaD/0yfxInZIGS33CdbvaP/FEd/zDBH8mYlQUkoJwV4LIIMmboj0jXyeqlIhlhdYqHzgyA
	vpd1JHqPyHhHyzNfAd6nPsuKqh1eAuoQZ1hbeuEGs65xlV0b8bnpNP9n2aJJZq+cxLDR08
	VkIDMxRTkV7+hys3okCFBDhxPdPsZuwT9bJIHx7LO8tRhX4inH48nx/hSou73A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oGMiasuEUP4gSPR4Np59QOd3p0f+7TdfKQ+z0X714rk=;
	b=iSZa0c73v4SUkG5gpASXm733/ynX/JyyTEfp92Iferxo/T2tJ4od/37IXabjVXcVUp6/gC
	+/2dhH8Ss0W/NBAA==
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
 Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject:
 [patch V2 01/31] genirq/msi: Move descriptor list to struct msi_device_data
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:04 +0100 (CET)

It's only required when MSI is in use.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/core.c    |    3 ---
 include/linux/device.h |    4 ----
 include/linux/msi.h    |    4 +++-
 kernel/irq/msi.c       |    5 ++++-
 4 files changed, 7 insertions(+), 9 deletions(-)

--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2874,9 +2874,6 @@ void device_initialize(struct device *de
 	INIT_LIST_HEAD(&dev->devres_head);
 	device_pm_init(dev);
 	set_dev_node(dev, NUMA_NO_NODE);
-#ifdef CONFIG_GENERIC_MSI_IRQ
-	INIT_LIST_HEAD(&dev->msi_list);
-#endif
 	INIT_LIST_HEAD(&dev->links.consumers);
 	INIT_LIST_HEAD(&dev->links.suppliers);
 	INIT_LIST_HEAD(&dev->links.defer_sync);
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -423,7 +423,6 @@ struct dev_msi_info {
  * @pins:	For device pin management.
  *		See Documentation/driver-api/pin-control.rst for details.
  * @msi:	MSI related data
- * @msi_list:	Hosts MSI descriptors
  * @numa_node:	NUMA node this device is close to.
  * @dma_ops:    DMA mapping operations for this device.
  * @dma_mask:	Dma mask (if dma'ble device).
@@ -519,9 +518,6 @@ struct device {
 	struct dev_pin_info	*pins;
 #endif
 	struct dev_msi_info	msi;
-#ifdef CONFIG_GENERIC_MSI_IRQ
-	struct list_head	msi_list;
-#endif
 #ifdef CONFIG_DMA_OPS
 	const struct dma_map_ops *dma_ops;
 #endif
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -145,11 +145,13 @@ struct msi_desc {
  * @properties:		MSI properties which are interesting to drivers
  * @attrs:		Pointer to the sysfs attribute group
  * @platform_data:	Platform-MSI specific data
+ * @list:		List of MSI descriptors associated to the device
  */
 struct msi_device_data {
 	unsigned long			properties;
 	const struct attribute_group    **attrs;
 	struct platform_msi_priv_data	*platform_data;
+	struct list_head		list;
 };
 
 int msi_setup_device_data(struct device *dev);
@@ -174,7 +176,7 @@ unsigned int msi_get_virq(struct device
 
 /* Helpers to hide struct msi_desc implementation details */
 #define msi_desc_to_dev(desc)		((desc)->dev)
-#define dev_to_msi_list(dev)		(&(dev)->msi_list)
+#define dev_to_msi_list(dev)		(&(dev)->msi.data->list)
 #define first_msi_entry(dev)		\
 	list_first_entry(dev_to_msi_list((dev)), struct msi_desc, list)
 #define for_each_msi_entry(desc, dev)	\
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -99,7 +99,9 @@ EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 
 static void msi_device_data_release(struct device *dev, void *res)
 {
-	WARN_ON_ONCE(!list_empty(&dev->msi_list));
+	struct msi_device_data *md = res;
+
+	WARN_ON_ONCE(!list_empty(&md->list));
 	dev->msi.data = NULL;
 }
 
@@ -124,6 +126,7 @@ int msi_setup_device_data(struct device
 	if (!md)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&md->list);
 	dev->msi.data = md;
 	devres_add(dev, md);
 	return 0;


