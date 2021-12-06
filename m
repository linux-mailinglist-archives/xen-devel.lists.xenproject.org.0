Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E911846AE12
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240252.416749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMxH-0003ur-MK; Mon, 06 Dec 2021 22:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240252.416749; Mon, 06 Dec 2021 22:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMxH-0003sJ-IS; Mon, 06 Dec 2021 22:59:31 +0000
Received: by outflank-mailman (input) for mailman id 240252;
 Mon, 06 Dec 2021 22:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpf-0000Tb-94
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1252291d-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:38 +0100 (CET)
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
X-Inumbo-ID: 1252291d-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210748.793119155@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=GUR2OxklGtF7nIOBqOyJrqx9CLAOqYt69MVFmzr2xdI=;
	b=nn7dEwkEAkvWRKbdApCe1Nm/bB6LC9VNn6X6hBZTCaCIYeYxE+VrS7/Mtl1kphsy8a/Q23
	kjB4YpSOhYoMrj7ErcNmK8M8f0lj0Y59umb1wroZ3CNKfFENgr+n8OkJ6r8b3o/v1b8yXW
	b7ndtXG/q2hCY9j6o4RicdXwGGzUa/M29ROck6jbO2NDHydrPYG9wL2lRiWRf/AFhMUQt1
	iLIG8S61ibfICnkXqLvCZK6jr50bd2s65rfMK1h0boqu09T3/hPzNOypVDSANi0qi3ySMa
	qOn/Tsktc2oYmhtwz6s1KlZz+zosMMfgyON0d7vskLdthwamU1D2s5rhVbATcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=GUR2OxklGtF7nIOBqOyJrqx9CLAOqYt69MVFmzr2xdI=;
	b=8CfzsmQ7CNDe0nMTxrF9BsEbKCFk5GvK6bcHAeaT1wkDGjUkuPIqDQJmgOzxewvdhSqDDu
	CQ5LX8F2K+7lXrAA==
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
Subject: [patch V2 22/31] soc: ti: ti_sci_inta_msi: Remove
 ti_sci_inta_msi_domain_free_irqs()
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:37 +0100 (CET)

The function has no users and is pointless now that the core frees the MSI
descriptors, which means potential users can just use msi_domain_free_irqs().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/soc/ti/ti_sci_inta_msi.c       |    6 ------
 include/linux/soc/ti/ti_sci_inta_msi.h |    1 -
 2 files changed, 7 deletions(-)

--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -121,9 +121,3 @@ int ti_sci_inta_msi_domain_alloc_irqs(st
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
-
-void ti_sci_inta_msi_domain_free_irqs(struct device *dev)
-{
-	msi_domain_free_irqs(dev->msi.domain, dev);
-}
-EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_free_irqs);
--- a/include/linux/soc/ti/ti_sci_inta_msi.h
+++ b/include/linux/soc/ti/ti_sci_inta_msi.h
@@ -18,5 +18,4 @@ struct irq_domain
 				   struct irq_domain *parent);
 int ti_sci_inta_msi_domain_alloc_irqs(struct device *dev,
 				      struct ti_sci_resource *res);
-void ti_sci_inta_msi_domain_free_irqs(struct device *dev);
 #endif /* __INCLUDE_LINUX_IRQCHIP_TI_SCI_INTA_H */


