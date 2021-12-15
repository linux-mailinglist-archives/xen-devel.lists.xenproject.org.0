Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43353475E71
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 18:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247491.426747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxXwX-00047x-3F; Wed, 15 Dec 2021 17:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247491.426747; Wed, 15 Dec 2021 17:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxXwW-00046A-VT; Wed, 15 Dec 2021 17:19:52 +0000
Received: by outflank-mailman (input) for mailman id 247491;
 Wed, 15 Dec 2021 17:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjzN=RA=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxXwW-000462-7l
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 17:19:52 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35dc1890-5dcb-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 18:19:50 +0100 (CET)
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
X-Inumbo-ID: 35dc1890-5dcb-11ec-9e60-abaf8a552007
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639588790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8dWZtEdF7LamMiNHDQtUJa+ux0BuM6MSUIqH9b+Hvyo=;
	b=wYhmWV2tAzCQfd9US7tK/sDWCnBbJEkh0toY9VDuwtDZ0a56PMo8BoccPtbLPELWo9I28H
	HKc2neisW5z7nVF58H33hQ6I3JpDjp7x8Kvp/cCgjUvnYD8QdYGH61A1BeXSEXOYr4fYH5
	DLBlYKQg7bDxik0O85eEeU6t0YgTJ460cdP5T6mA0DAEz4t2jvbnSoMRyHmCdRIsX+WU5+
	q/5iZYQod3bSNBGwjqvNjip+w8Kzgei0iFMPfqmZqeU25htKL5R6ykYiRwqQfnG6lFz+mQ
	r3FvWyI39vnZ4v4UgiVkKOdpkffYfcVyqNIiIF+3PGfZRf0ksOR9s1/A7ZSHGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639588790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8dWZtEdF7LamMiNHDQtUJa+ux0BuM6MSUIqH9b+Hvyo=;
	b=lk+vW3OXeYaf8seyWIaOrmuYBvQZ09fZDnlpC9df3JMNaqJ74ZUxSByXPFwmhYxR0MLbL9
	iLeRWTRdVJiovHBA==
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok
 Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org, Cedric Le Goater
 <clg@kaod.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Stuart Yoder
 <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth
 Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, Vinod Koul
 <vkoul@kernel.org>, dmaengine@vger.kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>
Subject: [patch V4 09-02/35] PCI/MSI: Allocate MSI device data on first use
In-Reply-To: <87tuf9rdoj.ffs@tglx>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de> <87tuf9rdoj.ffs@tglx>
Date: Wed, 15 Dec 2021 18:19:49 +0100
Message-ID: <87r1adrdje.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Allocate MSI device data on first use, i.e. when a PCI driver invokes one
of the PCI/MSI enablement functions.

Add a wrapper function to ensure that the ordering vs. pcim_msi_release()
is correct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V4: Adopted to ensure devres ordering
---
 drivers/pci/msi/msi.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -366,6 +366,19 @@ static int pcim_setup_msi_release(struct
 	return ret;
 }
 
+/*
+ * Ordering vs. devres: msi device data has to be installed first so that
+ * pcim_msi_release() is invoked before it on device release.
+ */
+static int pci_setup_msi_context(struct pci_dev *dev)
+{
+	int ret = msi_setup_device_data(&dev->dev);
+
+	if (!ret)
+		ret = pcim_setup_msi_release(dev);
+	return ret;
+}
+
 static struct msi_desc *
 msi_setup_entry(struct pci_dev *dev, int nvec, struct irq_affinity *affd)
 {
@@ -909,7 +922,7 @@ static int __pci_enable_msi_range(struct
 	if (nvec > maxvec)
 		nvec = maxvec;
 
-	rc = pcim_setup_msi_release(dev);
+	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
 
@@ -956,7 +969,7 @@ static int __pci_enable_msix_range(struc
 	if (WARN_ON_ONCE(dev->msix_enabled))
 		return -EINVAL;
 
-	rc = pcim_setup_msi_release(dev);
+	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;
 

