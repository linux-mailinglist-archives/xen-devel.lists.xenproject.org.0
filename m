Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5E01DA571
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:27:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBdR-0005eo-8h; Tue, 19 May 2020 23:26:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yeG=7B=amazon.com=prvs=4015a1a96=anchalag@srs-us1.protection.inumbo.net>)
 id 1jbBdQ-0005eI-4b
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:26:56 +0000
X-Inumbo-ID: 3a7705ae-9a28-11ea-a9a0-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a7705ae-9a28-11ea-a9a0-12813bfff9fa;
 Tue, 19 May 2020 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589930816; x=1621466816;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=w1eiGIKxH2xekT/yRQZeyaclvCGnjD5HhlMWQPvovNo=;
 b=CWYHgZqJRdDUtM1HZJEGRWcWAJhyfV/299740EWmc5U8hjOXiYBPwq2k
 XZLmN2NXcD22S4OkWbBa7j+affNhg+dW3gyT+yMKUr+RDrzfI6hylDE91
 JRZpTKEgBKL1zJ1tbLmqrX4LuTXovcH1R+Ts3aJCsPdrgREjwWcRQGxLn w=;
IronPort-SDR: 4zrULB5uLUcsAKAcAvhwiqdH17+b0NBjaHt+iOUxEhsVwTPymE9d12KL3WpgGQklo1tYTus5RN
 BWO//n740XSQ==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="31182266"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 19 May 2020 23:26:53 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id BDAEFA20D6; Tue, 19 May 2020 23:26:51 +0000 (UTC)
Received: from EX13D08UEB001.ant.amazon.com (10.43.60.245) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:26:37 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEB001.ant.amazon.com (10.43.60.245) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:26:37 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 19 May 2020 23:26:37 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 3BF6D40712; Tue, 19 May 2020 23:26:37 +0000 (UTC)
Date: Tue, 19 May 2020 23:26:37 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Subject: [PATCH 05/12] genirq: Shutdown irq chips in suspend/resume during
 hibernation
Message-ID: <fce013fc1348f02b8e4ec61e7a631093c72f993c.1589926004.git.anchalag@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1589926004.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Many legacy device drivers do not implement power management (PM)
functions which means that interrupts requested by these drivers stay
in active state when the kernel is hibernated.

This does not matter on bare metal and on most hypervisors because the
interrupt is restored on resume without any noticable side effects as
it stays connected to the same physical or virtual interrupt line.

The XEN interrupt mechanism is different as it maintains a mapping
between the Linux interrupt number and a XEN event channel. If the
interrupt stays active on hibernation this mapping is preserved but
there is unfortunately no guarantee that on resume the same event
channels are reassigned to these devices. This can result in event
channel conflicts which prevent the affected devices from being
restored correctly.

One way to solve this would be to add the necessary power management
functions to all affected legacy device drivers, but that's a
questionable effort which does not provide any benefits on non-XEN
environments.

The least intrusive and most efficient solution is to provide a
mechanism which allows the core interrupt code to tear down these
interrupts on hibernation and bring them back up again on resume. This
allows the XEN event channel mechanism to assign an arbitrary event
channel on resume without affecting the functionality of these
devices.

Fortunately all these device interrupts are handled by a dedicated XEN
interrupt chip so the chip can be marked that all interrupts connected
to it are handled this way. This is pretty much in line with the other
interrupt chip specific quirks, e.g. IRQCHIP_MASK_ON_SUSPEND.

Add a new quirk flag IRQCHIP_SHUTDOWN_ON_SUSPEND and add support for
it the core interrupt suspend/resume paths.

Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
Signed-off--by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/xen/events/events_base.c |  1 +
 include/linux/irq.h              |  2 ++
 kernel/irq/chip.c                |  2 +-
 kernel/irq/internals.h           |  1 +
 kernel/irq/pm.c                  | 31 ++++++++++++++++++++++---------
 5 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 3a791c8485d0..decf65bd3451 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1613,6 +1613,7 @@ static struct irq_chip xen_pirq_chip __read_mostly = {
 	.irq_set_affinity	= set_affinity_irq,
 
 	.irq_retrigger		= retrigger_dynirq,
+	.flags                  = IRQCHIP_SHUTDOWN_ON_SUSPEND,
 };
 
 static struct irq_chip xen_percpu_chip __read_mostly = {
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8d5bc2c237d7..94cb8c994d06 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -542,6 +542,7 @@ struct irq_chip {
  * IRQCHIP_EOI_THREADED:	Chip requires eoi() on unmask in threaded mode
  * IRQCHIP_SUPPORTS_LEVEL_MSI	Chip can provide two doorbells for Level MSIs
  * IRQCHIP_SUPPORTS_NMI:	Chip can deliver NMIs, only for root irqchips
+ * IRQCHIP_SHUTDOWN_ON_SUSPEND: Shutdown non wake irqs in the suspend path
  */
 enum {
 	IRQCHIP_SET_TYPE_MASKED		= (1 <<  0),
@@ -553,6 +554,7 @@ enum {
 	IRQCHIP_EOI_THREADED		= (1 <<  6),
 	IRQCHIP_SUPPORTS_LEVEL_MSI	= (1 <<  7),
 	IRQCHIP_SUPPORTS_NMI		= (1 <<  8),
+	IRQCHIP_SHUTDOWN_ON_SUSPEND     = (1 <<  9),
 };
 
 #include <linux/irqdesc.h>
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 41e7e37a0928..fd59489ff14b 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -233,7 +233,7 @@ __irq_startup_managed(struct irq_desc *desc, struct cpumask *aff, bool force)
 }
 #endif
 
-static int __irq_startup(struct irq_desc *desc)
+int __irq_startup(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
 	int ret = 0;
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 7db284b10ac9..b6fca5eacff7 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -80,6 +80,7 @@ extern void __enable_irq(struct irq_desc *desc);
 extern int irq_activate(struct irq_desc *desc);
 extern int irq_activate_and_startup(struct irq_desc *desc, bool resend);
 extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
+extern int __irq_startup(struct irq_desc *desc);
 
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index 8f557fa1f4fe..dc48a25f1756 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -85,16 +85,25 @@ static bool suspend_device_irq(struct irq_desc *desc)
 	}
 
 	desc->istate |= IRQS_SUSPENDED;
-	__disable_irq(desc);
-
 	/*
-	 * Hardware which has no wakeup source configuration facility
-	 * requires that the non wakeup interrupts are masked at the
-	 * chip level. The chip implementation indicates that with
-	 * IRQCHIP_MASK_ON_SUSPEND.
+	 * Some irq chips (e.g. XEN PIRQ) require a full shutdown on suspend
+	 * as some of the legacy drivers(e.g. floppy) do nothing during the
+	 * suspend path
 	 */
-	if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
-		mask_irq(desc);
+	if (irq_desc_get_chip(desc)->flags & IRQCHIP_SHUTDOWN_ON_SUSPEND) {
+		irq_shutdown(desc);
+	} else {
+		__disable_irq(desc);
+
+	       /*
+		* Hardware which has no wakeup source configuration facility
+		* requires that the non wakeup interrupts are masked at the
+		* chip level. The chip implementation indicates that with
+		* IRQCHIP_MASK_ON_SUSPEND.
+		*/
+		if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
+			mask_irq(desc);
+	}
 	return true;
 }
 
@@ -152,7 +161,11 @@ static void resume_irq(struct irq_desc *desc)
 	irq_state_set_masked(desc);
 resume:
 	desc->istate &= ~IRQS_SUSPENDED;
-	__enable_irq(desc);
+
+	if (irq_desc_get_chip(desc)->flags & IRQCHIP_SHUTDOWN_ON_SUSPEND)
+		__irq_startup(desc);
+	else
+		__enable_irq(desc);
 }
 
 static void resume_irqs(bool want_early)
-- 
2.24.1.AMZN


