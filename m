Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6D8B4541A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111583.1460258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKP-0008Lh-Cl; Fri, 05 Sep 2025 10:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111583.1460258; Fri, 05 Sep 2025 10:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTKP-0008JX-9T; Fri, 05 Sep 2025 10:05:57 +0000
Received: by outflank-mailman (input) for mailman id 1111583;
 Fri, 05 Sep 2025 10:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuTKN-0007UC-Ul
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:05:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8b27d3d-8a3f-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 12:05:54 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b042cc39551so350006966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 03:05:54 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046aa92242sm589136366b.59.2025.09.05.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:05:52 -0700 (PDT)
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
X-Inumbo-ID: e8b27d3d-8a3f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757066753; x=1757671553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFZPIyv8H4QpNXncD0fLMakmtwdcF6geMMtEdUBtCi0=;
        b=iqnWYmtZM9StToG99kxQA8XvqSwssKTkX0YqXbHor56a+6SalalQkwyOo3RoBJBglC
         Q8EOEU4SmAq42XLbKjbssUt31o9Q8BSmGJ3he1Nwq75rcbnp1fmm6ymaVhQs0pTJfhqF
         CA08cBRRkjsBjijk1mfS2vabRWgoAtsE1YC/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066753; x=1757671553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFZPIyv8H4QpNXncD0fLMakmtwdcF6geMMtEdUBtCi0=;
        b=qtSJhGUhRcwTIJtFmH5ncL/w09VeoaVe8LnrykoJqhTwgKx6FEMsQKf9ZECL2CJ6Bb
         ZIC62kKQfxSuKzlM0qSJVuGfT6wbRDc0n973Y5btNzYeZEMDwBDJi0EUKs5gkP3uEcHm
         qCcb9we9qNSI3OkKYx8t0PIEVYYh9XfUu2Os8OAt8MVN/JdgJJzIM9sz5MPzSL48mwcL
         Ripb/brPQfTbCGJBew/BnJCBCXHLxmWEKEte7BPC46dwPUzj8Ou/gLKbYqHIyjV36uOt
         XWAVj9C/YT9gJj7J/tMgzvXFnLr9XyFoivCT7UZXAlPBSaLxqxVeR6Px8dGLOkAjbqJG
         BI6w==
X-Gm-Message-State: AOJu0YxGHWiiC507u4kTFS8O/YyCSGR4liwj60qDtM4582oDKzeRLPsp
	NKL5o2w14onjmzRuRZWml6Gfyeni2DeyuLXCB5/NWLgelcf+9i/dK26XQEPisr7raezmh/43FUs
	13B6OjrE=
X-Gm-Gg: ASbGncuavkKWpM1PPkW1Lmuc+Q636NFmzzJoAOzkagbgGq2yFxiJ5rhRwny0kw1vYO7
	UykTxBNTehhkAUIW5AL9R4o7W5FzvFYFpzxKw1hIu5izqZwo/SseVKXtP7ouTxkG/yC5dYzk7zx
	VW3J5VcAUhhc5WA1IBBmA9EvdF8M+fVeoHJIRq6oRxGJsaP6EW6NX8C1ZXpMOPejDuqkoM4Uw9x
	BjbRD/ZYcmyvXSOOC3pgytQbSD3aMcz6HifI+vUxXiWMD6amFOh4oE0/KXJepzsLyxIm3LxulRn
	HVQuGfIJ+ov2VnwIpFIz0ki5eFu1umREBh86SlPlShjNWd5M1cj0/kgP/AvKNUCf8zNrk3wWE5S
	SNIUXFPKuHZNJpooJI8vkNS9O9N5LmCjvHbDo+JhS48I8lleeIiW3xQw4
X-Google-Smtp-Source: AGHT+IH1uJXgc+Og0UAYVQaB/CKdTRswzWM/Ns9vG0UwIwswegVos1qeIoJ7Tku7FNeKt/rXmG0zfA==
X-Received: by 2002:a17:907:720d:b0:b04:5a68:8686 with SMTP id a640c23a62f3a-b045a688d92mr1293084266b.4.1757066753266;
        Fri, 05 Sep 2025 03:05:53 -0700 (PDT)
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
Subject: [PATCH v3 2/2] efi: Support using Shim's LoadImage protocol
Date: Fri,  5 Sep 2025 10:05:32 +0000
Message-ID: <7f4a47d5dacf5b2db2ddd2ac72c5e0f236f9be46.1757066332.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757066332.git.gerald.elder-vass@cloud.com>
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
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

v3:
- Use Shim Image by default, fall back to Shim Lock
---
 xen/common/efi/boot.c | 59 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e7e3dffa7ddc..1f63473d264d 100644
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
+            blexit(L"Failed to verify kernel");
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


