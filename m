Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EB6804BD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486502.753880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLRJ-0006ln-Qe; Mon, 30 Jan 2023 04:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486502.753880; Mon, 30 Jan 2023 04:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLRJ-0006i4-NZ; Mon, 30 Jan 2023 04:06:41 +0000
Received: by outflank-mailman (input) for mailman id 486502;
 Mon, 30 Jan 2023 04:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFid=53=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMLRI-000485-1y
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:06:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7e008748-a053-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 05:06:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B67F1FB;
 Sun, 29 Jan 2023 20:07:19 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A65FB3F64C;
 Sun, 29 Jan 2023 20:06:34 -0800 (PST)
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
X-Inumbo-ID: 7e008748-a053-11ed-b8d1-410ff93cb8f0
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until the first access
Date: Mon, 30 Jan 2023 12:06:13 +0800
Message-Id: <20230130040614.188296-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130040614.188296-1-Henry.Wang@arm.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the mapping of the GICv2 CPU interface is created in
arch_domain_create(). This causes some troubles in populating and
freeing of the domain P2M pages pool. For example, a default 16
P2M pages are required in p2m_init() to cope with the P2M mapping
of 8KB GICv2 CPU interface area, and these 16 P2M pages would cause
the complexity of P2M destroy in the failure path of
arch_domain_create().

As per discussion in [1], similarly as the MMIO access for ACPI, this
patch defers the GICv2 CPU interface mapping until the first MMIO
access. This is achieved by moving the GICv2 CPU interface mapping
code from vgic_v2_domain_init()/vgic_v2_map_resources() to the
stage-2 data abort trap handling code. The original CPU interface
size and virtual CPU interface base address is now saved in
`struct vgic_dist` instead of the local variable of
vgic_v2_domain_init()/vgic_v2_map_resources().

Take the opportunity to unify the way of data access using the
existing pointer to struct vgic_dist in vgic_v2_map_resources() for
new GICv2.

Since the hardware domain (Dom0) has an unlimited size P2M pool, the
gicv2_map_hwdom_extra_mappings() is also not touched by this patch.

[1] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
1. Correct style in in-code comment.
2. Avoid open-coding gfn_eq() and gaddr_to_gfn(d->arch.vgic.cbase).
3. Apply same changes for the new vGICv2 implementation, update the
   commit message accordingly.
4. Add in-code comment in old GICv2's vgic_v2_domain_init() and
   new GICv2's vgic_v2_map_resources() to mention the mapping of the
   virtual CPU interface is deferred until first access.
---
 xen/arch/arm/include/asm/new_vgic.h |  2 ++
 xen/arch/arm/include/asm/vgic.h     |  2 ++
 xen/arch/arm/traps.c                | 18 +++++++++++---
 xen/arch/arm/vgic-v2.c              | 25 ++++++-------------
 xen/arch/arm/vgic/vgic-v2.c         | 38 ++++++++++-------------------
 5 files changed, 39 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index 18ed3f754a..1e76213893 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -127,6 +127,8 @@ struct vgic_dist {
             paddr_t     vgic_redist_free_offset;
         };
     };
+    paddr_t             csize; /* CPU interface size */
+    paddr_t             vbase; /* virtual CPU interface base address */
 
     /* distributor enabled */
     bool                enabled;
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 3d44868039..328fd46d1b 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -153,6 +153,8 @@ struct vgic_dist {
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
     paddr_t cbase; /* CPU interface base address */
+    paddr_t csize; /* CPU interface size */
+    paddr_t vbase; /* Virtual CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 061c92acbd..9dd703f661 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1787,9 +1787,12 @@ static inline bool hpfar_is_valid(bool s1ptw, uint8_t fsc)
 }
 
 /*
- * When using ACPI, most of the MMIO regions will be mapped on-demand
- * in stage-2 page tables for the hardware domain because Xen is not
- * able to know from the EFI memory map the MMIO regions.
+ * Try to map the MMIO regions for some special cases:
+ * 1. When using ACPI, most of the MMIO regions will be mapped on-demand
+ *    in stage-2 page tables for the hardware domain because Xen is not
+ *    able to know from the EFI memory map the MMIO regions.
+ * 2. For guests using GICv2, the GICv2 CPU interface mapping is created
+ *    on the first access of the MMIO region.
  */
 static bool try_map_mmio(gfn_t gfn)
 {
@@ -1798,6 +1801,15 @@ static bool try_map_mmio(gfn_t gfn)
     /* For the hardware domain, all MMIOs are mapped with GFN == MFN */
     mfn_t mfn = _mfn(gfn_x(gfn));
 
+    /*
+     * Map the GICv2 virtual CPU interface in the GIC CPU interface
+     * region of the guest on the first access of the MMIO region.
+     */
+    if ( d->arch.vgic.version == GIC_V2 &&
+         gfn_eq(gfn, gaddr_to_gfn(d->arch.vgic.cbase)) )
+        return !map_mmio_regions(d, gfn, d->arch.vgic.csize / PAGE_SIZE,
+                                 maddr_to_mfn(d->arch.vgic.vbase));
+
     /*
      * Device-Tree should already have everything mapped when building
      * the hardware domain.
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 0026cb4360..0b083c33e6 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -644,10 +644,6 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 
 static int vgic_v2_domain_init(struct domain *d)
 {
-    int ret;
-    paddr_t csize;
-    paddr_t vbase;
-
     /*
      * The hardware domain and direct-mapped domain both get the hardware
      * address.
@@ -667,8 +663,8 @@ static int vgic_v2_domain_init(struct domain *d)
          * aligned to PAGE_SIZE.
          */
         d->arch.vgic.cbase = vgic_v2_hw.cbase;
-        csize = vgic_v2_hw.csize;
-        vbase = vgic_v2_hw.vbase;
+        d->arch.vgic.csize = vgic_v2_hw.csize;
+        d->arch.vgic.vbase = vgic_v2_hw.vbase;
     }
     else if ( is_domain_direct_mapped(d) )
     {
@@ -683,8 +679,8 @@ static int vgic_v2_domain_init(struct domain *d)
          */
         d->arch.vgic.dbase = vgic_v2_hw.dbase;
         d->arch.vgic.cbase = vgic_v2_hw.cbase;
-        csize = GUEST_GICC_SIZE;
-        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+        d->arch.vgic.csize = GUEST_GICC_SIZE;
+        d->arch.vgic.vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
     else
     {
@@ -697,18 +693,11 @@ static int vgic_v2_domain_init(struct domain *d)
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
         d->arch.vgic.cbase = GUEST_GICC_BASE;
-        csize = GUEST_GICC_SIZE;
-        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+        d->arch.vgic.csize = GUEST_GICC_SIZE;
+        d->arch.vgic.vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
 
-    /*
-     * Map the gic virtual cpu interface in the gic cpu interface
-     * region of the guest.
-     */
-    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
-                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
-    if ( ret )
-        return ret;
+    /* Mapping of the virtual CPU interface is deferred until first access */
 
     register_mmio_handler(d, &vgic_v2_distr_mmio_handler, d->arch.vgic.dbase,
                           PAGE_SIZE, NULL);
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 07c8f8a005..1308948eec 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,8 +258,6 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t csize;
-    paddr_t vbase;
     int ret;
 
     /*
@@ -272,7 +270,7 @@ int vgic_v2_map_resources(struct domain *d)
      */
     if ( is_hardware_domain(d) )
     {
-        d->arch.vgic.dbase = gic_v2_hw_data.dbase;
+        dist->dbase = gic_v2_hw_data.dbase;
         /*
          * For the hardware domain, we always map the whole HW CPU
          * interface region in order to match the device tree (the "reg"
@@ -280,13 +278,13 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        d->arch.vgic.cbase = gic_v2_hw_data.cbase;
-        csize = gic_v2_hw_data.csize;
-        vbase = gic_v2_hw_data.vbase;
+        dist->cbase = gic_v2_hw_data.cbase;
+        dist->csize = gic_v2_hw_data.csize;
+        dist->vbase = gic_v2_hw_data.vbase;
     }
     else if ( is_domain_direct_mapped(d) )
     {
-        d->arch.vgic.dbase = gic_v2_hw_data.dbase;
+        dist->dbase = gic_v2_hw_data.dbase;
         /*
          * For all the direct-mapped domain other than the hardware domain,
          * we only map a 8kB CPU interface but we make sure it is at a location
@@ -296,13 +294,13 @@ int vgic_v2_map_resources(struct domain *d)
          * address when the GIC is aliased to get a 8kB contiguous
          * region.
          */
-        d->arch.vgic.cbase = gic_v2_hw_data.cbase;
-        csize = GUEST_GICC_SIZE;
-        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+        dist->cbase = gic_v2_hw_data.cbase;
+        dist->csize = GUEST_GICC_SIZE;
+        dist->vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
     else
     {
-        d->arch.vgic.dbase = GUEST_GICD_BASE;
+        dist->dbase = GUEST_GICD_BASE;
         /*
          * The CPU interface exposed to the guest is always 8kB. We may
          * need to add an offset to the virtual CPU interface base
@@ -310,9 +308,9 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        d->arch.vgic.cbase = GUEST_GICC_BASE;
-        csize = GUEST_GICC_SIZE;
-        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+        dist->cbase = GUEST_GICC_BASE;
+        dist->csize = GUEST_GICC_SIZE;
+        dist->vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
 
 
@@ -323,17 +321,7 @@ int vgic_v2_map_resources(struct domain *d)
         return ret;
     }
 
-    /*
-     * Map the gic virtual cpu interface in the gic cpu interface
-     * region of the guest.
-     */
-    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
-                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
-    if ( ret )
-    {
-        gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
-        return ret;
-    }
+    /* Mapping of the virtual CPU interface is deferred until first access */
 
     dist->ready = true;
 
-- 
2.25.1


