Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12269D16F2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 18:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839429.1255232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD5OH-0008LB-9N; Mon, 18 Nov 2024 17:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839429.1255232; Mon, 18 Nov 2024 17:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD5OH-0008JX-5t; Mon, 18 Nov 2024 17:18:21 +0000
Received: by outflank-mailman (input) for mailman id 839429;
 Mon, 18 Nov 2024 17:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUlN=SN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tD5OE-0008JP-Ro
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 17:18:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 179fa894-a5d1-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 18:18:13 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa2099efdc3so832729066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 09:18:13 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df51632sm560313766b.49.2024.11.18.09.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 09:18:12 -0800 (PST)
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
X-Inumbo-ID: 179fa894-a5d1-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE3OWZhODk0LWE1ZDEtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTUwMjkzLjY2MTY1Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731950292; x=1732555092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lTQ6jQnvs29mJOeG7rIjzg0W48oVchHvR1jKCuoRf+c=;
        b=N86n045FSfeb4NTmVYZAd8nr6i68XneTcrEY4Qri2l7ZhJeLmrbjGUgMQoSUUOnLqs
         2HIUcIGybSBYagnkgmeYUydnO96YiIKnWaOBrUms4PziAbFKqtS9OuJS+ArgeWtVy3qq
         g5oHA9eFvYktwVnEbJACD0b7Cuyni1iQzcWyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950292; x=1732555092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTQ6jQnvs29mJOeG7rIjzg0W48oVchHvR1jKCuoRf+c=;
        b=j6P0j4zR9qo2Y6KBdhOYBBdgFR9AFBw0AS2t2SPbwW0DsxA5mf0p9hSZomIdT98j4E
         qrI/xitfEdUWVicbLGZj/096CS+aiwzR+7NnZsI65YJcVwmUAsSuvqZaNjEZpK91+c78
         S1jBRGUPbeGy4tm5w91WLymf3M3w5WZTEbOBTVp4Ci7nz8SQr1xZb9kriYXwqSWoS+o7
         HD9TlkN3r5SqP9BL8OsWBA5VxJIujNYC2ojNMy6bzUCMSF07PTIBmKPB4mznGb+3mysM
         +zDtWUkSL8mMwwE3IPRhfM598avD0KHrGslEBHCJcd9Q1YKAyk37VL46Wt9qax3bGHWP
         9QOQ==
X-Gm-Message-State: AOJu0YyrKEq/4jbJmQaPvPm1e42hjnNqz2d9UqQyzYOj1Pl5jifJUZx5
	7bjJhaiNz5PaXPuFS7ffWT7disRE7xKUb7D3o8V7q4UlLXAGV7EhXxpTQf2FBsfy+P6dM0ZgTno
	P
X-Google-Smtp-Source: AGHT+IFKpAFpztwF3Q6e4SgO5Ub4KCVlxjDxwxnRNWEpFxzoypHAszOdBZuWyBXuIM655WrF9UTLSw==
X-Received: by 2002:a17:907:9285:b0:a9a:1575:23e3 with SMTP id a640c23a62f3a-aa4c7e490f5mr12599066b.19.1731950292495;
        Mon, 18 Nov 2024 09:18:12 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/boot: Introduce boot-helpers.h
Date: Mon, 18 Nov 2024 17:18:09 +0000
Message-Id: <20241118171809.2447714-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Eclair complains that neither reloc_trampoline{32,64}() can see their
declarations.

reloc_trampoline32() needs to become asmlinkage, while reloc_trampoline64()
needs declaring properly in a way that both efi-boot.h and reloc-trampoline.c
can see.

Introduce boot-helpers.h for the purpose.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1549438881
---
 xen/arch/x86/boot/reloc-trampoline.c    |  4 +++-
 xen/arch/x86/efi/efi-boot.h             |  4 ++--
 xen/arch/x86/include/asm/boot-helpers.h | 13 +++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/boot-helpers.h

diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
index d5548eb08f85..e35e7c78aa86 100644
--- a/xen/arch/x86/boot/reloc-trampoline.c
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -2,13 +2,15 @@
 
 #include <xen/compiler.h>
 #include <xen/stdint.h>
+
+#include <asm/boot-helpers.h>
 #include <asm/trampoline.h>
 
 extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
 extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
 
 #if defined(__i386__)
-void reloc_trampoline32(void)
+void asmlinkage reloc_trampoline32(void)
 #elif defined (__x86_64__)
 void reloc_trampoline64(void)
 #else
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 9d3f2b71447e..1d8902a9a724 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -4,6 +4,8 @@
  * therefore can define arch specific global variables.
  */
 #include <xen/vga.h>
+
+#include <asm/boot-helpers.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/microcode.h>
@@ -103,8 +105,6 @@ static void __init efi_arch_relocate_image(unsigned long delta)
     }
 }
 
-void reloc_trampoline64(void);
-
 static void __init relocate_trampoline(unsigned long phys)
 {
     trampoline_phys = phys;
diff --git a/xen/arch/x86/include/asm/boot-helpers.h b/xen/arch/x86/include/asm/boot-helpers.h
new file mode 100644
index 000000000000..166f49b4da01
--- /dev/null
+++ b/xen/arch/x86/include/asm/boot-helpers.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Declarations for helper functions compiled for both 32bit and 64bit.
+ *
+ * The 32bit forms are called only from assembly, so no declaration is provide
+ * here.
+ */
+#ifndef X86_BOOT_HELPERS_H
+#define X86_BOOT_HELPERS_H
+
+void reloc_trampoline64(void);
+
+#endif /* X86_BOOT_HELPERS_H */
-- 
2.39.5


