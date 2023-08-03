Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D00176E7CA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576309.902327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX5B-0004F8-Sd; Thu, 03 Aug 2023 12:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576309.902327; Thu, 03 Aug 2023 12:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX5B-000455-I1; Thu, 03 Aug 2023 12:05:33 +0000
Received: by outflank-mailman (input) for mailman id 576309;
 Thu, 03 Aug 2023 12:05:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX59-0002sc-P8
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:31 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a391522-31f6-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 14:05:29 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe0e23a4b1so1554116e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:28 -0700 (PDT)
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
X-Inumbo-ID: 0a391522-31f6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064329; x=1691669129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0T/c4H8PYV8a+tUf8bqa7kNmhfFOIl+4o24A/6F65Y=;
        b=m802bzewGsdutyqXiwNNiqsYfn3M4z9y5xCanYDSAoA3f8ePVkg/q+T3QSz1krZJbW
         jjE8Xme9E05+k17DEBsRkiMxZZykmstizUoamdINVEJCYaIYmeHaHYC9ZVoVkasrusoA
         uf5rdFd9/O+WPvJhaFwBNPQs2EImt+HITbwLhyIKB2WpT/gVrGZpyDy/LQDO4RiHAiPz
         gov6/EsKwHHrHiJ03r9iFFaks7XPrryTi/ovEt/VWVMnw0jgF22Xz7tTfh9cI5elTtD2
         5VfQWJx/V7Y2a1p0RNkqKmTGedc6bUl0Rh/szGEDOmkoLoM9ZDoxeEEKbtVLYPeUx8Ob
         O8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064329; x=1691669129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0T/c4H8PYV8a+tUf8bqa7kNmhfFOIl+4o24A/6F65Y=;
        b=iKYl6iSfjwVm7hBvMLRCItxmHJYRF9QbfVImBux0YncG32F06xsVe31eMDWjJ0+vie
         hXyyXCmiMKFBszlw9D7JtTFL74Gn6Ue2tAKRrX7bcktHsWx0R+FPu0kPMITQ19S+J8YZ
         5vks78AEE4lWi+8mD6Y3+vOK2c7JUpddKeVNEpQvltD16Kkwi3IPbqxmk6ySrwVEbxfd
         IMc/tF4f8KqI+SM0jkAc18/UnVZ4xdAUoEpGX8M8WHWMrQhqXLKiuQzr8pnCDsr4zEkb
         vZHGjLoYWaFwhKfrP1BAtYLRLBd6R7HRh+fPIvmpAXIG7pN5/7rgtKMG1tWVA0JfeiJ0
         EbGg==
X-Gm-Message-State: ABy/qLY60VFWowZGvnfR/5SRbw1eD9uO5VITQs4c4IVhsXXyoYxpaUpx
	KUFFmj77MAhjFD7c+V9N0pZj4SWzuCk=
X-Google-Smtp-Source: APBJJlFcG/cnXqx2b/EBsYl3rOroJ1/VDytVVW7Wh4XLH1gBRwg4iEuipD+1UxKgXe6vmMzf+NnUCA==
X-Received: by 2002:ac2:5b4e:0:b0:4fe:1f1c:184f with SMTP id i14-20020ac25b4e000000b004fe1f1c184fmr7005761lfp.44.1691064329028;
        Thu, 03 Aug 2023 05:05:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 5/6] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Thu,  3 Aug 2023 15:05:21 +0300
Message-ID: <9fdda7716faf412f1e2cdf9a990c98e64c4b21f3.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691063432.git.oleksii.kurochko@gmail.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces macros: BUG(), WARN(), run_in_exception(),
assert_failed.
To be precise, the macros from generic bug implementation (<xen/bug.h>)
will be used.

The implementation uses "ebreak" instruction in combination with
diffrent bug frame tables (for each type) which contains useful
information.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/bug.h |  27 +++++++
 xen/arch/riscv/traps.c           | 128 +++++++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S         |  10 +++
 3 files changed, 165 insertions(+)

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index e8b1e40823..f5ff96140f 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -7,4 +7,31 @@
 #ifndef _ASM_RISCV_BUG_H
 #define _ASM_RISCV_BUG_H
 
+#ifndef __ASSEMBLY__
+
+#define BUG_INSTR "ebreak"
+
+/*
+ * The base instruction set has a fixed length of 32-bit naturally aligned
+ * instructions.
+ *
+ * There are extensions of variable length ( where each instruction can be
+ * any number of 16-bit parcels in length ).
+ *
+ * Compressed ISA is used now where the instruction length is 16 bit  and
+ * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
+ * depending on if compressed ISA is used or not )
+ */
+#define INSN_LENGTH_MASK        _UL(0x3)
+#define INSN_LENGTH_32          _UL(0x3)
+
+#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
+#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
+#define COMPRESSED_INSN_MASK    _UL(0xffff)
+
+#define GET_INSN_LENGTH(insn)                               \
+    (((insn) & INSN_LENGTH_MASK) == INSN_LENGTH_32 ? 4 : 2) \
+
+#endif /* !__ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_BUG_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 3e08ec44f7..439c098c22 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,8 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
 
 #include <asm/csr.h>
@@ -12,6 +14,8 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+#define cast_to_bug_frame(addr) ((const struct bug_frame *)(addr))
+
 /*
  * Initialize the trap handling.
  *
@@ -101,7 +105,131 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    printk("implement show_execution_state(regs)\n");
+}
+
+/*
+ * TODO: generic do_bug_frame() should be used instead of current
+ * implementation panic(), printk() and find_text_region()
+ * (virtual memory?) will be ready/merged
+ */
+int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
+{
+    const struct bug_frame *start, *end;
+    const struct bug_frame *bug = NULL;
+    unsigned int id = 0;
+    const char *filename, *predicate;
+    int lineno;
+
+    static const struct bug_frame *bug_frames[] = {
+        &__start_bug_frames[0],
+        &__stop_bug_frames_0[0],
+        &__stop_bug_frames_1[0],
+        &__stop_bug_frames_2[0],
+        &__stop_bug_frames_3[0],
+    };
+
+    for ( id = 0; id < BUGFRAME_NR; id++ )
+    {
+        start = cast_to_bug_frame(bug_frames[id]);
+        end   = cast_to_bug_frame(bug_frames[id + 1]);
+
+        while ( start != end )
+        {
+            if ( (vaddr_t)bug_loc(start) == pc )
+            {
+                bug = start;
+                goto found;
+            }
+
+            start++;
+        }
+    }
+
+ found:
+    if ( bug == NULL )
+        return -ENOENT;
+
+    if ( id == BUGFRAME_run_fn )
+    {
+        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
+
+        fn(regs);
+
+        goto end;
+    }
+
+    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
+    filename = bug_ptr(bug);
+    lineno = bug_line(bug);
+
+    switch ( id )
+    {
+    case BUGFRAME_warn:
+        printk("Xen WARN at %s:%d\n", filename, lineno);
+
+        show_execution_state(regs);
+
+        goto end;
+
+    case BUGFRAME_bug:
+        printk("Xen BUG at %s:%d\n", filename, lineno);
+
+        show_execution_state(regs);
+
+        printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+
+        printk("Assertion %s failed at %s:%d\n", predicate, filename, lineno);
+
+        show_execution_state(regs);
+
+        printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+    }
+
+    return -EINVAL;
+
+ end:
+    return 0;
+}
+
+static bool is_valid_bugaddr(uint32_t insn)
+{
+    return insn == BUG_INSN_32 ||
+           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
+}
+
+/* Should be used only in Xen code ? */
+static uint32_t read_instr(unsigned long pc)
+{
+    uint16_t instr16 = *(uint16_t *)pc;
+
+    if ( GET_INSN_LENGTH(instr16) == 2 )
+        return (uint32_t)instr16;
+    else
+        return *(uint32_t *)pc;
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint32_t instr = read_instr(pc);
+
+    if ( is_valid_bugaddr(instr) )
+    {
+        if ( !do_bug_frame(cpu_regs, pc) )
+        {
+            cpu_regs->sepc += GET_INSN_LENGTH(instr);
+            return;
+        }
+    }
+
     do_unexpected_trap(cpu_regs);
 }
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 3fa7db3bf9..a10e0ad87c 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -45,6 +45,16 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata = .;          /* Read-only data */
+        /* Bug frames table */
+        __start_bug_frames = .;
+        *(.bug_frames.0)
+        __stop_bug_frames_0 = .;
+        *(.bug_frames.1)
+        __stop_bug_frames_1 = .;
+        *(.bug_frames.2)
+        __stop_bug_frames_2 = .;
+        *(.bug_frames.3)
+        __stop_bug_frames_3 = .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
-- 
2.41.0


