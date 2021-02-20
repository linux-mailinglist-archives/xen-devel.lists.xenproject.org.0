Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD432059F
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 15:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87232.164355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDSrr-0001bw-P9; Sat, 20 Feb 2021 14:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87232.164355; Sat, 20 Feb 2021 14:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDSrr-0001bX-Ly; Sat, 20 Feb 2021 14:04:19 +0000
Received: by outflank-mailman (input) for mailman id 87232;
 Sat, 20 Feb 2021 14:04:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lDSrp-0001bS-KQ
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 14:04:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDSrn-00041Q-Uw; Sat, 20 Feb 2021 14:04:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDSrn-0007Yh-LC; Sat, 20 Feb 2021 14:04:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=DHsWNJWyNVapDyEP7btR9oRnZl4HrHvqZ66xkvNY/So=; b=VP2ziViRgYOdBZv4XsM2EVyrth
	T+DJJNVItILG+CPonIja75oSyqltE4waI00KAbS1rbR4i9tio8+48pT+A51vBafJ62bdCyqRe3brW
	qpvuIsbv1GqHlEQGsw1DFxD1acF4ePqg7i5HdMdRJwkK+NXD2/eTPb5kerLRdA/vAfko=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2, 3}
Date: Sat, 20 Feb 2021 14:04:12 +0000
Message-Id: <20210220140412.31610-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Currently, Xen will send a data abort to a guest trying to write to the
ISPENDR.

Unfortunately, recent version of Linux (at least 5.9+) will start
writing to the register if the interrupt needs to be re-triggered
(see the callback irq_retrigger). This can happen when a driver (such as
the xgbe network driver on AMD Seattle) re-enable an interrupt:

(XEN) d0v0: vGICD: unhandled word write 0x00000004000000 to ISPENDR44
[...]
[   25.635837] Unhandled fault at 0xffff80001000522c
[...]
[   25.818716]  gic_retrigger+0x2c/0x38
[   25.822361]  irq_startup+0x78/0x138
[   25.825920]  __enable_irq+0x70/0x80
[   25.829478]  enable_irq+0x50/0xa0
[   25.832864]  xgbe_one_poll+0xc8/0xd8
[   25.836509]  net_rx_action+0x110/0x3a8
[   25.840328]  __do_softirq+0x124/0x288
[   25.844061]  irq_exit+0xe0/0xf0
[   25.847272]  __handle_domain_irq+0x68/0xc0
[   25.851442]  gic_handle_irq+0xa8/0xe0
[   25.855171]  el1_irq+0xb0/0x180
[   25.858383]  arch_cpu_idle+0x18/0x28
[   25.862028]  default_idle_call+0x24/0x5c
[   25.866021]  do_idle+0x204/0x278
[   25.869319]  cpu_startup_entry+0x24/0x68
[   25.873313]  rest_init+0xd4/0xe4
[   25.876611]  arch_call_rest_init+0x10/0x1c
[   25.880777]  start_kernel+0x5b8/0x5ec

As a consequence, the OS may become unusable.

Implementing the write part of ISPENDR is somewhat easy. For
virtual interrupt, we only need to inject the interrupt again.

For physical interrupt, we need to be more careful as the de-activation
of the virtual interrupt will be propagated to the physical distributor.
For simplicity, the physical interrupt will be set pending so the
workflow will not differ from a "real" interrupt.

Longer term, we could possible directly activate the physical interrupt
and avoid taking an exception to inject the interrupt to the domain.
(This is the approach taken by the new vGIC based on KVM).

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Note that this doesn't touch the read part for I{S,C}PENDR nor the write
part of ICPENDR because they are more complex to implement.

For physical interrupt, I didn't implement the same solution as KVM because
I couldn't convince myself this could be done race free for physical
interrupt.

This was tested using the IRQ debugfs (CONFIG_GENERIC_IRQ_DEBUGFS=y)
which allows to retrigger an interrupt:

42sh> echo trigger > /sys/kernel/debug/irq/irqs/<irq>

This patch is candidate for 4.15 and also backporting to older trees.
Without this patch, recent Linux version may not boot on Xen on some
platforms (such as AMD Seattle used in OssTest).

The patch is self-contained to implementing a single set of registers.
So this would not introduce any risk on platforms where OSes don't use
those registers.

For the other setup (e.g. AMD Seattle + Linux 5.9+), it cannot be worse
than today.

So therefore, I would consider the risk limited.
---
 xen/arch/arm/vgic-v2.c     | 10 ++++----
 xen/arch/arm/vgic-v3.c     | 18 ++++++---------
 xen/arch/arm/vgic.c        | 47 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/vgic.h |  2 ++
 4 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 64b141fea586..b2da886adc18 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -472,10 +472,12 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
 
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: vGICD: unhandled word write %#"PRIregister" to ISPENDR%d\n",
-               v, r, gicd_reg - GICD_ISPENDR);
-        return 0;
+        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ISPENDR, DABT_WORD);
+        if ( rank == NULL ) goto write_ignore;
+
+        vgic_set_irqs_pending(v, r, rank->index);
+
+        return 1;
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index fd8cfc156d0c..613f37abab5e 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -808,10 +808,12 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
 
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ISPENDR%d\n",
-               v, name, r, reg - GICD_ISPENDR);
-        return 0;
+        rank = vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
+        if ( rank == NULL ) goto write_ignore;
+
+        vgic_set_irqs_pending(v, r, rank->index);
+
+        return 1;
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
@@ -975,6 +977,7 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
     case VREG32(GICR_ICACTIVER0):
     case VREG32(GICR_ICFGR1):
     case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
+    case VREG32(GICR_ISPENDR0):
          /*
           * Above registers offset are common with GICD.
           * So handle common with GICD handling
@@ -982,13 +985,6 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
         return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
                                                  info, gicr_reg, r);
 
-    case VREG32(GICR_ISPENDR0):
-        if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ISPENDR0\n",
-               v, r);
-        return 0;
-
     case VREG32(GICR_ICPENDR0):
         if ( dabt.size != DABT_WORD ) goto bad_width;
         printk(XENLOG_G_ERR
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 82f524a35c9e..8f9400a51960 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -423,6 +423,53 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n)
     }
 }
 
+void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
+{
+    const unsigned long mask = r;
+    unsigned int i;
+    /* The first rank is always per-vCPU */
+    bool private = rank == 0;
+
+    /* LPIs will never be set pending via this function */
+    ASSERT(!is_lpi(32 * rank + 31));
+
+    for_each_set_bit( i, &mask, 32 )
+    {
+        unsigned int irq = i + 32 * rank;
+
+        if ( !private )
+        {
+            struct pending_irq *p = spi_to_pending(v->domain, irq);
+
+            /*
+             * When the domain sets the pending state for a HW interrupt on
+             * the virtual distributor, we set the pending state on the
+             * physical distributor.
+             *
+             * XXX: Investigate whether we would be able to set the
+             * physical interrupt active and save an interruption. (This
+             * is what the new vGIC does).
+             */
+            if ( p->desc != NULL )
+            {
+                unsigned long flags;
+
+                spin_lock_irqsave(&p->desc->lock, flags);
+                gic_set_pending_state(p->desc, true);
+                spin_unlock_irqrestore(&p->desc->lock, flags);
+                continue;
+            }
+        }
+
+        /*
+         * If the interrupt is per-vCPU, then we want to inject the vIRQ
+         * to v, otherwise we should let the function figuring out the
+         * correct vCPU.
+         */
+        vgic_inject_irq(v->domain, private ? v : NULL, irq, true);
+    }
+}
+
 bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
                  int virq, const struct sgi_target *target)
 {
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index ce1e3c4bbdac..62c2ae538db2 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -288,6 +288,8 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, int b, int n, int
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
+extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
+                                  unsigned int rank);
 extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
 int vgic_v2_init(struct domain *d, int *mmio_count);
 int vgic_v3_init(struct domain *d, int *mmio_count);
-- 
2.17.1


