Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C15194F22
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 03:38:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHepm-0007C9-97; Fri, 27 Mar 2020 02:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ARRd=5M=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jHepk-0007C4-NW
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 02:34:56 +0000
X-Inumbo-ID: 8b1a3f6e-6fd3-11ea-88df-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b1a3f6e-6fd3-11ea-88df-12813bfff9fa;
 Fri, 27 Mar 2020 02:34:55 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5645F20714;
 Fri, 27 Mar 2020 02:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585276494;
 bh=ghsIk6lKAOlI4w0XTF3R9UmgymQHh3Y9m+ELbP7TZ64=;
 h=From:To:Cc:Subject:Date:From;
 b=JhRZQh4mbrJB3o8lU28MVcN7zjmytohCR3ptRa+nx4OHNJQZdi/vziLxwG3B04fU6
 AXhxCf0Ly7sFvrVLhvfLMQuRoBR0SJzcdmvawr7KCOXknMowfnOFRV1KRHjye7Ejj3
 dv3xsEieFhZuOE7I1Aou8GxBZxFu1wIyM5Wou5Aw=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Date: Thu, 26 Mar 2020 19:34:51 -0700
Message-Id: <20200327023451.20271-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
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
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
reads. It doesn't take into account the latest state of interrupts on
other vCPUs. Only the current vCPU is up-to-date. A full solution is
not possible because it would require synchronization among all vCPUs,
which would be very expensive in terms or latency.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Wei Xu <xuwei5@hisilicon.com>
CC: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- improve commit message
- do not invert result
- use 1U
- use common patter with vgic_rank_offset
- move implementation into a separate function called vgic_isactiver
- add vgic2 implementation
- tested on vgic2 by hacking the Linux gicv2 driver
---
 xen/arch/arm/vgic-v2.c     | 13 +++++++++++--
 xen/arch/arm/vgic-v3.c     | 15 ++++++++++++---
 xen/arch/arm/vgic.c        | 20 ++++++++++++++++++++
 xen/include/asm-arm/vgic.h |  1 +
 4 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 64b141fea5..454408d11d 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -245,10 +245,19 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         goto read_as_zero;
 
-    /* Read the active status of an IRQ via GICD is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
+        if ( dabt.size != DABT_WORD ) goto bad_width;
+        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ISACTIVER, DABT_WORD);
+        if ( rank == NULL ) goto read_as_zero;
+        *r = vgic_isactiver(v, 32 * rank->index);
+        return 1;
+
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
-        goto read_as_zero;
+        if ( dabt.size != DABT_WORD ) goto bad_width;
+        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICACTIVER, DABT_WORD);
+        if ( rank == NULL ) goto read_as_zero;
+        *r = vgic_isactiver(v, 32 * rank->index);
+        return 1;
 
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     {
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4e60ba15cc..a2cd39c45d 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -712,10 +712,19 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDR):
         goto read_as_zero;
 
-    /* Read the active status of an IRQ via GICD/GICR is not supported */
-    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
+    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
+        if ( dabt.size != DABT_WORD ) goto bad_width;
+        rank = vgic_rank_offset(v, 1, reg - GICD_ISACTIVER, DABT_WORD);
+        if ( rank == NULL ) goto read_as_zero;
+        *r = vgic_isactiver(v, 32 * rank->index);
+        return 1;
+
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
-        goto read_as_zero;
+        if ( dabt.size != DABT_WORD ) goto bad_width;
+        rank = vgic_rank_offset(v, 1, reg - GICD_ICACTIVER, DABT_WORD);
+        if ( rank == NULL ) goto read_as_zero;
+        *r = vgic_isactiver(v, 32 * rank->index);
+        return 1;
 
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     {
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 82f524a35c..d491fa38a5 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -423,6 +423,26 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n)
     }
 }
 
+uint32_t vgic_isactiver(struct vcpu *v, unsigned int start_irq)
+{
+        struct pending_irq *p;
+        unsigned int irq;
+        uint32_t r = 0;
+
+        /*
+         * The following won't reflect the latest status of interrupts on
+         * other vcpus.
+         */
+        for ( irq = start_irq; irq < start_irq + 32; irq++ )
+        {
+            p = irq_to_pending(v, irq);
+            if ( p != NULL && test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
+                r |= 1U << (irq - start_irq);
+        }
+
+        return r;
+}
+
 bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
                  int virq, const struct sgi_target *target)
 {
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index ce1e3c4bbd..a9e3f2fa60 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -288,6 +288,7 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n, int
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
+extern uint32_t vgic_isactiver(struct vcpu *v, unsigned int start_irq);
 extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
 int vgic_v2_init(struct domain *d, int *mmio_count);
 int vgic_v3_init(struct domain *d, int *mmio_count);
-- 
2.17.1


