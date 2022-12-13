Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B564C03A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 00:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461464.719565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ELg-000483-R2; Tue, 13 Dec 2022 23:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461464.719565; Tue, 13 Dec 2022 23:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ELg-00045K-Mc; Tue, 13 Dec 2022 23:06:08 +0000
Received: by outflank-mailman (input) for mailman id 461464;
 Tue, 13 Dec 2022 23:06:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5ELf-00044C-QY
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 23:06:07 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f84edd-7b3a-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 00:06:03 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 35419320079B;
 Tue, 13 Dec 2022 18:06:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 13 Dec 2022 18:06:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 18:06:00 -0500 (EST)
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
X-Inumbo-ID: b6f84edd-7b3a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1670972760; x=
	1671059160; bh=l9in6W1y9JfHnZdCgIaroaKvCryg4beZ3lAXpT8+2CM=; b=T
	QA3mIgoKHz1RzItf4sf2YefE8oDeKJPyJbAjZ15Ot1Lg5FZpQgaIK/jS6JEEN8gy
	xhc6hsx6AcI0Mx85/MCoDD/BGf3/fBwttSzwYSAwAvB76/tcLwMGGI7TsMKAQIh0
	BUJ1pEedljk0vVlzQBkn5rDHgx+cJca4GsUfzB0cVO1hgHmuQqTATQywZxZDixys
	65/dFLTPmsr/rwdzLo/7LAhZVLoCUzAx4id9QiUtIc1vXnm0ocm3silYojCnD847
	fn4q3dIdFIG29MStDvJGGyODeij4dEXQjRBC9P4+Jqj7BAD8Sra/3llry3xiNmRJ
	B/iIZva06EXGLKoQCwEdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1670972760; x=1671059160; bh=l9in6W1y9JfHnZdCgIaroaKvCryg4beZ3lA
	XpT8+2CM=; b=PWiaqJurpSo8d5WZdNQaNvRayLFMrVUnWENi2+f9JRTU/ZW1I0d
	qrsHJMb7PDQ3mVTLDwuNdImkadPM37+spVx/4KIYu0BTi7KBOCGZ746KpSdAJOD4
	dBvZKvQ6zxH9MqbjIkztUoOzZVYZCGNZFjkRWgscPbhvxqWuCqcKuQxpEeky31LZ
	cLwlNMkzhs/wQ9G3+/d66YlgUGsUvoIsNqSJVcH33oJEQ/E8UcnVqH17BT+ef+4a
	Si4KEUsRvI4jHHXrhqmdL86d4MzRhbvj1ePP8us5pCokn08MU5HKTZqOEv3DFRs4
	EgFt4lumSD882mrpiu8YMcCBsmaWLm3v2Sw==
X-ME-Sender: <xms:WAWZYx-ezqaldiSXd5QFDxSjWG7g1UvwpLP6T6HqFKUMSwCIoqlQZA>
    <xme:WAWZY1tJk5ZWWTSXTwjOqmVcxW1tjsCsMIRzB-boO93JBNoUdBBIjqt807N_nTDVR
    -gcv6YWRI3nPW0>
X-ME-Received: <xmr:WAWZY_BV4vHCn2cfsdVUh5qTeAE-DZ5KZ6jcVEzqhnq1HIzpHLhR66EBZTVYZ805EtUibYzZxNn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedvkefgffegkefhieejtdffkeeh
    hfelheefjeeutefgleeggfdtveeileenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:WAWZY1ejt_TSNWTFos7haUK0ZfbsC7j1wrhZkBOQ98S2RysViY7RyQ>
    <xmx:WAWZY2N6aHEIC9pFzNhRqM6Zmaj64MxDTsHZdnTLv0CPch7M-bDZGQ>
    <xmx:WAWZY3mqm1VpjeMJIy7-v-UA0DitnjLtQDQXG_FbPAbmxqamunCzPw>
    <xmx:WAWZY40iCVoMg43791EA5Epnp8V-bVoJnrqsINEmbBMBo0NGDLXNSA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] efi: Relocate the ESRT when booting via multiboot2
Date: Tue, 13 Dec 2022 18:03:20 -0500
Message-Id: <a7336c832b0276a1bc7692c537cc14f6e70d65a4.1670972544.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was missed in the initial patchset.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/efi/efi-boot.h |   2 +
 xen/common/efi/boot.c       | 136 ++++++++++++++++++------------------
 2 files changed, 70 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index abfc7ab0f31511e2c1ee402a09ac533d260444b2..a9a2991d6462dec9cea695c8b912b72df26bd511 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -825,6 +825,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
     if ( gop )
         efi_set_gop_mode(gop, gop_mode);
 
+    efi_relocate_esrt(SystemTable);
+
     efi_exit_boot(ImageHandle, SystemTable, true);
 }
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 32ae6b43bb53448421c908819cda552757157c1f..ea5f010df1c5ce40fb67a91fdbfe28f40865252c 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -625,6 +625,74 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
     return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
 }
 
+static EFI_GUID __initdata esrt_guid = EFI_SYSTEM_RESOURCE_TABLE_GUID;
+
+static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
+{
+    EFI_STATUS status;
+    UINTN info_size = 0, map_key, mdesc_size;
+    void *memory_map = NULL;
+    UINT32 ver;
+    unsigned int i;
+
+    for ( ; ; )
+    {
+        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
+                                      &mdesc_size, &ver);
+        if ( status == EFI_SUCCESS && memory_map != NULL )
+            break;
+        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL )
+        {
+            info_size += 8 * mdesc_size;
+            if ( memory_map != NULL )
+                efi_bs->FreePool(memory_map);
+            memory_map = NULL;
+            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
+            if ( status == EFI_SUCCESS )
+                continue;
+            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
+        }
+        else
+            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n");
+        return;
+    }
+
+    /* Try to obtain the ESRT.  Errors are not fatal. */
+    for ( i = 0; i < info_size; i += mdesc_size )
+    {
+        /*
+         * ESRT needs to be moved to memory of type EfiACPIReclaimMemory
+         * so that the memory it is in will not be used for other purposes.
+         */
+        void *new_esrt = NULL;
+        const EFI_MEMORY_DESCRIPTOR *desc = memory_map + i;
+        size_t esrt_size = get_esrt_size(desc);
+
+        if ( !esrt_size )
+            continue;
+        if ( desc->Type == EfiRuntimeServicesData ||
+             desc->Type == EfiACPIReclaimMemory )
+            break; /* ESRT already safe from reuse */
+        status = efi_bs->AllocatePool(EfiACPIReclaimMemory, esrt_size,
+                                      &new_esrt);
+        if ( status == EFI_SUCCESS && new_esrt )
+        {
+            memcpy(new_esrt, (void *)esrt, esrt_size);
+            status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
+            if ( status != EFI_SUCCESS )
+            {
+                PrintErr(L"Cannot install new ESRT\r\n");
+                efi_bs->FreePool(new_esrt);
+            }
+        }
+        else
+            PrintErr(L"Cannot allocate memory for ESRT\r\n");
+        break;
+    }
+
+    efi_bs->FreePool(memory_map);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -903,8 +971,6 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     return gop_mode;
 }
 
-static EFI_GUID __initdata esrt_guid = EFI_SYSTEM_RESOURCE_TABLE_GUID;
-
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -1113,72 +1179,6 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
 #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
 
-static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
-{
-    EFI_STATUS status;
-    UINTN info_size = 0, map_key, mdesc_size;
-    void *memory_map = NULL;
-    UINT32 ver;
-    unsigned int i;
-
-    for ( ; ; )
-    {
-        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
-                                      &mdesc_size, &ver);
-        if ( status == EFI_SUCCESS && memory_map != NULL )
-            break;
-        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL )
-        {
-            info_size += 8 * mdesc_size;
-            if ( memory_map != NULL )
-                efi_bs->FreePool(memory_map);
-            memory_map = NULL;
-            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
-            if ( status == EFI_SUCCESS )
-                continue;
-            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
-        }
-        else
-            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n");
-        return;
-    }
-
-    /* Try to obtain the ESRT.  Errors are not fatal. */
-    for ( i = 0; i < info_size; i += mdesc_size )
-    {
-        /*
-         * ESRT needs to be moved to memory of type EfiACPIReclaimMemory
-         * so that the memory it is in will not be used for other purposes.
-         */
-        void *new_esrt = NULL;
-        const EFI_MEMORY_DESCRIPTOR *desc = memory_map + i;
-        size_t esrt_size = get_esrt_size(desc);
-
-        if ( !esrt_size )
-            continue;
-        if ( desc->Type == EfiRuntimeServicesData ||
-             desc->Type == EfiACPIReclaimMemory )
-            break; /* ESRT already safe from reuse */
-        status = efi_bs->AllocatePool(EfiACPIReclaimMemory, esrt_size,
-                                      &new_esrt);
-        if ( status == EFI_SUCCESS && new_esrt )
-        {
-            memcpy(new_esrt, (void *)esrt, esrt_size);
-            status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
-            if ( status != EFI_SUCCESS )
-            {
-                PrintErr(L"Cannot install new ESRT\r\n");
-                efi_bs->FreePool(new_esrt);
-            }
-        }
-        else
-            PrintErr(L"Cannot allocate memory for ESRT\r\n");
-        break;
-    }
-
-    efi_bs->FreePool(memory_map);
-}
-
 static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable, bool exit_boot_services)
 {
     EFI_STATUS status;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

