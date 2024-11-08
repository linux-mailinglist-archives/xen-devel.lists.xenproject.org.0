Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E39C1FC4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832670.1247956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QPd-000090-9M; Fri, 08 Nov 2024 14:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832670.1247956; Fri, 08 Nov 2024 14:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QPd-00007N-6K; Fri, 08 Nov 2024 14:56:37 +0000
Received: by outflank-mailman (input) for mailman id 832670;
 Fri, 08 Nov 2024 14:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwxj=SD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t9QPb-0008VT-Hz
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:56:35 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ceebc1-9de1-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 15:56:33 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso3450318e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:56:33 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9b20sm643149e87.195.2024.11.08.06.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:56:31 -0800 (PST)
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
X-Inumbo-ID: a4ceebc1-9de1-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE0Y2VlYmMxLTlkZTEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDc3NzkzLjA2NDQ4Miwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077792; x=1731682592; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+IilI5qGpm4uw0qApSuShMgKh3gPsQJjpkbbyUG+xg=;
        b=fg/eFt3eQq+iK+uHQfqAsFzeBjqP9KrSUlEXVT/dUt3wdo3CPivnB8i6R2VAMGKxq3
         5bqfRuee0Dm8FOIR3uI9awfwqz0R0vri0ZNzCU5xF7WqhHMjjc3PF9cK8W9T/HsQHphv
         sPoeO4G4xuCYjed46ivfzXIaY76+yA4Sp6KIXLYu8wTUixKzGOdzJpIdM7cBKFnG+WbM
         G5BlPujVoLagzQV9uMC4Y1MQO5uHZxDN1Awu7IqGe8dI7ij9pz2ZdJJ9EpqUjy3JOHBT
         E1YSRErPNP9eyumovD7gvwbP8iwBfY2KslAUe5VdIurouSp2XGaJM/q3y128MnzCuTKw
         5Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077792; x=1731682592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+IilI5qGpm4uw0qApSuShMgKh3gPsQJjpkbbyUG+xg=;
        b=rMckhpGnktCtcN6Abaq7bgtSbZBtaJmX85GrtRTEEfRVBSZBv+ix72Io1cQxNuVUMK
         Yyrg3XtQHPEPq/e15Lqwqw03VWnFLqzBgbPmLBCitEyiXFPdXrLlLmTT73m1CqbtXuAR
         N7I5hIGUlv+ifuzDjA30qpaj8fJBDB9AvCPI/UeYO8OkWsWI5yFOJkL3IWrRw+u2GoCx
         WrIUPeo+uSRspfMNnEnq4ZAr0sw8NRW4GVaJ8KhvuPdFE/CbE5V8BRAB7FQRTvh2x7BR
         SkplD77CpZPV8ec0CAVadotEepWhuJHQE5EPk3z9oumNx71/drzigSLBV0jv0YXqixYi
         WClA==
X-Gm-Message-State: AOJu0YxnFLK1w0MzXtUX9aITKXiwHuVrgb8PadCLr7/27+3oKiWuad05
	NGKZv0WGCHsEX8A+6N6NB6d4fYlb/OoFT+ykoFxk1HqYTN8/NMBle/sK/OSQ
X-Google-Smtp-Source: AGHT+IH7MBl6nndIOle5jxpyjCxLXnFAsMfIQCPURbda958tUSQQkndnILS3QHwaubE8OI4b9u7UXg==
X-Received: by 2002:a05:6512:3f09:b0:533:71f:3a3d with SMTP id 2adb3069b0e04-53d862c7321mr3121403e87.24.1731077791938;
        Fri, 08 Nov 2024 06:56:31 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1] drivers/char: move dt_uart_init() to dt-uart.c
Date: Fri,  8 Nov 2024 15:56:27 +0100
Message-ID: <8e1036a7e6c884702d46e377c1c5b723570c819e.1731077742.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `dt_uart_init()` functions is relocated to a new file `dt-uart.c` to allow
for reuse across architectures that utilize the device tree to describe hardware
components.

RISC-V is going to follow the same approach to UART initialization, which
includes checking for the presence of `dtuart` in the console string or verifying
the `stdout-path` property in the `/chosen` node, followed by searching for the UART
node and calling `device_init()` for UART setup.

Add `xen/drivers/char/dt-uart.c` to the ARM ARCHITECTURE section in the MAINTAINERS
file, as ARM maintainers are best suited to maintain this code.

No functional change.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 MAINTAINERS                 |  1 +
 xen/drivers/char/Makefile   |  1 +
 xen/drivers/char/arm-uart.c | 80 -------------------------------
 xen/drivers/char/dt-uart.c  | 95 +++++++++++++++++++++++++++++++++++++
 xen/include/xen/serial.h    |  2 +
 5 files changed, 99 insertions(+), 80 deletions(-)
 create mode 100644 xen/drivers/char/dt-uart.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 17fc5f9eec..075eecfb8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -247,6 +247,7 @@ F:	docs/misc/arm/
 F:	xen/arch/arm/
 F:	xen/drivers/char/arm-uart.c
 F:	xen/drivers/char/cadence-uart.c
+F:	xen/drivers/char/dt-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
 F:	xen/drivers/char/imx-lpuart.c
 F:	xen/drivers/char/meson-uart.c
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index d3b987da1d..ab76857387 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
 obj-$(CONFIG_PV_SHIM) += consoled.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += dt-uart.o
diff --git a/xen/drivers/char/arm-uart.c b/xen/drivers/char/arm-uart.c
index 91f13a4136..693f6c4760 100644
--- a/xen/drivers/char/arm-uart.c
+++ b/xen/drivers/char/arm-uart.c
@@ -19,89 +19,9 @@
 
 #include <asm/device.h>
 
-#include <xen/console.h>
-#include <xen/device_tree.h>
-#include <xen/param.h>
 #include <xen/serial.h>
-#include <xen/errno.h>
 #include <xen/acpi.h>
 
-/*
- * Configure UART port with a string:
- * path:options
- *
- * @path: full path used in the device tree for the UART. If the path
- * doesn't start with '/', we assuming that it's an alias.
- * @options: UART speficic options (see in each UART driver)
- */
-static char __initdata opt_dtuart[256] = "";
-string_param("dtuart", opt_dtuart);
-
-static void __init dt_uart_init(void)
-{
-    struct dt_device_node *dev;
-    int ret;
-    const char *devpath = opt_dtuart;
-    const char *options;
-    char *split;
-
-    if ( !console_has("dtuart") )
-        return; /* Not for us */
-
-    if ( !strcmp(opt_dtuart, "") )
-    {
-        const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
-
-        if ( chosen )
-        {
-            const char *stdout;
-
-            ret = dt_property_read_string(chosen, "stdout-path", &stdout);
-            if ( ret >= 0 )
-            {
-                printk("Taking dtuart configuration from /chosen/stdout-path\n");
-                if ( strlcpy(opt_dtuart, stdout, sizeof(opt_dtuart))
-                     >= sizeof(opt_dtuart) )
-                    printk("WARNING: /chosen/stdout-path too long, truncated\n");
-            }
-            else if ( ret != -EINVAL /* Not present */ )
-                printk("Failed to read /chosen/stdout-path (%d)\n", ret);
-        }
-    }
-
-    if ( !strcmp(opt_dtuart, "") )
-    {
-        printk("No dtuart path configured\n");
-        return;
-    }
-
-    split = strchr(opt_dtuart, ':');
-    if ( split )
-    {
-        split[0] = '\0';
-        options = split + 1;
-    }
-    else
-        options = "";
-
-    printk("Looking for dtuart at \"%s\", options \"%s\"\n", devpath, options);
-    if ( *devpath == '/' )
-        dev = dt_find_node_by_path(devpath);
-    else
-        dev = dt_find_node_by_alias(devpath);
-
-    if ( !dev )
-    {
-        printk("Unable to find device \"%s\"\n", devpath);
-        return;
-    }
-
-    ret = device_init(dev, DEVICE_SERIAL, options);
-
-    if ( ret )
-        printk("Unable to initialize dtuart: %d\n", ret);
-}
-
 #ifdef CONFIG_ACPI
 static void __init acpi_uart_init(void)
 {
diff --git a/xen/drivers/char/dt-uart.c b/xen/drivers/char/dt-uart.c
new file mode 100644
index 0000000000..0ad0b18001
--- /dev/null
+++ b/xen/drivers/char/dt-uart.c
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/console.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/param.h>
+#include <xen/serial.h>
+
+#include <asm/device.h>
+
+/*
+ * Configure UART port with a string:
+ * path:options
+ *
+ * @path: full path used in the device tree for the UART. If the path
+ * doesn't start with '/', we assuming that it's an alias.
+ * @options: UART speficic options (see in each UART driver)
+ */
+static char __initdata opt_dtuart[256] = "";
+string_param("dtuart", opt_dtuart);
+
+void __init dt_uart_init(void)
+{
+    struct dt_device_node *dev;
+    int ret;
+    const char *devpath = opt_dtuart;
+    const char *options;
+    char *split;
+
+    if ( !console_has("dtuart") )
+        return; /* Not for us */
+
+    if ( !strcmp(opt_dtuart, "") )
+    {
+        const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+
+        if ( chosen )
+        {
+            const char *stdout;
+
+            ret = dt_property_read_string(chosen, "stdout-path", &stdout);
+            if ( ret >= 0 )
+            {
+                printk("Taking dtuart configuration from /chosen/stdout-path\n");
+                if ( strlcpy(opt_dtuart, stdout, sizeof(opt_dtuart))
+                     >= sizeof(opt_dtuart) )
+                    printk("WARNING: /chosen/stdout-path too long, truncated\n");
+            }
+            else if ( ret != -EINVAL /* Not present */ )
+                printk("Failed to read /chosen/stdout-path (%d)\n", ret);
+        }
+    }
+
+    if ( !strcmp(opt_dtuart, "") )
+    {
+        printk("No dtuart path configured\n");
+        return;
+    }
+
+    split = strchr(opt_dtuart, ':');
+    if ( split )
+    {
+        split[0] = '\0';
+        options = split + 1;
+    }
+    else
+        options = "";
+
+    printk("Looking for dtuart at \"%s\", options \"%s\"\n", devpath, options);
+    if ( *devpath == '/' )
+        dev = dt_find_node_by_path(devpath);
+    else
+        dev = dt_find_node_by_alias(devpath);
+
+    if ( !dev )
+    {
+        printk("Unable to find device \"%s\"\n", devpath);
+        return;
+    }
+
+    ret = device_init(dev, DEVICE_SERIAL, options);
+
+    if ( ret )
+        printk("Unable to initialize dtuart: %d\n", ret);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
\ No newline at end of file
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 3d21207a3d..7c82700929 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -168,6 +168,8 @@ static void inline xhci_dbc_uart_init(void) {}
 
 void arm_uart_init(void);
 
+void dt_uart_init(void);
+
 struct physdev_dbgp_op;
 int dbgp_op(const struct physdev_dbgp_op *op);
 
-- 
2.47.0


