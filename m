Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A132C6804C2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486501.753870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLRF-0006Qi-Gg; Mon, 30 Jan 2023 04:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486501.753870; Mon, 30 Jan 2023 04:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLRF-0006NW-DF; Mon, 30 Jan 2023 04:06:37 +0000
Received: by outflank-mailman (input) for mailman id 486501;
 Mon, 30 Jan 2023 04:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFid=53=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMLRE-000485-5L
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:06:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7bcf2d6f-a053-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 05:06:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 859E41FB;
 Sun, 29 Jan 2023 20:07:15 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CAB23F64C;
 Sun, 29 Jan 2023 20:06:30 -0800 (PST)
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
X-Inumbo-ID: 7bcf2d6f-a053-11ed-b8d1-410ff93cb8f0
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] xen/arm: Rename vgic_cpu_base and vgic_dist_base for new vGIC
Date: Mon, 30 Jan 2023 12:06:12 +0800
Message-Id: <20230130040614.188296-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130040614.188296-1-Henry.Wang@arm.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the follow-up patch from this series, the GICv2 CPU interface
mapping will be deferred until the first access in the stage-2
data abort trap handling code. Since the data abort trap handling
code is common for the current and the new vGIC implementation,
it is necessary to unify the variable names in struct vgic_dist
for these two implementations.

Therefore, this commit renames the vgic_cpu_base and vgic_dist_base
for new vGIC to cbase and dbase. So we can use the same code in
the data abort trap handling code for both vGIC implementations.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
1. New patch.
---
 xen/arch/arm/include/asm/new_vgic.h |  8 ++++----
 xen/arch/arm/vgic/vgic-init.c       |  4 ++--
 xen/arch/arm/vgic/vgic-v2.c         | 17 ++++++++---------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index b7fa9ab11a..18ed3f754a 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -115,11 +115,11 @@ struct vgic_dist {
     unsigned int        nr_spis;
 
     /* base addresses in guest physical address space: */
-    paddr_t             vgic_dist_base;     /* distributor */
+    paddr_t             dbase;     /* distributor */
     union
     {
         /* either a GICv2 CPU interface */
-        paddr_t         vgic_cpu_base;
+        paddr_t         cbase;
         /* or a number of GICv3 redistributor regions */
         struct
         {
@@ -188,12 +188,12 @@ struct vgic_cpu {
 
 static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
 {
-    return vgic->vgic_cpu_base;
+    return vgic->cbase;
 }
 
 static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
 {
-    return vgic->vgic_dist_base;
+    return vgic->dbase;
 }
 
 #endif /* __ASM_ARM_NEW_VGIC_H */
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index 62ae553699..ea739d081e 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -112,8 +112,8 @@ int domain_vgic_register(struct domain *d, int *mmio_count)
         BUG();
     }
 
-    d->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
-    d->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
+    d->arch.vgic.dbase = VGIC_ADDR_UNDEF;
+    d->arch.vgic.cbase = VGIC_ADDR_UNDEF;
     d->arch.vgic.vgic_redist_base = VGIC_ADDR_UNDEF;
 
     return 0;
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 1a99d3a8b4..07c8f8a005 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -272,7 +272,7 @@ int vgic_v2_map_resources(struct domain *d)
      */
     if ( is_hardware_domain(d) )
     {
-        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        d->arch.vgic.dbase = gic_v2_hw_data.dbase;
         /*
          * For the hardware domain, we always map the whole HW CPU
          * interface region in order to match the device tree (the "reg"
@@ -280,13 +280,13 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
+        d->arch.vgic.cbase = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
     else if ( is_domain_direct_mapped(d) )
     {
-        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        d->arch.vgic.dbase = gic_v2_hw_data.dbase;
         /*
          * For all the direct-mapped domain other than the hardware domain,
          * we only map a 8kB CPU interface but we make sure it is at a location
@@ -296,13 +296,13 @@ int vgic_v2_map_resources(struct domain *d)
          * address when the GIC is aliased to get a 8kB contiguous
          * region.
          */
-        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
+        d->arch.vgic.cbase = gic_v2_hw_data.cbase;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
     else
     {
-        d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
+        d->arch.vgic.dbase = GUEST_GICD_BASE;
         /*
          * The CPU interface exposed to the guest is always 8kB. We may
          * need to add an offset to the virtual CPU interface base
@@ -310,14 +310,13 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
 
 
-    ret = vgic_register_dist_iodev(d, gaddr_to_gfn(dist->vgic_dist_base),
-                                   VGIC_V2);
+    ret = vgic_register_dist_iodev(d, gaddr_to_gfn(dist->dbase), VGIC_V2);
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to register VGIC MMIO regions\n");
@@ -328,7 +327,7 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
                            csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
-- 
2.25.1


