Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AE2C3B62
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 09:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37466.69847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqWW-0004Jf-2r; Wed, 25 Nov 2020 08:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37466.69847; Wed, 25 Nov 2020 08:51:36 +0000
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
	id 1khqWV-0004JJ-Vx; Wed, 25 Nov 2020 08:51:35 +0000
Received: by outflank-mailman (input) for mailman id 37466;
 Wed, 25 Nov 2020 08:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqWU-0004JA-5y
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:51:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbe23800-881e-4818-ac3a-24c1c7c2a8be;
 Wed, 25 Nov 2020 08:51:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B8DAAC6A;
 Wed, 25 Nov 2020 08:51:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqWU-0004JA-5y
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:51:34 +0000
X-Inumbo-ID: dbe23800-881e-4818-ac3a-24c1c7c2a8be
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dbe23800-881e-4818-ac3a-24c1c7c2a8be;
	Wed, 25 Nov 2020 08:51:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606294292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJH6yk2rnrEcxrdt9KhOPaqgGQgdY6OdkaB7rOBiSSs=;
	b=DHlGTQ4e+KCeeg+0p6SKHFgjOd9flxUR8IVMDAl4vHVVyrOK2F4m0V3RSqt3t+usAAaP7U
	oAcn6vTJUgABQbiVJz/MlxBvysMlS05H+UZUKvAmKbdQZ7nVsceDyrz568qr2USVBaEqbh
	Ys/WqgMSYzHQXSty/dN51tfhw3FIUHg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5B8DAAC6A;
	Wed, 25 Nov 2020 08:51:32 +0000 (UTC)
Subject: [PATCH 5/5] x86: don't build unused entry code when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Message-ID: <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
Date: Wed, 25 Nov 2020 09:51:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Except for the initial part of cstar_enter compat/entry.S is all dead
code in this case. Further, along the lines of the PV conditionals we
already have in entry.S, make code PV32-conditional there too (to a
fair part because this code actually references compat/entry.S).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: I'm on the fence of whether (in a separate patch) to also make
     conditional struct pv_domain's is_32bit field.

--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -9,7 +9,7 @@
 #include <xen/perfc.h>
 #endif
 #include <xen/sched.h>
-#ifdef CONFIG_PV
+#ifdef CONFIG_PV32
 #include <compat/xen.h>
 #endif
 #include <asm/hardirq.h>
@@ -102,19 +102,21 @@ void __dummy__(void)
     BLANK();
 #endif
 
-#ifdef CONFIG_PV
+#ifdef CONFIG_PV32
     OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
     BLANK();
 
-    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
-    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
-    BLANK();
-
     OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
     OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
     BLANK();
 #endif
 
+#ifdef CONFIG_PV
+    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
+    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
+    BLANK();
+#endif
+
     OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
     OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);
     OFFSET(CPUINFO_current_vcpu, struct cpu_info, current_vcpu);
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -29,8 +29,6 @@ ENTRY(entry_int82)
         mov   %rsp, %rdi
         call  do_entry_int82
 
-#endif /* CONFIG_PV32 */
-
 /* %rbx: struct vcpu */
 ENTRY(compat_test_all_events)
         ASSERT_NOT_IN_ATOMIC
@@ -197,6 +195,8 @@ ENTRY(cr4_pv32_restore)
         xor   %eax, %eax
         ret
 
+#endif /* CONFIG_PV32 */
+
         .section .text.entry, "ax", @progbits
 
 /* See lstar_enter for entry register state. */
@@ -230,6 +230,13 @@ ENTRY(cstar_enter)
         sti
 
         movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
+
+#ifndef CONFIG_PV32
+
+        jmp   switch_to_kernel
+
+#else
+
         movq  VCPU_domain(%rbx),%rcx
         cmpb  $0,DOMAIN_is_32bit_pv(%rcx)
         je    switch_to_kernel
@@ -393,3 +400,5 @@ compat_crash_page_fault:
         jmp   .Lft14
 .previous
         _ASM_EXTABLE(.Lft14, .Lfx14)
+
+#endif /* CONFIG_PV32 */
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -328,8 +328,10 @@ UNLIKELY_END(sysenter_gpf)
         movq  VCPU_domain(%rbx),%rdi
         movq  %rax,TRAPBOUNCE_eip(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
+#ifdef CONFIG_PV32
         cmpb  $0, DOMAIN_is_32bit_pv(%rdi)
         jne   compat_sysenter
+#endif
         jmp   .Lbounce_exception
 
 ENTRY(int80_direct_trap)
@@ -370,6 +372,7 @@ UNLIKELY_END(msi_check)
         mov    0x80 * TRAPINFO_sizeof + TRAPINFO_eip(%rsi), %rdi
         movzwl 0x80 * TRAPINFO_sizeof + TRAPINFO_cs (%rsi), %ecx
 
+#ifdef CONFIG_PV32
         mov   %ecx, %edx
         and   $~3, %edx
 
@@ -378,6 +381,10 @@ UNLIKELY_END(msi_check)
 
         test  %rdx, %rdx
         jz    int80_slow_path
+#else
+        test  %rdi, %rdi
+        jz    int80_slow_path
+#endif
 
         /* Construct trap_bounce from trap_ctxt[0x80]. */
         lea   VCPU_trap_bounce(%rbx), %rdx
@@ -390,8 +397,10 @@ UNLIKELY_END(msi_check)
         lea   (, %rcx, TBF_INTERRUPT), %ecx
         mov   %cl, TRAPBOUNCE_flags(%rdx)
 
+#ifdef CONFIG_PV32
         cmpb  $0, DOMAIN_is_32bit_pv(%rax)
         jne   compat_int80_direct_trap
+#endif
 
         call  create_bounce_frame
         jmp   test_all_events
@@ -541,12 +550,16 @@ ENTRY(dom_crash_sync_extable)
         GET_STACK_END(ax)
         leaq  STACK_CPUINFO_FIELD(guest_cpu_user_regs)(%rax),%rsp
         # create_bounce_frame() temporarily clobbers CS.RPL. Fix up.
+#ifdef CONFIG_PV32
         movq  STACK_CPUINFO_FIELD(current_vcpu)(%rax), %rax
         movq  VCPU_domain(%rax),%rax
         cmpb  $0, DOMAIN_is_32bit_pv(%rax)
         sete  %al
         leal  (%rax,%rax,2),%eax
         orb   %al,UREGS_cs(%rsp)
+#else
+        orb   $3, UREGS_cs(%rsp)
+#endif
         xorl  %edi,%edi
         jmp   asm_domain_crash_synchronous /* Does not return */
         .popsection
@@ -562,11 +575,15 @@ ENTRY(ret_from_intr)
         GET_CURRENT(bx)
         testb $3, UREGS_cs(%rsp)
         jz    restore_all_xen
+#ifdef CONFIG_PV32
         movq  VCPU_domain(%rbx), %rax
         cmpb  $0, DOMAIN_is_32bit_pv(%rax)
         je    test_all_events
         jmp   compat_test_all_events
 #else
+        jmp   test_all_events
+#endif
+#else
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
@@ -652,7 +669,7 @@ handle_exception_saved:
         testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
         jz    exception_with_ints_disabled
 
-#ifdef CONFIG_PV
+#if defined(CONFIG_PV32)
         ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
             __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMEP, \
             __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMAP
@@ -692,7 +709,7 @@ handle_exception_saved:
         test  $~(PFEC_write_access|PFEC_insn_fetch),%eax
         jz    compat_test_all_events
 .Lcr4_pv32_done:
-#else
+#elif !defined(CONFIG_PV)
         ASSERT_CONTEXT_IS_XEN
 #endif /* CONFIG_PV */
         sti
@@ -711,9 +728,11 @@ handle_exception_saved:
 #ifdef CONFIG_PV
         testb $3,UREGS_cs(%rsp)
         jz    restore_all_xen
+#ifdef CONFIG_PV32
         movq  VCPU_domain(%rbx),%rax
         cmpb  $0, DOMAIN_is_32bit_pv(%rax)
         jne   compat_test_all_events
+#endif
         jmp   test_all_events
 #else
         ASSERT_CONTEXT_IS_XEN
@@ -947,11 +966,16 @@ handle_ist_exception:
         je    1f
         movl  $EVENT_CHECK_VECTOR,%edi
         call  send_IPI_self
-1:      movq  VCPU_domain(%rbx),%rax
+1:
+#ifdef CONFIG_PV32
+        movq  VCPU_domain(%rbx),%rax
         cmpb  $0,DOMAIN_is_32bit_pv(%rax)
         je    restore_all_guest
         jmp   compat_restore_all_guest
 #else
+        jmp   restore_all_guest
+#endif
+#else
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -333,7 +333,7 @@ static always_inline void stac(void)
         subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
 .endm
 
-#ifdef CONFIG_PV
+#ifdef CONFIG_PV32
 #define CR4_PV32_RESTORE                               \
     ALTERNATIVE_2 "",                                  \
         "call cr4_pv32_restore", X86_FEATURE_XEN_SMEP, \


