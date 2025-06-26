Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67446AE9E48
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026358.1401588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNm-00074l-N4; Thu, 26 Jun 2025 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026358.1401588; Thu, 26 Jun 2025 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNm-000712-Iv; Thu, 26 Jun 2025 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1026358;
 Thu, 26 Jun 2025 13:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUmNl-0006jN-Cz
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:11:13 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062d611b-528f-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 15:11:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so9669825e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:11:08 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e806916esm7351356f8f.43.2025.06.26.06.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 06:11:07 -0700 (PDT)
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
X-Inumbo-ID: 062d611b-528f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750943468; x=1751548268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+mo0WOKd3A0EKEylip0Ln3TwOuR0JvCpuUcmvIccPQ=;
        b=Aum2uHGtUzzWZ7bUMAiSw5GqXv9cJK8OSTVtggrlBTWOe/WCiYGBebDINGcZdPITLk
         m0XK2xYoVTIanZO+GtMP/7eBq9FUSk5pESqzeNawDtqnMssVft+v2rDmnKmTrwqwMEJt
         Nvyv0SXnibkyPjsJ7IP68miJcTpFlDEEb4L24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943468; x=1751548268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+mo0WOKd3A0EKEylip0Ln3TwOuR0JvCpuUcmvIccPQ=;
        b=mTv/bdbW+KkbDnG8b62vQqW1O8VCQzVlY2w8SFH/0iTuAQqm9PsJMduJE3McdMjeSQ
         iT4Y79EKWPdVcdmq8TVNLNwaT77elV9tqIZTCylFydnOzk+Ah1EseuXzk5EkFrx2pguD
         PjT6mVTU5tNvzFJzbIZubjn7O8+tcMcELlsVL5sdecgKvic7jVEX4jlh7zdIcInR6XrS
         jW/YsP0kyez8x5oJ+ZdzZpZEa7WIOG+JU9htIRGE/nKDZduIiXoxXX/xVtG16ZewOAKV
         qKcO4wRFDdQkv/B6HB6AIfIza8DGIprkyerOjtbNN5uLhkLAMNs19QTEZyq202DMPQGV
         6YFg==
X-Gm-Message-State: AOJu0Ywu7gOlrwfeiUNbURM7EfQd5CgwxeRAlJH22/eJkvfCTflZWSU0
	KrkETVjk4iE3JUd2qcm3VeZ02P854GQYOW6F1J6Jh7sSWtPFw9TWl7jO5QrX0XtZ/oUwngiqRL/
	fcOw0w7Y=
X-Gm-Gg: ASbGnctNwZrqlNbtfbFcI1BjHnJpCzQiqBPXb2WRkOeCYaICrmXl4r5TT82wTKsBXWS
	eJVROfGX/Ywf7xxi/eQSumPVAARs9IMi0KUv2xW8FSytuFlMKY8zFUT+TQ2hTf4JurWHAli6JMc
	JDPdddtQVv2hd2MujJuidqlHAxSXiAkE8g+j4CtnjeL7fGiuDanN3/gdrmCjj/bglzSjZbivI69
	Tvr262z3PQQUDHxyRv3/j4Motl7GphSHoSjReFh7UMrWgEg39ZLJ7vIFu88FKssxl8ZjOK/Hvy6
	VjkXHckvIzej5Ia1rtgzxmECxhEEE2mAUFRxinFbB56/amztmjUMrUnLtq1j1ZXOpzcCYNvxNaR
	bAfM83FLxXLjakfAN37Ckjj5NpUs4gg==
X-Google-Smtp-Source: AGHT+IF2sIhI5qYgc8DsZ9N26609R1JHS5126HSQCIqc8YcGxsb7eDmgHQyWFIKF+4U/LrHrli+IUQ==
X-Received: by 2002:a05:600c:b95:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-45381ae2520mr74274265e9.18.1750943467661;
        Thu, 26 Jun 2025 06:11:07 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 2/3] xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
Date: Thu, 26 Jun 2025 14:10:54 +0100
Message-ID: <20250626131059.61894-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626131059.61894-1-frediano.ziglio@cloud.com>
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
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

Changes since v3 (mainly internal review):
- use __packed instead of #pragma pack(), more consistent;
- call handle_file_info instead of efi_arch_handle_module, more
  consistent;
- call efi_arch_flush_dcache_area like other functions;
- move protocol definitions to efiprot.h file.
---
 xen/common/efi/boot.c     | 71 ++++++++++++++++++++++++++++++++++++++-
 xen/include/efi/efidevp.h |  2 ++
 xen/include/efi/efiprot.h | 19 +++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9306dc8953..4cbf1aa894 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -850,6 +850,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     return true;
 }
 
+typedef struct __packed {
+    VENDOR_DEVICE_PATH              VenMediaNode;
+    EFI_DEVICE_PATH                 EndNode;
+} SINGLE_NODE_VENDOR_MEDIA_DEVPATH;
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
+    handle_file_info(name, file, NULL);
+
+    efi_arch_flush_dcache_area(file->ptr, file->size);
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
index beb5785a45..dc070007b8 100644
--- a/xen/include/efi/efidevp.h
+++ b/xen/include/efi/efidevp.h
@@ -398,5 +398,7 @@ typedef union {
 
 } EFI_DEV_PATH_PTR;
 
+#define LINUX_EFI_INITRD_MEDIA_GUID \
+    { 0x5568e427, 0x68fc, 0x4f3d, {0xac, 0x74, 0xca, 0x55, 0x52, 0x31, 0xcc, 0x68} }
 
 #endif
diff --git a/xen/include/efi/efiprot.h b/xen/include/efi/efiprot.h
index 56d7636b2b..94c1faae0a 100644
--- a/xen/include/efi/efiprot.h
+++ b/xen/include/efi/efiprot.h
@@ -771,5 +771,24 @@ typedef struct _EFI_EDID_OVERRIDE_PROTOCOL {
     EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID  GetEdid;
 } EFI_EDID_OVERRIDE_PROTOCOL;
 
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
 #endif
 
-- 
2.43.0


