Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0547F46AE20
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240302.416782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyt-0006pT-J0; Mon, 06 Dec 2021 23:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240302.416782; Mon, 06 Dec 2021 23:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMyt-0006mv-F1; Mon, 06 Dec 2021 23:01:11 +0000
Received: by outflank-mailman (input) for mailman id 240302;
 Mon, 06 Dec 2021 23:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpP-0000Tb-SU
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 092771e1-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:23 +0100 (CET)
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
X-Inumbo-ID: 092771e1-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.251752714@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=JXvHU/eN0iJfDqMWbOd2UGXYgpl11UY148yTUdaqnAk=;
	b=ukVi5c/T0wAHb0tWABPTJaUJemaPo0rn/ubgZey7RWONU6+1fkTEp8z7nsXym15YfPSOE5
	gnuGJ9tYXfPz/XmKxaGw/rWBKd3wGOGsLUyCa5pt6g4Ho/VHynZ8/8qUrkrrzaKdiUKiFA
	yd7Vz3JZgxduDhmYYHK6QE9T/SuQZan/17wKFT2uBdepAeN0onpzHk7FOnaPQvbNSQJa1u
	fcugKzMmwOWAMJs3UC5IftbkkN1qTj6HFNtFF42kTBKqdsIymhLXws2qmGn3EEYWahrvQZ
	/2BGRgdEm7qxuk081PI2V1XUwse1UmYqbcpvcjMWvU3qKsZ7AolzmuPZFyYsQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=JXvHU/eN0iJfDqMWbOd2UGXYgpl11UY148yTUdaqnAk=;
	b=YM0Ywg7edi2ZBxPs7s0TLBjJF3/P4WkZ3tMBbv6SeiU4PPQA1i7E5adkZL6TVwgY/+0w4W
	hrhh523QoFEKpCDg==
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
Subject: [patch V2 12/31] xen/pcifront: Rework MSI handling
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:21 +0100 (CET)

Replace the about to vanish iterators.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/xen-pcifront.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -262,7 +262,7 @@ static int pci_frontend_enable_msix(stru
 	}
 
 	i = 0;
-	for_each_pci_msi_entry(entry, dev) {
+	msi_for_each_desc(entry, &dev->dev, MSI_DESC_NOTASSOCIATED) {
 		op.msix_entries[i].entry = entry->msi_index;
 		/* Vector is useless at this point. */
 		op.msix_entries[i].vector = -1;


