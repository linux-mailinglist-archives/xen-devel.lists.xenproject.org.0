Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF446ADD1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240172.416693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMvB-0000Na-3x; Mon, 06 Dec 2021 22:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240172.416693; Mon, 06 Dec 2021 22:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMvB-0000KT-04; Mon, 06 Dec 2021 22:57:21 +0000
Received: by outflank-mailman (input) for mailman id 240172;
 Mon, 06 Dec 2021 22:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpi-0000Tb-KI
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 142d1d70-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:41 +0100 (CET)
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
X-Inumbo-ID: 142d1d70-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.903173257@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=TGj6QTdrqi/+rBbBw9aAzTJFtE/Dj0UpsCqlfUJ2p/4=;
	b=mVJN1RJZ51UJu4NAt17o9Yjlr69dkjvIBbh4zmID8wsFrx1rJQ7zF8Ma4ZLa1qLO35B4ql
	P7x+C0XkL8ECRkCPU4wA/WZUWiqJz/ZbiwpIBjy/hPxeDt9pIlnbIKUkTqSLhd5WuTbbKu
	KyYwTdc7q8cyCrVA9+PJGFtt/vPypBQj72H0G9p6BchpEikwi52abfJnbw8ycQtj99uVW/
	2+0owMtqhfYky6kH9IkuFLkySe/N8mJ+PdMKPQkGKCG4wDP6Eph23UvpCDUMUBDrvRa8F4
	q3n8EHkiqP/IyL1WHrYUS5lT6gYbpCadqhGNAJGkL+Se8PG0rPRwRwiVmRoL4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=TGj6QTdrqi/+rBbBw9aAzTJFtE/Dj0UpsCqlfUJ2p/4=;
	b=j5Te8xjGegqRV3djiYUjH5qxiB+uC/0NQXY/fqTJrxKk5j63OatgN4bIs6qcqwCM4937EE
	SKSVFVEZELM6gwDQ==
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
Subject: [patch V2 24/31] platform-msi: Let core code handle MSI descriptors
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:41 +0100 (CET)

Use the core functionality for platform MSI interrupt domains. The platform
device MSI interrupt domains will be converted in a later step.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/base/platform-msi.c |  112 ++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 64 deletions(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -107,57 +107,6 @@ static void platform_msi_update_chip_ops
 		info->flags &= ~MSI_FLAG_LEVEL_CAPABLE;
 }
 
-static void platform_msi_free_descs(struct device *dev, int base, int nvec)
-{
-	struct msi_desc *desc, *tmp;
-
-	list_for_each_entry_safe(desc, tmp, dev_to_msi_list(dev), list) {
-		if (desc->msi_index >= base &&
-		    desc->msi_index < (base + nvec)) {
-			list_del(&desc->list);
-			free_msi_entry(desc);
-		}
-	}
-}
-
-static int platform_msi_alloc_descs_with_irq(struct device *dev, int virq,
-					     int nvec)
-{
-	struct msi_desc *desc;
-	int i, base = 0;
-
-	if (!list_empty(dev_to_msi_list(dev))) {
-		desc = list_last_entry(dev_to_msi_list(dev),
-				       struct msi_desc, list);
-		base = desc->msi_index + 1;
-	}
-
-	for (i = 0; i < nvec; i++) {
-		desc = alloc_msi_entry(dev, 1, NULL);
-		if (!desc)
-			break;
-
-		desc->msi_index = base + i;
-		desc->irq = virq ? virq + i : 0;
-
-		list_add_tail(&desc->list, dev_to_msi_list(dev));
-	}
-
-	if (i != nvec) {
-		/* Clean up the mess */
-		platform_msi_free_descs(dev, base, nvec);
-
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static int platform_msi_alloc_descs(struct device *dev, int nvec)
-{
-	return platform_msi_alloc_descs_with_irq(dev, 0, nvec);
-}
-
 /**
  * platform_msi_create_irq_domain - Create a platform MSI interrupt domain
  * @fwnode:		Optional fwnode of the interrupt controller
@@ -180,7 +129,8 @@ struct irq_domain *platform_msi_create_i
 		platform_msi_update_dom_ops(info);
 	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
 		platform_msi_update_chip_ops(info);
-	info->flags |= MSI_FLAG_DEV_SYSFS;
+	info->flags |= MSI_FLAG_DEV_SYSFS | MSI_FLAG_ALLOC_SIMPLE_MSI_DESCS |
+		       MSI_FLAG_FREE_MSI_DESCS;
 
 	domain = msi_create_irq_domain(fwnode, info, parent);
 	if (domain)
@@ -262,20 +212,10 @@ int platform_msi_domain_alloc_irqs(struc
 	if (err)
 		return err;
 
-	err = platform_msi_alloc_descs(dev, nvec);
-	if (err)
-		goto out_free_priv_data;
-
 	err = msi_domain_alloc_irqs(dev->msi.domain, dev, nvec);
 	if (err)
-		goto out_free_desc;
-
-	return 0;
+		platform_msi_free_priv_data(dev);
 
-out_free_desc:
-	platform_msi_free_descs(dev, 0, nvec);
-out_free_priv_data:
-	platform_msi_free_priv_data(dev);
 	return err;
 }
 EXPORT_SYMBOL_GPL(platform_msi_domain_alloc_irqs);
@@ -287,7 +227,6 @@ EXPORT_SYMBOL_GPL(platform_msi_domain_al
 void platform_msi_domain_free_irqs(struct device *dev)
 {
 	msi_domain_free_irqs(dev->msi.domain, dev);
-	platform_msi_free_descs(dev, 0, MAX_DEV_MSIS);
 	platform_msi_free_priv_data(dev);
 }
 EXPORT_SYMBOL_GPL(platform_msi_domain_free_irqs);
@@ -361,6 +300,51 @@ struct irq_domain *
 	return NULL;
 }
 
+static void platform_msi_free_descs(struct device *dev, int base, int nvec)
+{
+	struct msi_desc *desc, *tmp;
+
+	list_for_each_entry_safe(desc, tmp, dev_to_msi_list(dev), list) {
+		if (desc->msi_index >= base &&
+		    desc->msi_index < (base + nvec)) {
+			list_del(&desc->list);
+			free_msi_entry(desc);
+		}
+	}
+}
+
+static int platform_msi_alloc_descs_with_irq(struct device *dev, int virq,
+					     int nvec)
+{
+	struct msi_desc *desc;
+	int i, base = 0;
+
+	if (!list_empty(dev_to_msi_list(dev))) {
+		desc = list_last_entry(dev_to_msi_list(dev),
+				       struct msi_desc, list);
+		base = desc->msi_index + 1;
+	}
+
+	for (i = 0; i < nvec; i++) {
+		desc = alloc_msi_entry(dev, 1, NULL);
+		if (!desc)
+			break;
+
+		desc->msi_index = base + i;
+		desc->irq = virq + i;
+
+		list_add_tail(&desc->list, dev_to_msi_list(dev));
+	}
+
+	if (i != nvec) {
+		/* Clean up the mess */
+		platform_msi_free_descs(dev, base, nvec);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 /**
  * platform_msi_device_domain_free - Free interrupts associated with a platform-msi
  *				     device domain


