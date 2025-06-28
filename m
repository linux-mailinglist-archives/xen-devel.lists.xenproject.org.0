Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E90AEC563
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 08:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028173.1402331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVPKj-0005KL-OK; Sat, 28 Jun 2025 06:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028173.1402331; Sat, 28 Jun 2025 06:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVPKj-0005Ik-GO; Sat, 28 Jun 2025 06:46:41 +0000
Received: by outflank-mailman (input) for mailman id 1028173;
 Sat, 28 Jun 2025 06:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vJ7=ZL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uVPKi-0005Ie-2v
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 06:46:40 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1088e74-53eb-11f0-b894-0df219b8e170;
 Sat, 28 Jun 2025 08:46:34 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so217060f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 23:46:33 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80b50bsm4506375f8f.42.2025.06.27.23.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 23:46:32 -0700 (PDT)
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
X-Inumbo-ID: a1088e74-53eb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751093192; x=1751697992; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ow9uK6vnAdJJy0Mj/oldGRR5lyMmniaKiPz0dy9nDSI=;
        b=IRfLhTrEx6mw0pgIEQEpp8G/f7ehlHtcGJDwjCn3BnHmMCDyC0kd5UAMjg+h56Gq3b
         nbCTRY1uO9GWsbA7lR7RY9zbZ5TgRkAmx/4i08Ll2Dp4ExiaFMSeNk5EvuOx1FVQPyZG
         ftAuvk0Wb429h9XhOnH/eVkm2jBFQSlyBvgII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751093193; x=1751697993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow9uK6vnAdJJy0Mj/oldGRR5lyMmniaKiPz0dy9nDSI=;
        b=l2jyoF2YlPNUDUNlHcD7YPJiNnDYsmdhaRHZiTk/lPCSC6hJD4RgbOkRdZUmEiMcjZ
         ElizqvyOOI2mpkDxgd1PVuhBZltubTpelaLcjXGtWTb5otUpRp52d0RuWZmavymF/YyA
         NcXyismLZYrBS9+8YKHs8v5iwuURplWYc/FXsVcsWYWeuq64m1caePwQJSwPcVmUXGjS
         S81Bt7F4T2dltqGvBPojiASl7jZcqBQzpE2y1Tdcz1FygOOD/HZyScK5INu/gl+ujoKi
         2jK4qAkkFo/Ym/Jz1ChGhEG6j12A+ZDTpEfyM38w2R44G2zBE/VkchypKq6B1PLfdLi4
         IEHQ==
X-Gm-Message-State: AOJu0YxDtr0A3PX+0Uzb9f5AEpoGgYuYfSN62ZpGv2Xl3XqccpmpkPeQ
	qSTRMV3wNihST13UFYMH1P38/HPt8TQhBRgYusUA226iP1G5RzXFzYFEAV2Cr3VnFwc/xbxbUER
	Zj6XG2DY=
X-Gm-Gg: ASbGncsoWaHT4jFzs8jgNZLcPl6vnFf1kRtSjtjspnyMLsD4UiT+DSpnFUNfLCu8Auo
	sAygMikIkPXywSVIL1nmq8EqESBe4sriF6vIhFcBSPAv3Hs614j+LweJmLyTLFVjOBlDyp8WIbt
	zEq7Dwh3/ocRiy7/++rwY+Mppllf3u2btuv7NSWaRoFKgs+SFVjySp4Vkouxz8nlQYTqhoZGcJL
	ZJPDh0soWqkXinjZc4qcLJP57vmwMeZPk4vmLYD39nePbYgFVP/gTRCecwKFvW9BnHMeG55wLWw
	T/rTipMy3n8Boj2gFgirlAGXx5JnRocfRxTKd2SyYghg4ZrDyhhZ27IniUO/av2GnH35GA/OqYQ
	FIZN0i1Q5+U6Qv3y5uGmo00nzhA3skA==
X-Google-Smtp-Source: AGHT+IGsT4qU7r69IPWDvVCaRs1obowz3Sw1fw2t2kepVAmQpnEnqRrEfif3OhNQ8SuvkIwQb/qI0w==
X-Received: by 2002:a05:6000:250f:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3a8ffcca8b2mr5864226f8f.55.1751093192582;
        Fri, 27 Jun 2025 23:46:32 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] xen/efi: Update error flow for read_file function
Date: Sat, 28 Jun 2025 07:46:18 +0100
Message-ID: <20250628064630.2222323-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use more explicit goto statements to handle common error code
path instead of a lot of if/else.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Change since v4:
- fixed label indentation.
---
 xen/common/efi/boot.c | 80 +++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9306dc8953..1019de6950 100644
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
+ fail:
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
 
 static bool __init read_section(const EFI_LOADED_IMAGE *image,
-- 
2.43.0


