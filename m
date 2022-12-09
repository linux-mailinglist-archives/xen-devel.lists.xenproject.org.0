Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE5647AFF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 01:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457528.715463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3RdK-00017V-JV; Fri, 09 Dec 2022 00:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457528.715463; Fri, 09 Dec 2022 00:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3RdK-00014Y-GG; Fri, 09 Dec 2022 00:52:58 +0000
Received: by outflank-mailman (input) for mailman id 457528;
 Fri, 09 Dec 2022 00:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKBv=4H=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p3RdJ-00014S-3B
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 00:52:57 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cee85e35-775b-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 01:52:54 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AF575C00EA;
 Thu,  8 Dec 2022 19:52:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 08 Dec 2022 19:52:51 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 19:52:50 -0500 (EST)
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
X-Inumbo-ID: cee85e35-775b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1670547171; x=
	1670633571; bh=b+mQQGjkJqOEa18OhOwv9drfN9NGE48HmIku6h2VZUE=; b=G
	MXouadP7+jx9fRs3IONc/k7bwRpY3VDDQAyVBUwRs+v/l+DWlRqWhQ0CRLJLjoUW
	qNl5KY31mVS23JmS3QyO8HBv6X2oiMz/vVVEhPNNWSwBPcHLnUFmEaop4TwQfR2i
	QP1oWCpcPujbyY7Xeyowc+Unk3ELdHAphqItnhMYvyzFUfOerDY911mZic2KzBNc
	B/UVvyhU47BGnDYMIuRive+KR68h0+6EFPzbg9g+TZEdOKQpK8BzZli+diCphiHj
	MVD+RmriQry7uD6A3CXUwGvVTHbQ30+oYLd3W1qsVmzlpxMM4F4HHVp/3KmIB3jB
	utYxeiak3Nwtx8gDJ+30w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1670547171; x=1670633571; bh=b+mQQGjkJqOEa18OhOwv9drfN9NGE48HmIk
	u6h2VZUE=; b=mRG7Xvbm1GEZQjji6B8zhdbzDgBLU8O6Z9f6cA07gPYodOEorem
	tYwiGtwTfz90x2C0TqprP7Y+isGyDAODjDIIKF3L3nKFo6Tlsymg00cLfFNHHsLz
	nHxA1GIVPLbnHCNwwVqGFXoUKEZabWkLka+yOiJVn+WnGQR0suDw2J73o9KFa7p0
	P2P43GjrY4hpMUkz70FACew3Rl5pwLj2Nz1XLxSGhIY2n/02RMXcVatg6sgcDu5l
	XVEzul4kt64snSQhSbCnEn0lC94wBt13/cMfMJ2mePDw6l5sBL6PfShqqBtbl5xz
	Z39b4YIGWS3CAj1pkS3GLWZuPGGo/55tHGg==
X-ME-Sender: <xms:4oaSYwawQVIEgweRYgqX8J0t4o43Z3QG1mT_4kb-Eew7dk0mOtN8Xw>
    <xme:4oaSY7Zym8tvjLS-ACxtePTMCe4aKdJ0jbayOrrBfuxyiBh-ZuhtTb5cTG_o8yaPT
    yX5RG-mKyfa4y8>
X-ME-Received: <xmr:4oaSY6-zZ-XU_GgmWc5sNDH92s0A36lgtNSdanjCq35WgDqLjx0DGBCVfoW7ZChJj9yXmBHwN979>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedvkefgffegkefhieejtdffkeeh
    hfelheefjeeutefgleeggfdtveeileenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:4oaSY6onzoSCBNaUhcDiFlJ1MoYbgOw30MDUCvIny5A0Kwq5wJVIHg>
    <xmx:4oaSY7pjZfw5EWsnUOBmpc_qvix2VU2BRh4XrfXCbwAGf9kCn-rVGA>
    <xmx:4oaSY4QuI0sfX0Frn2gXJ3PPVsJeAhgdo5Rw2IiY-tjZO-3d92HERg>
    <xmx:44aSY8kDIpmpUhRmfnNwaEwcqfpC1yuP1KYmlSEmAh4ouLQQHkKl_w>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Relocate the ESRT when booting via multiboot2
Date: Thu,  8 Dec 2022 19:52:46 -0500
Message-Id: <74145e57307e9b35cbdc296b22241e6f36405f6a.1670546744.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was missed in the initial patchset.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
I consider this to be a bug fix, and would prefer this to be included in
the 4.17 release series, even though I understand if this is too late
for 4.17 itself.

 xen/arch/x86/efi/efi-boot.h |   2 +
 xen/common/efi/boot.c       | 134 ++++++++++++++++++------------------
 2 files changed, 69 insertions(+), 67 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 51967f6c3d5cd06b6b50bac06c1b8762cd0f7856..20a42a66dd2b93f3cd2be0230a372767a8763ed5 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -818,6 +818,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
     if ( gop )
         efi_set_gop_mode(gop, gop_mode);
 
+    efi_relocate_esrt(SystemTable);
+
     efi_exit_boot(ImageHandle, SystemTable);
 }
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 7a97c64884bf55a012cfb8bd7ad56ddfc1e43e66..93939ca61d28717d29aaa0289262c55558dfe944 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -622,6 +622,73 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
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
+         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
+         * so that the memory it is in will not be used for other purposes.
+         */
+        void *new_esrt = NULL;
+        size_t esrt_size = get_esrt_size(memory_map + i);
+
+        if ( !esrt_size )
+            continue;
+        if ( ((EFI_MEMORY_DESCRIPTOR *)(memory_map + i))->Type ==
+             EfiRuntimeServicesData )
+            break; /* ESRT already safe from reuse */
+        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
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
@@ -900,8 +967,6 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     return gop_mode;
 }
 
-static EFI_GUID __initdata esrt_guid = EFI_SYSTEM_RESOURCE_TABLE_GUID;
-
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -1110,71 +1175,6 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
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
-         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
-         * so that the memory it is in will not be used for other purposes.
-         */
-        void *new_esrt = NULL;
-        size_t esrt_size = get_esrt_size(memory_map + i);
-
-        if ( !esrt_size )
-            continue;
-        if ( ((EFI_MEMORY_DESCRIPTOR *)(memory_map + i))->Type ==
-             EfiRuntimeServicesData )
-            break; /* ESRT already safe from reuse */
-        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
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
 static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     EFI_STATUS status;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

