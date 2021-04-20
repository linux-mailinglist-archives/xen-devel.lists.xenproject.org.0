Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868B3652E8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 09:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113310.215932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVc-0006UT-NG; Tue, 20 Apr 2021 07:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113310.215932; Tue, 20 Apr 2021 07:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVc-0006TB-Cz; Tue, 20 Apr 2021 07:09:20 +0000
Received: by outflank-mailman (input) for mailman id 113310;
 Tue, 20 Apr 2021 07:09:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gRw=JR=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lYkVa-0006Ja-Na
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:09:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 96ea6986-5d1d-4ec3-a367-d26f9eb199db;
 Tue, 20 Apr 2021 07:09:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5695C1435;
 Tue, 20 Apr 2021 00:09:09 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.29.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D0B13F85F;
 Tue, 20 Apr 2021 00:09:07 -0700 (PDT)
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
X-Inumbo-ID: 96ea6986-5d1d-4ec3-a367-d26f9eb199db
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH 3/9] arm/gic: Get rid of READ/WRITE_SYSREG32
Date: Tue, 20 Apr 2021 09:08:47 +0200
Message-Id: <20210420070853.8918-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210420070853.8918-1-michal.orzel@arm.com>
References: <20210420070853.8918-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 system registers are 64bit whereas AArch32 ones
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 sysregs have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify types of following members of struct gic_v3 to register_t:
-hcr(not used at all in Xen)
-vmcr
-sre_el1
-apr0
-apr1

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/gic-v3-lpi.c |  2 +-
 xen/arch/arm/gic-v3.c     | 96 ++++++++++++++++++++-------------------
 xen/include/asm-arm/gic.h |  6 +--
 3 files changed, 54 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 869bc97fa1..e1594dd20e 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -178,7 +178,7 @@ void gicv3_do_LPI(unsigned int lpi)
     irq_enter();
 
     /* EOI the LPI already. */
-    WRITE_SYSREG32(lpi, ICC_EOIR1_EL1);
+    WRITE_SYSREG(lpi, ICC_EOIR1_EL1);
 
     /* Find out if a guest mapped something to this physical LPI. */
     hlpip = gic_get_host_lpi(lpi);
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index ac28013c19..0634013a67 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -246,12 +246,12 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
  */
 static void gicv3_enable_sre(void)
 {
-    uint32_t val;
+    register_t val;
 
-    val = READ_SYSREG32(ICC_SRE_EL2);
+    val = READ_SYSREG(ICC_SRE_EL2);
     val |= GICC_SRE_EL2_SRE;
 
-    WRITE_SYSREG32(val, ICC_SRE_EL2);
+    WRITE_SYSREG(val, ICC_SRE_EL2);
     isb();
 }
 
@@ -315,16 +315,16 @@ static void restore_aprn_regs(const union gic_state_data *d)
     switch ( gicv3.nr_priorities )
     {
     case 7:
-        WRITE_SYSREG32(d->v3.apr0[2], ICH_AP0R2_EL2);
-        WRITE_SYSREG32(d->v3.apr1[2], ICH_AP1R2_EL2);
+        WRITE_SYSREG(d->v3.apr0[2], ICH_AP0R2_EL2);
+        WRITE_SYSREG(d->v3.apr1[2], ICH_AP1R2_EL2);
         /* Fall through */
     case 6:
-        WRITE_SYSREG32(d->v3.apr0[1], ICH_AP0R1_EL2);
-        WRITE_SYSREG32(d->v3.apr1[1], ICH_AP1R1_EL2);
+        WRITE_SYSREG(d->v3.apr0[1], ICH_AP0R1_EL2);
+        WRITE_SYSREG(d->v3.apr1[1], ICH_AP1R1_EL2);
         /* Fall through */
     case 5:
-        WRITE_SYSREG32(d->v3.apr0[0], ICH_AP0R0_EL2);
-        WRITE_SYSREG32(d->v3.apr1[0], ICH_AP1R0_EL2);
+        WRITE_SYSREG(d->v3.apr0[0], ICH_AP0R0_EL2);
+        WRITE_SYSREG(d->v3.apr1[0], ICH_AP1R0_EL2);
         break;
     default:
         BUG();
@@ -338,16 +338,16 @@ static void save_aprn_regs(union gic_state_data *d)
     switch ( gicv3.nr_priorities )
     {
     case 7:
-        d->v3.apr0[2] = READ_SYSREG32(ICH_AP0R2_EL2);
-        d->v3.apr1[2] = READ_SYSREG32(ICH_AP1R2_EL2);
+        d->v3.apr0[2] = READ_SYSREG(ICH_AP0R2_EL2);
+        d->v3.apr1[2] = READ_SYSREG(ICH_AP1R2_EL2);
         /* Fall through */
     case 6:
-        d->v3.apr0[1] = READ_SYSREG32(ICH_AP0R1_EL2);
-        d->v3.apr1[1] = READ_SYSREG32(ICH_AP1R1_EL2);
+        d->v3.apr0[1] = READ_SYSREG(ICH_AP0R1_EL2);
+        d->v3.apr1[1] = READ_SYSREG(ICH_AP1R1_EL2);
         /* Fall through */
     case 5:
-        d->v3.apr0[0] = READ_SYSREG32(ICH_AP0R0_EL2);
-        d->v3.apr1[0] = READ_SYSREG32(ICH_AP1R0_EL2);
+        d->v3.apr0[0] = READ_SYSREG(ICH_AP0R0_EL2);
+        d->v3.apr1[0] = READ_SYSREG(ICH_AP1R0_EL2);
         break;
     default:
         BUG();
@@ -371,15 +371,15 @@ static void gicv3_save_state(struct vcpu *v)
     dsb(sy);
     gicv3_save_lrs(v);
     save_aprn_regs(&v->arch.gic);
-    v->arch.gic.v3.vmcr = READ_SYSREG32(ICH_VMCR_EL2);
-    v->arch.gic.v3.sre_el1 = READ_SYSREG32(ICC_SRE_EL1);
+    v->arch.gic.v3.vmcr = READ_SYSREG(ICH_VMCR_EL2);
+    v->arch.gic.v3.sre_el1 = READ_SYSREG(ICC_SRE_EL1);
 }
 
 static void gicv3_restore_state(const struct vcpu *v)
 {
-    uint32_t val;
+    register_t val;
 
-    val = READ_SYSREG32(ICC_SRE_EL2);
+    val = READ_SYSREG(ICC_SRE_EL2);
     /*
      * Don't give access to system registers when the guest is using
      * GICv2
@@ -388,7 +388,7 @@ static void gicv3_restore_state(const struct vcpu *v)
         val &= ~GICC_SRE_EL2_ENEL1;
     else
         val |= GICC_SRE_EL2_ENEL1;
-    WRITE_SYSREG32(val, ICC_SRE_EL2);
+    WRITE_SYSREG(val, ICC_SRE_EL2);
 
     /*
      * VFIQEn is RES1 if ICC_SRE_EL1.SRE is 1. This causes a Group0
@@ -398,9 +398,9 @@ static void gicv3_restore_state(const struct vcpu *v)
      * want before starting to mess with the rest of the GIC, and
      * VMCR_EL1 in particular.
      */
-    WRITE_SYSREG32(v->arch.gic.v3.sre_el1, ICC_SRE_EL1);
+    WRITE_SYSREG(v->arch.gic.v3.sre_el1, ICC_SRE_EL1);
     isb();
-    WRITE_SYSREG32(v->arch.gic.v3.vmcr, ICH_VMCR_EL2);
+    WRITE_SYSREG(v->arch.gic.v3.vmcr, ICH_VMCR_EL2);
     restore_aprn_regs(&v->arch.gic);
     gicv3_restore_lrs(v);
 
@@ -468,24 +468,25 @@ static void gicv3_mask_irq(struct irq_desc *irqd)
 static void gicv3_eoi_irq(struct irq_desc *irqd)
 {
     /* Lower the priority */
-    WRITE_SYSREG32(irqd->irq, ICC_EOIR1_EL1);
+    WRITE_SYSREG(irqd->irq, ICC_EOIR1_EL1);
     isb();
 }
 
 static void gicv3_dir_irq(struct irq_desc *irqd)
 {
     /* Deactivate */
-    WRITE_SYSREG32(irqd->irq, ICC_DIR_EL1);
+    WRITE_SYSREG(irqd->irq, ICC_DIR_EL1);
     isb();
 }
 
 static unsigned int gicv3_read_irq(void)
 {
-    unsigned int irq = READ_SYSREG32(ICC_IAR1_EL1);
+    register_t irq = READ_SYSREG(ICC_IAR1_EL1);
 
     dsb(sy);
 
-    return irq;
+    /* Number of IRQs do not exceed 32bit. */
+    return (unsigned int)irq;
 }
 
 /*
@@ -857,16 +858,16 @@ static int gicv3_cpu_init(void)
     gicv3_enable_sre();
 
     /* No priority grouping */
-    WRITE_SYSREG32(0, ICC_BPR1_EL1);
+    WRITE_SYSREG(0, ICC_BPR1_EL1);
 
     /* Set priority mask register */
-    WRITE_SYSREG32(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
+    WRITE_SYSREG(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
 
     /* EOI drops priority, DIR deactivates the interrupt (mode 1) */
-    WRITE_SYSREG32(GICC_CTLR_EL1_EOImode_drop, ICC_CTLR_EL1);
+    WRITE_SYSREG(GICC_CTLR_EL1_EOImode_drop, ICC_CTLR_EL1);
 
     /* Enable Group1 interrupts */
-    WRITE_SYSREG32(1, ICC_IGRPEN1_EL1);
+    WRITE_SYSREG(1, ICC_IGRPEN1_EL1);
 
     /* Sync at once at the end of cpu interface configuration */
     isb();
@@ -876,15 +877,15 @@ static int gicv3_cpu_init(void)
 
 static void gicv3_cpu_disable(void)
 {
-    WRITE_SYSREG32(0, ICC_CTLR_EL1);
+    WRITE_SYSREG(0, ICC_CTLR_EL1);
     isb();
 }
 
 static void gicv3_hyp_init(void)
 {
-    uint32_t vtr;
+    register_t vtr;
 
-    vtr = READ_SYSREG32(ICH_VTR_EL2);
+    vtr = READ_SYSREG(ICH_VTR_EL2);
     gicv3_info.nr_lrs  = (vtr & ICH_VTR_NRLRGS) + 1;
     gicv3.nr_priorities = ((vtr >> ICH_VTR_PRIBITS_SHIFT) &
                           ICH_VTR_PRIBITS_MASK) + 1;
@@ -892,8 +893,8 @@ static void gicv3_hyp_init(void)
     if ( !((gicv3.nr_priorities > 4) && (gicv3.nr_priorities < 8)) )
         panic("GICv3: Invalid number of priority bits\n");
 
-    WRITE_SYSREG32(ICH_VMCR_EOI | ICH_VMCR_VENG1, ICH_VMCR_EL2);
-    WRITE_SYSREG32(GICH_HCR_EN, ICH_HCR_EL2);
+    WRITE_SYSREG(ICH_VMCR_EOI | ICH_VMCR_VENG1, ICH_VMCR_EL2);
+    WRITE_SYSREG(GICH_HCR_EN, ICH_HCR_EL2);
 }
 
 /* Set up the per-CPU parts of the GIC for a secondary CPU */
@@ -917,11 +918,11 @@ out:
 
 static void gicv3_hyp_disable(void)
 {
-    uint32_t hcr;
+    register_t hcr;
 
-    hcr = READ_SYSREG32(ICH_HCR_EL2);
+    hcr = READ_SYSREG(ICH_HCR_EL2);
     hcr &= ~GICH_HCR_EN;
-    WRITE_SYSREG32(hcr, ICH_HCR_EL2);
+    WRITE_SYSREG(hcr, ICH_HCR_EL2);
     isb();
 }
 
@@ -1140,39 +1141,42 @@ static void gicv3_write_lr(int lr_reg, const struct gic_lr *lr)
 
 static void gicv3_hcr_status(uint32_t flag, bool status)
 {
-    uint32_t hcr;
+    register_t hcr;
 
-    hcr = READ_SYSREG32(ICH_HCR_EL2);
+    hcr = READ_SYSREG(ICH_HCR_EL2);
     if ( status )
-        WRITE_SYSREG32(hcr | flag, ICH_HCR_EL2);
+        WRITE_SYSREG(hcr | flag, ICH_HCR_EL2);
     else
-        WRITE_SYSREG32(hcr & (~flag), ICH_HCR_EL2);
+        WRITE_SYSREG(hcr & (~flag), ICH_HCR_EL2);
     isb();
 }
 
 static unsigned int gicv3_read_vmcr_priority(void)
 {
-   return ((READ_SYSREG32(ICH_VMCR_EL2) >> ICH_VMCR_PRIORITY_SHIFT) &
+   return ((READ_SYSREG(ICH_VMCR_EL2) >> ICH_VMCR_PRIORITY_SHIFT) &
             ICH_VMCR_PRIORITY_MASK);
 }
 
 /* Only support reading GRP1 APRn registers */
 static unsigned int gicv3_read_apr(int apr_reg)
 {
+    register_t apr;
     switch ( apr_reg )
     {
     case 0:
         ASSERT(gicv3.nr_priorities > 4 && gicv3.nr_priorities < 8);
-        return READ_SYSREG32(ICH_AP1R0_EL2);
+        apr = READ_SYSREG(ICH_AP1R0_EL2);
     case 1:
         ASSERT(gicv3.nr_priorities > 5 && gicv3.nr_priorities < 8);
-        return READ_SYSREG32(ICH_AP1R1_EL2);
+        apr = READ_SYSREG(ICH_AP1R1_EL2);
     case 2:
         ASSERT(gicv3.nr_priorities > 6 && gicv3.nr_priorities < 8);
-        return READ_SYSREG32(ICH_AP1R2_EL2);
+        apr = READ_SYSREG(ICH_AP1R2_EL2);
     default:
         BUG();
     }
+    /* Number of priority levels do not exceed 32bit */
+    return (unsigned int)apr;
 }
 
 static bool gicv3_read_pending_state(struct irq_desc *irqd)
diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
index ad0f7452d0..d750d070b4 100644
--- a/xen/include/asm-arm/gic.h
+++ b/xen/include/asm-arm/gic.h
@@ -171,9 +171,9 @@
  * GICv3 registers that needs to be saved/restored
  */
 struct gic_v3 {
-    uint32_t hcr, vmcr, sre_el1;
-    uint32_t apr0[4];
-    uint32_t apr1[4];
+    register_t hcr, vmcr, sre_el1;
+    register_t apr0[4];
+    register_t apr1[4];
     uint64_t lr[16];
 };
 #endif
-- 
2.29.0


