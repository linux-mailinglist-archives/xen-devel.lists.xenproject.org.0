Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9EB2604FD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 21:00:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFMNp-0001jt-3l; Mon, 07 Sep 2020 19:00:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFMNn-0001it-0a
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 19:00:51 +0000
X-Inumbo-ID: bef971d5-472f-4e73-96d8-f29057ccfbf5
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bef971d5-472f-4e73-96d8-f29057ccfbf5;
 Mon, 07 Sep 2020 19:00:50 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 087J0nkR028432
 for <xen-devel@lists.xenproject.org>; Mon, 7 Sep 2020 13:00:49 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor
 denied by domain of hudson@trmm.net) receiver=ame7.swcp.com;
 client-ip=62.251.112.184; helo=diamond.fritz.box;
 envelope-from=hudson@trmm.net;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 087J0RtO061615
 for <xen-devel@lists.xenproject.org>; Mon, 7 Sep 2020 13:00:47 -0600 (MDT)
 (envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl
 [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/4] efi: Do not use command line if secure boot is enabled.
Date: Mon,  7 Sep 2020 15:00:27 -0400
Message-Id: <20200907190027.669086-5-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907190027.669086-1-hudson@trmm.net>
References: <20200907190027.669086-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by
 milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]);
 Mon, 07 Sep 2020 13:00:47 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
 version=3.4.2
X-Spam-Level: 
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Trammell hudson <hudson@trmm.net>

If secure boot is enabled, the Xen command line arguments are ignored.
If a unified Xen image is used, then the bundled configuration, dom0
kernel, and initrd are prefered over the ones listed in the config file.

Unlike the shim based verification, the PE signature on a unified image
covers the all of the Xen+config+kernel+initrd modules linked into the
unified image. This also ensures that properly configured platforms
will measure the entire runtime into the TPM for unsealing secrets or
remote attestation.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 452b5f4362..5aaebd5f20 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -947,6 +947,26 @@ static void __init setup_efi_pci(void)
     efi_bs->FreePool(handles);
 }
 
+/*
+ * Logic should remain sync'ed with linux/arch/x86/xen/efi.c
+ * Secure Boot is enabled iff 'SecureBoot' is set and the system is
+ * not in Setup Mode.
+ */
+static bool __init efi_secure_boot(void)
+{
+    static const __initconst EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;
+    uint8_t secboot, setupmode;
+    UINTN secboot_size = sizeof(secboot);
+    UINTN setupmode_size = sizeof(setupmode);
+
+    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &secboot_size, &secboot) != EFI_SUCCESS )
+        return false;
+    if ( efi_rs->GetVariable(L"SetupMode", (EFI_GUID *)&global_guid, NULL, &setupmode_size, &setupmode) != EFI_SUCCESS )
+        return false;
+
+    return secboot == 1 && setupmode == 0;
+}
+
 static void __init efi_variables(void)
 {
     EFI_STATUS status;
@@ -1123,8 +1143,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
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
@@ -1132,6 +1152,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     bool base_video = false;
     char *option_str;
     bool use_cfg_file;
+    bool secure = false;
 
     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1150,8 +1171,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         PrintErrMesg(L"No Loaded Image Protocol", status);
 
     efi_arch_load_addr_check(loaded_image);
+    secure = efi_secure_boot();
 
-    if ( use_cfg_file )
+    /* If UEFI Secure Boot is enabled, do not parse the command line */
+    if ( use_cfg_file && !secure )
     {
         UINTN offset = 0;
 
@@ -1209,6 +1232,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
              XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
+    if ( secure )
+        PrintStr(L"UEFI Secure Boot enabled\r\n");
 
     efi_arch_relocate_image(0);
 
-- 
2.25.1


