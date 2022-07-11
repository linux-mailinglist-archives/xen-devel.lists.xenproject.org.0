Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D404570E16
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 01:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365382.595491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB2cp-0001h9-Io; Mon, 11 Jul 2022 23:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365382.595491; Mon, 11 Jul 2022 23:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB2cp-0001eM-Fh; Mon, 11 Jul 2022 23:15:35 +0000
Received: by outflank-mailman (input) for mailman id 365382;
 Mon, 11 Jul 2022 23:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mgh=XQ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oB2cn-0001eG-Mf
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 23:15:34 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59750d7d-016f-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 01:15:30 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CFD185C00F0;
 Mon, 11 Jul 2022 19:15:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 19:15:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 19:15:26 -0400 (EDT)
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
X-Inumbo-ID: 59750d7d-016f-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1657581326; x=1657667726; bh=VpHo1/elHYA7pJhT0LGGpTpuB/rOsacRE8E
	VAl/NgDw=; b=aOYEeXkIZ4f7Rv/tI6ziCccK4tcxceynoNcXwPuqphsg/WWl62l
	k72UVgfUo7wGbiITZD/aqx+afvns0B6hgp+DD1VlBwa5PvcZcXM65Qa9bGniEX1X
	G9TcTAEW2zGZtPnMDTfB9LAlpIYh1SjbDQQ35rKCHhRDAjXBWIfTmowiIc7mS6U9
	kVb9C7eY6Qk+vxrSGEYk3fa+jpMgn7yW8cfeivOIFpd2w4/gZKGPxBICb8oB/Dg0
	+X/2nvb0q8X8AcjWhhSHn2Qz1ITnhVXZeNC3ZvsRR03lhje720tQ7SKsB3WEFPHi
	nu++SPSB2KW3i+SjrbfyzHjvYuD0LDzV7/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657581326; x=1657667726; bh=VpHo1/elHYA7p
	JhT0LGGpTpuB/rOsacRE8EVAl/NgDw=; b=KYieoxvrOLkWPMs1ehK7zEl4YWfur
	oFpTgMlcnqRG1MvdQTRXiRpfLMT/6Jm0nWu/3+WAMj5DEdT5G7+T8+d6AzAL8Z+0
	uLOFFE8KKJtxv3FwV4LemQzozTZzyLKZk7gqy+yGJr3+G3PNiR/e+yquZUK1qIlx
	os0TT73FUHOzQhutEhlOs1j43nqZrq77jmTtct6X/u19HmUUYJdbTna3cn7TuMi8
	wE1PrVBCKaS+ECJjar/2Ud/js6l0iXF4l3/lxCWLuC9KFly2FiY4daMRfIiaAUXp
	M0GhAJA+8N7MbK4PIO7HSpsk28xHBhHwfTO4upl06ou7Z1/70LVcHH1NA==
X-ME-Sender: <xms:Dq_MYipDFl0WZvfZdCdJT04mJH9fBSeVvzJt8NGWonbqKyqIfkkvhQ>
    <xme:Dq_MYgpxgEEo3_9qLVfemptB87zLzaC_QCnX1iqEmc43jMTNVY7M5r28TS-tjkByi
    mcu1yfoPDpOvBo>
X-ME-Received: <xmr:Dq_MYnN11yGNgk5UPdjaVo2LA-1wyBL6uCyZ3_Vhzc4NQ5xKHRGnhYnEsStISgZ1h3-pEc8mNE7d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekieeljeeutefgieejfffglefhieet
    veffleefudefjeegleejvdelvdefueffveenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Dq_MYh7AKUEyC3x56FSuMAsCdTXRwd81ptOtL7TAMR7mx8aRhqrDPw>
    <xmx:Dq_MYh6FTZ053D3qtLra4Vy_T0XaHgOxbPl4GQQIQs3YG5EFDv73Lg>
    <xmx:Dq_MYhg-Kdx9DfHp5rRYK0IuGB7TT3OlPHE5vUgdtNYkV2NtCNCI4g>
    <xmx:Dq_MYjRxYda9b0zC7UFQvipcS5r0JMdPaCT8UoQ-TvJJG8BTwMjlaw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v10] Preserve the EFI System Resource Table for dom0
Date: Mon, 11 Jul 2022 19:14:59 -0400
Message-Id: <5090ce79650583050b2245ee02d8987e65667c23.1657580511.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.36.1
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
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
---
Tested using qemu-system-x86_64 and xen.efi.

Changes since v9:

- Fix style nit (brace on separate line)
- Add Luca Fancellu's Tested-by

Changes since v8:

- Fix incomplete refactoring that caused boot to fail on all EFI
  systems.
---
 xen/common/efi/boot.c | 135 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..a5b2d6ddb8 100644
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
@@ -1051,6 +1110,71 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
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
 static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     EFI_STATUS status;
@@ -1413,6 +1537,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     if ( gop )
         efi_set_gop_mode(gop, gop_mode);
 
+    efi_relocate_esrt(SystemTable);
+
     efi_exit_boot(ImageHandle, SystemTable);
 
     efi_arch_post_exit_boot(); /* Doesn't return. */
@@ -1753,3 +1879,12 @@ void __init efi_init_memory(void)
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

