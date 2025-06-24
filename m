Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA2AE6896
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023774.1399833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4cM-0006bp-7h; Tue, 24 Jun 2025 14:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023774.1399833; Tue, 24 Jun 2025 14:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4cM-0006Yc-0F; Tue, 24 Jun 2025 14:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1023774;
 Tue, 24 Jun 2025 14:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU4cL-0006YQ-De
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:27:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 561e875a-5107-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 16:27:20 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453608ed113so47946965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 07:27:20 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45380705351sm4602115e9.0.2025.06.24.07.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 07:27:18 -0700 (PDT)
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
X-Inumbo-ID: 561e875a-5107-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750775239; x=1751380039; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvSWfU3vS+cIfE2UVvh70sxlin2NyiKeV2rfWj9rRaM=;
        b=hUjxIUesXR7KB+0kFJ5Y+qlyjrPUfgZB+PBb7/YrlLRi9rXMNz8TJYpBUcjmsJjjKa
         QNVgUnxqDp8PkRbOs0yRXoGp/Lhd4pGxqEHv39d2+Y2VKtNWotOu8iq9Ur/I07nktpie
         7fQl4HrEbZU0zwXrllCqRncp7vvpd0yuTH90E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775239; x=1751380039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvSWfU3vS+cIfE2UVvh70sxlin2NyiKeV2rfWj9rRaM=;
        b=cUKbWtaSgLtEzKmw+hFkcUj+Fd9vxD+4rtnfm5016z2YPENYpZq06n1TNHW1Tgtp0x
         5IDXloa+54RxHuElgKkfYhWWsBXtQpusTUcWrNvVqJeCH5iVcSBOIoymlp+98B0MD7ZI
         FGilG2fkeGcaDlquBjMBHAS4wx8+tS884qdMccrylRutZJJJG4QhYUB4HJFmaS1iuNeU
         K7WSd3dV5Hy3ntmlg9p5iJJG/aicwd2qf0yIs1qAdKXm1PuwuWCr9ub9FDO9RTs/J9l8
         lO377SMgEJHcM2bIaFFLqYKRBskndIUeJapU3zYa67mA2MLKXMBUBgWsnR4FSgKesmH7
         cVrQ==
X-Gm-Message-State: AOJu0YwEJv/bLQJASrBezgfHlfdqSIYhS1hFoC1bJCnN51R+vNwkO32S
	xpOKmsQuQNFsvXTLBUKHTANHfMgQcHf7FMwW0xeD0xvJKFEFkx9nnZSK76T7JHdD1wLIqtPtkRg
	e8xlOCEdEzA==
X-Gm-Gg: ASbGnctMDc3gOLH5aeJhminwc+AcwN49vaoQUrdmbDw20+VGEGbwLxnC+oyiHF+T2Op
	mlvG4Yll3yX7L8z5ekPknZNDEUZxJEGyG/rXhb6FTuDtCH9XAUQW2iYK+pFNsiodf+A/PgkkvUq
	Rsr9yIZZ13PuNtiearYgKBV8/XVUV69gN17jus3s0b9sT0SYs0NaITidk1rXqyKYyLzQaZQBJ3q
	Xc8HjyCdSMzcS+Vi0nouZUT4k+eXqGDIAa0+FC1VrwZKI69NR85d6EahnH/xK1T863Uyz+xeDNz
	j6eh6ZYqH1MkIk+QLaRMEgfgUNdEVmDlIjgikAc/hgnbN8MD6TFaliNeYACnoRZ6J2rxorhOM1R
	ub3qrJhws2ivhbkg8LoudAd3EouRWdA==
X-Google-Smtp-Source: AGHT+IGed5CPjvOm2EqjTNPtlDK3NJOxPCE24eAzf5yW8bJSP56J1fQACDEGP8alWi51zx4L7c8xGw==
X-Received: by 2002:a05:600c:3d8d:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-453659c48cemr157512105e9.5.1750775239213;
        Tue, 24 Jun 2025 07:27:19 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/2] xen/efi: Handle cases where file didn't come from ESP
Date: Tue, 24 Jun 2025 15:27:08 +0100
Message-ID: <20250624142711.54925-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624142711.54925-1-frediano.ziglio@cloud.com>
References: <20250624142711.54925-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A boot loader can load files from outside ESP.
In these cases device could be not provided or path could
be something not supported.
In these cases allows to boot anyway, all information
could be provided using UKI or using other boot loader
features.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- set "leaf" to NULL instead of a buffer with an empty string;
- keep read_file fatal if cannot load file (except configuration).
---
 xen/common/efi/boot.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 1a9b4e7dae..b18af2f1f4 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -443,6 +443,18 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
     CHAR16 *pathend, *ptr;
     EFI_STATUS ret;
 
+    /*
+     * In some cases the image could not come from a specific device.
+     * For instance this can happen if Xen was loaded using GRUB2 "linux"
+     * command.
+     */
+    *leaf = NULL;
+    if ( !loaded_image->DeviceHandle )
+    {
+        PrintStr(L"Xen image loaded without providing a device\r\n");
+        return NULL;
+    }
+
     do {
         EFI_FILE_IO_INTERFACE *fio;
 
@@ -466,7 +478,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
 
         if ( DevicePathType(dp) != MEDIA_DEVICE_PATH ||
              DevicePathSubType(dp) != MEDIA_FILEPATH_DP )
-            blexit(L"Unsupported device path component");
+        {
+            /*
+             * The image could come from an unsupported device.
+             * For instance this can happen if Xen was loaded using GRUB2
+             * "chainloader" command and the file was not from ESP.
+             */
+            PrintStr(L"Unsupported device path component\r\n");
+            return NULL;
+        }
 
         if ( *buffer )
         {
@@ -772,8 +792,11 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
 
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
-    ret = dir_handle->Open(dir_handle, &FileHandle, name,
-                           EFI_FILE_MODE_READ, 0);
+    if ( dir_handle )
+        ret = dir_handle->Open(dir_handle, &FileHandle, name,
+                               EFI_FILE_MODE_READ, 0);
+    else
+        ret = EFI_NOT_FOUND;
     if ( file == &cfg && ret == EFI_NOT_FOUND )
         return false;
     if ( EFI_ERROR(ret) )
@@ -1404,7 +1427,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
             PrintStr(L"Using builtin config file\r\n");
-        else if ( !cfg_file_name )
+        else if ( !cfg_file_name && file_name)
         {
             CHAR16 *tail;
 
@@ -1515,7 +1538,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr = 0;
 
-        dir_handle->Close(dir_handle);
+        if ( dir_handle )
+            dir_handle->Close(dir_handle);
 
         if ( gop && !base_video )
         {
-- 
2.43.0


