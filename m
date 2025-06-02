Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60569ACAF68
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003400.1382957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VJ-00077s-UT; Mon, 02 Jun 2025 13:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003400.1382957; Mon, 02 Jun 2025 13:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VJ-00074y-R5; Mon, 02 Jun 2025 13:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1003400;
 Mon, 02 Jun 2025 13:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jabw=YR=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uM5VI-000739-R5
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:47:04 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 106991bf-3fb8-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 15:47:03 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad88105874aso687584266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:47:03 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd04591sm790372466b.114.2025.06.02.06.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:47:01 -0700 (PDT)
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
X-Inumbo-ID: 106991bf-3fb8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1748872022; x=1749476822; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUY9aLovER8VbMW5czTU1XwpbiLmoqQ0EIkuCpbO60s=;
        b=iFyzM7Lznth22fYcf40jChkwAIpHkNO+NHUStVwtk9XRMjyevJYfrcTVtjgAsPneDf
         TIYAqaM5lQLH+zRSRrZEC9DaMhcf8N03Vbb7Hrp8Ftx5Ctl17pRA3XGkWj1zo3SZiApW
         hw/2epm9t+7zk/BNQ0QH3fh0b1jcfVNMlFvdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872022; x=1749476822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUY9aLovER8VbMW5czTU1XwpbiLmoqQ0EIkuCpbO60s=;
        b=sV4SsgxAsu3huvbgWKqWU0xa/XKFAXDoKiRxMLP/Bkx5A+jqheKO+LnraR9jYSMnV0
         WWg0RuwJXJEZKzjA/SzhwOILSC4+RwonuLW4fykyq17Sag5ttAMIB0uQpiM8Hh+VN+te
         uxqC+TaFiuMk+i7TS5P0prE/RWFjQdM5bO786ADW/KKJBoEWkJxcKor9vOzS/5BfgjA3
         dujc5W2CT8uHu9KobHQMwW5Lot08wonhOBhRkYo3z+j1nLzO9y/di5kQcpxFPILNP34n
         YldOLa8Ld7/C0YtxsLJTvgA2fDkgaA9A0L5dz9xlO4QN8/PwDjCo1gD4xBHQaDaV7z/o
         kKOA==
X-Gm-Message-State: AOJu0Yy1YzJc8Jb1Dlwi9LLCmH0Fr65g/SEUiIHWyFBNcFFsFhKUlQRY
	5Dema7oB9v1aTav8+I2Tr8lyuE/4p1Jv6Yivc1JbDMr9crhD4eGKiGAF7BHmYtgR4ElunlNldKQ
	JRsD1
X-Gm-Gg: ASbGncsLhY9+r3qtM7oSvybIK+ENprowwi1S36QziHWotBV0mpzNyzR49tKwD32L6MF
	oViOZJJYBuJMqTbfgB72ZljLQazq2w/tPQ0koNumS1FfkY++beBIA0R4JBRHcAnfLMB81t9G27b
	ez+Cr8HD8s1hNF5aIE3vJJ9EgNAqAFFYPXYOuuIsdl8XSsCPv+UmvNxdv0qDO/TNMkTY3Wm8q/V
	8PH7D/EFY/lrCiwk8mX4tCvhsQPFWFT9pvZ+cdI7LWtz3QbNzRHPWuVuJIgERpVzUgrqT57wSJh
	4SrV5YlF/QG0eCqwSRFKRyWCt6cowryEIt/FqNzf/jItCmbFVT/hps0Gdthtbg7ZbJy2
X-Google-Smtp-Source: AGHT+IE7h0pcwcJQaHNurqLaeDeDGh2s76qegW3LqKsV3t6RmL+M2iTUFPHtBRYNTB/o21N3dUGUNQ==
X-Received: by 2002:a17:907:6e86:b0:ad2:2569:696d with SMTP id a640c23a62f3a-adb322d8912mr1203167466b.15.1748872022189;
        Mon, 02 Jun 2025 06:47:02 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH v2 1/3] efi: Add a function to check if Secure Boot mode is enabled
Date: Mon,  2 Jun 2025 14:46:54 +0100
Message-ID: <20250602134656.3836280-2-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250602134656.3836280-1-kevin.lampis@cloud.com>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Also cache it to avoid needing to repeatedly ask the firmware.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
Changes in v2:
- None
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


