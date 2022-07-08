Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A456C17E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 23:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363681.594364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9vcS-0002Rz-KP; Fri, 08 Jul 2022 21:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363681.594364; Fri, 08 Jul 2022 21:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9vcS-0002Oc-Fg; Fri, 08 Jul 2022 21:34:36 +0000
Received: by outflank-mailman (input) for mailman id 363681;
 Fri, 08 Jul 2022 21:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6xB=XN=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o9vcQ-0002OW-TU
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 21:34:35 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfdc1c8d-ff05-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 23:34:31 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AD3225C01C6;
 Fri,  8 Jul 2022 17:34:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 17:34:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 17:34:29 -0400 (EDT)
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
X-Inumbo-ID: bfdc1c8d-ff05-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1657316069; x=1657402469; bh=ZvfwDQKsaqgWSclCfQajDVrN5ftLm2Vl2Hi
	1zLQKAI8=; b=gQKgSb8c3Tl4TTzcU+0D0F+GvNKaxrTIHHP3xgkMRqujZROHdEl
	eCr16QdJiXXLff9UmKD2U+cd7tS7RFafpni1/16mnmpn0dAQeWzUWWRFGc6gwOoo
	VrFqOsAvC/W6+Va+RDfiqcohhLgIIYe7LrJu+MbFmSTNjSgIG3ZhdoOc6gCajTdC
	xOs07m8O85lAQzSXLdsXHTiT6ZCQeK4uMG0kn/sGA/mfxC/i0MdqwUJo+iZTyogY
	Al+e/SXnBjKsjTSlop7/I2Crr3EBo+YSalvkft4ANLHznjGj+aKasYX7q3ZbhARJ
	O1hRTdD6Cz0QoSLzaXLzePRicLrWPeMNDAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657316069; x=1657402469; bh=ZvfwDQKsaqgWS
	clCfQajDVrN5ftLm2Vl2Hi1zLQKAI8=; b=Sl97MZIOVr7XhkxA/5dsEs8eGc64d
	82lGqVRkkjNsHpaRwJ6bko7aUi9ipIhe6vy7H1ztwH4a85DEpv0Ao17O6Mdwi7y3
	P7JrKtrFUho3CrdedTGIqFft+BFjaiJRoyfolmjto981AnfbCU1S2xNXjC8jQBAZ
	WKnzZN4ttuBdyhvMVuDRa2d8+8fAMA4q/O2XXprsR208BPwJK0YX7NdiiH1vUyD4
	NKzvmiPq7yMPOzr6eINaA4Pt05lYZwjsY6RJrWHsypWW7meZtWaKJtgRWCnqvPip
	e4Rge5zGoDBN2iUePk+x26zTfRv/uanuzu54vxPkexDDQLmyVyEQ14NbA==
X-ME-Sender: <xms:5aLIYlSePrezT352_9z6GhMBuDnvxas9dvUEcI4C25YevD41yFj3Fw>
    <xme:5aLIYuz9Tl2kR2t24hJAiOSu99VOIKVbUwx-yZD6aQZnQj06FtCiPN5yrKQgJui0Q
    tssXLojSOOOnv4>
X-ME-Received: <xmr:5aLIYq19tGf4KdMu6-zHXdXA0pBm9jsjHOJ9yCbggCHmgy3qpn8EuTeQ-oExbFVJylLhYbcoIxzf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeeileejueetgfeijeffgfelhfei
    teevffelfedufeejgeeljedvledvfeeuffevnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:5aLIYtBcIneXdp2wWy8VBmjfq4Y8uRDUGQgEEFGuRfOMdg3xvGUiRA>
    <xmx:5aLIYugoCMXaYAEkqizjCkOKXHmXrXRi5JcTSCHX3yEtz6DThlNoDQ>
    <xmx:5aLIYhp3AKDEzM37gZ3OFJlStpl_AHaJz5FdYCttii9OrAsIoL7K3w>
    <xmx:5aLIYmLDoD24dXec3Yq_Kn5iojx3JxKXLv7jW-IT9UGQWVS9k7yRVQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen development discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9] Preserve the EFI System Resource Table for dom0
Date: Fri,  8 Jul 2022 17:34:03 -0400
Message-Id: <20220708213403.2390-1-demi@invisiblethingslab.com>
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
for details.  Tested using qemu-system-x86_64 and xen.efi.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 134 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a25e1d29f1..d2f66a430d 100644
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

