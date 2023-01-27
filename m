Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CE67E7AA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485600.753024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGq-00043T-Ma; Fri, 27 Jan 2023 14:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485600.753024; Fri, 27 Jan 2023 14:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGq-0003jk-64; Fri, 27 Jan 2023 14:00:00 +0000
Received: by outflank-mailman (input) for mailman id 485600;
 Fri, 27 Jan 2023 13:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGm-0000nM-PQ
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f72e7a-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:55 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id b7so5070485wrt.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:55 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:54 -0800 (PST)
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
X-Inumbo-ID: e0f72e7a-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ymM7VYG+IAhzyt5tLEPdv6aDAXSwDbgeStu22LGX3s=;
        b=fxxoXABq56d1fI5A+cxIhzH+0V/lzE6Rx1+TE4MeRoPeru9LfOgVK5qKiNr/KiOSAr
         4uRMoB+LtRxt060z7kscWcEdiYcZ3OP4qff7A7Mn8abYpPXsDkDNLy85om623k+j2sKo
         sDS3H8oLr5iIxk7H44QTuEZpcyicw6KxrZKROtQEzC5HWPT5F/ayjrGmRHDE7qmRz7qh
         b0fig3dvRXZWMJACqUnAdzsBOQqyHbaFf/R313wyfdg295pEOTU5/76NW0paCAtfkaBy
         OnsX1uhZ9wp6V7+eoyW1xsC1y2MpBBiUmDOozaUancKBRGSrOgcnK6oT3XI+RbRdhZvN
         IJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ymM7VYG+IAhzyt5tLEPdv6aDAXSwDbgeStu22LGX3s=;
        b=MmdreYxUmJ/xIY7nSv2ywCHrP1Qoq9/mG+wME1US1avZ9IJZXov+M/cSr1nasn0GPS
         75Vy78lOlRLs2IRtk/pYcSDCTUJljZlRUeqyMYBHi6JwTu9X/BqGVBnkEEfLzC1NcT6X
         QkSYenpLhQiUH8/JbSHq36YM/vO3Zs8z3fwSbDf9V6Ph6gpHt6CGDMrefWb3srXgn5V3
         OYWs1SwdKgAlLJAbLNX7VeYtyTkNY/wwGt6sujuYLEaglxSbOu7khFKVGfO0v7YKNOpa
         mbnKmmCeU3rcEb0TUjZ/L+9xI9Z1ccnJX27gBwPnYyX6AD65v151LmFGotA+eq7rIv6H
         3YZg==
X-Gm-Message-State: AO0yUKXO4l1k+doXu6UtgMY5zFGztl5wSPCzDCAUzxVkeMqezz3MU5XA
	veBBlYkVyizrvuJtLT7tzGleTcFOthI=
X-Google-Smtp-Source: AK7set9PR5ZCr9WS/mpizo81Ydixjas02rqQO+3hH4x02+5z24wqezuZnzW+A41WtxIFkXk5DaYgCQ==
X-Received: by 2002:a5d:4f87:0:b0:2bf:b2c2:e122 with SMTP id d7-20020a5d4f87000000b002bfb2c2e122mr11312167wru.29.1674827995098;
        Fri, 27 Jan 2023 05:59:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Fri, 27 Jan 2023 15:59:17 +0200
Message-Id: <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces macros: BUG(), WARN(), run_in_exception(),
assert_failed.

The implementation uses "ebreak" instruction in combination with
diffrent bug frame tables (for each type) which contains useful
information.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes:
  - Remove __ in define namings
  - Update run_in_exception_handler() with
    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
  - Remove bug_instr_t type and change it's usage to uint32_t
---
 xen/arch/riscv/include/asm/bug.h | 118 ++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c           | 128 +++++++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S         |  10 +++
 3 files changed, 256 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..4b15d8eba6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021-2023 Vates
+ *
+ */
+
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#include <xen/stringify.h>
+#include <xen/types.h>
+
+#ifndef __ASSEMBLY__
+
+struct bug_frame {
+    signed int loc_disp;    /* Relative address to the bug address */
+    signed int file_disp;   /* Relative address to the filename */
+    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
+    uint16_t line;          /* Line number */
+    uint32_t pad0:16;       /* Padding for 8-bytes align */
+};
+
+#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
+#define bug_file(b) ((const void *)(b) + (b)->file_disp);
+#define bug_line(b) ((b)->line)
+#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
+
+#define BUGFRAME_run_fn 0
+#define BUGFRAME_warn   1
+#define BUGFRAME_bug    2
+#define BUGFRAME_assert 3
+
+#define BUGFRAME_NR     4
+
+#define INSN_LENGTH_MASK        _UL(0x3)
+#define INSN_LENGTH_32          _UL(0x3)
+
+#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
+#define BUG_INSN_16             _UL(0x9002) /* c.ebreak */
+#define COMPRESSED_INSN_MASK    _UL(0xffff)
+
+#define GET_INSN_LENGTH(insn)                               \
+({                                                          \
+    unsigned long len;                                      \
+    len = ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32) ?   \
+        4UL : 2UL;                                          \
+    len;                                                    \
+})
+
+/* These are defined by the architecture */
+int is_valid_bugaddr(uint32_t addr);
+
+#define BUG_FN_REG t0
+
+/* Many versions of GCC doesn't support the asm %c parameter which would
+ * be preferable to this unpleasantness. We use mergeable string
+ * sections to avoid multiple copies of the string appearing in the
+ * Xen image. BUGFRAME_run_fn needs to be handled separately.
+ */
+#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
+    asm ("1:ebreak\n"                                                       \
+         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
+         "2:\t.asciz " __stringify(file) "\n"                               \
+         "3:\n"                                                             \
+         ".if " #has_msg "\n"                                               \
+         "\t.asciz " #msg "\n"                                              \
+         ".endif\n"                                                         \
+         ".popsection\n"                                                    \
+         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
+         "4:\n"                                                             \
+         ".p2align 2\n"                                                     \
+         ".long (1b - 4b)\n"                                                \
+         ".long (2b - 4b)\n"                                                \
+         ".long (3b - 4b)\n"                                                \
+         ".hword " __stringify(line) ", 0\n"                                \
+         ".popsection");                                                    \
+} while (0)
+
+/*
+ * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
+ * flag but instead rely on the default value from the compiler). So the
+ * easiest way to implement run_in_exception_handler() is to pass the to
+ * be called function in a fixed register.
+ */
+#define  run_in_exception_handler(fn) do {                                  \
+    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);                 \
+    asm ("1:ebreak\n"                                                       \
+         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
+         "             \"a\", %%progbits\n"                                 \
+         "2:\n"                                                             \
+         ".p2align 2\n"                                                     \
+         ".long (1b - 2b)\n"                                                \
+         ".long 0, 0, 0\n"                                                  \
+         ".popsection" :: "r" (fn_) );                                      \
+} while (0)
+
+#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
+
+#define BUG() do {                                              \
+    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
+    unreachable();                                              \
+} while (0)
+
+#define assert_failed(msg) do {                                 \
+    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
+    unreachable();                                              \
+} while (0)
+
+extern const struct bug_frame __start_bug_frames[],
+                              __stop_bug_frames_0[],
+                              __stop_bug_frames_1[],
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BUG_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 31ed63e3c1..0afb8e4e42 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,6 +4,7 @@
  *
  * RISC-V Trap handlers
  */
+#include <asm/bug.h>
 #include <asm/csr.h>
 #include <asm/early_printk.h>
 #include <asm/processor.h>
@@ -97,7 +98,134 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    early_printk("implement show_execution_state(regs)\n");
+}
+
+int do_bug_frame(struct cpu_user_regs *regs, vaddr_t pc)
+{
+    struct bug_frame *start, *end;
+    struct bug_frame *bug = NULL;
+    unsigned int id = 0;
+    const char *filename, *predicate;
+    int lineno;
+
+    unsigned long bug_frames[] = {
+        (unsigned long)&__start_bug_frames[0],
+        (unsigned long)&__stop_bug_frames_0[0],
+        (unsigned long)&__stop_bug_frames_1[0],
+        (unsigned long)&__stop_bug_frames_2[0],
+        (unsigned long)&__stop_bug_frames_3[0],
+    };
+
+    for ( id = 0; id < BUGFRAME_NR; id++ )
+    {
+        start = (struct  bug_frame *)bug_frames[id];
+        end = (struct  bug_frame *)bug_frames[id + 1];
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
+        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+
+        fn(regs);
+
+        goto end;
+    }
+
+    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
+    filename = bug_file(bug);
+    lineno = bug_line(bug);
+
+    switch ( id )
+    {
+    case BUGFRAME_warn:
+        /*
+         * TODO: change early_printk's function to early_printk with format
+         *       when s(n)printf() will be added.
+         */
+        early_printk("Xen WARN at ");
+        early_printk(filename);
+        early_printk(":");
+        // early_printk_hnum(lineno);
+
+        show_execution_state(regs);
+
+        goto end;
+
+    case BUGFRAME_bug:
+         /*
+          * TODO: change early_printk's function to early_printk with format
+          *       when s(n)printf() will be added.
+          */
+        early_printk("Xen BUG at ");
+        early_printk(filename);
+        early_printk(":");
+        // early_printk_hnum(lineno);
+
+        show_execution_state(regs);
+        early_printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+
+        /*
+         * TODO: change early_printk's function to early_printk with format
+         *       when s(n)printf() will be added.
+         */
+        early_printk("Assertion \'");
+        early_printk(predicate);
+        early_printk("\' failed at ");
+        early_printk(filename);
+        early_printk(":");
+        // early_printk_hnum(lineno);
+
+        show_execution_state(regs);
+        early_printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+    }
+
+    return -EINVAL;
+
+ end:
+    regs->sepc += GET_INSN_LENGTH(*(uint32_t *)pc);
+
+    return 0;
+}
+
+int is_valid_bugaddr(uint32_t insn)
+{
+    if ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32)
+        return (insn == BUG_INSN_32);
+    else
+        return ((insn & COMPRESSED_INSN_MASK) == BUG_INSN_16);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint32_t instr = *(uint32_t *)pc;
+
+    if (is_valid_bugaddr(instr))
+        if (!do_bug_frame(cpu_regs, pc)) return;
+
     do_unexpected_trap(cpu_regs);
 }
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index ca57cce75c..139e2d04cb 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -39,6 +39,16 @@ SECTIONS
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
2.39.0


