Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FE489EE7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 19:13:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255523.437884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6zA6-0001pU-Ps; Mon, 10 Jan 2022 18:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255523.437884; Mon, 10 Jan 2022 18:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6zA6-0001mw-Mk; Mon, 10 Jan 2022 18:12:54 +0000
Received: by outflank-mailman (input) for mailman id 255523;
 Mon, 10 Jan 2022 18:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNae=R2=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1n6zA4-0001mq-RY
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 18:12:53 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea4d805d-7240-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 19:12:50 +0100 (CET)
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
X-Inumbo-ID: ea4d805d-7240-11ec-81c1-a30af7de8005
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1641838366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zo1GoaegfwLq8ByWLgrCdt6kQL15RfNmR27qdFkCXs=;
	b=wg+0jYPkfyXBANMF9DrbB1VZY/A2H3NxCDNL0PdKZaQjveELygI6vChYjpmK8mezF1B8JM
	3Q6Fgd45hThR6NFyrAztLFQW0Du/St5l9y9ZtElwgFl9NDDq0PXVzJtEVKov8EaNRDZ81L
	eVdqnmysikOkVjpjAg882Gsjz6yZ54Uctmk12wQHCofZiwWVPnCbHkpvv4tDyYO3vZLG9w
	e64U20W7FggbG9+ID3eENSFzucC7Eorc5fEgfrJ4OKYz0CE6hPEZM+Xgk2ce8kuvb0VAsa
	X3V2Ri9KCwv0+VUgAxjPNl/CVqXJXoiumYuNcRD9koqxMMscv8p75zWFHCgf8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1641838366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zo1GoaegfwLq8ByWLgrCdt6kQL15RfNmR27qdFkCXs=;
	b=1JyyFqm//sjHNxcOA43/6zXwebeoZM76NF5Ms6lFcm7i8cDw3SAOwzaBpYafr8eAGkMdhU
	XC6nlPN+OSbMq8AQ==
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens
 <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Logan
 Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject: [patch] genirq/msi: Populate sysfs entry only once
In-Reply-To: <20211206210749.224917330@linutronix.de>
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.224917330@linutronix.de>
Date: Mon, 10 Jan 2022 19:12:45 +0100
Message-ID: <87leznqx2a.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

The MSI entries for multi-MSI are populated en bloc for the MSI descriptor,
but the current code invokes the population inside the per interrupt loop
which triggers a warning in the sysfs code and causes the interrupt
allocation to fail.

Move it outside of the loop so it works correctly for single and multi-MSI.

Fixes: bf5e758f02fc ("genirq/msi: Simplify sysfs handling")
Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/irq/msi.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -887,12 +887,11 @@ int __msi_domain_alloc_irqs(struct irq_d
 			ret = msi_init_virq(domain, virq + i, vflags);
 			if (ret)
 				return ret;
-
-			if (info->flags & MSI_FLAG_DEV_SYSFS) {
-				ret = msi_sysfs_populate_desc(dev, desc);
-				if (ret)
-					return ret;
-			}
+		}
+		if (info->flags & MSI_FLAG_DEV_SYSFS) {
+			ret = msi_sysfs_populate_desc(dev, desc);
+			if (ret)
+				return ret;
 		}
 		allocated++;
 	}

