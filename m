Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927E66757F6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481859.747081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssI-0007rz-PN; Fri, 20 Jan 2023 15:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481859.747081; Fri, 20 Jan 2023 15:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssI-0007bV-AZ; Fri, 20 Jan 2023 15:00:14 +0000
Received: by outflank-mailman (input) for mailman id 481859;
 Fri, 20 Jan 2023 15:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssG-0006SQ-Db
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:12 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2206a693-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:09 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id bk16so5076185wrb.11
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:09 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:08 -0800 (PST)
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
X-Inumbo-ID: 2206a693-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yh7/N5u6kGLdrdBWuFmNK/JJM/RYHrBASpUY9ocixBU=;
        b=EYKVmJZyk9pfZpdYN5vCWCoeQodKHAjnyKnp65fqyC8y5bDh7TmXHloKlP3dUzEsBP
         3Z1AvSU720OYJPhG68ZwHaX6RJIYr4MpZstHXVoCufieOinjFYjDZqTpBJd5Hr64KNwS
         3l4x9bA9mIs/1BkotUu8VNigdx/ohxx+xVxOtBDrqr4HDPASlsrR9mXKGWRmiQ7DwMrA
         LLBjSitBt7Y431s8t0ItalMwKNG3nkGmc7aS86btMLd71eymJPDZkjjSRI3ugdo06FeJ
         jykGruWn57i+ZzMzAQZe3z7z8j8EWLXKANE57YFlUo8ulZi0qD2twvwvjH3qEav19NO6
         zYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yh7/N5u6kGLdrdBWuFmNK/JJM/RYHrBASpUY9ocixBU=;
        b=wNkteBZGMC8XYLZHn8ul1qp+tKecU/NTxKxB2kNGuwV2HJrcQ2Eju6IH5ziliPnzh+
         9W1XyT0441GvqVOMsik5be/HqdRceBzPIM3xTqpKWiMrGemix0h/Z9KwRFoHfXCkvNg9
         YOZADPCGq18lOMY31uRJ77vfmg+GEX7S4Ful+M16X4zcayEGGbdf5xlnXDtVWf84kU23
         vsKm08uMFUU4EQ8A73yY24WzzQx53ZlIK8l8YRMaABW0v84SWOOxEu1LMCGCd/xrJFK8
         KAWCBMtuXH5KUsA8WgzGUvxNVjZ4G2fM2UZ3JxSplKGmj1BYaIZgPCjyx2t0m4RmcvD3
         Ql/Q==
X-Gm-Message-State: AFqh2kqkRd519ISfG9iPCrCEaZ6Ys1Phtrdn4LYEdS5bd1kdZYt3/Ip8
	j9lUnNJGzXwTXTYE8aY202If5mOOjS15HQ==
X-Google-Smtp-Source: AMrXdXtbpO2/pOVAqMv8ULwz04KaLGgKtUYk8aqM7v0wkBRAErj9hxGMMM7REUO1/uplSGptgrqliw==
X-Received: by 2002:adf:e881:0:b0:26a:6e7d:5782 with SMTP id d1-20020adfe881000000b0026a6e7d5782mr13254827wrm.35.1674226808903;
        Fri, 20 Jan 2023 07:00:08 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: [PATCH v1 06/14] xen/riscv: introduce exception context
Date: Fri, 20 Jan 2023 16:59:46 +0200
Message-Id: <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces a set of registers which should be saved to and
restored from a stack after an exception occurs and a set of defines
which will be used during exception context saving/restoring.

Originally <asm/processor.h> header was introduced in the patch series
from Bobby so mostly it was re-used and removed unneeded things from
it now.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/processor.h | 114 +++++++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/processor.h

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
new file mode 100644
index 0000000000..5898a09ce6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -0,0 +1,114 @@
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
+#include <asm/types.h>
+
+#define RISCV_CPU_USER_REGS_zero        0
+#define RISCV_CPU_USER_REGS_ra          1
+#define RISCV_CPU_USER_REGS_sp          2
+#define RISCV_CPU_USER_REGS_gp          3
+#define RISCV_CPU_USER_REGS_tp          4
+#define RISCV_CPU_USER_REGS_t0          5
+#define RISCV_CPU_USER_REGS_t1          6
+#define RISCV_CPU_USER_REGS_t2          7
+#define RISCV_CPU_USER_REGS_s0          8
+#define RISCV_CPU_USER_REGS_s1          9
+#define RISCV_CPU_USER_REGS_a0          10
+#define RISCV_CPU_USER_REGS_a1          11
+#define RISCV_CPU_USER_REGS_a2          12
+#define RISCV_CPU_USER_REGS_a3          13
+#define RISCV_CPU_USER_REGS_a4          14
+#define RISCV_CPU_USER_REGS_a5          15
+#define RISCV_CPU_USER_REGS_a6          16
+#define RISCV_CPU_USER_REGS_a7          17
+#define RISCV_CPU_USER_REGS_s2          18
+#define RISCV_CPU_USER_REGS_s3          19
+#define RISCV_CPU_USER_REGS_s4          20
+#define RISCV_CPU_USER_REGS_s5          21
+#define RISCV_CPU_USER_REGS_s6          22
+#define RISCV_CPU_USER_REGS_s7          23
+#define RISCV_CPU_USER_REGS_s8          24
+#define RISCV_CPU_USER_REGS_s9          25
+#define RISCV_CPU_USER_REGS_s10         26
+#define RISCV_CPU_USER_REGS_s11         27
+#define RISCV_CPU_USER_REGS_t3          28
+#define RISCV_CPU_USER_REGS_t4          29
+#define RISCV_CPU_USER_REGS_t5          30
+#define RISCV_CPU_USER_REGS_t6          31
+#define RISCV_CPU_USER_REGS_sepc        32
+#define RISCV_CPU_USER_REGS_sstatus     33
+#define RISCV_CPU_USER_REGS_pregs       34
+#define RISCV_CPU_USER_REGS_last        35
+
+#define RISCV_CPU_USER_REGS_OFFSET(x)   ((RISCV_CPU_USER_REGS_##x) * __SIZEOF_POINTER__)
+#define RISCV_CPU_USER_REGS_SIZE        RISCV_CPU_USER_REGS_OFFSET(last)
+
+#ifndef __ASSEMBLY__
+
+/* On stack VCPU state */
+struct cpu_user_regs
+{
+    register_t zero;
+    register_t ra;
+    register_t sp;
+    register_t gp;
+    register_t tp;
+    register_t t0;
+    register_t t1;
+    register_t t2;
+    register_t s0;
+    register_t s1;
+    register_t a0;
+    register_t a1;
+    register_t a2;
+    register_t a3;
+    register_t a4;
+    register_t a5;
+    register_t a6;
+    register_t a7;
+    register_t s2;
+    register_t s3;
+    register_t s4;
+    register_t s5;
+    register_t s6;
+    register_t s7;
+    register_t s8;
+    register_t s9;
+    register_t s10;
+    register_t s11;
+    register_t t3;
+    register_t t4;
+    register_t t5;
+    register_t t6;
+    register_t sepc;
+    register_t sstatus;
+    /* pointer to previous stack_cpu_regs */
+    register_t pregs;
+};
+
+static inline void wait_for_interrupt(void)
+{
+    __asm__ __volatile__ ("wfi");
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
-- 
2.39.0


