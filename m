Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0872AE15E1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 10:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020666.1396784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSX4j-0002KT-IH; Fri, 20 Jun 2025 08:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020666.1396784; Fri, 20 Jun 2025 08:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSX4j-0002J2-F7; Fri, 20 Jun 2025 08:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1020666;
 Fri, 20 Jun 2025 08:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGBd=ZD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uSX4h-0002Iv-RO
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 08:26:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b0ece3b-4db0-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 10:26:15 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-453636fa0ceso8075195e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 01:26:15 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4536470903asm17516405e9.40.2025.06.20.01.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 01:26:13 -0700 (PDT)
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
X-Inumbo-ID: 3b0ece3b-4db0-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750407974; x=1751012774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjZNOjvnDdhZuqYQVv8oT1CNUTyKY9t4hbuL5uen0oU=;
        b=i8tuQx0sjY/z8k8K9zhHJ+r+dsorQZo+QLGZSOFR+TH7S4erOxJX9BUZHI1k2cP4qy
         otZjqYsP2dD+FTbIQXfkGIDTK7/qyNj4gW+02BwRSlcyLX6Ru/vit/KV6ZW3KTCrHLyV
         eTGa4MgL8nHecPANShV01t0zgctgxznNQ0o7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750407974; x=1751012774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjZNOjvnDdhZuqYQVv8oT1CNUTyKY9t4hbuL5uen0oU=;
        b=YwB3ZSd3fYLNxk+lOWy+2BsYeym/lA51P72EaDOIPDTDJfh5UPX1ioTgk5wkLlxG50
         esUd/XczbaGs/s6zCsQGl7HPPcVmM1U4gDNgJNf75Bmr6OvAwaS9CSZ8okac+kbA/B7H
         1owuxvKdqbwXsrgpgqZzUSxR+AW0IsXM2jQaSSuJgChBDnIQt1kx3Bh0PD0nWdaCzZDg
         J1T685AyaylxlSW4NkFMyyOa5Q5MABK2gLvp8vqi8tUx858EbGifiwSKPPNfGVRONxyn
         cm6fkjhbUDEYPL7uci7KyGn6Sjo8qr+tY9F4trV+P4m/sT9SWej6fWelKgicu6xb+FQ/
         FPXQ==
X-Gm-Message-State: AOJu0YxrgVXtxV35TdRivjq9Ca6z0maXCQneXaYSkzA9vIcjDfiQrA1f
	GiJ6yXePsMNcybpJA++VMo1VG7fdueOEcB+gn5E0EArcnsmcTVC/Mp9I8oNLXkwdNpZV92xGY6f
	a51ph8WqcAg==
X-Gm-Gg: ASbGncvmFYPdW7a7mKp7i5+m4FqU3sgz8P+/WaEMpodvhzUqFRFRUrjiWdUSB0wY3rV
	dylLEK0VmWPP0LogFErqcdxarJcj9xzVUzNDBfntx0431UwjGjd8uNZp0XcHaZ9YxgmCxc3Soiv
	B72wj4LswSu1ahsKio/vI6C6IBWCjtlNVhCEhwRuWAuUPE/izTpVG3r8H9AOZ4MquQZYPJof+Ho
	Rh7OpSolDi7VML5U7yU0QqGJfrGpGYiKEjjL4S2E+fmDqixGWc+feauRqaMsxxOreD8QSp5gkuM
	Q/pFZuDlVyygmtJBntnnUtK444J8Y19yBMgm95tXrnlMBP+qbXtMlrbPXzzeFT4enJPB2hZ/eYK
	dw9PhnswSmHsnP+VJnviCyi6IptxQLArJZyKB/rFr
X-Google-Smtp-Source: AGHT+IG5+s3IydQtINiHAo5GNuBxPt3wGj7yk6vQo3wU4SlKEvnPrKRLccBPWc4olibOdeiQhyNGHw==
X-Received: by 2002:a05:600c:3b9a:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-453659ec136mr14011085e9.26.1750407974117;
        Fri, 20 Jun 2025 01:26:14 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xen/efi: Do not check kernel signature if it was embedded
Date: Fri, 20 Jun 2025 09:26:05 +0100
Message-ID: <20250620082607.46568-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using UKI it's possible to embed Linux kernel into xen.efi file.
In this case the signature for Secure Boot is applied to the
whole xen.efi, including the kernel.
So checking for specific signature for the kernel is not
needed.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- updated commit message and code comment;
- renamed kernel_was_verified to kernel_verified.
---
 xen/common/efi/boot.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e39fbc3529..fb3b120982 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
     bool base_video = false;
     const char *option_str;
     bool use_cfg_file;
+    bool kernel_verified = false;
     int dt_modules_found;
 
     __set_bit(EFI_BOOT, &efi_flags);
@@ -1461,6 +1462,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
             read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
         }
+        else
+        {
+            /* Kernel was embedded so Xen signature includes it. */
+            kernel_verified = true;
+        }
 
         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
         {
@@ -1534,6 +1540,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
      * verify it.
      */
     if ( kernel.ptr &&
+         !kernel_verified &&
          !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
                                            (void **)&shim_lock)) &&
          (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
-- 
2.43.0


