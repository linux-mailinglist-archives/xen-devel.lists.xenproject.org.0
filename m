Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D553B45417
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111582.1460248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKO-000857-22; Fri, 05 Sep 2025 10:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111582.1460248; Fri, 05 Sep 2025 10:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKN-00082g-SS; Fri, 05 Sep 2025 10:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1111582;
 Fri, 05 Sep 2025 10:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuTKL-0007UD-SO
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:05:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e815086c-8a3f-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 12:05:53 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afeec747e60so354193166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 03:05:53 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046aa92242sm589136366b.59.2025.09.05.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:05:51 -0700 (PDT)
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
X-Inumbo-ID: e815086c-8a3f-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757066752; x=1757671552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvL7dCg6gz41KLkkd+Vk+H26Dav9pYh+JfZNG4PSTr0=;
        b=gUycLGnAA+6cGM73AS2MVGb5JJXjiPq4uJRmbFMCavHi0AXqUB9TONaPSNlGdpQ5Xk
         Yc4hwhUZ0EqZ/5qnjQ23truSthRd0qOPcKAn2vIa2/aFpD2f7yvtJfHn5ezmIdfYY6Yg
         GstCt+EKyC7XoLnC8G+tmJOoh3f03eIoA4tFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066752; x=1757671552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvL7dCg6gz41KLkkd+Vk+H26Dav9pYh+JfZNG4PSTr0=;
        b=vlzqIXliilw+94z3olcKROrGlSGA/ziSm2uuoGT995O4EhSoJshreZYgs4c/Gp0nIF
         d1HcZhrqHLvk86PT1o2URzOgR5hTV3YC0ner2sBWeXo1FMQV87kqem98P99SLHjHuciF
         29EBAxOMoQ34Gm3pYIVUM/ybdE+rheIJwFaFCheCNTpqGIQo7VMrsqAQs5MF0Ai3lyzJ
         uf5dHSfW9sokNKKji5xkY4ZajRPohiW67mgF7DxbLy9FeRVo+S/ZE6H0xYELaSC5PyeF
         Q5Fsdq2zhdQYRgq7Iyw14lLdeyfABWJTrtATXlbAdS3//21qckpuYKXPWVG6FYC6Af2k
         uofQ==
X-Gm-Message-State: AOJu0Yx7Vvu9xMoSSrx4IVTeh/r9iwb4W1mL1uZNeZfh+/aLvQw8rBB+
	S0Tu47EgB9e13wE1j7+9Z6jagbT1Lfuypp5tsAWA7p4YsJIa8V9c39rGxWBR7J/e5A9kJUXa08l
	NYFRc33g=
X-Gm-Gg: ASbGncvZ0fFxXK8J0KwUBAqRt6/s8cmOzPb5zsV94tkGj1riosx+bLiPkYABsJzPU6G
	7Noyo9nB46L2/F+kIddhOBWPmy7zbKw893BaX6jMc9+/gKBiViBeLbu2BBbmdcp7Fk6MCKu6AD/
	4+mGsbQvv7iOXO3S+iRcBXA/ICgoITUDT3T+zo9AnIyeeIfAdKCSOFOOgtImaIck+FbKaep6LVe
	esfJcc6Qv2pX9OWAjqgeSaDUYBAm1o4pOYXE0wWNbKSe8yHR2u87DFcB8rwMFgElUgKTIrA7JgZ
	Th3qJESnnErGHpae29dlhVASgrNjuACzj8omfrXa21XY3YnGIFV7syNb1FC0GfLNMgv2+zwpJAa
	/tB6xyxMgtMq0B7hwufUtzb9szeak/0Y9PMTdKK4570/1cXYB0fykm4Xs
X-Google-Smtp-Source: AGHT+IHxVphbpBuI4g2ZTf16WcGhGFm1UvYvPW/G3/Q2xyoOu6/oo/ZQyapkcieYrWlN1utMsOAxJQ==
X-Received: by 2002:a17:907:9406:b0:b04:4aa9:eec8 with SMTP id a640c23a62f3a-b044aaa4b0cmr1412828666b.17.1757066752259;
        Fri, 05 Sep 2025 03:05:52 -0700 (PDT)
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
Subject: [PATCH v3 1/2] efi: Add a function to check if Secure Boot mode is enabled
Date: Fri,  5 Sep 2025 10:05:31 +0000
Message-ID: <12c18a6d0c3cbbe17cee19f9fb4501d614c23ec3.1757066332.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757066332.git.gerald.elder-vass@cloud.com>
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
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

v3:
- Fix build on ARM
---
 xen/common/efi/boot.c    | 24 ++++++++++++++++++++++++
 xen/common/efi/runtime.c |  1 +
 xen/include/xen/efi.h    |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e12fa1a7ec04..e7e3dffa7ddc 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *file)
                    " last line will be ignored.\r\n");
 }
 
+static void __init init_secure_boot_mode(void)
+{
+    static EFI_GUID __initdata gv_uuid = EFI_GLOBAL_VARIABLE;
+    EFI_STATUS status;
+    uint8_t data = 0;
+    UINTN size = sizeof(data);
+    UINT32 attr = 0;
+
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


