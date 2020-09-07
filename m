Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F452260353
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 19:47:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLF4-0002gQ-N4; Mon, 07 Sep 2020 17:47:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFLF2-0002gG-RK
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 17:47:44 +0000
X-Inumbo-ID: 0305cb4c-d723-442b-b147-b43af5b45721
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0305cb4c-d723-442b-b147-b43af5b45721;
 Mon, 07 Sep 2020 17:47:43 +0000 (UTC)
Date: Mon, 07 Sep 2020 17:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599500862;
 bh=2U4wML9SR0idO3N3KS6/SVyXY7iQli99vxZrFKrhoLo=;
 h=Date:To:From:Reply-To:Subject:From;
 b=lxfEvt80URGmahtae9+u0dHwU3u6MoHFh6cASs0Xp25CJNKSnT7MTEQ46YeSSoALi
 fz/xXwfq3/kx3qNizihXQ8ilpIVHP1ZYaXTRPQWXFWw736VfZHKu4eqIWHJxaaOlCL
 gav6q2G+IWdnP251UdVQSQwvQ/2TS+nEWdxx7lvc=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: [PATCH v3 2/4] efi/boot.c: add file.need_to_free and split
 display_file_info()
Message-ID: <vYinxSRj2TWemcvixJcZYpxh2EjBENy5BB7SyFGGjClHUNlhRgP2XK8qjlRHt6Wbz0hG1TV4HvO51WsjuF2MfdLs02s3939hjzZkFud54LE=@trmm.net>
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

add file.need_to_free and split display_file_info()

Signed-off-by: Trammell hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 4022a672c9..f5bdc4b1df 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {

 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         void *ptr;
@@ -279,13 +280,13 @@ void __init noreturn blexit(const CHAR16 *str)
     if ( !efi_bs )
         efi_arch_halt();

-    if ( cfg.addr )
+    if ( cfg.addr && cfg.need_to_free )
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.addr )
+    if ( kernel.addr && kernel.need_to_free )
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.addr )
+    if ( ramdisk.addr && ramdisk.need_to_free )
         efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.addr )
+    if ( xsm.addr && xsm.need_to_free )
         efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));

     efi_arch_blexit();
@@ -538,6 +539,21 @@ static char * __init split_string(char *s)
     return NULL;
 }

+static void __init display_file_info(CHAR16 *name, struct file *file, char=
 *options)
+{
+    if ( file =3D=3D &cfg )
+        return;
+
+    PrintStr(name);
+    PrintStr(L": ");
+    DisplayUint(file->addr, 2 * sizeof(file->addr));
+    PrintStr(L"-");
+    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
+    PrintStr(newline);
+
+    efi_arch_handle_module(file, name, options);
+}
+
 static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                              struct file *file, char *options)
 {
@@ -572,6 +588,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                     PFN_UP(size), &file->addr);
+        file->need_to_free =3D true;
     }
     if ( EFI_ERROR(ret) )
     {
@@ -581,16 +598,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handl=
e, CHAR16 *name,
     else
     {
         file->size =3D size;
-        if ( file !=3D &cfg )
-        {
-            PrintStr(name);
-            PrintStr(L": ");
-            DisplayUint(file->addr, 2 * sizeof(file->addr));
-            PrintStr(L"-");
-            DisplayUint(file->addr + size, 2 * sizeof(file->addr));
-            PrintStr(newline);
-            efi_arch_handle_module(file, name, options);
-        }
+        display_file_info(name, file, options);

         ret =3D FileHandle->Read(FileHandle, &file->size, file->ptr);
         if ( !EFI_ERROR(ret) && file->size !=3D size )
--
2.25.1



