Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F97BA726
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 18:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613081.953357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoRcq-0004aZ-LB; Thu, 05 Oct 2023 16:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613081.953357; Thu, 05 Oct 2023 16:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoRcq-0004YC-IM; Thu, 05 Oct 2023 16:55:00 +0000
Received: by outflank-mailman (input) for mailman id 613081;
 Thu, 05 Oct 2023 16:54:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoRcp-0004Y6-CA
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 16:54:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoRco-0002Wy-Mz; Thu, 05 Oct 2023 16:54:58 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoRco-0001ff-CN; Thu, 05 Oct 2023 16:54:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=SGDQ2I3YKAXIUA5KSevc6aCD2k4hu7R6So1fBYM0y+Y=; b=vTN4gb
	lKu1dbFX+SUYmsLbcIkP5EdIZlPNUkZAPA7LYSW+ukK8p/OgbJdJaFZeGP0f7ITJ9UiQ2FjrcozeF
	eqOtPrfMMvWvfZAoB4WSFCWGnHhI0S4cvAhbnRg4regAnS9WZ0Nn+rf9PwDg4frh5eHpQ7MkosnOH
	Wps3YjwO3YA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	dan.driscoll@siemens.com,
	arvind.raghuraman@siemens.com,
	michal.orzel@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer interrupt for ACPI
Date: Thu,  5 Oct 2023 17:54:54 +0100
Message-Id: <20231005165454.18143-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"),
the fields "Secure EL1 Timer GSIV/Flags" are optional and an OS running
in non-secure world is meant to ignore the values.

However, Xen is trying to reserve the value. When booting on Graviton
2 metal instances, this would result to crash a boot because the
value is 0 which is already reserved (I haven't checked for which device).
While nothing prevent a PPI to be shared, the field should have been
ignored by Xen.

For the Device-Tree case, I couldn't find a statement suggesting
that the secure physical timer interrupt  is ignored. In fact, I have
found some code in Linux using it as a fallback. That said, it should
never be used.

As I am not aware of any issue when booting using Device-Tree, the
physical timer interrupt is only ignored for ACPI.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

This has not been tested on Graviton 2 because I can't seem to get
the serial console working properly. @Dan would you be able to try it?

It would also be good to understand why 0 why already reserved. This
may be a sign for other issues in the ACPI code.
---
 xen/arch/arm/time.c   |  4 ----
 xen/arch/arm/vtimer.c | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 3535bd8ac7c7..8fc14cd3ff62 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -78,10 +78,6 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
     irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
     timer_irq[TIMER_PHYS_NONSECURE_PPI] = gtdt->non_secure_el1_interrupt;
 
-    irq_type = acpi_get_timer_irq_type(gtdt->secure_el1_flags);
-    irq_set_type(gtdt->secure_el1_interrupt, irq_type);
-    timer_irq[TIMER_PHYS_SECURE_PPI] = gtdt->secure_el1_interrupt;
-
     irq_type = acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
     irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
     timer_irq[TIMER_VIRT_PPI] = gtdt->virtual_timer_interrupt;
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index c54360e20266..e73ae33c1b58 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include <xen/acpi.h>
 #include <xen/lib.h>
 #include <xen/perfc.h>
 #include <xen/sched.h>
@@ -61,10 +62,22 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
 
     config->clock_frequency = timer_dt_clock_frequency;
 
-    /* At this stage vgic_reserve_virq can't fail */
+    /*
+     * Per the ACPI specification, providing a secure EL1 timer
+     * interrupt is optional and will be ignored by non-secure OS.
+     * Therefore don't reserve the interrupt number for the HW domain
+     * and ACPI.
+     *
+     * Note that we should still reserve it when using the Device-Tree
+     * because the interrupt is not optional. That said, we are not
+     * expecting any OS to use it when running on top of Xen.
+     *
+     * At this stage vgic_reserve_virq() is not meant to fail.
+    */
     if ( is_hardware_domain(d) )
     {
-        if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI)) )
+        if ( acpi_disabled &&
+             !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI)) )
             BUG();
 
         if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_NONSECURE_PPI)) )
-- 
2.40.1


