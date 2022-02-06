Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CA4AB1A8
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266315.460008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDN-00025s-Sc; Sun, 06 Feb 2022 19:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266315.460008; Sun, 06 Feb 2022 19:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDN-00023R-P0; Sun, 06 Feb 2022 19:28:49 +0000
Received: by outflank-mailman (input) for mailman id 266315;
 Sun, 06 Feb 2022 19:28:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGnDL-00022Q-QV
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 19:28:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDK-0005sy-RB; Sun, 06 Feb 2022 19:28:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDK-0007Ok-FF; Sun, 06 Feb 2022 19:28:46 +0000
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
	bh=At0G3eg7j5P+J2/OwNksy7nZbwWKktpJk5zKue+aCUs=; b=ubR3d92i9BDoPIkoIXp2mhYIb+
	OBGSxCNFxlOWArOHyLQStiLI8orDDJLe7W6wH2VaGjZTPh+GKndo7thAHa/ONpx42PpiFkxPfRzHM
	QPKZ8bfPIEYszy/WgqPggHewJbd7npapB6sb9Pqprmztr/xL2FLSohFz8x5NyRaTfsjI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: ehem+xen@m5p.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH RFC 2/3] xen/arm: efi: Introduce and fill the vga_console_info
Date: Sun,  6 Feb 2022 19:28:38 +0000
Message-Id: <20220206192839.75711-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206192839.75711-1-julien@xen.org>
References: <20220206192839.75711-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In a follow-up patch will we want to add support for EFI framebuffer
in dom0. Yet, Xen may not use the framebuffer, so it would be ideal
to not have to enable CONFIG_VIDEO/CONFIG_VGA.

Introduce vga_console_info in a hacky way and move the code
to fill it up from x86 to common.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

This is a bit of a hack. Sent early to gather opinion on whether
we should enable allow Dom0 to use the EFI Framebuffer even
if Xen is built with CONFIG_VIDEO=n on Arm.
---
 xen/arch/arm/efi/efi-boot.h |  6 ---
 xen/arch/arm/setup.c        |  4 ++
 xen/arch/x86/efi/efi-boot.h | 72 ------------------------------------
 xen/common/efi/boot.c       | 74 ++++++++++++++++++++++++++++++++++++-
 xen/include/xen/vga.h       |  2 +-
 5 files changed, 78 insertions(+), 80 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index ae8627134e5a..17a3d46c59ae 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -1000,12 +1000,6 @@ static void __init efi_arch_console_init(UINTN cols, UINTN rows)
 {
 }
 
-static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
-                                       UINTN info_size,
-                                       EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
-{
-}
-
 static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
 {
     __flush_dcache_area(vaddr, size);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed48a..a336ee58179c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -71,6 +71,10 @@ static unsigned long opt_xenheap_megabytes __initdata;
 integer_param("xenheap_megabytes", opt_xenheap_megabytes);
 #endif
 
+#ifndef CONFIG_VIDEO
+struct xen_vga_console_info vga_console_info;
+#endif
+
 domid_t __read_mostly max_init_domid;
 
 static __used void init_done(void)
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f69509a2103a..cba3fa75a475 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,7 +3,6 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
-#include <xen/vga.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
 #include <asm/microcode.h>
@@ -497,77 +496,6 @@ static void __init efi_arch_console_init(UINTN cols, UINTN rows)
 #endif
 }
 
-static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
-                                       UINTN info_size,
-                                       EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
-{
-#ifdef CONFIG_VIDEO
-    int bpp = 0;
-
-    switch ( mode_info->PixelFormat )
-    {
-    case PixelRedGreenBlueReserved8BitPerColor:
-        vga_console_info.u.vesa_lfb.red_pos = 0;
-        vga_console_info.u.vesa_lfb.red_size = 8;
-        vga_console_info.u.vesa_lfb.green_pos = 8;
-        vga_console_info.u.vesa_lfb.green_size = 8;
-        vga_console_info.u.vesa_lfb.blue_pos = 16;
-        vga_console_info.u.vesa_lfb.blue_size = 8;
-        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
-        vga_console_info.u.vesa_lfb.rsvd_size = 8;
-        bpp = 32;
-        break;
-    case PixelBlueGreenRedReserved8BitPerColor:
-        vga_console_info.u.vesa_lfb.red_pos = 16;
-        vga_console_info.u.vesa_lfb.red_size = 8;
-        vga_console_info.u.vesa_lfb.green_pos = 8;
-        vga_console_info.u.vesa_lfb.green_size = 8;
-        vga_console_info.u.vesa_lfb.blue_pos = 0;
-        vga_console_info.u.vesa_lfb.blue_size = 8;
-        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
-        vga_console_info.u.vesa_lfb.rsvd_size = 8;
-        bpp = 32;
-        break;
-    case PixelBitMask:
-        bpp = set_color(mode_info->PixelInformation.RedMask, bpp,
-                        &vga_console_info.u.vesa_lfb.red_pos,
-                        &vga_console_info.u.vesa_lfb.red_size);
-        bpp = set_color(mode_info->PixelInformation.GreenMask, bpp,
-                        &vga_console_info.u.vesa_lfb.green_pos,
-                        &vga_console_info.u.vesa_lfb.green_size);
-        bpp = set_color(mode_info->PixelInformation.BlueMask, bpp,
-                        &vga_console_info.u.vesa_lfb.blue_pos,
-                        &vga_console_info.u.vesa_lfb.blue_size);
-        if ( mode_info->PixelInformation.ReservedMask )
-            bpp = set_color(mode_info->PixelInformation.ReservedMask, bpp,
-                            &vga_console_info.u.vesa_lfb.rsvd_pos,
-                            &vga_console_info.u.vesa_lfb.rsvd_size);
-        if ( bpp > 0 )
-            break;
-        /* fall through */
-    default:
-        PrintErr(L"Current graphics mode is unsupported!\r\n");
-        bpp  = 0;
-        break;
-    }
-    if ( bpp > 0 )
-    {
-        vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
-        vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
-        vga_console_info.u.vesa_lfb.width =
-            mode_info->HorizontalResolution;
-        vga_console_info.u.vesa_lfb.height = mode_info->VerticalResolution;
-        vga_console_info.u.vesa_lfb.bits_per_pixel = bpp;
-        vga_console_info.u.vesa_lfb.bytes_per_line =
-            (mode_info->PixelsPerScanLine * bpp + 7) >> 3;
-        vga_console_info.u.vesa_lfb.lfb_base = gop->Mode->FrameBufferBase;
-        vga_console_info.u.vesa_lfb.ext_lfb_base = gop->Mode->FrameBufferBase >> 32;
-        vga_console_info.u.vesa_lfb.lfb_size =
-            (gop->Mode->FrameBufferSize + 0xffff) >> 16;
-    }
-#endif
-}
-
 static void __init efi_arch_memory_setup(void)
 {
     unsigned int i;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 80e4e32623c4..2bc38ae40fff 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -20,6 +20,7 @@
 #endif
 #include <xen/string.h>
 #include <xen/stringify.h>
+#include <xen/vga.h>
 #ifdef CONFIG_X86
 /*
  * Keep this arch-specific modified include in the common file, as moving
@@ -1025,6 +1026,77 @@ static void __init efi_get_apple_properties(void)
     }
 }
 
+static void __init efi_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
+                                  UINTN info_size,
+                                  EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
+{
+#if defined(CONFIG_VIDEO) || defined(CONFIG_ARM)
+    int bpp = 0;
+
+    switch ( mode_info->PixelFormat )
+    {
+    case PixelRedGreenBlueReserved8BitPerColor:
+        vga_console_info.u.vesa_lfb.red_pos = 0;
+        vga_console_info.u.vesa_lfb.red_size = 8;
+        vga_console_info.u.vesa_lfb.green_pos = 8;
+        vga_console_info.u.vesa_lfb.green_size = 8;
+        vga_console_info.u.vesa_lfb.blue_pos = 16;
+        vga_console_info.u.vesa_lfb.blue_size = 8;
+        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
+        vga_console_info.u.vesa_lfb.rsvd_size = 8;
+        bpp = 32;
+        break;
+    case PixelBlueGreenRedReserved8BitPerColor:
+        vga_console_info.u.vesa_lfb.red_pos = 16;
+        vga_console_info.u.vesa_lfb.red_size = 8;
+        vga_console_info.u.vesa_lfb.green_pos = 8;
+        vga_console_info.u.vesa_lfb.green_size = 8;
+        vga_console_info.u.vesa_lfb.blue_pos = 0;
+        vga_console_info.u.vesa_lfb.blue_size = 8;
+        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
+        vga_console_info.u.vesa_lfb.rsvd_size = 8;
+        bpp = 32;
+        break;
+    case PixelBitMask:
+        bpp = set_color(mode_info->PixelInformation.RedMask, bpp,
+                        &vga_console_info.u.vesa_lfb.red_pos,
+                        &vga_console_info.u.vesa_lfb.red_size);
+        bpp = set_color(mode_info->PixelInformation.GreenMask, bpp,
+                        &vga_console_info.u.vesa_lfb.green_pos,
+                        &vga_console_info.u.vesa_lfb.green_size);
+        bpp = set_color(mode_info->PixelInformation.BlueMask, bpp,
+                        &vga_console_info.u.vesa_lfb.blue_pos,
+                        &vga_console_info.u.vesa_lfb.blue_size);
+        if ( mode_info->PixelInformation.ReservedMask )
+            bpp = set_color(mode_info->PixelInformation.ReservedMask, bpp,
+                            &vga_console_info.u.vesa_lfb.rsvd_pos,
+                            &vga_console_info.u.vesa_lfb.rsvd_size);
+        if ( bpp > 0 )
+            break;
+        /* fall through */
+    default:
+        PrintErr(L"Current graphics mode is unsupported!\r\n");
+        bpp  = 0;
+        break;
+    }
+    if ( bpp > 0 )
+    {
+        vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
+        vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
+        vga_console_info.u.vesa_lfb.width =
+            mode_info->HorizontalResolution;
+        vga_console_info.u.vesa_lfb.height = mode_info->VerticalResolution;
+        vga_console_info.u.vesa_lfb.bits_per_pixel = bpp;
+        vga_console_info.u.vesa_lfb.bytes_per_line =
+            (mode_info->PixelsPerScanLine * bpp + 7) >> 3;
+        vga_console_info.u.vesa_lfb.lfb_base = gop->Mode->FrameBufferBase;
+        vga_console_info.u.vesa_lfb.ext_lfb_base = gop->Mode->FrameBufferBase >> 32;
+        vga_console_info.u.vesa_lfb.lfb_size =
+            (gop->Mode->FrameBufferSize + 0xffff) >> 16;
+    }
+#endif
+}
+
 static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop_mode)
 {
     EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info;
@@ -1042,7 +1114,7 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
     /* Get graphics and frame buffer info. */
     status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
     if ( !EFI_ERROR(status) )
-        efi_arch_video_init(gop, info_size, mode_info);
+        efi_video_init(gop, info_size, mode_info);
 }
 
 #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
index f72b63d446b1..39b4c2eae198 100644
--- a/xen/include/xen/vga.h
+++ b/xen/include/xen/vga.h
@@ -11,7 +11,7 @@
 
 #include <xen/video.h>
 
-#ifdef CONFIG_VGA
+#if defined(CONFIG_VGA) || defined(CONFIG_ARM)
 extern struct xen_vga_console_info vga_console_info;
 #endif
 
-- 
2.32.0


