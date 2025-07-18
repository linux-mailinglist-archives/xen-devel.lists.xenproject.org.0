Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70931B09FFA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 11:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048292.1418511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchbQ-0003iP-Op; Fri, 18 Jul 2025 09:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048292.1418511; Fri, 18 Jul 2025 09:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uchbQ-0003gM-ME; Fri, 18 Jul 2025 09:42:04 +0000
Received: by outflank-mailman (input) for mailman id 1048292;
 Fri, 18 Jul 2025 09:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ry9=Z7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uchbO-0003gF-PP
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 09:42:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c6f6fbf-63bb-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 11:41:48 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so18161305e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 02:41:47 -0700 (PDT)
Received: from localhost.localdomain (146.225.6.51.dyn.plus.net.
 [51.6.225.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c9edsm1335104f8f.88.2025.07.18.02.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:41:46 -0700 (PDT)
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
X-Inumbo-ID: 6c6f6fbf-63bb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1752831707; x=1753436507; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9qsULRSt9ECqx1XP7TT9mjCbuocyysj3P1rIpM/A34=;
        b=auV9qQK3Tf24JJlw44zEoGq2dW5kUebD+aq2zSN5/PGAQZxfAcoWbf+BxGd4Gf20Va
         Qbqww8njC7Prpt36dJQGAmC/6r6ol/QHYrXOsVrHuKS+t3SCrA/Ja14JKcqs37B/VqzK
         GIrxzjeYCgrzw9q8aJA0fI/Rw1sHFRNPzeK/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831707; x=1753436507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9qsULRSt9ECqx1XP7TT9mjCbuocyysj3P1rIpM/A34=;
        b=CeOFlGYIeMv3YQY59UQnpDH80sm+juk97QDaXM+FASsc/8P5+Ttdq5MAX4P9f1vB94
         JENI3ibULhS2SbNur8OkcZqNgoYN7xVlwWFBcq0oukcZU135w4u1lVd8TRPyPHNgCHZG
         BHV8Rav0U/63if6Y7nQ6eMu3vX2QsqzW8M8LJOjfDYJPMfpcQyeBKyrtnys1UFE5OaEX
         nBoOZHORycqLMBljw007hWEVPryXPdigrHN38e6YFM5vMNeAzJbRHXxVRNG2D44H5t1/
         eeqLnJ+ZtZgTdJmKUmUVQLJfFEmYPs2Nh4vok3y2IyJ/4nNOijK5V68P7YFJ5sUgEer0
         augQ==
X-Gm-Message-State: AOJu0Ywc3vYSWmZ2QD9zZcZIKnFkVr5JtMXOSPfuzoAvvaoIE/MnplpE
	V49/55bBADfvwqM5oJ/yQJr/ms/L6BcMg7p5e0BHX391/PguFAcjFU4JVKHVHp8teMp5C8YUlup
	qJbL8
X-Gm-Gg: ASbGncvauhaRaF1GpMXy8lQLACkov9akFDkPr4HE5Uiry7Oo12tL1jlsUVGQtpJGPHs
	eN6A72eMmvuMKVNbJNus1K2kEAmin7q0o3NOWsSJUad3kinHwzo5hCtEY/brttyVG9MVa/vKBlg
	XlbVfDNn3b3aT38KwrCw0wBdxFvQ2KsDjWiNjlSArOwh2xSRX8LhCBrOLZZI/TyF9KJSceeuGML
	6k28b3qM6xIQn7JYwhS7vCxEW9VLtfXnkMAFvZyMMeAOVmr73loIp257xYiZB2VdxdpHmGPsJTk
	J/vILmEj1BRiHRWgvmcHhB9+vPT5oYu6ivHiqF9SiTt+At6tCVoH/y6UGYRbsjcs8JRW17hLysn
	D5JFEBO0892Z92Z5bGoFRfJw+C7oUcbgOgJB+VDt693u+XH9Kky+H3OFK+TdG6oqYlg==
X-Google-Smtp-Source: AGHT+IF/fHcTQ66ziD/bqGHwzbkpC3rROpCxb1wEI8loia1QIMpQbPbuL/42Pz1H+QOQukInqAp+YQ==
X-Received: by 2002:a05:600c:4fc5:b0:456:1156:e5f5 with SMTP id 5b1f17b1804b1-456359ee0a4mr58812105e9.31.1752831706881;
        Fri, 18 Jul 2025 02:41:46 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/efi: Reuse PrintMessage function
Date: Fri, 18 Jul 2025 10:41:38 +0100
Message-ID: <20250718094139.19351-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PrintMessage function print a message string followed by a
new line.
Move the function from ARM specific code to common code.
Reuse it in EFI code.
No functional changes.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/arm/efi/efi-boot.h |  7 -------
 xen/arch/x86/efi/efi-boot.h |  2 +-
 xen/common/efi/boot.c       | 22 ++++++++++++++--------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 7dd2528a17..3dbeed3f89 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -48,7 +48,6 @@ void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
 void __flush_dcache_area(const void *vaddr, unsigned long size);
 
 static int get_module_file_index(const char *name, unsigned int name_len);
-static void PrintMessage(const CHAR16 *s);
 
 #define DEVICE_TREE_GUID \
 {0xb1b621d5U, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
@@ -634,12 +633,6 @@ static int __init get_module_file_index(const char *name,
     return ret;
 }
 
-static void __init PrintMessage(const CHAR16 *s)
-{
-    PrintStr(s);
-    PrintStr(newline);
-}
-
 /*
  * This function allocates a binary and keeps track of its name, it returns the
  * index of the file in the modules array or a negative number on error.
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..d256310619 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -646,7 +646,7 @@ static void __init efi_arch_memory_setup(void)
     else
     {
         cfg.addr = 0;
-        PrintStr(L"Trampoline space cannot be allocated; will try fallback.\r\n");
+        PrintMessage(L"Trampoline space cannot be allocated; will try fallback.");
     }
 
     if ( !efi_enabled(EFI_LOADER) )
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index aad9f4db1e..6c2ef13bc5 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -174,6 +174,12 @@ static void __init PrintErr(const CHAR16 *s)
     StdErr->OutputString(StdErr, (CHAR16 *)s );
 }
 
+static void __init PrintMessage(const CHAR16 *s)
+{
+    PrintStr(s);
+    PrintStr(newline);
+}
+
 static CHAR16 *__init FormatDec(UINT64 Val, CHAR16 *Buffer)
 {
     if ( Val >= 10 )
@@ -452,7 +458,7 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
     *leaf = NULL;
     if ( !loaded_image->DeviceHandle )
     {
-        PrintStr(L"Xen image loaded without providing a device\r\n");
+        PrintMessage(L"Xen image loaded without providing a device");
         return NULL;
     }
 
@@ -485,7 +491,7 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
              * For instance this can happen if Xen was loaded using GRUB2
              * "chainloader" command and the file was not from ESP.
              */
-            PrintStr(L"Unsupported device path component\r\n");
+            PrintMessage(L"Unsupported device path component");
             return NULL;
         }
 
@@ -1378,11 +1384,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                 else if ( wstrcmp(ptr + 1, L"help") == 0 ||
                           (ptr[1] == L'?' && !ptr[2]) )
                 {
-                    PrintStr(L"Xen EFI Loader options:\r\n");
-                    PrintStr(L"-basevideo   retain current video mode\r\n");
-                    PrintStr(L"-mapbs       map EfiBootServices{Code,Data}\r\n");
-                    PrintStr(L"-cfg=<file>  specify configuration file\r\n");
-                    PrintStr(L"-help, -?    display this help\r\n");
+                    PrintMessage(L"Xen EFI Loader options:");
+                    PrintMessage(L"-basevideo   retain current video mode");
+                    PrintMessage(L"-mapbs       map EfiBootServices{Code,Data}");
+                    PrintMessage(L"-cfg=<file>  specify configuration file");
+                    PrintMessage(L"-help, -?    display this help");
                     blexit(NULL);
                 }
                 else
@@ -1433,7 +1439,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
-            PrintStr(L"Using builtin config file\r\n");
+            PrintMessage(L"Using builtin config file");
         else if ( !cfg_file_name && file_name )
         {
             CHAR16 *tail;
-- 
2.43.0


