Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22DE46ABB3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239886.415920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSR-0003cR-Ko; Mon, 06 Dec 2021 22:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239886.415920; Mon, 06 Dec 2021 22:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSR-0003Zy-CP; Mon, 06 Dec 2021 22:27:39 +0000
Received: by outflank-mailman (input) for mailman id 239886;
 Mon, 06 Dec 2021 22:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSQ-0001m5-Ee
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:38 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7824a62-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:27:37 +0100 (CET)
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
X-Inumbo-ID: b7824a62-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210224.265589103@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=OKsXQmZewVMh9C4veaPA025YU+pW4cMZqzIAn23b/9c=;
	b=vZzNCRO+uOrMt1rLYUlSjWHvY3GnOwXQ/odIk4OnimL55yM4E7H9Z+gKxR4cdWzJuc9jJT
	M0aZip9AGf/BRov7wd4DUsRP6NuHKtBNXayKEfTNAPYWG4mlPDCTJXpLfq+Eq2Q7uel0c0
	GCYlxK1amEskkZn0CPcuIPlwQANt3pdUSVU0mXb6Dh6glegghN2NwscVEl8RJS6xJpYmzr
	0oSjRQ0h7Lm4xi7TTTOAuPFvY1F1jeW22TqUuxURSvBD6YjS5m5HOdgSgSZmuNW7/hljHH
	0p6i/mhLMFw2u59Zr1gi+Goyq9OYh0ugIdb202nzF0CcX0f/aD/i2jlLaPiQJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=OKsXQmZewVMh9C4veaPA025YU+pW4cMZqzIAn23b/9c=;
	b=M/NxrnxGKVPLqAlsqI5UQ6dl9IZUEhUwGcQJKRyC/Ho89KfJQzOP0MU4EFQc7/B84xAAnW
	7QekxbEDbxz2NvAA==
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
Subject: [patch V2 08/23] PCI/sysfs: Use pci_irq_vector()
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:36 +0100 (CET)

instead of fiddling with msi descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/pci-sysfs.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -62,11 +62,8 @@ static ssize_t irq_show(struct device *d
 	 * For MSI, show the first MSI IRQ; for all other cases including
 	 * MSI-X, show the legacy INTx IRQ.
 	 */
-	if (pdev->msi_enabled) {
-		struct msi_desc *desc = first_pci_msi_entry(pdev);
-
-		return sysfs_emit(buf, "%u\n", desc->irq);
-	}
+	if (pdev->msi_enabled)
+		return sysfs_emit(buf, "%u\n", pci_irq_vector(pdev, 0));
 #endif
 
 	return sysfs_emit(buf, "%u\n", pdev->irq);


