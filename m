Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48EE2D6704
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49709.87968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRpt-00080Z-8B; Thu, 10 Dec 2020 19:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49709.87968; Thu, 10 Dec 2020 19:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRps-0007zL-QU; Thu, 10 Dec 2020 19:42:44 +0000
Received: by outflank-mailman (input) for mailman id 49709;
 Thu, 10 Dec 2020 19:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRpq-0007NY-Hc
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:42:42 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8510efe7-e1de-4095-840d-46e2bdeb12cf;
 Thu, 10 Dec 2020 19:42:24 +0000 (UTC)
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
X-Inumbo-ID: 8510efe7-e1de-4095-840d-46e2bdeb12cf
Message-Id: <20201210194043.268774449@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=KtzFp0nR+dJW1v891+1wc4D+KUTADWJVxpq6j1ykdfo=;
	b=BwWrBYP0c3Z0lFh3V6qC90H7c5G9PHEfLbQKd0hztOiqwJ4kBCiNk+VDHIcCk1P/HxJJE+
	zt6CbhOUy0zFcpFdRmOFsyfb9chR0Qx1RUaHNJMzGPe4/YSaExFvgbHq6rbAS7kLyxP5tj
	50aob2dpVHhgmHdoE9LrAgft46kAteQH0u20dVmWOXNd76SQCmuGq0ygZQrP10YFFulxyu
	/qBwgM/QVkALrmRL+BjjJvZRX8irP6Tqn07c/GO5qIfUgWd74BWRs6KIHsrquTbtL84IH6
	+M3rrImgxsn11U5KirO7h0p+JsOWwXjhPDlffX4TftaAXSN1Xiplo1xF1UMXlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=KtzFp0nR+dJW1v891+1wc4D+KUTADWJVxpq6j1ykdfo=;
	b=YlMcwWy3vQ5LbjypUKpYuIGaMi15XbC955aXBdrVoJspoFoOrPcJRpjqt+rHhF7aRCDnxi
	VzPUfEGKZfuiRjBQ==
Date: Thu, 10 Dec 2020 20:25:43 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-pci@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 07/30] genirq: Make kstat_irqs() static
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

No more users outside the core code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/kernel_stat.h |    1 -
 kernel/irq/irqdesc.c        |   19 ++++++-------------
 2 files changed, 6 insertions(+), 14 deletions(-)

--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -67,7 +67,6 @@ static inline unsigned int kstat_softirq
 /*
  * Number of interrupts per specific IRQ source, since bootup
  */
-extern unsigned int kstat_irqs(unsigned int irq);
 extern unsigned int kstat_irqs_usr(unsigned int irq);
 
 /*
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -924,15 +924,7 @@ static bool irq_is_nmi(struct irq_desc *
 	return desc->istate & IRQS_NMI;
 }
 
-/**
- * kstat_irqs - Get the statistics for an interrupt
- * @irq:	The interrupt number
- *
- * Returns the sum of interrupt counts on all cpus since boot for
- * @irq. The caller must ensure that the interrupt is not removed
- * concurrently.
- */
-unsigned int kstat_irqs(unsigned int irq)
+static unsigned int kstat_irqs(unsigned int irq)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
 	unsigned int sum = 0;
@@ -951,13 +943,14 @@ unsigned int kstat_irqs(unsigned int irq
 }
 
 /**
- * kstat_irqs_usr - Get the statistics for an interrupt
+ * kstat_irqs_usr - Get the statistics for an interrupt from thread context
  * @irq:	The interrupt number
  *
  * Returns the sum of interrupt counts on all cpus since boot for @irq.
- * Contrary to kstat_irqs() this can be called from any context.
- * It uses rcu since a concurrent removal of an interrupt descriptor is
- * observing an rcu grace period before delayed_free_desc()/irq_kobj_release().
+ *
+ * It uses rcu to protect the access since a concurrent removal of an
+ * interrupt descriptor is observing an rcu grace period before
+ * delayed_free_desc()/irq_kobj_release().
  */
 unsigned int kstat_irqs_usr(unsigned int irq)
 {


