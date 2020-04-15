Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C11A900C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSV-0001Np-Sy; Wed, 15 Apr 2020 01:03:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSU-0001Mm-Gh
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:18 +0000
X-Inumbo-ID: da98d66e-7eb4-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da98d66e-7eb4-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 01:03:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2166920774;
 Wed, 15 Apr 2020 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912581;
 bh=ISak1Imoj+Ly2asoLD52bHxG9S9gcN2rOOIhbYo1CLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=biYVLT8sFYsz1xY5aBEJJzLGhQcM1Mnhjtv1e9WY807HLywbMTeqCCZ7XfDNJI0Oh
 dRWuihqa/IpTAlnVaaMMB+YRfVJpnpwepiLH21vCPl/qLop+EsVl3ExQjbvOUlU+zT
 WNf+vYrA6H76LVIRyXX2hWuZldAJaXOeCi5PUA2E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native UART
 address for vPL011
Date: Tue, 14 Apr 2020 18:02:53 -0700
Message-Id: <20200415010255.10081-10-sstabellini@kernel.org>
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

We always use a fix address to map the vPL011 to domains. The address
could be a problem for domains that are directly mapped.

Instead, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c  | 13 ++++++++-----
 xen/arch/arm/vpl011.c        | 12 +++++++++---
 xen/include/asm-arm/domain.h |  1 +
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index beec0a144c..9bc0b810a7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1768,8 +1768,11 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[27];
 
-    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011_addr);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -1779,7 +1782,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011_addr,
                        GUEST_PL011_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
@@ -2524,6 +2527,9 @@ static int __init construct_domU(struct domain *d,
         reserve_memory_11(d, &kinfo, &banks[0], i);
     }
 
+    if ( kinfo.vpl011 )
+        rc = domain_vpl011_init(d, NULL);
+
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
@@ -2532,9 +2538,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..44173a76fd 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -347,7 +347,7 @@ static int vpl011_mmio_read(struct vcpu *v,
                             void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa - v->domain->arch.vpl011_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -430,7 +430,7 @@ static int vpl011_mmio_write(struct vcpu *v,
                              void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa - v->domain->arch.vpl011_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -622,10 +622,16 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
 {
     int rc;
     struct vpl011 *vpl011 = &d->arch.vpl011;
+    const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
 
     if ( vpl011->backend.dom.ring_buf )
         return -EINVAL;
 
+    if ( is_domain_direct_mapped(d) && uart != NULL )
+        d->arch.vpl011_addr = uart->base_addr;
+    else
+        d->arch.vpl011_addr = GUEST_PL011_BASE;
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -673,7 +679,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     spin_lock_init(&vpl011->lock);
 
     register_mmio_handler(d, &vpl011_mmio_handler,
-                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
+                          d->arch.vpl011_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 7a498921bf..52741895c8 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -100,6 +100,7 @@ struct arch_domain
 #endif
 
     bool direct_map;
+    paddr_t vpl011_addr;
 }  __cacheline_aligned;
 
 struct arch_xen_dom_flags
-- 
2.17.1


