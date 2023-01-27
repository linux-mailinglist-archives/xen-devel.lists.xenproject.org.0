Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A05C67E79F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485595.752982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGl-0002jo-3s; Fri, 27 Jan 2023 13:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485595.752982; Fri, 27 Jan 2023 13:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGk-0002gT-U7; Fri, 27 Jan 2023 13:59:54 +0000
Received: by outflank-mailman (input) for mailman id 485595;
 Fri, 27 Jan 2023 13:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGj-00023y-1d
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:53 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de23c063-9e4a-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 14:59:51 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id m7so5048683wru.8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:51 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:50 -0800 (PST)
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
X-Inumbo-ID: de23c063-9e4a-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCLAAcBnWsFBM5fAII3qd5TGioouQa7O2JJOpOoIC74=;
        b=ZqsJn+z621oKYaejZLaEYFkbEYnpSQEKZ0x18ppMnnmPdYKAwAppX6YxiScRVturD0
         4mpu4UZf7g4cAYbfUf9Oec8drDusL7DOjOWGhkTrqeYXUMNi5Cy5F81Rstzifb/UuWOv
         BXCspCyeuvV2T5aMwcN7f7CUSTzbqt29IEzf/lq6LmPrXn9r9yRc3nT7dhoY7aj1XX+I
         7yLQvutv/Qy5N4UWfo/2KZdNJY++LaP2s+XlnmQl3yvgvWnDdkNKHTwgc7bzzM941Bql
         RxtoPJEPFWBJygkpWlKAAKETM/wpCQAnhOxTd7qE47jo2jKAF5TqEeJBBc5n/ad7fZs1
         DfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCLAAcBnWsFBM5fAII3qd5TGioouQa7O2JJOpOoIC74=;
        b=skeox7OIHnxUlHKMlvAcfhQtWHZbuNdhsEprYYn/oAeN8YoQruwr+4mZZ5LMVOY3xu
         pldw83ULmTW8sRmG1HU93K7X0HNYZjmzzUQgelGWd7gHRh5RvHF2XuE6rEYpwAxv5lwa
         aBCHXgKM8VFgTJ3RlRrDz58PCHJJrEDJnpbEtBHxlHk9dOPIusAy7c1/y8n4nUrRP+Z5
         /Ev5TPW5oYPsQcrXYeT3xyitGt5OHMbpFrcKnik+bBnbtdZeH/+OUXoG2NU8sYTVUo++
         NvsswJ3OVq4wgWE/tH6K7i8hHbiF6vors4Gv2ooas32dhCxELV8pgAdFGUSxmkDu5IpP
         0hlA==
X-Gm-Message-State: AFqh2kpmrcVP4m3QXBAS+45X3efTlMk3yJf3gJbi158GqMZKQHCm2Ghj
	NnhnYbYjb6XYuHlcPojSoU0DoGBZFOY=
X-Google-Smtp-Source: AMrXdXt8B5aoYGmQwYb+6ohAlmytp7Td25gWn8hLje/RpRUsJGztev9qYNTsZqmI/v10pomqSTOh7Q==
X-Received: by 2002:adf:fa43:0:b0:2bd:c225:1fe8 with SMTP id y3-20020adffa43000000b002bdc2251fe8mr35240260wrr.14.1674827990437;
        Fri, 27 Jan 2023 05:59:50 -0800 (PST)
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
Subject: [PATCH v2 07/14] xen/riscv: introduce exception context
Date: Fri, 27 Jan 2023 15:59:12 +0200
Message-Id: <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
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
Changes in V2:
  - All the changes were added to the commit message.
  - temporarily was added function die() to stop exectution it will be
    removed after panic() will be available.
---
 xen/arch/riscv/include/asm/processor.h | 82 ++++++++++++++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   | 53 +++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/processor.h

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
new file mode 100644
index 0000000000..4292de2efc
--- /dev/null
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -0,0 +1,82 @@
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
+    for( ;; ) wfi();
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


