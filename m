Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A624AF272
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269137.463142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmmY-0005OY-FF; Wed, 09 Feb 2022 13:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269137.463142; Wed, 09 Feb 2022 13:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHmmY-0005LN-BT; Wed, 09 Feb 2022 13:13:14 +0000
Received: by outflank-mailman (input) for mailman id 269137;
 Wed, 09 Feb 2022 13:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHmmV-0005LH-LQ
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:13:12 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06be1a6b-89aa-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:13:09 +0100 (CET)
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
X-Inumbo-ID: 06be1a6b-89aa-11ec-8f75-fffcc8bd4f1a
From: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
Subject: [PATCH v2] x86: Use low memory size directly from Multiboot
Date: Wed,  9 Feb 2022 14:12:51 +0100
Message-Id: <20220209131251.387-1-dinhngoc.tu@irit.fr>
In-Reply-To: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
References: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
Content-Transfer-Encoding: 8bit

Previously, Xen used information from the BDA to detect the amount of
available low memory. This does not work on some scenarios such as
Coreboot, or when booting from Kexec on a UEFI system without CSM.

Use the information directly supplied by Multiboot boot information
instead.
---
 xen/arch/x86/boot/head.S | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10..62fe3fe55b 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -524,33 +524,23 @@ trampoline_bios_setup:
         mov     %ecx,%fs
         mov     %ecx,%gs
 
-        /* Set up trampoline segment 64k below EBDA */
-        movzwl  0x40e,%ecx          /* EBDA segment */
-        cmp     $0xa000,%ecx        /* sanity check (high) */
-        jae     0f
-        cmp     $0x4000,%ecx        /* sanity check (low) */
-        jae     1f
-0:
-        movzwl  0x413,%ecx          /* use base memory size on failure */
-        shl     $10-4,%ecx
-1:
+        /* Use lower memory size directly from Multiboot */
+        mov     %edx,%ecx
         /*
-         * Compare the value in the BDA with the information from the
-         * multiboot structure (if available) and use the smallest.
+         * Old Kexec used to report the value in bytes instead of kilobytes
+         * like it's supposed to, so fix that if detected.
          */
-        cmp     $0x100,%edx         /* is the multiboot value too small? */
-        jb      2f                  /* if so, do not use it */
-        shl     $10-4,%edx
-        cmp     %ecx,%edx           /* compare with BDA value */
-        cmovb   %edx,%ecx           /* and use the smaller */
+        cmpl    $640,%ecx
+        jbe     1f
+        shr     $10,%ecx
+1:
+        /* From arch/x86/smpboot.c: start_eip had better be page-aligned! */
+        shr     $2,%ecx
 
-2:
         /* Reserve memory for the trampoline and the low-memory stack. */
-        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
+        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>12),%ecx
 
-        /* From arch/x86/smpboot.c: start_eip had better be page-aligned! */
-        xor     %cl, %cl
-        shl     $4, %ecx
+        shl     $12,%ecx
         mov     %ecx,sym_esi(trampoline_phys)
 
 trampoline_setup:
-- 
2.25.1


