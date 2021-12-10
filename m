Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D33470D1F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244355.422678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoE9-0006Ri-2m; Fri, 10 Dec 2021 22:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244355.422678; Fri, 10 Dec 2021 22:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoE8-0006OQ-VC; Fri, 10 Dec 2021 22:18:52 +0000
Received: by outflank-mailman (input) for mailman id 244355;
 Fri, 10 Dec 2021 22:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoE6-0005LR-Sd
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:18:50 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26b0de2a-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:18:50 +0100 (CET)
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
X-Inumbo-ID: 26b0de2a-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221813.434156196@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=VrU+cUwVNt/tRlW4lw+bzWjrRhpWxr0n5kAnta20rq4=;
	b=pE4rQ2ru1rC+MOxwgCFck9hIsKI0LjZICNGNwEw8ze9/meweY1qANt4dgwIHKfQOPC1beg
	yPBns7caG7PjSlQkEoMvTCi/DDid/5ijo+pcU/3ZLIE1LS+qQRJIeuxZj2Mi/GYsUgFxDG
	UfE4buF12pfMJCkH4E7kXOGXF3Tdxoadhmimlb4Oqaa6At4sxsqGTcRd4XwvSUVolW7xT/
	BZ6l4WzdOdHBFzRU8fuHCGeKVTvU3fpMB68bg/XbArySIyUaHyjLg/eiywsouAZhDcRfnk
	7ETqReSwtzm9CpcynGCRQWFvda5xRxitOgtngCsHnX2u5kMmZ6hOfaZO1ylegg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=VrU+cUwVNt/tRlW4lw+bzWjrRhpWxr0n5kAnta20rq4=;
	b=4a4+C7WhuYdeuyTtWKdNyTdvLDhhfziSubOZ+5mUXlzgk+OuqIM6rjcLPfL3/GtWFOnIFc
	gcXKQZiyuUQutAAA==
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
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [patch V3 04/35] genirq/msi: Use PCI device property
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:49 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

to determine whether this is MSI or MSIX instead of consulting MSI
descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Use PCI device property - Jason
---
 kernel/irq/msi.c |   17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -77,21 +77,8 @@ EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
-	struct msi_desc *entry;
-	bool is_msix = false;
-	unsigned long irq;
-	int retval;
-
-	retval = kstrtoul(attr->attr.name, 10, &irq);
-	if (retval)
-		return retval;
-
-	entry = irq_get_msi_desc(irq);
-	if (!entry)
-		return -ENODEV;
-
-	if (dev_is_pci(dev))
-		is_msix = entry->pci.msi_attrib.is_msix;
+	/* MSI vs. MSIX is per device not per interrupt */
+	bool is_msix = dev_is_pci(dev) ? to_pci_dev(dev)->msix_enabled : false;
 
 	return sysfs_emit(buf, "%s\n", is_msix ? "msix" : "msi");
 }


