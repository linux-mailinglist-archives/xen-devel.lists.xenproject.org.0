Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797E655A092
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 20:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355814.583719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nsb-0002w3-BG; Fri, 24 Jun 2022 18:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355814.583719; Fri, 24 Jun 2022 18:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nsb-0002tU-7m; Fri, 24 Jun 2022 18:18:05 +0000
Received: by outflank-mailman (input) for mailman id 355814;
 Fri, 24 Jun 2022 18:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRPZ=W7=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o4nsZ-0002tO-7i
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 18:18:03 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9fa3af0-f3e9-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 20:18:00 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C9C95C01A0;
 Fri, 24 Jun 2022 14:17:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Jun 2022 14:17:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 14:17:57 -0400 (EDT)
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
X-Inumbo-ID: f9fa3af0-f3e9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1656094678; x=1656181078; bh=vnurcusEhgyC4dR6+iI9H+tDoKix9EjEeCm
	OSiLvxHA=; b=cazAEJZnNo4qBknCaAZ0w+YvUiAlM4zedIp5OAdbnLaFoK/qDec
	l4KmTuwTRMBrrTCoN3rf1S7XmtmYXCtyETu9ezm2pqwA5MSwQ982biQLIbmdp2GQ
	bAqfVeof1xiIV5Esxu3nRG5kzonCXaD87BGe/dGa5qPHXFm0/+YsPsNsVpMb3ZCz
	83HFszuYPe/mjml1PbJv3OW+uX3ctEF0/Zgc7UMGMyFFFHQIJ0HhsqRzQKlzQU3b
	l/xNwi5pxOv+9LUWuNVO6emCm+sQmOFh8sCspWTucrF0MGXHNRcNyYhKiMp7BDk0
	g48fBauuycXh6djbCeGjjUqeMioMItzMk2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656094678; x=1656181078; bh=vnurcusEhgyC4
	dR6+iI9H+tDoKix9EjEeCmOSiLvxHA=; b=vcszBaX5nhoLpxwHYv9MMQqCVoq0E
	6JM+v3VeAEmiNBR08tIFOpwCw+UhzZ5dGm3+HRtSKMm0iWjMu1No8Om2/X5WLoVZ
	haoCsU4yPPZ2YWsoi+w1G2l8Xo3uUNJxOof6T/M9cINFxIP5vb0ROIj4oNVZrSd4
	ICremnn8suQ6+aayo30zQrpVQDqA0cupYP20CJ05CZC76uXOva4YFEG1Qz+l4zPJ
	3aEMr7Yth0HRFEbWQe8LwNGxSvcVTHcIxaFwB8I9Ia+eolrHIXJZ2U7CABvwZ19j
	h2nXaQFseeVD36v5G6x0Sxxkw4MzzY3eV6jRlLdi0KJ2ryMch1WjGUTNw==
X-ME-Sender: <xms:1v-1YkZSG5yJ_LsvnLXxtTjs710cdDlCl50tY0Xiz3BVb8_pcU3JLw>
    <xme:1v-1YvYHC9jCa7dUV9ZSjSojVcoTUWOXenotBzn5vIeymEjpa5_dYDd2BmtPvvRf9
    xXvNwNKVd3SqQk>
X-ME-Received: <xmr:1v-1Yu-_AYgyA8fMFzUz1c9sg8zO_gBdOO9sNQqv67FmP8FbGxUU74C_-LxALr7FFJxT4vu_UMYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeeileejueetgfeijeffgfelhfei
    teevffelfedufeejgeeljedvledvfeeuffevnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1v-1YureZvKimR1EqMoaGxMoxsuycq3oFzIFkdrwU6_jxgARnEPbpg>
    <xmx:1v-1YvrpDkpi8ijhTqpWgjzPNbl6Lo2BnwbOoV-YknaAKC4mpWopLA>
    <xmx:1v-1YsTX7u2PccEZNMtMExi87u56z39f8cKTgEffTYtESRkZjh9K1Q>
    <xmx:1v-1YuRLR_V06K8mj-sDOxmU2IM5n3wkTWw0bnE-ERi61qOFQY8Ezg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8] Preserve the EFI System Resource Table for dom0
Date: Fri, 24 Jun 2022 14:17:32 -0400
Message-Id: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EFI System Resource Table (ESRT) is necessary for fwupd to identify
firmware updates to install.  According to the UEFI specification §23.4,
the ESRT shall be stored in memory of type EfiBootServicesData.  However,
memory of type EfiBootServicesData is considered general-purpose memory
by Xen, so the ESRT needs to be moved somewhere where Xen will not
overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
in memory of type EfiRuntimeServicesData.

Earlier versions of this patch reserved the memory in which the ESRT was
located.  This created awkward alignment problems, and required either
splitting the E820 table or wasting memory.  It also would have required
a new platform op for dom0 to use to indicate if the ESRT is reserved.
By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
does not need to be modified, and dom0 can just check the type of the
memory region containing the ESRT.  The copy is only done if the ESRT is
not already in EfiRuntimeServicesData memory, avoiding memory leaks on
repeated kexec.

See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
for details.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 134 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..f6f34aa816 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -39,6 +39,26 @@
   { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
   { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
+#define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
+  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
+#define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
+
+typedef struct {
+    EFI_GUID FwClass;
+    UINT32 FwType;
+    UINT32 FwVersion;
+    UINT32 LowestSupportedFwVersion;
+    UINT32 CapsuleFlags;
+    UINT32 LastAttemptVersion;
+    UINT32 LastAttemptStatus;
+} EFI_SYSTEM_RESOURCE_ENTRY;
+
+typedef struct {
+    UINT32 FwResourceCount;
+    UINT32 FwResourceCountMax;
+    UINT64 FwResourceVersion;
+    EFI_SYSTEM_RESOURCE_ENTRY Entries[];
+} EFI_SYSTEM_RESOURCE_TABLE;
 
 typedef EFI_STATUS
 (/* _not_ EFIAPI */ *EFI_SHIM_LOCK_VERIFY) (
@@ -567,6 +587,41 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
 }
 #endif
 
+static UINTN __initdata esrt = EFI_INVALID_TABLE_ADDR;
+
+static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
+{
+    size_t available_len, len;
+    const UINTN physical_start = desc->PhysicalStart;
+    const EFI_SYSTEM_RESOURCE_TABLE *esrt_ptr;
+
+    len = desc->NumberOfPages << EFI_PAGE_SHIFT;
+    if ( esrt == EFI_INVALID_TABLE_ADDR )
+        return 0;
+    if ( physical_start > esrt || esrt - physical_start >= len )
+        return 0;
+    /*
+     * The specification requires EfiBootServicesData, but accept
+     * EfiRuntimeServicesData, which is a more logical choice.
+     */
+    if ( (desc->Type != EfiRuntimeServicesData) &&
+         (desc->Type != EfiBootServicesData) )
+        return 0;
+    available_len = len - (esrt - physical_start);
+    if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
+        return 0;
+    available_len -= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
+    esrt_ptr = (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
+    if ( (esrt_ptr->FwResourceVersion !=
+          EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION) ||
+         !esrt_ptr->FwResourceCount )
+        return 0;
+    if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->Entries[0]) )
+        return 0;
+
+    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
+}
+
 /*
  * Include architecture specific implementation here, which references the
  * static globals defined above.
@@ -845,6 +900,8 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     return gop_mode;
 }
 
+static EFI_GUID __initdata esrt_guid = EFI_SYSTEM_RESOURCE_TABLE_GUID;
+
 static void __init efi_tables(void)
 {
     unsigned int i;
@@ -868,6 +925,8 @@ static void __init efi_tables(void)
             efi.smbios = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
             efi.smbios3 = (unsigned long)efi_ct[i].VendorTable;
+        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
+            esrt = (UINTN)efi_ct[i].VendorTable;
     }
 
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
@@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
 #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
 
+static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
+{
+    EFI_STATUS status;
+    UINTN info_size = 0, map_key, mdesc_size;
+    void *memory_map = NULL;
+    UINT32 ver;
+    unsigned int i;
+
+    for ( ; ; ) {
+        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
+                                      &mdesc_size, &ver);
+        if ( status == EFI_SUCCESS && memory_map != NULL )
+            break;
+        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL )
+        {
+            info_size += 8 * efi_mdesc_size;
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
+    for ( i = 0; i < info_size; i += efi_mdesc_size )
+    {
+        /*
+         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
+         * so that the memory it is in will not be used for other purposes.
+         */
+        void *new_esrt = NULL;
+        size_t esrt_size = get_esrt_size(efi_memmap + i);
+
+        if ( !esrt_size )
+            continue;
+        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type ==
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
 static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     EFI_STATUS status;
@@ -1413,6 +1536,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     if ( gop )
         efi_set_gop_mode(gop, gop_mode);
 
+    efi_relocate_esrt(SystemTable);
+
     efi_exit_boot(ImageHandle, SystemTable);
 
     efi_arch_post_exit_boot(); /* Doesn't return. */
@@ -1753,3 +1878,12 @@ void __init efi_init_memory(void)
     unmap_domain_page(efi_l4t);
 }
 #endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

