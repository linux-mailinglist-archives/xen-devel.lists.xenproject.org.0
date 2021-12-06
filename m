Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B655646ABA8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:28:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239888.415937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSU-0004B0-U6; Mon, 06 Dec 2021 22:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239888.415937; Mon, 06 Dec 2021 22:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSU-00042z-Ks; Mon, 06 Dec 2021 22:27:42 +0000
Received: by outflank-mailman (input) for mailman id 239888;
 Mon, 06 Dec 2021 22:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSS-0001m5-FI
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:40 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b82347d2-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:27:39 +0100 (CET)
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
X-Inumbo-ID: b82347d2-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210224.319201379@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=gOhEwOl7pWXAdyfdjPv/xL32Zd5rtVvQRFE5wZzX1CM=;
	b=dvaOjaxxL6xiDQA7FFy4cxQQ/uHU9sUdt6e/yyFwN1tu+bJ1yi46Si+LsK8MUpqWL66GBZ
	2vYuDYX1gMzlWrQlXSNF7Gy5YE1JoRbELnLUr87259Kjgtgb01AkT3/PzG4pDRcVNe6nnu
	ivxMXrLRTAd3saTznKV7mbiAHy2Rtw3hMMQvRO+thrnTc3FA0K+E4ppbPA/2gfw4NYQ+xk
	oJH8E0LDjQDUOmg7euoxTjnOnIPyEBUSb+AO4mByR8WoxcxvvNGBpWjsmNaE7QFybpIRFg
	x8MhqCDCTsZoEj80vUenfUClW3vGGZTwtNcCQ4Iw5T8t8x7oh0OUHc455oO1Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=gOhEwOl7pWXAdyfdjPv/xL32Zd5rtVvQRFE5wZzX1CM=;
	b=jqiplyDoFdSA46RvOetOaqUacacbKtOW+CT5oA5zeEczBM+vXFTNHE6+JVcjlrsieqeQMT
	qjTsGymloYl2PTAw==
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>,
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
Subject: [patch V2 09/23] MIPS: Octeon: Use arch_setup_msi_irq()
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:38 +0100 (CET)

The core code provides the same loop code except for the MSI-X reject. Move
that to arch_setup_msi_irq() and remove the duplicated code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/pci/msi-octeon.c |   32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

--- a/arch/mips/pci/msi-octeon.c
+++ b/arch/mips/pci/msi-octeon.c
@@ -68,6 +68,9 @@ int arch_setup_msi_irq(struct pci_dev *d
 	u64 search_mask;
 	int index;
 
+	if (desc->pci.msi_attrib.is_msix)
+		return -EINVAL;
+
 	/*
 	 * Read the MSI config to figure out how many IRQs this device
 	 * wants.  Most devices only want 1, which will give
@@ -182,35 +185,6 @@ int arch_setup_msi_irq(struct pci_dev *d
 	return 0;
 }
 
-int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	struct msi_desc *entry;
-	int ret;
-
-	/*
-	 * MSI-X is not supported.
-	 */
-	if (type == PCI_CAP_ID_MSIX)
-		return -EINVAL;
-
-	/*
-	 * If an architecture wants to support multiple MSI, it needs to
-	 * override arch_setup_msi_irqs()
-	 */
-	if (type == PCI_CAP_ID_MSI && nvec > 1)
-		return 1;
-
-	for_each_pci_msi_entry(entry, dev) {
-		ret = arch_setup_msi_irq(dev, entry);
-		if (ret < 0)
-			return ret;
-		if (ret > 0)
-			return -ENOSPC;
-	}
-
-	return 0;
-}
-
 /**
  * Called when a device no longer needs its MSI interrupts. All
  * MSI interrupts for the device are freed.


