Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56D27ADCB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsIg-0007lv-Fz; Mon, 28 Sep 2020 12:30:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMsIf-0007ld-9S
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:30:37 +0000
X-Inumbo-ID: 29c2bd2c-e5df-408a-9fd4-eefed35e396d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29c2bd2c-e5df-408a-9fd4-eefed35e396d;
 Mon, 28 Sep 2020 12:30:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601296235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoftNtm/8qU7dpqotJvRgXu3Zqs2DRJD+DRNHMewch4=;
 b=p+wPWs91yNOg6elDLU4qUBdxEvDQNwNE5cjUG1tM2VPduGify30xjJwW6+2lUX85Gv+XHG
 6MulasoE+AMZpCyTVXqf1k8onzEturzhbTdocSLFSxih6pPEPehuHXdUCdhwjWXB7bpfBl
 T09m4eBUmQoCi1Bn7ssSoiD59MojCGw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76E36B06A;
 Mon, 28 Sep 2020 12:30:35 +0000 (UTC)
Subject: [PATCH v2 3/6] x86: drop ASM_{CL,ST}AC
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Message-ID: <0808b6a2-eae8-c18e-bd54-5f54c6a0b679@suse.com>
Date: Mon, 28 Sep 2020 14:30:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use ALTERNATIVE directly, such that at the use sites it is visible that
alternative code patching is in use. Similarly avoid hiding the fact in
SAVE_ALL.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Further adjust comment in asm_domain_crash_synchronous().

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2165,9 +2165,8 @@ void activate_debugregs(const struct vcp
 void asm_domain_crash_synchronous(unsigned long addr)
 {
     /*
-     * We need clear AC bit here because in entry.S AC is set
-     * by ASM_STAC to temporarily allow accesses to user pages
-     * which is prevented by SMAP by default.
+     * We need to clear the AC bit here because the exception fixup logic
+     * may leave user accesses enabled.
      *
      * For some code paths, where this function is called, clac()
      * is not needed, but adding clac() here instead of each place
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -12,7 +12,7 @@
 #include <irq_vectors.h>
 
 ENTRY(entry_int82)
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $HYPERCALL_VECTOR, 4(%rsp)
         SAVE_ALL compat=1 /* DPL1 gate, restricted to 32bit PV guests only. */
@@ -284,7 +284,7 @@ ENTRY(compat_int80_direct_trap)
 compat_create_bounce_frame:
         ASSERT_INTERRUPTS_ENABLED
         mov   %fs,%edi
-        ASM_STAC
+        ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         testb $2,UREGS_cs+8(%rsp)
         jz    1f
         /* Push new frame at registered guest-OS stack base. */
@@ -331,7 +331,7 @@ compat_create_bounce_frame:
         movl  TRAPBOUNCE_error_code(%rdx),%eax
 .Lft8:  movl  %eax,%fs:(%rsi)           # ERROR CODE
 1:
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         /* Rewrite our stack frame and return to guest-OS mode. */
         /* IA32 Ref. Vol. 3: TF, VM, RF and NT flags are cleared on trap. */
         andl  $~(X86_EFLAGS_VM|X86_EFLAGS_RF|\
@@ -377,7 +377,7 @@ compat_crash_page_fault_4:
         addl  $4,%esi
 compat_crash_page_fault:
 .Lft14: mov   %edi,%fs
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         movl  %esi,%edi
         call  show_page_walk
         jmp   dom_crash_sync_extable
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -276,7 +276,7 @@ ENTRY(sysenter_entry)
         pushq $0
         pushfq
 GLOBAL(sysenter_eflags_saved)
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
         pushq $0
@@ -329,7 +329,7 @@ UNLIKELY_END(sysenter_gpf)
         jmp   .Lbounce_exception
 
 ENTRY(int80_direct_trap)
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $0x80, 4(%rsp)
         SAVE_ALL
@@ -448,7 +448,7 @@ __UNLIKELY_END(create_bounce_frame_bad_s
 
         subq  $7*8,%rsi
         movq  UREGS_ss+8(%rsp),%rax
-        ASM_STAC
+        ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
         movq  VCPU_domain(%rbx),%rdi
         STORE_GUEST_STACK(rax,6)        # SS
         movq  UREGS_rsp+8(%rsp),%rax
@@ -486,7 +486,7 @@ __UNLIKELY_END(create_bounce_frame_bad_s
         STORE_GUEST_STACK(rax,1)        # R11
         movq  UREGS_rcx+8(%rsp),%rax
         STORE_GUEST_STACK(rax,0)        # RCX
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
 
 #undef STORE_GUEST_STACK
 
@@ -528,11 +528,11 @@ domain_crash_page_fault_2x8:
 domain_crash_page_fault_1x8:
         addq  $8,%rsi
 domain_crash_page_fault_0x8:
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         movq  %rsi,%rdi
         call  show_page_walk
 ENTRY(dom_crash_sync_extable)
-        ASM_CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         # Get out of the guest-save area of the stack.
         GET_STACK_END(ax)
         leaq  STACK_CPUINFO_FIELD(guest_cpu_user_regs)(%rax),%rsp
@@ -590,7 +590,8 @@ UNLIKELY_END(exit_cr3)
         iretq
 
 ENTRY(common_interrupt)
-        SAVE_ALL CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        SAVE_ALL
 
         GET_STACK_END(14)
 
@@ -622,7 +623,8 @@ ENTRY(page_fault)
         movl  $TRAP_page_fault,4(%rsp)
 /* No special register assumptions. */
 GLOBAL(handle_exception)
-        SAVE_ALL CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        SAVE_ALL
 
         GET_STACK_END(14)
 
@@ -827,7 +829,8 @@ ENTRY(entry_CP)
 ENTRY(double_fault)
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
-        SAVE_ALL STAC
+        ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
+        SAVE_ALL
 
         GET_STACK_END(14)
 
@@ -860,7 +863,8 @@ ENTRY(nmi)
         pushq $0
         movl  $TRAP_nmi,4(%rsp)
 handle_ist_exception:
-        SAVE_ALL CLAC
+        ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
+        SAVE_ALL
 
         GET_STACK_END(14)
 
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -200,16 +200,6 @@ register unsigned long current_stack_poi
         UNLIKELY_END_SECTION "\n"          \
         ".Llikely." #tag ".%=:"
 
-#endif
-
-#ifdef __ASSEMBLY__
-.macro ASM_STAC
-    ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
-.endm
-.macro ASM_CLAC
-    ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
-.endm
-#else
 static always_inline void clac(void)
 {
     /* Note: a barrier is implicit in alternative() */
@@ -224,18 +214,7 @@ static always_inline void stac(void)
 #endif
 
 #ifdef __ASSEMBLY__
-.macro SAVE_ALL op, compat=0
-.ifeqs "\op", "CLAC"
-        ASM_CLAC
-.else
-.ifeqs "\op", "STAC"
-        ASM_STAC
-.else
-.ifnb \op
-        .err
-.endif
-.endif
-.endif
+.macro SAVE_ALL compat=0
         addq  $-(UREGS_error_code-UREGS_r15), %rsp
         cld
         movq  %rdi,UREGS_rdi(%rsp)


