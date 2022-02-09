Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2034AEFDA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 12:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269001.462974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkwc-0003Oo-3T; Wed, 09 Feb 2022 11:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269001.462974; Wed, 09 Feb 2022 11:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkwc-0003Ms-03; Wed, 09 Feb 2022 11:15:30 +0000
Received: by outflank-mailman (input) for mailman id 269001;
 Wed, 09 Feb 2022 11:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHkiT-0001on-PO
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 11:00:53 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b930552-8997-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 12:00:52 +0100 (CET)
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
X-Inumbo-ID: 8b930552-8997-11ec-8eb8-a37418f5ba1a
From: <dinhngoc.tu@irit.fr>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86: Use low memory size directly from Multiboot
Date: Wed, 9 Feb 2022 12:00:50 +0100
Message-ID: <001301d81da4$4c993260$e5cb9720$@irit.fr>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Thread-Index: Adgdo3qWvijfwbqMRuiJMpwfi+U51A==
Content-Language: en

Previously, Xen used information from the BDA to detect the amount of
available low memory. This does not work on some scenarios such as
Coreboot, or when booting from Kexec on a UEFI system without CSM.

Use the information directly supplied by Multiboot boot information
instead.
---
 xen/arch/x86/boot/head.S | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10..31a0663e6d 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -524,33 +524,15 @@ trampoline_bios_setup:
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
-        /*
-         * Compare the value in the BDA with the information from the
-         * multiboot structure (if available) and use the smallest.
-         */
-        cmp     $0x100,%edx         /* is the multiboot value too small? */
-        jb      2f                  /* if so, do not use it */
-        shl     $10-4,%edx
-        cmp     %ecx,%edx           /* compare with BDA value */
-        cmovb   %edx,%ecx           /* and use the smaller */
+        /* Use lower memory size directly from Multiboot */
+        mov     %edx,%ecx
+        /* From arch/x86/smpboot.c: start_eip had better be page-aligned!
*/
+        shr     $2,%ecx
 
-2:
         /* Reserve memory for the trampoline and the low-memory stack. */
-        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
+        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>12),%ecx
 
-        /* From arch/x86/smpboot.c: start_eip had better be page-aligned!
*/
-        xor     %cl, %cl
-        shl     $4, %ecx
+        shl     $12,%ecx
         mov     %ecx,sym_esi(trampoline_phys)
 
 trampoline_setup:
-- 
2.25.1



