Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1409068DC07
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491192.760246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFU-0005pC-5S; Tue, 07 Feb 2023 14:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491192.760246; Tue, 07 Feb 2023 14:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFU-0005jp-0h; Tue, 07 Feb 2023 14:47:08 +0000
Received: by outflank-mailman (input) for mailman id 491192;
 Tue, 07 Feb 2023 14:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFS-00043Z-LI
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:06 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a3b7ca3-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:47:05 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id h3so5955059wrp.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:06 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:04 -0800 (PST)
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
X-Inumbo-ID: 4a3b7ca3-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM5HAZAjC5AS1XK7mKrfXtpw4DHmLtXflVKppyEPcdo=;
        b=QBriLcpZb17+mIDzi2hjXl/GfUukjGfTQRZexvrZ+QPKD1zSlUt5+GASQzCrg8Gy8A
         P8bgxeSlxuW/ydZTZI7mRfFUHCaz6RqcaXmKkXk1k8dcN+zDwUwH+qnZsXfwsKaL7rfV
         XwXL/dSjYDxq6N72X/6Y+WDdYlpSDwyMKdzE2IUazeOWiGSeRtlTkm9w16LCEOMckSMi
         1Y42XMiG9rCudzursKW6xmFLU7Z5hCNqBMQDk2hbwN4r/GbYnxzLYifj1jSaQQzhdYSE
         tXSyi192ftfYr1P0P9NI1zfcEmpQAvlb9zMpnAWYhtenPgJKEgJh09snizFHNY7rFFUF
         4hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM5HAZAjC5AS1XK7mKrfXtpw4DHmLtXflVKppyEPcdo=;
        b=D/aeDHjw27MwWf1yvN6pTXLUVNpIxbtTfLVDCqsLHoIWIWydKCd8N2r3McrRoYXVR+
         g1hd8VpKTOxbZ0IWRATbsCOnaCLraCqCYOeHhhr8sirH2FIdgNfCWz1RGBYQ6NO1zrRl
         5PoJLtEListljkHTLsrsSBkS/dCdjd9QxrTLt71TlWYhgQPchwKWXOvhq8ce3Ofitw9e
         5/W2iKEFwxFrY1ucFDA1nrZZ/nTJU2FyaN+J+GXLiBpotpKyCB79IuAMvRfDB4+tSuuS
         BTqDk9uXj6z0Zh/8U2+MngCv437MoXkr/uxtZPzKVd8ajXHOu7rgogW1YR/qo/TZMsyg
         o8vA==
X-Gm-Message-State: AO0yUKU9zeAAD74Zy+UoY3MS3TXOr0eZqWzqIQSjPRbmpWVGlXU6DigA
	xp1J+t5ilVbgzSBK4MGlKP9EZQRI6yI=
X-Google-Smtp-Source: AK7set9ECa3KSNKJ9bKD3YYek4ecROKFNbQm3F0y6p2soM6Yv1NRvKI0Jzh3WUrYcgqWkTpTMDqIkQ==
X-Received: by 2002:adf:f80c:0:b0:2c3:cdcd:f0b3 with SMTP id s12-20020adff80c000000b002c3cdcdf0b3mr2739661wrp.9.1675781225280;
        Tue, 07 Feb 2023 06:47:05 -0800 (PST)
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
	Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: [PATCH v3 07/14] xen/riscv: introduce exception context
Date: Tue,  7 Feb 2023 16:46:42 +0200
Message-Id: <5aa05592497ba9c4d207185d81981442d43ba676.1675780434.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675780434.git.oleksii.kurochko@gmail.com>
References: <cover.1675780434.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces a set of registers which should be saved to and
restored from a stack after an exception occurs and a set of defines
which will be used during exception context saving/restoring.

Originally <asm/processor.h> header was introduced in the patch series
from Bobby so partially it was
re-used and the following changes were done:
  - Move all RISCV_CPU_USER_REGS_* to asm/asm-offsets.c
  - Remove RISCV_CPU_USER_REGS_OFFSET & RISCV_CPU_USER_REGS_SIZE as
    there is no sense in them after RISCV_CPU_USER_REGS_* were moved to
    asm/asm-offsets.c
  - Remove RISCV_PCPUINFO_* as they aren't needed for current status of
    the RISC-V port
  - register_t renamed to unsigned long
  - rename wait_for_interrupt to wfi

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - update code style for die() function
---
Changes in V2:
  - All the changes were added to the commit message.
  - temporarily was added function die() to stop exectution it will be
    removed after panic() will be available.
---
 xen/arch/riscv/include/asm/processor.h | 83 ++++++++++++++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   | 53 ++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/processor.h

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
new file mode 100644
index 0000000000..a71448e02e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: MIT */
+/******************************************************************************
+ *
+ * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
+ * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
+ * Copyright 2023 (C) Vates
+ *
+ */
+
+#ifndef _ASM_RISCV_PROCESSOR_H
+#define _ASM_RISCV_PROCESSOR_H
+
+#ifndef __ASSEMBLY__
+
+/* On stack VCPU state */
+struct cpu_user_regs
+{
+    unsigned long zero;
+    unsigned long ra;
+    unsigned long sp;
+    unsigned long gp;
+    unsigned long tp;
+    unsigned long t0;
+    unsigned long t1;
+    unsigned long t2;
+    unsigned long s0;
+    unsigned long s1;
+    unsigned long a0;
+    unsigned long a1;
+    unsigned long a2;
+    unsigned long a3;
+    unsigned long a4;
+    unsigned long a5;
+    unsigned long a6;
+    unsigned long a7;
+    unsigned long s2;
+    unsigned long s3;
+    unsigned long s4;
+    unsigned long s5;
+    unsigned long s6;
+    unsigned long s7;
+    unsigned long s8;
+    unsigned long s9;
+    unsigned long s10;
+    unsigned long s11;
+    unsigned long t3;
+    unsigned long t4;
+    unsigned long t5;
+    unsigned long t6;
+    unsigned long sepc;
+    unsigned long sstatus;
+    /* pointer to previous stack_cpu_regs */
+    unsigned long pregs;
+};
+
+static inline void wfi(void)
+{
+    __asm__ __volatile__ ("wfi");
+}
+
+/*
+ * panic() isn't available at the moment so an infinite loop will be
+ * used temporarily.
+ * TODO: change it to panic()
+ */
+static inline void die(void)
+{
+    for ( ;; )
+        wfi();
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_PROCESSOR_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index e69de29bb2..d632b75c2a 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -0,0 +1,53 @@
+#define COMPILE_OFFSETS
+
+#include <asm/processor.h>
+#include <xen/types.h>
+
+#define DEFINE(_sym, _val)                                                 \
+    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
+                  : : "i" (_val) )
+#define BLANK()                                                            \
+    asm volatile ( "\n.ascii\"==><==\"" : : )
+#define OFFSET(_sym, _str, _mem)                                           \
+    DEFINE(_sym, offsetof(_str, _mem));
+
+void asm_offsets(void)
+{
+    BLANK();
+    DEFINE(CPU_USER_REGS_SIZE, sizeof(struct cpu_user_regs));
+    OFFSET(CPU_USER_REGS_ZERO, struct cpu_user_regs, zero);
+    OFFSET(CPU_USER_REGS_RA, struct cpu_user_regs, ra);
+    OFFSET(CPU_USER_REGS_SP, struct cpu_user_regs, sp);
+    OFFSET(CPU_USER_REGS_GP, struct cpu_user_regs, gp);
+    OFFSET(CPU_USER_REGS_TP, struct cpu_user_regs, tp);
+    OFFSET(CPU_USER_REGS_T0, struct cpu_user_regs, t0);
+    OFFSET(CPU_USER_REGS_T1, struct cpu_user_regs, t1);
+    OFFSET(CPU_USER_REGS_T2, struct cpu_user_regs, t2);
+    OFFSET(CPU_USER_REGS_S0, struct cpu_user_regs, s0);
+    OFFSET(CPU_USER_REGS_S1, struct cpu_user_regs, s1);
+    OFFSET(CPU_USER_REGS_A0, struct cpu_user_regs, a0);
+    OFFSET(CPU_USER_REGS_A1, struct cpu_user_regs, a1);
+    OFFSET(CPU_USER_REGS_A2, struct cpu_user_regs, a2);
+    OFFSET(CPU_USER_REGS_A3, struct cpu_user_regs, a3);
+    OFFSET(CPU_USER_REGS_A4, struct cpu_user_regs, a4);
+    OFFSET(CPU_USER_REGS_A5, struct cpu_user_regs, a5);
+    OFFSET(CPU_USER_REGS_A6, struct cpu_user_regs, a6);
+    OFFSET(CPU_USER_REGS_A7, struct cpu_user_regs, a7);
+    OFFSET(CPU_USER_REGS_S2, struct cpu_user_regs, s2);
+    OFFSET(CPU_USER_REGS_S3, struct cpu_user_regs, s3);
+    OFFSET(CPU_USER_REGS_S4, struct cpu_user_regs, s4);
+    OFFSET(CPU_USER_REGS_S5, struct cpu_user_regs, s5);
+    OFFSET(CPU_USER_REGS_S6, struct cpu_user_regs, s6);
+    OFFSET(CPU_USER_REGS_S7, struct cpu_user_regs, s7);
+    OFFSET(CPU_USER_REGS_S8, struct cpu_user_regs, s8);
+    OFFSET(CPU_USER_REGS_S9, struct cpu_user_regs, s9);
+    OFFSET(CPU_USER_REGS_S10, struct cpu_user_regs, s10);
+    OFFSET(CPU_USER_REGS_S11, struct cpu_user_regs, s11);
+    OFFSET(CPU_USER_REGS_T3, struct cpu_user_regs, t3);
+    OFFSET(CPU_USER_REGS_T4, struct cpu_user_regs, t4);
+    OFFSET(CPU_USER_REGS_T5, struct cpu_user_regs, t5);
+    OFFSET(CPU_USER_REGS_T6, struct cpu_user_regs, t6);
+    OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
+    OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
+    OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
+}
-- 
2.39.0


