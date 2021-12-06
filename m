Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BF46AE27
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240332.416859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMzd-00021e-1h; Mon, 06 Dec 2021 23:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240332.416859; Mon, 06 Dec 2021 23:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMzc-0001yH-Ri; Mon, 06 Dec 2021 23:01:56 +0000
Received: by outflank-mailman (input) for mailman id 240332;
 Mon, 06 Dec 2021 23:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpa-0000Tb-Gz
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:34 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7f24eb-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:34 +0100 (CET)
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
X-Inumbo-ID: 0f7f24eb-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.629363944@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=D1PGUTvbMCo12qSm9MpHyC/iszyAeQMlmvbSI9Ov2K8=;
	b=OIuHnFM2jS5ZUe0SyHLHgoh56x995XYR7j7ckxnVHFyMq9YVqLx5a9t7R6BqvGJcZcaO6A
	uDkqvUWmDaLXd5df6DKsGENAsUyR9ns6fPpuB3ewT3eYa6CrvPrMvDjNEQetMWdTgP/4km
	TWJsQGFfTSzyN7kIlObignVRrFXjnRUJcQgs+Gp48BMuLTRV2/edRl2VQg13M0dm0HM0ck
	aA0lQ0BWUcz5u7bD+L6FTh92yeoQG10Ikohf3DfD4kI9VWyyy8rbo+qlz2532D+CBH+355
	/96REP7yWk9EN3WBUxEFYoZEjOoFU3ommstHPOr2HUa2E6F5WjZrHbH9jMwuJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=D1PGUTvbMCo12qSm9MpHyC/iszyAeQMlmvbSI9Ov2K8=;
	b=mgYtC98T/bzauSx1TiQZDDuYDNriANJt280pKOzYM/g3ZDfwqajvvSIJS8vq+F48uSDuHu
	cCCQUpVJ/vC2mkDA==
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
Subject: [patch V2 19/31] PCI: hv: Rework MSI handling
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:33 +0100 (CET)

Replace the about to vanish iterators and make use of the filtering. Take
the descriptor lock around the iterators.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/controller/pci-hyperv.c |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -3445,18 +3445,23 @@ static int hv_pci_suspend(struct hv_devi
 
 static int hv_pci_restore_msi_msg(struct pci_dev *pdev, void *arg)
 {
-	struct msi_desc *entry;
 	struct irq_data *irq_data;
+	struct msi_desc *entry;
+	int ret = 0;
 
-	for_each_pci_msi_entry(entry, pdev) {
+	msi_lock_descs(&pdev->dev);
+	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_ASSOCIATED) {
 		irq_data = irq_get_irq_data(entry->irq);
-		if (WARN_ON_ONCE(!irq_data))
-			return -EINVAL;
+		if (WARN_ON_ONCE(!irq_data)) {
+			ret = -EINVAL;
+			break;
+		}
 
 		hv_compose_msi_msg(irq_data, &entry->msg);
 	}
+	msi_unlock_descs(&pdev->dev);
 
-	return 0;
+	return ret;
 }
 
 /*


