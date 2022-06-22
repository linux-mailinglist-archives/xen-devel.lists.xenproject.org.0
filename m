Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A2554002
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 03:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353422.580356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3p6D-0006JC-Sy; Wed, 22 Jun 2022 01:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353422.580356; Wed, 22 Jun 2022 01:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3p6D-0006GR-Q0; Wed, 22 Jun 2022 01:24:05 +0000
Received: by outflank-mailman (input) for mailman id 353422;
 Wed, 22 Jun 2022 01:24:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KR9/=W5=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o3p6B-0006GL-F0
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 01:24:03 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fce85ed1-f1c9-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 03:24:01 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3453F5C0172;
 Tue, 21 Jun 2022 21:23:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 21 Jun 2022 21:23:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jun 2022 21:23:56 -0400 (EDT)
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
X-Inumbo-ID: fce85ed1-f1c9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1655861037; x=1655947437; bh=y7SHRRSIRDbqIJG7VRoehYFyw4aX5XSOFLk
	h/fPAzBk=; b=Y0qqXqntAutVJCe1lmwsqYy+8HFFvSEDwpnxRauOVxZV6bl0R62
	iXplt//uBCMZyozPNZn37R8TVEP4gcJ9/PzlO1avv0iUwQJkm1bAbztznk/BW+c/
	tWcyX3/njNgytOemJ5NKVtHQuDh2GRxpb1UcxVPht1TRDv3SZkKXXlZ/eLAUxafu
	TIVjlrm5Q+xhTDrbpgrC6ycVQXUWm8MWQKCvHwwRqYO9jDV/wb/4AxmTEDTj6WuB
	XFfgsDoty0QxV/GIuAWfLdSyKXaVUrZLQ7eaDEfVVsnn8XyBy/G3yIqGGEtAsA4g
	9hLSE8nLUnnQ4BXmQclBgxC3RHriSZI2tDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1655861037; x=1655947437; bh=y7SHRRSIRDbqI
	JG7VRoehYFyw4aX5XSOFLkh/fPAzBk=; b=rWBDBfNeruRQfDp1HiPQeEfy4Z1vP
	pJ31Pj2ohAIfFUqGuLjF1rND5P6PI4vk5LS0RbpK/sflSrx0d7o4Y6sECbTaObHM
	72d3c1JipKqRgpoEuwDslCJCP+CHPrdUpPs8UjAZFruMceU/FIbpRRFAy4bx4ODy
	I68aMPgEyOxQAUPGMCwUmHCvhqJN4zSNR9eElu9s4EJv694Uk1BLDABF4Nb9N3XM
	S0AFUvofw7oJyAUkwoIg5nDMMg8MlxBmCjnqaiuRwm96Tu0t4PvVTspooRHLEOnf
	NbOqPJPsSl5Lh0dJmQnWZsLsa+dsIfpRDDiUv63xl2vpIMzoP8ORzv2BQ==
X-ME-Sender: <xms:LG-yYrCky2D3OWthiT3XFGE-YiY0y1_vU-nm9lt9mZ_qlyQqIVovUQ>
    <xme:LG-yYhhb4eYIpM5K0-99QCDiSflVfmKlnjeOww_lWngWkVnlMWJNzGs-Du_y4pYTt
    5jQKKN9U06YWLY>
X-ME-Received: <xmr:LG-yYmmxS4dom-FcTiI7sGWdpHNb9M5A7r2kFPGfgUTGC4cDKpH2THe-FPnWS3NWit5FlArybHRN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekieeljeeutefgieejfffglefhieet
    veffleefudefjeegleejvdelvdefueffveenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:LW-yYtxLTnxmIzhG5IT7lfCRdlA72TfHqxunph3FS4h1q-Y7O2Lyqw>
    <xmx:LW-yYgS5kTjSOs7KT8S4shdOtfWfIeqa5equ1rLTnQipnQeZN4M-UQ>
    <xmx:LW-yYgb724olnXg5n82nuD0HadK1tkayQWo01ORV29wfv7W7EO1uGg>
    <xmx:LW-yYp4ybHdvX2ClISNDpOdiES5x4Q5gFX7QrWogLtD-Js1pZ6NAFQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7] Preserve the EFI System Resource Table for dom0
Date: Tue, 21 Jun 2022 21:23:39 -0400
Message-Id: <7b2f97eda968d6db368c605ff0350d732554c39b.1655860720.git.demi@invisiblethingslab.com>
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
 xen/common/efi/boot.c | 133 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..593962c42c 100644
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
@@ -1051,6 +1110,62 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
 #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
 
+static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
+{
+    EFI_STATUS status;
+    UINTN info_size = 0, map_key;
+    unsigned int i;
+    void *memory_map = NULL;
+
+    for (;;) {
+        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
+                                      &efi_mdesc_size, &mdesc_ver);
+        if ( status == EFI_SUCCESS && memory_map != NULL )
+            break;
+        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL ) {
+            info_size *= 2;
+            if ( memory_map != NULL )
+                efi_bs->FreePool(memory_map);
+            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
+            if ( status == EFI_SUCCESS )
+                continue;
+        }
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
+            return; /* ESRT already safe from reuse */
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
+}
+
 static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     EFI_STATUS status;
@@ -1067,6 +1182,13 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     if ( !efi_memmap )
         blexit(L"Unable to allocate memory for EFI memory map");
 
+    status = SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
+                                                     efi_memmap, &map_key,
+                                                     &efi_mdesc_size,
+                                                     &mdesc_ver);
+    if ( EFI_ERROR(status) )
+        PrintErrMesg(L"Cannot obtain memory map", status);
+
     for ( retry = false; ; retry = true )
     {
         efi_memmap_size = info_size;
@@ -1413,6 +1535,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     if ( gop )
         efi_set_gop_mode(gop, gop_mode);
 
+    efi_relocate_esrt(SystemTable);
+
     efi_exit_boot(ImageHandle, SystemTable);
 
     efi_arch_post_exit_boot(); /* Doesn't return. */
@@ -1753,3 +1877,12 @@ void __init efi_init_memory(void)
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

