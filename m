Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656184AB1A6
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266314.459997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDK-0001of-Kg; Sun, 06 Feb 2022 19:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266314.459997; Sun, 06 Feb 2022 19:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDK-0001mo-HV; Sun, 06 Feb 2022 19:28:46 +0000
Received: by outflank-mailman (input) for mailman id 266314;
 Sun, 06 Feb 2022 19:28:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGnDJ-0001Yz-9u
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 19:28:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDJ-0005sk-2e; Sun, 06 Feb 2022 19:28:45 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDI-0007Ok-Pk; Sun, 06 Feb 2022 19:28:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=afEtY43khqyixlLlQcgO+P5/SZzjDhtwscVQfHzNp6w=; b=3VtDXi3lemG7IAYf+DmdTdw7XG
	49nHZrGfVfH6KIvICROvXnt8LH95v6Sej6Sy7FnViBrQXDiaJJb1l+o+QRrc1ldMXYFjpYQAv1eYJ
	X3NDNAzLRWK5CGxby0CF8bXGWhzQaeQ333HMRgF785hVqYEJTA4e9biey1Mb5SmPPmyI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: ehem+xen@m5p.com,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC 1/3] xen/efi: Always query the console information and get GOP
Date: Sun,  6 Feb 2022 19:28:37 +0000
Message-Id: <20220206192839.75711-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206192839.75711-1-julien@xen.org>
References: <20220206192839.75711-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, the EFI stub will only query the console information and
get the GOP when using the configuration file.

However, GRUB is never providing the a configuration file. So the
EFI framebuffer will not be usable at least on Arm (support will
be added in a follow-up patch).

Move out the code outside of the configuration file section.

Take the opportunity to remove the variable 'size' which was
set but never used (interestingly GCC is only complaining if it is
initialization when declaring the variable).

With this change, GCC 8.3 will complain of argc potentially been
used unitiatlized. I suspect this is because the argc will
be iniitalized and used in a different if code-blocks. Yet they
are using the same check.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

It is not entirely clear to me why the GOP was only fetched when
the configuration file is used.

I have tested this on RPI4 and it seems to work. Any chance this
was done to workaround an x86 platform?
---
 xen/common/efi/boot.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 12fd0844bd55..80e4e32623c4 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1129,9 +1129,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
-    unsigned int i, argc;
+    /* Initialize argc to stop GCC complaining */
+    unsigned int i, argc = 0;
     CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
-    UINTN gop_mode = ~0;
+    UINTN gop_mode = ~0, cols = 0, rows = 0;
+
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
     union string section = { NULL }, name;
@@ -1219,18 +1221,16 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 
     efi_arch_relocate_image(0);
 
+    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
+                           &cols, &rows) == EFI_SUCCESS )
+        efi_arch_console_init(cols, rows);
+
+    gop = efi_get_gop();
+
     if ( use_cfg_file )
     {
         EFI_FILE_HANDLE dir_handle;
-        UINTN depth, cols, rows, size;
-
-        size = cols = rows = depth = 0;
-
-        if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
-                               &cols, &rows) == EFI_SUCCESS )
-            efi_arch_console_init(cols, rows);
-
-        gop = efi_get_gop();
+        UINTN depth = 0;
 
         /* Get the file system interface. */
         dir_handle = get_parent_handle(loaded_image, &file_name);
-- 
2.32.0


