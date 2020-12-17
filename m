Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4DC2DD467
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55987.97751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQZ-0004fn-J3; Thu, 17 Dec 2020 15:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55987.97751; Thu, 17 Dec 2020 15:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQZ-0004eX-Dy; Thu, 17 Dec 2020 15:42:51 +0000
Received: by outflank-mailman (input) for mailman id 55987;
 Thu, 17 Dec 2020 15:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQW-0004GE-W1
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:49 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3eabbf11-50b1-4745-a474-c7cc8f6ea9d8;
 Thu, 17 Dec 2020 15:42:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2C1F101E;
 Thu, 17 Dec 2020 07:42:37 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CE683F66B;
 Thu, 17 Dec 2020 07:42:37 -0800 (PST)
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
X-Inumbo-ID: 3eabbf11-50b1-4745-a474-c7cc8f6ea9d8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 7/8] xen/arm: Add CP10 exception support to handle MVFR
Date: Thu, 17 Dec 2020 15:38:07 +0000
Message-Id: <841e5cd22290158d9b0c5d6dedafd01ed9a3d0bc.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Add support for cp10 exceptions decoding to be able to emulate the
values for MVFR0, MVFR1 and MVFR2 when TID3 bit of HSR is activated.
This is required for aarch32 guests accessing MVFR registers using
vmrs and vmsr instructions.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3:
  Add case for MVFR2, fix typo VMFR <-> MVFR.
Changes in V4:
  Fix typo HSR -> HCR
  Move no to not comment fix to previous patch

---
 xen/arch/arm/traps.c             |  5 +++++
 xen/arch/arm/vcpreg.c            | 37 ++++++++++++++++++++++++++++++++
 xen/include/asm-arm/perfc_defn.h |  1 +
 xen/include/asm-arm/traps.h      |  1 +
 4 files changed, 44 insertions(+)

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
index 1fe07fe02a..cbad8f25a0 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -664,6 +664,43 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
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
+     * HCR.TID3 is trapping access to MVFR register used to identify the
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


