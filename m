Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310571492D
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 14:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540608.842503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkh-0006QD-RE; Mon, 29 May 2023 12:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540608.842503; Mon, 29 May 2023 12:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkh-0006Ju-Ks; Mon, 29 May 2023 12:13:31 +0000
Received: by outflank-mailman (input) for mailman id 540608;
 Mon, 29 May 2023 12:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi1m=BS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3bkg-0005DI-95
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 12:13:30 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38235dff-fe1a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 14:13:28 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af2e1725bdso39959611fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 05:13:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a2e964e000000b002ac87c15fd4sm2427762ljh.95.2023.05.29.05.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 05:13:26 -0700 (PDT)
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
X-Inumbo-ID: 38235dff-fe1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362407; x=1687954407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGRAwgV1/X9tXgdqrBZ2V9h6YU+/IZLXtXO6lnBKNgc=;
        b=BhOu4Ae/aJWmaV/4Fkq+tg/eZ+FemcZMvELH4qD4sK+/f2TTmCvN+iKQoyDYXyn7Z4
         2CVo8KZNghTDITtZePCZfONohTwxFzo11Q2I/samt/c/WRbwcAptcFfVSXSam50/Po16
         Svt0qtGXhcq9zh0FxML00zdW2vQ5AewvqrQmLNmiud9J5ASW6G619kng2eI1FtP7+qhh
         fO5nHeGpy5o/q7sXMANx+1jLrLPONUyKTcItWAfItQwDX4z9gsMnlBHLyR1C6lfgyPi8
         T+BWqcIFb3RziKoFTyaTn/+C/t9DXdTq5ccyqMIPLtztxGzUBXEkYJdxToCbj7A62L9u
         XVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362407; x=1687954407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGRAwgV1/X9tXgdqrBZ2V9h6YU+/IZLXtXO6lnBKNgc=;
        b=GKHTaygzvNhYjm85Lhoocl2Od8LptQObhkboTrBsmXPjaZ/pa4z/Y/p9dz2fKwPQMw
         3HzjSM/WKxgyKHNgXe4DqF703KrTqqd0GdAoazbRNRIgdUTSBNZuXd8ktlN58xafNQNo
         M7kY+ZaSs+1inkSflMOxmgh7Y4e/s2LLZOjzwmYWo8F688zAss5XtKMf0DqePFZVqX/i
         v6C/8XSOC76/H5n/TK1MrAiFYq9RU70UUpbTucHUHt2wMDLlTCeIW9pBJzZHxIiwgWSb
         FCywEzjnwy9Kmnm5wNjO3TXETuhKm5hIzaUlVVbn2Na/1zL6/DsJcTvdOEMnb8fKys7e
         d0mw==
X-Gm-Message-State: AC+VfDwqySRO2SEyl8z630gNRiazV+H/50SF3dxe0LhFFHMPiyhsfI4R
	OxdqN3JhphU//Bw5fMZvjBMcP/FTqjQ=
X-Google-Smtp-Source: ACHHUZ4X24KzltwWEPBY4ezedLUOWadfqfw7Wb+VGCa/0rc3MsIxgXlvFdTfbAFC+17nv9jiuAbTFw==
X-Received: by 2002:a05:651c:c2:b0:2a7:7493:9966 with SMTP id 2-20020a05651c00c200b002a774939966mr3195466ljr.24.1685362407086;
        Mon, 29 May 2023 05:13:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Mon, 29 May 2023 15:13:18 +0300
Message-Id: <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685359848.git.oleksii.kurochko@gmail.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/bug.h |  28 +++++++
 xen/arch/riscv/traps.c           | 129 +++++++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S         |  10 +++
 3 files changed, 167 insertions(+)

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index e8b1e40823..bf3194443f 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -7,4 +7,32 @@
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
+ * any number of 16-bit parcels in length ) but they aren't used in Xen
+ * and Linux kernel ( where these definitions were taken from ).
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
index 48c1059954..535fb058e1 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,8 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
 
 #include <asm/csr.h>
@@ -114,7 +116,134 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    printk("implement show_execution_state(regs)\n");
+}
+
+/*
+ * TODO: change early_printk's function to early_printk with format
+ *       when s(n)printf() will be added.
+ *
+ * Probably the TODO won't be needed as generic do_bug_frame()
+ * has been introduced and current implementation will be replaced
+ * with generic one when panic(), printk() and find_text_region()
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
+    static const struct bug_frame* bug_frames[] = {
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
index df71d31e17..0412493911 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -40,6 +40,16 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata = .;          /* Read-only data */
+        /* Bug frames table */
+       __start_bug_frames = .;
+       *(.bug_frames.0)
+       __stop_bug_frames_0 = .;
+       *(.bug_frames.1)
+       __stop_bug_frames_1 = .;
+       *(.bug_frames.2)
+       __stop_bug_frames_2 = .;
+       *(.bug_frames.3)
+       __stop_bug_frames_3 = .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
-- 
2.40.1


