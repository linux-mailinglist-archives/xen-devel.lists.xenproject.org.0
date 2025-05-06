Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B2AACB00
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977569.1364545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLCP-0000JA-12; Tue, 06 May 2025 16:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977569.1364545; Tue, 06 May 2025 16:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLCO-0000HK-UT; Tue, 06 May 2025 16:31:16 +0000
Received: by outflank-mailman (input) for mailman id 977569;
 Tue, 06 May 2025 16:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCL6Y-0005g0-8i
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:25:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7c13d8-2a96-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:25:12 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so812228066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:25:12 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18950acb3sm722432666b.156.2025.05.06.09.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:25:11 -0700 (PDT)
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
X-Inumbo-ID: af7c13d8-2a96-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746548712; x=1747153512; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p5Nw58u0uqjQ/UJG5g09DLpf6rbXIWW0Z96rbvwd4kE=;
        b=J/ft8P1zydbHmXpuW4rUDYjzsBWVNgiRtKAjXjZc/yQAw+U9pxJQEasfinB8cP3bnE
         Ilv51SEl7KcsZZWnhgu4VkOTnDyxmd/H8wSnvXlAv9bsO/ti6zjEOVS+n+vMBG3aOPit
         8dZctAvCnoiefRgmWpr9ARMU0JXcauc1fNh1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548712; x=1747153512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5Nw58u0uqjQ/UJG5g09DLpf6rbXIWW0Z96rbvwd4kE=;
        b=BMLZpb3r3QOphDvh9/8tOB/XymYdZjgDhbsbRUU4uuP66pj8sqFIJh4sUZJ8awEtmu
         PY/AhFqpajbt5LKMl2cF5DTpemidpW7sP4uKkU+sh00Cvi9hGBK3kDc03GolMG1R8gE7
         GAr0T/7/zjqfxGIc9kOwCeLRR3a2d5OdpsNi3qoQKUxPuevJFzg+Ird14PkCVA5732Z+
         sGiRZoOPf446iDtI4m3U6KaFeezM5xl3t7NA+rmgMzhgbjjcXdkjwXjMoFJiV4hoCUS3
         zO0hGa9C8N9bf65Z5LZZar6NVpkjKzBEX6KM8GAa8PcdYzKPjHJHIEMrkQ60G5OFL7VQ
         tFZg==
X-Gm-Message-State: AOJu0YyI15gT2uXlLGRUrb9FOQIR3Vf7+0CH3F6gg6TiQdqgIGgsKzDM
	0I54bJaTjl/4jLVDQltibhn4Sb6PY4sQeOqBQNmVNESsGrgt+toc4JPZ01Yyj+QLvTLuMbUTtrL
	Q
X-Gm-Gg: ASbGncu5lelRYb/3D4GFZeGYE7gtWRL2jkE9M8OB2FRrxVI/2e1Gs23HJ9XTXtCXwgv
	A2YlmdKwFcxE2aYJqwxxhFEsnv/dThoARH9TCJOYF4HctWJmvqstSxWRZqMxgjyw0aXrCFIolSV
	ZrMks03o1mVPrmeK2PcS9U+0EbPImI67jVr9X5apq4GXd/YW9ronPgikPGu9YbwtJm3xGCWn90Z
	lkKe8wMAsrBbPyNIzZfQuMfJmRTfExGJu/QEfXAr57pPQ8B4Z+zrF+bOEVn4EJ7KQKWPIeoOg/9
	sIqyQNUjEDRh2yhJC85nQQZbvcx/CAdWzyUWwR0+dfRdYTYa6yN5LvET0MBmytX2iW8D
X-Google-Smtp-Source: AGHT+IEh6fE7FrZHI2i9KRwNA5Au4dRx8YKZgtEHtBMrDx6LGlen5CbiTRdEUvJKo+z+cR6uFA6E3Q==
X-Received: by 2002:a17:907:cbc3:b0:ad1:91cb:3976 with SMTP id a640c23a62f3a-ad1e8d2ced6mr6739566b.58.1746548711734;
        Tue, 06 May 2025 09:25:11 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 3/4] Add lockdown mode
Date: Tue,  6 May 2025 17:25:10 +0100
Message-ID: <20250506162510.1676425-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of lockdown mode is to prevent attacks from a rogue dom0
userspace from compromising the system. Lockdown mode can be controlled by a
Kconfig option and a command-line parameter. It is also enabled automatically
when Secure Boot is enabled and it cannot be disabled in that case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
 xen/arch/x86/setup.c       |  1 +
 xen/common/Kconfig         |  8 ++++++
 xen/common/Makefile        |  1 +
 xen/common/kernel.c        |  3 +++
 xen/common/lockdown.c      | 52 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/lockdown.h |  9 +++++++
 6 files changed, 74 insertions(+)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2518954124..276957c4ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -15,6 +15,7 @@
 #include <xen/kexec.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
+#include <xen/lockdown.h>
 #include <xen/multiboot.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 4bec78c6f2..63ff37d046 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -596,4 +596,12 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+config LOCKDOWN_DEFAULT
+	bool "Enable lockdown mode by default"
+	default n
+	help
+	  Lockdown mode prevents attacks from a rogue dom0 userspace from
+	  compromising the system. This is automatically enabled when Secure
+	  Boot is enabled.
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..b00a8a925a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
+obj-y += lockdown.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 8b63ca55f1..6658db9514 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -216,6 +216,9 @@ static void __init _cmdline_parse(const char *cmdline)
  */
 void __init cmdline_parse(const char *cmdline)
 {
+    /* Call this early since it affects command-line parsing */
+    lockdown_init(cmdline);
+
     if ( opt_builtin_cmdline[0] )
     {
         printk("Built-in command line: %s\n", opt_builtin_cmdline);
diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
new file mode 100644
index 0000000000..935911dfd0
--- /dev/null
+++ b/xen/common/lockdown.c
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/efi.h>
+#include <xen/kernel.h>
+#include <xen/lockdown.h>
+#include <xen/param.h>
+#include <xen/string.h>
+
+static bool __ro_after_init lockdown = IS_ENABLED(CONFIG_LOCKDOWN_DEFAULT);
+ignore_param("lockdown");
+
+bool is_locked_down(void)
+{
+    return lockdown;
+}
+
+void __init lockdown_init(const char *cmdline)
+{
+    if ( efi_secure_boot )
+    {
+        printk("Enabling lockdown mode because Secure Boot is enabled\n");
+        lockdown = true;
+    }
+    else
+    {
+        while ( *cmdline )
+        {
+            size_t param_len, name_len;
+            int ret;
+
+            cmdline += strspn(cmdline, " \n\r\t");
+            param_len = strcspn(cmdline, " \n\r\t");
+            name_len = strcspn(cmdline, "= \n\r\t");
+
+            if ( !strncmp(cmdline, "lockdown", max(name_len, strlen("lockdown"))) ||
+                 !strncmp(cmdline, "no-lockdown", max(name_len, strlen("no-lockdown"))) )
+            {
+                ret = parse_boolean("lockdown", cmdline, cmdline + param_len);
+                if ( ret >= 0 )
+                {
+                    lockdown = ret;
+                    printk("Lockdown mode set from command-line\n");
+                    break;
+                }
+            }
+
+            cmdline += param_len;
+        }
+    }
+
+    printk("Lockdown mode is %s\n", lockdown ? "enabled" : "disabled");
+}
diff --git a/xen/include/xen/lockdown.h b/xen/include/xen/lockdown.h
new file mode 100644
index 0000000000..b2baa31caa
--- /dev/null
+++ b/xen/include/xen/lockdown.h
@@ -0,0 +1,9 @@
+#ifndef XEN__LOCKDOWN_H
+#define XEN__LOCKDOWN_H
+
+#include <xen/types.h>
+
+bool is_locked_down(void);
+void lockdown_init(const char *cmdline);
+
+#endif /* XEN__LOCKDOWN_H */
-- 
2.42.0


