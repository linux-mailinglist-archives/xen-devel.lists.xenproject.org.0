Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C71A9008
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSN-0001Gp-HL; Wed, 15 Apr 2020 01:03:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSM-0001GC-4U
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:10 +0000
X-Inumbo-ID: d991c32b-7eb4-11ea-89ec-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d991c32b-7eb4-11ea-89ec-12813bfff9fa;
 Wed, 15 Apr 2020 01:03:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 157EB2087E;
 Wed, 15 Apr 2020 01:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912580;
 bh=NlKdqK0InViPQ1RlBoqs8f8gr+feCFyOn6w13VpIxiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XLqpvddxuHUSAvmG2krEq5LBfd6lPKYtV9Fjg9poRf3URL45tHF+2LTpMVubFqoea
 BgTHu6IWfipWrmlF6wKpEJC5LQcpX8UWmpVD/S4/52YdNPBsoj+cGzy+5PpUXcQJVw
 D16m5BdA959RRubXCDUuesoSlP/YdayR7pl63MV0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 07/12] xen/arm: new vgic: rename vgic_cpu/dist_base to c/dbase
Date: Tue, 14 Apr 2020 18:02:50 -0700
Message-Id: <20200415010255.10081-7-sstabellini@kernel.org>
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

To be uniform with the old vgic. Name uniformity will become immediately
useful in the following patch.

In vgic_v2_map_resources, use the fields in struct vgic_dist rather than
local variables.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/vgic/vgic-init.c  |  4 ++--
 xen/arch/arm/vgic/vgic-v2.c    | 16 ++++++++--------
 xen/include/asm-arm/new_vgic.h |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

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
index b5ba4ace87..09cb92039a 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,7 +258,7 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
     int ret;
 
@@ -268,7 +268,7 @@ int vgic_v2_map_resources(struct domain *d)
      */
     if ( is_hardware_domain(d) )
     {
-        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        d->arch.vgic.dbase = gic_v2_hw_data.dbase;
         /*
          * For the hardware domain, we always map the whole HW CPU
          * interface region in order to match the device tree (the "reg"
@@ -276,13 +276,13 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = gic_v2_hw_data.cbase;
+        d->arch.vgic.cbase = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
     else
     {
-        d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
+        d->arch.vgic.dbase = GUEST_GICD_BASE;
         /*
          * The CPU interface exposed to the guest is always 8kB. We may
          * need to add an offset to the virtual CPU interface base
@@ -290,13 +290,13 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
 
 
-    ret = vgic_register_dist_iodev(d, gaddr_to_gfn(dist->vgic_dist_base),
+    ret = vgic_register_dist_iodev(d, gaddr_to_gfn(dist->dbase),
                                    VGIC_V2);
     if ( ret )
     {
@@ -308,8 +308,8 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
index 97d622bff6..e3319900ab 100644
--- a/xen/include/asm-arm/new_vgic.h
+++ b/xen/include/asm-arm/new_vgic.h
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
-- 
2.17.1


