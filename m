Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A37C8888
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616662.958833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK23-00031b-9I; Fri, 13 Oct 2023 15:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616662.958833; Fri, 13 Oct 2023 15:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK23-0002zt-6G; Fri, 13 Oct 2023 15:24:55 +0000
Received: by outflank-mailman (input) for mailman id 616662;
 Fri, 13 Oct 2023 15:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK21-0002kj-SX
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:24:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7a569e1-69dc-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:24:52 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 2E9B24EE073D;
 Fri, 13 Oct 2023 17:24:51 +0200 (CEST)
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
X-Inumbo-ID: a7a569e1-69dc-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 01/10] arm/gic: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:31 +0200
Message-Id: <e55bfe55e0c34e96692f397ff69365bc0819fd90.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/gic.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index f1ef347edc..03f209529b 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -246,7 +246,7 @@ void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
 
 /* Program the GIC to route an interrupt */
 extern void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
-extern int gic_route_irq_to_guest(struct domain *, unsigned int virq,
+extern int gic_route_irq_to_guest(struct domain *d, unsigned int virq,
                                   struct irq_desc *desc,
                                   unsigned int priority);
 
@@ -330,11 +330,11 @@ struct gic_hw_operations {
     /* Initialize the GIC and the boot CPU */
     int (*init)(void);
     /* Save GIC registers */
-    void (*save_state)(struct vcpu *);
+    void (*save_state)(struct vcpu *v);
     /* Restore GIC registers */
-    void (*restore_state)(const struct vcpu *);
+    void (*restore_state)(const struct vcpu *v);
     /* Dump GIC LR register information */
-    void (*dump_state)(const struct vcpu *);
+    void (*dump_state)(const struct vcpu *v);
 
     /* hw_irq_controller to enable/disable/eoi host irq */
     hw_irq_controller *gic_host_irq_type;
@@ -369,9 +369,9 @@ struct gic_hw_operations {
     /* Clear LR register */
     void (*clear_lr)(int lr);
     /* Read LR register and populate gic_lr structure */
-    void (*read_lr)(int lr, struct gic_lr *);
+    void (*read_lr)(int lr, struct gic_lr *lr_reg);
     /* Write LR register from gic_lr structure */
-    void (*write_lr)(int lr, const struct gic_lr *);
+    void (*write_lr)(int lr, const struct gic_lr *lr_reg);
     /* Read VMCR priority */
     unsigned int (*read_vmcr_priority)(void);
     /* Read APRn register */
-- 
2.34.1


