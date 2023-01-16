Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6E66C25F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478688.742065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeI-0007Xv-Ek; Mon, 16 Jan 2023 14:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478688.742065; Mon, 16 Jan 2023 14:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeI-0007V9-7N; Mon, 16 Jan 2023 14:39:46 +0000
Received: by outflank-mailman (input) for mailman id 478688;
 Mon, 16 Jan 2023 14:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHQeF-0006p7-UJ
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:39:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d50a2de-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:39:43 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id h16so27672263wrz.12
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:39:43 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm26543406wrn.25.2023.01.16.06.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:39:42 -0800 (PST)
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
X-Inumbo-ID: 9d50a2de-95ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGpYf6LxU4uEJy+Cdd6qu2fGfvSKVdNlp4dIm9FxUs4=;
        b=T8N0GA/dysWRLj7Ko3Fnf/XQRj681w1L3btZUpvFKOxateDpVbT1wEzj0MIk5x+jg0
         MxpV5VnHEwrQamsNLZ66Ba83jhvmWNHGG+Tvd2ktj8LRH6XrR/dnVvQpdfxCWYjrgy4P
         DckrxAUVgvbqB+67oQLgShv0bDxrqb0Nlb8PUXDcsmNOtc2EM+65GJdF24rAKmj/aEuO
         5w2Fx+Fe1PiDWAYKzmn4wabadfqqb0UgC5WORpQhAN/Hm/hweF6QBgu8AOW2BBdeoy/6
         VUBL0jBlQ1s+Lh6jz0Ss5SwhloXBVbOQgLxXt+99P8cUfVBwzrDCHQ1KHN9Btr9/59oi
         E/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGpYf6LxU4uEJy+Cdd6qu2fGfvSKVdNlp4dIm9FxUs4=;
        b=gVPuprxeab9m5zCp4JhqVVAdj9TNV3YIXmq3Pa7JSsBlQLLUx6L4YFEZIhWA0QllaQ
         E9/FWUf+NIM9r0YBqhU1dW/DZFL8UVotdtxby8/GIopTzu/vu1Z6N3Z58t1ZRyhTAqmI
         MNG0up05M+SRrFLYxYH7lNYYbu8irsMgYW3a9YRo/tXdxLtJ1tcCYNpxfH3/QOgeen2A
         rDrR7a7qclkyVX7uqKFwgxhyBaeiZlI+n705d7Ll5JhaTnkLVGyhCjArPBWC4in9YGIb
         D9Bki49ij5AMNPeZccXhdNQDJ33If0Eryot7VRnvz+vKzb7bgwdRHNEVANhKIduPLMZ8
         Xreg==
X-Gm-Message-State: AFqh2kqv5wmoIdc9diRPTrLmhqipkHAMheEfuHIlH1IlYPC1yOD/dh1k
	2P3zzUN7w5TNB43eXb6nqhYOGCjQpZi5yFI1
X-Google-Smtp-Source: AMrXdXt35P4U71YQyf2Eybb0C5+zogQ54iq2A107z2uodb0OvOYzUUJqxYGryK9RlyjBSFhwzidJgw==
X-Received: by 2002:a5d:6784:0:b0:2bc:7f48:4cf0 with SMTP id v4-20020a5d6784000000b002bc7f484cf0mr17942914wru.63.1673879982332;
        Mon, 16 Jan 2023 06:39:42 -0800 (PST)
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
Date: Mon, 16 Jan 2023 16:39:30 +0200
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


