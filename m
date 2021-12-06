Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E946ACFE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240017.416142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMl7-0002eH-Sz; Mon, 06 Dec 2021 22:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240017.416142; Mon, 06 Dec 2021 22:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMl7-0002Xp-Ke; Mon, 06 Dec 2021 22:46:57 +0000
Received: by outflank-mailman (input) for mailman id 240017;
 Mon, 06 Dec 2021 22:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdl-0004dp-Qb
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:21 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aae3233-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:21 +0100 (CET)
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
X-Inumbo-ID: 5aae3233-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210438.473077764@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=9ziMvUfbUs4OErmxFVQP8yEpJ5iNmk70DQs7Nw/O3wo=;
	b=Fdu+KKb02jMNQ8o/TXGZyft89tiIFDW9ofAMDUWGRGFpStmY3dLr0eJeBG1DMd//mzikWk
	ZTtI9hqSK0kehxo/5XM/OjuuM6tgTxRGKhPy6Mk6vfu8xSBVRyJJwfRf++F4ttsUbnwtkx
	Y+ZWVM8uxZ7oMyjADIGCnFly1pd5RUQ/fKSrVw3L3NKDy9vkmY8brMTQqpufEt8SMxDwi6
	71rlSLkBVyjtStG6NMcHXkYV8esLw7UE5uj8GwIgIl8HL1s7P1XonXFdfwgsqgUEmat143
	GUndOKS1X/bKnK1ZWnPlLnpK+x7Ki/Fwlyweyb33NrieA9GmMGHnS6dLKCkpLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=9ziMvUfbUs4OErmxFVQP8yEpJ5iNmk70DQs7Nw/O3wo=;
	b=Yunk42w9+62iIEZTJZNX9m+Oj4qXYK6UASeXhzhHr+9LON/qqQGgf1xIzGOgtedYDopKaj
	19G6J8YzkM/EO5Dw==
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
Subject: [patch V2 15/36] bus: fsl-mc-msi: Use msi_desc::msi_index
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:20 +0100 (CET)

Use the common msi_index member and get rid of the pointless wrapper struct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/bus/fsl-mc/fsl-mc-allocator.c |    2 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c       |    6 +++---
 include/linux/msi.h                   |   10 ----------
 3 files changed, 4 insertions(+), 14 deletions(-)

--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -393,7 +393,7 @@ int fsl_mc_populate_irq_pool(struct fsl_
 	}
 
 	for_each_msi_entry(msi_desc, &mc_bus_dev->dev) {
-		mc_dev_irq = &irq_resources[msi_desc->fsl_mc.msi_index];
+		mc_dev_irq = &irq_resources[msi_desc->msi_index];
 		mc_dev_irq->msi_desc = msi_desc;
 		mc_dev_irq->resource.id = msi_desc->irq;
 	}
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -29,7 +29,7 @@ static irq_hw_number_t fsl_mc_domain_cal
 	 * Make the base hwirq value for ICID*10000 so it is readable
 	 * as a decimal value in /proc/interrupts.
 	 */
-	return (irq_hw_number_t)(desc->fsl_mc.msi_index + (dev->icid * 10000));
+	return (irq_hw_number_t)(desc->msi_index + (dev->icid * 10000));
 }
 
 static void fsl_mc_msi_set_desc(msi_alloc_info_t *arg,
@@ -122,7 +122,7 @@ static void fsl_mc_msi_write_msg(struct
 	struct fsl_mc_device *mc_bus_dev = to_fsl_mc_device(msi_desc->dev);
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
 	struct fsl_mc_device_irq *mc_dev_irq =
-		&mc_bus->irq_resources[msi_desc->fsl_mc.msi_index];
+		&mc_bus->irq_resources[msi_desc->msi_index];
 
 	msi_desc->msg = *msg;
 
@@ -235,7 +235,7 @@ static int fsl_mc_msi_alloc_descs(struct
 			goto cleanup_msi_descs;
 		}
 
-		msi_desc->fsl_mc.msi_index = i;
+		msi_desc->msi_index = i;
 		INIT_LIST_HEAD(&msi_desc->list);
 		list_add_tail(&msi_desc->list, dev_to_msi_list(dev));
 	}
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -106,14 +106,6 @@ struct pci_msi_desc {
 };
 
 /**
- * fsl_mc_msi_desc - FSL-MC device specific msi descriptor data
- * @msi_index:		The index of the MSI descriptor
- */
-struct fsl_mc_msi_desc {
-	u16				msi_index;
-};
-
-/**
  * ti_sci_inta_msi_desc - TISCI based INTA specific msi descriptor data
  * @dev_index: TISCI device index
  */
@@ -136,7 +128,6 @@ struct ti_sci_inta_msi_desc {
  *
  * @msi_index:	Index of the msi descriptor
  * @pci:	[PCI]	    PCI speficic msi descriptor data
- * @fsl_mc:	[fsl-mc]    FSL MC device specific msi descriptor data
  * @inta:	[INTA]	    TISCI based INTA specific msi descriptor data
  */
 struct msi_desc {
@@ -157,7 +148,6 @@ struct msi_desc {
 	u16				msi_index;
 	union {
 		struct pci_msi_desc		pci;
-		struct fsl_mc_msi_desc		fsl_mc;
 		struct ti_sci_inta_msi_desc	inta;
 	};
 };


