Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8DAE5F63
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023358.1399346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4j-0002Ih-Ib; Tue, 24 Jun 2025 08:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023358.1399346; Tue, 24 Jun 2025 08:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz4j-0002Gd-Ey; Tue, 24 Jun 2025 08:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1023358;
 Tue, 24 Jun 2025 08:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTz4h-0001zK-SO
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:32:15 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb937342-50d5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:32:15 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso4250136f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:32:15 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8050f53sm1322365f8f.3.2025.06.24.01.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 01:32:11 -0700 (PDT)
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
X-Inumbo-ID: bb937342-50d5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750753935; x=1751358735; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbnXF7V2QfdTrRqTRobcWnbo+kaLMKXyj/4viUPq/9w=;
        b=NXj/Q+lRWoNh8OrUd4bS4XyvNwb1zVGTIMnxrChzdq2KY6EmH02Vae/BSMW0FWMR+W
         TNwOzNmD+lKNGe216HVa8iPL7M4NsL6B6yXuDu2veV//HkRyVZc4gfkwqUBuSjVkdz6R
         ulYWra8P8zqxrRJghYpG3HS2Wmoofx770lXDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753935; x=1751358735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbnXF7V2QfdTrRqTRobcWnbo+kaLMKXyj/4viUPq/9w=;
        b=M45jjOwTQnZGiyqNoP5y3Bws4nIWBB+hjVn3BOwtgxkF1DenSLbWgEnItXsoCLoRln
         kBM0I0kBUHUehI1pfGtloWAxLNFJnfMFYXofgMGigPrDhR2pqf4cIg+0SUwTqSaZ3zwL
         IX0WmX6OoCS02YWjTlelJ0bI95SAZXuQ6sbGnlN4XJAVVkbDqBKQkHpDOr1HmjKUJkJC
         IsDmNMLO3ZxfX/r9Wb8sjC1Oo/OSP7PlMCjkSadygZ30Fbij/shuTHJlBUruLHMQcgzX
         SVieZI+XYRAYMhv83tvSp5tKWL1Oqel9apLWsFieAzaZCJx8K1aUP71VzkBSwVQgFDi+
         Ipyg==
X-Gm-Message-State: AOJu0YwlOKdyRmpMDdGo8nevGuHCZRVuJ2Iw7mmS6BQTsR3eh1lJbOym
	5rqYN+m9h8wc2x/tjKvXwWYEvZEHoB6a4PbfeBTGXzYGfrdwhe7OqZi/ghliEc6qSITyhEkXw7k
	Nd7KVbraRUg==
X-Gm-Gg: ASbGncs3vilrNXlIA4uV3yrtBo8uIcnsfNkhLv75kCVR2e4hol2SoSDjUkUQX0KVxxP
	9TkmGTC5lmfnonvkBX1P3e6ZX0qcSuGVkowTpDLWC1pYjqqMsYxEKEhNYo+qJyOtFqksYzMVdUo
	Qs1F3mBI4W4mIL0oGJhe6JjxgQFCTIg5uMvvW+xZMCBp2PvsT0Ee4Obcckx2VVf8iPQIsgJtyLp
	frJ3w87sZeTl8ydZvOGuuAHxuap0f/phmq2zlb9s38ZETxNfhmXhidb3TUe3GJsGQYwupWSvOQt
	uT/x1TqlPNHqX57MEHDjJBGtaT+UR2Jg2uC2qVYwwXwJYOs2z/doJBi9dQt4ARNtmXicq8tEGG+
	OeQme7zM/GBmRDdwFEadmtjhT1rVjoA==
X-Google-Smtp-Source: AGHT+IH6ufTRv1s3uEcgC/zbpkNW8qMXVLG+4euJb/BBjbMMEyxOaaEUuQqE5TvedU4WCo8c+BKTiQ==
X-Received: by 2002:a05:6000:2308:b0:3a5:2f23:377d with SMTP id ffacd0b85a97d-3a6d1324f04mr11601799f8f.50.1750753931588;
        Tue, 24 Jun 2025 01:32:11 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
Date: Tue, 24 Jun 2025 09:31:54 +0100
Message-ID: <20250624083157.9334-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624083157.9334-1-frediano.ziglio@cloud.com>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
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
 xen/common/efi/boot.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 1a9b4e7dae..2a49c6d05d 100644
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
+    *leaf = buffer;
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
@@ -772,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
 
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
+    if ( !dir_handle )
+        return false;
     ret = dir_handle->Open(dir_handle, &FileHandle, name,
                            EFI_FILE_MODE_READ, 0);
     if ( file == &cfg && ret == EFI_NOT_FOUND )
@@ -1515,7 +1537,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr = 0;
 
-        dir_handle->Close(dir_handle);
+        if ( dir_handle )
+            dir_handle->Close(dir_handle);
 
         if ( gop && !base_video )
         {
-- 
2.43.0


