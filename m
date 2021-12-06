Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36746AC3B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239922.416022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbS-0003ba-IA; Mon, 06 Dec 2021 22:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239922.416022; Mon, 06 Dec 2021 22:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbS-0003ZZ-ET; Mon, 06 Dec 2021 22:36:58 +0000
Received: by outflank-mailman (input) for mailman id 239922;
 Mon, 06 Dec 2021 22:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSu-0001m5-9V
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:28:08 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5a5259c-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:28:01 +0100 (CET)
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
X-Inumbo-ID: c5a5259c-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210225.101336873@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DA21nVmLDiBI7abTCMjgj20KY6xV+oZ7nL3Tb95GpzU=;
	b=tUgqDZDZ/EiCdKplAETvDx9zP2J7lXVbAOyLOoBuYDH6TGhvuPG60E8xxxj2easlDQNPkn
	zTUdmJbnIRjdW2jZn22BV2YC4f0v6JUg4B85PNY0gmnqpQ/sN1zmKIaFOZKwqGTNC8Cwta
	Zuzg0fNd26HEMDHArMjtG0lzJFq888jFDvle1JTBYdcc+inM3sPjBJytAfcyCtrn23O2UA
	KEo+a2AtJrT7M4ZyZw3GWFzmCrk8w7SJ8if/eriSWmpCeXjmWpgB3652GOnCNeZesHt7bK
	srYzZDxpjI6VQFY1vaT/mjtrbyNnxnAjKtFj8+UQL1Hs+wIUbfpLlFZD9d5QMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DA21nVmLDiBI7abTCMjgj20KY6xV+oZ7nL3Tb95GpzU=;
	b=MCrfZbg73639x4t4CYmepEMeEst8qlRnGzxNB/5IvDcEPSsvluAaurSvCLQW1KB8HRZ02F
	1dXwMChHv9TjP5Cw==
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
 Juergen Gross <jgross@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 23/23] PCI/MSI: Move descriptor counting on allocation fail
 to the legacy code
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:28:00 +0100 (CET)

The irqdomain code already returns the information. Move the loop to the
legacy code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/legacy.c |   20 +++++++++++++++++++-
 drivers/pci/msi/msi.c    |   19 +------------------
 2 files changed, 20 insertions(+), 19 deletions(-)

--- a/drivers/pci/msi/legacy.c
+++ b/drivers/pci/msi/legacy.c
@@ -50,9 +50,27 @@ void __weak arch_teardown_msi_irqs(struc
 	}
 }
 
+static int pci_msi_setup_check_result(struct pci_dev *dev, int type, int ret)
+{
+	struct msi_desc *entry;
+	int avail = 0;
+
+	if (type != PCI_CAP_ID_MSIX || ret >= 0)
+		return ret;
+
+	/* Scan the MSI descriptors for successfully allocated ones. */
+	for_each_pci_msi_entry(entry, dev) {
+		if (entry->irq != 0)
+			avail++;
+	}
+	return avail ? avail : ret;
+}
+
 int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
-	return arch_setup_msi_irqs(dev, nvec, type);
+	int ret = arch_setup_msi_irqs(dev, nvec, type);
+
+	return pci_msi_setup_check_result(dev, type, ret);
 }
 
 void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev)
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -609,7 +609,7 @@ static int msix_capability_init(struct p
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
-		goto out_avail;
+		goto out_free;
 
 	/* Check if all MSI entries honor device restrictions */
 	ret = msi_verify_entries(dev);
@@ -634,23 +634,6 @@ static int msix_capability_init(struct p
 	pcibios_free_irq(dev);
 	return 0;
 
-out_avail:
-	if (ret < 0) {
-		/*
-		 * If we had some success, report the number of IRQs
-		 * we succeeded in setting up.
-		 */
-		struct msi_desc *entry;
-		int avail = 0;
-
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->irq != 0)
-				avail++;
-		}
-		if (avail != 0)
-			ret = avail;
-	}
-
 out_free:
 	free_msi_irqs(dev);
 


