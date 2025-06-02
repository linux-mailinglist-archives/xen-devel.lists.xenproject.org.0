Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65848ACAF69
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003402.1382966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VQ-0007Qj-5o; Mon, 02 Jun 2025 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003402.1382966; Mon, 02 Jun 2025 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VQ-0007OL-2R; Mon, 02 Jun 2025 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 1003402;
 Mon, 02 Jun 2025 13:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jabw=YR=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uM5VO-0006ld-Dp
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:47:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 147dc699-3fb8-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:47:10 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so822134666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:47:10 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd04591sm790372466b.114.2025.06.02.06.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:47:08 -0700 (PDT)
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
X-Inumbo-ID: 147dc699-3fb8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1748872029; x=1749476829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZi9jqmMrV3NUMU+6p8ZI4T+vj2Im9r5MjIQcF216lA=;
        b=NEG1N6Achj5DnEPm0LIjxoTTJDZoKwY3I68uSKd5m1Egf+zQjiEaAcw5vvruaDKKYa
         iN10xSieMXZkA97uWhQyH4OeABYYcS1I+svGFAMiYRfdQuSw4meQug0usKRJo4xP5j9L
         R6NT+L6cXl3DBQkyEM36lWj05gzJ0lqZi8ovA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872029; x=1749476829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZi9jqmMrV3NUMU+6p8ZI4T+vj2Im9r5MjIQcF216lA=;
        b=YlpQDRVcXcmJuWEuNEEqs/SFRL0jq916W8VTXRL6xqW8iN6Rb3ur1grlhjd/lUQ5Uy
         r7vM4oqnATje/onKE8pU/ModTUF0bwHPQ9ZAhTNyLc0D5o0hn8Kaq/MxCnXW5a3gX/1h
         S6VPxeamo1fLjw9tMi1nLDI73m5JE3zD/zPtwdwUqDYRDRGg8grCQOiXLCkfduVF3pwt
         HZUKUnhY9Zc3aRR6E1bSNUVWvqKFzdXPj3/pgfX6E5tIopnmHTVBmdAx3a9ajdLb6u1L
         WYyQd0GXoWHP1C/9WAuEx8HGAjb+9l+sVYetNklFFvzy7lJAvVs/kRu1CLZdVkR4AJcV
         8vHA==
X-Gm-Message-State: AOJu0Yx7n2w2WU330G8Gs6pSXH5DBYFrTLX/qgDf7fUYZCNyK5YX1Cno
	g3BjwDuDxy0ug+qpjXWTaxuXtBrj5YFCfyF9aGfyeTaKLFA5f5UAFKuMx2bF99+1hf7hdfcLCzq
	5gjOd
X-Gm-Gg: ASbGncsU4DrfZlUOim71lB/cyeNv7WAIjrVhd1m3HjQW168SXUCHF5+mSwFK5+6Uac0
	N6V0aVh41X8AL1LGzL0EDzjO/eAHFiMKhL8MAGBjLfkKQUDsDAofJZO69FAh3y/XjNH32La4iDc
	AX6548zIDpLJNnjKad0A2Y/q21lLbf+8lLT8yRC1cE2wK5zWuMVIV8WYuo4D3m58jixx1In98z6
	MrnJ+TmK2zeNsFl/pm2pwqdF1de2uvR30Cwon9j5+rtkEOCG/0AEAfud3IVQJl/0+SA0WFg7M6M
	Bq/PhzGhccd0SJJ2jHjGFe9eVcF9GLkli+00JaqRUHk0qAKaNRVPJ3lCGG/lkX4BFfrhFVfnuLK
	lUDw=
X-Google-Smtp-Source: AGHT+IFdvk3SBy1J7ejqhoPz10BChSbI+ROrbhjjlADH8cMRQufcnFqODx7E3KZLuRuQkai9PazRmg==
X-Received: by 2002:a17:907:9404:b0:ad8:8c09:a51a with SMTP id a640c23a62f3a-adb32264c43mr1362741666b.4.1748872028897;
        Mon, 02 Jun 2025 06:47:08 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH v2 2/3] Add lockdown mode
Date: Mon,  2 Jun 2025 14:46:55 +0100
Message-ID: <20250602134656.3836280-3-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250602134656.3836280-1-kevin.lampis@cloud.com>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The intention of lockdown mode is to prevent attacks from a rogue dom0
userspace from compromising the system. Lockdown mode can be controlled by a
Kconfig option and a command-line parameter. It is also enabled automatically
when Secure Boot is enabled and it cannot be disabled in that case.

If enabled from the command-line then it is required to be first in the
list otherwise Xen may process some insecure parameters before reaching
the lockdown parameter.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
Changes in v2:
- Remove custom command line parsing
- Print warning if lockdown is not first on command line
---
 xen/arch/x86/setup.c       |  1 +
 xen/common/Kconfig         |  8 ++++++
 xen/common/Makefile        |  1 +
 xen/common/kernel.c        |  7 +++++
 xen/common/lockdown.c      | 54 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/lockdown.h | 11 ++++++++
 6 files changed, 82 insertions(+)
 create mode 100644 xen/common/lockdown.c
 create mode 100644 xen/include/xen/lockdown.h

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0..efeed5eafc 100644
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
index 0951d4c2f2..33cd669110 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -587,4 +587,12 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+config LOCKDOWN_DEFAULT
+       bool "Enable lockdown mode by default"
+       default n
+       help
+         Lockdown mode prevents attacks from a rogue dom0 userspace from
+         compromising the system. This is automatically enabled when Secure
+         Boot is enabled.
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
index 8b63ca55f1..7280da987d 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -14,6 +14,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/hypfs.h>
+#include <xen/lockdown.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
 #include <public/version.h>
@@ -199,6 +200,8 @@ static int parse_params(const char *cmdline, const struct kernel_param *start,
             printk("parameter \"%s\" unknown!\n", key);
             final_rc = -EINVAL;
         }
+
+        lockdown_clear_first_flag();
     }
 
     return final_rc;
@@ -216,6 +219,9 @@ static void __init _cmdline_parse(const char *cmdline)
  */
 void __init cmdline_parse(const char *cmdline)
 {
+    /* Call this early since it affects command-line parsing */
+    lockdown_init(cmdline);
+
     if ( opt_builtin_cmdline[0] )
     {
         printk("Built-in command line: %s\n", opt_builtin_cmdline);
@@ -227,6 +233,7 @@ void __init cmdline_parse(const char *cmdline)
         return;
 
     safe_strcpy(saved_cmdline, cmdline);
+    lockdown_set_first_flag();
     _cmdline_parse(cmdline);
 #endif
 }
diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
new file mode 100644
index 0000000000..84eabe9c83
--- /dev/null
+++ b/xen/common/lockdown.c
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/efi.h>
+#include <xen/lockdown.h>
+#include <xen/param.h>
+
+#define FIRST_ARG_FLAG 2
+
+static int __ro_after_init lockdown = IS_ENABLED(CONFIG_LOCKDOWN_DEFAULT);
+
+void __init lockdown_set_first_flag(void)
+{
+    lockdown |= FIRST_ARG_FLAG;
+}
+
+void __init lockdown_clear_first_flag(void)
+{
+    lockdown &= ~FIRST_ARG_FLAG;
+}
+
+static int __init parse_lockdown_opt(const char *s)
+{
+    if ( strncmp("no", s, 2) == 0 )
+        if ( efi_secure_boot )
+            printk("lockdown can't be disabled because Xen booted in Secure Boot mode\n");
+        else
+            lockdown = 0;
+    else
+    {
+        if ( !(lockdown & FIRST_ARG_FLAG) )
+            printk("lockdown was not the first argument, unsafe arguments may have been already processed\n");
+
+        lockdown = 1;
+    }
+
+    return 0;
+}
+custom_param("lockdown", parse_lockdown_opt);
+
+bool is_locked_down(void)
+{
+    return lockdown & ~FIRST_ARG_FLAG;
+}
+
+void __init lockdown_init(const char *cmdline)
+{
+    if ( efi_secure_boot )
+    {
+        printk("Enabling lockdown mode because Secure Boot is enabled\n");
+        lockdown = 1;
+    }
+
+    printk("Lockdown mode is %s\n", is_locked_down() ? "enabled" : "disabled");
+}
diff --git a/xen/include/xen/lockdown.h b/xen/include/xen/lockdown.h
new file mode 100644
index 0000000000..6ae97f9d5f
--- /dev/null
+++ b/xen/include/xen/lockdown.h
@@ -0,0 +1,11 @@
+#ifndef XEN__LOCKDOWN_H
+#define XEN__LOCKDOWN_H
+
+#include <xen/types.h>
+
+void lockdown_set_first_flag(void);
+void lockdown_clear_first_flag(void);
+bool is_locked_down(void);
+void lockdown_init(const char *cmdline);
+
+#endif /* XEN__LOCKDOWN_H */
-- 
2.42.0


