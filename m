Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514404B08B8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 09:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269673.463753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI54g-0000Vc-4r; Thu, 10 Feb 2022 08:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269673.463753; Thu, 10 Feb 2022 08:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI54g-0000Tn-1i; Thu, 10 Feb 2022 08:45:10 +0000
Received: by outflank-mailman (input) for mailman id 269673;
 Thu, 10 Feb 2022 08:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=peag=SZ=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nI54e-0000Th-EK
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 08:45:08 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bea422aa-8a4d-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 09:45:06 +0100 (CET)
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
X-Inumbo-ID: bea422aa-8a4d-11ec-8f75-fffcc8bd4f1a
From: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
To: xen-devel@lists.xenproject.org
Cc: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] x86: Prioritize low memory size from Multiboot
Date: Thu, 10 Feb 2022 09:44:36 +0100
Message-Id: <20220210084436.84-1-dinhngoc.tu@irit.fr>
In-Reply-To: <000c01d81dcae25e6f0irit.fr>
References: <000c01d81dcae25e6f0irit.fr>
Content-Transfer-Encoding: 8bit

Previously, Xen used information from the BDA to detect the amount of
available low memory. This does not work on some scenarios such as
Coreboot, or when booting from Kexec on a UEFI system without CSM.

Prioritize the information supplied by Multiboot instead. If this is not
available, fall back to the old BDA method.

Signed-off-by: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
---
Changes in v3:
- Prioritize using Multiboot's memory information.. Fall back to using
  BDA in case MBI does not supply memory info.

Changes in v2:
- Detect if Multiboot claims there's more than 640 KB of low memory
  (happens with old Kexec versions), and correct the memory unit in such
  cases.
---
 xen/arch/x86/boot/head.S | 44 ++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10..da7810060e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -524,27 +524,41 @@ trampoline_bios_setup:
         mov     %ecx,%fs
         mov     %ecx,%gs
 
-        /* Set up trampoline segment 64k below EBDA */
-        movzwl  0x40e,%ecx          /* EBDA segment */
-        cmp     $0xa000,%ecx        /* sanity check (high) */
-        jae     0f
-        cmp     $0x4000,%ecx        /* sanity check (low) */
-        jae     1f
+        /* Check if Multiboot provides us with low memory size. */
+        mov     %edx,%ecx
+        test    %ecx,%ecx
+        jz      1f
+
+        /*
+         * Old Kexec used to report memory sizes in bytes instead of kilobytes
+         * like it's supposed to.
+         *
+         * If Multiboot reports more than 640 KB of low memory, assume we have
+         * this problem.
+         */
+        cmp     $640,%ecx
+        jbe     0f
+        shr     $10,%ecx
 0:
-        movzwl  0x413,%ecx          /* use base memory size on failure */
+        /* %ecx now contains the low memory size in kilobytes. */
         shl     $10-4,%ecx
+        jmp     3f
+
 1:
         /*
-         * Compare the value in the BDA with the information from the
-         * multiboot structure (if available) and use the smallest.
+         * Multiboot doesn't provide us with memory info. Set up trampoline
+         * segment 64k below EBDA as fallback.
          */
-        cmp     $0x100,%edx         /* is the multiboot value too small? */
-        jb      2f                  /* if so, do not use it */
-        shl     $10-4,%edx
-        cmp     %ecx,%edx           /* compare with BDA value */
-        cmovb   %edx,%ecx           /* and use the smaller */
-
+        movzwl  0x40e,%ecx          /* EBDA segment */
+        cmp     $0xa000,%ecx        /* sanity check (high) */
+        jae     2f
+        cmp     $0x4000,%ecx        /* sanity check (low) */
+        jae     3f
 2:
+        movzwl  0x413,%ecx          /* use base memory size on failure */
+        shl     $10-4,%ecx
+
+3:
         /* Reserve memory for the trampoline and the low-memory stack. */
         sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
 
-- 
2.25.1


