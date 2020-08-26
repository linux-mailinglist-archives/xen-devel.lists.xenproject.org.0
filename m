Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C2252D57
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu7J-0008GH-0l; Wed, 26 Aug 2020 12:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7H-000821-69
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:23 +0000
X-Inumbo-ID: 9b97acc2-aa14-4ae9-8a2e-20ac830da826
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b97acc2-aa14-4ae9-8a2e-20ac830da826;
 Wed, 26 Aug 2020 12:01:03 +0000 (UTC)
Message-Id: <20200826112331.250130127@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1OGPpjWOZmr24XSSpz6Nc6JwYhMQbICDj4hspoAwZbU=;
 b=wxfQv6OayK5u1H6FLXXIAcQEscg4HPJjeG+pstXl+pgdl31DNhEzs50ZOWpxyGkrMjOLQW
 1o9FaSrwh83greTW5vyCTb8zGAVDs36ov93GPrm04pneHRj9I5V1gKWvrEoOOH7jQ4WymB
 2dnYg73pm5Qf+NAJfV1VaexuVCwBhHU44wya2eXAw2Z+FnlfrDPKCol1dSx8jwE8+r40Me
 gFhsh/HnjcO+3pm7neY65BLXMr3nyoULj1GDuHwk6obFDadT45ulfhicTAV256PX5YzSNc
 dGaROF2c7TCDhfRvvityWK3X4gmliC/zDpfaFSui0jbwM5OFgjvjPhruWz0AMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=1OGPpjWOZmr24XSSpz6Nc6JwYhMQbICDj4hspoAwZbU=;
 b=8tJ5SZ+n+CTD4sQz2apdajCK0eVmBiC+58dr8L0pUzWdakVsmFSRzEYppLbMSxQkKBKFP2
 zKDpRtN2h+Z7x/Ag==
Date: Wed, 26 Aug 2020 13:16:34 +0200
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
Subject: [patch V2 06/46] x86/msi: Remove pointless vcpu_affinity callback
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

Setting the irq_set_vcpu_affinity() callback to
irq_chip_set_vcpu_affinity_parent() is a pointless exercise because the
function which utilizes it searchs the domain hierarchy to find a parent
domain which has such a callback.

Remove the useless indirection.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch. The same is probably true for lots of other irq chips.
---
 arch/x86/kernel/apic/msi.c |    1 -
 1 file changed, 1 deletion(-)

--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -278,7 +278,6 @@ static struct irq_chip pci_msi_ir_contro
 	.irq_mask		= pci_msi_mask_irq,
 	.irq_ack		= irq_chip_ack_parent,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
 	.flags			= IRQCHIP_SKIP_SET_WAKE,
 };
 


