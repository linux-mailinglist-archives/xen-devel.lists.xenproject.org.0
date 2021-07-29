Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5B3DA174
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 12:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161887.297070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m93VR-0007jA-6c; Thu, 29 Jul 2021 10:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161887.297070; Thu, 29 Jul 2021 10:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m93VR-0007hM-3Y; Thu, 29 Jul 2021 10:43:13 +0000
Received: by outflank-mailman (input) for mailman id 161887;
 Thu, 29 Jul 2021 10:43:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wMqg=MV=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m93VQ-0007h9-DV
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 10:43:12 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c470f58f-f059-11eb-9819-12813bfff9fa;
 Thu, 29 Jul 2021 10:43:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F4C26D;
 Thu, 29 Jul 2021 03:43:10 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.11.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C68033F73D;
 Thu, 29 Jul 2021 03:43:08 -0700 (PDT)
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
X-Inumbo-ID: c470f58f-f059-11eb-9819-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
Date: Thu, 29 Jul 2021 12:42:58 +0200
Message-Id: <20210729104258.6320-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to ARMv8A architecture, AArch64 registers
are 64bit wide even though in many cases the upper
32bit is reserved. Therefore there is no need for
function vreg_emulate_sysreg32 on arm64. This means
that we can have just one function vreg_emulate_sysreg
using new function pointer:
typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
                              register_t *r, bool read);

Modify vreg_emulate_cp32 to use the new function pointer
as well.

This change allows to properly use 64bit registers in AArch64
state and in case of AArch32 the upper 32 bits of AArch64
registers are inaccessible and are ignored(D1.20.1 ARM DDI 0487A.j).

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/arm64/vsysreg.c    |  2 +-
 xen/arch/arm/vcpreg.c           | 16 ++++++++++----
 xen/arch/arm/vgic-v3.c          |  2 +-
 xen/arch/arm/vtimer.c           | 11 +++++-----
 xen/include/asm-arm/processor.h |  4 ++--
 xen/include/asm-arm/vreg.h      | 38 ++++++---------------------------
 6 files changed, 29 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index caf17174b8..73fa2ca9ae 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -64,7 +64,7 @@ TVM_REG(CONTEXTIDR_EL1)
     {                                                                   \
         bool res;                                                       \
                                                                         \
-        res = vreg_emulate_sysreg64(regs, hsr, vreg_emulate_##reg);     \
+        res = vreg_emulate_sysreg(regs, hsr, vreg_emulate_##reg);       \
         ASSERT(res);                                                    \
         break;                                                          \
     }
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index e3ce56d875..be1ec08159 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -57,9 +57,17 @@
 #define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
 #endif
 
+/*
+ * type32_t is defined as register_t due to the vreg_emulate_cp32 and
+ * vreg_emulate_sysreg taking function pointer with register_t type used for
+ * passing register's value.
+ */
+typedef register_t type32_t;
+typedef uint64_t type64_t ;
+
 /* The name is passed from the upper macro to workaround macro expansion. */
 #define TVM_REG(sz, func, reg...)                                           \
-static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
+static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool read)    \
 {                                                                           \
     struct vcpu *v = current;                                               \
     bool cache_enabled = vcpu_has_cache_enabled(v);                         \
@@ -83,7 +91,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
 
 #else /* CONFIG_ARM_64 */
 #define TVM_REG32_COMBINED(lowreg, hireg, xreg)                             \
-static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
+static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, register_t *r,  \
                                 bool read, bool hi)                         \
 {                                                                           \
     struct vcpu *v = current;                                               \
@@ -108,13 +116,13 @@ static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
     return true;                                                            \
 }                                                                           \
                                                                             \
-static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, uint32_t *r,  \
+static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, register_t *r,\
                                   bool read)                                \
 {                                                                           \
     return vreg_emulate_##xreg(regs, r, read, false);                       \
 }                                                                           \
                                                                             \
-static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, uint32_t *r,   \
+static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, register_t *r, \
                                  bool read)                                 \
 {                                                                           \
     return vreg_emulate_##xreg(regs, r, read, true);                        \
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 613f37abab..cb5a70c42e 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1531,7 +1531,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
     switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
     {
     case HSR_SYSREG_ICC_SGI1R_EL1:
-        return vreg_emulate_sysreg64(regs, hsr, vgic_v3_emulate_sgi1r);
+        return vreg_emulate_sysreg(regs, hsr, vgic_v3_emulate_sgi1r);
 
     default:
         return false;
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 167fc6127a..0196951af4 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -162,7 +162,8 @@ void virt_timer_restore(struct vcpu *v)
     WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
 }
 
-static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
+static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, register_t *r,
+                            bool read)
 {
     struct vcpu *v = current;
     s_time_t expires;
@@ -197,7 +198,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
     return true;
 }
 
-static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
+static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
                              bool read)
 {
     struct vcpu *v = current;
@@ -316,11 +317,11 @@ static bool vtimer_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
     switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
     {
     case HSR_SYSREG_CNTP_CTL_EL0:
-        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_ctl);
+        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_ctl);
     case HSR_SYSREG_CNTP_TVAL_EL0:
-        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_tval);
+        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_tval);
     case HSR_SYSREG_CNTP_CVAL_EL0:
-        return vreg_emulate_sysreg64(regs, hsr, vtimer_cntp_cval);
+        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_cval);
 
     default:
         return false;
diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index 2577e9a244..2058b69447 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -484,9 +484,9 @@ extern register_t __cpu_logical_map[];
 #define CNTKCTL_EL1_EL0PTEN  (1u<<9) /* Expose phys timer registers to EL0 */
 
 /* Timer control registers */
-#define CNTx_CTL_ENABLE   (1u<<0)  /* Enable timer */
+#define CNTx_CTL_ENABLE   (1ul<<0)  /* Enable timer */
 #define CNTx_CTL_MASK     (1ul<<1)  /* Mask IRQ */
-#define CNTx_CTL_PENDING  (1u<<2)  /* IRQ pending */
+#define CNTx_CTL_PENDING  (1ul<<2)  /* IRQ pending */
 
 /* Timer frequency mask */
 #define CNTFRQ_MASK       GENMASK(31, 0)
diff --git a/xen/include/asm-arm/vreg.h b/xen/include/asm-arm/vreg.h
index 1253753833..fa2f4cdb17 100644
--- a/xen/include/asm-arm/vreg.h
+++ b/xen/include/asm-arm/vreg.h
@@ -4,13 +4,13 @@
 #ifndef __ASM_ARM_VREG__
 #define __ASM_ARM_VREG__
 
-typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs, uint32_t *r,
-                                   bool read);
 typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
                                    bool read);
+typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
+                                   bool read);
 
 static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
-                                     vreg_reg32_fn_t fn)
+                                     vreg_reg_fn_t fn)
 {
     struct hsr_cp32 cp32 = hsr.cp32;
     /*
@@ -18,7 +18,7 @@ static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
      * implementation error in the emulation (such as not correctly
      * setting r).
      */
-    uint32_t r = 0;
+    register_t r = 0;
     bool ret;
 
     if ( !cp32.read )
@@ -64,11 +64,11 @@ static inline bool vreg_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr,
 }
 
 #ifdef CONFIG_ARM_64
-static inline bool vreg_emulate_sysreg32(struct cpu_user_regs *regs, union hsr hsr,
-                                         vreg_reg32_fn_t fn)
+static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr,
+                                         vreg_reg_fn_t fn)
 {
     struct hsr_sysreg sysreg = hsr.sysreg;
-    uint32_t r = 0;
+    register_t r = 0;
     bool ret;
 
     if ( !sysreg.read )
@@ -81,30 +81,6 @@ static inline bool vreg_emulate_sysreg32(struct cpu_user_regs *regs, union hsr h
 
     return ret;
 }
-
-static inline bool vreg_emulate_sysreg64(struct cpu_user_regs *regs, union hsr hsr,
-                                         vreg_reg64_fn_t fn)
-{
-    struct hsr_sysreg sysreg = hsr.sysreg;
-    /*
-     * Initialize to zero to avoid leaking data if there is an
-     * implementation error in the emulation (such as not correctly
-     * setting x).
-     */
-    uint64_t x = 0;
-    bool ret;
-
-    if ( !sysreg.read )
-        x = get_user_reg(regs, sysreg.reg);
-
-    ret = fn(regs, &x, sysreg.read);
-
-    if ( ret && sysreg.read )
-        set_user_reg(regs, sysreg.reg, x);
-
-    return ret;
-}
-
 #endif
 
 #define VREG_REG_MASK(size) ((~0UL) >> (BITS_PER_LONG - ((1 << (size)) * 8)))
-- 
2.29.0


