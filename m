Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7DABD786
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 13:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990685.1374618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLb7-0006Q0-14; Tue, 20 May 2025 11:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990685.1374618; Tue, 20 May 2025 11:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHLb6-0006Ng-Uc; Tue, 20 May 2025 11:57:28 +0000
Received: by outflank-mailman (input) for mailman id 990685;
 Tue, 20 May 2025 11:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djEL=YE=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uHLb5-0006Na-FG
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 11:57:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9925649e-3571-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 13:57:26 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad1a87d93f7so877411066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 04:57:26 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cc5dbsm717040066b.169.2025.05.20.04.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:57:24 -0700 (PDT)
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
X-Inumbo-ID: 9925649e-3571-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747742245; x=1748347045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mnj1/ZJr8WXSrPzXVOhf5MKDkqj6JCkA4uZU0rfdXg=;
        b=cAmqkOhM5ZeQcppVqY/jwo8M/rRAgdlNMiivB9j4I/XxLyrSKO9IqoB5RnX9KbSdfu
         eWdXW5vlkjc5Yke/uPNG9hZOk3ZMehe/KOBWhvPpkIlrxe3uR6Q+2pKUte0Yyr28IMNm
         9MUHTnKomdC3ncw59/yp63gJNPlAJ5NS52bMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747742245; x=1748347045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mnj1/ZJr8WXSrPzXVOhf5MKDkqj6JCkA4uZU0rfdXg=;
        b=r0goDvVW2Pmh4M+UUZGpvmEzVGl/9OP2e6lyfyVr142UEsnaFv2oebjOEzcVAN8mxf
         AzsHMTP/s4sYZwxJufUHSM3ynhXGzj9spvAUGGbiqumD2gPE2YoL7s851nev/JoViwLn
         qsYdwswsoMCcN5Asel2xG6eL8A3emXovA5a9353eOaFgTwbis7JB9+UnM1U1aBMzx4/4
         nvSz1io7T98ygEpG1kjpbm4J1WiHTcSF/3yNfTDeOMSvTSfcc06bRspKOFnQOlUNIYTF
         MqvBswQG1lSKf+KT8IlIhPJ3COe6Z9kRlcAh/C6sitgLSyY1L2XTnRe4AnGoG5D1vZfE
         yZrQ==
X-Gm-Message-State: AOJu0Yy8r+d+yqeocidxoeTAqU1V1ZFua2D2FFwcoxyOtKxbOgRAkEpG
	2obzTNkMycutF7acP+Pn0OT/XTuinwLWmLbIZHx1B9Vpue95Jbw9XK7KsZA+MYeJy7S8ekSCLOS
	GTcmf
X-Gm-Gg: ASbGncsX5J6SLdv6t0nU00gTKh3DBqHUpv1rRGypNeauXpNnavfXOxwjTNbi7dWjjvh
	IKcq5f+8T0OzFJWedN0uf2Tm0nblSa4IPQA5hTabZe1X4SeqaNh/enra1YqGKfOrD1m1Yydm3G5
	QS5SwsfyxaoIcChZKabTlHRxIhLrFjVHsMjqO/M3ByXrVsbgQqr+fYr+L4bgS+BTWk7CCeUCXuN
	6CFJK+DP1/4o1rsOZGg8h/CpJF+xMLIxfkue5hFfDYaxEOxJYTPu62wumcSDSDeayjcmV6jEuC8
	dXw1kSGEy5EQW1FzsCkSxcoOgPW5yefP799LvGikcbAET3tni60t8qPExonLl/qHUUW/
X-Google-Smtp-Source: AGHT+IEFqCy2tk25vh/tS5BUxWQx81bsGoEoC3yPRt9XfaHP29VODL0/hkkrQ9F9zt3lvV7eXRbJRA==
X-Received: by 2002:a17:907:3e16:b0:ad4:f512:733 with SMTP id a640c23a62f3a-ad536dce6e4mr1584479666b.45.1747742245432;
        Tue, 20 May 2025 04:57:25 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH v2 2/3] Add lockdown mode
Date: Tue, 20 May 2025 12:57:16 +0100
Message-ID: <20250520115716.706100-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250512195628.1728455-3-kevin.lampis@cloud.com>
References: <20250512195628.1728455-3-kevin.lampis@cloud.com>
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
 xen/common/kernel.c        |  6 +++++
 xen/common/lockdown.c      | 54 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/lockdown.h | 11 ++++++++
 6 files changed, 81 insertions(+)
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
index 6d43be2e6e..c84073563f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -576,4 +576,12 @@ config BUDDY_ALLOCATOR_SIZE
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
index 8b63ca55f1..3538f467ad 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -199,6 +199,8 @@ static int parse_params(const char *cmdline, const struct kernel_param *start,
             printk("parameter \"%s\" unknown!\n", key);
             final_rc = -EINVAL;
         }
+
+        lockdown_clear_first_flag();
     }
 
     return final_rc;
@@ -216,6 +218,9 @@ static void __init _cmdline_parse(const char *cmdline)
  */
 void __init cmdline_parse(const char *cmdline)
 {
+    /* Call this early since it affects command-line parsing */
+    lockdown_init(cmdline);
+
     if ( opt_builtin_cmdline[0] )
     {
         printk("Built-in command line: %s\n", opt_builtin_cmdline);
@@ -227,6 +232,7 @@ void __init cmdline_parse(const char *cmdline)
         return;
 
     safe_strcpy(saved_cmdline, cmdline);
+    lockdown_set_first_flag();
     _cmdline_parse(cmdline);
 #endif
 }
diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
new file mode 100644
index 0000000000..cd3deeb63e
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
+custom_secure_param("lockdown", parse_lockdown_opt);
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


