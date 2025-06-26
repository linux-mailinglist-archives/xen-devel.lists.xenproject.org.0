Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD79FAE9E47
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026356.1401576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNl-0006o0-F7; Thu, 26 Jun 2025 13:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026356.1401576; Thu, 26 Jun 2025 13:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNl-0006lE-9p; Thu, 26 Jun 2025 13:11:13 +0000
Received: by outflank-mailman (input) for mailman id 1026356;
 Thu, 26 Jun 2025 13:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUmNj-0006jN-OE
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:11:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068c1767-528f-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 15:11:09 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a528243636so585550f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:11:09 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e806916esm7351356f8f.43.2025.06.26.06.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 06:11:08 -0700 (PDT)
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
X-Inumbo-ID: 068c1767-528f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750943468; x=1751548268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arkastc7FTqBBhA884vRzOj/VWCapeivXKRaS0y4Ts0=;
        b=SyUxy1zTp61tg8DI6EjwgOBrWM7qt5xSJcHgBzAC71FNW/UEyJRTBtImyhx+OGiqtR
         LosteY0D7H0iuV98incwrUi2Gtb6WEEcopdRcVYVkIBg+XF+ZF6vQXOmIQua5sIyzCld
         3QT9glxC0t5dE8JDxyJOeMKEsBNppXz+L23nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943468; x=1751548268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Arkastc7FTqBBhA884vRzOj/VWCapeivXKRaS0y4Ts0=;
        b=rmS1i4GBtqdsbSJkRHMbhro2rHlVt2aON+Dc6ZFsuIs7VHGE18VVMie+qs+JB1+q9b
         nL8KQcs0SIqC8A7seTB3v1hEsgj/YmY9g4OZTNGXIgMESinVjHl2TRFGZwjEi0uiq7hG
         NJJ3VQxfXx+RGHSO5vIfdzgGPdrirFSU5TBUt0csYbBLmGcD2ZAgXrqZQGJOJy9xDFPO
         agnrTdNrqnziXJgxuPVz9YPMUpPmvyE127d6oOU4O0X64Ec1X53unR/FKQCHkWr4VxNi
         +YMCu/foog0pmEj6PCYpXNuJrDQ0aD6uh0uz6DGaJ7dUFpoCNgfQlXBU92j1T1KR5ep0
         tJ1w==
X-Gm-Message-State: AOJu0YzzujFW/InqIKejjwocWVG0+8D4JNGsWjzX4C7HciF0wc/fyMVV
	/3D4CEoopM0zhe96wJcfPBKctQHkuOJPbnSDqzkfhlcDfwWlZkFlKYP+6G8y982v+hOxBICvf5W
	mn8+RXaw=
X-Gm-Gg: ASbGncu/+nvJfqYslR73W9ruw57Cl5FRcdx8w+54W3V6sD2t9iJAN9T1DVol9gy0sox
	vYwElYA/PXYrW6kh6ATf9qSkg1GbbyB4ZIGXtqR05Kod48FvUBfeYJVSCaT/NzcXtAegyluOyAt
	v76f90OKsY3LREUilkcgARMkZKIOpsNMve/Hk1cE3MR/5sScCV8VoZSDsbxl0YDwoDFKHLKpciP
	uoPlzKM1bPngEP0bJHCdzUamdGOa5MIirS+igOx4v7JVcZyrqjVSEorMswgXoda8tuvYi0QExne
	Yl2YV3xXwefIRJLZhS6R6ZbGuM5mwhkYhRai7aLlrK7UF+kCMXNVMDlhoMxKBu+jcF4l6NsWUXq
	4T3lZ/LsX6aGTfZMDnFEfBHKtGsICfukw+OeveL+p
X-Google-Smtp-Source: AGHT+IEMoyWamH+/GJbtG6xlOTCstBg1G51VJ6ogmc3sMopKuNX7Rw4BQ3S55LTrqTQnV2qkJs8Y5g==
X-Received: by 2002:a05:6000:2484:b0:3a6:d604:a017 with SMTP id ffacd0b85a97d-3a6ed63d398mr5842184f8f.24.1750943468404;
        Thu, 26 Jun 2025 06:11:08 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 3/3] xen/efi: Update error flow for read_file function
Date: Thu, 26 Jun 2025 14:10:55 +0100
Message-ID: <20250626131059.61894-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626131059.61894-1-frediano.ziglio@cloud.com>
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use more explicit goto statements to handle common error code
path instead of a lot of if/else.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 80 +++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 4cbf1aa894..f6e8d4726d 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
 
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
+
+    what = L"Open";
     if ( dir_handle )
         ret = dir_handle->Open(dir_handle, &FileHandle, name,
                                EFI_FILE_MODE_READ, 0);
@@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     if ( file == &cfg && ret == EFI_NOT_FOUND )
         return false;
     if ( EFI_ERROR(ret) )
-        what = L"Open";
-    else
-        ret = FileHandle->SetPosition(FileHandle, -1);
+        goto fail;
+
+    what = L"Seek";
+    ret = FileHandle->SetPosition(FileHandle, -1);
     if ( EFI_ERROR(ret) )
-        what = what ?: L"Seek";
-    else
-        ret = FileHandle->GetPosition(FileHandle, &size);
+        goto fail;
+
+    what = L"Get size";
+    ret = FileHandle->GetPosition(FileHandle, &size);
     if ( EFI_ERROR(ret) )
-        what = what ?: L"Get size";
-    else
-        ret = FileHandle->SetPosition(FileHandle, 0);
+        goto fail;
+
+    what = L"Seek";
+    ret = FileHandle->SetPosition(FileHandle, 0);
     if ( EFI_ERROR(ret) )
-        what = what ?: L"Seek";
-    else
-    {
-        file->addr = min(1UL << (32 + PAGE_SHIFT),
-                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
-        ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
-                                    PFN_UP(size), &file->addr);
-    }
+        goto fail;
+
+    what = L"Allocation";
+    file->addr = min(1UL << (32 + PAGE_SHIFT),
+                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
+    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
+                                PFN_UP(size), &file->addr);
     if ( EFI_ERROR(ret) )
-        what = what ?: L"Allocation";
-    else
-    {
-        file->need_to_free = true;
-        file->size = size;
-        handle_file_info(name, file, options);
+        goto fail;
 
-        ret = FileHandle->Read(FileHandle, &file->size, file->str);
-        if ( !EFI_ERROR(ret) && file->size != size )
-            ret = EFI_ABORTED;
-        if ( EFI_ERROR(ret) )
-            what = L"Read";
-    }
+    file->need_to_free = true;
+    file->size = size;
+    handle_file_info(name, file, options);
 
-    if ( FileHandle )
-        FileHandle->Close(FileHandle);
+    what = L"Read";
+    ret = FileHandle->Read(FileHandle, &file->size, file->str);
+    if ( !EFI_ERROR(ret) && file->size != size )
+        ret = EFI_ABORTED;
+    if ( EFI_ERROR(ret) )
+        goto fail;
 
-    if ( what )
-    {
-        PrintErr(what);
-        PrintErr(L" failed for ");
-        PrintErrMesg(name, ret);
-    }
+    FileHandle->Close(FileHandle);
 
     efi_arch_flush_dcache_area(file->ptr, file->size);
 
     return true;
+
+fail:
+    if ( FileHandle )
+        FileHandle->Close(FileHandle);
+
+    PrintErr(what);
+    PrintErr(L" failed for ");
+    PrintErrMesg(name, ret);
+
+    /* not reached */
+    return false;
 }
 
 typedef struct __packed {
-- 
2.43.0


