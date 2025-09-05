Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4845B45754
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111864.1460428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVGz-0001nq-Sf; Fri, 05 Sep 2025 12:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111864.1460428; Fri, 05 Sep 2025 12:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVGz-0001lj-OP; Fri, 05 Sep 2025 12:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1111864;
 Fri, 05 Sep 2025 12:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuVGy-0001XF-7x
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:10:32 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c69798-8a51-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 14:10:31 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-62105d21297so1814811a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 05:10:31 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047a90387esm449572366b.0.2025.09.05.05.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 05:10:30 -0700 (PDT)
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
X-Inumbo-ID: 51c69798-8a51-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757074231; x=1757679031; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCVJ1KtX77UItly9lfbYD00bh6qlTFzOOOkAnWGmFuk=;
        b=kQ6h/I8+vbMBtzZB/GJRvYnwAAmD1ZvA+FXC6mV0TuVwn64rpuERoMDY1fHLgp2fVQ
         GaTq5OkWyM5kLlBhM+3bKVoJJmvOPQwm3rH+YI5fyynky2kQ70cAwQh91Be/o82MLOK5
         fhSRP2lazWo/NKveWOwVodns9+nwu/B8JUh2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074231; x=1757679031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCVJ1KtX77UItly9lfbYD00bh6qlTFzOOOkAnWGmFuk=;
        b=fU18seaKzkl6QZupvyjvweowa3H4fOqkk/dIefiNDHaM4wsG4F0o78fYF06hrAKUXc
         JsAuGrm1JNA7CHNZihlJzH9KdE+U0dvjgDJGSlwvsXwxlsAbaTW7Np+KU9Pc9glsKbt0
         CNWfzyJM1I9zAa+7tgxyxqJk4J5Z6Uxrpee8blx73xTHF6EEJg1vNnp2GRI/rOTmrMui
         cGs0IA/XNmFVqj7YMZIXpA6lIqWdKShhPFoONz41tch/2vS2ZA/EMAZqkVGSh6oFnSpD
         2ZR0aLL4SdQ/4wGawMpMxGL0Bl9BP4JiXZ2aEfjQmcuSJgXKNOWrh0RGNGKhW4oeMYWe
         TcVw==
X-Gm-Message-State: AOJu0Yy9Hq2v1hy4SGAw8X9mstI4czIxPfTKEAvf4FThqS+wAbPsaxpK
	tYzAZBlnwoTstFsvkj9ay94bexHi1ocB96rYHD5yPm06TiwiXAMi2Ig2ZXQhBXEBb349oM6RcOf
	Si+mwP0M=
X-Gm-Gg: ASbGncsDTVPq1OU6XF1caC+laCI5XZ81JRqSosfbFSe4386TeCvXBellZCFS7lYqOMQ
	2bv+JqOCuPGHL2CDNyZcCCZvA17r0GDlNNruAe3nvoow8cW2/QP8FWQZzMFsInG0JW5okhTI798
	/TlFjfES7ZZPdfBqHYSlTbnC8Rh2aX9Ou3TR3JglKIyU8KZZy1Xo9Cw10IxrA0PbDcnzaoURFpb
	P0mQDNky4p9jhuZwmEd0MGi/NghBFmO2vQMjtNWILPkjb0cLW0pSqwj2MqFw4A2l1hB0qDJCzFY
	li9mUNelOprVEH45C9W1h/lDUTvX156idFZR6kIEMVyJTtcJ9n6izzXeLMkGA6M1Vb1F9hbCK1h
	Ej/vXSp8bMpKyFoVHDazUVpcxG7pf0dUnTiy4I41ReIToBEIxz+LGER4c
X-Google-Smtp-Source: AGHT+IENBxJABnMmW4ISKgXr8W7vnZ5lpxYqmjnJ5E8PfEVXu/fSQwGXbfJLQi+hkIeQwACG+sp88g==
X-Received: by 2002:a17:906:fa1b:b0:b02:8bf2:3fa0 with SMTP id a640c23a62f3a-b028bf241e3mr1904808066b.58.1757074230974;
        Fri, 05 Sep 2025 05:10:30 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/2] efi: Support using Shim's LoadImage protocol
Date: Fri,  5 Sep 2025 12:10:18 +0000
Message-ID: <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757071716.git.gerald.elder-vass@cloud.com>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing Verify functionality of the Shim lock protocol is
deprecated and will be removed, the alternative it to use the LoadImage
interface to perform the verification.

When the loading is successful we won't be using the newly loaded image
(as of yet) so we must then immediately unload the image to clean up.

If the LoadImage protocol isn't available then fall back to the Shim
Lock (Verify) interface.

Log when the kernel is not verified and fail if this occurs
when secure boot mode is enabled.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
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
- Updated error message when failing due to lack of verification

v3:
- Use Shim Image by default, fall back to Shim Lock
---
 xen/common/efi/boot.c | 59 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index ccbfc401f7ba..0a72c293301d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -38,6 +38,8 @@
   { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
 #define SHIM_LOCK_PROTOCOL_GUID \
   { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
+#define SHIM_IMAGE_LOADER_GUID \
+  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a, 0x55, 0xab} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
   { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
 #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
@@ -70,6 +72,13 @@ typedef struct {
     EFI_SHIM_LOCK_VERIFY Verify;
 } EFI_SHIM_LOCK_PROTOCOL;
 
+typedef struct _SHIM_IMAGE_LOADER {
+    EFI_IMAGE_LOAD LoadImage;
+    EFI_IMAGE_START StartImage;
+    EFI_EXIT Exit;
+    EFI_IMAGE_UNLOAD UnloadImage;
+} SHIM_IMAGE_LOADER;
+
 struct _EFI_APPLE_PROPERTIES;
 
 typedef EFI_STATUS
@@ -1047,6 +1056,46 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     return gop_mode;
 }
 
+static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
+{
+    static EFI_GUID __initdata shim_image_guid = SHIM_IMAGE_LOADER_GUID;
+    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
+    SHIM_IMAGE_LOADER *shim_loader;
+    EFI_HANDLE loaded_kernel;
+    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
+    EFI_STATUS status;
+    bool verified = false;
+
+    /* Look for LoadImage first */
+    if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_image_guid, NULL,
+                                           (void **)&shim_loader)) )
+    {
+        status = shim_loader->LoadImage(false, ImageHandle, NULL,
+                                        (void *)kernel.ptr, kernel.size,
+                                        &loaded_kernel);
+        if ( !EFI_ERROR(status) )
+            verified = true;
+
+        /* LoadImage performed verification, now clean up with UnloadImage */
+        shim_loader->UnloadImage(loaded_kernel);
+    }
+
+    /* else fall back to Shim Lock */
+    if ( !verified &&
+         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                                           (void **)&shim_lock)) &&
+         !EFI_ERROR(shim_lock->Verify(kernel.ptr, kernel.size)) )
+        verified = true;
+
+    if ( !verified )
+    {
+        PrintStr(L"Kernel was not verified\n");
+
+        if ( efi_secure_boot )
+            blexit(L"Refusing to boot unverified kernel with UEFI SecureBoot enabled");
+    }
+}
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -1334,13 +1383,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                                       EFI_SYSTEM_TABLE *SystemTable)
 {
     static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
-    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
     unsigned int i;
     CHAR16 *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
-    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
@@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
      * device tree through the efi_check_dt_boot function, in this stage
      * verify it.
      */
-    if ( kernel.ptr &&
-         !kernel_verified &&
-         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                                           (void **)&shim_lock)) &&
-         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
-        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+    if ( kernel.ptr && !kernel_verified )
+        efi_verify_kernel(ImageHandle);
 
     efi_arch_edd();
 
-- 
2.47.3


