Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794AE1A900D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSY-0001QG-A2; Wed, 15 Apr 2020 01:03:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSW-0001OQ-5o
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:20 +0000
X-Inumbo-ID: da691cc6-7eb4-11ea-89ec-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da691cc6-7eb4-11ea-89ec-12813bfff9fa;
 Wed, 15 Apr 2020 01:03:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC7CD2078B;
 Wed, 15 Apr 2020 01:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912581;
 bh=Lmbmicx/WeDeC0BE2JzU8fS5QlIfGd8kH2D1wqE2U5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LJPUFIKBgND+ioK8OLEosJp2bpg2BbKzFmwLRUAwE5Uvv8T6MTQs+28V79gFgNLEN
 Mr3ixv0GaRnMnPAAdgnxsLggRUxZhT5q6IyfKzgHumUa5oeOXMlq1z+20/vRZZKXEq
 NUu03aghfahwoEshb+RapkcW9Mgi0L8Cqr4UYZPA=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 09/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv3
Date: Tue, 14 Apr 2020 18:02:52 -0700
Message-Id: <20200415010255.10081-9-sstabellini@kernel.org>
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

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
any domain that is_domain_direct_mapped. The patch has to introduce one
#ifndef CONFIG_NEW_VGIC because the new vgic doesn't support GICv3.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 12 +++++++++---
 xen/arch/arm/vgic-v3.c      | 18 ++++++++++++++----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 303bee60f6..beec0a144c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1697,8 +1697,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             d->arch.vgic.dbase);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -1720,9 +1724,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
+                       d->arch.vgic.dbase, GUEST_GICV3_GICD_SIZE);
+#if defined(CONFIG_GICV3) && !defined(CONFIG_NEW_VGIC)
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+                       d->arch.vgic.rdist_regions[0].base, GUEST_GICV3_GICR0_SIZE);
+#endif
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4e60ba15cc..4cf430f865 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1677,13 +1677,25 @@ static int vgic_v3_domain_init(struct domain *d)
      * Domain 0 gets the hardware address.
      * Guests get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( is_domain_direct_mapped(d) )
     {
         unsigned int first_cpu = 0;
+        unsigned int nr_rdist_regions;
 
         d->arch.vgic.dbase = vgic_v3_hw.dbase;
 
-        for ( i = 0; i < vgic_v3_hw.nr_rdist_regions; i++ )
+        if ( is_hardware_domain(d) )
+        {
+            nr_rdist_regions = vgic_v3_hw.nr_rdist_regions;
+            d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
+        }
+        else
+        {
+            nr_rdist_regions = 1;
+            d->arch.vgic.intid_bits = 10;
+        }
+
+        for ( i = 0; i < nr_rdist_regions; i++ )
         {
             paddr_t size = vgic_v3_hw.regions[i].size;
 
@@ -1706,8 +1718,6 @@ static int vgic_v3_domain_init(struct domain *d)
          * exposing unused region as they will not get emulated.
          */
         d->arch.vgic.nr_regions = i + 1;
-
-        d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
     }
     else
     {
-- 
2.17.1


