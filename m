Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE0D4AF261
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269118.463131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmjm-00049p-0z; Wed, 09 Feb 2022 13:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269118.463131; Wed, 09 Feb 2022 13:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmjl-00046A-Ru; Wed, 09 Feb 2022 13:10:21 +0000
Received: by outflank-mailman (input) for mailman id 269118;
 Wed, 09 Feb 2022 13:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHmjk-0003YU-He
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:10:20 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a18889dd-89a9-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:10:19 +0100 (CET)
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
X-Inumbo-ID: a18889dd-89a9-11ec-8f75-fffcc8bd4f1a
From: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
Subject: [PATCH 2/2] x86: Set up framebuffer given by Multiboot2
Date: Wed,  9 Feb 2022 14:09:07 +0100
Message-Id: <20220209130907.252-3-dinhngoc.tu@irit.fr>
In-Reply-To: <20220209130907.252-1-dinhngoc.tu@irit.fr>
References: <20220209130907.252-1-dinhngoc.tu@irit.fr>
Content-Transfer-Encoding: 8bit

Previously, we do not make use of the framebuffer given by Multiboot.
This means graphics will not work in some scenarios such as booting from
Kexec.

Enable the Multiboot framebuffer if it exists and not overridden by EFI
probe.
---
 xen/arch/x86/setup.c | 45 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 115f8f6517..04d8be407e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -551,16 +551,55 @@ struct boot_video_info {
 extern struct boot_video_info boot_vid_info;
 #endif
 
-static void __init parse_video_info(void)
+static void __init parse_video_info(multiboot_info_t *mbi)
 {
 #ifdef CONFIG_VIDEO
     struct boot_video_info *bvi = &bootsym(boot_vid_info);
 
+    /*
+     * fb detection will be in this order:
+     *  - efifb (as efifb probe sets a new GOP mode before parse_video_info is called,
+     *    we must use this mode instead of the one given by mbifb)
+     *  - mbifb
+     *  - vesafb
+     */
+
     /* vga_console_info is filled directly on EFI platform. */
     if ( efi_enabled(EFI_BOOT) )
         return;
 
-    if ( (bvi->orig_video_isVGA == 1) && (bvi->orig_video_mode == 3) )
+    if ( mbi->flags & MBI_FB )
+    {
+        uint64_t lfb_rgb_bitmap = 0;
+
+        vga_console_info.video_type = XEN_VGATYPE_VESA_LFB;
+        vga_console_info.u.vesa_lfb.width = mbi->fb.width;
+        vga_console_info.u.vesa_lfb.height = mbi->fb.height;
+        vga_console_info.u.vesa_lfb.bytes_per_line = mbi->fb.pitch;
+        vga_console_info.u.vesa_lfb.bits_per_pixel = mbi->fb.bpp;
+        vga_console_info.u.vesa_lfb.lfb_base = mbi->fb.addr;
+        vga_console_info.u.vesa_lfb.lfb_size = (mbi->fb.pitch * mbi->fb.height + 0xffff) >> 16;
+
+        vga_console_info.u.vesa_lfb.red_pos = mbi->fb.red_pos;
+        vga_console_info.u.vesa_lfb.red_size = mbi->fb.red_size;
+        lfb_rgb_bitmap |= (((uint64_t)1 << mbi->fb.red_size) - 1) << mbi->fb.red_pos;
+        vga_console_info.u.vesa_lfb.green_pos = mbi->fb.green_pos;
+        vga_console_info.u.vesa_lfb.green_size = mbi->fb.green_size;
+        lfb_rgb_bitmap |= (((uint64_t)1 << mbi->fb.green_size) - 1) << mbi->fb.green_pos;
+        vga_console_info.u.vesa_lfb.blue_pos = mbi->fb.blue_pos;
+        vga_console_info.u.vesa_lfb.blue_size = mbi->fb.blue_size;
+        lfb_rgb_bitmap |= (((uint64_t)1 << mbi->fb.blue_size) - 1) << mbi->fb.blue_pos;
+
+        /* assume non-weird bit format */
+        vga_console_info.u.vesa_lfb.rsvd_pos = find_first_zero_bit(&lfb_rgb_bitmap, sizeof(lfb_rgb_bitmap) * __CHAR_BIT__);
+        vga_console_info.u.vesa_lfb.rsvd_size = mbi->fb.bpp - mbi->fb.red_size - mbi->fb.green_size - mbi->fb.blue_size;
+        if (vga_console_info.u.vesa_lfb.rsvd_pos >= mbi->fb.bpp || vga_console_info.u.vesa_lfb.rsvd_size < 0) {
+            vga_console_info.u.vesa_lfb.rsvd_pos = 0;
+            vga_console_info.u.vesa_lfb.rsvd_size = 0;
+        }
+        vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
+    }
+    else if ( (bvi->orig_video_isVGA == 1) && (bvi->orig_video_mode == 3) )
     {
         vga_console_info.video_type = XEN_VGATYPE_TEXT_MODE_3;
         vga_console_info.u.text_mode_3.font_height = bvi->orig_video_points;
@@ -933,7 +972,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      */
     hypervisor_name = hypervisor_probe();
 
-    parse_video_info();
+    parse_video_info(mbi);
 
     rdmsrl(MSR_EFER, this_cpu(efer));
     asm volatile ( "mov %%cr4,%0" : "=r" (get_cpu_info()->cr4) );
-- 
2.25.1


