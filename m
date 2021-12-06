Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251F46ADD3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240198.416715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMvw-0001nS-KI; Mon, 06 Dec 2021 22:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240198.416715; Mon, 06 Dec 2021 22:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMvw-0001lE-H9; Mon, 06 Dec 2021 22:58:08 +0000
Received: by outflank-mailman (input) for mailman id 240198;
 Mon, 06 Dec 2021 22:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpq-0000Tb-AS
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:50 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e45087-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:49 +0100 (CET)
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
X-Inumbo-ID: 18e45087-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210749.170847844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=2+Fbb5gke6gcz4AzBnqqKfV1dHcK3QpqxgzZSH+MZMI=;
	b=bnZaUEhfG0UeeW/OOKDxGmdF+k9dZfJqfLbI9vMgjyaRk4pQVpDJMmF6O8axwELAAGN94P
	p8nkQzlotno6/ca+w9GRpiSzpxX+1DUG8j+XUXVWKMENF72x1B7Kr3ckM7/4pZFIuuAsQN
	n25CnfGvbbv10+BIsZ/F//h9i4CPTqlvkFp2TFSqjZgEKEILeaMbxRqfwi3nkZbiqdACeS
	PXGzLAxQV8xxL2vrQ1Ks3CIFzX2K89ilPRPp673s2mSWCSk85T+lAsvL5z147Il7woZdB5
	YBTe5QZQQTRN2OPRctywvDJyf9a66wKsFwcyDxiLA9agKu9A4ymAB5sDLg3kFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=2+Fbb5gke6gcz4AzBnqqKfV1dHcK3QpqxgzZSH+MZMI=;
	b=bduvthv5f6fp+NqJVG4WpRyqTxwr2VlM9ta1sybZ8puUSEyUg5NAWfkQQ1zDkusuX8+Nki
	Jb1fWgZhNxTGBIDA==
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
Subject:
 [patch V2 29/31] genirq/msi: Add abuse prevention comment to msi header
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:49 +0100 (CET)

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -2,6 +2,20 @@
 #ifndef LINUX_MSI_H
 #define LINUX_MSI_H
 
+/*
+ * This header file contains MSI data structures and functions which are
+ * only relevant for:
+ *	- Interrupt core code
+ *	- PCI/MSI core code
+ *	- MSI interrupt domain implementations
+ *	- IOMMU, low level VFIO, NTB and other justified exceptions
+ *	  dealing with low level MSI details.
+ *
+ * Regular device drivers have no business with any of these functions and
+ * especially storing MSI descriptor pointers in random code is considered
+ * abuse. The only function which is relevant for drivers is msi_get_virq().
+ */
+
 #include <linux/cpumask.h>
 #include <linux/mutex.h>
 #include <linux/list.h>


