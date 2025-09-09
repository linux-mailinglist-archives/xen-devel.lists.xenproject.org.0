Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D3B50036
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 16:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117090.1463313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvziA-0002CJ-6Y; Tue, 09 Sep 2025 14:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117090.1463313; Tue, 09 Sep 2025 14:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvziA-0002Aj-2h; Tue, 09 Sep 2025 14:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1117090;
 Tue, 09 Sep 2025 14:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wvTB=3U=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uvzi8-0001x1-Iq
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 14:52:44 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3f94728-8d8c-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 16:52:43 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61d143aa4acso9172109a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 07:52:43 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c018f663asm1414898a12.43.2025.09.09.07.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:52:42 -0700 (PDT)
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
X-Inumbo-ID: a3f94728-8d8c-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757429563; x=1758034363; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/zX6oZGR3iPEmqzxrgqeby+Y3izMNsOvFj5VzGCrp4=;
        b=C0cD0DRw+lSGrx/Q1ev/NPSh9PXRdyH5B365otD3VZMtqHRSrIq2TcRMX0Sxw6wDMa
         BTx54PkYToRFXxYf4DytWt6y4u1Z8k8M2H2D8xAAsFRMLbVGB6RKw9dAvztn0c0rT6WI
         Z4wrABGcTnn6RtRnYoZJv5DdrJVOq5vB8o/j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429563; x=1758034363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/zX6oZGR3iPEmqzxrgqeby+Y3izMNsOvFj5VzGCrp4=;
        b=cCirkcZJP0F79prGXpUA0ORjP4JGj6ZfEQswr2otFanVie4cFGxmsCXqmGtFdmTtpN
         gEX7s4fjeHsIC9l/IAyUvEEjLYg5GXaEL+YK/utiDN7Jwg3zNc9Xrfoa7zzEyN51L9Qm
         pqep0w4vItzQoaYN6BeI7wv0yhBQWKGaknrFWPBGPMVIbeDpcANwkNeevcOHMx2wGLQS
         fnxCv5MQpxmYFBX6qk6qrblG+zuFFTn/Y66Je7VESYhlgNSb2G+jJOauudyNuT4kXycS
         ClmXbAtHE16EuOZ8wuUwIrqmU39o7V2znmsn3k5axePCKYDDj1mJXUfTxqqNXDQJQC6f
         NW/Q==
X-Gm-Message-State: AOJu0Ywk9ymeMftQ6WPnq/wbwJawlfHn3iS+At6L8xyxoPbyCW83c3K7
	OshcHFbHe6s0AfGA8GYBd+9eKZyAjUVC+R4rMQtOywL2x/rX7TumrloaLRsYqHAV+NbRGToX/Tn
	2uCZmYXE=
X-Gm-Gg: ASbGncse9uZasfLCZ/aiKisLFNiRFliK+MnlH5NrT5NPdbHjov7NbU12an8jcyibolI
	3RdqR7fMs8RqBAkszZGCgAKpTqZLVpMwTWTRxCq/+iO54BWdwbt3JBz4k1ZE5C+yQ20wvs/0ciI
	mM3tI3pT8ecemBELHttw9dCqctgSx8FPa1DEmpus0uYUajR+Z0BQQaeNeydKpkJzLshQQ9rq3XE
	CIJVVv7hz+2hXTvENpkD9XgPMTb0lJph9781LP99E02wlpXcn+T/yc5r0knhG4pxd7w3/tb5TEA
	DzkLgv+MhimH503wrmN21oCJWJtj7aFffgCAM6G5qemHPpSBsMomFKT+vfwztWprO0BFkBMBLl0
	DINkHoIGiGk/4y2Y5WfFAlcEnQC3K/yYrSVMUcZ769ddkwA==
X-Google-Smtp-Source: AGHT+IE0TeY5ImlbPGw6G6DSZO46aVvnvk3NMNB5XQANqprPUgE4HQU1QcU3a8pNUeO2PSFuIwlBXA==
X-Received: by 2002:a05:6402:3814:b0:620:1030:138d with SMTP id 4fb4d7f45d1cf-6237edb1ca2mr10899206a12.22.1757429562713;
        Tue, 09 Sep 2025 07:52:42 -0700 (PDT)
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
Subject: [PATCH v5 2/2] efi: Support using Shim's LoadImage protocol
Date: Tue,  9 Sep 2025 14:52:33 +0000
Message-ID: <c28c49929fc0bdf3ee45dff151a7f1b7f4f178f9.1757421999.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757421999.git.gerald.elder-vass@cloud.com>
References: <cover.1757421999.git.gerald.elder-vass@cloud.com>
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

v5:
- Expand comment to add more clarity on need for unloading the image
- Check for EFI_SUCCESS from Verify to account for possible warnings,
  this matches the original behaviour
v4:
- Updated error message when failing due to lack of verification
v3:
- Use Shim Image by default, fall back to Shim Lock
---
 xen/common/efi/boot.c | 62 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5eb0394e2937..76cccb03aa42 100644
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
@@ -1048,6 +1057,49 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
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
+        /* Always unload the image. We only wanted LoadImage to perform
+         * verification, in the case of a failure there may still be cleanup
+         * needing to be performed.
+         */
+        shim_loader->UnloadImage(loaded_kernel);
+    }
+
+    /* else fall back to Shim Lock */
+    if ( !verified &&
+         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                                           (void **)&shim_lock)) &&
+         shim_lock->Verify(kernel.ptr, kernel.size) == EFI_SUCCESS )
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
@@ -1335,13 +1387,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
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
@@ -1592,12 +1642,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
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


