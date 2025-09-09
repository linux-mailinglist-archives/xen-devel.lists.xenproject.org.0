Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C0B50035
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 16:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117089.1463304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvzi8-0001zQ-V1; Tue, 09 Sep 2025 14:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117089.1463304; Tue, 09 Sep 2025 14:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvzi8-0001xB-S4; Tue, 09 Sep 2025 14:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1117089;
 Tue, 09 Sep 2025 14:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wvTB=3U=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uvzi7-0001x1-Ua
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 14:52:43 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a368f53f-8d8c-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 16:52:42 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-627b85e4c0fso4009962a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 07:52:42 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c018f663asm1414898a12.43.2025.09.09.07.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:41 -0700 (PDT)
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
X-Inumbo-ID: a368f53f-8d8c-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757429562; x=1758034362; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eEqARqC+B2G8bL7TcbwWKgsOMAevlPlBxP4QFC8iu8=;
        b=Ctvoi2jDK/w2HDN+dlQDS0T1eYZBiIdsEFqUAb33/r4u1g35I6HFT6FMPtEKvczCjG
         fDHvBIsAF6O7ooVkBxOuYAoT90yy2ue0Mlq7nEYMVZDxCDpIaHPFJdYEx5oYAgLPqz+z
         LB+zxbIOjA+Wt+0Se1LZwPfoFwKNpgBy651Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429562; x=1758034362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eEqARqC+B2G8bL7TcbwWKgsOMAevlPlBxP4QFC8iu8=;
        b=Y28s9KuWgL7k4KTWypGSg/OfgxxOO2Eh59WGSfi449mnspw3vODyv3oOqFA3lxwo7E
         61/NMoivG/SifJRRLk3bObn32XpD9VN57iY2adPl3braqnlXUgjPXBQrC1CAZw0054V5
         i3cV/HKJVXKZzZQT3No+zSTMITjSK2MSsvPuNGJq8BhMuj79TI6hRpHWmvysIyUDQ/Eg
         LqxmyTCpT1EYsKEIT7drq65z+QR0dS+SGBG4mqBuEavN4FNFy105Uqz3jVINhU3xfepO
         Pvr5Fs+PWryV/VeY0yQfTiBcf+sZD7mGYUmi+R9D7iloq448RlWwRM8Cxkc8BdWhv+lF
         Fl7w==
X-Gm-Message-State: AOJu0YwjM/Iba6RNN3eXArgh5veLsOGbJaVzuyv80kYHHBxAxEZ5KQYJ
	ydCX/KFh52V/WKJtKxlKG+HgjMu7TWAdvmJveb0owwu/Ye+hfV8s+8E5697Sf5VB82KGtQyK55T
	Bi9bmDmE=
X-Gm-Gg: ASbGncuIWqKkEWDNdsgDrPzej+T8vDVtevVYbEYD6dsMDeqRv4rSzhbABRK5Xw/4hzT
	StYa8tVAANbDULcuaxXhLEw0ol4UUEv7JshekBIJoKLarMthb504D0WksjM58nkMJQznIipX/im
	IZDJQi7bqpa8tSx1EH6bRQiWSpXjFJ3zCmyRkia2GsbWmLyl6DmoiJWr5uSc8A2iw7F1hf9U3k4
	iAzENJGnUKKBLn5SiWCQlU0iXr8460q5JOAWSitniMn0bZ4Vxx569OmPbz8pe7/whVKrsVpzN/b
	2eGGTiiVMuO/hJM/rEx5RWOb1kLKgexlcorLQ0CW7EqZI4F8PK2Vb58OcDQxHLoN86r60OyUFBn
	DR0+XbYW2j+ETYdKGPU+6AfyjZ+CdVNssQRmTEoDeG2ayN+4H8wYQRIwW
X-Google-Smtp-Source: AGHT+IGdmlzAwf9qfVQOHOdpr+P0JJ3hMje1i2OshWya4hxHI39qZjL+0rhVPA5EfM2sZT5+b4vQtQ==
X-Received: by 2002:a05:6402:4302:b0:626:73d7:36c5 with SMTP id 4fb4d7f45d1cf-62673d739f9mr9997431a12.11.1757429561644;
        Tue, 09 Sep 2025 07:52:41 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 1/2] efi: Add a function to check if Secure Boot mode is enabled
Date: Tue,  9 Sep 2025 14:52:32 +0000
Message-ID: <69dad96a21e230b35d57b8e3253815f9cb1532d3.1757421999.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757421999.git.gerald.elder-vass@cloud.com>
References: <cover.1757421999.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Also cache it to avoid needing to repeatedly ask the firmware.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

v5:
- Fix line length
v4:
- Fix MISRA warning regarding SecureBoot string
v3:
- Fix build on ARM
---
 xen/common/efi/boot.c    | 25 +++++++++++++++++++++++++
 xen/common/efi/runtime.c |  1 +
 xen/include/xen/efi.h    |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e12fa1a7ec04..5eb0394e2937 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -901,6 +901,29 @@ static void __init pre_parse(const struct file *file)
                    " last line will be ignored.\r\n");
 }
 
+static void __init init_secure_boot_mode(void)
+{
+    static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;
+    static CHAR16 __initdata str_SecureBoot[] = L"SecureBoot";
+    EFI_STATUS status;
+    uint8_t data = 0;
+    UINTN size = sizeof(data);
+    UINT32 attr = 0;
+
+    status = efi_rs->GetVariable(str_SecureBoot, &gv_uuid, &attr, &size, &data);
+
+    if ( status == EFI_NOT_FOUND ||
+         (status == EFI_SUCCESS &&
+          attr == (EFI_VARIABLE_BOOTSERVICE_ACCESS |
+                   EFI_VARIABLE_RUNTIME_ACCESS) &&
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
@@ -915,6 +938,8 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
 
     StdOut = SystemTable->ConOut;
     StdErr = SystemTable->StdErr ?: StdOut;
+
+    init_secure_boot_mode();
 }
 
 static void __init efi_console_set_mode(void)
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 42386c6bde42..30d649ca5c1b 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -41,6 +41,7 @@ void efi_rs_leave(struct efi_rs_state *state);
 unsigned int __read_mostly efi_num_ct;
 const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
 
+bool __ro_after_init efi_secure_boot;
 unsigned int __read_mostly efi_version;
 unsigned int __read_mostly efi_fw_revision;
 const CHAR16 *__read_mostly efi_fw_vendor;
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 623ed2ccdf31..723cb8085270 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -36,6 +36,8 @@ static inline bool efi_enabled(unsigned int feature)
 }
 #endif
 
+extern bool efi_secure_boot;
+
 void efi_init_memory(void);
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
-- 
2.47.3


