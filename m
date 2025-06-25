Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62828AE78A8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024417.1400301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeG-0007It-SA; Wed, 25 Jun 2025 07:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024417.1400301; Wed, 25 Jun 2025 07:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeG-0007HB-PK; Wed, 25 Jun 2025 07:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1024417;
 Wed, 25 Jun 2025 07:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=edXa=ZI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUKeF-00071z-4I
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:34:23 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff02075-5196-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 09:34:22 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so648369f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 00:34:22 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c05csm11319445e9.5.2025.06.25.00.34.20
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
X-Inumbo-ID: cff02075-5196-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750836862; x=1751441662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsyq/VDtJXv+144v9RhWaKYSLA/NOYLJKdqG4Hj8gbU=;
        b=GzoQLVhIhO0TZ0utu+HsxFuX8zslSeOBPA3K45AS8iwvDbjq6DawN9PDlXChaw/LFz
         SBz4wlpb7X1P+T0xfuOmpPKCgOCgA1Xd/yKyMnmRWAGkl0/ic9t6IyE4uz4wZLm6YjJZ
         WrfP4v88wJKJvGFtvFmP4zTxIcvXGs2a5vPHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836862; x=1751441662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vsyq/VDtJXv+144v9RhWaKYSLA/NOYLJKdqG4Hj8gbU=;
        b=K11YFcgCmwnP0xjP+JHNOiqL2l61i0ZNPDWIFndylB5pFU0TKP9pBKvJdoT/Hhif9G
         iZPnU9i0v3GA7QKRJKm9ODlGcaCwGNNyphVVduy1bM6APmErXgtx1RPm+ZhnZxlbFu+W
         kBxNd/2DSqJXcnZ48MpTFQy/h7JuA0MJ3oYE9SK99G6Q5dt9K2m4qrhWxWrJmFIBwfnD
         zevOv8VGSAlUzI9X/m+8tN1oU1Np2/zCxeIc8bnxEzDIyrqGUW8koGBaCTuQ31f3eZww
         ne0yf3lM4cDCGYk8NQ1NkAjodv1t4somWKCSxDPMC9I36W3FRgsFF08bW0xoD1KU/Y+9
         8VSg==
X-Gm-Message-State: AOJu0YxnQUxvSBwA0CGGOrv/duiwd8nDJHUfrrjjNCKc5KOSVR1timj/
	/yANC/pYy72BPY/yHDXrnjP4s5x77PEzNPtrDfcbcImqir7Jz4EfrAu+diHprXAO6jHpNA/bokh
	ygQKdgG4A7w==
X-Gm-Gg: ASbGnctV94loPCyZk330r632IWcz5Ndr80OGTKxLJfjoh0MlaJlz6uUNf3OPcAta/5U
	43yZGxl2WVgNecrXZB/mHGmnDjU/DiDbora9A09Zzw3ZC+UgJA9YovYQRanZNy1pfQ4OkeEQEQX
	nfRviSf1KdSmLRbvKQEBXDwPbwJQCOTffOwlW/ghgD+AfmL9aCNgnQbP3LvjH/yGTP6gRvF41Vf
	7JaX9coib+iad9R1kzqppOAdEt49GJzQt3AFJnUK2PZsi8vJUeRwPJ069Gen+9gKtBbXhm/98li
	Pzi/ZW/VA2ez5ZwHNSv+DT4cKnQCLrWvPt3AtpAJjPOGphVNw1+jHfdwdsGI41K5OzgUd2aQOW7
	X0B+Ml1a44i9pxQHMubAJhmmAH51FqA==
X-Google-Smtp-Source: AGHT+IFVmrgt1T38A7ERw6soRLcvDczrOUkuFgE2tl8CzJitksBUAXlHjE6GPe7vMJCVFLlc1m8Y8w==
X-Received: by 2002:a5d:64c2:0:b0:3a3:7753:20ff with SMTP id ffacd0b85a97d-3a6ed655bc3mr1599155f8f.35.1750836861536;
        Wed, 25 Jun 2025 00:34:21 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/3] xen/efi: Handle cases where file didn't come from ESP
Date: Wed, 25 Jun 2025 08:34:03 +0100
Message-ID: <20250625073408.7496-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625073408.7496-1-frediano.ziglio@cloud.com>
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A boot loader can load files from outside ESP.
In these cases device could be not provided or path could
be something not supported.
In these cases allows to boot anyway, all information
could be provided using UKI or using other boot loader
features.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v1:
- set "leaf" to NULL instead of a buffer with an empty string;
- keep read_file fatal if cannot load file (except configuration).

Changes since v2:
- Added acked-by.
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


