Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC6AACAD7
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977541.1364526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL6B-0006Ps-7I; Tue, 06 May 2025 16:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977541.1364526; Tue, 06 May 2025 16:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL6B-0006OG-3z; Tue, 06 May 2025 16:24:51 +0000
Received: by outflank-mailman (input) for mailman id 977541;
 Tue, 06 May 2025 16:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCL6A-0005Pz-2M
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:24:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ccd121-2a96-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:24:49 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso947376066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:24:49 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189508c83sm731618666b.139.2025.05.06.09.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:24:47 -0700 (PDT)
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
X-Inumbo-ID: a1ccd121-2a96-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746548689; x=1747153489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBOltvQZR3cZ8LO+u+HiQLbhIjuLAqi4VTV7akpp3TI=;
        b=bc6RrH9LX3VoKGbodK26IgVsmlK7nvKc0FvBC0oWdlXGsMBb3yEzKGSPpNSq5efTXb
         bSW6Q80zWfMq3bZg8Rn0aTP5mMysm0mqjurdojsSvvb5cT9FlCfF2TXGdIh39diNf0XP
         6F90jAnIIiVnnHM0TpjgOCxXUajZXrHzmPC2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548689; x=1747153489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBOltvQZR3cZ8LO+u+HiQLbhIjuLAqi4VTV7akpp3TI=;
        b=ovzGYv/GlbcxxI026qKDAKzlyyBE8UgNsU86H7UVo//1t9SxmSFJCKB1Cg/ZBNqf4W
         ZoYyu0B5BkdLK1sQHCdarAdF2H4HAQYa22AIkWqufVy0WxTKZ01gmkYFpp/drIqVJsJg
         YiYuO+udQcYTYNTRSJHgVLrGmg/GbZu1UojLY5yYkdEI3bb9goxCvxmgK+pkKyq8VAyj
         CHZ8pXSEE8Lrz3kL8OKEhYvz07WlIE4Sp75oB+D+nKIj2xxI9BK6j+TPQhdsMGOFfpTr
         MvoqoC2V0bZ25EwekPkw6otKUFDGlsQsAeWMF/d8BFfFfqCgdjBNLjqwLMtle/yVZf4j
         ub4A==
X-Gm-Message-State: AOJu0YwRZzUARCn+QT/kO+/ZZRMhudeZXYQmJ//zWCRuODb5otXyp7hW
	f/uqDAwzmHSbqomekRVXDUmvMGw8feGT5i5G+vPAEushChbe066yJlF62agrsvxwzIfPxlY2ba7
	n
X-Gm-Gg: ASbGncuYSHcArR5YSKjXB3mF5/AzmmI8PQ5YmAYaJIbNiCk9FCf1oITDwbKHrzPyz14
	nNlBbnECTMgK3qGLiu8a5bckLqya176slAw3LaF0bIlnYIWCFZ9uBLr8TREsu8EwopZV2b5xWaz
	vH6YinAIsP9Dbh/mrqVIqESfN1LvyPuvaZewQspOnN3xFKy7Wuln+Be9NG8LlgrYgqeWwMdLnML
	TQo5eTozYhxgxYduvtrMWwtAgxPx7sM/3Qr07Q5B5vEqEugeakAnlzCbJWSilgesrRsFen+qXkO
	i/KfL4LvMWX8rYrVbkakdF2Rp6KP4/0Qb2AM+80v1me6ilF0cx4aapmOzMZiy0LK7Kag
X-Google-Smtp-Source: AGHT+IGvktPkRxHyQs1y7N4d3yBLwC2MGZGxVEbzD+fsaLZ5oq0CWl2kTU8NK/BXQs9YWk28kJ2EBg==
X-Received: by 2002:a17:907:7fab:b0:ace:3ede:9d26 with SMTP id a640c23a62f3a-ad1e8d2298amr8868566b.27.1746548688713;
        Tue, 06 May 2025 09:24:48 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/4] efi: Add a function to check if Secure Boot mode is enabled
Date: Tue,  6 May 2025 17:24:49 +0100
Message-ID: <20250506162449.1676405-1-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also cache it to avoid needing to repeatedly ask the firmware.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
 xen/common/efi/boot.c    | 23 +++++++++++++++++++++++
 xen/common/efi/runtime.c |  3 +++
 xen/include/xen/efi.h    |  6 ++++++
 3 files changed, 32 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e39fbc3529..7c528cd5dd 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -870,6 +870,27 @@ static void __init pre_parse(const struct file *file)
                    " last line will be ignored.\r\n");
 }
 
+static void __init init_secure_boot_mode(void)
+{
+    EFI_STATUS status;
+    EFI_GUID gv_uuid = EFI_GLOBAL_VARIABLE;
+    uint8_t data = 0;
+    UINTN size = sizeof(data);
+    UINT32 attr = 0;
+    status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, &attr,
+                                 &size, &data);
+
+    if ( status == EFI_NOT_FOUND ||
+         (status == EFI_SUCCESS &&
+          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) &&
+          size == 1 && data == 0) )
+        /* Platform does not support Secure Boot or it's disabled. */
+        efi_secure_boot = false;
+    else
+        /* Everything else play it safe and assume enabled. */
+        efi_secure_boot = true;
+}
+
 static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     efi_ih = ImageHandle;
@@ -884,6 +905,8 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
 
     StdOut = SystemTable->ConOut;
     StdErr = SystemTable->StdErr ?: StdOut;
+
+    init_secure_boot_mode();
 }
 
 static void __init efi_console_set_mode(void)
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 7e1fce291d..b63d21f16c 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -40,6 +40,9 @@ void efi_rs_leave(struct efi_rs_state *state);
 unsigned int __read_mostly efi_num_ct;
 const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
 
+#if defined(CONFIG_X86) && !defined(CONFIG_PV_SHIM)
+bool __ro_after_init efi_secure_boot;
+#endif
 unsigned int __read_mostly efi_version;
 unsigned int __read_mostly efi_fw_revision;
 const CHAR16 *__read_mostly efi_fw_vendor;
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 160804e294..ae10ac62d0 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -40,6 +40,12 @@ static inline bool efi_enabled(unsigned int feature)
 }
 #endif
 
+#if defined(CONFIG_X86) && !defined(CONFIG_PV_SHIM)
+extern bool efi_secure_boot;
+#else
+#define efi_secure_boot false
+#endif
+
 void efi_init_memory(void);
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
-- 
2.42.0


