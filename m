Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A1AB454C
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 22:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982190.1368743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZKq-00025l-FA; Mon, 12 May 2025 20:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982190.1368743; Mon, 12 May 2025 20:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZKq-00022d-Bg; Mon, 12 May 2025 20:01:12 +0000
Received: by outflank-mailman (input) for mailman id 982190;
 Mon, 12 May 2025 20:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZGQ-0005qp-AY
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:56:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36326998-2f6b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:56:36 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad23c20f977so357194666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:56:36 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be0c5sm656407366b.153.2025.05.12.12.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 12:56:34 -0700 (PDT)
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
X-Inumbo-ID: 36326998-2f6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079796; x=1747684596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4Wd8lHyFqDjTXjkxHBdAOOU5VtwxpSw3GkW45s9UOA=;
        b=hW0slmy02z9nMSr6NpDMOgRKWt+vn0KEbENPvnLk8CVFOeBK1qdLfcHJZimRwj3wCN
         f6vlic5s1RG9hkMJpYEwUdH0VOoKhTScJ1pTTpwdiusdQud2W2vyRjjcJwAkpftj66eH
         hDjVhnatASd6ZdzXK6FIZvTHj4ewXRUlB3gVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079796; x=1747684596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4Wd8lHyFqDjTXjkxHBdAOOU5VtwxpSw3GkW45s9UOA=;
        b=fppV3vpLy7lXRd1mFWwOZAmiwVPnyLLQEDMWhewlnBoonObiiaqGsZpwOabohWu2Z3
         9bv1jfb6xz53aO19LJ9cOc91n8v6fTNSHHVenW27yfNPgKDX3GpGaNH61LnDCo6wOwBl
         +kY1JQ9GeE/mrmragx+vC8yln12GdprfalppUeBEIh68nRePCWrxS5V4+mg39MWI9Gb2
         sxMEpK6x06z1l4Kp/NfQyxv7CRcapq60bJ2xT9p7c0WqXBL9ecPFyY++Mr5pxumazvyh
         vVhAQtXJSdnDbyD9psDWtc1BLxWOTfbKVqLN+2J6NreYWqfffyhe2QlYmd9GM6Q/aPcW
         e2fA==
X-Gm-Message-State: AOJu0YxrLgEeGwetfjJDHi2BQLrALYNpNxeghgebkvBXJCDjHt+ymaYV
	I/2N9G//BV3T7J8lndrlbjDagC0K6m7MB4AH1A4wnovo1AUf3c87Hg6QH8WzPQs3zbeW3M2qRV/
	3
X-Gm-Gg: ASbGncsMlGfT4aBc6Qs+2VvgN50nbnfblh1u1pVsO67m7bacYy2PbcrPhKfy5D73Y/i
	YIj0PuKxhmXALsV1q1qxnucpFDJvvHojZWqvCEFRxV0Lp8ps4pPcyS62hkcknJx13mGbC7sswjT
	v9uTNItctpet262I5GIa55tMJgC/54nz48OkBgEcqU1ENGSVn7+xKcLD+WBO8e1TAI1PK4pjM0H
	UMhYtZLdUQaumziC39wDZQvWxrPRZ0sFAiO3ZDfSR4eIp3AZ5Ef0pxG0oiFUXKISedOnZ5gJ+2B
	+2mn5eOW78+bQaugjMdCEKpUmmOR+rDE0GHEKoMn8k9RQARwEXvFLkcz5Epb/vjlfflk
X-Google-Smtp-Source: AGHT+IHzSIWCtV2mlkh4F8aroWccKmHhvvAB4iWh/zuQL3EraTvCk466NJ4QBWQ1Uke7y85jSA8Flg==
X-Received: by 2002:a17:907:a38e:b0:ad2:39a9:f1b8 with SMTP id a640c23a62f3a-ad239aa08eemr842161966b.57.1747079795633;
        Mon, 12 May 2025 12:56:35 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH 2/3] Add lockdown mode
Date: Mon, 12 May 2025 20:56:27 +0100
Message-ID: <20250512195628.1728455-3-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250512195628.1728455-1-kevin.lampis@cloud.com>
References: <20250512195628.1728455-1-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

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
index bf7b081ad0..42b2e4e869 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -565,4 +565,12 @@ config BUDDY_ALLOCATOR_SIZE
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


