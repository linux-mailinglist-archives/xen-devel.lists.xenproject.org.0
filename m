Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F58E470DB8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244398.422845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoM5-00081I-Bb; Fri, 10 Dec 2021 22:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244398.422845; Fri, 10 Dec 2021 22:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoM4-0007wB-TX; Fri, 10 Dec 2021 22:27:04 +0000
Received: by outflank-mailman (input) for mailman id 244398;
 Fri, 10 Dec 2021 22:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEZ-0005LR-0W
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:19 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 375e1fc8-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:19:18 +0100 (CET)
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
X-Inumbo-ID: 375e1fc8-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221814.540704224@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=cN4mOxuY7Okg1M+dlth8hthNIkx8L2iGPoOR+S+w+us=;
	b=M1tVjk6yFiMKXjz8z9rtje5UmZy1dz0aDWkX81TwRD2eOEBGMMOd4HQQbrePJuaH6+UMRX
	J8wzTS/tTtQdxXfph9XF969YPmB4Y9GtozG9J4einOdMXxZg3dQjYwxFmbcAJrBgo1kHEs
	PbCl/WQUGX4eNaP010LwWx1i2cL5DMz8+7ISg/FfzlYFm65Wyqm9T6dyF1sj5FioiD3VX+
	3iHK8Lyh2m73JkSmCPZRxgV4hdZQVdwIcMAKKbwxgrB6ifMNHS/T+pXh+isLvhLB4AByf+
	ekRKlayeNgYLRRrhODOIIyqUXowDIwjE4RArqa+pNuDaWoQqOOLWRwNBHeCs1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=cN4mOxuY7Okg1M+dlth8hthNIkx8L2iGPoOR+S+w+us=;
	b=zq6e6vgOvTOBpv83YKIBY7AfdQR37XhK0GNGPBYF4MooJaZ9kRON5kPCk5FJ8SFotmH1vC
	0TG1lB8qM5PsBWAg==
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
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
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
Subject: [patch V3 22/35] soc: ti: ti_sci_inta_msi: Use msi_desc::msi_index
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:17 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

Use the common msi_index member and get rid of the pointless wrapper struct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-ti-sci-inta.c |    2 +-
 drivers/soc/ti/ti_sci_inta_msi.c  |    6 +++---
 include/linux/msi.h               |   16 ++--------------
 3 files changed, 6 insertions(+), 18 deletions(-)

--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -595,7 +595,7 @@ static void ti_sci_inta_msi_set_desc(msi
 	struct platform_device *pdev = to_platform_device(desc->dev);
 
 	arg->desc = desc;
-	arg->hwirq = TO_HWIRQ(pdev->id, desc->inta.dev_index);
+	arg->hwirq = TO_HWIRQ(pdev->id, desc->msi_index);
 }
 
 static struct msi_domain_ops ti_sci_inta_msi_ops = {
--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -84,7 +84,7 @@ static int ti_sci_inta_msi_alloc_descs(s
 				return -ENOMEM;
 			}
 
-			msi_desc->inta.dev_index = res->desc[set].start + i;
+			msi_desc->msi_index = res->desc[set].start + i;
 			INIT_LIST_HEAD(&msi_desc->list);
 			list_add_tail(&msi_desc->list, dev_to_msi_list(dev));
 			count++;
@@ -96,7 +96,7 @@ static int ti_sci_inta_msi_alloc_descs(s
 				return -ENOMEM;
 			}
 
-			msi_desc->inta.dev_index = res->desc[set].start_sec + i;
+			msi_desc->msi_index = res->desc[set].start_sec + i;
 			INIT_LIST_HEAD(&msi_desc->list);
 			list_add_tail(&msi_desc->list, dev_to_msi_list(dev));
 			count++;
@@ -154,7 +154,7 @@ unsigned int ti_sci_inta_msi_get_virq(st
 	struct msi_desc *desc;
 
 	for_each_msi_entry(desc, dev)
-		if (desc->inta.dev_index == dev_index)
+		if (desc->msi_index == dev_index)
 			return desc->irq;
 
 	return -ENODEV;
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -107,14 +107,6 @@ struct pci_msi_desc {
 };
 
 /**
- * ti_sci_inta_msi_desc - TISCI based INTA specific msi descriptor data
- * @dev_index: TISCI device index
- */
-struct ti_sci_inta_msi_desc {
-	u16	dev_index;
-};
-
-/**
  * struct msi_desc - Descriptor structure for MSI based interrupts
  * @list:	List head for management
  * @irq:	The base interrupt number
@@ -128,8 +120,7 @@ struct ti_sci_inta_msi_desc {
  * @write_msi_msg_data:	Data parameter for the callback.
  *
  * @msi_index:	Index of the msi descriptor
- * @pci:	[PCI]	    PCI speficic msi descriptor data
- * @inta:	[INTA]	    TISCI based INTA specific msi descriptor data
+ * @pci:	PCI specific msi descriptor data
  */
 struct msi_desc {
 	/* Shared device/bus type independent data */
@@ -147,10 +138,7 @@ struct msi_desc {
 	void *write_msi_msg_data;
 
 	u16				msi_index;
-	union {
-		struct pci_msi_desc		pci;
-		struct ti_sci_inta_msi_desc	inta;
-	};
+	struct pci_msi_desc		pci;
 };
 
 /**


