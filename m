Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67542D46CF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48540.85889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Qk-0007Mt-OZ; Wed, 09 Dec 2020 16:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48540.85889; Wed, 09 Dec 2020 16:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Qk-0007MJ-Jm; Wed, 09 Dec 2020 16:35:06 +0000
Received: by outflank-mailman (input) for mailman id 48540;
 Wed, 09 Dec 2020 16:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn2Qj-0007Fp-Ev
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:35:05 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6af9f6ac-e876-40fd-afa6-506424aaec58;
 Wed, 09 Dec 2020 16:35:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C67B1042;
 Wed,  9 Dec 2020 08:35:00 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C9EE3F68F;
 Wed,  9 Dec 2020 08:34:59 -0800 (PST)
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
X-Inumbo-ID: 6af9f6ac-e876-40fd-afa6-506424aaec58
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 6/7] xen/arm: Add CP10 exception support to handle MVFR
Date: Wed,  9 Dec 2020 16:30:59 +0000
Message-Id: <a72a378cd1d4e5c6670980cf4d201d457abe5abc.1607524536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607524536.git.bertrand.marquis@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1607524536.git.bertrand.marquis@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>

Add support for cp10 exceptions decoding to be able to emulate the
values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
This is required for aarch32 guests accessing MVFR registers using
vmrs and vmsr instructions.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3:
  Add case for MVFR2, fix typo VMFR <-> MVFR.

---
 xen/arch/arm/traps.c             |  5 ++++
 xen/arch/arm/vcpreg.c            | 39 +++++++++++++++++++++++++++++++-
 xen/include/asm-arm/perfc_defn.h |  1 +
 xen/include/asm-arm/traps.h      |  1 +
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 22bd1bd4c6..28d9d64558 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2097,6 +2097,11 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
         perfc_incr(trap_cp14_dbg);
         do_cp14_dbg(regs, hsr);
         break;
+    case HSR_EC_CP10:
+        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        perfc_incr(trap_cp10);
+        do_cp10(regs, hsr);
+        break;
     case HSR_EC_CP:
         GUEST_BUG_ON(!psr_mode_is_32bit(regs));
         perfc_incr(trap_cp);
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index d371a1c38c..da4e22a467 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -319,7 +319,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
     GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
     GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
     GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
-    /* MVFR registers are in cp10 no cp15 */
+    /* MVFR registers are in cp10 not cp15 */
 
     HSR_CPREG32_TID3_RESERVED_CASE:
         /* Handle all reserved registers as RAZ */
@@ -638,6 +638,43 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
     inject_undef_exception(regs, hsr);
 }
 
+void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
+{
+    const struct hsr_cp32 cp32 = hsr.cp32;
+    int regidx = cp32.reg;
+
+    if ( !check_conditional_instr(regs, hsr) )
+    {
+        advance_pc(regs, hsr);
+        return;
+    }
+
+    switch ( hsr.bits & HSR_CP32_REGS_MASK )
+    {
+    /*
+     * HSR.TID3 is trapping access to MVFR register used to identify the
+     * VFP/Simd using VMRS/VMSR instructions.
+     * Exception encoding is using MRC/MCR standard with the reg field in Crn
+     * as are declared MVFR0 and MVFR1 in cpregs.h
+     */
+    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
+    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
+    GENERATE_TID3_INFO(MVFR2, mvfr, 2)
+
+    default:
+        gdprintk(XENLOG_ERR,
+                 "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
+                 cp32.read ? "mrc" : "mcr",
+                 cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
+        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
+                 hsr.bits & HSR_CP32_REGS_MASK);
+        inject_undef_exception(regs, hsr);
+        return;
+    }
+
+    advance_pc(regs, hsr);
+}
+
 void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
 {
     const struct hsr_cp cp = hsr.cp;
diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc_defn.h
index 6a83185163..31f071222b 100644
--- a/xen/include/asm-arm/perfc_defn.h
+++ b/xen/include/asm-arm/perfc_defn.h
@@ -11,6 +11,7 @@ PERFCOUNTER(trap_cp15_64,  "trap: cp15 64-bit access")
 PERFCOUNTER(trap_cp14_32,  "trap: cp14 32-bit access")
 PERFCOUNTER(trap_cp14_64,  "trap: cp14 64-bit access")
 PERFCOUNTER(trap_cp14_dbg, "trap: cp14 dbg access")
+PERFCOUNTER(trap_cp10,     "trap: cp10 access")
 PERFCOUNTER(trap_cp,       "trap: cp access")
 PERFCOUNTER(trap_smc32,    "trap: 32-bit smc")
 PERFCOUNTER(trap_hvc32,    "trap: 32-bit hvc")
diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
index 997c37884e..c4a3d0fb1b 100644
--- a/xen/include/asm-arm/traps.h
+++ b/xen/include/asm-arm/traps.h
@@ -62,6 +62,7 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
 void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr);
 void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr);
 void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr);
+void do_cp10(struct cpu_user_regs *regs, const union hsr hsr);
 void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
 
 /* SMCCC handling */
-- 
2.17.1


