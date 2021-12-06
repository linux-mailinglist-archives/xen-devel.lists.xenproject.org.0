Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2846ADCF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240163.416671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMus-0007me-BF; Mon, 06 Dec 2021 22:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240163.416671; Mon, 06 Dec 2021 22:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMus-0007kF-89; Mon, 06 Dec 2021 22:57:02 +0000
Received: by outflank-mailman (input) for mailman id 240163;
 Mon, 06 Dec 2021 22:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpQ-0000Tb-Qa
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:24 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09af890e-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:24 +0100 (CET)
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
X-Inumbo-ID: 09af890e-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.305656158@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Llq/xc7jQ8Xd7gII/ZN8QZkMZgTGCYn2L7HFq42V+hA=;
	b=Z2biEVRp+uIYck8r4Ho+V21YXII6yZ5ZRe38dX2SGGbQEilaMhIIBS+2IEq6sPpnqjPpuN
	qQ+spdcJ5hQdQlkQeo3Sqz9NnuylGzktoi8AVjGh8OmbhMV3HvqkWhBhICHjjvKMJu6p0j
	w+EQFpg9MCXMdPidPi+SrM7XNAY9KM+Z5mHiwpamR4rBy1p2Srmgn8bFkkcswG3lq+7drk
	HiZieyWr3molk0V+3zEapZBf+CgVGomuwIRfjNGQyOdMeaey22DpkF7rcH1ZPM2PBZ/94N
	3qbYP+WoVk0EXQnE2KLkhLs4qGHKpDH6bnwaDLh3XA1tzRqm5ls7hq1S54xFhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Llq/xc7jQ8Xd7gII/ZN8QZkMZgTGCYn2L7HFq42V+hA=;
	b=fV+NCA62RUR8rO/r5/VENKLtT9TPLmuFCqDiM2Pu6iytwciOqUFqiJGeIQfx53iyI8pjpS
	5T4WtTJIXTp/qeDQ==
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
 Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject: [patch V2 13/31] s390/pci: Rework MSI descriptor walk
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:23 +0100 (CET)

Replace the about to vanish iterators and make use of the filtering.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/pci/pci_irq.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- a/arch/s390/pci/pci_irq.c
+++ b/arch/s390/pci/pci_irq.c
@@ -303,7 +303,7 @@ int arch_setup_msi_irqs(struct pci_dev *
 
 	/* Request MSI interrupts */
 	hwirq = bit;
-	for_each_pci_msi_entry(msi, pdev) {
+	msi_for_each_desc(msi, &pdev->dev, MSI_DESC_NOTASSOCIATED) {
 		rc = -EIO;
 		if (hwirq - bit >= msi_vecs)
 			break;
@@ -362,9 +362,7 @@ void arch_teardown_msi_irqs(struct pci_d
 		return;
 
 	/* Release MSI interrupts */
-	for_each_pci_msi_entry(msi, pdev) {
-		if (!msi->irq)
-			continue;
+	msi_for_each_desc(msi, &pdev->dev, MSI_DESC_ASSOCIATED) {
 		irq_set_msi_desc(msi->irq, NULL);
 		irq_free_desc(msi->irq);
 		msi->msg.address_lo = 0;


