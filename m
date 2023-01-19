Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714D673B4C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481133.745861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZs-0003rC-9E; Thu, 19 Jan 2023 14:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481133.745861; Thu, 19 Jan 2023 14:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZs-0003ka-2W; Thu, 19 Jan 2023 14:07:40 +0000
Received: by outflank-mailman (input) for mailman id 481133;
 Thu, 19 Jan 2023 14:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIVZq-0002xN-W7
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:07:39 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a102b8a4-9802-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 15:07:37 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id g10so1639048wmo.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 06:07:37 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7710178wms.2.2023.01.19.06.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:07:36 -0800 (PST)
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
X-Inumbo-ID: a102b8a4-9802-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bpQpEYSVqIRvMUSgTqd/R7B3iBoaJSFfEYHAexvgXQ=;
        b=FTuaF5IYor28Xsozkz6YQQyBsE1Slr/BSxLxhMi+Jy9pwosQMQb4IA7DE0NfZGX6Uz
         9HrrB9odaeYINTaZkASuGzmomMD07QL4ksm1d13asd43XZ8zUhp6LcwN+cBUAg0LovN4
         toHzKI7L5YxWVtcPTpA/Dk3BH10ycx9B5ToIfZobr3fISppysZFeLIJOTcKjb3Nj9Fmc
         akA8TqFNV6IkM338y2BMqXQhBJASYFdHxe9PonSCeD60dLEZbL3lTrF2eQ5XQq6ywSdw
         tP/bSDQoW8MlNTByl+kpWgW890CLLm8k/5G+k8jv7tCaW9Kv99ytP+gIdIlY01+Ls2AW
         Ch6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bpQpEYSVqIRvMUSgTqd/R7B3iBoaJSFfEYHAexvgXQ=;
        b=ujjEIAOQNEyUjY479RRs9YxDUe+6R5TcbAZAgBi+/Fnn52DIqVSzv/8/9dnh5GXbob
         hpXmxAIZrPdWK0g6FZjwVt5LEcJt1EKzd7AcmeMziTzDWIiPG+q01KtEYAJ6yxmhj7H+
         yIN5u1MlCGyggIKoBqb16NPqP+Ss9KluxY8/G9yBfdBF1xT37a1BrKx+nE9GbfhVAVOK
         YWRTn+rUdm8A7860DUOfmKbxklmJGPHzjlZ1S0hN0AaqMnapmpeR8ac5IFIvayFc4xEO
         wLh6MD5MAbu9xE2ceuoMLs12UVO/K29+cP6gpAPUlHvEKuY+uKBQVXjR7DHO33Ivll6k
         nmbQ==
X-Gm-Message-State: AFqh2kqaqneSfSJUGT/eHjc/ud4YINxUtE5ddkV0H55lOF3qEztzeRix
	yHeuI5jwiS57rraNmO80TqUF/qyJrefcRA==
X-Google-Smtp-Source: AMrXdXt8YeiWkTkoAfXK64LbdpGPwTEH/3KqNB2IDsh2Zn/Gr2P+/TU5azWqoiDeF991/LQPqlmqTg==
X-Received: by 2002:a05:600c:1c1b:b0:3d9:ebf9:7004 with SMTP id j27-20020a05600c1c1b00b003d9ebf97004mr10028924wms.29.1674137257016;
        Thu, 19 Jan 2023 06:07:37 -0800 (PST)
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
Subject: [PATCH v5 4/5] xen/riscv: introduce early_printk basic stuff
Date: Thu, 19 Jan 2023 16:07:21 +0200
Message-Id: <8d7ac0dc51a6331d3efa7fcda433616670b46700.1674131459.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674131459.git.oleksii.kurochko@gmail.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/early_printk.c             | 45 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
 xen/arch/riscv/setup.c                    |  4 ++
 5 files changed, 67 insertions(+)
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
index 0000000000..6f590e712b
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,45 @@
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
+ * early_*() can be called from head.S with MMU-off.
+ *
+ * The following requiremets should be honoured for early_*() to
+ * work correctly:
+ *    It should use PC-relative addressing for accessing symbols.
+ *    To achieve that GCC cmodel=medany should be used.
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


