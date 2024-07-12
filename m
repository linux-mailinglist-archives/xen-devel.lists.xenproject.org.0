Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879BE92FE59
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758149.1167497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz9-0004iw-Gg; Fri, 12 Jul 2024 16:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758149.1167497; Fri, 12 Jul 2024 16:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz9-0004fO-CU; Fri, 12 Jul 2024 16:19:03 +0000
Received: by outflank-mailman (input) for mailman id 758149;
 Fri, 12 Jul 2024 16:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSIz7-00040f-OL
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:19:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e22411-406a-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:19:01 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso2943721a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:19:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm4669169a12.15.2024.07.12.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:18:59 -0700 (PDT)
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
X-Inumbo-ID: 72e22411-406a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801140; x=1721405940; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0C/9rghoKuThfbYBBAzL0tAO029l075q93CgDcGue8=;
        b=fZEo7Jgt02lk/DQ8uvhYOevUnfq9AF0WeUAlTjNUT6eQEKQsFqe2N2q39mvnRyZS5e
         XO/7nojXV5rKNo8ex845O3NPEJgJ+WyXWVB69waaXqrOA/AqMO73Qm4yaSkzCxAeXBtE
         tlsvCn87ZQ9P/m8CHZ9cEJQBudT9Tj2cD+OmdZEHCQKAHqd+6r7w+x/Gx0Nb6DXPEjmt
         FesAcRcHWGjLWfWoDeW2C61TC1d9C+MqcsWhagTMdImiK6Uyg97rmCkz0E2LoeCuBBsS
         sElIZLQBk7yoX8eNpBGaG+ft405LJlQPrIg3oSIdc1/eRDY2m4OBshMh7crf9MhjicUw
         1xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801140; x=1721405940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0C/9rghoKuThfbYBBAzL0tAO029l075q93CgDcGue8=;
        b=jJXlFuL6XYEOGhjhZUQ8amz9TkLXHdOdeptqYFhrjWWA4zfJNqZ76uHPVkqV1ccONs
         zw5mW4MdW9FEMZaXV4bG55Chl+kuu/dEXkYeDPslFpxsSyI0XF3R2E28PUPCtnWfbTmK
         NOCzuBcmfYcyLCvFSCVDqDcLcONhCJbXT7809DXIj2GsLuGicic6m3HI0gmBm4VjYR4v
         FsDsReUfI0cvfcrTn/MUnUe8JSRqDIfwNgGsXzJDrOJ0DvTzlWp2V1lR3Ub1jLFUpBr0
         uO0fHz0Wz0iEpwzeADWHRrdyRcZWaNsx8Ify+/cl4MpY3JC2pjjlgFqXXeGQK6/a+J0r
         WYiw==
X-Gm-Message-State: AOJu0YycLmLMkIx9tqRyHs4iSs0t+rslRQf7OfUwbEDM9wB5DsjK1+s1
	KOX84Q7dmRKJf5Qh6y2+1BmXKbXQyM8MSJWQlbr6jf3bGoQ8NtjhuAYLTbqH
X-Google-Smtp-Source: AGHT+IHMCmazHpXLAa9xShPyez/uzRL10FRAkizhRobVMY2criCmK6BPZE5sZVwUOXOYsN/owRJ9zw==
X-Received: by 2002:a05:6402:1911:b0:57c:5b7a:87e7 with SMTP id 4fb4d7f45d1cf-594ba0cbecemr9569042a12.14.1720801140259;
        Fri, 12 Jul 2024 09:19:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 4/5] xen/riscv: enable GENERIC_BUG_FRAME
Date: Fri, 12 Jul 2024 18:18:53 +0200
Message-ID: <c2bbbe2ac9f41c19f746418df324212b2e4684a5.1720799487.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799487.git.oleksii.kurochko@gmail.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
it is needed to enable GENERIC_BUG_FRAME.

Also, <xen/lib.h> is needed to be included for the reason that panic() and
printk() are used in common/bug.c and RISC-V fails if it is not included
with the following errors:
   common/bug.c:69:9: error: implicit declaration of function 'printk'
   [-Werror=implicit-function-declaration]
      69 |         printk("Xen WARN at %s%s:%d\n", prefix, filename,
   lineno);
         |         ^~~~~~
   common/bug.c:77:9: error: implicit declaration of function 'panic'
   [-Werror=implicit-function-declaration]
      77 |         panic("Xen BUG at %s%s:%d\n", prefix, filename,
   lineno);

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V10:
 - put 'select GENERIC_BUG_FRAME' in "Config RISCV".
 - rework do_trap() to not fetch an instruction in case when the cause of trap
   is BUG_insn.
 - drop read_instr() and is_valid_bug_insn().
 - update the commit message.
---
Changes in V9:
 - Rebase on the top of current staging.
 - use GENERIC_BUG_FRAME as now we have common code available.
 - add xen/lib.h to bug.c to fix a compilation error around printk.
 - update the commit message.
 - update the code of read_instr() in traps.c
 - fold two-s if into 1 in do_trap.
---
Changes in V8:
  - remove Pointless initializer of id.
  - make bug_frames[] array constant.
  - remove cast_to_bug_frame(addr).
  - rename is_valig_bugaddr to is_valid_bug_insn().
  - add check that read_instr is used only on xen code
  - update the commit message.
---
Changes in V7:
 - move to this patch the definition of cast_to_bug_frame() from the previous patch.
 - update the comment in bug.h.
 - update the comment above do_bug_frame().
 - fix code style.
 - add comment to read_instr func.
 - add space for bug_frames in lds.S.
---
Changes in V6:
  - Avoid LINK_TO_LOAD() as bug.h functionality expected to be used
    after MMU is enabled.
  - Change early_printk() to printk()
---
Changes in V5:
  - Remove "#include <xen/types.h>" from <asm/bug.h> as there is no any need in it anymore
  - Update macros GET_INSN_LENGTH: remove UL and 'unsigned int len;' from it
  - Remove " include <xen/bug.h>" from risc/setup.c. it is not needed in the current version of
    the patch
  - change an argument type from vaddr_t to uint32_t for is_valid_bugaddr and introduce read_instr() to
    read instruction properly as the length of qinstruction can be either 32 or 16 bits.
  - Code style fixes
  - update the comments before do_bug_frame() in riscv/trap.c
  - Refactor is_valid_bugaddr() function.
  - introduce macros cast_to_bug_frame(addr) to hide casts.
  - use LINK_TO_LOAD() for addresses which are linker time relative.
---
Changes in V4:
  - Updates in RISC-V's <asm/bug.h>:
    * Add explanatory comment about why there is only defined for 32-bits length
      instructions and 16/32-bits BUG_INSN_{16,32}.
    * Change 'unsigned long' to 'unsigned int' inside GET_INSN_LENGTH().
    * Update declaration of is_valid_bugaddr(): switch return type from int to bool
      and the argument from 'unsigned int' to 'vaddr'.
  - Updates in RISC-V's traps.c:
    * replace /xen and /asm includes
    * update definition of is_valid_bugaddr():switch return type from int to bool
      and the argument from 'unsigned int' to 'vaddr'. Code style inside function
      was updated too.
    * do_bug_frame() refactoring:
      * local variables start and bug became 'const struct bug_frame'
      * bug_frames[] array became 'static const struct bug_frame[] = ...'
      * remove all casts
      * remove unneeded comments and add an explanatory comment that the do_bug_frame()
        will be switched to a generic one.
    * do_trap() refactoring:
      * read 16-bits value instead of 32-bits as compressed instruction can
        be used and it might happen than only 16-bits may be accessible.
      * code style updates
      * re-use instr variable instead of re-reading instruction.
  - Updates in setup.c:
    * add blank line between xen/ and asm/ includes.
---
Changes in V3:
  - Rebase the patch "xen/riscv: introduce an implementation of macros
    from <asm/bug.h>" on top of patch series [introduce generic implementation
    of macros from bug.h]
---
Changes in V2:
  - Remove __ in define namings
  - Update run_in_exception_handler() with
    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
  - Remove bug_instr_t type and change it's usage to uint32_t
---
 xen/arch/riscv/Kconfig |  1 +
 xen/arch/riscv/traps.c | 25 ++++++++++++++++++++++++-
 xen/common/bug.c       |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index b4b354a778..f531e96657 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,6 +1,7 @@
 config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
+	select GENERIC_BUG_FRAME
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index cb18b30ff2..e39603dc95 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,7 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 
@@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
 
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
-    do_unexpected_trap(cpu_regs);
+    register_t pc = cpu_regs->sepc;
+    unsigned long cause = csr_read(CSR_SCAUSE);
+
+    switch ( cause )
+    {
+    case CAUSE_BREAKPOINT:
+        if ( do_bug_frame(cpu_regs, pc) >= 0 )
+        {
+            if ( !pc ||
+                 !(is_kernel_text(pc + 1) || is_kernel_inittext(pc + 1)) )
+            {
+                printk("Something wrong with PC: 0x%lx\n", pc);
+                die();
+            }
+
+            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
+            return;
+        }
+
+        break;
+    default:
+        do_unexpected_trap(cpu_regs);
+    }
 }
 
 void vcpu_show_execution_state(struct vcpu *v)
diff --git a/xen/common/bug.c b/xen/common/bug.c
index b7c5d8fd4d..75cb35fcfa 100644
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -1,6 +1,7 @@
 #include <xen/bug.h>
 #include <xen/errno.h>
 #include <xen/kernel.h>
+#include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/string.h>
 #include <xen/types.h>
-- 
2.45.2


