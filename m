Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A8B3EAB0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105087.1456061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6Xl-00055L-79; Mon, 01 Sep 2025 15:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105087.1456061; Mon, 01 Sep 2025 15:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6Xl-00052p-4G; Mon, 01 Sep 2025 15:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1105087;
 Mon, 01 Sep 2025 15:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5E6=3M=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1ut6Xj-0004tM-0C
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:34:03 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1592f918-8749-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 17:34:01 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f7f15so4776103a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:34:01 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4ea764sm7373058a12.40.2025.09.01.08.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 08:33:59 -0700 (PDT)
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
X-Inumbo-ID: 1592f918-8749-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756740841; x=1757345641; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SkV/EWqlMjB6eYN3RFARVl3XHpdsHdYCpFF8G2sSD/0=;
        b=acc4fHSSwLAsa+jVN1aLA23kRi0DEkPXR3KmuIKaKddsu5McO7TsqtWz/irxuDlMgU
         RcieCTXgnC6HEbk32VExSyRGRb0ogJbt4Lleyd2Yp6AzRQOQXRKlFvfqsB8YCU5r4uH9
         6jEKXYlcKmZaZugJ35+1cn6pFx73RdsHWgCAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740841; x=1757345641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkV/EWqlMjB6eYN3RFARVl3XHpdsHdYCpFF8G2sSD/0=;
        b=sAZ9zBzEK73/MroO//gxVi+rEqaVuJqW6wy8jTv9H+VlGtTugP7uFIpaa3re2HNXfc
         hUQoG4d4TLl0c9kaVzYEVleHkJ/ryIV6bHnfIrFS2YkyCOVLPexyK39rrmU14X3zZOeQ
         RK5ZrFMYUSaJBv2FvD5PNlwHfriLTIyqRzyNbILClwHMhgm3irXhRKXFTTy3BlXKfEFl
         +6obmqJcwjRNspSVn1QBFlQhGmXaPo3QFgoWEvQClTl4Kcb/gL0ll5law24waqhW7+br
         kJpF4ibWAsyAjbHTUWXJwfsChuI71yMXVb5dj1gZ48dDA9MBgVQU00CaXl5IYCBCMwV3
         iyPg==
X-Gm-Message-State: AOJu0YzesiXAzZT8zk9wBiv0dp9+GzzcwQVeNThRVsSPpvuzOin7MFRl
	oO0XH3lSr09IP8xhlBPQgb40VFwt3jTqW1rWVbByGzdpcYHYD2PD3xJDNbFrufzt9LSySdjT1Oq
	Scgjblpg=
X-Gm-Gg: ASbGncsvqg+8eEoWgYJLzgrDF9FPQPF9W2++MMrXUOLK6O3dobZiot6I52Uf/pePyQt
	TvNWNc4G5a4iMlZ6tFm9lcY8+fUqUMgicWi8RcZYkMPXDdgrg9tdSCewvxohQ6W+rFC0cxM+YLl
	YHjIw++AZSKgocwZI3rmEt7mZwj1yvhJnflv9CFVcqh1GletqXBdneOQgTsllGn+vGlpwKUBLoC
	NrRDdbEsrdlydDQUFBZQQosiJuZd2W0WL54qhUBkt/CsiVy2d8Nz/bDXuAUts+imPzPgS46Ud2P
	gqyPXvN1V7beiNS4hCCDeb3gRbQZXX0SVYOK4ZNjeKnECewcuezs/3bwze0IaAuQOB61GAMhTcn
	4TQRDEvIg+t+RLvd5wiGKjoFZkEGKIuCABjQAqFbq9OojgQ==
X-Google-Smtp-Source: AGHT+IGNxLLbzDRvItyf0MI5zZUTSid+3QYnAt+zpw2eo9IzjWrJ0+/nueqa7YlRfyvr0BRQ9H2p8w==
X-Received: by 2002:a05:6402:44d4:b0:61a:8e5c:f4ef with SMTP id 4fb4d7f45d1cf-61d26c33dd5mr6712403a12.18.1756740840603;
        Mon, 01 Sep 2025 08:34:00 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH] efi: Use Shim's LoadImage to verify the Dom0 kernel
Date: Mon,  1 Sep 2025 15:33:54 +0000
Message-ID: <766be642204043b779cef688ec0ca2f1d64313ad.1756740104.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing Verify functionality of the Shim lock protocol is
deprecated and will be removed, instead we must use the LoadImage
interface to perform the verification.

When the loading is successful we won't be using the newly loaded image
(as of yet) so we must then immediately unload the image to clean up.

Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
---
 xen/common/efi/boot.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 453b1ba099cd..67e7220d8fa3 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -36,8 +36,8 @@
 
 #define SMBIOS3_TABLE_GUID \
   { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
-#define SHIM_LOCK_PROTOCOL_GUID \
-  { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
+#define SHIM_IMAGE_LOADER_GUID \
+  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a, 0x55, 0xab} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
   { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
 #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
@@ -66,9 +66,12 @@ typedef EFI_STATUS
     IN const VOID *Buffer,
     IN UINT32 Size);
 
-typedef struct {
-    EFI_SHIM_LOCK_VERIFY Verify;
-} EFI_SHIM_LOCK_PROTOCOL;
+typedef struct _SHIM_IMAGE_LOADER {
+    EFI_IMAGE_LOAD LoadImage;
+    EFI_IMAGE_START StartImage;
+    EFI_EXIT Exit;
+    EFI_IMAGE_UNLOAD UnloadImage;
+} SHIM_IMAGE_LOADER;
 
 struct _EFI_APPLE_PROPERTIES;
 
@@ -1333,13 +1336,13 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                                       EFI_SYSTEM_TABLE *SystemTable)
 {
     static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
-    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
+    EFI_HANDLE loaded_kernel;
     unsigned int i;
     CHAR16 *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
-    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
+    SHIM_IMAGE_LOADER *shim_loader;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
@@ -1590,12 +1593,24 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
      * device tree through the efi_check_dt_boot function, in this stage
      * verify it.
      */
-    if ( kernel.ptr &&
-         !kernel_verified &&
-         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                                           (void **)&shim_lock)) &&
-         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
+    if ( kernel.ptr && !kernel_verified )
+    {
         PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+    status = efi_bs->LocateProtocol(&((EFI_GUID) SHIM_IMAGE_LOADER_GUID),
+                                     NULL, (void **)&shim_loader);
+    if ( EFI_ERROR(status) )
+        PrintErrMesg(L"Error LocateProtocol IMAGE_LOADER", status);
+
+    if ( kernel.ptr ) {
+        status = shim_loader->LoadImage(false, ImageHandle, NULL, (void *)kernel.ptr, kernel.size, &loaded_kernel);
+        if ( EFI_ERROR(status) )
+            PrintErrMesg(L"LoadImage failed", status);
+
+        // LoadImage performs verification, now unload it to clean up
+        status = shim_loader->UnloadImage(loaded_kernel);
+        if ( EFI_ERROR(status) )
+            PrintErrMesg(L"UnloadImage failed", status);
+    }
 
     efi_arch_edd();
 
-- 
2.47.3


