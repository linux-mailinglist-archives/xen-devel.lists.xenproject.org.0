Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F07296B48
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10770.28727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsYj-00068f-LW; Fri, 23 Oct 2020 08:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10770.28727; Fri, 23 Oct 2020 08:36:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsYj-000688-IG; Fri, 23 Oct 2020 08:36:25 +0000
Received: by outflank-mailman (input) for mailman id 10770;
 Fri, 23 Oct 2020 08:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVsYh-00067q-VY
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:36:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b607beda-8cc8-40fa-8a61-9930c404667a;
 Fri, 23 Oct 2020 08:36:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 126DFABF4;
 Fri, 23 Oct 2020 08:36:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVsYh-00067q-VY
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:36:24 +0000
X-Inumbo-ID: b607beda-8cc8-40fa-8a61-9930c404667a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b607beda-8cc8-40fa-8a61-9930c404667a;
	Fri, 23 Oct 2020 08:36:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603442182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSzaqBucHamXYL/0i8gmtZ51yyje1EHpgu1r982aK4g=;
	b=NJCsOqLu0bAhtAhfDoOB37Kduh4hSvC/yxM1RdWJpg+7wdILPrcD9vs5S6o9F/OQyhOX3j
	Ao4YW4Wj2LDcVl2p5BQ0cPk/KB0IWs7e0jManND1H9E6bi1P0KoYpQ8ASSkUFhog00yOIY
	uwJOAa8pW8NNX5imvfzPs5jDsHm3dUQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 126DFABF4;
	Fri, 23 Oct 2020 08:36:22 +0000 (UTC)
Subject: [PATCH v3 2/7] x86: reduce CET-SS related #ifdef-ary
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Message-ID: <1c7f05af-a979-0c12-4951-26bc15fb5597@suse.com>
Date: Fri, 23 Oct 2020 10:36:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
to introduce a number of #ifdef-s to make the build work with older tool
chains. Introduce an assembler macro covering for tool chains not
knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
problem to be dropped again.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Now that I've done this I'm no longer sure which direction is better to
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
@@ -197,9 +197,7 @@ ENTRY(cr4_pv32_restore)
 
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
@@ -236,9 +236,7 @@ iret_exit_to_guest:
  * %ss must be saved into the space left by the trampoline.
  */
 ENTRY(lstar_enter)
-#ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
-#endif
         /* sti could live here when we don't switch page tables below. */
         movq  8(%rsp),%rax /* Restore %rax. */
         movq  $FLAT_KERNEL_SS,8(%rsp)
@@ -272,9 +270,7 @@ ENTRY(lstar_enter)
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


