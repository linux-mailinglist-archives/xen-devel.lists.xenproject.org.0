Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9C46AE1F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240303.416792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyu-00076S-S9; Mon, 06 Dec 2021 23:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240303.416792; Mon, 06 Dec 2021 23:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyu-00073f-O4; Mon, 06 Dec 2021 23:01:12 +0000
Received: by outflank-mailman (input) for mailman id 240303;
 Mon, 06 Dec 2021 23:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpX-0008NM-7S
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:31 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7ce2ee-56e7-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:51:30 +0100 (CET)
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
X-Inumbo-ID: 0d7ce2ee-56e7-11ec-a5e1-b9374ead2679
Message-ID: <20211206210748.522641685@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ir5jZb4IZcCDGObECwlZouR2K23XLyndrt4jAkdV6zI=;
	b=QOZqkE0mJaaNW80XWv33hPs1zpCYzh+3dsqlRwgrP9IFd97NBJwLLY6Dn+msWsXzzo1V16
	10Edu9RH75xmcw/dicGGO+7NkLpNtC1pr8dlGykvnp06LKXMsjiC6lWwl7DQJ89xWx1ROb
	qXNOY3lAEhxYdjctEGjclYuq6TCu81wIS5l5RtBe8UdHMzMEFlBftu4I2a7JDr9hi7R2uD
	BKUCuOavG9T1GADvBsnPWuhPebbgWNM0iLqM7Ttt3qt5zPgDADKpzIs3JEEvaAlU2+4wwH
	Hbb8jxHi0Qz3jTnDtW+odZgtAOgQMSvZ2v67OLqqe6koizHIu8k3Wa1YRvz5Lg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ir5jZb4IZcCDGObECwlZouR2K23XLyndrt4jAkdV6zI=;
	b=rmBdkPatKzaCW/DyQuCnHCIcksrz3J4ZKrWW0QYtPGJpZFG7lwsct1bXSyTs7E6ooJaZ4l
	dh7biS/tfXnlPlCA==
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
Subject: [patch V2 17/31] powerpc/fsl_msi: Use msi_for_each_desc()
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:29 +0100 (CET)

Replace the about to vanish iterators and make use of the filtering.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/powerpc/sysdev/fsl_msi.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -125,17 +125,13 @@ static void fsl_teardown_msi_irqs(struct
 	struct fsl_msi *msi_data;
 	irq_hw_number_t hwirq;
 
-	for_each_pci_msi_entry(entry, pdev) {
-		if (!entry->irq)
-			continue;
+	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_ASSOCIATED) {
 		hwirq = virq_to_hw(entry->irq);
 		msi_data = irq_get_chip_data(entry->irq);
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
 		msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
 	}
-
-	return;
 }
 
 static void fsl_compose_msi_msg(struct pci_dev *pdev, int hwirq,
@@ -215,7 +211,7 @@ static int fsl_setup_msi_irqs(struct pci
 		}
 	}
 
-	for_each_pci_msi_entry(entry, pdev) {
+	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_NOTASSOCIATED) {
 		/*
 		 * Loop over all the MSI devices until we find one that has an
 		 * available interrupt.


