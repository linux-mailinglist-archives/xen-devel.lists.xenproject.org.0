Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8968D730
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491102.760078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNPQ-0003cV-0h; Tue, 07 Feb 2023 12:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491102.760078; Tue, 07 Feb 2023 12:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNPP-0003Zy-SS; Tue, 07 Feb 2023 12:49:15 +0000
Received: by outflank-mailman (input) for mailman id 491102;
 Tue, 07 Feb 2023 12:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNPN-0003Jc-OW
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:49:13 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d298f1ab-a6e5-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 13:49:13 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id y1so13453593wru.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:49:13 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d59aa000000b002be5401ef5fsm11468388wrr.39.2023.02.07.04.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:49:12 -0800 (PST)
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
X-Inumbo-ID: d298f1ab-a6e5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQfYQAH/vtqOvI/GxwDEsygPxurjtVig+mWnpoag/DE=;
        b=m8Yb+st4y9Hj54obFB6mNuAk/JsAkM+nJsdBB4aRDGQn6L0yxEMANmx56PoAE1064u
         vk3WzXYrk0rqYO4sHnAxET5/NcjyqZKRpfXO2YCFkwOjXWkVi+qjxD5m9O7rDmxOAKXV
         RD7Kc+eomFQFQ9tyFBs/wk4nZd4XL0kCUqenvRSo2D4FB0sqI5SaXvN+kWMM/CValrOA
         +9pegrO+cv5UVa3eOIcAMXIm+B1QehzDu/koMbDpNhlFz02I7L70I2WDSuyMAar/rjjD
         kAbw0oLBZzQuGs49adnuo8/CPsNUa4tBJzRp1gHCqFsDrO6zEcQgTnquIhvedGoBHbeG
         srwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQfYQAH/vtqOvI/GxwDEsygPxurjtVig+mWnpoag/DE=;
        b=shL+/q0bO7xd2iGMs8mjGPJszBYub+YyoKRdb5ij9WbrfgvchRNaphZ7dE0Iwn6eeK
         h8ABxg7Iz1lBpFONFZyftwq/L50wMW+iAoinjbnZfOE8D0rZmlk//wTZw2hxGlpIbn0W
         THPnFoLypScVO7enK8PMQKMHmOS0uTuBmRREi68m+4i+oAWuu980ekPoy6/s+plzCFSZ
         TFBCEepkJZreqGIePnW7pPv9091chXFI9JotHeRDxqzZkUs+r6EuYtVf3DMbY+t+51Je
         iSQnNsNcePDfLN78qnPVCNPuha/nSIiW+aQZHYY94M/fth8Vt4/fNq1v4L7tiF9DkpE4
         eSww==
X-Gm-Message-State: AO0yUKWXDbk2Jhpwqxqib+bwE0y3vMsnyBhKxqO+jOt13H795nfiuUQL
	d0K4dWliNqJheYtyaKr/N93LGScbdms=
X-Google-Smtp-Source: AK7set9AZVnmhxwKoONs8lAr2Wqo/5905kHTVilAQJnoJrvaQgnDPcG1vZerf5YHa44yrjbuo3ZmCQ==
X-Received: by 2002:adf:df84:0:b0:2bf:b7e3:6d62 with SMTP id z4-20020adfdf84000000b002bfb7e36d62mr2945922wrl.5.1675774152401;
        Tue, 07 Feb 2023 04:49:12 -0800 (PST)
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
Subject: [PATCH v10 1/2] xen/riscv: introduce early_printk basic stuff
Date: Tue,  7 Feb 2023 14:49:05 +0200
Message-Id: <15e29bb67e9dc0a24811c02c8ef6965523dac27e.1675773832.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675773832.git.oleksii.kurochko@gmail.com>
References: <cover.1675773832.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because printk() relies on a serial driver (like the ns16550 driver)
and drivers require working virtual memory (ioremap()) there is not
print functionality early in Xen boot.

The patch introduces the basic stuff of early_printk functionality
which will be enough to print 'hello from C environment".

Originally early_printk.{c,h} was introduced by Bobby Eshleman
(https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d1aab71384)
but some functionality was changed:
early_printk() function was changed in comparison with the original as
common isn't being built now so there is no vscnprintf.

This commit adds early printk implementation built on the putc SBI call.

As sbi_console_putchar() is already being planned for deprecation
it is used temporarily now and will be removed or reworked after
real uart will be ready.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in V10:
 - Miss to add the check in V9 so add it in V10
---
Changes in V9:
    - Bring "cmodel=medany" check back to be sure that C function is safe to be
      called in early boot when MMU is off ( e.g. VA != PA ) 
---
Changes in V8:
    - Nothing was changed
---
Changes in V7:
    - Nothing was changed
---
Changes in V6:
    - Remove __riscv_cmodel_medany check from early_printk.c
---
Changes in V5:
    - Code style fixes
    - Change an error message of #error in case of __riscv_cmodel_medany
      isn't defined
---
Changes in V4:
    - Remove "depends on RISCV*" from Kconfig.debug as it is located in
      arch specific folder so by default RISCV configs should be ebabled.
    - Add "ifdef __riscv_cmodel_medany" to be sure that PC-relative addressing
      is used as early_*() functions can be called from head.S with MMU-off and
      before relocation (if it would be needed at all for RISC-V)
    - fix code style
---
Changes in V3:
    - reorder headers in alphabetical order
    - merge changes related to start_xen() function from "[PATCH v2 7/8]
      xen/riscv: print hello message from C env" to this patch
    - remove unneeded parentheses in definition of STACK_SIZE
---
Changes in V2:
    - introduce STACK_SIZE define.
    - use consistent padding between instruction mnemonic and operand(s)
---
 xen/arch/riscv/Kconfig.debug              |  5 +++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 44 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++
 xen/arch/riscv/setup.c                    |  4 +++
 5 files changed, 66 insertions(+)
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index e69de29bb2..608c9ff832 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -0,0 +1,5 @@
+config EARLY_PRINTK
+    bool "Enable early printk"
+    default DEBUG
+    help
+      Enables early printk debug messages
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index fd916e1004..1a4f1a6015 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
new file mode 100644
index 0000000000..dfe4ad77e2
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISC-V early printk using SBI
+ *
+ * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
+ */
+#include <asm/early_printk.h>
+#include <asm/sbi.h>
+
+/*
+ * When the MMU is off during early boot, any C function called has to
+ * use PC-relative rather than absolute address because the physical address
+ * may not match the virtual address.
+ *
+ * To guarantee PC-relative address cmodel=medany should be used
+ */
+#ifndef __riscv_cmodel_medany
+#error "early_*() can be called from head.S with MMU-off"
+#endif
+
+/*
+ * TODO:
+ *   sbi_console_putchar is already planned for deprecation
+ *   so it should be reworked to use UART directly.
+*/
+void early_puts(const char *s, size_t nr)
+{
+    while ( nr-- > 0 )
+    {
+        if ( *s == '\n' )
+            sbi_console_putchar('\r');
+        sbi_console_putchar(*s);
+        s++;
+    }
+}
+
+void early_printk(const char *str)
+{
+    while ( *str )
+    {
+        early_puts(str, 1);
+        str++;
+    }
+}
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
new file mode 100644
index 0000000000..05106e160d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -0,0 +1,12 @@
+#ifndef __EARLY_PRINTK_H__
+#define __EARLY_PRINTK_H__
+
+#include <xen/early_printk.h>
+
+#ifdef CONFIG_EARLY_PRINTK
+void early_printk(const char *str);
+#else
+static inline void early_printk(const char *s) {};
+#endif
+
+#endif /* __EARLY_PRINTK_H__ */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13e24e2fe1..d09ffe1454 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,12 +1,16 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/early_printk.h>
+
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
 void __init noreturn start_xen(void)
 {
+    early_printk("Hello from C env\n");
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.0


