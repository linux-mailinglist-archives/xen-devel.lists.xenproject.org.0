Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB1AE6897
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023776.1399852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4cN-000730-K0; Tue, 24 Jun 2025 14:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023776.1399852; Tue, 24 Jun 2025 14:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4cN-0006zn-FD; Tue, 24 Jun 2025 14:27:23 +0000
Received: by outflank-mailman (input) for mailman id 1023776;
 Tue, 24 Jun 2025 14:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU4cM-0006YQ-3H
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:27:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 569b13fd-5107-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 16:27:21 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4537fdec39fso2171485e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 07:27:20 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45380705351sm4602115e9.0.2025.06.24.07.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 07:27:19 -0700 (PDT)
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
X-Inumbo-ID: 569b13fd-5107-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750775240; x=1751380040; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGXZEs8C2ojkzsUWVpaRntklr8ldtVYfN6U4O6Kve+s=;
        b=EbAe/wpeqoc9+49NFKzLEo/E3tj0vVgoyA8TB9x0SAxLWw84wTBuRfw/zVxCQlFhwE
         3X56KaqiO1QFnsWEkYuQDIdyOKNoIYqJUV3o+iPj/7raTUEKq7KPvSK0y4RMTEEfxvZV
         yfFwCG0W1Wn6HPC+TcE4ro1HsXi5Bpj73BO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775240; x=1751380040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGXZEs8C2ojkzsUWVpaRntklr8ldtVYfN6U4O6Kve+s=;
        b=GZOYACIQDlMl7roqeP346Vph1ZoVVD+Km1wWlKprA4YCRwTBi2uVWXmkWDKu8bUylJ
         xFvGhofhtJQ8sBOVv24Ls4z8KPXNRPPAn5PpWxswy0dztXfuwi+S3ohKlpNOkq9yzYry
         zwMuTPqm/bDb4VYZooSX+vGaVVIm4en/Y07wXgM0ImHomyML9OnMMu0xGb38ALWZCX1M
         lKDHib9cA6oiutT+cRDahOcUO+4bV8pmv674fso4o+LRUi7FswN1xkyDAGBHmqoeHll3
         joas2E3ZtLmulWGmcwjFdi5IH6iYMQHhNC6QAL0TpqyEkhn227P1ye/CxYwPJEU7LCNI
         BNtA==
X-Gm-Message-State: AOJu0YyoYjLMfCC6tyuF3sm+ZeRLK0wyrAlgwlJWAdf8vTmZLmDt8hRT
	O6o2yQGFY8L2BEA582DKZRV5DQJ14Lti9yLjh0z6uSQeq9HXyQ2befcHI3pa1r92T4xrRiLDh9a
	QUXtwruxQAA==
X-Gm-Gg: ASbGncsPkvITzfMqcW+JCE6cwCcEfiB05isMU1aYdKzP/CvRnWQOZVG8MJwOVBhcmf8
	YeZtUqVpWVnoQBIOPbxUEXQw45zAz7xBSH3Wk4Tfzb36GocCj6OjHEH2Pah5GBavutAmHpDXA03
	qkHpmeEBEC1EH23mC9zFgUAK22dwsnYsoJizpuYcqCngWuohE8sgZysVVBrvsxTboZJ6wO+qilp
	Vl7yI/oxl0kvq/x7BOe90u8u1vPfPHMD8OL/LAfQ7fakA8o+hd6MIk35TjHzf0DprUnR5bWrUSD
	wyPwxCp0XueuzcfLes4w+fzoyoxZJeLOAV6spMU2C1Xdlmj5yl2zBfmnoSf7XOBp5X1gZ4zOdR3
	0edLgeR69Wv/BZxnbQtE9whq4EiWptA==
X-Google-Smtp-Source: AGHT+IHYNga+DRn2K3B0qKtZbb3Yr1jJ3U11q1x65KLpALUXLiHsyFxqnFKSdE9qm9yUMVcJf3mSuA==
X-Received: by 2002:a05:600c:c083:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-4536bf70111mr79669005e9.24.1750775240067;
        Tue, 24 Jun 2025 07:27:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/2] xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
Date: Tue, 24 Jun 2025 15:27:09 +0100
Message-ID: <20250624142711.54925-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624142711.54925-1-frediano.ziglio@cloud.com>
References: <20250624142711.54925-1-frediano.ziglio@cloud.com>
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


