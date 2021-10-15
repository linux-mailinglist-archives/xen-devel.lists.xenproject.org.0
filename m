Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCE42F17C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210484.367444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMhG-0003xu-Ab; Fri, 15 Oct 2021 12:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210484.367444; Fri, 15 Oct 2021 12:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMhF-0003se-Ux; Fri, 15 Oct 2021 12:52:25 +0000
Received: by outflank-mailman (input) for mailman id 210484;
 Fri, 15 Oct 2021 12:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbMhE-00012o-3r
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:52:24 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7384eba4-6dd3-4a31-8f37-ead6aba339fd;
 Fri, 15 Oct 2021 12:52:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDBEC21A67;
 Fri, 15 Oct 2021 12:52:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1B6413C1A;
 Fri, 15 Oct 2021 12:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yIMXLnR5aWEYHgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 12:52:04 +0000
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
X-Inumbo-ID: 7384eba4-6dd3-4a31-8f37-ead6aba339fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634302324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbzgjhMjFz2fWHYnyWUY/M+bimSV/pLOA+XqwH3l3Aw=;
	b=LdLDqd87d31wjMIlDA/zNFkeruGrcTmVrnV+BCNHuHI4dimTIAW7T11JHvgWiWQk7JoeZL
	rfjWSzYm6wV9dxZm66VoZO6rSxcagw1GFzU6KVVf7Xeehrl3zJ7+MKjaP4UetgN21Q7Szh
	5rEMjOcg4Ke/Q+6iP36bkQgU3OgGJrs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 10/12] xen/x86: call hypercall handlers via switch statement
Date: Fri, 15 Oct 2021 14:51:50 +0200
Message-Id: <20211015125152.25198-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211015125152.25198-1-jgross@suse.com>
References: <20211015125152.25198-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a function table use the generated switch statement
macros for calling the appropriate hypercall handlers.

This is beneficial to performance and avoids speculation issues.

With calling the handlers using the correct number of parameters now
it is possible to do the parameter register clobbering in the NDEBUG
case after returning from the handler. This in turn removes the only
users of hypercall_args_table[] which can be removed now.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/hvm/hypercall.c    | 144 +++----------------------
 xen/arch/x86/hypercall.c        |  59 -----------
 xen/arch/x86/pv/hypercall.c     | 180 +++-----------------------------
 xen/include/asm-x86/hypercall.h |  43 +++++---
 4 files changed, 60 insertions(+), 366 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 85b7a33523..e766cf4c72 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -108,56 +108,10 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         return compat_physdev_op(cmd, arg);
 }
 
-#define HYPERCALL(x)                                         \
-    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,  \
-                               (hypercall_fn_t *) do_ ## x }
-
-#define HVM_CALL(x)                                          \
-    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) hvm_ ## x, \
-                               (hypercall_fn_t *) hvm_ ## x }
-
-#define COMPAT_CALL(x)                                       \
-    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,  \
-                               (hypercall_fn_t *) compat_ ## x }
-
-static const struct {
-    hypercall_fn_t *native, *compat;
-} hvm_hypercall_table[] = {
-    HVM_CALL(memory_op),
-    COMPAT_CALL(multicall),
-#ifdef CONFIG_GRANT_TABLE
-    HVM_CALL(grant_table_op),
-#endif
-    HYPERCALL(vm_assist),
-    COMPAT_CALL(vcpu_op),
-    HVM_CALL(physdev_op),
-    COMPAT_CALL(xen_version),
-    HYPERCALL(console_io),
-    HYPERCALL(event_channel_op),
-    COMPAT_CALL(sched_op),
-    COMPAT_CALL(set_timer_op),
-    COMPAT_CALL(xsm_op),
-    HYPERCALL(hvm_op),
-    HYPERCALL(sysctl),
-    HYPERCALL(domctl),
-#ifdef CONFIG_ARGO
-    COMPAT_CALL(argo_op),
-#endif
-    COMPAT_CALL(platform_op),
-#ifdef CONFIG_PV
-    COMPAT_CALL(mmuext_op),
-#endif
-    HYPERCALL(xenpmu_op),
-    COMPAT_CALL(dm_op),
-#ifdef CONFIG_HYPFS
-    HYPERCALL(hypfs_op),
+#ifndef NDEBUG
+static unsigned char hypercall_args_64[] = hypercall_args_hvm64;
+static unsigned char hypercall_args_32[] = hypercall_args_hvm32;
 #endif
-    HYPERCALL(paging_domctl_cont)
-};
-
-#undef HYPERCALL
-#undef HVM_CALL
-#undef COMPAT_CALL
 
 int hvm_hypercall(struct cpu_user_regs *regs)
 {
@@ -203,23 +157,6 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         return ret;
     }
 
-    BUILD_BUG_ON(ARRAY_SIZE(hvm_hypercall_table) >
-                 ARRAY_SIZE(hypercall_args_table));
-
-    if ( eax >= ARRAY_SIZE(hvm_hypercall_table) )
-    {
-        regs->rax = -ENOSYS;
-        return HVM_HCALL_completed;
-    }
-
-    eax = array_index_nospec(eax, ARRAY_SIZE(hvm_hypercall_table));
-
-    if ( !hvm_hypercall_table[eax].native )
-    {
-        regs->rax = -ENOSYS;
-        return HVM_HCALL_completed;
-    }
-
     /*
      * Caching is intended for instruction emulation only. Disable it
      * for any accesses by hypercall argument copy-in / copy-out.
@@ -239,33 +176,11 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
                     eax, rdi, rsi, rdx, r10, r8);
 
-#ifndef NDEBUG
-        /* Deliberately corrupt parameter regs not used by this hypercall. */
-        switch ( hypercall_args_table[eax].native )
-        {
-        case 0: rdi = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 4: r8 = 0xdeadbeefdeadf00dUL;
-        }
-#endif
-
-        regs->rax = hvm_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8);
+        call_handlers_hvm64(eax, regs->rax, rdi, rsi, rdx, r10, r8);
 
 #ifndef NDEBUG
-        if ( !curr->hcall_preempted )
-        {
-            /* Deliberately corrupt parameter regs used by this hypercall. */
-            switch ( hypercall_args_table[eax].native )
-            {
-            case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
-            }
-        }
+        if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
+            clobber_regs(regs, hypercall_args_64[eax]);
 #endif
     }
     else
@@ -279,35 +194,13 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
                     ebx, ecx, edx, esi, edi);
 
-#ifndef NDEBUG
-        /* Deliberately corrupt parameter regs not used by this hypercall. */
-        switch ( hypercall_args_table[eax].compat )
-        {
-        case 0: ebx = 0xdeadf00d; fallthrough;
-        case 1: ecx = 0xdeadf00d; fallthrough;
-        case 2: edx = 0xdeadf00d; fallthrough;
-        case 3: esi = 0xdeadf00d; fallthrough;
-        case 4: edi = 0xdeadf00d;
-        }
-#endif
-
         curr->hcall_compat = true;
-        regs->eax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
+        call_handlers_hvm32(eax, regs->eax, ebx, ecx, edx, esi, edi);
         curr->hcall_compat = false;
 
 #ifndef NDEBUG
-        if ( !curr->hcall_preempted )
-        {
-            /* Deliberately corrupt parameter regs used by this hypercall. */
-            switch ( hypercall_args_table[eax].compat )
-            {
-            case 5: regs->rdi = 0xdeadf00d; fallthrough;
-            case 4: regs->rsi = 0xdeadf00d; fallthrough;
-            case 3: regs->rdx = 0xdeadf00d; fallthrough;
-            case 2: regs->rcx = 0xdeadf00d; fallthrough;
-            case 1: regs->rbx = 0xdeadf00d;
-            }
-        }
+        if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
+            clobber_regs32(regs, hypercall_args_32[eax]);
 #endif
     }
 
@@ -327,31 +220,20 @@ int hvm_hypercall(struct cpu_user_regs *regs)
 enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
 {
     struct vcpu *curr = current;
-    hypercall_fn_t *func = NULL;
 
     if ( hvm_guest_x86_mode(curr) == 8 )
     {
         struct multicall_entry *call = &state->call;
 
-        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
-            func = array_access_nospec(hvm_hypercall_table, call->op).native;
-        if ( func )
-            call->result = func(call->args[0], call->args[1], call->args[2],
-                                call->args[3], call->args[4]);
-        else
-            call->result = -ENOSYS;
+        call_handlers_hvm64(call->op, call->result, call->args[0], call->args[1],
+                            call->args[2], call->args[3], call->args[4]);
     }
     else
     {
         struct compat_multicall_entry *call = &state->compat_call;
 
-        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
-            func = array_access_nospec(hvm_hypercall_table, call->op).compat;
-        if ( func )
-            call->result = func(call->args[0], call->args[1], call->args[2],
-                                call->args[3], call->args[4]);
-        else
-            call->result = -ENOSYS;
+        call_handlers_hvm32(call->op, call->result, call->args[0], call->args[1],
+                            call->args[2], call->args[3], call->args[4]);
     }
 
     return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 07e1a45ef5..6b73cff9b9 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -22,65 +22,6 @@
 #include <xen/hypercall.h>
 #include <asm/multicall.h>
 
-#ifdef CONFIG_COMPAT
-#define ARGS(x, n)                              \
-    [ __HYPERVISOR_ ## x ] = { n, n }
-#define COMP(x, n, c)                           \
-    [ __HYPERVISOR_ ## x ] = { n, c }
-#else
-#define ARGS(x, n)    [ __HYPERVISOR_ ## x ] = { n }
-#define COMP(x, n, c) ARGS(x, n)
-#endif
-
-const hypercall_args_t hypercall_args_table[NR_hypercalls] =
-{
-    ARGS(set_trap_table, 1),
-    ARGS(mmu_update, 4),
-    ARGS(set_gdt, 2),
-    ARGS(stack_switch, 2),
-    COMP(set_callbacks, 3, 4),
-    ARGS(fpu_taskswitch, 1),
-    ARGS(sched_op_compat, 2),
-    ARGS(platform_op, 1),
-    ARGS(set_debugreg, 2),
-    ARGS(get_debugreg, 1),
-    COMP(update_descriptor, 2, 4),
-    ARGS(memory_op, 2),
-    ARGS(multicall, 2),
-    COMP(update_va_mapping, 3, 4),
-    COMP(set_timer_op, 1, 2),
-    ARGS(event_channel_op_compat, 1),
-    ARGS(xen_version, 2),
-    ARGS(console_io, 3),
-    ARGS(physdev_op_compat, 1),
-    ARGS(grant_table_op, 3),
-    ARGS(vm_assist, 2),
-    COMP(update_va_mapping_otherdomain, 4, 5),
-    ARGS(vcpu_op, 3),
-    COMP(set_segment_base, 2, 0),
-    ARGS(mmuext_op, 4),
-    ARGS(xsm_op, 1),
-    ARGS(nmi_op, 2),
-    ARGS(sched_op, 2),
-    ARGS(callback_op, 2),
-    ARGS(xenoprof_op, 2),
-    ARGS(event_channel_op, 2),
-    ARGS(physdev_op, 2),
-    ARGS(sysctl, 1),
-    ARGS(domctl, 1),
-    ARGS(kexec_op, 2),
-    ARGS(argo_op, 5),
-    ARGS(xenpmu_op, 2),
-    ARGS(hvm_op, 2),
-    ARGS(dm_op, 3),
-    ARGS(hypfs_op, 5),
-    ARGS(mca, 1),
-    ARGS(paging_domctl_cont, 1),
-};
-
-#undef COMP
-#undef ARGS
-
 #define NEXT_ARG(fmt, args)                                                 \
 ({                                                                          \
     unsigned long __arg;                                                    \
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 6c4a32d2a6..9b575e5c0b 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -27,119 +27,22 @@
 #include <asm/multicall.h>
 #include <irq_vectors.h>
 
-typedef struct {
-    hypercall_fn_t *native;
-#ifdef CONFIG_PV32
-    hypercall_fn_t *compat;
-#endif
-} pv_hypercall_table_t;
-
+#ifndef NDEBUG
+static unsigned char hypercall_args_64[] = hypercall_args_pv64;
 #ifdef CONFIG_PV32
-#define HYPERCALL(x)                                                \
-    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,         \
-                               (hypercall_fn_t *) do_ ## x }
-#define COMPAT_CALL(x)                                              \
-    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,         \
-                               (hypercall_fn_t *) compat_ ## x }
-#else
-#define HYPERCALL(x)                                                \
-    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x }
-#define COMPAT_CALL(x) HYPERCALL(x)
-#endif
-
-static const pv_hypercall_table_t pv_hypercall_table[] = {
-    COMPAT_CALL(set_trap_table),
-    HYPERCALL(mmu_update),
-    COMPAT_CALL(set_gdt),
-    HYPERCALL(stack_switch),
-    COMPAT_CALL(set_callbacks),
-    HYPERCALL(fpu_taskswitch),
-    HYPERCALL(sched_op_compat),
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
-    COMPAT_CALL(platform_op),
-#endif
-    HYPERCALL(set_debugreg),
-    HYPERCALL(get_debugreg),
-    COMPAT_CALL(update_descriptor),
-    COMPAT_CALL(memory_op),
-    COMPAT_CALL(multicall),
-    COMPAT_CALL(update_va_mapping),
-    COMPAT_CALL(set_timer_op),
-    HYPERCALL(event_channel_op_compat),
-    COMPAT_CALL(xen_version),
-    HYPERCALL(console_io),
-    COMPAT_CALL(physdev_op_compat),
-#ifdef CONFIG_GRANT_TABLE
-    COMPAT_CALL(grant_table_op),
-#endif
-    HYPERCALL(vm_assist),
-    COMPAT_CALL(update_va_mapping_otherdomain),
-    COMPAT_CALL(iret),
-    COMPAT_CALL(vcpu_op),
-    HYPERCALL(set_segment_base),
-    COMPAT_CALL(mmuext_op),
-    COMPAT_CALL(xsm_op),
-    COMPAT_CALL(nmi_op),
-    COMPAT_CALL(sched_op),
-    COMPAT_CALL(callback_op),
-#ifdef CONFIG_XENOPROF
-    COMPAT_CALL(xenoprof_op),
-#endif
-    HYPERCALL(event_channel_op),
-    COMPAT_CALL(physdev_op),
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
-    HYPERCALL(sysctl),
-    HYPERCALL(domctl),
+static unsigned char hypercall_args_32[] = hypercall_args_pv32;
 #endif
-#ifdef CONFIG_KEXEC
-    COMPAT_CALL(kexec_op),
 #endif
-#ifdef CONFIG_ARGO
-    COMPAT_CALL(argo_op),
-#endif
-    HYPERCALL(xenpmu_op),
-#ifdef CONFIG_HVM
-    HYPERCALL(hvm_op),
-    COMPAT_CALL(dm_op),
-#endif
-#ifdef CONFIG_HYPFS
-    HYPERCALL(hypfs_op),
-#endif
-    HYPERCALL(mca),
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
-    HYPERCALL(paging_domctl_cont),
-#endif
-};
-
-#undef COMPAT_CALL
-#undef HYPERCALL
 
 /* Forced inline to cause 'compat' to be evaluated at compile time. */
 static void always_inline
 _pv_hypercall(struct cpu_user_regs *regs, bool compat)
 {
     struct vcpu *curr = current;
-    unsigned long eax = compat ? regs->eax : regs->rax;
+    unsigned long eax;
 
     ASSERT(guest_kernel_mode(curr, regs));
 
-    BUILD_BUG_ON(ARRAY_SIZE(pv_hypercall_table) >
-                 ARRAY_SIZE(hypercall_args_table));
-
-    if ( eax >= ARRAY_SIZE(pv_hypercall_table) )
-    {
-        regs->rax = -ENOSYS;
-        return;
-    }
-
-    eax = array_index_nospec(eax, ARRAY_SIZE(pv_hypercall_table));
-
-    if ( !pv_hypercall_table[eax].native )
-    {
-        regs->rax = -ENOSYS;
-        return;
-    }
-
     curr->hcall_preempted = false;
 
     if ( !compat )
@@ -150,17 +53,8 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         unsigned long r10 = regs->r10;
         unsigned long r8 = regs->r8;
 
-#ifndef NDEBUG
-        /* Deliberately corrupt parameter regs not used by this hypercall. */
-        switch ( hypercall_args_table[eax].native )
-        {
-        case 0: rdi = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 4: r8 = 0xdeadbeefdeadf00dUL;
-        }
-#endif
+        eax = regs->rax;
+
         if ( unlikely(tb_init_done) )
         {
             unsigned long args[5] = { rdi, rsi, rdx, r10, r8 };
@@ -168,21 +62,11 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
             __trace_hypercall(TRC_PV_HYPERCALL_V2, eax, args);
         }
 
-        regs->rax = pv_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8);
+        call_handlers_pv64(eax, regs->rax, rdi, rsi, rdx, r10, r8);
 
 #ifndef NDEBUG
-        if ( !curr->hcall_preempted )
-        {
-            /* Deliberately corrupt parameter regs used by this hypercall. */
-            switch ( hypercall_args_table[eax].native )
-            {
-            case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
-            case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
-            }
-        }
+        if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
+            clobber_regs(regs, hypercall_args_64[eax]);
 #endif
     }
 #ifdef CONFIG_PV32
@@ -194,17 +78,7 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         unsigned int esi = regs->esi;
         unsigned int edi = regs->edi;
 
-#ifndef NDEBUG
-        /* Deliberately corrupt parameter regs not used by this hypercall. */
-        switch ( hypercall_args_table[eax].compat )
-        {
-        case 0: ebx = 0xdeadf00d; fallthrough;
-        case 1: ecx = 0xdeadf00d; fallthrough;
-        case 2: edx = 0xdeadf00d; fallthrough;
-        case 3: esi = 0xdeadf00d; fallthrough;
-        case 4: edi = 0xdeadf00d;
-        }
-#endif
+        eax = regs->eax;
 
         if ( unlikely(tb_init_done) )
         {
@@ -214,22 +88,12 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         }
 
         curr->hcall_compat = true;
-        regs->eax = pv_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
+        call_handlers_pv32(eax, regs->eax, ebx, ecx, edx, esi, edi);
         curr->hcall_compat = false;
 
 #ifndef NDEBUG
-        if ( !curr->hcall_preempted )
-        {
-            /* Deliberately corrupt parameter regs used by this hypercall. */
-            switch ( hypercall_args_table[eax].compat )
-            {
-            case 5: regs->edi = 0xdeadf00d; fallthrough;
-            case 4: regs->esi = 0xdeadf00d; fallthrough;
-            case 3: regs->edx = 0xdeadf00d; fallthrough;
-            case 2: regs->ecx = 0xdeadf00d; fallthrough;
-            case 1: regs->ebx = 0xdeadf00d;
-            }
-        }
+        if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
+            clobber_regs32(regs, hypercall_args_32[eax]);
 #endif
     }
 #endif /* CONFIG_PV32 */
@@ -256,13 +120,8 @@ enum mc_disposition pv_do_multicall_call(struct mc_state *state)
         struct compat_multicall_entry *call = &state->compat_call;
 
         op = call->op;
-        if ( (op < ARRAY_SIZE(pv_hypercall_table)) &&
-             pv_hypercall_table[op].compat )
-            call->result = pv_hypercall_table[op].compat(
-                call->args[0], call->args[1], call->args[2],
-                call->args[3], call->args[4]);
-        else
-            call->result = -ENOSYS;
+        call_handlers_pv32(op, call->result, call->args[0], call->args[1],
+                           call->args[2], call->args[3], call->args[4]);
     }
     else
 #endif
@@ -270,13 +129,8 @@ enum mc_disposition pv_do_multicall_call(struct mc_state *state)
         struct multicall_entry *call = &state->call;
 
         op = call->op;
-        if ( (op < ARRAY_SIZE(pv_hypercall_table)) &&
-             pv_hypercall_table[op].native )
-            call->result = pv_hypercall_table[op].native(
-                call->args[0], call->args[1], call->args[2],
-                call->args[3], call->args[4]);
-        else
-            call->result = -ENOSYS;
+        call_handlers_pv64(op, call->result, call->args[0], call->args[1],
+                           call->args[2], call->args[3], call->args[4]);
     }
 
     return unlikely(op == __HYPERVISOR_iret)
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index eb2907b5b6..f2db3f3c21 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -17,19 +17,6 @@
 
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
 
-typedef unsigned long hypercall_fn_t(
-    unsigned long, unsigned long, unsigned long,
-    unsigned long, unsigned long);
-
-typedef struct {
-    uint8_t native;
-#ifdef CONFIG_COMPAT
-    uint8_t compat;
-#endif
-} hypercall_args_t;
-
-extern const hypercall_args_t hypercall_args_table[NR_hypercalls];
-
 #ifdef CONFIG_PV
 void pv_hypercall(struct cpu_user_regs *regs);
 #endif
@@ -55,4 +42,34 @@ compat_common_vcpu_op(
 
 #endif /* CONFIG_COMPAT */
 
+#ifndef NDEBUG
+static inline void clobber_regs(struct cpu_user_regs *regs,
+                                unsigned int nargs)
+{
+    /* Deliberately corrupt used parameter regs. */
+    switch ( nargs )
+    {
+    case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
+    case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
+    case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
+    case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
+    case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
+    }
+}
+
+static inline void clobber_regs32(struct cpu_user_regs *regs,
+                                  unsigned int nargs)
+{
+    /* Deliberately corrupt used parameter regs. */
+    switch ( nargs )
+    {
+    case 5: regs->edi = 0xdeadf00dUL; fallthrough;
+    case 4: regs->esi = 0xdeadf00dUL; fallthrough;
+    case 3: regs->edx = 0xdeadf00dUL; fallthrough;
+    case 2: regs->ecx = 0xdeadf00dUL; fallthrough;
+    case 1: regs->ebx = 0xdeadf00dUL;
+    }
+}
+#endif
+
 #endif /* __ASM_X86_HYPERCALL_H__ */
-- 
2.26.2


