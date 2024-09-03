Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6455296A034
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789253.1198820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUNk-0006sk-MH; Tue, 03 Sep 2024 14:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789253.1198820; Tue, 03 Sep 2024 14:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUNk-0006q5-JJ; Tue, 03 Sep 2024 14:19:44 +0000
Received: by outflank-mailman (input) for mailman id 789253;
 Tue, 03 Sep 2024 14:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slUNj-0006pz-Ec
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:19:43 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f95a557-69ff-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:19:41 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso4983440a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:19:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a3c2sm6496859a12.9.2024.09.03.07.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 07:19:40 -0700 (PDT)
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
X-Inumbo-ID: 8f95a557-69ff-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725373181; x=1725977981; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlhUqwKcQOl/azVibnI5i35bA2jWVbeDSIOs54BTbIg=;
        b=mjU4rp082b0t/pf1MYe62ByFuNP3LP1GhsEOphRL0jEpRpPKbJBP0uitb3BNTMOB3W
         meoDBu7xebavzVxkJcGE9IVXbZUkiT4X68rWW/j9tytYT42UpoXf5JdBfHhkYUuj7+JT
         WSkKM5jb+TMU18g29arMDPSnLtkQPdiqJX3Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373181; x=1725977981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlhUqwKcQOl/azVibnI5i35bA2jWVbeDSIOs54BTbIg=;
        b=Km8m624/5KUBavD/K0gjPorUxX7FHTAz5TKxabFKCaUk3CLiguQLzlHjQZGKEmyzjn
         Kkjjprvak2Yd994Gb5hY1G3X1Bhjhn+QkaZRaEYKwntn7YPBiDDfesiTD/O5nUIWLa73
         +Maxo2q6DYx7O31cILhp9DwDZr/0atNxvLMzcjracQG5jL6WKnkLyLXSW/nKPhRprt9f
         DcA8buSZbhlLiFNz6EFp0sdPhViYKLFDWb2+U60B5kFzGu1FauncwKFHVS5K7cEk2YO/
         lirFdQZq8nc9X+2Vmhg175Y8+a0djfaXgTePfMX8l9bFTMRSqHdcxVUokeMnUysh73Bt
         m3UQ==
X-Gm-Message-State: AOJu0YwleLVh8hULPSsoov0zIDEuqNrtEbP9YEJ0TFh4KO5vhhAknmCJ
	CjsKo9JNbiztO0Gl41oZ6X+BTF6K8/lvrnBd/u3qTJ81xohq6io0HyJyIe3J9GU5p61nWN7KLHN
	j
X-Google-Smtp-Source: AGHT+IE41pRM8n7FnmmWca20oRChFAJDeCjIzi7wVC7hvcHfaqC7DzUaML3gsi10iNChYGUso1gvxQ==
X-Received: by 2002:a50:cb86:0:b0:5c0:9fdd:bfff with SMTP id 4fb4d7f45d1cf-5c242f21da2mr6593229a12.28.1725373180495;
        Tue, 03 Sep 2024 07:19:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] RISCV/shutdown: Implement machine_{halt,restart}()
Date: Tue,  3 Sep 2024 15:19:37 +0100
Message-Id: <20240903141937.3552353-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
References: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SBI has an API for shutdown so wire it up.  However, the spec does allow the
call not to be implemented, so we have to cope with the call return returning.

There is a reboot-capable SBI extention, but in the short term route route
machine_restart() into machine_halt().

Then, use use machine_halt() rather than an infinite loop at the end of
start_xen().  This avoids the Qemu smoke test needing to wait for the full
timeout in order to succeed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

As per commit e44f33ccddc2 ("ppc/shutdown: Implement
machine_{halt,restart}()")

Simply replacing BUG() with a printk() is just swapping one problem for
another.
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/sbi.h |  3 +++
 xen/arch/riscv/sbi.c             |  5 +++++
 xen/arch/riscv/setup.c           |  6 ++----
 xen/arch/riscv/shutdown.c        | 25 +++++++++++++++++++++++++
 xen/arch/riscv/stubs.c           | 12 ------------
 6 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100644 xen/arch/riscv/shutdown.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 81b77b13d652..d192be7b552a 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,7 @@ obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += shutdown.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 0e6820a4eda3..4d72a2295e72 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -13,6 +13,7 @@
 #define __ASM_RISCV_SBI_H__
 
 #define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
+#define SBI_EXT_0_1_SHUTDOWN			0x8
 
 struct sbiret {
     long error;
@@ -31,4 +32,6 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
  */
 void sbi_console_putchar(int ch);
 
+void sbi_shutdown(void);
+
 #endif /* __ASM_RISCV_SBI_H__ */
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 0ae166c8610e..c7984344bc6b 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -42,3 +42,8 @@ void sbi_console_putchar(int ch)
 {
     sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
 }
+
+void sbi_shutdown(void)
+{
+    sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a6a29a150869..bf9078f36aff 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -4,6 +4,7 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 #include <xen/mm.h>
+#include <xen/shutdown.h>
 
 #include <public/version.h>
 
@@ -28,8 +29,5 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     printk("All set up\n");
 
-    for ( ;; )
-        asm volatile ("wfi");
-
-    unreachable();
+    machine_halt();
 }
diff --git a/xen/arch/riscv/shutdown.c b/xen/arch/riscv/shutdown.c
new file mode 100644
index 000000000000..270bb26b68a6
--- /dev/null
+++ b/xen/arch/riscv/shutdown.c
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/shutdown.h>
+
+#include <asm/sbi.h>
+
+void machine_halt(void)
+{
+    sbi_shutdown();
+
+    for ( ;; )
+        asm volatile ("wfi");
+
+    unreachable();
+}
+
+void machine_restart(unsigned int delay_millisecs)
+{
+    /*
+     * TODO: mdelay(delay_millisecs)
+     * TODO: Probe for #SRST support, where sbi_system_reset() has a
+     *       shutdown/reboot parameter.
+     */
+
+    machine_halt();
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 3285d1889940..2aa245f272b5 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -49,18 +49,6 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     BUG_ON("unimplemented");
 }
 
-/* shutdown.c */
-
-void machine_restart(unsigned int delay_millisecs)
-{
-    BUG_ON("unimplemented");
-}
-
-void machine_halt(void)
-{
-    BUG_ON("unimplemented");
-}
-
 /* domctl.c */
 
 long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,

base-commit: 1e6bb29b03680a9d0e12f14c4d406a0d67317ea7
-- 
2.39.2


