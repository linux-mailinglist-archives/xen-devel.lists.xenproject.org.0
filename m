Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B740493B3B9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764286.1174690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxh-0006NL-Ki; Wed, 24 Jul 2024 15:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764286.1174690; Wed, 24 Jul 2024 15:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxh-0006JB-Gv; Wed, 24 Jul 2024 15:31:29 +0000
Received: by outflank-mailman (input) for mailman id 764286;
 Wed, 24 Jul 2024 15:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdxf-0005Od-VW
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:27 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b6fadd-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:25 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef2d582e31so38976521fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef26f1bc4asm14240491fa.40.2024.07.24.08.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:24 -0700 (PDT)
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
X-Inumbo-ID: c9b6fadd-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835085; x=1722439885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpktRcDF4JrvwzNydeWsiF50yQbYjN8viWEOOJ/BjaU=;
        b=hGRw7yGdLUCk6LwVIMhK6Gfi+FUyO4VVBomGkhwNa3bv8IpBRatDtKsAHyXTTbmJBA
         f0OjEDWfpAugXSNYyEfzzgZFrvVCmYHF+jlCoEpgGlg1MfZ3ebPvLZX6DEEoow4KjBGd
         5czRDPo4L/4ajAdmD68EnmrcL6E/ovEBpMAlJGvlng1meIVn/0NZXXPhKyBOdkPI2VAM
         e6/B3jVAsW2B3D7gzNT1rkTsj9WZkczS3JjbbM5lm2a3b4RRxxk8L9/Iv+LazsihmDKb
         oDkaTvTxeySdx0Sjlell2fDwi9YekKFU8tbMI55WevAY5lfRQFt2z9HWRqydUGB+VDjT
         qChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835085; x=1722439885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpktRcDF4JrvwzNydeWsiF50yQbYjN8viWEOOJ/BjaU=;
        b=ANlELxkhBhzOYnJkIBNsYswwtkoGixV2dE8JUB2w1+ZBuBg1ugM04bW3/O3CFbb4Mq
         86nsWr61F+yskP5jtou0Pb5PZzvqZ0/xdVpXn5kKwiPhe4OiTr6DQZxWrA3PZJSWxGGN
         TZ5qoP7Phlyo+HVQrTVsAOX4/PCPM3GrP/+ITzvF6o/Loi67+D/YgznAZCko8GGuDkyq
         S8Xxw76j829nCJmkXp1aGwZlPxit4zlyYPYmocRhtDX6Fn7YDcIELk2P9PHjXXABhyD1
         jhY9DMtNMBxNNAw47kSdKwtihTdQshr/8LD/TAnCeMIujhEM4rWzEFMneTzNaqLtrtEk
         G4iQ==
X-Gm-Message-State: AOJu0YyWaQbw+l4Gn4vEsmKtVo0Q4Di9pwpQBQuZn0RUtEY4eS7RgygQ
	449FOGd1m8/EQqNPlNhJsCauclQfiOL/dPm3JAJ5PXMeUqw/YSydIc0NtzWx
X-Google-Smtp-Source: AGHT+IELHpp33w+d2EYJm05wyLCODNBCJpRwvJRY8k7ZAX0tgnXUa47x7DGhJXJpLl7gMEbK/r92dw==
X-Received: by 2002:a2e:a543:0:b0:2ef:18b7:440a with SMTP id 38308e7fff4ca-2f039cdb6b2mr2098601fa.22.1721835084463;
        Wed, 24 Jul 2024 08:31:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
Date: Wed, 24 Jul 2024 17:31:18 +0200
Message-ID: <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721731887.git.oleksii.kurochko@gmail.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
it is needed to enable GENERIC_BUG_FRAME.

ebreak is used as BUG_insn so when macros from <xen/bug.h> are
used, an exception with BREAKPOINT cause will be generated.

ebreak triggers a debug trap, which starts in debug mode and is
then filtered by every mode. A debugger will first handle the
debug trap and check if ebreak was set by it or not. If not,
CAUSE_BREAKPOINT will be generated for the mode where the ebreak
instruction was executed.

Also, <xen/lib.h> is needed to be included for the reason that panic() and
printk() are used in common/bug.c and RISC-V fails if it is not included.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V11:
  - update the commit message
  - change "%lx" to "%#x" for PC register printing.
  - drop +1 in argument of is_kernel_text(pc) and is_kernel_inittext(pc).
  - drop return for case CAUSE_BREAKPOINT.
  - add break to default and add a blank like above it.
  - add a comment CAUSE_BREAKPOINT is handled instead of illegal instruction.
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
 xen/arch/riscv/traps.c | 35 ++++++++++++++++++++++++++++++++++-
 xen/common/bug.c       |  1 +
 3 files changed, 36 insertions(+), 1 deletion(-)

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
index cb18b30ff2..6802827eb5 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,7 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 
@@ -103,7 +104,39 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
 
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
-    do_unexpected_trap(cpu_regs);
+    register_t pc = cpu_regs->sepc;
+    unsigned long cause = csr_read(CSR_SCAUSE);
+
+    switch ( cause )
+    {
+    /*
+     * ebreak is used as BUG_insn so when macros from <xen/bug.h> are
+     * used, an exception with BREAKPOINT cause will be generated.
+     *
+     * ebreak triggers a debug trap, which starts in debug mode and is
+     * then filtered by every mode. A debugger will first handle the
+     * debug trap and check if ebreak was set by it or not. If not,
+     * CAUSE_BREAKPOINT will be generated for the mode where the ebreak
+     * instruction was executed.
+     */
+    case CAUSE_BREAKPOINT:
+        if ( do_bug_frame(cpu_regs, pc) >= 0 )
+        {
+            if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
+            {
+                printk("Something wrong with PC: %#lx\n", pc);
+                die();
+            }
+
+            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
+        }
+
+        break;
+
+    default:
+        do_unexpected_trap(cpu_regs);
+        break;
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


