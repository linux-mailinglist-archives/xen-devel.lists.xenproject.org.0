Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FC470DC0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244419.422919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoMO-0003j3-7t; Fri, 10 Dec 2021 22:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244419.422919; Fri, 10 Dec 2021 22:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoMO-0003fD-34; Fri, 10 Dec 2021 22:27:24 +0000
Received: by outflank-mailman (input) for mailman id 244419;
 Fri, 10 Dec 2021 22:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEg-0005LK-IA
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:26 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bea19be-5a07-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 23:19:25 +0100 (CET)
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
X-Inumbo-ID: 3bea19be-5a07-11ec-a74f-db008197e53d
Message-ID: <20211210221814.841243231@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ja9fbkTMChiYC+RHKTG35XzzVDvmaXMgaMrb6WY3XeQ=;
	b=z6iPEnfVAgwlW1Qbnq1nCFWwA6bNapErKquzAi3fk6aQqeO9o4U4iwQjv+EebRfvLnwN8n
	e63ahKnp4QuQIaqzvffdsynbWgeJGaK4CvS+c+uMgRBceXI7VODqOegmQe3L/CvghbDhuO
	LN91tjaF0S12KexgZs8cR5/oZ2rSgoo7wgdZrtLgJvkHGW3yStep1fiuvR7g41IWJCZNnu
	Rdmmg97HfnTylsxqpzgAYVzZaMeXvWfNQQ5rvNFbwpEWwzgtXnQ4/DZTiIX/XN8OvdQ75p
	NdflsNWb6DcWnXBSu0XhAKL30N7MQvosu7Eo61JG6PvjMi8bgOFzC5eVez11kQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ja9fbkTMChiYC+RHKTG35XzzVDvmaXMgaMrb6WY3XeQ=;
	b=ClMHqdNEhBqMOb1sVFaSm0KweWWAEZJCgeJM/hGJMp5ROj9kquAcj3PJfKxxeM3i7GOxBS
	FHUfoC+s+JX7GLDA==
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
Subject: [patch V3 27/35] PCI/MSI: Use __msi_get_virq() in pci_get_vector()
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:25 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

Use msi_get_vector() and handle the return value to be compatible.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2: Handle the INTx case directly instead of trying to be overly smart - Marc
---
 drivers/pci/msi/msi.c |   25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1037,28 +1037,13 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
  */
 int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
 {
-	if (dev->msix_enabled) {
-		struct msi_desc *entry;
+	unsigned int irq;
 
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->msi_index == nr)
-				return entry->irq;
-		}
-		WARN_ON_ONCE(1);
-		return -EINVAL;
-	}
+	if (!dev->msi_enabled && !dev->msix_enabled)
+		return !nr ? dev->irq : -EINVAL;
 
-	if (dev->msi_enabled) {
-		struct msi_desc *entry = first_pci_msi_entry(dev);
-
-		if (WARN_ON_ONCE(nr >= entry->nvec_used))
-			return -EINVAL;
-	} else {
-		if (WARN_ON_ONCE(nr > 0))
-			return -EINVAL;
-	}
-
-	return dev->irq + nr;
+	irq = msi_get_virq(&dev->dev, nr);
+	return irq ? irq : -EINVAL;
 }
 EXPORT_SYMBOL(pci_irq_vector);
 


