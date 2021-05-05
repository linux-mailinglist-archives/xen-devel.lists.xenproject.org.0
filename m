Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C73735C2
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122824.231737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCC0-0005vh-2c; Wed, 05 May 2021 07:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122824.231737; Wed, 05 May 2021 07:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBz-0005sh-TD; Wed, 05 May 2021 07:43:35 +0000
Received: by outflank-mailman (input) for mailman id 122824;
 Wed, 05 May 2021 07:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCBy-0005l9-8c
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 646ac69b-4168-46e5-9002-ca2397ac07e5;
 Wed, 05 May 2021 07:43:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E473411FB;
 Wed,  5 May 2021 00:43:32 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82C083F718;
 Wed,  5 May 2021 00:43:31 -0700 (PDT)
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
X-Inumbo-ID: 646ac69b-4168-46e5-9002-ca2397ac07e5
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 09/10] arm/time,vtimer: Get rid of READ/WRITE_SYSREG32
Date: Wed,  5 May 2021 09:43:07 +0200
Message-Id: <20210505074308.11016-10-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210505074308.11016-1-michal.orzel@arm.com>
References: <20210505074308.11016-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 registers are 64bit whereas AArch32 registers
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 registers have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify type of vtimer structure's member: ctl to register_t.

Add macro CNTFRQ_MASK containing mask for timer clock frequency
field of CNTFRQ_EL0 register.

Modify CNTx_CTL_* macros to return unsigned long instead of
unsigned int as ctl is now of type register_t.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/time.c             | 28 ++++++++++++++--------------
 xen/arch/arm/vtimer.c           | 10 +++++-----
 xen/include/asm-arm/domain.h    |  2 +-
 xen/include/asm-arm/processor.h |  5 ++++-
 4 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index b0021c2c69..7dbd363537 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -145,7 +145,7 @@ void __init preinit_xen_time(void)
         preinit_acpi_xen_time();
 
     if ( !cpu_khz )
-        cpu_khz = READ_SYSREG32(CNTFRQ_EL0) / 1000;
+        cpu_khz = (READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK) / 1000;
 
     res = platform_init_time();
     if ( res )
@@ -205,13 +205,13 @@ int reprogram_timer(s_time_t timeout)
 
     if ( timeout == 0 )
     {
-        WRITE_SYSREG32(0, CNTHP_CTL_EL2);
+        WRITE_SYSREG(0, CNTHP_CTL_EL2);
         return 1;
     }
 
     deadline = ns_to_ticks(timeout) + boot_count;
     WRITE_SYSREG64(deadline, CNTHP_CVAL_EL2);
-    WRITE_SYSREG32(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
+    WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
     isb();
 
     /* No need to check for timers in the past; the Generic Timer fires
@@ -223,23 +223,23 @@ int reprogram_timer(s_time_t timeout)
 static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
 {
     if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
-         READ_SYSREG32(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
+         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
     {
         perfc_incr(hyp_timer_irqs);
         /* Signal the generic timer code to do its work */
         raise_softirq(TIMER_SOFTIRQ);
         /* Disable the timer to avoid more interrupts */
-        WRITE_SYSREG32(0, CNTHP_CTL_EL2);
+        WRITE_SYSREG(0, CNTHP_CTL_EL2);
     }
 
     if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
-         READ_SYSREG32(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
+         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
     {
         perfc_incr(phys_timer_irqs);
         /* Signal the generic timer code to do its work */
         raise_softirq(TIMER_SOFTIRQ);
         /* Disable the timer to avoid more interrupts */
-        WRITE_SYSREG32(0, CNTP_CTL_EL0);
+        WRITE_SYSREG(0, CNTP_CTL_EL0);
     }
 }
 
@@ -260,8 +260,8 @@ static void vtimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
 
     perfc_incr(virt_timer_irqs);
 
-    current->arch.virt_timer.ctl = READ_SYSREG32(CNTV_CTL_EL0);
-    WRITE_SYSREG32(current->arch.virt_timer.ctl | CNTx_CTL_MASK, CNTV_CTL_EL0);
+    current->arch.virt_timer.ctl = READ_SYSREG(CNTV_CTL_EL0);
+    WRITE_SYSREG(current->arch.virt_timer.ctl | CNTx_CTL_MASK, CNTV_CTL_EL0);
     vgic_inject_irq(current->domain, current, current->arch.virt_timer.irq, true);
 }
 
@@ -297,9 +297,9 @@ void init_timer_interrupt(void)
     /* Sensible defaults */
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
-    WRITE_SYSREG32(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG32(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG32(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
     isb();
 
     request_irq(timer_irq[TIMER_HYP_PPI], 0, timer_interrupt,
@@ -320,8 +320,8 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG32(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG32(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
     isb();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index c2b27915c6..167fc6127a 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -138,8 +138,8 @@ void virt_timer_save(struct vcpu *v)
 {
     ASSERT(!is_idle_vcpu(v));
 
-    v->arch.virt_timer.ctl = READ_SYSREG32(CNTV_CTL_EL0);
-    WRITE_SYSREG32(v->arch.virt_timer.ctl & ~CNTx_CTL_ENABLE, CNTV_CTL_EL0);
+    v->arch.virt_timer.ctl = READ_SYSREG(CNTV_CTL_EL0);
+    WRITE_SYSREG(v->arch.virt_timer.ctl & ~CNTx_CTL_ENABLE, CNTV_CTL_EL0);
     v->arch.virt_timer.cval = READ_SYSREG64(CNTV_CVAL_EL0);
     if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
          !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
@@ -159,7 +159,7 @@ void virt_timer_restore(struct vcpu *v)
 
     WRITE_SYSREG64(v->domain->arch.virt_timer_base.offset, CNTVOFF_EL2);
     WRITE_SYSREG64(v->arch.virt_timer.cval, CNTV_CVAL_EL0);
-    WRITE_SYSREG32(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
+    WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
 }
 
 static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
@@ -347,7 +347,7 @@ bool vtimer_emulate(struct cpu_user_regs *regs, union hsr hsr)
 }
 
 static void vtimer_update_irq(struct vcpu *v, struct vtimer *vtimer,
-                              uint32_t vtimer_ctl)
+                              register_t vtimer_ctl)
 {
     bool level;
 
@@ -389,7 +389,7 @@ void vtimer_update_irqs(struct vcpu *v)
      * but this requires reworking the arch timer to implement this.
      */
     vtimer_update_irq(v, &v->arch.virt_timer,
-                      READ_SYSREG32(CNTV_CTL_EL0) & ~CNTx_CTL_MASK);
+                      READ_SYSREG(CNTV_CTL_EL0) & ~CNTx_CTL_MASK);
 
     /* For the physical timer we rely on our emulated state. */
     vtimer_update_irq(v, &v->arch.phys_timer, v->arch.phys_timer.ctl);
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 2d4f38c669..c9277b5c6d 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -36,7 +36,7 @@ struct vtimer {
     struct vcpu *v;
     int irq;
     struct timer timer;
-    uint32_t ctl;
+    register_t ctl;
     uint64_t cval;
 };
 
diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index 5c1768cdec..2577e9a244 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -485,9 +485,12 @@ extern register_t __cpu_logical_map[];
 
 /* Timer control registers */
 #define CNTx_CTL_ENABLE   (1u<<0)  /* Enable timer */
-#define CNTx_CTL_MASK     (1u<<1)  /* Mask IRQ */
+#define CNTx_CTL_MASK     (1ul<<1)  /* Mask IRQ */
 #define CNTx_CTL_PENDING  (1u<<2)  /* IRQ pending */
 
+/* Timer frequency mask */
+#define CNTFRQ_MASK       GENMASK(31, 0)
+
 /* Exception Vector offsets */
 /* ... ARM32 */
 #define VECTOR32_RST  0
-- 
2.29.0


