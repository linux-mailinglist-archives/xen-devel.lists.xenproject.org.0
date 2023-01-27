Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0101F67E2E4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:15:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485449.752684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhl-0003PU-Vn; Fri, 27 Jan 2023 11:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485449.752684; Fri, 27 Jan 2023 11:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhl-0003Mo-SG; Fri, 27 Jan 2023 11:15:37 +0000
Received: by outflank-mailman (input) for mailman id 485449;
 Fri, 27 Jan 2023 11:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLMhk-00037V-4g
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:15:36 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac0ac04-9e33-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:15:33 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id q10so4661539wrm.4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:15:33 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfd1cb000000b002bcaa47bf78sm4106257wrd.26.2023.01.27.03.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:15:32 -0800 (PST)
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
X-Inumbo-ID: eac0ac04-9e33-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hy0V7Beg+Or9woWn4Y+M3sCQn1S9+9nvXmkH0E6MOKk=;
        b=i0jMNwOaBLTDEbH4sRYt2ki1XPyoDA8OVxTmNwmxeVxOPZto8zdpCTB4Y60BGv/MwK
         8yyRp4Oj/hoeHy8A+PRRM2GfgsCHZN+JaCAUHc/dsnFMJ4biFHAOsHRaZghppOEKe7Q+
         AlFDmxdaVWYvIS62lmF38ugnKBMqq/x1ulcAY18MkBUwPu2SkxJB1b9ilWYcCflCdccv
         ZhwY9wwJ54v6C2P+azAs4cJKydPJKmT6yGlOAdGWciuzDiGY7cIZItjWSwF2KweFzK9b
         C+1bNFZn/2+7TBD++Q1fvsb66AkJmmUp7vXBCF07AZwqyc+efBSt82NmSD8nxo0LDeMr
         RQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hy0V7Beg+Or9woWn4Y+M3sCQn1S9+9nvXmkH0E6MOKk=;
        b=TKGuwOTItfL9Th4OV0qPIDtUWWQdAk1EODQoPEZPRgbHFZmqCVdSu0k8fU7aVOIIO9
         nvJxRv8ebxCJ2eneBrOjaqzc0QejF5vZazFygKqLfrsuNmo56+DxjTZGlOUnza+vyuaV
         TE++DAh99jErnGkH7ynSuSLP3SfX6umOcpuUJ3XadvYjr+5wd2vYCyVDaq3WmQ8WHOMa
         hvHU3UVn4WVPBabhKoTwa/Nid92h1XhQYrb5TMNJunXL4Iqugvy2H3WFI94UHXvCQQf2
         cFNjyDOtMe7LOlnVYdwgxsV1fUQxb/OgkGIDwn18WxlI+XSjhIi8lloZtmg2HEI6+rK8
         HXVA==
X-Gm-Message-State: AFqh2kr4oHTc1snDPfRO7e3NSM8aHL2g7QWQSM5p+5JNusLs+IPYZ1GU
	RNcVSpdN9drA7yWjQMLVEnd6StvCKLg=
X-Google-Smtp-Source: AMrXdXtzGgrz+WD/SW7Uw7PgH/Aeoslx8A4SKQLuEG0c3llKjQ8Rwlym0melZBNBTzn/lIwMSsTmXA==
X-Received: by 2002:adf:e48e:0:b0:2bd:ed75:808c with SMTP id i14-20020adfe48e000000b002bded75808cmr44313463wrm.38.1674818133016;
        Fri, 27 Jan 2023 03:15:33 -0800 (PST)
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
Subject: [PATCH v6 1/2] xen/riscv: introduce early_printk basic stuff
Date: Fri, 27 Jan 2023 13:15:23 +0200
Message-Id: <06c2c36bd68b2534c757dc4087476e855253680a.1674816429.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674816429.git.oleksii.kurochko@gmail.com>
References: <cover.1674816429.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/Kconfig.debug              |  5 ++++
 xen/arch/riscv/Makefile                   |  1 +
 xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
 xen/arch/riscv/setup.c                    |  4 +++
 5 files changed, 55 insertions(+)
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
index 0000000000..b66a11f1bc
--- /dev/null
+++ b/xen/arch/riscv/early_printk.c
@@ -0,0 +1,33 @@
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


