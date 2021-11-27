Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1645F7E5
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233590.405371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMe-0004V7-UM; Sat, 27 Nov 2021 01:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233590.405371; Sat, 27 Nov 2021 01:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMe-0004P2-Ew; Sat, 27 Nov 2021 01:18:52 +0000
Received: by outflank-mailman (input) for mailman id 233590;
 Sat, 27 Nov 2021 01:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMc-0002cc-CX
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:18:50 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9e47dbe-4f1f-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:18:49 +0100 (CET)
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
X-Inumbo-ID: f9e47dbe-4f1f-11ec-b941-1df2895da90e
Message-ID: <20211126223824.558746009@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=t8fdQf5v0Re3s6aU2w+RDhHEUcAYg2OEvsShj+q+pN4=;
	b=cmxuu0+S0CsZgYZ32HYbpri2Sd336Qg0Z/c81KGZv/d8VT2cx3pO+wemLvUEb8/rZzqWVq
	0Aee2el4uFtUTEwM4NevFSfRRWXl8VsohVUQkWOKC+PX0UQyocXwd13XzgnMnq75EbEPpc
	0XDH6VZ4F6aY7FGjwQjBxCJ7S/gKrxXo/ft3a22JYLKHH+h+Axgwy8gMgGdardXG7mD8wm
	3V4bu8HbHxltFdFVIZbZpYe1L772kd6xKP36Y2xY0IxJPYxSmaQFkKvdAoQKrvZZSPMg4i
	ILG/RGrZ7qSuIfwivCkd64S54zttW12a2Bqgv90Is3DfVoXms2CX5Xi+tguk7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=t8fdQf5v0Re3s6aU2w+RDhHEUcAYg2OEvsShj+q+pN4=;
	b=cZ5icEO1gkVwPGoTe3vcr7yZhvwpxdLRW5DA8ZhfyEhQ1AqnzzWnOcXhvMTVspkGXfUHDc
	LU+g5W5AGkvQPBCg==
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
Subject: [patch 08/22] PCI/sysfs: Use pci_irq_vector()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:47 +0100 (CET)

instead of fiddling with msi descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
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


