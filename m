Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18F1A9005
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWST-0001Kp-B9; Wed, 15 Apr 2020 01:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSR-0001JV-4v
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:15 +0000
X-Inumbo-ID: da3083ca-7eb4-11ea-89ec-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da3083ca-7eb4-11ea-89ec-12813bfff9fa;
 Wed, 15 Apr 2020 01:03:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69B81208FE;
 Wed, 15 Apr 2020 01:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912580;
 bh=ZzU/KCsWFqwH+c4W+Sd0RSn1ZEn5hNAtQGIHQMy5tEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VqWqFsZR6RwDPloWnP4LyDoX02kf0vE9iKyZaguCe9gybtsSJRC2cRPSOagrTHmNH
 5JeJsG0LKR1YfyruQjIm9ORndgRSKuInwXNxCm9xBq4B+IJxXCMZWBBVxPK8/A2kjz
 5ANwSqaclTnIZVZDTBVcIe5iphX+0/NFxdgyphCg=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 08/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv2
Date: Tue, 14 Apr 2020 18:02:51 -0700
Message-Id: <20200415010255.10081-8-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr_Babchuk@epam.com, sstabellini@kernel.org, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
any domain that is_domain_direct_mapped.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 10 +++++++---
 xen/arch/arm/vgic-v2.c      | 12 ++++++------
 xen/arch/arm/vgic/vgic-v2.c |  2 +-
 xen/include/asm-arm/vgic.h  |  1 +
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 627e0c5e8e..303bee60f6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1643,8 +1643,12 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             d->arch.vgic.dbase);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -1666,9 +1670,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
+                       d->arch.vgic.dbase, GUEST_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
+                       d->arch.vgic.cbase, GUEST_GICC_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 64b141fea5..9a74e2ed38 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -650,14 +650,14 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 static int vgic_v2_domain_init(struct domain *d)
 {
     int ret;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
 
     /*
      * The hardware domain gets the hardware address.
      * Guests get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( is_domain_direct_mapped(d) )
     {
         d->arch.vgic.dbase = vgic_v2_hw.dbase;
         /*
@@ -667,7 +667,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = vgic_v2_hw.cbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
@@ -681,7 +681,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
@@ -690,8 +690,8 @@ static int vgic_v2_domain_init(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
         return ret;
 
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 09cb92039a..275dd8bea9 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -266,7 +266,7 @@ int vgic_v2_map_resources(struct domain *d)
      * The hardware domain gets the hardware address.
      * Guests get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( is_domain_direct_mapped(d) )
     {
         d->arch.vgic.dbase = gic_v2_hw_data.dbase;
         /*
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index ce1e3c4bbd..f151d98773 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -152,6 +152,7 @@ struct vgic_dist {
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
+    paddr_t cbase; /* CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
-- 
2.17.1


