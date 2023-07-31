Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60667698B8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573084.897441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTPY-0005fi-Ja; Mon, 31 Jul 2023 13:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573084.897441; Mon, 31 Jul 2023 13:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTPY-0005dz-G4; Mon, 31 Jul 2023 13:58:12 +0000
Received: by outflank-mailman (input) for mailman id 573084;
 Mon, 31 Jul 2023 13:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lm7y=DR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qQTPX-0005dn-Dn
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:58:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4872aef3-2faa-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:58:10 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-23-62-117.retail.telecomitalia.it [79.23.62.117])
 by support.bugseng.com (Postfix) with ESMTPSA id 752DB4EE0737;
 Mon, 31 Jul 2023 15:58:09 +0200 (CEST)
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
X-Inumbo-ID: 4872aef3-2faa-11ee-b255-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH] xen/arm/IRQ: uniform irq_set_affinity() with x86 version
Date: Mon, 31 Jul 2023 15:58:02 +0200
Message-Id: <018fb3a81eb6669346694f2669333ba4d67ab5c4.1690811728.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name of irq_set_affinity() to uniform the function
prototype with the one used by x86.

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/irq.h | 2 +-
 xen/arch/arm/irq.c             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 105b33b37d..c8044b0371 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -91,7 +91,7 @@ int platform_get_irq(const struct dt_device_node *device, int index);
 
 int platform_get_irq_byname(const struct dt_device_node *np, const char *name);
 
-void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
+void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask);
 
 /*
  * Use this helper in places that need to know whether the IRQ type is
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 054bb281d8..09648db17a 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -175,10 +175,10 @@ static inline struct domain *irq_get_domain(struct irq_desc *desc)
     return irq_get_guest_info(desc)->d;
 }
 
-void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
+void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     if ( desc != NULL )
-        desc->handler->set_affinity(desc, cpu_mask);
+        desc->handler->set_affinity(desc, mask);
 }
 
 int request_irq(unsigned int irq, unsigned int irqflags,
-- 
2.34.1


