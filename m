Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB0279FC3
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 10:47:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMSKZ-0006zA-KH; Sun, 27 Sep 2020 08:46:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcoZ=DE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kMSKX-0006z5-Rn
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 08:46:50 +0000
X-Inumbo-ID: 88c24f82-d1a7-4d69-84d7-fcb947b32ab2
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88c24f82-d1a7-4d69-84d7-fcb947b32ab2;
 Sun, 27 Sep 2020 08:46:47 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601196405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=3LGtm2OI8qF06h9KMGGQRJ7d4e/B09d0iYRNLqK19DE=;
 b=vtWT6FXNpv1rJGdbEJJKxhxZ2hkowdjPcJEaDMAro5/mwYgF7f2qjEeiKFQSSH9PtTbtjQ
 HsUFQz/Trt8kMSfUg/AQa+Dd6H6TLmp85HgtKhILMKJEBPAXZTlBVlCuBVrTlZ3SWkXObd
 A3uYhH4wFHZJacmbgX2O+NsHMqa/9G2Pkuz65AAv9jSfW+iCB+ZS9fYcuTgvLwKZwmDf/O
 zZgGz9fCusPWYJqd2bYwAHlyXGdEd/MWFvhUhNXr7HHWvB0uTZIwM6dBXR4V6SnJO+mQK+
 WSRcbCQJ++zz1iV8DGtZCO9vHOjRIHe69AAw88TEiMXTyc69NYyY/moKXh9SBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601196405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=3LGtm2OI8qF06h9KMGGQRJ7d4e/B09d0iYRNLqK19DE=;
 b=2lHZQSLVc5ukVdtzXcK6JAqYUmFwK6ZXXzxyFLvvd4IZf5x37NfcDYaGYy6WSVTOsGs4s7
 44wL1Jbt8wkVdCAA==
To: Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 x86@kernel.org, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] x86/apic/msi: Unbreak DMAR and HPET MSI
In-Reply-To: <87tuvltpo5.fsf@nanos.tec.linutronix.de>
Date: Sun, 27 Sep 2020 10:46:44 +0200
Message-ID: <87wo0fli8b.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Switching the DMAR and HPET MSI code to use the generic MSI domain ops
missed to add the flag which tells the core code to update the domain
operations with the defaults. As a consequence the core code crashes
when an interrupt in one of those domains is allocated.

Add the missing flags.

Fixes: 9006c133a422 ("x86/msi: Use generic MSI domain ops")
Reported-by: Qian Cai <cai@redhat.com> 
Reported-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/apic/msi.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -309,6 +309,7 @@ static struct msi_domain_ops dmar_msi_do
 static struct msi_domain_info dmar_msi_domain_info = {
 	.ops		= &dmar_msi_domain_ops,
 	.chip		= &dmar_msi_controller,
+	.flags		= MSI_FLAG_USE_DEF_DOM_OPS,
 };
 
 static struct irq_domain *dmar_get_irq_domain(void)
@@ -408,6 +409,7 @@ static struct msi_domain_ops hpet_msi_do
 static struct msi_domain_info hpet_msi_domain_info = {
 	.ops		= &hpet_msi_domain_ops,
 	.chip		= &hpet_msi_controller,
+	.flags		= MSI_FLAG_USE_DEF_DOM_OPS,
 };
 
 struct irq_domain *hpet_create_irq_domain(int hpet_id)

