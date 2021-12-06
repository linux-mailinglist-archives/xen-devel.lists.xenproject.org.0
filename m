Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC17E46AC3D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239924.416028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbS-0003fn-QQ; Mon, 06 Dec 2021 22:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239924.416028; Mon, 06 Dec 2021 22:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMbS-0003bW-M7; Mon, 06 Dec 2021 22:36:58 +0000
Received: by outflank-mailman (input) for mailman id 239924;
 Mon, 06 Dec 2021 22:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSh-0001m5-SA
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:55 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1d4999a-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:27:55 +0100 (CET)
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
X-Inumbo-ID: c1d4999a-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210224.871651518@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=S+W1Q0LZK9qA36CwaGMZKKV+Y38NSAQ6cljplijOq1c=;
	b=Ir8wMJVOR0vRWYRtvVvvwdh8vk+hNLZauyW7VLWKrRT++IgOgmGu+iffTCxfxNnPnp/eUL
	rTyGHuAWLoqtYLFd0zuaiTQla2JtOb0eBIYhLEtEk9jZ3FXwQz4l6Rl7X4EP2BZT/nLmZG
	gB4XgEyUu0cKAWYBqXdGzv1j+4khf3rt8PXLnTT7HslbLMvlblRWmeFO493rPXuzAQNQvD
	pdevv23YcY11nJ5sRpy9ritQyb0MV8xDifB3U1aMs4fGqJo2CjNucLCPr7Kd6QZ00kkwLx
	CpF8pwB2sHyy6TwKDjA1aIW9IsWvP1KTSYgKnNKZ+NMAS6BpK3f7cHa0u/cYAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=S+W1Q0LZK9qA36CwaGMZKKV+Y38NSAQ6cljplijOq1c=;
	b=YM/Nr8za192FA3caYGvQ8jFv+3Zicdz432O3rHkigtDdu6sexgOdl0L4qhS98KEbr6kSi1
	mc4fbpLRQSX5C0DA==
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
Subject: [patch V2 19/23] PCI/MSI: Sanitize MSIX table map handling
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:54 +0100 (CET)

Unmapping the MSIX base mapping in the loops which allocate/free MSI
desciptors is daft and in the way of allowing runtime expansion of MSI-X
descriptors.

Store the mapping in struct pci_dev and free it after freeing the MSI-X
descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/msi.c |   18 ++++++++----------
 include/linux/pci.h   |    1 +
 2 files changed, 9 insertions(+), 10 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -241,14 +241,14 @@ static void free_msi_irqs(struct pci_dev
 	pci_msi_teardown_msi_irqs(dev);
 
 	list_for_each_entry_safe(entry, tmp, msi_list, list) {
-		if (entry->pci.msi_attrib.is_msix) {
-			if (list_is_last(&entry->list, msi_list))
-				iounmap(entry->pci.mask_base);
-		}
-
 		list_del(&entry->list);
 		free_msi_entry(entry);
 	}
+
+	if (dev->msix_base) {
+		iounmap(dev->msix_base);
+		dev->msix_base = NULL;
+	}
 }
 
 static void pci_intx_for_msi(struct pci_dev *dev, int enable)
@@ -501,10 +501,6 @@ static int msix_setup_entries(struct pci
 	for (i = 0, curmsk = masks; i < nvec; i++) {
 		entry = alloc_msi_entry(&dev->dev, 1, curmsk);
 		if (!entry) {
-			if (!i)
-				iounmap(base);
-			else
-				free_msi_irqs(dev);
 			/* No enough memory. Don't try again */
 			ret = -ENOMEM;
 			goto out;
@@ -602,12 +598,14 @@ static int msix_capability_init(struct p
 		goto out_disable;
 	}
 
+	dev->msix_base = base;
+
 	/* Ensure that all table entries are masked. */
 	msix_mask_all(base, tsize);
 
 	ret = msix_setup_entries(dev, base, entries, nvec, affd);
 	if (ret)
-		goto out_disable;
+		goto out_free;
 
 	ret = pci_msi_setup_msi_irqs(dev, nvec, PCI_CAP_ID_MSIX);
 	if (ret)
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -473,6 +473,7 @@ struct pci_dev {
 	u8		ptm_granularity;
 #endif
 #ifdef CONFIG_PCI_MSI
+	void __iomem	*msix_base;
 	const struct attribute_group **msi_irq_groups;
 #endif
 	struct pci_vpd	vpd;


