Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C161C28111F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1959.5852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJ5R-0002HU-MR; Fri, 02 Oct 2020 11:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1959.5852; Fri, 02 Oct 2020 11:18:53 +0000
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
	id 1kOJ5R-0002Gg-I7; Fri, 02 Oct 2020 11:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1959;
 Fri, 02 Oct 2020 11:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kOJ5Q-0002FX-A8
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:52 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5196ee21-fce5-47d8-a0fc-72ff6a653c0f;
 Fri, 02 Oct 2020 11:18:51 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIn6T016920;
 Fri, 2 Oct 2020 05:18:49 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXr008607;
 Fri, 2 Oct 2020 05:18:46 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kOJ5Q-0002FX-A8
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:52 +0000
X-Inumbo-ID: 5196ee21-fce5-47d8-a0fc-72ff6a653c0f
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5196ee21-fce5-47d8-a0fc-72ff6a653c0f;
	Fri, 02 Oct 2020 11:18:51 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIn6T016920;
	Fri, 2 Oct 2020 05:18:49 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame7.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXr008607;
	Fri, 2 Oct 2020 05:18:46 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v9 4/4] efi: Do not use command line if unified config is included
Date: Fri,  2 Oct 2020 07:18:22 -0400
Message-Id: <20201002111822.42142-5-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002111822.42142-1-hudson@trmm.net>
References: <20201002111822.42142-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]); Fri, 02 Oct 2020 05:18:48 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.2
X-Spam-Level: 

If a unified Xen image is used, then the bundled configuration,
Xen command line, dom0 kernel, and ramdisk are prefered over
any files listed in the config file or provided on the command line.

Unlike the shim based verification, the PE signature on a unified image
covers all of the Xen+config+kernel+initrd modules linked into the
unified image. This also ensures that, on properly configured UEFI Secure Boot
platforms, the entire runtime will be measured into the TPM for unsealing
secrets or remote attestation.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index bacd551bb5..8c11475214 100644
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
 
@@ -1232,7 +1265,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         dir_handle = get_parent_handle(loaded_image, &file_name);
 
         /* Read and parse the config file. */
-        if ( read_section(loaded_image, L"config", &cfg, NULL) )
+        if ( cfg.ptr )
             PrintStr(L"Using builtin config file\r\n");
         else if ( !cfg_file_name )
         {
-- 
2.25.1


