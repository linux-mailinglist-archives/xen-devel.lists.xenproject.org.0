Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8EAB453F
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982145.1368711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZGP-00078Z-DA; Mon, 12 May 2025 19:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982145.1368711; Mon, 12 May 2025 19:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZGP-00076p-9k; Mon, 12 May 2025 19:56:37 +0000
Received: by outflank-mailman (input) for mailman id 982145;
 Mon, 12 May 2025 19:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZGN-0005qp-OK
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:56:35 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34bb4ed2-2f6b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:56:34 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5fc8c68dc9fso2765686a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:56:34 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be0c5sm656407366b.153.2025.05.12.12.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 12:56:32 -0700 (PDT)
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
X-Inumbo-ID: 34bb4ed2-2f6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079793; x=1747684593; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vko/TdS4oIy2sjncEqYDjmf9vGJvEJOwtxlN9MhiSlw=;
        b=QpOsgWNBG+HpZdKis7dZdD+lE/2t40AiVncjF5CjFZS1k48DyNiG3QaKfOjTimXOTL
         ousaHz0LDCpUCv5SsuVhdsSOG7+iICE++aTkOsflwm4luwvb4fGv/Qieveecyd9pWSFD
         swK1tNGUXGv6S3E31LSA4L2NEInPp0899vyqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079793; x=1747684593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vko/TdS4oIy2sjncEqYDjmf9vGJvEJOwtxlN9MhiSlw=;
        b=FT2hNlcw9VMRpKgO7iFme8HvmuJeVwNT3O8XeqZzrWxekeHNwbE+YhHoXebOTl0Bhd
         yAVLU5ocS/4OTn5Fg5V5quUxFTZ2+iwa1zR+xftAxs2W4fNheIHPBI8QkllcCmWGht4C
         x/CCQXZPhi3TNuX2X1NeRx3eF6BIfJbv4aCF2G20hRybJOX1zQFFwBoUp7no2iSrxxM2
         dN6ebVmmXXrYlIkkcErqWvnYZmwvD9FXLWwnFP4NkWzgHFsgEzdxNOHdthzoxtH2Ue/U
         qZMsgyCeHKBy+f21eXoqXTdnnD67IQdfBiXrlPnB/uVaIzVo5Fcqw7dMgQBVRBqXKwoM
         R2jg==
X-Gm-Message-State: AOJu0YxiVhaZpmtIp0QQnVXARGTOOeEi22+UFRbVma5gdHk6jcinXKgV
	BdUIc24NFMSMupthr0JjCjegyTNwl0EfiWUavG5R0+5hGkx4AnWH/zJKSUerqveED377Z2/ZX61
	Y
X-Gm-Gg: ASbGnctXUmHbA9OhZs7Uj1J+yhFFQMV1lYFPijnu7Gh9ZIEDa/KTMl7yOHpXBNOm1S8
	m0pCzPosdJeLTJ/kUaZdQoS+AdqvzMORl+aWjtds61UPpacV7jdGVnYt7J7itj/KO4b4KVu58Sr
	E+sbyOsVeFjJczNNCLqHDPKIsScWMsRHeddFgULeNf6Yx67tBv7CskUjEttN42htlz4T9IHrXRU
	mIEoy0ISZ9I1lbjfVsLJJ5cCikVry5XqGvpCJn2Dvp/XbBio41uFT4jDJnQOCD33ngQgEdd/0Tt
	1Pk4NKnI/urM9aoKsb+Y004WvbrPEG8KjLydjFdE8wP2KTtMsAR0CWbldeeTb2CUNCHs
X-Google-Smtp-Source: AGHT+IFItN1eCoS5zWKnTx4R48c4D/+++0fMhAhc9k0xKuI6w1wPJMeI2tVFAUnhAnbYmnsQVjeFPg==
X-Received: by 2002:a17:907:986:b0:ad4:d9b2:6ee4 with SMTP id a640c23a62f3a-ad4d9b26f2amr35672366b.49.1747079793192;
        Mon, 12 May 2025 12:56:33 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH 1/3] efi: Add a function to check if Secure Boot mode is enabled
Date: Mon, 12 May 2025 20:56:26 +0100
Message-ID: <20250512195628.1728455-2-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250512195628.1728455-1-kevin.lampis@cloud.com>
References: <20250512195628.1728455-1-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

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


