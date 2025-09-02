Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E7B40754
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106690.1457319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSFn-0001bX-FU; Tue, 02 Sep 2025 14:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106690.1457319; Tue, 02 Sep 2025 14:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSFn-0001Za-CX; Tue, 02 Sep 2025 14:44:59 +0000
Received: by outflank-mailman (input) for mailman id 1106690;
 Tue, 02 Sep 2025 14:44:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6uY=3N=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1utSFl-0001ZU-Ed
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:44:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63dbd3a6-880b-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 16:44:55 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso1054524266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 07:44:55 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff15fccad1sm942353066b.108.2025.09.02.07.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:44:53 -0700 (PDT)
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
X-Inumbo-ID: 63dbd3a6-880b-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756824294; x=1757429094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f48bQFr2pwLrvr7pu6JK/rPhwtQpUL/wKoNYgBPv14Q=;
        b=c4kVIBZAJgFZpi2uHth1IJGrkbAR1aXZc0Sn05Eb5kYTqUMT3hoK8nm2rSxmAQPtl8
         dH6XR8VwGY1yoo30UsdxacfMO8S3Aai+iT0OGc+Qsa8/cEPgG30cAkuMNzukZixuegCP
         5p/fsZ2X4h9+U9sjte2Ln15OQ+MfqRxq9R6nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824294; x=1757429094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f48bQFr2pwLrvr7pu6JK/rPhwtQpUL/wKoNYgBPv14Q=;
        b=U04JwGEMcyMpRbTkMz7Etc3m+Ta1QwxtmXyC6oLvzF7T+eSU2YkZrhrvkCd56JM0/j
         nJ2PxQukw0eAP6yuuIvnpA+WxDaJjWnhu2YjqFVwBN2YcflFnrmvaiSP/puvA7YHvb8L
         pjjDBJ+WqdugIrnC3IqjQls368E9ntIVEy3pzGIjWHWH2yn94DGg7sfrrPrYenH6BeBT
         hTgTayjQ4wxgtoIkRx9obvMrRFWf0keVMOOMOF90RnlFqIqNvn8TDtE+46OaGlCD8vY3
         tdLZd+7hX7H8Txjza8UPpeXXca4k8cwERSyroqtTlAQCeqn6OXypxPOOxWoixnpKaoe+
         oZ+A==
X-Gm-Message-State: AOJu0Yy0G2W1CPVCCAu23zUbnjmgZynTzdDjzN8RFbRxRx+M7G+2eCTB
	6EP+RFB27g3EF9LY9l+NLXNcdI0tjLI2JNtOD8B5ru5Yc1wMJoo2LTyEQRr0v+QeETLb6cnv4iQ
	AFgJW6U4=
X-Gm-Gg: ASbGncseKSHihhY3jf9uzNGSafv3ifmPiCNkGjq9k/nKJcQDHSpn4AfinYu6NuVzlRo
	GJxWYVcaMX89Eqn4rvkf37R54Z2jNM/N+xo36g3bARHKvaL2kCJvDzcEKIM8aLGn7WkwWmm8rCD
	pq7pIG6WzvzGmgS0r2OZ5YJClcnrpUtDzPsOpwhRWsW2wfBhlRSzvyX2r2CQ/n1b3WMETeHrjzt
	EYX8Wbjx+J0WZ0Ikb56+aQtqgIi+p2CjA0Q8OBRCTHwUYUa51vm5KuL6LHCZXs7q9euPjgE9lWp
	JkJIhpihTwjqUdbxlnhuNj6E83IsKBQXA9uP+rZmfMpnIPKFgX0d1qB/Py5DD4N3ZQmaYH/c25/
	xChM6oJG86lFvdCuZqn393AB+8yIIr32KBSfhY4fW6IYnuXwjeIVFrXsF
X-Google-Smtp-Source: AGHT+IHjbWXHk9e+wapZHxoKH2FCnMDaeWlQIBl/ucIqvv5oPZW/Wr8d4x3VmEbuZcPcZuSyJq4uRQ==
X-Received: by 2002:a17:906:6a02:b0:af9:2e26:4636 with SMTP id a640c23a62f3a-b01d971924bmr1109674166b.32.1756824294174;
        Tue, 02 Sep 2025 07:44:54 -0700 (PDT)
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
Subject: [XEN PATCH v2] efi: Use Shim's LoadImage to verify the Dom0 kernel
Date: Tue,  2 Sep 2025 14:44:45 +0000
Message-ID: <7f2f88f0d857ed3f8d7e3fabe349a3b5d5815981.1756822290.git.gerald.elder-vass@cloud.com>
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
Changes since v1:
- Re-instated SHIM_LOCK_PROTOCOL as a fallback option if IMAGE_LOADER is
  not found
- Fixed indentation and error messages
---
 xen/common/efi/boot.c | 43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 453b1ba099cd..273da3d9e3e3 100644
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
@@ -1336,10 +1345,12 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
+    EFI_HANDLE loaded_kernel;
     unsigned int i;
     CHAR16 *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
+    SHIM_IMAGE_LOADER *shim_loader;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
@@ -1590,12 +1601,32 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
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
+    {
+
+        if ( !EFI_ERROR(efi_bs->LocateProtocol(&((EFI_GUID) SHIM_IMAGE_LOADER_GUID),
+                                               NULL, (void **)&shim_loader)) )
+        {
+            status = shim_loader->LoadImage(false, ImageHandle, NULL, (void *)kernel.ptr, kernel.size, &loaded_kernel);
+            if ( EFI_ERROR(status) )
+                PrintErrMesg(L"LoadImage failed", status);
+
+            // LoadImage performs verification, now unload it to clean up
+            status = shim_loader->UnloadImage(loaded_kernel);
+            if ( EFI_ERROR(status) )
+                PrintErrMesg(L"UnloadImage failed", status);
+        }
+        else
+        {
+            status = efi_bs->LocateProtocol(&shim_lock_guid, NULL, (void **)&shim_lock);
+            if ( EFI_ERROR(status) )
+                PrintErrMesg(L"Failed to locate SHIM_LOCK protocol", status);
+
+            status = shim_lock->Verify(kernel.ptr, kernel.size);
+            if ( EFI_ERROR(status) )
+                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
+        }
+    }
 
     efi_arch_edd();
 
-- 
2.47.3


