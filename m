Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA96757F0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481866.747146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssQ-0001I5-A4; Fri, 20 Jan 2023 15:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481866.747146; Fri, 20 Jan 2023 15:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssP-00015Y-M7; Fri, 20 Jan 2023 15:00:21 +0000
Received: by outflank-mailman (input) for mailman id 481866;
 Fri, 20 Jan 2023 15:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssL-0006SQ-VA
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b2fbdd-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:15 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso6017950wmc.4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:15 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:14 -0800 (PST)
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
X-Inumbo-ID: 25b2fbdd-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AohNoimI/yhgb0o3Ba+qV4NmjlQD+20RTtBoHbVgDJ4=;
        b=bClvr+doJ8sqt0dhmwoLUhRQBOzD8FJ7aRNEBI6Lv8lroNqFp83vN0+aZkwzAAGnyv
         PsjzBDdAKuwANCTy9kcY2OTYwAoVlTOLHVdC0ztrggwBCemzVM3Qh8xLP4dHcBDu6rHa
         HQN4dQKAwdOQOwZR3b9HcRcE1hPx0k39kFIdK0NDDg1zmu22xmDnMniQFV/OK6yfQrwe
         ZQ7pyDOrI1q8TDa6Gtmfk6RBr7UhJj2uSKbX1AbaquU8IuemxnICfBUCTX0/X1ab8cjr
         dX5jmwJVL0BIiTaxNo33agKTbKqKcDZiNOWp8T3VG5cDdEj3J8IRLg+Y1OdOMJNJg9un
         4eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AohNoimI/yhgb0o3Ba+qV4NmjlQD+20RTtBoHbVgDJ4=;
        b=ZQdoXABo3zcRd722L+77sSvfw/eeHKaInDc00cSabW5IvNhZ1HXr9CWl86YGZj+Zwd
         eDUvkZcJUtUJwMo9Yi4zzQDOad91wERX3/2JpAyJjprMLF7r+EheMIcVD2lBEtot3+48
         I4AXHwd5w/EdjlnaK8ZKwR737UNGZmVRtc4Iys+zkx6RGU/C0k84U9Vgbg0/mDcEa2w2
         M1XcJV9Ps59hcpbSre/2WRQfepGh/vadn4NCSavTDyLxnSAIq1MOC+mrLm0UQ/aN5cOp
         Fgu/pFv8o+CSVN78H75LRK3PGpcS82+XocWq3cKpkrFbF9pmFaDztG4mmjLwOtOIlJYV
         KHOA==
X-Gm-Message-State: AFqh2kp6avAJDMrm7FqDTk1XfZC81l+a+g3F9YL6P6o58Pw4+NaZRD9h
	pRirFsOImyIjSlddhzRFxbyVJV0k2vDhfw==
X-Google-Smtp-Source: AMrXdXsk5FWNrQr7OBANffsAgrKjctoT/969G1bCCgqUY2ooV3Ha4IY073V3hCu8uwOxhKSpwhz3ew==
X-Received: by 2002:a05:600c:1c1a:b0:3da:fbd2:a324 with SMTP id j26-20020a05600c1c1a00b003dafbd2a324mr14582175wms.36.1674226814825;
        Fri, 20 Jan 2023 07:00:14 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 12/14] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Fri, 20 Jan 2023 16:59:52 +0200
Message-Id: <a0788e4744b04597fbd3e71c2bef0bd76843a066.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces macros: BUG(), WARN(), run_in_exception(),
assert_failed.

The implementation uses "ebreak" instruction in combination with
diffrent bug frame tables (for each type) which contains useful
information.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/bug.h | 120 +++++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c           | 116 ++++++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S         |  10 +++
 3 files changed, 246 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..d17ffdcc4d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,120 @@
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
+#define __INSN_LENGTH_MASK  _UL(0x3)
+#define __INSN_LENGTH_32    _UL(0x3)
+#define __COMPRESSED_INSN_MASK	_UL(0xffff)
+
+#define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
+#define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
+
+#define GET_INSN_LENGTH(insn)						\
+({									\
+	unsigned long __len;						\
+	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ?	\
+		4UL : 2UL;						\
+	__len;								\
+})
+
+typedef u32 bug_insn_t;
+
+/* These are defined by the architecture */
+int is_valid_bugaddr(bug_insn_t addr);
+
+#define BUG_FN_REG t0
+
+/* Many versions of GCC doesn't support the asm %c parameter which would
+ * be preferable to this unpleasantness. We use mergeable string
+ * sections to avoid multiple copies of the string appearing in the
+ * Xen image. BUGFRAME_run_fn needs to be handled separately.
+ */
+#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
+    asm ("1:ebreak\n"														\
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
+    asm ("mv " __stringify(BUG_FN_REG) ", %0\n"                            	\
+         "1:ebreak\n"                                                  		\
+         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
+         "             \"a\", %%progbits\n"                                 \
+         "2:\n"                                                             \
+         ".p2align 2\n"                                                     \
+         ".long (1b - 2b)\n"                                                \
+         ".long 0, 0, 0\n"                                                  \
+         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
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
index fc25138a4b..8b719a5ef5 100644
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
@@ -107,7 +108,122 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     wait_for_interrupt();
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
+found:
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
+        early_printk("Xen WARN at ");
+        early_printk(filename);
+        early_printk(":");
+        early_printk_hnum(lineno);
+
+        show_execution_state(regs);
+
+        goto end;
+
+    case BUGFRAME_bug:
+        early_printk("Xen BUG at ");
+        early_printk(filename);
+        early_printk(":");
+        early_printk_hnum(lineno);
+
+        show_execution_state(regs);
+        early_printk("change wait_for_interrupt to panic() when common is available\n");
+        wait_for_interrupt();
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+
+        early_printk("Assertion \'");
+        early_printk(predicate);
+        early_printk("\' failed at ");
+        early_printk(filename);
+        early_printk(":");
+        early_printk_hnum(lineno);
+
+        show_execution_state(regs);
+        early_printk("change wait_for_interrupt to panic() when common is available\n");
+        wait_for_interrupt();
+    }
+
+    return -EINVAL;
+end:
+    regs->sepc += GET_INSN_LENGTH(*(bug_insn_t *)pc);
+
+    return 0;
+}
+
+int is_valid_bugaddr(bug_insn_t insn)
+{
+    if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
+        return (insn == __BUG_INSN_32);
+    else
+        return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
+}
+
 void __handle_exception(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint32_t instr = *(bug_insn_t *)pc;
+
+    if (is_valid_bugaddr(instr))
+        if (!do_bug_frame(cpu_regs, pc)) return;
+
+// die:
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


