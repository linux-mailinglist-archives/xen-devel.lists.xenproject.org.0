Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DF252D62
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu7T-0008RO-5f; Wed, 26 Aug 2020 12:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7S-00083C-B6
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:34 +0000
X-Inumbo-ID: 63b71c43-fa07-467d-990c-c3bb59609121
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63b71c43-fa07-467d-990c-c3bb59609121;
 Wed, 26 Aug 2020 12:01:27 +0000 (UTC)
Message-Id: <20200826112333.139387358@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=+WzR5MCuCex7ytf6rjsXfS+TP5lRyvSEuqbO3kY2ypY=;
 b=AFAYy1AZODdBAXiQF7D/2Af8hjoA4F8whD1dpfxhZK0wDTkBf3sx/VW4O7HKpqAFQF6LfQ
 XqAnO4Jday9Dy+ZAnDZuaZIcexHC5k39FSw5iwposD/R9Hh5EubsWwJv9/VREawRgyHgD0
 CJrI9TXEVoVnmeZEEdDR73bytPy2vid/IRs7h2lro8AX8dn3PHz6Up96z37+dXPCe9s8FO
 Jbf8kKTgVcXc0g9b3oirnxBiTzC21Iy1eeEsFbcC6bnLXB7fls4O14ynXejBtmZBynS/cT
 nqFa+ajT5XGYIQYNicdr9NM1gu9bnuAyf5ubP6NEsBw3LzgzK18Bvd4eQmq+Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=+WzR5MCuCex7ytf6rjsXfS+TP5lRyvSEuqbO3kY2ypY=;
 b=u2ouyFH0DTUgP45ogWuZh8vqAlI+1eKXuHYVXRV5MEZcJUmzJuBp+ygWAV3omQ2ec9yiFP
 sQTZJqjSD3yBN0Dw==
Date: Wed, 26 Aug 2020 13:16:53 +0200
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
Subject: [patch V2 25/46] PCI/MSI: Provide pci_dev_has_special_msi_domain()
 helper
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

Provide a helper function to check whether a PCI device is handled by a
non-standard PCI/MSI domain. This will be used to exclude such devices
which hang of a special bus, e.g. VMD, to be excluded from the irq domain
override in irq remapping.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/msi.c   |   22 ++++++++++++++++++++++
 include/linux/msi.h |    1 +
 2 files changed, 23 insertions(+)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1553,4 +1553,26 @@ struct irq_domain *pci_msi_get_device_do
 					     DOMAIN_BUS_PCI_MSI);
 	return dom;
 }
+
+/**
+ * pci_dev_has_special_msi_domain - Check whether the device is handled by
+ *				    a non-standard PCI-MSI domain
+ * @pdev:	The PCI device to check.
+ *
+ * Returns: True if the device irqdomain or the bus irqdomain is
+ * non-standard PCI/MSI.
+ */
+bool pci_dev_has_special_msi_domain(struct pci_dev *pdev)
+{
+	struct irq_domain *dom = dev_get_msi_domain(&pdev->dev);
+
+	if (!dom)
+		dom = dev_get_msi_domain(&pdev->bus->dev);
+
+	if (!dom)
+		return true;
+
+	return dom->bus_token != DOMAIN_BUS_PCI_MSI;
+}
+
 #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -374,6 +374,7 @@ int pci_msi_domain_check_cap(struct irq_
 			     struct msi_domain_info *info, struct device *dev);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
+bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
 #else
 static inline struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
 {


