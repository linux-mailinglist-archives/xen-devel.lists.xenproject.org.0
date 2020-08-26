Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F05252DDC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAuCO-0001vs-Sr; Wed, 26 Aug 2020 12:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu9D-000821-At
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:03:23 +0000
X-Inumbo-ID: 86e831b0-d446-470a-81d9-d79bc0fa86c9
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86e831b0-d446-470a-81d9-d79bc0fa86c9;
 Wed, 26 Aug 2020 12:01:48 +0000 (UTC)
Message-Id: <20200826112334.795343913@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=++RJAb0XwXR6HGwCiKdimUJ+P96gsDP2cTuWDbVCwn8=;
 b=S31zf4KRdKSl+c/54qaBKf9wiJkWSKJKFVO3xb0t8u3lZOBrM+cgNH7LKEKYWzT/y/HwU0
 mI4r8a/uksNI5Vj9EC+f4ho50SX72FhEgvzxuRqkIKlIH5X37IGajDxfGALbvPrnnix18L
 XYH6svrlZFlPJJoWtNXPqV4SuQjzyJuaNpdeRlu/0jh6J9Y5Am5xrIBHDLjgy0Atbv2JoJ
 HN7ySGpQ4wwoj91aEaCckv39Gll7Pv8enAqSOUDLnY7IBSWqKio6eCPc6y+A8zKjrzUQIw
 1fleRXIy5jKI+RdfMzzmocRDunkz9kLkt8ibCm7I0U1OH3q5r64Bp5MTrt68Bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=++RJAb0XwXR6HGwCiKdimUJ+P96gsDP2cTuWDbVCwn8=;
 b=VRfG8jWe0BEQR76gNnsKVNJRq1rafZxZ4YVg3rty4q0d1NS7xGqWPCzx5Fhj9EVpwoneik
 IgeTkQyy30POemBw==
Date: Wed, 26 Aug 2020 13:17:10 +0200
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
Subject: [patch V2 42/46] genirq/proc: Take buslock on affinity write
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

Until now interrupt chips which support setting affinity are nit locking
the associated bus lock for two reasons:

 - All chips which support affinity setting do not use buslock because they just
   can operated directly on the hardware.

 - All chips which use buslock do not support affinity setting because
   their interrupt chips are not capable. These chips are usually connected
   over a bus like I2C, SPI etc. and have an interrupt output which is
   conneted to CPU interrupt of some sort. So there is no way to set the
   affinity on the chip itself.

Upcoming hardware which is PCIE based sports a non standard MSI(X) variant
which stores the MSI message in RAM which is associated to e.g. a device
queue. The device manages this RAM and writes have to be issued via command
queues or similar mechanisms which is obviously not possible from interrupt
disabled, raw spinlock held context.

The buslock mechanism of irq chips can be utilized to support that. The
affinity write to the chip writes to shadow state, marks it pending and the
irq chip's irq_bus_sync_unlock() callback handles the command queue and
wait for completion similar to the other chip operations on I2C or SPI
busses.

Change the locking in irq_set_affinity() to bus_lock/unlock to help with
that. There are a few other callers than the proc interface, but none of
them is affected by this change as none of them affects an irq chip with
bus lock support.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch
---
 kernel/irq/manage.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -373,16 +373,16 @@ int irq_set_affinity_locked(struct irq_d
 
 int __irq_set_affinity(unsigned int irq, const struct cpumask *mask, bool force)
 {
-	struct irq_desc *desc = irq_to_desc(irq);
+	struct irq_desc *desc;
 	unsigned long flags;
 	int ret;
 
+	desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
 	if (!desc)
 		return -EINVAL;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
 	ret = irq_set_affinity_locked(irq_desc_get_irq_data(desc), mask, force);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	irq_put_desc_busunlock(desc, flags);
 	return ret;
 }
 


