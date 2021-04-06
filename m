Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B396E3555EF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105984.202665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmGl-0005IA-Jj; Tue, 06 Apr 2021 14:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105984.202665; Tue, 06 Apr 2021 14:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmGl-0005Hl-Gd; Tue, 06 Apr 2021 14:01:27 +0000
Received: by outflank-mailman (input) for mailman id 105984;
 Tue, 06 Apr 2021 14:01:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTmGj-0005Hf-Vg
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:01:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0490220a-22ad-41a5-9b4f-ee345d756fe1;
 Tue, 06 Apr 2021 14:01:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4077AB1BD;
 Tue,  6 Apr 2021 14:01:23 +0000 (UTC)
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
X-Inumbo-ID: 0490220a-22ad-41a5-9b4f-ee345d756fe1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617717683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEnWGL/BSIvoY8CXWjvvr4hQ9Rbcec+UPdK7vVB1MBg=;
	b=hPWawKy4pvj9a6moTqEg5jPb4ALOHXaXDni0WTAF4YmoS9SwN90pTeWclCO8R37fr8gZD8
	CEcYCtA4D3rcym0sF8cHdG23PpXX//ZNbnzQR+JmV8VO5xYZ/fHSLD7G7aKNJ8gryeyvey
	2YsDsRK6N0MAJUzLR1Fcetq5WO6+ONE=
Subject: [PATCH v2 1/3] x86: don't build unused entry code when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Message-ID: <213007e3-bb4c-a564-ca1d-860283646be4@suse.com>
Date: Tue, 6 Apr 2021 16:01:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Except for the initial part of cstar_enter compat/entry.S is all dead
code in this case. Further, along the lines of the PV conditionals we
already have in entry.S, make code PV32-conditional there too (to a
fair part because this code actually references compat/entry.S).

This has the side effect of moving the tail part (now at compat_syscall)
of the code out of .text.entry (in line with e.g. compat_sysenter).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Avoid #ifdef-ary in compat/entry.S.
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
@@ -11,8 +11,6 @@
 #include <public/xen.h>
 #include <irq_vectors.h>
 
-#ifdef CONFIG_PV32
-
 ENTRY(entry_int82)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -29,8 +27,6 @@ ENTRY(entry_int82)
         mov   %rsp, %rdi
         call  do_entry_int82
 
-#endif /* CONFIG_PV32 */
-
 /* %rbx: struct vcpu */
 ENTRY(compat_test_all_events)
         ASSERT_NOT_IN_ATOMIC
@@ -197,43 +193,7 @@ ENTRY(cr4_pv32_restore)
         xor   %eax, %eax
         ret
 
-        .section .text.entry, "ax", @progbits
-
-/* See lstar_enter for entry register state. */
-ENTRY(cstar_enter)
-#ifdef CONFIG_XEN_SHSTK
-        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
-#endif
-        /* sti could live here when we don't switch page tables below. */
-        CR4_PV32_RESTORE
-        movq  8(%rsp),%rax /* Restore %rax. */
-        movq  $FLAT_USER_SS32, 8(%rsp) /* Assume a 64bit domain.  Compat handled lower. */
-        pushq %r11
-        pushq $FLAT_USER_CS32
-        pushq %rcx
-        pushq $0
-        movl  $TRAP_syscall, 4(%rsp)
-        SAVE_ALL
-
-        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, Clob: acd */
-        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
-
-        GET_STACK_END(bx)
-        mov   STACK_CPUINFO_FIELD(xen_cr3)(%rbx), %rcx
-        test  %rcx, %rcx
-        jz    .Lcstar_cr3_okay
-        movb  $0, STACK_CPUINFO_FIELD(use_pv_cr3)(%rbx)
-        mov   %rcx, %cr3
-        /* %r12 is still zero at this point. */
-        mov   %r12, STACK_CPUINFO_FIELD(xen_cr3)(%rbx)
-.Lcstar_cr3_okay:
-        sti
-
-        movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
-        movq  VCPU_domain(%rbx),%rcx
-        cmpb  $0,DOMAIN_is_32bit_pv(%rcx)
-        je    switch_to_kernel
-
+ENTRY(compat_syscall)
         /* Fix up reported %cs/%ss for compat domains. */
         movl  $FLAT_COMPAT_USER_SS, UREGS_ss(%rsp)
         movl  $FLAT_COMPAT_USER_CS, UREGS_cs(%rsp)
@@ -262,8 +222,6 @@ UNLIKELY_END(compat_syscall_gpf)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         jmp   .Lcompat_bounce_exception
 
-        .text
-
 ENTRY(compat_sysenter)
         CR4_PV32_RESTORE
         movq  VCPU_trap_ctxt(%rbx),%rcx
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_PV) += compat/
+obj-$(CONFIG_PV32) += compat/
 
 obj-bin-y += entry.o
 obj-y += traps.o
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -24,7 +24,7 @@
 
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
-ENTRY(switch_to_kernel)
+switch_to_kernel:
         leaq  VCPU_trap_bounce(%rbx),%rdx
 
         /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
@@ -283,6 +283,45 @@ ENTRY(lstar_enter)
         call  pv_hypercall
         jmp   test_all_events
 
+/* See lstar_enter for entry register state. */
+ENTRY(cstar_enter)
+#ifdef CONFIG_XEN_SHSTK
+        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
+#endif
+        /* sti could live here when we don't switch page tables below. */
+        CR4_PV32_RESTORE
+        movq  8(%rsp), %rax /* Restore %rax. */
+        movq  $FLAT_USER_SS32, 8(%rsp) /* Assume a 64bit domain.  Compat handled lower. */
+        pushq %r11
+        pushq $FLAT_USER_CS32
+        pushq %rcx
+        pushq $0
+        movl  $TRAP_syscall, 4(%rsp)
+        SAVE_ALL
+
+        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo, Clob: acd */
+        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
+
+        GET_STACK_END(bx)
+        mov   STACK_CPUINFO_FIELD(xen_cr3)(%rbx), %rcx
+        test  %rcx, %rcx
+        jz    .Lcstar_cr3_okay
+        movb  $0, STACK_CPUINFO_FIELD(use_pv_cr3)(%rbx)
+        mov   %rcx, %cr3
+        /* %r12 is still zero at this point. */
+        mov   %r12, STACK_CPUINFO_FIELD(xen_cr3)(%rbx)
+.Lcstar_cr3_okay:
+        sti
+
+        movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
+
+#ifdef CONFIG_PV32
+        movq  VCPU_domain(%rbx), %rcx
+        cmpb  $0, DOMAIN_is_32bit_pv(%rcx)
+        jne   compat_syscall
+#endif
+        jmp   switch_to_kernel
+
 ENTRY(sysenter_entry)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
@@ -340,8 +379,10 @@ UNLIKELY_END(sysenter_gpf)
         movq  VCPU_domain(%rbx),%rdi
         movq  %rax,TRAPBOUNCE_eip(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
+#ifdef CONFIG_PV32
         cmpb  $0, DOMAIN_is_32bit_pv(%rdi)
         jne   compat_sysenter
+#endif
         jmp   .Lbounce_exception
 
 ENTRY(int80_direct_trap)
@@ -382,6 +423,7 @@ UNLIKELY_END(msi_check)
         mov    0x80 * TRAPINFO_sizeof + TRAPINFO_eip(%rsi), %rdi
         movzwl 0x80 * TRAPINFO_sizeof + TRAPINFO_cs (%rsi), %ecx
 
+#ifdef CONFIG_PV32
         mov   %ecx, %edx
         and   $~3, %edx
 
@@ -390,6 +432,10 @@ UNLIKELY_END(msi_check)
 
         test  %rdx, %rdx
         jz    int80_slow_path
+#else
+        test  %rdi, %rdi
+        jz    int80_slow_path
+#endif
 
         /* Construct trap_bounce from trap_ctxt[0x80]. */
         lea   VCPU_trap_bounce(%rbx), %rdx
@@ -402,8 +448,10 @@ UNLIKELY_END(msi_check)
         lea   (, %rcx, TBF_INTERRUPT), %ecx
         mov   %cl, TRAPBOUNCE_flags(%rdx)
 
+#ifdef CONFIG_PV32
         cmpb  $0, DOMAIN_is_32bit_pv(%rax)
         jne   compat_int80_direct_trap
+#endif
 
         call  create_bounce_frame
         jmp   test_all_events
@@ -555,12 +603,16 @@ ENTRY(dom_crash_sync_extable)
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
@@ -578,11 +630,15 @@ ret_from_intr:
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
 ret_from_intr:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
@@ -671,7 +727,7 @@ handle_exception_saved:
         testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
         jz    exception_with_ints_disabled
 
-#ifdef CONFIG_PV
+#if defined(CONFIG_PV32)
         ALTERNATIVE_2 "jmp .Lcr4_pv32_done", \
             __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMEP, \
             __stringify(mov VCPU_domain(%rbx), %rax), X86_FEATURE_XEN_SMAP
@@ -711,7 +767,7 @@ handle_exception_saved:
         test  $~(PFEC_write_access|PFEC_insn_fetch),%eax
         jz    compat_test_all_events
 .Lcr4_pv32_done:
-#else
+#elif !defined(CONFIG_PV)
         ASSERT_CONTEXT_IS_XEN
 #endif /* CONFIG_PV */
         sti
@@ -730,9 +786,11 @@ handle_exception_saved:
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
@@ -968,11 +1026,16 @@ handle_ist_exception:
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
@@ -305,7 +305,7 @@ static always_inline void stac(void)
         subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
 .endm
 
-#ifdef CONFIG_PV
+#ifdef CONFIG_PV32
 #define CR4_PV32_RESTORE                               \
     ALTERNATIVE_2 "",                                  \
         "call cr4_pv32_restore", X86_FEATURE_XEN_SMEP, \


