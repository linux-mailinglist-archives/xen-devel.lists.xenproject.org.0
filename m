Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C84BF6C5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 11:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276655.472905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSqK-0001hA-UN; Tue, 22 Feb 2022 10:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276655.472905; Tue, 22 Feb 2022 10:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSqK-0001fG-Op; Tue, 22 Feb 2022 10:56:28 +0000
Received: by outflank-mailman (input) for mailman id 276655;
 Tue, 22 Feb 2022 10:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IN1Y=TF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nMSqJ-00017R-2e
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 10:56:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1446d20e-93ce-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 11:56:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C5B106F;
 Tue, 22 Feb 2022 02:56:25 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.3.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA8DE3F70D;
 Tue, 22 Feb 2022 02:56:23 -0800 (PST)
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
X-Inumbo-ID: 1446d20e-93ce-11ec-8eb8-a37418f5ba1a
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm: Rename psr_mode_is_user to regs_mode_is_user
Date: Tue, 22 Feb 2022 11:56:13 +0100
Message-Id: <20220222105613.20668-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220222105613.20668-1-michal.orzel@arm.com>
References: <20220222105613.20668-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Perform renaming of psr_mode_is_user to regs_mode_is_user in order to
reflect that it takes struct cpu_user_regs as a parameter and not
psr.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v1:
-new patch
---
 xen/arch/arm/arm64/vsysreg.c    |  4 ++--
 xen/arch/arm/include/asm/regs.h |  4 ++--
 xen/arch/arm/traps.c            | 12 ++++++------
 xen/arch/arm/vcpreg.c           |  4 ++--
 xen/arch/arm/vtimer.c           |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index cf55544081..758750983c 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -91,7 +91,7 @@ void do_sysreg(struct cpu_user_regs *regs,
      * ARMv8 (DDI 0487A.d): D7.2.1
      */
     case HSR_SYSREG_ACTLR_EL1:
-        if ( psr_mode_is_user(regs) )
+        if ( regs_mode_is_user(regs) )
             return inject_undef_exception(regs, hsr);
         if ( hsr.sysreg.read )
             set_user_reg(regs, regidx, v->arch.actlr);
@@ -206,7 +206,7 @@ void do_sysreg(struct cpu_user_regs *regs,
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_PMUSERENR_EL0:
         /* RO at EL0. RAZ/WI at EL1 */
-        if ( psr_mode_is_user(regs) )
+        if ( regs_mode_is_user(regs) )
             return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
         else
             return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 04e821138a..794721a103 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -33,7 +33,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 
 #ifdef CONFIG_ARM_32
 #define hyp_mode(r)     psr_mode((r)->cpsr,PSR_MODE_HYP)
-#define psr_mode_is_user(r) usr_mode(r)
+#define regs_mode_is_user(r) usr_mode(r)
 #else
 #define hyp_mode(r)     (psr_mode((r)->cpsr,PSR_MODE_EL2h) || \
                          psr_mode((r)->cpsr,PSR_MODE_EL2t))
@@ -42,7 +42,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
  * Trap may have been taken from EL0, which might be in AArch32 usr
  * mode, or in AArch64 mode (PSR_MODE_EL0t).
  */
-#define psr_mode_is_user(r) \
+#define regs_mode_is_user(r) \
     (psr_mode((r)->cpsr,PSR_MODE_EL0t) || usr_mode(r))
 #endif
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0db8e42d65..7a1b679b8c 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -561,7 +561,7 @@ static void inject_abt64_exception(struct cpu_user_regs *regs,
         .len = instr_len,
     };
 
-    if ( psr_mode_is_user(regs) )
+    if ( regs_mode_is_user(regs) )
         esr.ec = prefetch
             ? HSR_EC_INSTR_ABORT_LOWER_EL : HSR_EC_DATA_ABORT_LOWER_EL;
     else
@@ -1193,7 +1193,7 @@ void vcpu_show_execution_state(struct vcpu *v)
     vcpu_pause(v); /* acceptably dangerous */
 
     vcpu_show_registers(v);
-    if ( !psr_mode_is_user(&v->arch.cpu_info->guest_cpu_user_regs) )
+    if ( !regs_mode_is_user(&v->arch.cpu_info->guest_cpu_user_regs) )
         show_guest_stack(v, &v->arch.cpu_info->guest_cpu_user_regs);
 
     vcpu_unpause(v);
@@ -1560,7 +1560,7 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
                          multi->args[2], multi->args[3],
                          multi->args[4]);
 
-    return likely(!psr_mode_is_user(guest_cpu_user_regs()))
+    return likely(!regs_mode_is_user(guest_cpu_user_regs()))
            ? mc_continue : mc_preempt;
 }
 
@@ -1699,7 +1699,7 @@ void handle_raz_wi(struct cpu_user_regs *regs,
 {
     ASSERT((min_el == 0) || (min_el == 1));
 
-    if ( min_el > 0 && psr_mode_is_user(regs) )
+    if ( min_el > 0 && regs_mode_is_user(regs) )
         return inject_undef_exception(regs, hsr);
 
     if ( read )
@@ -1718,7 +1718,7 @@ void handle_wo_wi(struct cpu_user_regs *regs,
 {
     ASSERT((min_el == 0) || (min_el == 1));
 
-    if ( min_el > 0 && psr_mode_is_user(regs) )
+    if ( min_el > 0 && regs_mode_is_user(regs) )
         return inject_undef_exception(regs, hsr);
 
     if ( read )
@@ -1738,7 +1738,7 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
 {
     ASSERT((min_el == 0) || (min_el == 1));
 
-    if ( min_el > 0 && psr_mode_is_user(regs) )
+    if ( min_el > 0 && regs_mode_is_user(regs) )
         return inject_undef_exception(regs, hsr);
 
     if ( !read )
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index dfc18d12ff..b5fbbe1cb8 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -224,7 +224,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
      * ARMv8 (DDI 0487A.d): G6.2.1
      */
     case HSR_CPREG32(ACTLR):
-        if ( psr_mode_is_user(regs) )
+        if ( regs_mode_is_user(regs) )
             return inject_undef_exception(regs, hsr);
         if ( cp32.read )
             set_user_reg(regs, regidx, v->arch.actlr);
@@ -296,7 +296,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
      */
     case HSR_CPREG32(PMUSERENR):
         /* RO at EL0. RAZ/WI at EL1 */
-        if ( psr_mode_is_user(regs) )
+        if ( regs_mode_is_user(regs) )
             return handle_ro_raz(regs, regidx, cp32.read, hsr, 0);
         else
             return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 0196951af4..5bb5970f58 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -36,7 +36,7 @@
  * CNTKCTL_EL1_ bit name which gates user access
  */
 #define ACCESS_ALLOWED(regs, user_gate) \
-    ( !psr_mode_is_user(regs) || \
+    ( !regs_mode_is_user(regs) || \
       (READ_SYSREG(CNTKCTL_EL1) & CNTKCTL_EL1_##user_gate) )
 
 static void phys_timer_expired(void *data)
-- 
2.29.0


