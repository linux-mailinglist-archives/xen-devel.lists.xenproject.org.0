Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2946AD15
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240057.416342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmD-0003fW-D2; Mon, 06 Dec 2021 22:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240057.416342; Mon, 06 Dec 2021 22:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmD-0003Qv-05; Mon, 06 Dec 2021 22:48:05 +0000
Received: by outflank-mailman (input) for mailman id 240057;
 Mon, 06 Dec 2021 22:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdn-0004ul-9H
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b957685-56e5-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:39:22 +0100 (CET)
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
X-Inumbo-ID: 5b957685-56e5-11ec-8a4d-196798b21f7b
Message-ID: <20211206210438.526615164@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=VsZ3njmr5k39jlVPmLqs7fRziJhKxPsmlZLbUp52Qo0=;
	b=os+tglWF/egYWspIL4wIQv925bxi2zSPElA92tuQBrD7wFk0cN9VKJnJ1F5cVRoYomEcUl
	0Nwi6ypZ5bLCO8Xp+8NRLbSh2/2KXNfxU+z/R8/3Sl9wpfUkcYhEPowdYVRJNxP4bEMEcf
	yXqzkRFAU9AuIcncEGW5vSkSXZmkmHfuRMz2pIBqgby+Y+/pHfvhSS8Q5s4zSGz6ts3tWi
	MHrU4C8JAtaPRxed3hYS+/0wzH0swMzavhozh1/MU5r1YwMkKrdjuyPoaE/CPUx2+DjKKt
	I9XNnOJpgdl0ZZjmJTi83nZKTqL+QkvAHCOYZxC5qFC7NGUXxi541gFWoLCWPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=VsZ3njmr5k39jlVPmLqs7fRziJhKxPsmlZLbUp52Qo0=;
	b=kAcmRTjch2KsIIY9uLwMdt6zt2R0VkyPFXlUzjeehDD+6pOraR8tyKYfOwTcXWf1sZNmwF
	GFzOX1AIemJS5IBA==
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
Subject: [patch V2 16/36] soc: ti: ti_sci_inta_msi: Use msi_desc::msi_index
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:21 +0100 (CET)

Use the common msi_index member and get rid of the pointless wrapper struct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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


