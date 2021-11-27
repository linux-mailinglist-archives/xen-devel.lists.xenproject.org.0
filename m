Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E545F995
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233610.405502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSF-000545-Mw; Sat, 27 Nov 2021 01:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233610.405502; Sat, 27 Nov 2021 01:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmSF-00050t-IE; Sat, 27 Nov 2021 01:24:39 +0000
Received: by outflank-mailman (input) for mailman id 233610;
 Sat, 27 Nov 2021 01:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSE-0004gG-2S
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:38 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ef161c-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:24:37 +0100 (CET)
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
X-Inumbo-ID: c8ef161c-4f20-11ec-b941-1df2895da90e
Message-ID: <20211127000918.723637256@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wAZLS4DVWG/31wPrjnVkWgrCpcsyPlNJgofX29BhKpw=;
	b=ACnXSfNOqewTY1/+Ig8VGJiP7Eq/Hu3Mv+SGL6FsmDIQqkFvprL4HbnwzMigRxHJsUCQvX
	HYkIGqFfPnBUVK2Gp7ida8axPvoyCJrV5eUDwLgcQ+4I3ZmFIlXQq+B2eKHdf/fcE1U1kz
	nsJU3n6d/XTfa5q6bmvRi8fkPmovjaBqt6w9idFgxeAybfsJaqycBHPeVheTi6QyrV5Psx
	KOVZkP2bvoI2OhezNabehmrvAH9DGlp9mLePq4eOKWdL5Z4w8GKb6RlfsGS1+ycA+No2jo
	M8NZR22qHu1LYfXAVJz7WDPCBDty/gbpCOtMDvTOca33CRTlhogVdVU/Bm1JEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wAZLS4DVWG/31wPrjnVkWgrCpcsyPlNJgofX29BhKpw=;
	b=vw0tiCuP5ldLG61m2bCrJEknO6vxY4QAx1hiFFMZvgHkZRCNmVTavfIu2AmwcqvFT1i30V
	Q2Dw304vuVxzBZDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 04/10] genirq/msi: Prepare MSI domain alloc/free for range irq
 allocation
References: <20211126233124.618283684@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:24:36 +0100 (CET)

Make the iterators in the allocation and free functions range based.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/irq/msi.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -877,6 +877,7 @@ int __msi_domain_alloc_irqs(struct irq_d
 	msi_alloc_info_t arg = { };
 	unsigned int vflags = 0;
 	struct msi_desc *desc;
+	unsigned long idx;
 	int allocated = 0;
 	int i, ret, virq;
 
@@ -906,7 +907,10 @@ int __msi_domain_alloc_irqs(struct irq_d
 			vflags |= VIRQ_NOMASK_QUIRK;
 	}
 
-	msi_for_each_desc(desc, dev, MSI_DESC_NOTASSOCIATED) {
+	xa_for_each_range(&dev->msi.data->store, idx, desc, range->first, range->last) {
+		if (!msi_desc_match(desc, MSI_DESC_NOTASSOCIATED))
+			continue;
+
 		ops->set_desc(&arg, desc);
 
 		virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
@@ -999,10 +1003,14 @@ void __msi_domain_free_irqs(struct irq_d
 	struct msi_domain_info *info = domain->host_data;
 	struct irq_data *irqd;
 	struct msi_desc *desc;
+	unsigned long idx;
 	int i;
 
 	/* Only handle MSI entries which have an interrupt associated */
-	msi_for_each_desc(desc, dev, MSI_DESC_ASSOCIATED) {
+	xa_for_each_range(&dev->msi.data->store, idx, desc, range->first, range->last) {
+		if (!msi_desc_match(desc, MSI_DESC_ASSOCIATED))
+			continue;
+
 		/* Make sure all interrupts are deactivated */
 		for (i = 0; i < desc->nvec_used; i++) {
 			irqd = irq_domain_get_irq_data(domain, desc->irq + i);


