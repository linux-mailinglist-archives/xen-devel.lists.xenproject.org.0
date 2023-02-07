Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1368DC0C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491193.760262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFX-0006LO-HK; Tue, 07 Feb 2023 14:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491193.760262; Tue, 07 Feb 2023 14:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFX-0006Id-C8; Tue, 07 Feb 2023 14:47:11 +0000
Received: by outflank-mailman (input) for mailman id 491193;
 Tue, 07 Feb 2023 14:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFV-0004Hz-4j
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b1400ea-a6f6-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 15:47:07 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id m14so13759855wrg.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:07 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:06 -0800 (PST)
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
X-Inumbo-ID: 4b1400ea-a6f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi5DCBZSkuvSDM/z9ivzbbaEYK1y6oIa/0SJ8j9gemI=;
        b=eIswdB6VeglcjRbBDpI8+zM5jevHk6HrUHXIx6qx6KIzdOl3zd3g8Td+eDCkZ3XrD+
         dhKMpHY+8/jS1P0rgaVBu6wYW6jmLZ4iaA8h8/fT1xRaHmQrimtsXJ4EJpm6rSVnnaKC
         7CAaO4Q71Nvks0OWtE/kVOX5dAvyGS+u662BopXaQx/tj8+fJ4t00r3NU9QS4Tx8AlPS
         9jETBCBPGiaeObyJx1QwDCSbTI6xJUbUfQD1tckhXK+RE34lyQI2di2w8wBf0Q/OC9jT
         fIxPrup2kIyqwLH9VOobgUObxoOFN3Yx49wSNYtGfk9z9fdcN25qjHUid8J6FpdMvoWL
         ZWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oi5DCBZSkuvSDM/z9ivzbbaEYK1y6oIa/0SJ8j9gemI=;
        b=MDS5s1ru03EyqwbmZSh//az6L6AuP+Mm1z6QWg0XsmqCDqlEc0yEd9Pcvo4L13YkSp
         nSOz3D5Ya0OQSpIH7tEDhTItRnUosk7j6yMEASHC+rlq1C1wL5gXAFLRS+JrEIGvrQeD
         Zm5IQjL3i4D8el+uLzUmKDDv6g0wfS+JajqPr6XeQpkR7cCAYlQiI67ZOT19Ce+xnsOe
         OlPLJwj/DIuj4v1+sjO6/6MdhSEaez2CWit3Wvb70jAU0dAp9NkF0rM4gkBmBBJRaleO
         2z/jtX/4qcN8vZGP130hvNS6mTSI2IHImBfSlMyDQ/EwNQ6N7aN0pUzp1+aFFLfXAQNg
         bWKQ==
X-Gm-Message-State: AO0yUKVLpXVJnXwE5g2Z5Alr54E+AX6BXoGFlX1GCNwHJQbGoI0uodBl
	a3clRDpMEPbDd0uVdVDgv+Z4Apa+TpA=
X-Google-Smtp-Source: AK7set9GC8uo+fLEbxV24Az69fz4r4X2+GU8mXoIYCHS44ACCVdzGaKQjn+K3rwZV+BSuuuqf7r9nA==
X-Received: by 2002:a05:6000:18ca:b0:2c3:db9e:4b06 with SMTP id w10-20020a05600018ca00b002c3db9e4b06mr3018255wrq.45.1675781226491;
        Tue, 07 Feb 2023 06:47:06 -0800 (PST)
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
Subject: [PATCH v3 08/14] xen/riscv: introduce exception handlers implementation
Date: Tue,  7 Feb 2023 16:46:43 +0200
Message-Id: <c614e69342eea7a5ce27f7a0e550ab3147afa592.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces an implementation of basic exception handlers:
- to save/restore context
- to handle an exception itself. The handler calls wait_for_interrupt
  now, nothing more.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Refactor entry.S to start using of defines introduced in asm_offsets.C
  - Rename {__,}handle_exception to handle_trap() and do_trap() to be more
    consistent with RISC-V spec.
  - Wrap handle_trap() to ENTRY().
---
 xen/arch/riscv/Makefile            |  2 +
 xen/arch/riscv/entry.S             | 94 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/traps.h | 13 +++++
 xen/arch/riscv/traps.c             | 13 +++++
 4 files changed, 122 insertions(+)
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
index 0000000000..0be543f8e0
--- /dev/null
+++ b/xen/arch/riscv/entry.S
@@ -0,0 +1,94 @@
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/processor.h>
+#include <asm/riscv_encoding.h>
+#include <asm/traps.h>
+
+/* WIP: only works while interrupting Xen context */
+ENTRY(handle_trap)
+
+    /* Exceptions from xen */
+save_to_stack:
+        /* Save context to stack */
+        REG_S   sp, (CPU_USER_REGS_SP - CPU_USER_REGS_SIZE) (sp)
+        addi    sp, sp, -CPU_USER_REGS_SIZE
+        REG_S   t0, CPU_USER_REGS_T0(sp)
+
+        /* Save registers */
+        REG_S   ra, CPU_USER_REGS_RA(sp)
+        REG_S   gp, CPU_USER_REGS_GP(sp)
+        REG_S   t1, CPU_USER_REGS_T1(sp)
+        REG_S   t2, CPU_USER_REGS_T2(sp)
+        REG_S   s0, CPU_USER_REGS_S0(sp)
+        REG_S   s1, CPU_USER_REGS_S1(sp)
+        REG_S   a0, CPU_USER_REGS_A0(sp)
+        REG_S   a1, CPU_USER_REGS_A1(sp)
+        REG_S   a2, CPU_USER_REGS_A2(sp)
+        REG_S   a3, CPU_USER_REGS_A3(sp)
+        REG_S   a4, CPU_USER_REGS_A4(sp)
+        REG_S   a5, CPU_USER_REGS_A5(sp)
+        REG_S   a6, CPU_USER_REGS_A6(sp)
+        REG_S   a7, CPU_USER_REGS_A7(sp)
+        REG_S   s2, CPU_USER_REGS_S2(sp)
+        REG_S   s3, CPU_USER_REGS_S3(sp)
+        REG_S   s4, CPU_USER_REGS_S4(sp)
+        REG_S   s5, CPU_USER_REGS_S5(sp)
+        REG_S   s6, CPU_USER_REGS_S6(sp)
+        REG_S   s7, CPU_USER_REGS_S7(sp)
+        REG_S   s8, CPU_USER_REGS_S8(sp)
+        REG_S   s9, CPU_USER_REGS_S9(sp)
+        REG_S   s10,CPU_USER_REGS_S10(sp)
+        REG_S   s11,CPU_USER_REGS_S11(sp)
+        REG_S   t3, CPU_USER_REGS_T3(sp)
+        REG_S   t4, CPU_USER_REGS_T4(sp)
+        REG_S   t5, CPU_USER_REGS_T5(sp)
+        REG_S   t6, CPU_USER_REGS_T6(sp)
+        csrr    t0, CSR_SEPC
+        REG_S   t0, CPU_USER_REGS_SEPC(sp)
+        csrr    t0, CSR_SSTATUS
+        REG_S   t0, CPU_USER_REGS_SSTATUS(sp)
+
+        mv      a0, sp
+        jal     do_trap
+
+restore_registers:
+        /* Restore stack_cpu_regs */
+        REG_L   t0, CPU_USER_REGS_SEPC(sp)
+        csrw    CSR_SEPC, t0
+        REG_L   t0, CPU_USER_REGS_SSTATUS(sp)
+        csrw    CSR_SSTATUS, t0
+
+        REG_L   ra, CPU_USER_REGS_RA(sp)
+        REG_L   gp, CPU_USER_REGS_GP(sp)
+        REG_L   t0, CPU_USER_REGS_T0(sp)
+        REG_L   t1, CPU_USER_REGS_T1(sp)
+        REG_L   t2, CPU_USER_REGS_T2(sp)
+        REG_L   s0, CPU_USER_REGS_S0(sp)
+        REG_L   s1, CPU_USER_REGS_S1(sp)
+        REG_L   a0, CPU_USER_REGS_A0(sp)
+        REG_L   a1, CPU_USER_REGS_A1(sp)
+        REG_L   a2, CPU_USER_REGS_A2(sp)
+        REG_L   a3, CPU_USER_REGS_A3(sp)
+        REG_L   a4, CPU_USER_REGS_A4(sp)
+        REG_L   a5, CPU_USER_REGS_A5(sp)
+        REG_L   a6, CPU_USER_REGS_A6(sp)
+        REG_L   a7, CPU_USER_REGS_A7(sp)
+        REG_L   s2, CPU_USER_REGS_S2(sp)
+        REG_L   s3, CPU_USER_REGS_S3(sp)
+        REG_L   s4, CPU_USER_REGS_S4(sp)
+        REG_L   s5, CPU_USER_REGS_S5(sp)
+        REG_L   s6, CPU_USER_REGS_S6(sp)
+        REG_L   s7, CPU_USER_REGS_S7(sp)
+        REG_L   s8, CPU_USER_REGS_S8(sp)
+        REG_L   s9, CPU_USER_REGS_S9(sp)
+        REG_L   s10, CPU_USER_REGS_S10(sp)
+        REG_L   s11, CPU_USER_REGS_S11(sp)
+        REG_L   t3, CPU_USER_REGS_T3(sp)
+        REG_L   t4, CPU_USER_REGS_T4(sp)
+        REG_L   t5, CPU_USER_REGS_T5(sp)
+        REG_L   t6, CPU_USER_REGS_T6(sp)
+
+        /* Restore sp */
+        REG_L   sp, CPU_USER_REGS_SP(sp)
+
+        sret
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
new file mode 100644
index 0000000000..f3fb6b25d1
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
+void do_trap(struct cpu_user_regs *cpu_regs);
+void handle_trap(void);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_TRAPS_H__ */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
new file mode 100644
index 0000000000..ccd3593f5a
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
+void do_trap(struct cpu_user_regs *cpu_regs)
+{
+    die();
+}
-- 
2.39.0


