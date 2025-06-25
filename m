Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33933AE78A6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024418.1400310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeJ-0007YT-3i; Wed, 25 Jun 2025 07:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024418.1400310; Wed, 25 Jun 2025 07:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeJ-0007W4-16; Wed, 25 Jun 2025 07:34:27 +0000
Received: by outflank-mailman (input) for mailman id 1024418;
 Wed, 25 Jun 2025 07:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=edXa=ZI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUKeH-00071t-KN
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:34:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0d81e65-5196-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 09:34:24 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso9982275e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 00:34:24 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c05csm11319445e9.5.2025.06.25.00.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 00:34:22 -0700 (PDT)
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
X-Inumbo-ID: d0d81e65-5196-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750836863; x=1751441663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u/dNL0zGTpCOJg2Jk0Pnt2b5neRnRqaGdBf3ycdnjw=;
        b=G6SMwt9vfW/+omiNV8CIM78WHHaBEWSQAArbfT7RO+EzQTqyqHga5pZzYJMHXpnfZo
         P8H2omnfLzdN43/JHCAQ586ujNUK4gsF1v/nINJYszJKVIyI+0SuaQpH3UpQ/fSQ6Izy
         n3Xp0SY75c2nlvBn5Zjz28mDYYdtw0fxugFEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836863; x=1751441663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2u/dNL0zGTpCOJg2Jk0Pnt2b5neRnRqaGdBf3ycdnjw=;
        b=lPzq9or4glMsAbWpGE26qPcTtU0xxON9PihKQz5VnTCXjwPelqKpM0Gjuig8Qn6ylC
         rmMzHQj+3Ab0pVR7aHSYGCe2Gi22mBD7n7BarvQA1bQR/bVphzVF+vtYkrXSsfNH1WVn
         jC8b5u5lWXWX2S5gjBqKPkwYCy4Z63981VT33KppLOxULL5jsZBWFCE+ZuyYvdgm/KyP
         GkGeuAjHgJcnHtKZO6e9Zep25p9Od4uMNiFBF0BTZFfI+v78CiJcvvUYf31UWO6r+Bf9
         4XGMe1hk/VNiAwgssCSi744DCq0B/BdkoZsrz/71RX9wTddTLuL14H22i+N7J3fSvtkn
         eNig==
X-Gm-Message-State: AOJu0Yz5isTnRBgEIlbDYalrNfb2YMI2taJamKZnTfFKoiYKEHp1ulge
	YicO+m3h+WhludThvrjKh2/2hxBYqn4y87Z8wfr4CvVfnRmQhzdVyRM97wtDzA+tdMOJZ/i/rum
	bJCXj2HbUIA==
X-Gm-Gg: ASbGncsMBjy+IB3KYHyvZSuy89NHbM3zSlkJnIgRZzCFOyexuecNVxzsLuHtNxff9sw
	Y0Zr9z4PItPPTM1C/wQgRL8915fwegPNklugWht0fU0jr+yphX5JuI71S0AzItguOMbmzq66uey
	u5uYcQAF+YIQ5+szw10utOx0K87VuIhEDqn/SeE8v1SxnAALvJ+nNCvLis0BY5lEupvoSr8syuA
	HdyPSH2L/8MV1ckLDlOCpyAEOjtyUOxdFySep5H7exDH4VBZpbR1ASpj4RLf7moSpb1iYypOREu
	tpTIOt9Eq8iTTaMe+YwB0L4aSa9e7CbIMCBK734WapMRSNAXag+GBrHFwMQAbua0iQagri4Po0v
	5lEgH0UjDziS/G4dB9eGlfIrk/CIhVg==
X-Google-Smtp-Source: AGHT+IECGcdpnjc8qdQWw0CpidFRo4B7mb6gEOKf268r3/OuAS0AJUvt6RM81TyWc1Q6MtmwJ+1Thw==
X-Received: by 2002:a05:600c:8b58:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-45381ac23aemr17908645e9.10.1750836863225;
        Wed, 25 Jun 2025 00:34:23 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 3/3] xen/efi: Update error flow for read_file function
Date: Wed, 25 Jun 2025 08:34:05 +0100
Message-ID: <20250625073408.7496-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625073408.7496-1-frediano.ziglio@cloud.com>
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use more explicit goto statements to handle common error code
path instead of a lot of if/else.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 80 +++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b6ce3a0257..fa61da4931 100644
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
 
 #pragma pack(1)
-- 
2.43.0


