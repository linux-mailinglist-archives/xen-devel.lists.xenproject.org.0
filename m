Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCjiNW435mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5509442D065
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286091.1567243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZH-0005Sa-D4; Mon, 20 Apr 2026 14:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286091.1567243; Mon, 20 Apr 2026 14:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZH-0005Px-8b; Mon, 20 Apr 2026 14:25:43 +0000
Received: by outflank-mailman (input) for mailman id 1286091;
 Mon, 20 Apr 2026 14:25:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZF-0005A0-PH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZF-00BFc6-3z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63753-2eae-0a2a0a5409dd-0a2a4506d4a6-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:41 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63764-7371-0a2a45060019-d98c6eacd072-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:40 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E45E16F2;
 Mon, 20 Apr 2026 07:25:34 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C672D3F7B4;
 Mon, 20 Apr 2026 07:25:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776695139; bh=7NVH7QgOJjbAjD26LtB1wsu/7pirLzYhzd1KxWkCV3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvOv0+BNiAmystHk22rMykjakgdlygV7SrTPltD8ab7waAmmUa31WhoZzlpJdGt7F
	 I8PWWqtYNrHctgT7lPpZHHx7UG+2XfDVBJIeUy70KVcrhA/I/BTbpGJ8gIj67YRj4a
	 b3CJU/1qMHWc1ZUjO2n+mciwDDplK3Y1c3rX3Rwo=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 5/8] xen/arm: enable MMIO region trap in MPU system
Date: Mon, 20 Apr 2026 15:25:21 +0100
Message-Id: <20260420142524.1804073-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776695141-91985D75-F6D49A57/0/0
X-purgate-type: clean
X-purgate-size: 5352
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@arm.com,m:wei.chen@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,hsr.ec:url];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.386];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5509442D065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Penny Zheng <Penny.Zheng@arm.com>

MMIO region traps, generating from insufficient access permissions,
will lead to data abort with Permission Fault in MPU system.
It is different with MMU system, which generates Translation Fault
instead.

We extract common codes for dealing with MMIO trap into a new helper
do_mmio_trap_stage2_abort_guest().

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/traps.c | 83 ++++++++++++++++++++++++++++++--------------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0c01f37ad6b4..081bd2e51979 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1815,6 +1815,47 @@ static inline bool check_p2m(bool is_data, paddr_t gpa)
     return false;
 }
 
+static int do_mmio_trap_stage2_abort_guest(struct cpu_user_regs *regs,
+                                           const union hsr hsr,
+                                           mmio_info_t *info,
+                                           vaddr_t gva, paddr_t gpa)
+{
+    enum io_state state;
+
+    state = try_handle_mmio(regs, info);
+
+    switch ( state )
+    {
+        case IO_ABORT:
+            gdprintk(XENLOG_DEBUG,
+                    "HSR=%#"PRIregister" pc=%#"PRIregister" gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
+                    hsr.bits, regs->pc, gva, gpa);
+            inject_dabt_exception(regs, gva);
+            break;
+        case IO_HANDLED:
+            /*
+             * If the instruction was decoded and has executed successfully
+             * on the MMIO region, then Xen should execute the next part of
+             * the instruction. (for eg increment the rn if it is a
+             * post-indexing instruction.
+             */
+            finalize_instr_emulation(&info->dabt_instr);
+            advance_pc(regs, hsr);
+            break;
+        case IO_RETRY:
+            /* finish later */
+            break;
+        case IO_UNHANDLED:
+            /* IO unhandled, try another way to handle it. */
+            return -EFAULT;
+        default:
+            ASSERT_UNREACHABLE();
+            return -EFAULT;
+    }
+
+    return 0;
+}
+
 static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
                                        const union hsr hsr)
 {
@@ -1829,7 +1870,6 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
     uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
     bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
     mmio_info_t info;
-    enum io_state state;
 
     /*
      * If this bit has been set, it means that this stage-2 abort is caused
@@ -1863,6 +1903,8 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             return; /* Try again */
     }
 
+    info.gpa = gpa;
+    info.dabt = hsr.dabt;
     switch ( fsc )
     {
     case FSC_FLT_PERM:
@@ -1876,6 +1918,17 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         };
 
         p2m_mem_access_check(gpa, gva, npfec);
+
+#if !defined(CONFIG_MMU)
+        /*
+         * MMIO region traps, generating from insufficient access permissions,
+         * will lead to data abort with Permission fault.
+         */
+        if ( is_data && (do_mmio_trap_stage2_abort_guest(regs, hsr, &info, gva,
+                                                         gpa) == 0) )
+            return;
+#endif
+
         /*
          * The only way to get here right now is because of mem_access,
          * thus reinjecting the exception to the guest is never required.
@@ -1884,9 +1937,6 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
     }
     case FSC_FLT_TRANS:
     {
-        info.gpa = gpa;
-        info.dabt = hsr.dabt;
-
         /*
          * Assumption :- Most of the times when we get a data abort and the ISS
          * is invalid or an instruction abort, the underlying cause is that the
@@ -1923,29 +1973,8 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         if ( (info.dabt_instr.state == INSTR_VALID) && check_p2m(is_data, gpa) )
             return;
 
-        state = try_handle_mmio(regs, &info);
-
-        switch ( state )
-        {
-            case IO_ABORT:
-                goto inject_abt;
-            case IO_HANDLED:
-                /*
-                 * If the instruction was decoded and has executed successfully
-                 * on the MMIO region, then Xen should execute the next part of
-                 * the instruction. (for eg increment the rn if it is a
-                 * post-indexing instruction.
-                 */
-                finalize_instr_emulation(&info.dabt_instr);
-                advance_pc(regs, hsr);
-                return;
-            case IO_RETRY:
-                /* finish later */
-                return;
-            case IO_UNHANDLED:
-                /* IO unhandled, try another way to handle it. */
-                break;
-        }
+        if ( do_mmio_trap_stage2_abort_guest(regs, hsr, &info, gva, gpa) == 0 )
+            return;
 
         break;
     }
-- 
2.34.1


