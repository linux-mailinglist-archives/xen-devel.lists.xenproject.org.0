Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340DAE78A5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024419.1400320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeM-0007od-B4; Wed, 25 Jun 2025 07:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024419.1400320; Wed, 25 Jun 2025 07:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeM-0007me-7a; Wed, 25 Jun 2025 07:34:30 +0000
Received: by outflank-mailman (input) for mailman id 1024419;
 Wed, 25 Jun 2025 07:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=edXa=ZI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUKeK-00071t-KT
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:34:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0624c6c-5196-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 09:34:23 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450dd065828so10443125e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 00:34:23 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c05csm11319445e9.5.2025.06.25.00.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 00:34:21 -0700 (PDT)
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
X-Inumbo-ID: d0624c6c-5196-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750836862; x=1751441662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGXZEs8C2ojkzsUWVpaRntklr8ldtVYfN6U4O6Kve+s=;
        b=NujdmlbWXGT++dZ/DIwDuw/4o6wtiyhzGbnZuthRPySmisCFKAmiJOFhf3VlF31bG+
         /wCxQJvpyiRR9E+dBkQv/UQAvPxY6NTLe6h6RDVG39MosHDQrEdCd4yJDlUyN647HLwv
         If1agaNS0HnnDfATlJhmV2K7CtzUwEjoOIH60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836862; x=1751441662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGXZEs8C2ojkzsUWVpaRntklr8ldtVYfN6U4O6Kve+s=;
        b=HEUs9ua9b3vykecorZ1cd9UgcVCczubLw5SKTPKQPiXjcL8pWHzV5EpNRl5mOYe9Qt
         GIfztuwZdLSkVDkGWTAeI7oI5/CMygSgIfQbYqvXV8/qu23KhqWxMYCz+HupF/uIYxwh
         Dv3t8/XJLV6C0VllTW35bcNt/P52v6oHRxKvEIpabN9/dwf367nVco+gfFZdYrS4TmvH
         XwVtjQOHt0vFlET4w/QZKVcyViGw6y0gBr65Iol3KatKcrNU96WaROfgvJCQpKaGsWRk
         WEf7KRSjBJ6qSWVy9R7JJlsG+QsjgICZwrwFE2ULjuQcFZg9jeCM0TftugyDLYPIxArP
         RghA==
X-Gm-Message-State: AOJu0YzT1mjByR2OOdSEYTifNHzFRq8a3FeqMgjPFC2aILfe3u/5M2pI
	D8S9WDtezSSpUcFZoSPJ4GPsA+sFSVkld1cVcbmnBEEi/qsA76fiSi6mse+oZQyxovNNvUudIwG
	L3YIcLvCsBg==
X-Gm-Gg: ASbGnctPdk4WRGahYUZtUG7uC5RBmjryOG2e6VrsW2i6EYetgATGfe6gfg/Ws8K+r25
	8iuFmsxqnYLqMg+bQeW1Yz3zhrhnau2LQi3yznlD7WceQzTMZmhLhh4UHajC1NG1mffyOz3ITPV
	2CT31SPtrWmFR+cSoSZ3+TJ+0m6B0zaTV0Yx7RFfzkszR89Bac7oM0diodVF4xZwtOPPkUmhBUo
	wGNBtcoVH79+Ph604QF7Yn9rRs6yWH6XSxbIouGXLRJbCsYugeGRvUaxCNSHNkfomOuuWIsrPFn
	An5ukSbSpQa4RcmXQCxBf6QAxMq7ptpHxw0ePJiaPoVJGOkz7KiM8kqwJsXVXxqoVjkK2hzT/TW
	C8cg0j9CZL2jlD+vIwq+yeptYEe39PA==
X-Google-Smtp-Source: AGHT+IGgmbl/LRwOIK7iBZHPOQtU4N7XqXv2rwd65foSNPt8UucyHihR3kQtschc7xRYK0lxcl8AOQ==
X-Received: by 2002:a05:600c:a48:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-45381af6b04mr13712695e9.20.1750836862370;
        Wed, 25 Jun 2025 00:34:22 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 2/3] xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
Date: Wed, 25 Jun 2025 08:34:04 +0100
Message-ID: <20250625073408.7496-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625073408.7496-1-frediano.ziglio@cloud.com>
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows to load Xen using "linux" and "initrd" GRUB2 commands.
This can be used with UKI to separate initrd in a different module
instead of bundling all together.
Bundling all together can be a problem with Secure Boot where
we need to sign the bundle making harder to change it.
As initrd content does not need to be signed for Secure Boot
bundling it force it to be signed too.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- attempt to use LoadFile2 protocol after embedded section.
---
 xen/common/efi/boot.c     | 71 ++++++++++++++++++++++++++++++++++++++-
 xen/include/efi/efidevp.h | 21 ++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b18af2f1f4..b6ce3a0257 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -850,6 +850,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     return true;
 }
 
+#pragma pack(1)
+typedef struct {
+    VENDOR_DEVICE_PATH              VenMediaNode;
+    EFI_DEVICE_PATH                 EndNode;
+} SINGLE_NODE_VENDOR_MEDIA_DEVPATH;
+#pragma pack()
+
+static bool __init initrd_load_file2(const CHAR16 *name, struct file *file)
+{
+    static const SINGLE_NODE_VENDOR_MEDIA_DEVPATH __initconst initrd_dev_path = {
+        {
+            {
+                MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP, { sizeof (VENDOR_DEVICE_PATH) }
+            },
+            LINUX_EFI_INITRD_MEDIA_GUID
+        },
+        {
+            END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
+            { sizeof (EFI_DEVICE_PATH) }
+        }
+    };
+    static EFI_GUID __initdata lf2_proto_guid = EFI_LOAD_FILE2_PROTOCOL_GUID;
+    EFI_DEVICE_PATH *dp;
+    EFI_LOAD_FILE2_PROTOCOL *lf2;
+    EFI_HANDLE handle;
+    EFI_STATUS ret;
+    UINTN size;
+
+    dp = (EFI_DEVICE_PATH *)&initrd_dev_path;
+    ret = efi_bs->LocateDevicePath(&lf2_proto_guid, &dp, &handle);
+    if ( EFI_ERROR(ret) )
+    {
+        if ( ret == EFI_NOT_FOUND)
+            return false;
+        PrintErrMesg(L"Error getting file with LoadFile2 interface", ret);
+    }
+
+    ret = efi_bs->HandleProtocol(handle, &lf2_proto_guid, (void **)&lf2);
+    if ( EFI_ERROR(ret) )
+        PrintErrMesg(L"LoadFile2 file does not provide correct protocol", ret);
+
+    size = 0;
+    ret = lf2->LoadFile(lf2, dp, false, &size, NULL);
+    if ( ret != EFI_BUFFER_TOO_SMALL )
+        PrintErrMesg(L"Loading failed", ret);
+
+    file->addr = min(1UL << (32 + PAGE_SHIFT),
+                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
+    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
+                                PFN_UP(size), &file->addr);
+    if ( EFI_ERROR(ret) )
+        PrintErrMesg(L"Allocation failed", ret);
+
+    file->need_to_free = true;
+    file->size = size;
+
+    ret = lf2->LoadFile(lf2, dp, false, &size, file->str);
+    if ( EFI_ERROR(ret) )
+    {
+        efi_bs->FreePages(file->addr, PFN_UP(size));
+        PrintErrMesg(L"Loading failed", ret);
+    }
+
+    efi_arch_handle_module(file, name, NULL);
+
+    return true;
+}
+
 static bool __init read_section(const EFI_LOADED_IMAGE *image,
                                 const CHAR16 *name, struct file *file,
                                 const char *options)
@@ -1493,7 +1561,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             kernel_verified = true;
         }
 
-        if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
+        if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) &&
+             !initrd_load_file2(L"ramdisk", &ramdisk) )
         {
             name.s = get_value(&cfg, section.s, "ramdisk");
             if ( name.s )
diff --git a/xen/include/efi/efidevp.h b/xen/include/efi/efidevp.h
index beb5785a45..b240c15d2a 100644
--- a/xen/include/efi/efidevp.h
+++ b/xen/include/efi/efidevp.h
@@ -398,5 +398,26 @@ typedef union {
 
 } EFI_DEV_PATH_PTR;
 
+#define EFI_LOAD_FILE2_PROTOCOL_GUID \
+    { 0x4006c0c1, 0xfcb3, 0x403e, {0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d } }
+
+typedef struct EFI_LOAD_FILE2_PROTOCOL EFI_LOAD_FILE2_PROTOCOL;
+
+typedef
+EFI_STATUS
+(EFIAPI *EFI_LOAD_FILE2)(
+    IN EFI_LOAD_FILE2_PROTOCOL      *This,
+    IN EFI_DEVICE_PATH              *FilePath,
+    IN BOOLEAN                      BootPolicy,
+    IN OUT UINTN                    *BufferSize,
+    IN VOID                         *Buffer OPTIONAL
+    );
+
+struct EFI_LOAD_FILE2_PROTOCOL {
+    EFI_LOAD_FILE2                  LoadFile;
+};
+
+#define LINUX_EFI_INITRD_MEDIA_GUID \
+    { 0x5568e427, 0x68fc, 0x4f3d, {0xac, 0x74, 0xca, 0x55, 0x52, 0x31, 0xcc, 0x68} }
 
 #endif
-- 
2.43.0


