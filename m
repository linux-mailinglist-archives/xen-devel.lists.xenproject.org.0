Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E467E79E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485596.752991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGl-0002rN-T4; Fri, 27 Jan 2023 13:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485596.752991; Fri, 27 Jan 2023 13:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGl-0002ky-Bg; Fri, 27 Jan 2023 13:59:55 +0000
Received: by outflank-mailman (input) for mailman id 485596;
 Fri, 27 Jan 2023 13:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGj-0000nM-5r
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:53 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id decc5197-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:52 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id h16so5020233wrz.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:52 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:51 -0800 (PST)
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
X-Inumbo-ID: decc5197-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuxkqTkIbxqOx8ZDugGcNSa9bGe/taJIeKj9TtWs0As=;
        b=G7kAb+GJgwbCJDzFBn7LkTCTIex1YksQ553mGggixibG/GhAqm9CP7zXgqYMFSxmLb
         M7aCwPhcoasFAM6a5swSuoO6vBRq/qzbRZ/2ZTJwEpfwf2imek0HHXTtIyaQqw5XGPJW
         YaAUXx1VyvO4dzcGvxx4fObNU9HKaxVX2eS7qkTcAE4fWuGeWKaaEloQ0GVJ/ASxQ+Cg
         th9vsXdFhYi27Hs6WEx2ATQFXMC/5BCF+cDCQlkXFZd3D3kk5uY1tpFaA1g/T3qRMT3D
         +8UitmfmKes73hB97exObiHj4Y+2tyztQ2NjMl+Tab5/Gz6NB4vgXV/SGpuorPEUuuDL
         P6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuxkqTkIbxqOx8ZDugGcNSa9bGe/taJIeKj9TtWs0As=;
        b=f0tJC4TH6OALGGB3O1qEJzX3ErOS8b/qu917HyXlyZ+fRCin9YCuuCT3qKjpY/f/6v
         aV/yDc8b8gG8J2cTOwUOK5qDQvA/533jHJGAHzaH3HElg3qy/mXRqst7nn8nKv/aGlFf
         8xy5dEDI5Mko3GCG5vTxNoK2PDDbgD+PSsXqwQsUY0sx0uoj8+O2KyLCWhGZNSMq5d7g
         1KHgA0Y9iUSxMdm57fDZ/AaR1fBTuWVNwfrY0bDbKF+UYjjSK8GxCNkyjKCcDCnId0sY
         72DxJw013Zijz6mjx0JOhe2ZKaJLP33LsEGZqtBgpQO3lokbqTyaJKTrwv+TbEibIhXt
         oJyg==
X-Gm-Message-State: AO0yUKUH6f8gYgy/4+IkGiA4Pq0Usa0MY9iIakaNBlRjWFzU0NbMRjY7
	mImdC6Bj2OPj4YjcWBp5pFQUgCD0uIY=
X-Google-Smtp-Source: AK7set+EB52XVAGjnl4tnQ1dzM6UvqdaCQakclHvoKnBHE6wvjHXq+NQAVCAef+OTET4aoOUzabzGg==
X-Received: by 2002:a05:6000:14e:b0:2bf:ccb3:255d with SMTP id r14-20020a056000014e00b002bfccb3255dmr3592575wrx.62.1674827991415;
        Fri, 27 Jan 2023 05:59:51 -0800 (PST)
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
Subject: [PATCH v2 08/14] xen/riscv: introduce exception handlers implementation
Date: Fri, 27 Jan 2023 15:59:13 +0200
Message-Id: <9cc958411ef5e0a36bbfb056a71ce7232e6665ef.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces an implementation of basic exception handlers:
- to save/restore context
- to handle an exception itself. The handler calls wait_for_interrupt
  now, nothing more.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


