Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E246AE1A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240282.416771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyO-0005wk-At; Mon, 06 Dec 2021 23:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240282.416771; Mon, 06 Dec 2021 23:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyO-0005uM-6S; Mon, 06 Dec 2021 23:00:40 +0000
Received: by outflank-mailman (input) for mailman id 240282;
 Mon, 06 Dec 2021 23:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpc-0008NM-4Y
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10654d0b-56e7-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:51:35 +0100 (CET)
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
X-Inumbo-ID: 10654d0b-56e7-11ec-a5e1-b9374ead2679
Message-ID: <20211206210748.683004012@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=s/VOVQMyDYcB6+dcIQa54u5N9xLv27CFi4i5YMxXHXY=;
	b=4smyVig+0kG3Mj5Ff5573pxp5MUbsQE22Dot8kdArwx554E4qvBjgUNwsUFirP6FIXpq/2
	jLneA+N6EazSPge6uWP1/APnqcC/TEJttmN3r4EXFJG0zTQRnbXFshy/BKu3cMk8DYT4TI
	a1LWuN2gtGyLccsm080S5fJ3L4OIiaLJNWRl9xqpeK6tqEuWTOBTcjH6mXifIaF3tB799u
	ykw64cq3FSqDk3968loa4xhNN2kfvB5Ow9lKi8cAP09S0tlG4eZsgu09LMzUDXCW+QStem
	T6+4q+ZhI9z4g6e+lVp0DHz4KnOAJBpwgHEJba+DAXSr453HDRrdudBJq9DUbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=s/VOVQMyDYcB6+dcIQa54u5N9xLv27CFi4i5YMxXHXY=;
	b=/dhk0ATnFXvIqHsCnqzQC/b2Yp0LVMLjufNEI55WRSEferFEbY3QW5BRA9ipZqGQCt/Tv0
	yttXqgSSg8GY1rAA==
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
 Logan Gunthorpe <logang@deltatee.com>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [patch V2 20/31] NTB/msi: Convert to msi_on_each_desc()
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:34 +0100 (CET)

Replace the about to vanish iterators, make use of the filtering and take
the descriptor lock around the iteration.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Allen Hubbe <allenbh@gmail.com>
Cc: linux-ntb@googlegroups.com
---
 drivers/ntb/msi.c |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -108,8 +108,10 @@ int ntb_msi_setup_mws(struct ntb_dev *nt
 	if (!ntb->msi)
 		return -EINVAL;
 
-	desc = first_msi_entry(&ntb->pdev->dev);
+	msi_lock_descs(&ntb->pdev->dev);
+	desc = msi_first_desc(&ntb->pdev->dev, MSI_DESC_ASSOCIATED);
 	addr = desc->msg.address_lo + ((uint64_t)desc->msg.address_hi << 32);
+	msi_unlock_descs(&ntb->pdev->dev);
 
 	for (peer = 0; peer < ntb_peer_port_count(ntb); peer++) {
 		peer_widx = ntb_peer_highest_mw_idx(ntb, peer);
@@ -281,13 +283,15 @@ int ntbm_msi_request_threaded_irq(struct
 				  const char *name, void *dev_id,
 				  struct ntb_msi_desc *msi_desc)
 {
+	struct device *dev = &ntb->pdev->dev;
 	struct msi_desc *entry;
 	int ret;
 
 	if (!ntb->msi)
 		return -EINVAL;
 
-	for_each_pci_msi_entry(entry, ntb->pdev) {
+	msi_lock_descs(dev);
+	msi_for_each_desc(entry, dev, MSI_DESC_ASSOCIATED) {
 		if (irq_has_action(entry->irq))
 			continue;
 
@@ -304,14 +308,17 @@ int ntbm_msi_request_threaded_irq(struct
 		ret = ntbm_msi_setup_callback(ntb, entry, msi_desc);
 		if (ret) {
 			devm_free_irq(&ntb->dev, entry->irq, dev_id);
-			return ret;
+			goto unlock;
 		}
 
-
-		return entry->irq;
+		ret = entry->irq;
+		goto unlock;
 	}
+	ret = -ENODEV;
 
-	return -ENODEV;
+unlock:
+	msi_unlock_descs(dev);
+	return ret;
 }
 EXPORT_SYMBOL(ntbm_msi_request_threaded_irq);
 


