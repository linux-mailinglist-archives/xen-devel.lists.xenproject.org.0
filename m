Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E392D6701
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49697.87872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRpY-0007Qb-68; Thu, 10 Dec 2020 19:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49697.87872; Thu, 10 Dec 2020 19:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRpY-0007Q3-1q; Thu, 10 Dec 2020 19:42:24 +0000
Received: by outflank-mailman (input) for mailman id 49697;
 Thu, 10 Dec 2020 19:42:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRpW-0007NY-Gw
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:42:22 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e761b325-a2c4-429c-bd01-edc5f9648da7;
 Thu, 10 Dec 2020 19:42:17 +0000 (UTC)
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
X-Inumbo-ID: e761b325-a2c4-429c-bd01-edc5f9648da7
Message-Id: <20201210194042.548936472@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=wCqGjbHBcSlcHWGOV/dAhxvR97JcFGNX9psmcROoCq0=;
	b=2Z0Q8lbqw2d3iK0lyMTfu6GGSIFMkE/mgVP/hAGnWOqxBRMxf5MtZTpRPSPBXz/boYfgYn
	ST6oe0NetpTwhOSarLLIdAuYLS1gydE77MQVYVcY3FouLrWnl5si1eWOJ4F95yCk0G9X60
	1VL1Pvt1tpdt2jzvXhHk1B3J4gqT2I16payytnnsVM1ae0GkKHVOkzm3mG/NvUjNMZDZ8b
	Y9sC2WWQtJSCM32DjS16A3YMAUHnAI48PATHpxuESAMuGdCfbbEW6ICvvlfOLWvLQ9S/jh
	Z+QD95xpqockzbshrRUV6G0e1FqEFRsR9IAhKZG5jK6CihEBgYA5K4ONks8gvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=wCqGjbHBcSlcHWGOV/dAhxvR97JcFGNX9psmcROoCq0=;
	b=7JxYxk/ThtDXDjNM4lO0Kv6ZI0VZ4wL2ccu9YMROMO3FB+Dn8roKKZsGAALM1EdgllUWzl
	ydzvbEXlvqdXI/CQ==
Date: Thu, 10 Dec 2020 20:25:37 +0100
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
Subject: [patch 01/30] genirq: Move irq_has_action() into core code
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

This function uses irq_to_desc() and is going to be used by modules to
replace the open coded irq_to_desc() (ab)usage. The final goal is to remove
the export of irq_to_desc() so driver cannot fiddle with it anymore.

Move it into the core code and fixup the usage sites to include the proper
header.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/kernel/sys_jensen.c |    2 +-
 arch/x86/kernel/topology.c     |    1 +
 include/linux/interrupt.h      |    1 +
 include/linux/irqdesc.h        |    7 +------
 kernel/irq/manage.c            |   17 +++++++++++++++++
 5 files changed, 21 insertions(+), 7 deletions(-)

--- a/arch/alpha/kernel/sys_jensen.c
+++ b/arch/alpha/kernel/sys_jensen.c
@@ -7,7 +7,7 @@
  *
  * Code supporting the Jensen.
  */
-
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/mm.h>
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -25,6 +25,7 @@
  *
  * Send feedback to <colpatch@us.ibm.com>
  */
+#include <linux/interrupt.h>
 #include <linux/nodemask.h>
 #include <linux/export.h>
 #include <linux/mmzone.h>
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -232,6 +232,7 @@ extern void devm_free_irq(struct device
 # define local_irq_enable_in_hardirq()	local_irq_enable()
 #endif
 
+bool irq_has_action(unsigned int irq);
 extern void disable_irq_nosync(unsigned int irq);
 extern bool disable_hardirq(unsigned int irq);
 extern void disable_irq(unsigned int irq);
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -179,12 +179,7 @@ int handle_domain_nmi(struct irq_domain
 /* Test to see if a driver has successfully requested an irq */
 static inline int irq_desc_has_action(struct irq_desc *desc)
 {
-	return desc->action != NULL;
-}
-
-static inline int irq_has_action(unsigned int irq)
-{
-	return irq_desc_has_action(irq_to_desc(irq));
+	return desc && desc->action != NULL;
 }
 
 /**
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2752,3 +2752,20 @@ int irq_set_irqchip_state(unsigned int i
 	return err;
 }
 EXPORT_SYMBOL_GPL(irq_set_irqchip_state);
+
+/**
+ * irq_has_action - Check whether an interrupt is requested
+ * @irq:	The linux irq number
+ *
+ * Returns: A snapshot of the current state
+ */
+bool irq_has_action(unsigned int irq)
+{
+	bool res;
+
+	rcu_read_lock();
+	res = irq_desc_has_action(irq_to_desc(irq));
+	rcu_read_unlock();
+	return res;
+}
+EXPORT_SYMBOL_GPL(irq_has_action);


