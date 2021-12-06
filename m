Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75346AD04
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240031.416187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlZ-0005F5-7t; Mon, 06 Dec 2021 22:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240031.416187; Mon, 06 Dec 2021 22:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlZ-0005C3-2z; Mon, 06 Dec 2021 22:47:25 +0000
Received: by outflank-mailman (input) for mailman id 240031;
 Mon, 06 Dec 2021 22:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMeE-0004dp-LK
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:50 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be47ab4-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:50 +0100 (CET)
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
X-Inumbo-ID: 6be47ab4-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210439.455293905@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=D2KO9NgXNtQUAyqtWOzZiACp/P45gmD0I5rs+jvB/0o=;
	b=M3Bm84hHvCtrBNwRLdnOJQ8LhTnimeLoUzb7sFPpUvA1MrTtFmPG7jJY3ez6nb6d75oHYZ
	YItW1zlXrieNeQLVv1mja5y6Nsn7Af4+zqcIRigzRA4z6xxKseElSF8My8ONtxtDcbBMxB
	RU2wu+cjJc5BODY4ZEABMlFzsdpRqvn+y6tmMTQMln8ybzz0/Jyujbt0wVvxd67z54pWat
	P6701ltig/ZapqMzfQrWZq5bDgERLGtqI56xSaxFnAfkS9KMlbEOolAF+wr1giyaioGNXC
	q25gnAKxhbPlgLV44h2qmIWZqF0AC+M+K6BlmaYeIgQ0aE/P4MbJxUspA9jGVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=D2KO9NgXNtQUAyqtWOzZiACp/P45gmD0I5rs+jvB/0o=;
	b=dlz4lZgPNqH4tCZ8r0aZLbuaEV9G+vYCQYuS+28ui/Lf3zD0ZPPTaUWTBAlVcJyi4e33Dj
	inujCGHbNZwGyeCg==
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
Subject:
 [patch V2 33/36] mailbox: bcm-flexrm-mailbox: Rework MSI interrupt handling
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:49 +0100 (CET)

No point in retrieving the MSI descriptors. Just query the Linux interrupt
number.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/mailbox/bcm-flexrm-mailbox.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -1497,7 +1497,6 @@ static int flexrm_mbox_probe(struct plat
 	int index, ret = 0;
 	void __iomem *regs;
 	void __iomem *regs_end;
-	struct msi_desc *desc;
 	struct resource *iomem;
 	struct flexrm_ring *ring;
 	struct flexrm_mbox *mbox;
@@ -1608,10 +1607,8 @@ static int flexrm_mbox_probe(struct plat
 		goto fail_destroy_cmpl_pool;
 
 	/* Save alloced IRQ numbers for each ring */
-	for_each_msi_entry(desc, dev) {
-		ring = &mbox->rings[desc->msi_index];
-		ring->irq = desc->irq;
-	}
+	for (index = 0; index < mbox->num_rings; index++)
+		mbox->rings[index].irq = msi_get_virq(dev, index);
 
 	/* Check availability of debugfs */
 	if (!debugfs_initialized())


