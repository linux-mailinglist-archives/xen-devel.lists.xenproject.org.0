Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC3D68DBFF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491198.760311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFc-0007ez-Pe; Tue, 07 Feb 2023 14:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491198.760311; Tue, 07 Feb 2023 14:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFc-0007VE-G8; Tue, 07 Feb 2023 14:47:16 +0000
Received: by outflank-mailman (input) for mailman id 491198;
 Tue, 07 Feb 2023 14:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFZ-0004Hz-Vb
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:14 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dfee10e-a6f6-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:47:11 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id j25so10260842wrc.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:11 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:11 -0800 (PST)
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
X-Inumbo-ID: 4dfee10e-a6f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkyl+saYSnP1Fs1dLENb15D9r/RcpVgIDgVDjctpg1w=;
        b=p6TOa8sY181gq4ZCt9O/1Zt83m3NO5z58c1hiI/dWdQ+n5UOqFGuuO5/k5/IGpMtJX
         n8OhrzE9rPjxo5SCgpdJdW4b4I2FrvahmLOG4/fHpABxHsuznGagsKCFW/nOgdUlkV4/
         cnrxouGLpHxC1T4IXMUQNd7+YrYs+67cTs6i7A7lGxM6kSeviTJljn0pweMmdcZZ8jr4
         JIMZUipc4sdFdS0oLHeOXqRc6QH/gZxAN+gadhcfr4IHsCrEzX2GFZg4pXZ+lhj/reth
         7uA+efaLm9UUNmjf412UOuHZMbgCt/mxyfY3cyINg2keTAHr4uYzy8ouD0d1ANZswlIg
         BJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkyl+saYSnP1Fs1dLENb15D9r/RcpVgIDgVDjctpg1w=;
        b=Rb3o1mcQJr9FEl4MiyUM8EnL+xsTHv+VYwxH92i3fK0oPDQt7//YlHRdbuWluKZp7B
         Py/JuuEnBV/0FmRUE1R829R+NMWprJAYPnXWmoSUtJnAjKsrJISCT4NYpTAST7wYc6eo
         Wd6BxlcS26AjiAXDgovO5KgY4diQf2xYeTxebf14FqAkFjQOKh7/utN9mtWugGabqbNz
         3XkeBoP0ozBD1eZhd+lJWLVclQKV+Ec0W04ijG6Jxz05xqgPFy/WxZi3UEskRjuHEym9
         Scp1xvdtvrKakCtuUyLtjWFqQu0rIcTL61mkLECW0fd3sWr41twTEKYcL3FCkKBhYljT
         4oCQ==
X-Gm-Message-State: AO0yUKUrf2EdTi9CEqePCqxeA5EvJwWvaGPq9t7xxmeATuWf88280kHP
	PFXqfF+slcsHylyWQvc3hAEVHBEVOC0=
X-Google-Smtp-Source: AK7set8bLiYUTRqSD33+6+fXhmMECShlxeDoyOJeIjl7B4/tNSj27Y0wzfWcCCQ6kKD3RCPZ6FkqBA==
X-Received: by 2002:a5d:6885:0:b0:2bf:ebd0:2e46 with SMTP id h5-20020a5d6885000000b002bfebd02e46mr2842486wru.65.1675781231314;
        Tue, 07 Feb 2023 06:47:11 -0800 (PST)
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
Subject: [PATCH v3 12/14] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Tue,  7 Feb 2023 16:46:47 +0200
Message-Id: <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces macros: BUG(), WARN(), run_in_exception(),
assert_failed.

The implementation uses "ebreak" instruction in combination with
diffrent bug frame tables (for each type) which contains useful
information.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/bug.h |  38 +++++++++
 xen/arch/riscv/setup.c           |   2 +-
 xen/arch/riscv/traps.c           | 130 +++++++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S         |  10 +++
 4 files changed, 179 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..07190e9cfa
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021-2023 Vates
+ *
+ */
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#include <xen/types.h>
+
+#ifndef __ASSEMBLY__
+
+#define BUG_FN_REG t0
+
+#define BUG_INSTR "ebreak"
+
+#define INSN_LENGTH_MASK        _UL(0x3)
+#define INSN_LENGTH_32          _UL(0x3)
+
+#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
+#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
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
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BUG_H */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c8513ca4f8..d502cf06b0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,6 @@
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
-
 #include <asm/csr.h>
 #include <asm/early_printk.h>
 #include <asm/traps.h>
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 31ed63e3c1..624847f840 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -8,6 +8,7 @@
 #include <asm/early_printk.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
+#include <xen/bug.h>
 #include <xen/errno.h>
 #include <xen/lib.h>
 
@@ -97,7 +98,136 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    early_printk("implement show_execution_state(regs)\n");
+}
+
+int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
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
+    if (is_valid_bugaddr(instr)) {
+        if (!do_bug_frame(cpu_regs, cpu_regs->sepc)) {
+            cpu_regs->sepc += GET_INSN_LENGTH(*(uint32_t *)pc);
+            return;
+        }
+    }
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


