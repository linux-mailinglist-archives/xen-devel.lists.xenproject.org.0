Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749DAE9E46
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026355.1401565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNi-0006Vq-1A; Thu, 26 Jun 2025 13:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026355.1401565; Thu, 26 Jun 2025 13:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNh-0006Tq-Tg; Thu, 26 Jun 2025 13:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1026355;
 Thu, 26 Jun 2025 13:11:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUmNg-0005vJ-Bw
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:11:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05b626fc-528f-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 15:11:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-453634d8609so7285825e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:11:07 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e806916esm7351356f8f.43.2025.06.26.06.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 06:11:06 -0700 (PDT)
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
X-Inumbo-ID: 05b626fc-528f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750943467; x=1751548267; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ROcQ+NE6uRH9cKCCikx8gAVzBifn0kY2OpATrBDp8=;
        b=aCC5N2EkddFl4s3faYTpbsetQEtfhCRRkP4qy5/H2PMzINxkPi/s5cjPOEKlftO7V6
         L/lSioXvfoZq95LXx1+bJnRue3o2BWCdQT0xzeTMOb2KLd1xLpesU1DBFNT1FVtO+D7G
         sI4IegTydZ5YCzVEMxB2TRwt4OJoVoZnpQLjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943467; x=1751548267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19ROcQ+NE6uRH9cKCCikx8gAVzBifn0kY2OpATrBDp8=;
        b=nmQYjGg5x81Bd2lCiPUUypLHoTuNWUDX2yonL+yj7vs3W8Yt3OqSqSWwhl/gCo4yRn
         zJUwxuoolP8Yn37JKFb4KoNKKSUl2uFnriavDdHzLFJpVLlEt4AHIYXwI0LRY2xgPgiD
         ckRsngm+Z4WpfdtwCXflNysYV74fabZ7Z1X6XFavDMYZ8QY9Fkb6g5uCj3VABuo54Nro
         ubSp2w8KfOo+McjeAYUlb2m/fKjt47HcpVIttd3ewF4KL0p5Gr5RLbhTNjWBCBi4GSn6
         nkpovR1yW7b5cZepF1xhe3vH8gMPQJHflYWSil6CPGvv77L9gByF9PqL6Iz2y5CqjzbH
         yYfA==
X-Gm-Message-State: AOJu0YzUlxhw/MX7mrKHuPaROxDWUlUikHTozaKtD+sD9Kk+z9JO1snG
	me5HNKcjETKhuTQmMylDXeiRc6U/JUX8QQGTohIAx5TWTSN+l2GN7nJSLEG4Tlp/tYkZUATGF16
	6p4UAV1s=
X-Gm-Gg: ASbGncs+tG8iDLSOvtf+Rc1tCkJhoqjhDPLANxuLVEmMlNZQak1YKbETG1s80ROwQLM
	zC6C3Sr/FjCrvPeUPN/I7nIe3pe0u0CQxsxczSp/vKdD+JPYXdRAUT3OPIgHqcNTu5KYoN1tVTA
	w27tIA6q9o3igKxVOHIaTSF9dt0wPbopWptLjwwD6JF0pBgn3OuS+VqSpg4X1patUzP5hpZQdTS
	dQrnGfcq26dLXc4Ml538Pqcdon11VDx1A+Ahwxk/2ZI4wt4dJvEHhKuvphVz+uM6q260l0lBZ7R
	TsRY8kvDIXpb4xI9EDzPyY7lVlbmVvT6trbv6KGoK82vzijTsQ/OTN0cCgWBoYFmTiccHiDsYD7
	oAdpgrw1TG4SD5LNfs3WG9XOjNnQjJA==
X-Google-Smtp-Source: AGHT+IHftnWwmJMkPMW09W9VY9+YM1UmRdHPziBBZ1IbJg4TPTO5PkismHUyTMIoUu4WaMQ8CMkznQ==
X-Received: by 2002:a05:600c:35c9:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-453886d53d9mr41151945e9.2.1750943466805;
        Thu, 26 Jun 2025 06:11:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 1/3] xen/efi: Handle cases where file didn't come from ESP
Date: Thu, 26 Jun 2025 14:10:53 +0100
Message-ID: <20250626131059.61894-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626131059.61894-1-frediano.ziglio@cloud.com>
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
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

Changes since v3:
- style fix.
---
 xen/common/efi/boot.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 1a9b4e7dae..9306dc8953 100644
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
+        else if ( !cfg_file_name && file_name )
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


