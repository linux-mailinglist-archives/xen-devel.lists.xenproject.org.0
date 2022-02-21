Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7224BD946
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 12:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276171.472267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6Pw-0004gA-Mt; Mon, 21 Feb 2022 10:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276171.472267; Mon, 21 Feb 2022 10:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6Pw-0004eN-Jx; Mon, 21 Feb 2022 10:59:44 +0000
Received: by outflank-mailman (input) for mailman id 276171;
 Mon, 21 Feb 2022 10:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Uke=TE=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nM6Pu-0004eH-Np
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:59:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 571a5b84-9305-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 11:59:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2C281476;
 Mon, 21 Feb 2022 02:59:39 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.3.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343033F66F;
 Mon, 21 Feb 2022 02:59:38 -0800 (PST)
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
X-Inumbo-ID: 571a5b84-9305-11ec-8539-5f4723681683
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
Date: Mon, 21 Feb 2022 11:59:31 +0100
Message-Id: <20220221105931.12028-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a discussion [1] it seems like that renaming work has
been forgotten. Perform renaming of psr_mode_is_32bit to
regs_mode_is_32bit as the function no longer takes psr parameter.

[1] https://marc.info/?l=xen-devel&m=156457538423787&w=2

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/include/asm/regs.h |  2 +-
 xen/arch/arm/traps.c            | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index ec091a28a2..04e821138a 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -13,7 +13,7 @@
 
 #define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == m)
 
-static inline bool psr_mode_is_32bit(const struct cpu_user_regs *regs)
+static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_ARM_32
     return true;
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9339d12f58..0db8e42d65 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -896,7 +896,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
 
     if ( guest_mode )
     {
-        if ( psr_mode_is_32bit(regs) )
+        if ( regs_mode_is_32bit(regs) )
             show_registers_32(regs, ctxt, guest_mode, v);
 #ifdef CONFIG_ARM_64
         else
@@ -1631,7 +1631,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr)
     {
         unsigned long it;
 
-        BUG_ON( !psr_mode_is_32bit(regs) || !(cpsr & PSR_THUMB) );
+        BUG_ON( !regs_mode_is_32bit(regs) || !(cpsr & PSR_THUMB) );
 
         it = ( (cpsr >> (10-2)) & 0xfc) | ((cpsr >> 25) & 0x3 );
 
@@ -1656,7 +1656,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr)
 void advance_pc(struct cpu_user_regs *regs, const union hsr hsr)
 {
     register_t itbits, cond, cpsr = regs->cpsr;
-    bool is_thumb = psr_mode_is_32bit(regs) && (cpsr & PSR_THUMB);
+    bool is_thumb = regs_mode_is_32bit(regs) && (cpsr & PSR_THUMB);
 
     if ( is_thumb && (cpsr & PSR_IT_MASK) )
     {
@@ -2098,37 +2098,37 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
         advance_pc(regs, hsr);
         break;
     case HSR_EC_CP15_32:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp15_32);
         do_cp15_32(regs, hsr);
         break;
     case HSR_EC_CP15_64:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp15_64);
         do_cp15_64(regs, hsr);
         break;
     case HSR_EC_CP14_32:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp14_32);
         do_cp14_32(regs, hsr);
         break;
     case HSR_EC_CP14_64:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp14_64);
         do_cp14_64(regs, hsr);
         break;
     case HSR_EC_CP14_DBG:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp14_dbg);
         do_cp14_dbg(regs, hsr);
         break;
     case HSR_EC_CP10:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp10);
         do_cp10(regs, hsr);
         break;
     case HSR_EC_CP:
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_cp);
         do_cp(regs, hsr);
         break;
@@ -2139,7 +2139,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
          * ARMv7 (DDI 0406C.b): B1.14.8
          * ARMv8 (DDI 0487A.d): D1-1501 Table D1-44
          */
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_smc32);
         do_trap_smc(regs, hsr);
         break;
@@ -2147,7 +2147,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
     {
         register_t nr;
 
-        GUEST_BUG_ON(!psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_hvc32);
 #ifndef NDEBUG
         if ( (hsr.iss & 0xff00) == 0xff00 )
@@ -2162,7 +2162,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
     }
 #ifdef CONFIG_ARM_64
     case HSR_EC_HVC64:
-        GUEST_BUG_ON(psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(regs_mode_is_32bit(regs));
         perfc_incr(trap_hvc64);
 #ifndef NDEBUG
         if ( (hsr.iss & 0xff00) == 0xff00 )
@@ -2178,12 +2178,12 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
          *
          * ARMv8 (DDI 0487A.d): D1-1501 Table D1-44
          */
-        GUEST_BUG_ON(psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(regs_mode_is_32bit(regs));
         perfc_incr(trap_smc64);
         do_trap_smc(regs, hsr);
         break;
     case HSR_EC_SYSREG:
-        GUEST_BUG_ON(psr_mode_is_32bit(regs));
+        GUEST_BUG_ON(regs_mode_is_32bit(regs));
         perfc_incr(trap_sysreg);
         do_sysreg(regs, hsr);
         break;
-- 
2.29.0


