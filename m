Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73126738EA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 13:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480996.745660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIS-0002Pq-3x; Thu, 19 Jan 2023 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480996.745660; Thu, 19 Jan 2023 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIR-0002ML-Sl; Thu, 19 Jan 2023 12:45:35 +0000
Received: by outflank-mailman (input) for mailman id 480996;
 Thu, 19 Jan 2023 12:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIUIP-0001sI-Ng
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 12:45:33 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 287cd8a2-97f7-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 13:45:31 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id z5so1741401wrt.6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 04:45:31 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm17909808wrw.33.2023.01.19.04.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:45:30 -0800 (PST)
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
X-Inumbo-ID: 287cd8a2-97f7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGpYf6LxU4uEJy+Cdd6qu2fGfvSKVdNlp4dIm9FxUs4=;
        b=CcMy0Bd/lI3/x6dBQKKAqPqyYMRSqSLIU2ixX8cJzr3/DFAjzwyge+jcBWXGS+uoGs
         EMB7JU7ZIYHAIv/f4ZzVgNRbJUyKEQKDHixOI8S9+oyjniT/JyRA19gBBoPkNqXRItG5
         ZVuq15zCDRcRzd/zqOxRC6PrmqZP10HGZGYuuD5Ce7JbIcPoSwavZyTzGwIC/IJWsC1n
         YnQBMYsjE7LfsEqBuGdvBwT0ZVWo77X574bUUMYLTyC+F2UOM9NqUCtu4ti5CgOOM6Ns
         I58WfMs46YVtRUpVwb6Qjxr5E91O9YreIeClaU0wPwQYDJcCNncPg4dkcTnyPHD3PPA/
         fEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGpYf6LxU4uEJy+Cdd6qu2fGfvSKVdNlp4dIm9FxUs4=;
        b=b/YYAqNOScefcIsVbk7oi9uuY93lMsxteLFUUjWngigNKUzemLX8692v/RuK5VlKJr
         rhjdgemTzZgRi+IDkgvjOSgn+oo/Dpjko+iZJKeHjwy5P6teGfkzxZFjcOqulRb/QkF6
         v6Aw7wH93/W0z3Xs3eSJf5pFL6MF2iKkgBPyheyUd1JDqAuDpHjO6Qm53WLHhtMECTIM
         HdRRURdhHZaTM5IHjsLfwN1SKAgCJcD/0uIkmi4vGdQkF0+4f4g+MDv8WM/tFyNfkra6
         L1edjUGx2SrF61VstrCJJcvxFzZlT1Y2mBvWuxn/YojTLYOq1fL9MKjUGUaaL2Nwi++6
         I4bA==
X-Gm-Message-State: AFqh2kqqwPF1zSPSeIvPkY7AR9KxDIcyIoPBzk54BlH2qxO+JEt+pG9P
	UFSSJMSM+YDtGqBtJikjPUkgTPMdSeythWzw
X-Google-Smtp-Source: AMrXdXtMoq0AJxL0dY2oR4OeqHohQWghpgCyWas8kjrtR8PHE+1upjGQlD06LEdYqZogb72iq8TL7Q==
X-Received: by 2002:adf:dbc6:0:b0:2be:12a8:9f75 with SMTP id e6-20020adfdbc6000000b002be12a89f75mr8014740wrj.55.1674132330977;
        Thu, 19 Jan 2023 04:45:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 2/4] xen/riscv: introduce sbi call to putchar to console
Date: Thu, 19 Jan 2023 14:45:15 +0200
Message-Id: <06ad9f6c8cbc87284ef4ecd4b85d9c7df33bd2c1.1673877778.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673877778.git.oleksii.kurochko@gmail.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobby.eshleman@gmail.com>

Originally SBI implementation for Xen was introduced by
Bobby Eshleman <bobby.eshleman@gmail.com> but it was removed
all the stuff for simplicity  except SBI call for putting
character to console.

The patch introduces sbi_putchar() SBI call which is necessary
to implement initial early_printk.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
    - Nothing changed
---
Changes in V3:
    - update copyright's year
    - rename definition of __CPU_SBI_H__ to __ASM_RISCV_SBI_H__
    - fix identations
    - change an author of the commit
---
Changes in V2:
    - add an explanatory comment about sbi_console_putchar() function.
    - order the files alphabetically in Makefile
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
 xen/arch/riscv/sbi.c             | 45 ++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/sbi.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 5a67a3f493..fd916e1004 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_RISCV_64) += riscv64/
+obj-y += sbi.o
 obj-y += setup.o
 
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
new file mode 100644
index 0000000000..0e6820a4ed
--- /dev/null
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later) */
+/*
+ * Copyright (c) 2021-2023 Vates SAS.
+ *
+ * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Taken/modified from Xvisor project with the following copyright:
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef __ASM_RISCV_SBI_H__
+#define __ASM_RISCV_SBI_H__
+
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
+
+struct sbiret {
+    long error;
+    long value;
+};
+
+struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
+                        unsigned long arg0, unsigned long arg1,
+                        unsigned long arg2, unsigned long arg3,
+                        unsigned long arg4, unsigned long arg5);
+
+/**
+ * Writes given character to the console device.
+ *
+ * @param ch The data to be written to the console.
+ */
+void sbi_console_putchar(int ch);
+
+#endif /* __ASM_RISCV_SBI_H__ */
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
new file mode 100644
index 0000000000..dc0eb44bc6
--- /dev/null
+++ b/xen/arch/riscv/sbi.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Taken and modified from the xvisor project with the copyright Copyright (c)
+ * 2019 Western Digital Corporation or its affiliates and author Anup Patel
+ * (anup.patel@wdc.com).
+ *
+ * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2021-2023 Vates SAS.
+ */
+
+#include <xen/errno.h>
+#include <asm/sbi.h>
+
+struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
+                        unsigned long arg0, unsigned long arg1,
+                        unsigned long arg2, unsigned long arg3,
+                        unsigned long arg4, unsigned long arg5)
+{
+    struct sbiret ret;
+
+    register unsigned long a0 asm ("a0") = arg0;
+    register unsigned long a1 asm ("a1") = arg1;
+    register unsigned long a2 asm ("a2") = arg2;
+    register unsigned long a3 asm ("a3") = arg3;
+    register unsigned long a4 asm ("a4") = arg4;
+    register unsigned long a5 asm ("a5") = arg5;
+    register unsigned long a6 asm ("a6") = fid;
+    register unsigned long a7 asm ("a7") = ext;
+
+    asm volatile ("ecall"
+              : "+r" (a0), "+r" (a1)
+              : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+              : "memory");
+    ret.error = a0;
+    ret.value = a1;
+
+    return ret;
+}
+
+void sbi_console_putchar(int ch)
+{
+    sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
+}
-- 
2.39.0


