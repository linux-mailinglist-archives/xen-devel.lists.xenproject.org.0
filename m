Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD042C588A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 16:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38699.71482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJa3-0004M6-TH; Thu, 26 Nov 2020 15:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38699.71482; Thu, 26 Nov 2020 15:53:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJa3-0004LN-P8; Thu, 26 Nov 2020 15:53:11 +0000
Received: by outflank-mailman (input) for mailman id 38699;
 Thu, 26 Nov 2020 15:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kiJa2-0004Dd-8F
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:53:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c67c59f9-4127-43c7-83f7-6e995a80dadc;
 Thu, 26 Nov 2020 15:53:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3B9531B;
 Thu, 26 Nov 2020 07:53:06 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F7FA3F23F;
 Thu, 26 Nov 2020 07:53:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kiJa2-0004Dd-8F
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:53:10 +0000
X-Inumbo-ID: c67c59f9-4127-43c7-83f7-6e995a80dadc
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id c67c59f9-4127-43c7-83f7-6e995a80dadc;
	Thu, 26 Nov 2020 15:53:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3B9531B;
	Thu, 26 Nov 2020 07:53:06 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F7FA3F23F;
	Thu, 26 Nov 2020 07:53:06 -0800 (PST)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/7] xen/arm: Add CP10 exception support to handle VMFR
Date: Thu, 26 Nov 2020 15:51:08 +0000
Message-Id: <18f51a4276f50e270f80d1d7d13b156509233cac.1606151462.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>

Add support for cp10 exceptions decoding to be able to emulate the
values for VMFR0 and VMFR1 when TID3 bit of HSR is activated.
This is required for aarch32 guests accessing VMFR0 and VMFR1 using vmrs
and vmsr instructions.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/traps.c             |  5 +++++
 xen/arch/arm/vcpreg.c            | 38 ++++++++++++++++++++++++++++++++
 xen/include/asm-arm/perfc_defn.h |  1 +
 xen/include/asm-arm/traps.h      |  1 +
 4 files changed, 45 insertions(+)

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
index d0c6406f34..9d6a36ca5d 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -634,6 +634,44 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
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
+     * In this case MVFR2 is not supported as the instruction does not support
+     * it.
+     * Exception encoding is using MRC/MCR standard with the reg field in Crn
+     * as are declared MVFR0 and MVFR1 in cpregs.h
+     */
+    GENERATE_TID3_INFO(MVFR0, mvfr, 0)
+    GENERATE_TID3_INFO(MVFR1, mvfr, 1)
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


