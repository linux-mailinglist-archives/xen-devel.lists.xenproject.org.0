Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E29220A6D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:48:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvey1-0002iJ-7N; Wed, 15 Jul 2020 10:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvexz-0002i6-Mq
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:48:47 +0000
X-Inumbo-ID: c204da5a-c688-11ea-93b7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c204da5a-c688-11ea-93b7-12813bfff9fa;
 Wed, 15 Jul 2020 10:48:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3884AAE8;
 Wed, 15 Jul 2020 10:48:48 +0000 (UTC)
Subject: [PATCH 2/4] x86: reduce CET-SS related #ifdef-ary
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
Message-ID: <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
Date: Wed, 15 Jul 2020 12:48:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
to introduce a number of #ifdef-s to make the build work with older tool
chains. Introduce an assembler macro covering for tool chains not
knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
problem to be dropped again.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Now that I've done this I'm not longer sure which direction is better to
follow: On one hand this introduces dead code (even if just NOPs) into
CET-SS-disabled builds. Otoh this is a step towards breaking the tool
chain version dependency of the feature.

I've also dropped conditionals around bigger chunks of code; while I
think that's preferable, I'm open to undo those parts.

--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -31,7 +31,6 @@ ENTRY(__high_start)
         jz      .L_bsp
 
         /* APs.  Set up shadow stacks before entering C. */
-#ifdef CONFIG_XEN_SHSTK
         testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
                 CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
         je      .L_ap_shstk_done
@@ -55,7 +54,6 @@ ENTRY(__high_start)
         mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
         mov     %rcx, %cr4
         setssbsy
-#endif
 
 .L_ap_shstk_done:
         call    start_secondary
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -668,7 +668,7 @@ static void __init noreturn reinit_bsp_s
     stack_base[0] = stack;
     memguard_guard_stack(stack);
 
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
+    if ( cpu_has_xen_shstk )
     {
         wrmsrl(MSR_PL0_SSP,
                (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -198,9 +198,7 @@ ENTRY(cr4_pv32_restore)
 
 /* See lstar_enter for entry register state. */
 ENTRY(cstar_enter)
-#ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
-#endif
         /* sti could live here when we don't switch page tables below. */
         CR4_PV32_RESTORE
         movq  8(%rsp),%rax /* Restore %rax. */
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -237,9 +237,7 @@ iret_exit_to_guest:
  * %ss must be saved into the space left by the trampoline.
  */
 ENTRY(lstar_enter)
-#ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
-#endif
         /* sti could live here when we don't switch page tables below. */
         movq  8(%rsp),%rax /* Restore %rax. */
         movq  $FLAT_KERNEL_SS,8(%rsp)
@@ -273,9 +271,7 @@ ENTRY(lstar_enter)
         jmp   test_all_events
 
 ENTRY(sysenter_entry)
-#ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
-#endif
         /* sti could live here when we don't switch page tables below. */
         pushq $FLAT_USER_SS
         pushq $0
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -7,3 +7,9 @@
     .byte 0x0f, 0x01, 0xcb
 .endm
 #endif
+
+#ifndef CONFIG_HAS_AS_CET_SS
+.macro setssbsy
+    .byte 0xf3, 0x0f, 0x01, 0xe8
+.endm
+#endif


