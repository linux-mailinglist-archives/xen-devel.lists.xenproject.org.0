Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3D27E81C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.630.2129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNamr-0001uM-0j; Wed, 30 Sep 2020 12:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630.2129; Wed, 30 Sep 2020 12:00:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNamq-0001tb-SQ; Wed, 30 Sep 2020 12:00:44 +0000
Received: by outflank-mailman (input) for mailman id 630;
 Wed, 30 Sep 2020 12:00:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNamp-0001mg-BR
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:43 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3235fc8e-2f0f-49ad-87ab-7f89c1a625df;
 Wed, 30 Sep 2020 12:00:42 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0fgP005394;
 Wed, 30 Sep 2020 06:00:41 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdG003035;
 Wed, 30 Sep 2020 06:00:37 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNamp-0001mg-BR
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:43 +0000
X-Inumbo-ID: 3235fc8e-2f0f-49ad-87ab-7f89c1a625df
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3235fc8e-2f0f-49ad-87ab-7f89c1a625df;
	Wed, 30 Sep 2020 12:00:42 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0fgP005394;
	Wed, 30 Sep 2020 06:00:41 -0600
Received-SPF: neutral (ame8.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame8.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdG003035;
	Wed, 30 Sep 2020 06:00:37 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame8.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v8 5/5] efi: Do not use command line if unified config is included
Date: Wed, 30 Sep 2020 08:00:11 -0400
Message-Id: <20200930120011.1622924-6-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930120011.1622924-1-hudson@trmm.net>
References: <20200930120011.1622924-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame8.swcp.com [216.184.2.128]); Wed, 30 Sep 2020 06:00:39 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.99.2 at ame8
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ame8.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.1
X-Spam-Level: 

If a unified Xen image is used, then the bundled configuration,
Xen command line, dom0 kernel, and ramdisk are prefered over
any files listed in the config file or provided on the command line.

Unlike the shim based verification, the PE signature on a unified image
covers all of the Xen+config+kernel+initrd modules linked into the
unified image. This also ensures that, on properly configured UEFI Secure Boot
platforms,  the entire runtime will be measured into the TPM for unsealing
secrets or remote attestation.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 072b1cecd1..07ea5b3512 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -950,6 +950,35 @@ static void __init setup_efi_pci(void)
     efi_bs->FreePool(handles);
 }
 
+/*
+ * Logic should remain sync'ed with linux/arch/x86/xen/efi.c
+ * Secure Boot is enabled iff 'SecureBoot' is set and the system is
+ * not in Setup Mode.
+ */
+static bool __init efi_secure_boot(void)
+{
+    static __initdata EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;
+    uint8_t secboot, setupmode;
+    UINTN secboot_size = sizeof(secboot);
+    UINTN setupmode_size = sizeof(setupmode);
+    EFI_STATUS rc;
+
+    rc = efi_rs->GetVariable(L"SecureBoot", &global_guid,
+                             NULL, &secboot_size, &secboot);
+    if ( rc != EFI_SUCCESS )
+        return false;
+
+    rc = efi_rs->GetVariable(L"SetupMode", &global_guid,
+                             NULL, &setupmode_size, &setupmode);
+    if ( rc != EFI_SUCCESS )
+        return false;
+
+    if ( secboot > 1 || setupmode > 1 )
+        blexit(L"Invalid SecureBoot/SetupMode variables");
+
+    return secboot == 1 && setupmode == 0;
+}
+
 static void __init efi_variables(void)
 {
     EFI_STATUS status;
@@ -1126,15 +1155,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
-    unsigned int i, argc;
-    CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
+    unsigned int i, argc = 0;
+    CHAR16 **argv = NULL, *file_name, *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
     bool base_video = false;
     const char *option_str;
-    bool use_cfg_file;
+    bool use_cfg_file, secure;
 
     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1153,8 +1182,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         PrintErrMesg(L"No Loaded Image Protocol", status);
 
     efi_arch_load_addr_check(loaded_image);
+    secure = efi_secure_boot();
 
-    if ( use_cfg_file )
+    if ( use_cfg_file &&
+         !read_section(loaded_image, L"config", &cfg, NULL) )
     {
         UINTN offset = 0;
 
@@ -1212,6 +1243,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
              XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
+    if ( secure )
+        PrintStr(L"UEFI Secure Boot enabled\r\n");
 
     efi_arch_relocate_image(0);
 
@@ -1231,7 +1264,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         /* Get the file system interface. */
         dir_handle = get_parent_handle(loaded_image, &file_name);
 
-        if ( read_section(loaded_image, L"config", &cfg, NULL) )
+        if ( cfg.ptr )
             PrintStr(L"Using builtin config file\r\n");
         else if ( !cfg_file_name )
         {
-- 
2.25.1


