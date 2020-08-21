Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDD24CA30
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:17:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wc3-0002HI-JM; Fri, 21 Aug 2020 02:17:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wc1-0002BQ-TU
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:01 +0000
X-Inumbo-ID: e41c6d03-f67b-497d-8370-f97e1e7fd554
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e41c6d03-f67b-497d-8370-f97e1e7fd554;
 Fri, 21 Aug 2020 02:16:49 +0000 (UTC)
Message-Id: <20200821002946.102072199@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=HdiRwW0QBP1llYsOxuGajmw0gw4oc9eOOdN5Md9NR5A=;
 b=MMHS08LkfnEgTXsVoialrqCW9fRJ6AONkb+dykHl1E7z1jSVBMT+2LpAFmpo+8NVarXnD6
 UGbswtCAiv/cqLT2k/YprokRSvKx3qLWDhOCFaqaFqX6sO3O0F49AJVxBSrDd3E/PDWU0r
 iab+jR/ARt1/IQ7gQZ6d76rp5xop1LRLA6f5Hj8nC5kV7Hxj66YnGeCP1AW6zntjn0Ypro
 4nnTRpnlLenDCD6/DvC0Gd/8jlpZyJIEk7ZKrEuvlHlUkC1mQgeS8nyAHPnc1M7H+Vgew6
 NRR6tC+qYhzyo1jGzNFwhpjMG+JvGP6o56Nrnna4/AGsTd4yK/HI6Xi7vJpUcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=HdiRwW0QBP1llYsOxuGajmw0gw4oc9eOOdN5Md9NR5A=;
 b=5yc8X5Q+KF1CbR4X6zA2pQbmGSA2jQgF397Z0fl0uy9EapMQQ5Mpzjqwtw2DtAfEb0sjFt
 qqRq0A6Mw+TS/cCQ==
Date: Fri, 21 Aug 2020 02:24:32 +0200
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
 Jonathan Derrick <jonathan.derrick@intel.com>,
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
Subject: [patch RFC 08/38] x86/irq: Prepare consolidation of irq_alloc_info
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="x86-irq--Prepare-consolidation-of-irq_alloc_info.patch"
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
 


