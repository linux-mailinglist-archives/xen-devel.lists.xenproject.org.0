Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457A3D725A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 11:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161098.295800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8JjF-0006V3-3j; Tue, 27 Jul 2021 09:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161098.295800; Tue, 27 Jul 2021 09:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8JjF-0006TA-0H; Tue, 27 Jul 2021 09:50:25 +0000
Received: by outflank-mailman (input) for mailman id 161098;
 Tue, 27 Jul 2021 09:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x8Uz=MT=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m8JjE-0006T4-0K
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 09:50:24 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0f37383a-eec0-11eb-96e0-12813bfff9fa;
 Tue, 27 Jul 2021 09:50:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFC6031B;
 Tue, 27 Jul 2021 02:50:21 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.9.152])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 373183F73D;
 Tue, 27 Jul 2021 02:50:20 -0700 (PDT)
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
X-Inumbo-ID: 0f37383a-eec0-11eb-96e0-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [RFC PATCH] xen/arm: Replace vreg_emulate_{sysreg/cp}32 with vreg_emulate_{sysreg/cp}
Date: Tue, 27 Jul 2021 11:50:10 +0200
Message-Id: <20210727095010.11103-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to ARMv8A architecture, AArch64 registers
are 64bit wide even though in many cases the upper
32bit is reserved. Therefore there is no need for
function vreg_emulate_sysreg32 on arm64.

Ideally on arm64 there should be only one function
vreg_emulate_sysreg(using register_t) or
vreg_emulate_sysreg64(using uint64_t) but in the Xen code
there is a lot of functions passed both to the
vreg_emulate_cp* and vreg_emulate_sysreg*.
This would require to duplicate them which is not
a good solution.

The easiest/minimal solution to fix this issue is
to replace vreg_emulate_{sysreg/cp}32 with
vreg_emulate_{sysreg/cp}. The modifed functions
are now taking function pointer:
-typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
                              register_t *r, bool read);
instead of:
-typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs,
                                uint32_t *r, bool read);

This change allows to properly use 64bit registers on arm64
and in case of 32bit guest the cast is done by the hardware
due to the 32bit registers being the lower part of 64bit ones.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
The reason for this change is to clean up the mess related to types.
This patch achieves that but it does not reduce the code size.
I'm not sure whether we want such change hence it is pushed as RFC.
---
 xen/arch/arm/vcpreg.c      | 16 +++++++++++-----
 xen/arch/arm/vtimer.c      | 18 +++++++++---------
 xen/include/asm-arm/vreg.h | 14 +++++++-------
 3 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index e3ce56d875..376a1ceee2 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -57,9 +57,12 @@
 #define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
 #endif
 
+#define type32_t register_t
+#define type64_t uint64_t
+
 /* The name is passed from the upper macro to workaround macro expansion. */
 #define TVM_REG(sz, func, reg...)                                           \
-static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
+static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool read)    \
 {                                                                           \
     struct vcpu *v = current;                                               \
     bool cache_enabled = vcpu_has_cache_enabled(v);                         \
@@ -83,7 +86,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
 
 #else /* CONFIG_ARM_64 */
 #define TVM_REG32_COMBINED(lowreg, hireg, xreg)                             \
-static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
+static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, register_t *r,  \
                                 bool read, bool hi)                         \
 {                                                                           \
     struct vcpu *v = current;                                               \
@@ -108,13 +111,13 @@ static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,    \
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
@@ -154,13 +157,16 @@ TVM_REG32_COMBINED(MAIR0, MAIR1, MAIR_EL1)
 TVM_REG32_COMBINED(AMAIR0, AMAIR1, AMAIR_EL1)
 TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
 
+#define VREG_EMULATE_CP32(regs, hsr, fn)  vreg_emulate_cp(regs, hsr, fn)
+#define VREG_EMULATE_CP64(regs, hsr, fn)  vreg_emulate_cp64(regs, hsr, fn)
+
 /* Macro to generate easily case for co-processor emulation. */
 #define GENERATE_CASE(reg, sz)                                      \
     case HSR_CPREG##sz(reg):                                        \
     {                                                               \
         bool res;                                                   \
                                                                     \
-        res = vreg_emulate_cp##sz(regs, hsr, vreg_emulate_##reg);   \
+        res = VREG_EMULATE_CP##sz(regs, hsr, vreg_emulate_##reg);   \
         ASSERT(res);                                                \
         break;                                                      \
     }
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 167fc6127a..17b5649a05 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -162,7 +162,7 @@ void virt_timer_restore(struct vcpu *v)
     WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
 }
 
-static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
+static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, register_t *r, bool read)
 {
     struct vcpu *v = current;
     s_time_t expires;
@@ -176,7 +176,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
     }
     else
     {
-        uint32_t ctl = *r & ~CNTx_CTL_PENDING;
+        register_t ctl = *r & ~CNTx_CTL_PENDING;
         if ( ctl & CNTx_CTL_ENABLE )
             ctl |= v->arch.phys_timer.ctl & CNTx_CTL_PENDING;
         v->arch.phys_timer.ctl = ctl;
@@ -197,7 +197,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
     return true;
 }
 
-static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
+static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
                              bool read)
 {
     struct vcpu *v = current;
@@ -211,11 +211,11 @@ static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
 
     if ( read )
     {
-        *r = (uint32_t)((v->arch.phys_timer.cval - cntpct) & 0xffffffffull);
+        *r = (register_t)((v->arch.phys_timer.cval - cntpct) & 0xffffffffull);
     }
     else
     {
-        v->arch.phys_timer.cval = cntpct + (uint64_t)(int32_t)*r;
+        v->arch.phys_timer.cval = cntpct + (uint64_t)(register_t)*r;
         if ( v->arch.phys_timer.ctl & CNTx_CTL_ENABLE )
         {
             v->arch.phys_timer.ctl &= ~CNTx_CTL_PENDING;
@@ -274,10 +274,10 @@ static bool vtimer_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr)
     switch ( hsr.bits & HSR_CP32_REGS_MASK )
     {
     case HSR_CPREG32(CNTP_CTL):
-        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_ctl);
+        return vreg_emulate_cp(regs, hsr, vtimer_cntp_ctl);
 
     case HSR_CPREG32(CNTP_TVAL):
-        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_tval);
+        return vreg_emulate_cp(regs, hsr, vtimer_cntp_tval);
 
     default:
         return false;
@@ -316,9 +316,9 @@ static bool vtimer_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
     switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
     {
     case HSR_SYSREG_CNTP_CTL_EL0:
-        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_ctl);
+        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_ctl);
     case HSR_SYSREG_CNTP_TVAL_EL0:
-        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_tval);
+        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_tval);
     case HSR_SYSREG_CNTP_CVAL_EL0:
         return vreg_emulate_sysreg64(regs, hsr, vtimer_cntp_cval);
 
diff --git a/xen/include/asm-arm/vreg.h b/xen/include/asm-arm/vreg.h
index 1253753833..cef55aabea 100644
--- a/xen/include/asm-arm/vreg.h
+++ b/xen/include/asm-arm/vreg.h
@@ -4,13 +4,13 @@
 #ifndef __ASM_ARM_VREG__
 #define __ASM_ARM_VREG__
 
-typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs, uint32_t *r,
+typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
                                    bool read);
 typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
                                    bool read);
 
-static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
-                                     vreg_reg32_fn_t fn)
+static inline bool vreg_emulate_cp(struct cpu_user_regs *regs, union hsr hsr,
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
-- 
2.29.0


