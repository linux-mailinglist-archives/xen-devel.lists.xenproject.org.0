Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401B819D8F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657632.1026624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMD-0005BW-U2; Wed, 20 Dec 2023 11:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657632.1026624; Wed, 20 Dec 2023 11:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMD-00057L-Qk; Wed, 20 Dec 2023 11:03:21 +0000
Received: by outflank-mailman (input) for mailman id 657632;
 Wed, 20 Dec 2023 11:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMC-0004rG-59
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6227cee9-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:03:19 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id 8BE794EE0C9A;
 Wed, 20 Dec 2023 12:03:18 +0100 (CET)
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
X-Inumbo-ID: 6227cee9-9f27-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 2/7] xen/arm: traps: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:02 +0100
Message-Id: <90c6cdb780ff7b75aada2a8a8a2df5d9e8b94b78.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703066935.git.federico.serafini@bugseng.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
shall terminate every switch-clause".

Add missing break statements to address violations of Rule 16.3.
Add pseudo-keyword "fallthrough" to make explicit the intended
behavior and satisfy the requirements to deviate Rule 16.3.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/traps.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 77220ba092..9c10e8f78c 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1414,10 +1414,18 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
     {
         /* Deliberately corrupt parameter regs used by this hypercall. */
         switch ( hypercall_args[*nr] ) {
-        case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEFU;
-        case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEFU;
-        case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEFU;
-        case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEFU;
+        case 5:
+            HYPERCALL_ARG5(regs) = 0xDEADBEEFU;
+            fallthrough;
+        case 4:
+            HYPERCALL_ARG4(regs) = 0xDEADBEEFU;
+            fallthrough;
+        case 3:
+            HYPERCALL_ARG3(regs) = 0xDEADBEEFU;
+            fallthrough;
+        case 2:
+            HYPERCALL_ARG2(regs) = 0xDEADBEEFU;
+            fallthrough;
         case 1: /* Don't clobber x0/r0 -- it's the return value */
         case 0: /* -ENOSYS case */
             break;
@@ -1929,6 +1937,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         gprintk(XENLOG_WARNING,
                 "Unsupported FSC: HSR=%#"PRIregister" DFSC=%#x\n",
                 hsr.bits, xabt.fsc);
+        break;
     }
 
 inject_abt:
@@ -2136,6 +2145,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_regs *regs)
                 "Unknown Guest Trap. HSR=%#"PRIregister" EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
                 hsr.bits, hsr.ec, hsr.len, hsr.iss);
         inject_undef_exception(regs, hsr);
+        break;
     }
 }
 
-- 
2.34.1


