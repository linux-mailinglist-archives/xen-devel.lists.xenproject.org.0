Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95201644FDF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 00:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455717.713273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2hoX-0000hg-Cl; Tue, 06 Dec 2022 23:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455717.713273; Tue, 06 Dec 2022 23:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2hoX-0000fw-9s; Tue, 06 Dec 2022 23:57:29 +0000
Received: by outflank-mailman (input) for mailman id 455717;
 Tue, 06 Dec 2022 23:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2hoW-0000fq-Hr
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 23:57:28 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9f103a6-75c1-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 00:57:26 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 939C332009EE;
 Tue,  6 Dec 2022 18:57:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 06 Dec 2022 18:57:21 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 18:57:19 -0500 (EST)
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
X-Inumbo-ID: b9f103a6-75c1-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1670371040; x=
	1670457440; bh=74tFtoc2xdgaWldrUmrrZlyEh7aah/d9NCutqcAeZ6E=; b=L
	6jUePHclGI1J7+c+K6GQFpqyjL4g1lbeZc55oXk7MgatDGT+kTMiphSrPdZG05k5
	WlnacG/OvlKjwGgdhpzA/lrNXq7A3TQflBM3NN8YdUpGZVPPxLKMmfc1afCFIyvY
	POoe28zSiGJN8x1+Ly3gzAezsSIrAQm9kBVqwM8dnAbYW9VUYOTmj0DvyAendVSd
	QwUtemSjkckhr5fQRBaq2yg6KLPHqc94Ey6e6EkKaxi7EMp6W/LffaLYwlD4M3uF
	S4UVllVqVzgPNa4/1LchK1eJm8OOGaXjBP3uTAmTv7NY5lXzdL6yyBM0bH//mdkg
	mc21wS3XekoH2AN6mK3Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1670371040; x=1670457440; bh=74tFtoc2xdgaWldrUmrrZlyEh7aah/d9NCu
	tqcAeZ6E=; b=cRnYkeZYzNTecnlsftgyYbJlPkLGzYpn9eKtcBQ44PzynwZQYip
	cm3S8t5MojyfQiA+cKcCwd08aR2/vd3otJoPQuUeq1q/7+wl/zyYhwyKAkAHHm2F
	B8PGlr0HDKIHgn0Z/+LS0OINwnoYcDYKuEOUnl6Kv2GcAX5rF7vOST5N+c5OHMS8
	h1YsTKA6w5Ff0zu2EOJJ1DrzBc8Kpkdxcv6m3tVF1mNdq9RtznGwRKLS/+nTN8T1
	UQgvbeFLmfkoFfgZTDPOUA4zCwl1632wH2cJQomg7oN+KH7Xw/m/EBsnZwjSsVlv
	DAt0os3ZuK5313i1UobCqigmMt+HhUMIPzQ==
X-ME-Sender: <xms:39aPY8zueMo4IXzTmRSiwvJUEecO48TQABxporNrMbQ3mCFUtJhHag>
    <xme:39aPYwQRDzCLIZWoeid4tC4m64NtyHQJJ7oYIbdADtgVR23asTRFNWqGj38em2gU_
    qH8d9qA26lfWPY>
X-ME-Received: <xmr:39aPY-UuxB5nePlZKRutKgP7xzaUEMC1ktPuOEZkJCeyNELBzm7cSHsYAcn9h_k9FSCL5Qze9UVh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedvkefgffegkefhieejtdffkeeh
    hfelheefjeeutefgleeggfdtveeileenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:39aPY6ghqXEdNkGqFrKKY-83nFc1np51L0riHB2lFfopdpNDgSKHmg>
    <xmx:39aPY-AIZExkcbMqFkyQOQmY1X4N96nVulxSDTvC1ORq3hlYpZSJ9A>
    <xmx:39aPY7Kj91WoQm1OdvbFM7-hgMDWMq7pPtjS3XnGM9hiiqs4gEMX0A>
    <xmx:4NaPY0DkLnr5powfyFqscg2Rh83r6EMO-QoTNpHn4eCSDbHBRsVO-g>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] Validate EFI memory descriptors
Date: Tue,  6 Dec 2022 18:57:08 -0500
Message-Id: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that these can be invalid in various ways.  Based on code
Ard Biesheuvel contributed for Linux.

Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 xen/common/efi/boot.c    | 11 +++++------
 xen/common/efi/efi.h     | 14 ++++++++++++++
 xen/common/efi/runtime.c | 13 ++++++-------
 xen/include/xen/types.h  |  1 +
 4 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b3de1011ee58a67a82a94da050eb1343f4e37faa..dd0376fdf930c2fee35e79a2f2821361c5e15d33 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -591,15 +591,14 @@ static UINTN __initdata esrt = EFI_INVALID_TABLE_ADDR;
 
 static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
 {
-    size_t available_len, len;
+    UINT64 available_len, len = efi_memory_descriptor_len(desc);
     const UINTN physical_start = desc->PhysicalStart;
     const EFI_SYSTEM_RESOURCE_TABLE *esrt_ptr;
 
-    len = desc->NumberOfPages << EFI_PAGE_SHIFT;
     if ( esrt == EFI_INVALID_TABLE_ADDR )
-        return 0;
+        return 0; /* invalid ESRT */
     if ( physical_start > esrt || esrt - physical_start >= len )
-        return 0;
+        return 0; /* ESRT not in this memory region */
     /*
      * The specification requires EfiBootServicesData, but also accept
      * EfiRuntimeServicesData (for compatibility with buggy firmware)
@@ -609,10 +608,10 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
     if ( (desc->Type != EfiRuntimeServicesData) &&
          (desc->Type != EfiBootServicesData) &&
          (desc->Type != EfiACPIReclaimMemory) )
-        return 0;
+        return 0; /* memory region cannot contain ESRT */
     available_len = len - (esrt - physical_start);
     if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
-        return 0;
+        return 0; /* ESRT header does not fit in memory region */
     available_len -= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
     esrt_ptr = (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
     if ( (esrt_ptr->FwResourceVersion !=
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c9aa65d506b14de69c90b6538c934747fcf0fb80..f4875138415c23eac42616131a738b7f8e33e56b 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -51,3 +51,17 @@ void free_ebmalloc_unused_mem(void);
 
 const void *pe_find_section(const void *image_base, const size_t image_size,
                             const CHAR16 *section_name, UINTN *size_out);
+
+static inline UINT64
+efi_memory_descriptor_len(const EFI_MEMORY_DESCRIPTOR *desc)
+{
+    uint64_t remaining_space = UINT64_MAX - desc->PhysicalStart;
+
+    if ( desc->PhysicalStart & (EFI_PAGE_SIZE - 1) )
+        return 0; /* misaligned start address */
+
+    if ( desc->NumberOfPages > (remaining_space >> EFI_PAGE_SHIFT) )
+        return 0; /* too big */
+
+    return desc->NumberOfPages << EFI_PAGE_SHIFT;
+}
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 13b0975866e3a80c46a7e37788012a716a455b6a..b99de230a5464c46b0b6c19b073685b4e0298343 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -270,18 +270,17 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
         for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
         {
             EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
-            u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
+            uint64_t size, len = efi_memory_descriptor_len(desc);
 
             if ( info->mem.addr >= desc->PhysicalStart &&
-                 info->mem.addr < desc->PhysicalStart + len )
+                 info->mem.addr - desc->PhysicalStart < len )
             {
                 info->mem.type = desc->Type;
                 info->mem.attr = desc->Attribute;
-                if ( info->mem.addr + info->mem.size < info->mem.addr ||
-                     info->mem.addr + info->mem.size >
-                     desc->PhysicalStart + len )
-                    info->mem.size = desc->PhysicalStart + len -
-                                     info->mem.addr;
+                size = desc->PhysicalStart + len - info->mem.addr;
+                if ( info->mem.size > size )
+                    info->mem.size = size;
+
                 return 0;
             }
         }
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 03f0fe612ed96118614505c39d0e33b946288d6c..255f5a3c91c6be3e8ba4584902563c11bee7f98d 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -25,6 +25,7 @@
 #define UINT8_MAX       (255)
 #define UINT16_MAX      (65535)
 #define UINT32_MAX      (4294967295U)
+#define UINT64_MAX      (0xFFFFFFFFFFFFFFFFULL)
 
 #define INT_MAX         ((int)(~0U>>1))
 #define INT_MIN         (-INT_MAX - 1)
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

