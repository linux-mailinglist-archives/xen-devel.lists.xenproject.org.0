Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458016757F5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481858.747071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssH-0007ca-Rn; Fri, 20 Jan 2023 15:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481858.747071; Fri, 20 Jan 2023 15:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssH-0007T6-F6; Fri, 20 Jan 2023 15:00:13 +0000
Received: by outflank-mailman (input) for mailman id 481858;
 Fri, 20 Jan 2023 15:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssF-0006Kg-GE
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:11 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 229ae9d3-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:10 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id r2so5090823wrv.7
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:10 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:09 -0800 (PST)
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
X-Inumbo-ID: 229ae9d3-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5On9Ljb8od/hZFXAUMkhhR6b6lBaYm3tiocvPuOanJo=;
        b=pDhH7j2TPsx7enpELQT3c9yjlF6JakH1voO/6HzAr1AnpbCtuB8xtmohCX50LHYd9J
         nShRQkrBDx+z9L74wDnzNvtardP8lLtdWWoTWe5Cz5EfvvO351iXoI0BYmOlFy2s8v5p
         oeKTSapJuc/lEDWDsDapTg9Lbdzo/oyKIVCKpVoDGcba+L0fVGP8heeV0G4sAGW3D8k9
         wmoVO57V3yLUJAJz89DupuOhmL5fnyId+d7JRVU+UvvNqKeoRqD/mRwaum/L9Fq2WwSX
         oGlz8Z/Q5HuXbU6t0I6X2KIZlcb7dftlKsyxlHrSQX2oVaweZvF0Xhf5cnvdaA7k5bTV
         ZHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5On9Ljb8od/hZFXAUMkhhR6b6lBaYm3tiocvPuOanJo=;
        b=ggVBx6IaRBXONhtjZgaVRXh88xF3V7gvKGRfpa6eIwtVjJymBEmERGeZ/+mncBa4Ib
         ChzPZw9IxOp0qiQ2/yDKT7VmyoYTWaB/5lF3pCaej58k+K0J0pnOVrkAvG+Y5t2Yf/gZ
         /6l6tklzzBqK6kpdw82ejT6txn2iT03fUdsCC54oUblozumPJAUuXIMD2pUMdAVa+zGT
         uiSznHH4+/BPJIeBxg92vij/7qrGGcnfftYAe135eLQhx+LwpAKndUoRXyZ+EemcOfKr
         uT5iU2T9fh29MyPHbree2xIRDLM0+KwjuRBjMfVgbjjBWlmutggARv2g9aBlB2G+InAn
         o65w==
X-Gm-Message-State: AFqh2kquFLtOKbIiNJGeUb/DyXeOtbRJh5S3gEZm14y8FErZKivFG6Tw
	RAr9Da/cK8r8QnQ03EO9CDWs4sN48SH5zw==
X-Google-Smtp-Source: AMrXdXu4zBsqjxfCKndCaQ8TRBozx/7/N8JgZeecljxPkjZZzt4PdmgjucuapdmrIiLbLvapLMX2HA==
X-Received: by 2002:adf:eb43:0:b0:2bd:d542:e010 with SMTP id u3-20020adfeb43000000b002bdd542e010mr12250630wrn.46.1674226809884;
        Fri, 20 Jan 2023 07:00:09 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 07/14] xen/riscv: introduce exception handlers implementation
Date: Fri, 20 Jan 2023 16:59:47 +0200
Message-Id: <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces an implementation of basic exception handlers:
- to save/restore context
- to handle an exception itself. The handler calls wait_for_interrupt
  now, nothing more.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile            |  2 +
 xen/arch/riscv/entry.S             | 97 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/traps.h | 13 ++++
 xen/arch/riscv/traps.c             | 13 ++++
 4 files changed, 125 insertions(+)
 create mode 100644 xen/arch/riscv/entry.S
 create mode 100644 xen/arch/riscv/include/asm/traps.h
 create mode 100644 xen/arch/riscv/traps.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 1a4f1a6015..443f6bf15f 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,7 +1,9 @@
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
+obj-y += entry.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += traps.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
new file mode 100644
index 0000000000..f7d46f42bb
--- /dev/null
+++ b/xen/arch/riscv/entry.S
@@ -0,0 +1,97 @@
+#include <asm/asm.h>
+#include <asm/processor.h>
+#include <asm/riscv_encoding.h>
+#include <asm/traps.h>
+
+        .global handle_exception
+        .align 4
+
+handle_exception:
+
+    /* Exceptions from xen */
+save_to_stack:
+        /* Save context to stack */
+        REG_S   sp, (RISCV_CPU_USER_REGS_OFFSET(sp) - RISCV_CPU_USER_REGS_SIZE) (sp)
+        addi    sp, sp, -RISCV_CPU_USER_REGS_SIZE
+        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(t0)(sp)
+        j       save_context
+
+save_context:
+        /* Save registers */
+        REG_S   ra, RISCV_CPU_USER_REGS_OFFSET(ra)(sp)
+        REG_S   gp, RISCV_CPU_USER_REGS_OFFSET(gp)(sp)
+        REG_S   t1, RISCV_CPU_USER_REGS_OFFSET(t1)(sp)
+        REG_S   t2, RISCV_CPU_USER_REGS_OFFSET(t2)(sp)
+        REG_S   s0, RISCV_CPU_USER_REGS_OFFSET(s0)(sp)
+        REG_S   s1, RISCV_CPU_USER_REGS_OFFSET(s1)(sp)
+        REG_S   a0, RISCV_CPU_USER_REGS_OFFSET(a0)(sp)
+        REG_S   a1, RISCV_CPU_USER_REGS_OFFSET(a1)(sp)
+        REG_S   a2, RISCV_CPU_USER_REGS_OFFSET(a2)(sp)
+        REG_S   a3, RISCV_CPU_USER_REGS_OFFSET(a3)(sp)
+        REG_S   a4, RISCV_CPU_USER_REGS_OFFSET(a4)(sp)
+        REG_S   a5, RISCV_CPU_USER_REGS_OFFSET(a5)(sp)
+        REG_S   a6, RISCV_CPU_USER_REGS_OFFSET(a6)(sp)
+        REG_S   a7, RISCV_CPU_USER_REGS_OFFSET(a7)(sp)
+        REG_S   s2, RISCV_CPU_USER_REGS_OFFSET(s2)(sp)
+        REG_S   s3, RISCV_CPU_USER_REGS_OFFSET(s3)(sp)
+        REG_S   s4, RISCV_CPU_USER_REGS_OFFSET(s4)(sp)
+        REG_S   s5, RISCV_CPU_USER_REGS_OFFSET(s5)(sp)
+        REG_S   s6, RISCV_CPU_USER_REGS_OFFSET(s6)(sp)
+        REG_S   s7, RISCV_CPU_USER_REGS_OFFSET(s7)(sp)
+        REG_S   s8, RISCV_CPU_USER_REGS_OFFSET(s8)(sp)
+        REG_S   s9, RISCV_CPU_USER_REGS_OFFSET(s9)(sp)
+        REG_S   s10, RISCV_CPU_USER_REGS_OFFSET(s10)(sp)
+        REG_S   s11, RISCV_CPU_USER_REGS_OFFSET(s11)(sp)
+        REG_S   t3, RISCV_CPU_USER_REGS_OFFSET(t3)(sp)
+        REG_S   t4, RISCV_CPU_USER_REGS_OFFSET(t4)(sp)
+        REG_S   t5, RISCV_CPU_USER_REGS_OFFSET(t5)(sp)
+        REG_S   t6, RISCV_CPU_USER_REGS_OFFSET(t6)(sp)
+        csrr    t0, CSR_SEPC
+        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(sepc)(sp)
+        csrr    t0, CSR_SSTATUS
+        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(sstatus)(sp)
+
+        mv      a0, sp
+        jal     __handle_exception
+
+restore_registers:
+        /* Restore stack_cpu_regs */
+        REG_L   t0, RISCV_CPU_USER_REGS_OFFSET(sepc)(sp)
+        csrw    CSR_SEPC, t0
+        REG_L   t0, RISCV_CPU_USER_REGS_OFFSET(sstatus)(sp)
+        csrw    CSR_SSTATUS, t0
+
+        REG_L   ra, RISCV_CPU_USER_REGS_OFFSET(ra)(sp)
+        REG_L   gp, RISCV_CPU_USER_REGS_OFFSET(gp)(sp)
+        REG_L   t0, RISCV_CPU_USER_REGS_OFFSET(t0)(sp)
+        REG_L   t1, RISCV_CPU_USER_REGS_OFFSET(t1)(sp)
+        REG_L   t2, RISCV_CPU_USER_REGS_OFFSET(t2)(sp)
+        REG_L   s0, RISCV_CPU_USER_REGS_OFFSET(s0)(sp)
+        REG_L   s1, RISCV_CPU_USER_REGS_OFFSET(s1)(sp)
+        REG_L   a0, RISCV_CPU_USER_REGS_OFFSET(a0)(sp)
+        REG_L   a1, RISCV_CPU_USER_REGS_OFFSET(a1)(sp)
+        REG_L   a2, RISCV_CPU_USER_REGS_OFFSET(a2)(sp)
+        REG_L   a3, RISCV_CPU_USER_REGS_OFFSET(a3)(sp)
+        REG_L   a4, RISCV_CPU_USER_REGS_OFFSET(a4)(sp)
+        REG_L   a5, RISCV_CPU_USER_REGS_OFFSET(a5)(sp)
+        REG_L   a6, RISCV_CPU_USER_REGS_OFFSET(a6)(sp)
+        REG_L   a7, RISCV_CPU_USER_REGS_OFFSET(a7)(sp)
+        REG_L   s2, RISCV_CPU_USER_REGS_OFFSET(s2)(sp)
+        REG_L   s3, RISCV_CPU_USER_REGS_OFFSET(s3)(sp)
+        REG_L   s4, RISCV_CPU_USER_REGS_OFFSET(s4)(sp)
+        REG_L   s5, RISCV_CPU_USER_REGS_OFFSET(s5)(sp)
+        REG_L   s6, RISCV_CPU_USER_REGS_OFFSET(s6)(sp)
+        REG_L   s7, RISCV_CPU_USER_REGS_OFFSET(s7)(sp)
+        REG_L   s8, RISCV_CPU_USER_REGS_OFFSET(s8)(sp)
+        REG_L   s9, RISCV_CPU_USER_REGS_OFFSET(s9)(sp)
+        REG_L   s10, RISCV_CPU_USER_REGS_OFFSET(s10)(sp)
+        REG_L   s11, RISCV_CPU_USER_REGS_OFFSET(s11)(sp)
+        REG_L   t3, RISCV_CPU_USER_REGS_OFFSET(t3)(sp)
+        REG_L   t4, RISCV_CPU_USER_REGS_OFFSET(t4)(sp)
+        REG_L   t5, RISCV_CPU_USER_REGS_OFFSET(t5)(sp)
+        REG_L   t6, RISCV_CPU_USER_REGS_OFFSET(t6)(sp)
+
+        /* Restore sp */
+        REG_L   sp, RISCV_CPU_USER_REGS_OFFSET(sp)(sp)
+
+        sret
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
new file mode 100644
index 0000000000..816ab1178a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_TRAPS_H__
+#define __ASM_TRAPS_H__
+
+#include <asm/processor.h>
+
+#ifndef __ASSEMBLY__
+
+void __handle_exception(struct cpu_user_regs *cpu_regs);
+void handle_exception(void);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_TRAPS_H__ */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
new file mode 100644
index 0000000000..3201b851ef
--- /dev/null
+++ b/xen/arch/riscv/traps.c
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2023 Vates
+ *
+ * RISC-V Trap handlers
+ */
+#include <asm/processor.h>
+#include <asm/traps.h>
+
+void __handle_exception(struct cpu_user_regs *cpu_regs)
+{
+    wait_for_interrupt();
+}
-- 
2.39.0


