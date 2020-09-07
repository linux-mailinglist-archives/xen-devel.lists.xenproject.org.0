Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B026036C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 19:49:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLGV-0002r2-Ao; Mon, 07 Sep 2020 17:49:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFLGT-0002qq-Cx
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 17:49:13 +0000
X-Inumbo-ID: 7ea4ca1a-f346-4a3e-aa93-d1d2d446ea92
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ea4ca1a-f346-4a3e-aa93-d1d2d446ea92;
 Mon, 07 Sep 2020 17:49:11 +0000 (UTC)
Date: Mon, 07 Sep 2020 17:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599500950;
 bh=kO1ttbfruYlXqfeMQ+l83Ln2EGyL+ZF8veTCN3S60wU=;
 h=Date:To:From:Reply-To:Subject:From;
 b=qgk1rqwR/LNPrljzImX1kXK0alp6j/UgtxGbA8iZjyFjgIEaGPbsEz8lM6Tw5v+jD
 aEZNeftUcMVGF/Ikf18BRFtrYilnazjk2BVgvRFTHFh5B0DrVjsLF1T6Hf0jG5yn3u
 5Lpc16TT1CMFxFDlCxEXHoGgHQa8AA2EZrfxnbQc=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: [PATCH v3 4/4] efi: Do not use command line if secure boot is enabled.
Message-ID: <7O9RuKkcGcH8q9SVMZQR4G8LORrYZSW_koA6MlG29xOMmq5wjsSzjOWBoZtFJ3U4Av1FLjPCw7iz0DqQrwLS3PxrUAOcZmNklpkGi87L2x4=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
+    static const __initconst EFI_GUID global_guid =3D EFI_GLOBAL_VARIABLE;
+    uint8_t secboot, setupmode;
+    UINTN secboot_size =3D sizeof(secboot);
+    UINTN setupmode_size =3D sizeof(setupmode);
+
+    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL=
, &secboot_size, &secboot) !=3D EFI_SUCCESS )
+        return false;
+    if ( efi_rs->GetVariable(L"SetupMode", (EFI_GUID *)&global_guid, NULL,=
 &setupmode_size, &setupmode) !=3D EFI_SUCCESS )
+        return false;
+
+    return secboot =3D=3D 1 && setupmode =3D=3D 0;
+}
+
 static void __init efi_variables(void)
 {
     EFI_STATUS status;
@@ -1123,8 +1143,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
-    unsigned int i, argc;
-    CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
+    unsigned int i, argc =3D 0;
+    CHAR16 **argv =3D NULL, *file_name, *cfg_file_name =3D NULL, *options =
=3D NULL;
     UINTN gop_mode =3D ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
@@ -1132,6 +1152,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     bool base_video =3D false;
     char *option_str;
     bool use_cfg_file;
+    bool secure =3D false;

     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1150,8 +1171,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
SystemTable)
         PrintErrMesg(L"No Loaded Image Protocol", status);

     efi_arch_load_addr_check(loaded_image);
+    secure =3D efi_secure_boot();

-    if ( use_cfg_file )
+    /* If UEFI Secure Boot is enabled, do not parse the command line */
+    if ( use_cfg_file && !secure )
     {
         UINTN offset =3D 0;

@@ -1209,6 +1232,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)

     PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSI=
ON)
              XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
+    if ( secure )
+        PrintStr(L"UEFI Secure Boot enabled\r\n");

     efi_arch_relocate_image(0);

--
2.25.1



