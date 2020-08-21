Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F112724CA29
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:17:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wc6-0002JG-Vf; Fri, 21 Aug 2020 02:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wc6-0002Bb-4F
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:06 +0000
X-Inumbo-ID: 025451c0-2912-416d-8ee7-1b67c62a0832
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 025451c0-2912-416d-8ee7-1b67c62a0832;
 Fri, 21 Aug 2020 02:16:54 +0000 (UTC)
Message-Id: <20200821002946.500438544@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=yYVYsGIC1JN3QDzHJK9SuOYIPe5JO6p6NbW5fm8Jlzc=;
 b=3Jzoygdsjx0fIGRNdM1ePUhTi24PE4EV/PGVMS1ezdy27BoMA+xbIyyXO2uodCxEr9aves
 fdYpw1bs5rVsrgP7AzLM8VaaCXEyC8i2Zr1wpADi8xU69lwniResKlv7g7oG5aHC1Fr8HE
 MtpzX8wYGt47BBbrgvWg11m9R1mmsqh3HIurWdDPM3yx3DeXrT77uOgsk8pzdGJw81uvPA
 phYlOCS/IH9H5LQ0CraxSW2f02IkFbdRgyY8aAt6/Fr/DubfNsygAAnSMThNSyaErpwnWf
 5tLuEswY3ROAjQOn17n/LEmT1mFyMC6m0ejSEVTWjyOjHqvukv0F3HIyr6ZBhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=yYVYsGIC1JN3QDzHJK9SuOYIPe5JO6p6NbW5fm8Jlzc=;
 b=JRFyeoXjz8LdEzy20vpxzfwC4fdt3ZEVXh7UmgCH3f+U5Vn496TJ+YrPyDBzBms8MW+CzY
 f0A7NXs3cE+IE1Bg==
Date: Fri, 21 Aug 2020 02:24:36 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, linux-pci@vger.kernel.org,
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
Subject: [patch RFC 12/38] x86/irq: Consolidate UV domain allocation
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="x86-irq--Consolidate-UV-domain-allocation.patch"
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

Move the UV specific fields into their own struct for readability sake. Get
rid of the #ifdeffery as it does not matter at all whether the alloc info
is a couple of bytes longer or not.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Steve Wahl <steve.wahl@hpe.com>
Cc:  Dimitri Sivanich <sivanich@hpe.com>
Cc: Russ Anderson <rja@hpe.com>
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


