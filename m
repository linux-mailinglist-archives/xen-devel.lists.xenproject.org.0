Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10445252D6D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu7c-0000AX-Et; Wed, 26 Aug 2020 12:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7b-000821-6k
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:43 +0000
X-Inumbo-ID: 93db906f-c783-41e2-963f-fe37d60d0d93
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93db906f-c783-41e2-963f-fe37d60d0d93;
 Wed, 26 Aug 2020 12:01:11 +0000 (UTC)
Message-Id: <20200826112331.849577844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1I9yW3eMm4iVQaR5dfVSMWt9KqqPcB0KB7Tj4Yik9Do=;
 b=Vs7Crzs/frt067nyUVkVFJOIQw6uTtI6Y26Uhysh9DPryE0UufkujposG7+OAE/EsM8Fj6
 q4K3EC3m4fL5Pb4heM215T5j1kO+LEzHeBvS8By8A7i7kzyUqiQIyTWi4QCH0bGMk0hYnn
 yFYKTb4rdzNDMUYt0Vm1cxuxsJt3flpfKrnFIPk83LI0HAz5OE6yF0+dr3fbr72J+CMNH9
 6d/IgE4yFEW45kzkwQ4YqiBBQtpptF5MYmWw3wDSkh/WO8XGv61ETXFpnhjd0QRQLw61KT
 BcdS2XHVFOJWNRsyGm+wHedFsUdnwc4F7fV/F3Rawwgl7ORqZ3Bn3zXGFkdqbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1I9yW3eMm4iVQaR5dfVSMWt9KqqPcB0KB7Tj4Yik9Do=;
 b=Msr8qgC+pO20pz2h9JxLzlcZ/HkirmM4OCsAR405gtLWFmI+l5BU2dRBJFB/SeCb3iPUKh
 2tDkTIU4fgHsuKAA==
Date: Wed, 26 Aug 2020 13:16:40 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch V2 12/46] x86/irq: Prepare consolidation of irq_alloc_info
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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

From: Thomas Gleixner <tglx@linutronix.de>

struct irq_alloc_info is a horrible zoo of unnamed structs in a union. Many
of the struct fields can be generic and don't have to be type specific like
hpet_id, ioapic_id...

Provide a generic set of members to prepare for the consolidation. The goal
is to make irq_alloc_info have the same basic member as the generic
msi_alloc_info so generic MSI domain ops can be reused and yet more mess
can be avoided when (non-PCI) device MSI support comes along.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/x86/include/asm/hw_irq.h |   22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

--- a/arch/x86/include/asm/hw_irq.h
+++ b/arch/x86/include/asm/hw_irq.h
@@ -44,10 +44,25 @@ enum irq_alloc_type {
 	X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT,
 };
 
+/**
+ * irq_alloc_info - X86 specific interrupt allocation info
+ * @type:	X86 specific allocation type
+ * @flags:	Flags for allocation tweaks
+ * @devid:	Device ID for allocations
+ * @hwirq:	Associated hw interrupt number in the domain
+ * @mask:	CPU mask for vector allocation
+ * @desc:	Pointer to msi descriptor
+ * @data:	Allocation specific data
+ */
 struct irq_alloc_info {
 	enum irq_alloc_type	type;
 	u32			flags;
-	const struct cpumask	*mask;	/* CPU mask for vector allocation */
+	u32			devid;
+	irq_hw_number_t		hwirq;
+	const struct cpumask	*mask;
+	struct msi_desc		*desc;
+	void			*data;
+
 	union {
 		int		unused;
 #ifdef	CONFIG_HPET_TIMER
@@ -88,11 +103,6 @@ struct irq_alloc_info {
 			char		*uv_name;
 		};
 #endif
-#if IS_ENABLED(CONFIG_VMD)
-		struct {
-			struct msi_desc *desc;
-		};
-#endif
 	};
 };
 



