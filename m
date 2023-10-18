Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D67CDCF0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 15:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618560.962345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6Nx-0006Ox-AZ; Wed, 18 Oct 2023 13:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618560.962345; Wed, 18 Oct 2023 13:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt6Nx-0006NF-6x; Wed, 18 Oct 2023 13:14:53 +0000
Received: by outflank-mailman (input) for mailman id 618560;
 Wed, 18 Oct 2023 13:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt6Nv-0006N9-BP
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 13:14:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c0155c-6db8-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 15:14:49 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id E96784EE0739;
 Wed, 18 Oct 2023 15:14:46 +0200 (CEST)
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
X-Inumbo-ID: 50c0155c-6db8-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2] arm/gic: add missing parameter names and uniform function declarations
Date: Wed, 18 Oct 2023 15:14:39 +0200
Message-Id: <f22122c2b82f704dff17a455877c213940b54cc7.1697633691.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and remove inconsistencies between GICv3
and GICv2. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- switched parameter names of gicv3_write_lr().
---
 xen/arch/arm/gic-v3.c          | 22 +++++++++++-----------
 xen/arch/arm/include/asm/gic.h | 12 ++++++------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 95e4f020fe..172ff8c005 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1086,29 +1086,29 @@ static void gicv3_read_lr(int lr, struct gic_lr *lr_reg)
     }
 }
 
-static void gicv3_write_lr(int lr_reg, const struct gic_lr *lr)
+static void gicv3_write_lr(int lr, const struct gic_lr *lr_reg)
 {
     uint64_t lrv = 0;
     const enum gic_version vgic_version = current->domain->arch.vgic.version;
 
 
-    lrv = ( ((u64)(lr->virq & ICH_LR_VIRTUAL_MASK)  << ICH_LR_VIRTUAL_SHIFT) |
-        ((u64)(lr->priority & ICH_LR_PRIORITY_MASK) << ICH_LR_PRIORITY_SHIFT) );
+    lrv = ( ((u64)(lr_reg->virq & ICH_LR_VIRTUAL_MASK)  << ICH_LR_VIRTUAL_SHIFT) |
+        ((u64)(lr_reg->priority & ICH_LR_PRIORITY_MASK) << ICH_LR_PRIORITY_SHIFT) );
 
-    if ( lr->active )
+    if ( lr_reg->active )
         lrv |= ICH_LR_STATE_ACTIVE;
 
-    if ( lr->pending )
+    if ( lr_reg->pending )
         lrv |= ICH_LR_STATE_PENDING;
 
-    if ( lr->hw_status )
+    if ( lr_reg->hw_status )
     {
         lrv |= ICH_LR_HW;
-        lrv |= (uint64_t)lr->hw.pirq << ICH_LR_PHYSICAL_SHIFT;
+        lrv |= (uint64_t)lr_reg->hw.pirq << ICH_LR_PHYSICAL_SHIFT;
     }
     else
     {
-        if ( lr->virt.eoi )
+        if ( lr_reg->virt.eoi )
             lrv |= ICH_LR_MAINTENANCE_IRQ;
         /* Source is only set in GICv2 compatible mode */
         if ( vgic_version == GIC_V2 )
@@ -1117,8 +1117,8 @@ static void gicv3_write_lr(int lr_reg, const struct gic_lr *lr)
              * Source is only valid for SGIs, the caller should make
              * sure the field virt.source is always 0 for non-SGI.
              */
-            ASSERT(!lr->virt.source || lr->virq < NR_GIC_SGI);
-            lrv |= (uint64_t)lr->virt.source << ICH_LR_CPUID_SHIFT;
+            ASSERT(!lr_reg->virt.source || lr_reg->virq < NR_GIC_SGI);
+            lrv |= (uint64_t)lr_reg->virt.source << ICH_LR_CPUID_SHIFT;
         }
     }
 
@@ -1129,7 +1129,7 @@ static void gicv3_write_lr(int lr_reg, const struct gic_lr *lr)
     if ( vgic_version == GIC_V3 )
         lrv |= ICH_LR_GRP1;
 
-    gicv3_ich_write_lr(lr_reg, lrv);
+    gicv3_ich_write_lr(lr, lrv);
 }
 
 static void gicv3_hcr_status(uint32_t flag, bool status)
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


