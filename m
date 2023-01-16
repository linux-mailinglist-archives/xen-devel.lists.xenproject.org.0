Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B966B56E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 02:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478246.741330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHEm6-0003I6-G5; Mon, 16 Jan 2023 01:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478246.741330; Mon, 16 Jan 2023 01:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHEm6-0003F5-CZ; Mon, 16 Jan 2023 01:59:02 +0000
Received: by outflank-mailman (input) for mailman id 478246;
 Mon, 16 Jan 2023 01:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wes/=5N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pHEm4-0002to-OA
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 01:59:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 56ef3974-9541-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 02:58:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 105BCAD7;
 Sun, 15 Jan 2023 17:59:40 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C36C3F71A;
 Sun, 15 Jan 2023 17:58:55 -0800 (PST)
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
X-Inumbo-ID: 56ef3974-9541-11ed-b8d0-410ff93cb8f0
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the first access
Date: Mon, 16 Jan 2023 09:58:19 +0800
Message-Id: <20230116015820.1269387-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116015820.1269387-1-Henry.Wang@arm.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
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
code from vgic_v2_domain_init() to the stage-2 data abort trap handling
code. The original CPU interface size and virtual CPU interface base
address is now saved in `struct vgic_dist` instead of the local
variable of vgic_v2_domain_init().

Note that GICv2 changes introduced by this patch is not applied to the
"New vGIC" implementation, as the "New vGIC" is not used. Also since
the hardware domain (Dom0) has an unlimited size P2M pool, the
gicv2_map_hwdom_extra_mappings() is also not touched by this patch.

[1] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/include/asm/vgic.h |  2 ++
 xen/arch/arm/traps.c            | 19 ++++++++++++++++---
 xen/arch/arm/vgic-v2.c          | 25 ++++++-------------------
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 3d44868039..1d37c291e1 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -153,6 +153,8 @@ struct vgic_dist {
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
     paddr_t cbase; /* CPU interface base address */
+    paddr_t csize; /* CPU interface size */
+    paddr_t vbase; /* virtual CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 061c92acbd..d98f166050 100644
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
@@ -1798,6 +1801,16 @@ static bool try_map_mmio(gfn_t gfn)
     /* For the hardware domain, all MMIOs are mapped with GFN == MFN */
     mfn_t mfn = _mfn(gfn_x(gfn));
 
+    /*
+     * Map the GICv2 virtual cpu interface in the gic cpu interface
+     * region of the guest on the first access of the MMIO region.
+     */
+    if ( d->arch.vgic.version == GIC_V2 &&
+         gfn_x(gfn) == gfn_x(gaddr_to_gfn(d->arch.vgic.cbase)) )
+        return !map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                                 d->arch.vgic.csize / PAGE_SIZE,
+                                 maddr_to_mfn(d->arch.vgic.vbase));
+
     /*
      * Device-Tree should already have everything mapped when building
      * the hardware domain.
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 0026cb4360..21e14a5a6f 100644
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
@@ -697,19 +693,10 @@ static int vgic_v2_domain_init(struct domain *d)
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
-
     register_mmio_handler(d, &vgic_v2_distr_mmio_handler, d->arch.vgic.dbase,
                           PAGE_SIZE, NULL);
 
-- 
2.25.1


