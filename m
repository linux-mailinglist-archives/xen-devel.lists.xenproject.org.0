Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B37B45757
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111865.1460435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVH0-0001vP-C2; Fri, 05 Sep 2025 12:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111865.1460435; Fri, 05 Sep 2025 12:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVH0-0001rS-7O; Fri, 05 Sep 2025 12:10:34 +0000
Received: by outflank-mailman (input) for mailman id 1111865;
 Fri, 05 Sep 2025 12:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuVGz-0001iM-F2
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:10:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515ca69b-8a51-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 14:10:31 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61cebce2f78so1814739a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 05:10:31 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047a90387esm449572366b.0.2025.09.05.05.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 05:10:29 -0700 (PDT)
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
X-Inumbo-ID: 515ca69b-8a51-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757074230; x=1757679030; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq7pBlMXUzk196SSVpwT+2Y0XyUckyvg3sSuOL3yYf4=;
        b=gOGP1qEYYq7EEtpmICf0ecrBvXetnZTvd/GFS5rcbA/UBJxSm29pHjjy6U+vvxsHcM
         va0uk6KGqpVhiLokYGrIzcTxnGtEG03Z0irBNOUvJA0oOTws+GSwvawgU07pD7nLCJFX
         TKIJnakWYQydUU9fMusGq4krcUTqeSTuVq964=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074230; x=1757679030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq7pBlMXUzk196SSVpwT+2Y0XyUckyvg3sSuOL3yYf4=;
        b=pkUtaRnxP0MOkLXWsHyJyEuTCpnlmpGmwAIotp06B9v9NJPEKd/Z1HdkeDVIyAEulc
         wEGooaFBE4t/tE3DF6oIf7fly6o6Gtxv5w1O8IC1xbUDqAoqLdXCP4JwN1gFaySdbWCT
         uY8iCb3VYx61JJ+WpyBkhdtJacGsrq7DaAYvaNSYlIrtvc97pJbkNGyyHnz4zIrL8bv/
         u3xyNO6uaVf7V28x7nKeqkRpRPPBv49s5hxfwmmHZ0QHvF5utv3VAsXG1wRSsAmytKBm
         H02ej+XqQzck1I6sIMXDyn3NYg3JUicQNc4ml/FqveRBgYpqh+HJajiPrWZ8lLLXrVDw
         A6ow==
X-Gm-Message-State: AOJu0YwkD7NeTJSoYTQgZXbLuS7YlU79QjlWFFWazUibY8pdZALhA9we
	FnDyNX9W3nRGr0sSE5/A8dV7WlAukA8u2C7+5MkJiiUH229gUk+0oNI8FkQ7aXv+29ZlmKNctji
	XS2NRxWU=
X-Gm-Gg: ASbGncu/lwtFpLQ7xXKJKu39v6tXIO31m/ggyq2NCaG1lfeN6Hs2/wjC8xGZQ69rkgB
	2EPHXrSpFsmmTTqDMUFkikPnPAH3Cu8PLujhi2sHtg07Kt5OqcByY86JAAw4M1V+P9RqbdwAU2f
	iYJGPGkcMc5HZ5ErR33tDAnfZPMJqe1ENAbP3Hdwbv0+bqsh9aK6FPmPQeQUcl4gaF8Kpey/iwM
	t5LJQvKK74Tzjb5S9OXARwl4lqLL2vhs6stdgVSijku4sor3RNC5kf3z4aRdmvMPFg/cYCxG+JN
	AYScPpMNl2zqiZpyLrQ/R9kpPJ2/737umwRY187nAglM3sfNtdOeA7+bjSU1dNqrVHEPA3TQ8t/
	XO3fzAzZbowau55eCS8yPIHDmpb6dLglxhmAnTm52XCuXu1tHROtgJoy4
X-Google-Smtp-Source: AGHT+IEYIENivCBYfWiF16ynv9kaKCpeL4Aeae5riBc6o5Trad7rO87ISKFzxQnqcX6pDfXZ65ce5Q==
X-Received: by 2002:a17:907:c14:b0:afe:fbee:88a with SMTP id a640c23a62f3a-b01f20bc537mr2355837466b.59.1757074230244;
        Fri, 05 Sep 2025 05:10:30 -0700 (PDT)
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
Subject: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode is enabled
Date: Fri,  5 Sep 2025 12:10:17 +0000
Message-ID: <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757071716.git.gerald.elder-vass@cloud.com>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
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

v4:
- Fix MISRA warning regarding SecureBoot string
v3:
- Fix build on ARM
---
 xen/common/efi/boot.c    | 24 ++++++++++++++++++++++++
 xen/common/efi/runtime.c |  1 +
 xen/include/xen/efi.h    |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e12fa1a7ec04..ccbfc401f7ba 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
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
@@ -915,6 +937,8 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
 
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


