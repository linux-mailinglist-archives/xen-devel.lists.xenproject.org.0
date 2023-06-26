Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9173D667
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554992.866536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4l-0004yW-70; Mon, 26 Jun 2023 03:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554992.866536; Mon, 26 Jun 2023 03:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4k-0004nK-Ue; Mon, 26 Jun 2023 03:39:38 +0000
Received: by outflank-mailman (input) for mailman id 554992;
 Mon, 26 Jun 2023 03:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2p-0007ej-OP
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cc4ae79f-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEE21FB;
 Sun, 25 Jun 2023 20:38:22 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B952C3F64C;
 Sun, 25 Jun 2023 20:37:35 -0700 (PDT)
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
X-Inumbo-ID: cc4ae79f-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 48/52] xen/mpu: enable MMIO region trap in MPU system
Date: Mon, 26 Jun 2023 11:34:39 +0800
Message-Id: <20230626033443.2943270-49-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MMIO region traps, generating from insufficient access permissions,
will lead to data abort with Permission Fault in MPU system.
It is different with MMU system, which generates Translation Fault instead.

We extract common codes for dealing with MMIO trap into a new helper
do_mmio_trap_stage2_abort_guest().

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/traps.c | 81 +++++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ef5c6a8195..bffa147c36 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1848,6 +1848,45 @@ static inline bool check_p2m(bool is_data, paddr_t gpa)
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
+    switch ( state )
+    {
+        case IO_ABORT:
+            goto inject_abt;
+        case IO_HANDLED:
+            /*
+             * If the instruction was decoded and has executed successfully
+             * on the MMIO region, then Xen should execute the next part of
+             * the instruction. (for eg increment the rn if it is a
+             * post-indexing instruction.
+             */
+            finalize_instr_emulation(&info->dabt_instr);
+            advance_pc(regs, hsr);
+            return 0;
+        case IO_RETRY:
+            /* finish later */
+            return 0;
+        case IO_UNHANDLED:
+            /* IO unhandled, try another way to handle it. */
+            return -EFAULT;
+    }
+
+inject_abt:
+    gdprintk(XENLOG_DEBUG,
+             "HSR=%#"PRIregister" pc=%#"PRIregister" gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
+             hsr.bits, regs->pc, gva, gpa);
+    inject_dabt_exception(regs, gva, hsr.len);
+
+    return 0;
+}
+
 static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
                                        const union hsr hsr)
 {
@@ -1862,7 +1901,6 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
     uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
     bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
     mmio_info_t info;
-    enum io_state state;
 
     /*
      * If this bit has been set, it means that this stage-2 abort is caused
@@ -1896,6 +1934,8 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             return; /* Try again */
     }
 
+    info.gpa = gpa;
+    info.dabt = hsr.dabt;
     switch ( fsc )
     {
     case FSC_FLT_PERM:
@@ -1909,6 +1949,17 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         };
 
         p2m_mem_access_check(gpa, gva, npfec);
+
+#ifdef CONFIG_HAS_MPU
+        /*
+         * MMIO region traps, generating from insufficient access permissions,
+         * will lead to data abort with Permission fault.
+         */
+        if ( is_data &&
+             (do_mmio_trap_stage2_abort_guest(regs, hsr, &info, gva, gpa) == 0) )
+            return;
+#endif
+
         /*
          * The only way to get here right now is because of mem_access,
          * thus reinjecting the exception to the guest is never required.
@@ -1917,9 +1968,6 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
     }
     case FSC_FLT_TRANS:
     {
-        info.gpa = gpa;
-        info.dabt = hsr.dabt;
-
         /*
          * Assumption :- Most of the times when we get a data abort and the ISS
          * is invalid or an instruction abort, the underlying cause is that the
@@ -1948,29 +1996,8 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         if ( info.dabt_instr.state == INSTR_ERROR )
             goto inject_abt;
 
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
 
         /*
          * If the instruction syndrome was invalid, then we already checked if
-- 
2.25.1


