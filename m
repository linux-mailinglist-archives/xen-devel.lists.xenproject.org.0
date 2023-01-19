Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98E673B50
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481132.745853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZr-0003kI-Qb; Thu, 19 Jan 2023 14:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481132.745853; Thu, 19 Jan 2023 14:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZr-0003i6-MA; Thu, 19 Jan 2023 14:07:39 +0000
Received: by outflank-mailman (input) for mailman id 481132;
 Thu, 19 Jan 2023 14:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIVZp-0002xN-W3
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:07:38 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a046e46b-9802-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 15:07:36 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso2162869wmn.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 06:07:36 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7710178wms.2.2023.01.19.06.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:07:35 -0800 (PST)
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
X-Inumbo-ID: a046e46b-9802-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tsdz6F+oqCP32pi0Y4PzeZgzGGVRy5nzjQ8KxHS3U8s=;
        b=QoDowLQ9oNmt9UToXQ5EhBk73Rk5/X07w3PCpvOjHjLvXLUq+MQz/5ono9jm+/m4IX
         HdSIsNHWHv9WltmeWYfN9QuDNW7liN1dJw47o8bATpGcH48T8KZPrLMI4zby2HFCHWhe
         c4L35wSnkIYFfdpKC7LENNHSIlp1yNjinw3DtioM9ZUA5t/x6HwHPrSnCWyXT4jDj05o
         nFXIJlZkpmrvlEGWaIdu8JWI7kgbAuRCD1xMZdVdbLivgtp3nrgXClU3xlOCfMFm9mk4
         imntnLj92ONKr2mGtjSumGXJWIgEv89p7/+qzmsJZ1y79fQcixPosrYUoFE6De7A4W1Z
         X3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tsdz6F+oqCP32pi0Y4PzeZgzGGVRy5nzjQ8KxHS3U8s=;
        b=irRJJaRPsqVMKRHQHWZOwwGylcG1oerpvyxZYQiT9xSwM0ET72OZV/nyqIPB1LQtRF
         wSh3kSkF+DJ5+61WL4/zmQjurTFQGCFrD6JmULf+2zx2X7OA5VWodN0ze2T1XhMhEJxs
         9au/61bKyCR9GFphCBOnxTjNesZ6VcMQuUS7kqUCyjosiOAdxrXcm+XZqBZK9uOb+R4t
         kgTSqHSoEWyIG1/LZXbehOnjIM/D9qd97dh/eNgbtMLEceAa83rTXW62DgZ5KKlqRcyk
         WIgdf4GnkvKFnieARnjGJr7fWOyxP564I1Ui1Zop3R0iU6wEwngmBjr+iie8lkdb4Aoi
         DIjQ==
X-Gm-Message-State: AFqh2kr4h125Wld5o+X9SHPw53YJpYyA7og9pGsO4TAA9wsaz5osTtPF
	kyJzWtZIDoFJ3V++jRaeft+WoOcWAFVRIg==
X-Google-Smtp-Source: AMrXdXstIsFAEQtSpFTIpJ/n6HPwHMdgmnbHPoJSD1pVXXFWpAqU8gy1MiaUh3RjqUtDH/zLZDcoaA==
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id hg16-20020a05600c539000b003d9a1454d1amr6509329wmb.34.1674137255851;
        Thu, 19 Jan 2023 06:07:35 -0800 (PST)
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
Subject: [PATCH v5 3/5] xen/riscv: introduce sbi call to putchar to console
Date: Thu, 19 Jan 2023 16:07:20 +0200
Message-Id: <7f92b9f801058835237f05f16e2b03b93a9cfdf8.1674131459.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674131459.git.oleksii.kurochko@gmail.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
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
Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V5:
    - Nothing critical was changed
    - Code style fixes
    - Remove unneeded <xen/errno.h> from sbi.c
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
 xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
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
index 0000000000..0ae166c861
--- /dev/null
+++ b/xen/arch/riscv/sbi.c
@@ -0,0 +1,44 @@
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
+    asm volatile (  "ecall"
+                    : "+r" (a0), "+r" (a1)
+                    : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+                    : "memory");
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


