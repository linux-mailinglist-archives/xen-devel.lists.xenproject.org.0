Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34974AE5F64
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023360.1399356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4n-0002bv-T8; Tue, 24 Jun 2025 08:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023360.1399356; Tue, 24 Jun 2025 08:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4n-0002aF-PB; Tue, 24 Jun 2025 08:32:21 +0000
Received: by outflank-mailman (input) for mailman id 1023360;
 Tue, 24 Jun 2025 08:32:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTz4m-0001zK-7g
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:32:20 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdcf0d27-50d5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:32:19 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450cf214200so45586075e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:32:19 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8050f53sm1322365f8f.3.2025.06.24.01.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 01:32:12 -0700 (PDT)
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
X-Inumbo-ID: bdcf0d27-50d5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750753938; x=1751358738; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC5W+e8UqjgFWSnLG+QiiEwlV+/lFx7hnFwjokg9pes=;
        b=VYJEodOhLI2fx8v+cKLUFPDjfYre0ARWtFQeQhdXSLsSh/JjPPOcG2dHj6Kc8eTaV5
         zDLtegfxF6sRfA38+QeCECwbfdmlgRBscPNV++tX6HYws1CD3Kd/Bwne9ROjb7ZIUBkd
         /C3+fTIEbcAmnMjqV/QJ0a3lbGzktQ7qgm0nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753938; x=1751358738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC5W+e8UqjgFWSnLG+QiiEwlV+/lFx7hnFwjokg9pes=;
        b=S9MYH+o1Xm6VSXzB9oKe1ToLmuKiHG2BhZPDabP3WYrbQckQpy8aet87qwxxSAQjTE
         x9ycsw5NeWV7Y5ss8HAEFdNAJ1i5ETpCV7Cjqmdg4OJI8JRuZ4cKqKmfIhPeDEB0nCLX
         napywAioJQs1X4k1gQmWVjh00oEmokvxz2rsHYKSf0u1VIrXpeNwkePpHfmCuhe9+yC5
         0uss7kJ3KJ3lGZETK9By79rBqAiBUp3+WynMCwRIaem1KVpGlDkO66fGqsIqJcJrIDaJ
         mm5LXtYZD8vdHRd+X519fQX5BiZEXvD/zU5WzpUdCBIwGQxDeU4WcIDBUEKhPaHzdIlS
         7bTQ==
X-Gm-Message-State: AOJu0YxqwneuI0kQ0h0cymciN0nFJPePBrPnzHkZxmXrRMnfr0P6lqHA
	rdFOdoreAZiCveSWYIuSdM3p8q3urxi7DEduVmNMZGOz59DvNMMDR6j88a8Ls9QeZdmPf0uPzge
	25vF909qd8A==
X-Gm-Gg: ASbGnctDllZJ+n6w27UgHv5Fup4C38tSon0b77JFGPtgi0MyU7CeTia3b/HbFfMFU2Q
	2f4K3In9UaR5FKbp+wtdXRlIFXwVCswP5dx143ws0CrgPW+nn7mUrj0t6l2xtUZIg3kbA6CT+Md
	ygBI9RXiqVWkLMtoFpCqX2z77Q90U4g+EoQ1BnegPDhWTfCRbA5vJC95emz6ipfRG4g/0wKn/GF
	ciuHRmrQTKFrcRWwK8MflU/doSDkTbGj5nSkF032c5ET/Yem65J+9ntMdEbwlrG99O6Egu9QGcg
	IBQVVI9/DJTWO4CeuS1qzGZYOhcOrj8gZwliUndAEw7vRvUFXQqr/6oVsY1iNiJ23ZGlMvV07FU
	sdJ00uLvhkGWsl67LuQno2UuhoJlAlA==
X-Google-Smtp-Source: AGHT+IFk4NTpmq2Tu/p7bd86OBbfSY/Fxt8MVCwrrpuwLk3S2Wx9x7X9FP3OyJySibdNREPQh+Xe+g==
X-Received: by 2002:a05:600c:1f94:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45365a05192mr143331775e9.30.1750753932345;
        Tue, 24 Jun 2025 01:32:12 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/2] xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
Date: Tue, 24 Jun 2025 09:31:55 +0100
Message-ID: <20250624083157.9334-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624083157.9334-1-frediano.ziglio@cloud.com>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
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
 xen/common/efi/boot.c     | 71 ++++++++++++++++++++++++++++++++++++++-
 xen/include/efi/efidevp.h | 21 ++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 2a49c6d05d..87eb8bb8ae 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -849,6 +849,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
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
@@ -1492,7 +1560,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             kernel_verified = true;
         }
 
-        if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
+        if ( !initrd_load_file2(L"ramdisk", &ramdisk) &&
+             !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
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


