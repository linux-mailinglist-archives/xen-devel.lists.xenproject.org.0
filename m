Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D491445FA6E
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233759.405962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVy-0004XC-OI; Sat, 27 Nov 2021 01:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233759.405962; Sat, 27 Nov 2021 01:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVy-0004Sz-Cy; Sat, 27 Nov 2021 01:28:30 +0000
Received: by outflank-mailman (input) for mailman id 233759;
 Sat, 27 Nov 2021 01:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMx-00020H-WE
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:19:12 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ed9a5c-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:19:06 +0100 (CET)
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
X-Inumbo-ID: 03ed9a5c-4f20-11ec-9787-a32c541c8605
Message-ID: <20211126223825.205369150@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=nFqFw10FNB3YOwALwDw82lvlHKuNVaj2KNOVAS+AX+k=;
	b=G06m8xMVNgCtY4eLFjx0Gf0UEo7YHbTN3rxfoRgzMAQNjSyOhHLYWl1Ikzcx1das+1sGgR
	XlzQnk85UAa1wgbuHZfRxIv0Tptn0O6ASXyaW+XA4AtRGc5NqoXoMWrH8JyNLO1TbACyNs
	ThrpDSP5owVZnF1lPpqZ5HBhdbbP3377wrFMfqt8kSFjGYtgCoo5Htge03VxxnWqOl6VeU
	qx8+Ka4RU70TZWBrcecHxtKGEd0uRNlpAUNT2tq6ZjXX/PFES+2pneG/ehtJ3MI4dwoNkA
	8VWSPGtF+GW5n1+OGRM2a6VqtOk81cbZ+6zTHUvUBTGOgQayss65pWv38PCcLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=nFqFw10FNB3YOwALwDw82lvlHKuNVaj2KNOVAS+AX+k=;
	b=J3h+hmKrqWBzzv5vAzWUlxB8bJHst//jw7wAG5CmDPYqR+ZozHFkbxD9VTuTA8lDv7Htjr
	HBwohK1y6ZdNv+DQ==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 19/22] PCI/MSI: Sanitize MSIX table map handling
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:04 +0100 (CET)

Unmapping the MSIX base mapping in the loops which allocate/free MSI
desciptors is daft and in the way of allowing runtime expansion of MSI-X
descriptors.

Store the mapping in struct pci_dev and free it after freeing the MSI-X
descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
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


