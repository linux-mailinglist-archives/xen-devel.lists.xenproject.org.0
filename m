Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060CB252DDE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:06:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAuCR-00022Z-TC; Wed, 26 Aug 2020 12:06:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7q-000821-7S
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:58 +0000
X-Inumbo-ID: e4a67cec-c2d3-410b-b5c2-5d9ed0cf2f28
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4a67cec-c2d3-410b-b5c2-5d9ed0cf2f28;
 Wed, 26 Aug 2020 12:01:16 +0000 (UTC)
Message-Id: <20200826112332.255792469@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=+SoMFjSy3jxF5f7dqPyd8PSV+JeMGK6juDfUnA5hngg=;
 b=2u4vytYI/UB7itfPfJyvcdtqgCSKW46Ox/zzv2XerZ/InxrGE2GWHhUDKlY8KgMdB7HXL0
 aLOdvn+B7AKdSbMuJNLtpZnHpUhROBD88RM3sZNaYgn4L9mRZ01tMg9oUEB7hNqxxpaxWu
 PuWPB9GE8gYW2nV/GNNUJXz2QRA1aGEbBgme8ZLddYRvk8mJdtNuM8JAPZV39AP5FWFg+e
 6mCaujWeR7ty5TW1jh05CxG1dO0TpdiTKJadJRyoTzko/NyP4r516waUKG+f3i3UxKVb33
 jOoOW+eKn8eNokn5EzeqiaAzG15RYHWhPZq+zVKV7VaRVNEAB9gP2x3UcAMe9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=+SoMFjSy3jxF5f7dqPyd8PSV+JeMGK6juDfUnA5hngg=;
 b=PSjOt7VFjQr229YKNjiivKh8I6ovDgS9HVBurRV+6P90PPJdlYxwtL6KbmLSwDXPUAQZH4
 W8RvnGxIZdv3mZBw==
Date: Wed, 26 Aug 2020 13:16:44 +0200
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
Subject: [patch V2 16/46] x86/irq: Consolidate UV domain allocation
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

Move the UV specific fields into their own struct for readability sake. Get
rid of the #ifdeffery as it does not matter at all whether the alloc info
is a couple of bytes longer or not.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/x86/include/asm/hw_irq.h |   21 ++++++++++++---------
 arch/x86/platform/uv/uv_irq.c |   16 ++++++++--------
 2 files changed, 20 insertions(+), 17 deletions(-)

--- a/arch/x86/include/asm/hw_irq.h
+++ b/arch/x86/include/asm/hw_irq.h
@@ -53,6 +53,14 @@ struct ioapic_alloc_info {
 	struct IO_APIC_route_entry	*entry;
 };
 
+struct uv_alloc_info {
+	int		limit;
+	int		blade;
+	unsigned long	offset;
+	char		*name;
+
+};
+
 /**
  * irq_alloc_info - X86 specific interrupt allocation info
  * @type:	X86 specific allocation type
@@ -64,7 +72,8 @@ struct ioapic_alloc_info {
  * @data:	Allocation specific data
  *
  * @ioapic:	IOAPIC specific allocation data
- */
+ * @uv:		UV specific allocation data
+*/
 struct irq_alloc_info {
 	enum irq_alloc_type	type;
 	u32			flags;
@@ -76,6 +85,8 @@ struct irq_alloc_info {
 
 	union {
 		struct ioapic_alloc_info	ioapic;
+		struct uv_alloc_info		uv;
+
 		int		unused;
 #ifdef	CONFIG_PCI_MSI
 		struct {
@@ -83,14 +94,6 @@ struct irq_alloc_info {
 			irq_hw_number_t	msi_hwirq;
 		};
 #endif
-#ifdef	CONFIG_X86_UV
-		struct {
-			int		uv_limit;
-			int		uv_blade;
-			unsigned long	uv_offset;
-			char		*uv_name;
-		};
-#endif
 	};
 };
 
--- a/arch/x86/platform/uv/uv_irq.c
+++ b/arch/x86/platform/uv/uv_irq.c
@@ -90,15 +90,15 @@ static int uv_domain_alloc(struct irq_do
 
 	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
 	if (ret >= 0) {
-		if (info->uv_limit == UV_AFFINITY_CPU)
+		if (info->uv.limit == UV_AFFINITY_CPU)
 			irq_set_status_flags(virq, IRQ_NO_BALANCING);
 		else
 			irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
 
-		chip_data->pnode = uv_blade_to_pnode(info->uv_blade);
-		chip_data->offset = info->uv_offset;
+		chip_data->pnode = uv_blade_to_pnode(info->uv.blade);
+		chip_data->offset = info->uv.offset;
 		irq_domain_set_info(domain, virq, virq, &uv_irq_chip, chip_data,
-				    handle_percpu_irq, NULL, info->uv_name);
+				    handle_percpu_irq, NULL, info->uv.name);
 	} else {
 		kfree(chip_data);
 	}
@@ -193,10 +193,10 @@ int uv_setup_irq(char *irq_name, int cpu
 
 	init_irq_alloc_info(&info, cpumask_of(cpu));
 	info.type = X86_IRQ_ALLOC_TYPE_UV;
-	info.uv_limit = limit;
-	info.uv_blade = mmr_blade;
-	info.uv_offset = mmr_offset;
-	info.uv_name = irq_name;
+	info.uv.limit = limit;
+	info.uv.blade = mmr_blade;
+	info.uv.offset = mmr_offset;
+	info.uv.name = irq_name;
 
 	return irq_domain_alloc_irqs(domain, 1,
 				     uv_blade_to_memory_nid(mmr_blade), &info);



