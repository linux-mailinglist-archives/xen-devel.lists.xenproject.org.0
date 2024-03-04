Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43B86FD3A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688229.1072204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XU-0003a2-VR; Mon, 04 Mar 2024 09:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688229.1072204; Mon, 04 Mar 2024 09:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XU-0003Wg-Qz; Mon, 04 Mar 2024 09:23:16 +0000
Received: by outflank-mailman (input) for mailman id 688229;
 Mon, 04 Mar 2024 09:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7cd=KK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rh4XS-0002pf-QV
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:23:15 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2e682e4-da08-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 10:23:12 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a45784702bbso26782766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:23:12 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tj10-20020a170907c24a00b00a444526962asm4485529ejc.128.2024.03.04.01.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 01:23:11 -0800 (PST)
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
X-Inumbo-ID: d2e682e4-da08-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709544191; x=1710148991; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nduCErVJMqVVQtvPr6lEcDydzA3X7giYTe88D2YcYv0=;
        b=jWXs4Wq/0Q8nTI3KHNSs2GQZboZlQT1DeaBUwSzTIAVDZ/OvLlKn6w+Qi6JeInkZD1
         5enoGvL18mqaFYtogjy+i29R4W0wImDfUpFZgobRJSN1zEkCmm7GARis12Q9krdg+8F0
         aaJ/DmUz8brwgWPGIbRqTKgRWwqUyE5MR5Q60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544191; x=1710148991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nduCErVJMqVVQtvPr6lEcDydzA3X7giYTe88D2YcYv0=;
        b=Sc+XHgNuZK4BCwUaZa4xtJsx2F7AcnMbt5Fd7brKMMVP8CadvOom6OxtPYj3L6LcyJ
         1pQRKNmW8yNEFSAXgUXWzLXdMzR4JjWl0wsjQ77wb3kxBw4NYeLSa+hfY3TzHG9NXcQm
         R5lUaCgOtbKX8+m1teoK8mSkI3GZn2CwlfNsEjHArMjRpn9PmAbcb/cpGx6wOZTxF8iN
         ifftt/W4iFeySHbsZ0vrSI6vfWm54HiOmvvzuvzwd1lMTV6BY5GKRfpXVxaPKPWwvyDo
         QZORX7SLqQuKLAlrNzpf4XnKtMbqI8HOlfGPntVK9HsQ1E6SPxtxiWUEBd+MrYHMJGSl
         49sg==
X-Gm-Message-State: AOJu0Ywb+5rC4g1t//Lmrhs9UOsOnuFzKpc2yAeQJ+aV8nrpDSfnfNvC
	ULZ1bVrjRAs57DznPicNkx3d4peQq/JfryS5JV+VOB3J4uPOZWnzStOKvapKLTplHoM7Et+tyE1
	gFvo=
X-Google-Smtp-Source: AGHT+IElbNVt8gtwOTgBUsCkmG6ilrMzz1ASszsJ4oxaKXL7Z8uxM2khjZSpQU/lSOaUzk6BKSWL1w==
X-Received: by 2002:a17:906:7185:b0:a45:2091:8193 with SMTP id h5-20020a170906718500b00a4520918193mr2169268ejk.68.1709544191482;
        Mon, 04 Mar 2024 01:23:11 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 3/3] x86: switch to eager fpu save / restore
Date: Mon,  4 Mar 2024 09:13:07 +0000
Message-ID: <20240304091307.2295344-4-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304091307.2295344-1-fouad.hilly@cloud.com>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

Previously FPU is lazily switched. Due to the fact that a malicious
guest can speculatively read the not yet switched out register states,
we need to eagerly switch FPU states when a domain is scheduled to
run.

In the new world, Xen will eagerly switch FPU context in the
scheduler. Xen itself won't set CR0.TS other than for the purpose of
servicing a PV guest.

The following things are done:

1. Xen will only set and clear CR0.TS on behalf of a PV guest. Any #NM
   received in Xen should only be delivered to the running PV guest.

2. Xen no longer causes vmexit for #NM for HVM guests when nested HVM
   is not in use.

3. When nested HVM is in use, Xen needs to trap #NM if specified by
   the L1 hypervisor, but all #NM handling is left to L1 hypervisor
   to deal with.

4. Xen saves and restores FPU states wherever it needs to. The
   following places are modified:
   1. Scheduling in and out a guest;
   2. Calling EFI runtime service;
   3. ACPI reset;
   4. x86 insn emulator fpu insn emulation.

5. Treat FPU as always initialised. Adjust following components:
   1. HVM vcpu context save / load code;
   2. arch_{get,set}_info_guest;
   3. VLAPIC code.

6. Delete lazy FPU handling code.

Strip XCR0 and IA32_XSS manipulation from __context_switch. We need to
be able to zero out previously used state components. Push everything
into fpu_xrstor as that's the most suitable place.

Tested on AMD with PKU disabled and Intel, no performance degradation.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Paul Durrant <paul@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/cpu/common.c                    |   3 -
 xen/arch/x86/domain.c                        |  10 +-
 xen/arch/x86/domctl.c                        |   4 +-
 xen/arch/x86/hvm/emulate.c                   |  38 +----
 xen/arch/x86/hvm/hvm.c                       |   8 +-
 xen/arch/x86/hvm/svm/nestedsvm.c             |  62 +------
 xen/arch/x86/hvm/svm/svm.c                   |  81 +--------
 xen/arch/x86/hvm/svm/vmcb.c                  |   4 +-
 xen/arch/x86/hvm/vlapic.c                    |   4 -
 xen/arch/x86/hvm/vmx/vmcs.c                  |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c                   |  70 +-------
 xen/arch/x86/hvm/vmx/vvmx.c                  |  15 +-
 xen/arch/x86/i387.c                          | 164 ++++---------------
 xen/arch/x86/include/asm/domain.h            |   3 -
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |   3 -
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |   2 -
 xen/arch/x86/include/asm/i387.h              |   3 +-
 xen/arch/x86/include/asm/xstate.h            |  17 +-
 xen/arch/x86/pv/misc-hypercalls.c            |   3 +-
 xen/arch/x86/traps.c                         |  18 +-
 xen/arch/x86/xstate.c                        |  26 ---
 xen/common/domain.c                          |   2 -
 xen/common/efi/runtime.c                     |   9 +-
 xen/include/xen/sched.h                      |   4 -
 24 files changed, 72 insertions(+), 489 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 28d7f34c4dbe..9ea748f959af 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -967,9 +967,6 @@ void cpu_init(void)
 	/* Install correct page table. */
 	write_ptbase(current);
 
-	/* Ensure FPU gets initialised for each domain. */
-	stts();
-
 	/* Reset debug registers: */
 	write_debugreg(0, 0);
 	write_debugreg(1, 0);
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index bda853e3c92b..742d69dd93bb 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1996,15 +1996,7 @@ static void __context_switch(void)
     if ( !is_idle_domain(nd) )
     {
         memcpy(stack_regs, &n->arch.user_regs, CTXT_SWITCH_STACK_BYTES);
-        if ( cpu_has_xsave )
-        {
-            if ( !set_xcr0(n->arch.xcr0 ?: XSTATE_FP_SSE) )
-                BUG();
-
-            if ( cpu_has_xsaves && is_hvm_vcpu(n) )
-                set_msr_xss(n->arch.msrs->xss.raw);
-        }
-        vcpu_restore_fpu_nonlazy(n, false);
+        vcpu_restore_fpu(n);
         nd->arch.ctxt_switch->to(n);
     }
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9a72d57333e9..d838427feb52 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -967,7 +967,6 @@ long arch_do_domctl(
 
                 v->arch.xcr0 = _xcr0;
                 v->arch.xcr0_accum = _xcr0_accum;
-                v->arch.nonlazy_xstate_used = _xcr0_accum & XSTATE_NONLAZY;
                 compress_xsave_states(v, _xsave_area,
                                       evc->size - PV_XSAVE_HDR_SIZE);
 
@@ -1347,8 +1346,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
     else
         c(flags = 0);
-    if ( v->fpu_initialised )
-        c(flags |= VGCF_i387_valid);
+    c(flags |= VGCF_i387_valid);
     if ( !(v->pause_flags & VPF_down) )
         c(flags |= VGCF_online);
     if ( !compat )
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index ab1bc516839a..8a1720008454 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2361,9 +2361,7 @@ static int cf_check hvmemul_get_fpu(
 {
     struct vcpu *curr = current;
 
-    if ( !curr->fpu_dirtied )
-        alternative_vcall(hvm_funcs.fpu_dirty_intercept);
-    else if ( type == X86EMUL_FPU_fpu )
+    if ( type == X86EMUL_FPU_fpu )
     {
         const typeof(curr->arch.xsave_area->fpu_sse) *fpu_ctxt =
             curr->arch.fpu_ctxt;
@@ -2372,16 +2370,8 @@ static int cf_check hvmemul_get_fpu(
          * Latch current register state so that we can back out changes
          * if needed (namely when a memory write fails after register state
          * has already been updated).
-         * NB: We don't really need the "enable" part of the called function
-         * (->fpu_dirtied set implies CR0.TS clear), but the additional
-         * overhead should be low enough to not warrant introduction of yet
-         * another slightly different function. However, we need to undo the
-         * ->fpu_dirtied clearing the function does as well as the possible
-         * masking of all exceptions by FNSTENV.)
          */
-        save_fpu_enable();
-        curr->fpu_initialised = true;
-        curr->fpu_dirtied = true;
+        vcpu_save_fpu(curr);
         if ( (fpu_ctxt->fcw & 0x3f) != 0x3f )
         {
             uint16_t fcw;
@@ -2415,12 +2405,8 @@ static void cf_check hvmemul_put_fpu(
          * Latch current register state so that we can replace FIP/FDP/FOP
          * (which have values resulting from our own invocation of the FPU
          * instruction during emulation).
-         * NB: See also the comment in hvmemul_get_fpu(); we don't need to
-         * set ->fpu_dirtied here as it is going to be cleared below, and
-         * we also don't need to reload FCW as we're forcing full state to
-         * be reloaded anyway.
          */
-        save_fpu_enable();
+        vcpu_save_fpu(curr);
 
         if ( boot_cpu_has(X86_FEATURE_FDP_EXCP_ONLY) &&
              !(fpu_ctxt->fsw & ~fpu_ctxt->fcw & 0x003f) )
@@ -2465,23 +2451,7 @@ static void cf_check hvmemul_put_fpu(
     }
 
     if ( backout == X86EMUL_FPU_fpu )
-    {
-        /*
-         * To back out changes to the register file
-         * - in fully eager mode, restore original state immediately,
-         * - in lazy mode, simply adjust state such that upon next FPU insn
-         *   use by the guest we'll reload the state saved (or freshly loaded)
-         *   by hvmemul_get_fpu().
-         */
-        if ( curr->arch.fully_eager_fpu )
-            vcpu_restore_fpu_nonlazy(curr, false);
-        else
-        {
-            curr->fpu_dirtied = false;
-            stts();
-            alternative_vcall(hvm_funcs.fpu_leave, curr);
-        }
-    }
+        vcpu_restore_fpu(curr);
 }
 
 static int cf_check hvmemul_tlb_op(
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c75959588c0e..e532e2a2d6a0 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -899,11 +899,8 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     ctxt.ldtr_base = seg.base;
     ctxt.ldtr_arbytes = seg.attr;
 
-    if ( v->fpu_initialised )
-    {
-        memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
-        ctxt.flags = XEN_X86_FPU_INITIALISED;
-    }
+    memcpy(ctxt.fpu_regs, v->arch.fpu_ctxt, sizeof(ctxt.fpu_regs));
+    ctxt.flags = XEN_X86_FPU_INITIALISED;
 
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
 }
@@ -1342,7 +1339,6 @@ static int cf_check hvm_load_cpu_xsave_states(
 
     v->arch.xcr0 = ctxt->xcr0;
     v->arch.xcr0_accum = ctxt->xcr0_accum;
-    v->arch.nonlazy_xstate_used = ctxt->xcr0_accum & XSTATE_NONLAZY;
     compress_xsave_states(v, &ctxt->save_area,
                           size - offsetof(struct hvm_hw_cpu_xsave, save_area));
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e4e01add8c5b..9f7595ec34f6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -168,58 +168,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
-static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
-    struct vmcb_struct *vvmcb,
-    struct vmcb_struct *n1vmcb, struct vmcb_struct *n2vmcb)
-{
-    uint64_t vcr0;
-
-    vcr0 = vvmcb->_cr0;
-    if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_leave() run while l1 guest was running.
-         * Sync FPU state with l2 guest.
-         */
-        vcr0 |= X86_CR0_TS;
-        n2vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
-    }
-    else if ( !(vcr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_enter() run while l1 guest was running.
-         * Sync FPU state with l2 guest.
-         */
-        vcr0 &= ~X86_CR0_TS;
-        n2vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
-    }
-
-    return vcr0;
-}
-
-static void nestedsvm_fpu_vmexit(struct vmcb_struct *n1vmcb,
-    struct vmcb_struct *n2vmcb, uint64_t n1cr0, uint64_t guest_cr0)
-{
-    if ( !(guest_cr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_leave() run while l2 guest was running.
-         * Sync FPU state with l1 guest.
-         */
-        n1vmcb->_cr0 |= X86_CR0_TS;
-        n1vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
-    }
-    else if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_enter() run while l2 guest was running.
-         * Sync FPU state with l1 guest.
-         */
-        n1vmcb->_cr0 &= ~X86_CR0_TS;
-        n1vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
-    }
-}
-
 static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -249,7 +197,6 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *n1vmcb, *n2vmcb;
     int rc;
 
@@ -284,8 +231,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
-    nestedsvm_fpu_vmexit(n1vmcb, n2vmcb,
-        svm->ns_cr0, v->arch.hvm.guest_cr[0]);
     v->arch.hvm.guest_cr[0] = n1vmcb->_cr0 | X86_CR0_PE;
     n1vmcb->rflags &= ~X86_EFLAGS_VM;
     rc = hvm_set_cr0(n1vmcb->_cr0 | X86_CR0_PE, true);
@@ -293,7 +238,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
-    svm->ns_cr0 = v->arch.hvm.guest_cr[0];
 
     /* CR2 */
     v->arch.hvm.guest_cr[2] = n1vmcb->_cr2;
@@ -421,7 +365,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     struct vmcb_struct *ns_vmcb, *n1vmcb, *n2vmcb;
     vmcbcleanbits_t clean = {};
     int rc;
-    uint64_t cr0;
 
     ns_vmcb = nv->nv_vvmcx;
     n1vmcb = nv->nv_n1vmcx;
@@ -455,7 +398,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      *   safed here.
      * The overhead comes from (ordered from highest to lowest):
      * - svm_ctxt_switch_to (CPU context switching)
-     * - svm_fpu_enter, svm_fpu_leave (lazy FPU switching)
      * - emulated CLGI (clears VINTR intercept)
      * - host clears VINTR intercept
      * Test results show that the overhead is high enough that the
@@ -554,10 +496,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
-    svm->ns_cr0 = v->arch.hvm.guest_cr[0];
-    cr0 = nestedsvm_fpu_vmentry(svm->ns_cr0, ns_vmcb, n1vmcb, n2vmcb);
     v->arch.hvm.guest_cr[0] = ns_vmcb->_cr0;
-    rc = hvm_set_cr0(cr0, true);
+    rc = hvm_set_cr0(ns_vmcb->_cr0, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b551eac8078d..7a92b432e788 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -104,38 +104,6 @@ static void cf_check svm_cpu_down(void)
     write_efer(read_efer() & ~EFER_SVME);
 }
 
-static void svm_fpu_enter(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    vcpu_restore_fpu_lazy(v);
-    vmcb_set_exception_intercepts(
-        n1vmcb,
-        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << X86_EXC_NM));
-}
-
-static void cf_check svm_fpu_leave(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
-     */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        vmcb_set_exception_intercepts(
-            n1vmcb,
-            vmcb_get_exception_intercepts(n1vmcb) | (1U << X86_EXC_NM));
-        vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) | X86_CR0_TS);
-    }
-}
-
 static void cf_check svm_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
@@ -145,20 +113,6 @@ static void cf_check svm_update_guest_cr(
     switch ( cr )
     {
     case 0:
-    {
-        unsigned long hw_cr0_mask = 0;
-
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
-                svm_fpu_enter(v);
-        }
-
         if ( paging_mode_hap(v->domain) )
         {
             uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
@@ -169,12 +123,12 @@ static void cf_check svm_update_guest_cr(
                vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
         }
 
-        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
+        value = v->arch.hvm.guest_cr[0];
         if ( !paging_mode_hap(v->domain) )
             value |= X86_CR0_PG | X86_CR0_WP;
         vmcb_set_cr0(vmcb, value);
         break;
-    }
+
     case 2:
         vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
         break;
@@ -950,9 +904,6 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     if ( unlikely((read_efer() & EFER_SVME) == 0) )
         return;
 
-    if ( !v->arch.fully_eager_fpu )
-        svm_fpu_leave(v);
-
     svm_save_dr(v);
     svm_tsc_ratio_save(v);
 
@@ -1709,28 +1660,6 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     domain_crash(v->domain);
 }
 
-static void cf_check svm_fpu_dirty_intercept(void)
-{
-    struct vcpu *v = current;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    svm_fpu_enter(v);
-
-    if ( vmcb != n1vmcb )
-    {
-       /* Check if l1 guest must make FPU ready for the l2 guest */
-       if ( v->arch.hvm.guest_cr[0] & X86_CR0_TS )
-           hvm_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
-       else
-           vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) & ~X86_CR0_TS);
-       return;
-    }
-
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        vmcb_set_cr0(vmcb, vmcb_get_cr0(vmcb) & ~X86_CR0_TS);
-}
-
 static void svm_vmexit_do_cr_access(
     struct vmcb_struct *vmcb, struct cpu_user_regs *regs)
 {
@@ -2499,7 +2428,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .update_guest_cr      = svm_update_guest_cr,
     .update_guest_efer    = svm_update_guest_efer,
     .cpuid_policy_changed = svm_cpuid_policy_changed,
-    .fpu_leave            = svm_fpu_leave,
     .set_guest_pat        = svm_set_guest_pat,
     .get_guest_pat        = svm_get_guest_pat,
     .set_tsc_offset       = svm_set_tsc_offset,
@@ -2509,7 +2437,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .get_pending_event    = svm_get_pending_event,
     .invlpg               = svm_invlpg,
     .wbinvd_intercept     = svm_wbinvd_intercept,
-    .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
     .msr_read_intercept   = svm_msr_read_intercept,
     .msr_write_intercept  = svm_msr_write_intercept,
     .enable_msr_interception = svm_enable_msr_interception,
@@ -2802,10 +2729,6 @@ void asmlinkage svm_vmexit_handler(void)
         }
         break;
 
-    case VMEXIT_EXCEPTION_NM:
-        svm_fpu_dirty_intercept();
-        break;
-
     case VMEXIT_EXCEPTION_PF:
     {
         unsigned long va = vmcb->ei.exc.cr2;
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 282fe7cdbe39..bf568d256f5e 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -127,9 +127,7 @@ static int construct_vmcb(struct vcpu *v)
 
     paging_update_paging_modes(v);
 
-    vmcb->_exception_intercepts =
-        HVM_TRAP_MASK |
-        (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
+    vmcb->_exception_intercepts = HVM_TRAP_MASK;
 
     if ( paging_mode_hap(v->domain) )
     {
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dcbcf4a1feb5..2551260acd4d 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -263,7 +263,6 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
     switch ( icr & APIC_DM_MASK )
     {
     case APIC_DM_INIT: {
-        bool fpu_initialised;
         int rc;
 
         /* No work on INIT de-assert for P4-type APIC. */
@@ -275,11 +274,8 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
             break;
         hvm_vcpu_down(target);
         domain_lock(target->domain);
-        /* Reset necessary VCPU state. This does not include FPU state. */
-        fpu_initialised = target->fpu_initialised;
         rc = vcpu_reset(target);
         ASSERT(!rc);
-        target->fpu_initialised = fpu_initialised;
         vlapic_do_init(vcpu_vlapic(target));
         domain_unlock(target->domain);
         break;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 6b4f004a3d21..25bee5e5c404 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1242,10 +1242,7 @@ static int construct_vmcs(struct vcpu *v)
     __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
 
     /* Host control registers. */
-    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
-    if ( !v->arch.fully_eager_fpu )
-        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
+    __vmwrite(HOST_CR0, read_cr0());
     __vmwrite(HOST_CR4, mmu_cr4_features);
     if ( cpu_has_vmx_efer )
         __vmwrite(HOST_EFER, read_efer());
@@ -1325,8 +1322,7 @@ static int construct_vmcs(struct vcpu *v)
     __vmwrite(VMCS_LINK_POINTER, ~0UL);
 
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
-              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF))
-              | (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
+              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF));
 
     if ( cpu_has_vmx_notify_vm_exiting )
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 23bdf0d1957f..6e21e8b9d396 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -63,7 +63,6 @@ static void cf_check vmx_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags);
 static void cf_check vmx_update_guest_efer(struct vcpu *v);
 static void cf_check vmx_wbinvd_intercept(void);
-static void cf_check vmx_fpu_dirty_intercept(void);
 static int cf_check vmx_msr_read_intercept(
     unsigned int msr, uint64_t *msr_content);
 static int cf_check vmx_msr_write_intercept(
@@ -1087,41 +1086,6 @@ static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
     return 0;
 }
 
-static void vmx_fpu_enter(struct vcpu *v)
-{
-    vcpu_restore_fpu_lazy(v);
-    v->arch.hvm.vmx.exception_bitmap &= ~(1u << X86_EXC_NM);
-    vmx_update_exception_bitmap(v);
-    v->arch.hvm.vmx.host_cr0 &= ~X86_CR0_TS;
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-}
-
-static void cf_check vmx_fpu_leave(struct vcpu *v)
-{
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    if ( !(v->arch.hvm.vmx.host_cr0 & X86_CR0_TS) )
-    {
-        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
-        __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-    }
-
-    /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
-     */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        v->arch.hvm.hw_cr[0] |= X86_CR0_TS;
-        __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
-        v->arch.hvm.vmx.exception_bitmap |= (1u << X86_EXC_NM);
-        vmx_update_exception_bitmap(v);
-    }
-}
-
 static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
 {
     /*
@@ -1144,8 +1108,6 @@ static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
         vmx_vmcs_reload(v);
     }
 
-    if ( !v->arch.fully_eager_fpu )
-        vmx_fpu_leave(v);
     vmx_save_guest_msrs(v);
     vmx_restore_host_msrs();
     vmx_save_dr(v);
@@ -1666,17 +1628,6 @@ static void cf_check vmx_update_guest_cr(
         else
             nvmx_set_cr_read_shadow(v, 0);
 
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( v->arch.hvm.hw_cr[0] & X86_CR0_TS )
-                vmx_fpu_enter(v);
-        }
-
         realmode = !(v->arch.hvm.guest_cr[0] & X86_CR0_PE);
 
         if ( !vmx_unrestricted_guest(v) &&
@@ -2733,7 +2684,6 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .update_guest_cr      = vmx_update_guest_cr,
     .update_guest_efer    = vmx_update_guest_efer,
     .cpuid_policy_changed = vmx_cpuid_policy_changed,
-    .fpu_leave            = vmx_fpu_leave,
     .set_guest_pat        = vmx_set_guest_pat,
     .get_guest_pat        = vmx_get_guest_pat,
     .set_tsc_offset       = vmx_set_tsc_offset,
@@ -2745,7 +2695,6 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .cpu_up               = vmx_cpu_up,
     .cpu_down             = vmx_cpu_down,
     .wbinvd_intercept     = vmx_wbinvd_intercept,
-    .fpu_dirty_intercept  = vmx_fpu_dirty_intercept,
     .msr_read_intercept   = vmx_msr_read_intercept,
     .msr_write_intercept  = vmx_msr_write_intercept,
     .handle_cd            = vmx_handle_cd,
@@ -3066,20 +3015,6 @@ void update_guest_eip(void)
         hvm_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
 }
 
-static void cf_check vmx_fpu_dirty_intercept(void)
-{
-    struct vcpu *curr = current;
-
-    vmx_fpu_enter(curr);
-
-    /* Disable TS in guest CR0 unless the guest wants the exception too. */
-    if ( !(curr->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        curr->arch.hvm.hw_cr[0] &= ~X86_CR0_TS;
-        __vmwrite(GUEST_CR0, curr->arch.hvm.hw_cr[0]);
-    }
-}
-
 static void vmx_dr_access(unsigned long exit_qualification,
                           struct cpu_user_regs *regs)
 {
@@ -4325,10 +4260,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                 domain_pause_for_debugger();
             }
             break;
-        case X86_EXC_NM:
-            HVMTRACE_1D(TRAP, vector);
-            vmx_fpu_dirty_intercept();
-            break;
+
         case X86_EXC_PF:
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
             __vmread(VM_EXIT_INTR_ERROR_CODE, &ecode);
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index ece0aa243a73..497592969dfc 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1236,9 +1236,6 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
     regs->rsp = get_vvmcs(v, GUEST_RSP);
     regs->rflags = get_vvmcs(v, GUEST_RFLAGS);
 
-    /* updating host cr0 to sync TS bit */
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-
     /* Setup virtual ETP for L2 guest*/
     if ( nestedhvm_paging_mode_hap(v) )
         /* This will setup the initial np2m for the nested vCPU */
@@ -1466,9 +1463,6 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     /* VM exit clears all bits except bit 1 */
     regs->rflags = X86_EFLAGS_MBS;
 
-    /* updating host cr0 to sync TS bit */
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-
     if ( cpu_has_vmx_virtual_intr_delivery )
         nvmx_update_apicv(v);
 
@@ -2454,19 +2448,14 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
         __vmread(VM_EXIT_INTR_INFO, &intr_info);
         vector = intr_info & INTR_INFO_VECTOR_MASK;
         /*
-         * decided by L0 and L1 exception bitmap, if the vetor is set by
-         * both, L0 has priority on #PF and #NM, L1 has priority on others
+         * decided by L0 and L1 exception bitmap, if the vector is set by
+         * both, L0 has priority on #PF, L1 has priority on others
          */
         if ( vector == X86_EXC_PF )
         {
             if ( paging_mode_hap(v->domain) )
                 nvcpu->nv_vmexit_pending = 1;
         }
-        else if ( vector == X86_EXC_NM )
-        {
-            if ( v->fpu_dirtied )
-                nvcpu->nv_vmexit_pending = 1;
-        }
         else if ( (intr_info & valid_mask) == valid_mask )
         {
             exec_bitmap = get_vvmcs(v, EXCEPTION_BITMAP);
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 7a4297cc921e..09df2c962c9a 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -20,7 +20,7 @@
 /*     FPU Restore Functions   */
 /*******************************/
 /* Restore x87 extended state */
-static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
+static inline void fpu_xrstor(struct vcpu *v)
 {
     bool ok;
 
@@ -28,10 +28,14 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
+     *
+     * Combine the outgoing and incoming XCR0 before calling xrstor to make
+     * sure any state component used by outgoing vcpu is cleared. Rewrite XCR0
+     * to be the ones used by incoming vcpu afterwards.
      */
-    ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
+    ok = set_xcr0(v->arch.xcr0_accum | get_xcr0() | XSTATE_FP_SSE);
     ASSERT(ok);
-    xrstor(v, mask);
+    xrstor(v, XSTATE_ALL);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
@@ -110,33 +114,11 @@ static inline void fpu_fxrstor(struct vcpu *v)
 /*      FPU Save Functions     */
 /*******************************/
 
-static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
-{
-    if ( v->fpu_dirtied )
-        return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
-
-    ASSERT(v->arch.nonlazy_xstate_used);
-
-    /*
-     * The offsets of components which live in the extended region of
-     * compact xsave area are not fixed. Xsave area may be overwritten
-     * when a xsave with v->fpu_dirtied set is followed by one with
-     * v->fpu_dirtied clear.
-     * In such case, if hypervisor uses compact xsave area and guest
-     * has ever used lazy states (checking xcr0_accum excluding
-     * XSTATE_FP_SSE), vcpu_xsave_mask will return XSTATE_ALL. Otherwise
-     * return XSTATE_NONLAZY.
-     */
-    return xstate_all(v) ? XSTATE_ALL : XSTATE_NONLAZY;
-}
-
 /* Save x87 extended state */
 static inline void fpu_xsave(struct vcpu *v)
 {
     bool ok;
-    uint64_t mask = vcpu_xsave_mask(v);
 
-    ASSERT(mask);
     ASSERT(v->arch.xsave_area);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
@@ -144,7 +126,7 @@ static inline void fpu_xsave(struct vcpu *v)
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xsave(v, mask);
+    xsave(v, XSTATE_ALL);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
@@ -202,107 +184,6 @@ static inline void fpu_fxsave(struct vcpu *v)
 /*******************************/
 /*       VCPU FPU Functions    */
 /*******************************/
-/* Restore FPU state whenever VCPU is schduled in. */
-void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
-{
-    /* Restore nonlazy extended state (i.e. parts not tracked by CR0.TS). */
-    if ( !v->arch.fully_eager_fpu && !v->arch.nonlazy_xstate_used )
-        goto maybe_stts;
-
-    ASSERT(!is_idle_vcpu(v));
-
-    /* Avoid recursion */
-    clts();
-
-    /*
-     * When saving full state even with !v->fpu_dirtied (see vcpu_xsave_mask()
-     * above) we also need to restore full state, to prevent subsequently
-     * saving state belonging to another vCPU.
-     */
-    if ( v->arch.fully_eager_fpu || (v->arch.xsave_area && xstate_all(v)) )
-    {
-        if ( cpu_has_xsave )
-            fpu_xrstor(v, XSTATE_ALL);
-        else
-            fpu_fxrstor(v);
-
-        v->fpu_initialised = 1;
-        v->fpu_dirtied = 1;
-
-        /* Xen doesn't need TS set, but the guest might. */
-        need_stts = is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS);
-    }
-    else
-    {
-        fpu_xrstor(v, XSTATE_NONLAZY);
-        need_stts = true;
-    }
-
- maybe_stts:
-    if ( need_stts )
-        stts();
-}
-
-/* 
- * Restore FPU state when #NM is triggered.
- */
-void vcpu_restore_fpu_lazy(struct vcpu *v)
-{
-    ASSERT(!is_idle_vcpu(v));
-
-    /* Avoid recursion. */
-    clts();
-
-    if ( v->fpu_dirtied )
-        return;
-
-    ASSERT(!v->arch.fully_eager_fpu);
-
-    if ( cpu_has_xsave )
-        fpu_xrstor(v, XSTATE_LAZY);
-    else
-        fpu_fxrstor(v);
-
-    v->fpu_initialised = 1;
-    v->fpu_dirtied = 1;
-}
-
-/* 
- * On each context switch, save the necessary FPU info of VCPU being switch 
- * out. It dispatches saving operation based on CPU's capability.
- */
-static bool _vcpu_save_fpu(struct vcpu *v)
-{
-    if ( !v->fpu_dirtied && !v->arch.nonlazy_xstate_used )
-        return false;
-
-    ASSERT(!is_idle_vcpu(v));
-
-    /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
-    clts();
-
-    if ( cpu_has_xsave )
-        fpu_xsave(v);
-    else
-        fpu_fxsave(v);
-
-    v->fpu_dirtied = 0;
-
-    return true;
-}
-
-void vcpu_save_fpu(struct vcpu *v)
-{
-    _vcpu_save_fpu(v);
-    stts();
-}
-
-void save_fpu_enable(void)
-{
-    if ( !_vcpu_save_fpu(current) )
-        clts();
-}
-
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
@@ -347,8 +228,6 @@ void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
 
     ASSERT(!xsave_area || xsave_area == v->arch.xsave_area);
 
-    v->fpu_initialised = !!data;
-
     if ( data )
     {
         memcpy(fpu_sse, data, sizeof(*fpu_sse));
@@ -386,6 +265,33 @@ void vcpu_destroy_fpu(struct vcpu *v)
         xfree(v->arch.fpu_ctxt);
 }
 
+void vcpu_save_fpu(struct vcpu *v)
+{
+    ASSERT(!is_idle_vcpu(v));
+
+    /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
+    clts();
+
+    if ( cpu_has_xsave )
+        fpu_xsave(v);
+    else
+        fpu_fxsave(v);
+}
+
+void vcpu_restore_fpu(struct vcpu *v)
+{
+    ASSERT(!is_idle_vcpu(v));
+    ASSERT(!(read_cr0() & X86_CR0_TS));
+
+    if ( cpu_has_xsave )
+        fpu_xrstor(v);
+    else
+        fpu_fxrstor(v);
+
+    if ( is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS) )
+        stts();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 622d22bef255..396e9998d04f 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -654,9 +654,6 @@ struct arch_vcpu
      * it explicitly enables it via xcr0.
      */
     uint64_t xcr0_accum;
-    /* This variable determines whether nonlazy extended state has been used,
-     * and thus should be saved/restored. */
-    bool nonlazy_xstate_used;
 
     /* Restore all FPU state (lazy and non-lazy state) on context switch? */
     bool fully_eager_fpu;
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 406fc082b107..2f84546d6b3d 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -40,9 +40,6 @@ struct nestedsvm {
     /* Shadow io permission map */
     unsigned long *ns_iomap;
 
-    uint64_t ns_cr0; /* Cached guest_cr[0] of l1 guest while l2 guest runs.
-                      * Needed to handle FPU context switching */
-
     /* Cache guest cr3/host cr3 the guest sets up for the l2 guest.
      * Used by Shadow-on-Shadow and Nested-on-Nested.
      * ns_vmcb_guestcr3: in l2 guest physical address space and points to
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index a7dd2eeffcad..d84195c0426f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -141,8 +141,6 @@ struct vmx_vcpu {
     DECLARE_BITMAP(eoi_exit_bitmap, X86_NR_VECTORS);
     struct pi_desc       pi_desc;
 
-    unsigned long        host_cr0;
-
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
     bool                 ept_spurious_misconfig;
 
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index a783549db991..bba5dfe3951a 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -27,8 +27,7 @@ struct ix87_env {
     uint16_t fds, _res6;
 };
 
-void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
-void vcpu_restore_fpu_lazy(struct vcpu *v);
+void vcpu_restore_fpu(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
 void save_fpu_enable(void);
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index bd767d9cd714..eed40c94efea 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -32,11 +32,10 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
 #define XCNTXT_MASK    (X86_XCR0_FP | X86_XCR0_SSE | X86_XCR0_YMM | \
                         X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
-                        XSTATE_NONLAZY)
+                        X86_XCR0_LWP | X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | \
+                        X86_XCR0_PKRU)
 
 #define XSTATE_ALL     (~(1ULL << 63))
-#define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU)
-#define XSTATE_LAZY    (XSTATE_ALL & ~XSTATE_NONLAZY)
 #define XSTATE_XSAVES_ONLY         0
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
 
@@ -121,18 +120,6 @@ static inline uint64_t xgetbv(unsigned int index)
     return lo | ((uint64_t)hi << 32);
 }
 
-static inline bool xstate_all(const struct vcpu *v)
-{
-    /*
-     * XSTATE_FP_SSE may be excluded, because the offsets of XSTATE_FP_SSE
-     * (in the legacy region of xsave area) are fixed, so saving
-     * XSTATE_FP_SSE will not cause overwriting problem with XSAVES/XSAVEC.
-     */
-    return (v->arch.xsave_area->xsave_hdr.xcomp_bv &
-            XSTATE_COMPACTION_ENABLED) &&
-           (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
-}
-
 static inline bool __nonnull(1)
 xsave_area_compressed(const struct xsave_struct *xsave_area)
 {
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index b529f00ea127..dd783e34b117 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -40,8 +40,7 @@ long do_fpu_taskswitch(int set)
     else
     {
         v->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
-        if ( v->fpu_dirtied )
-            clts();
+        clts();
     }
 
     return 0;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d554c9d41edd..448a4073f589 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1891,15 +1891,17 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
     }
 
 #ifdef CONFIG_PV
-    vcpu_restore_fpu_lazy(curr);
+    BUG_ON(!(curr->arch.pv.ctrlreg[0] & X86_CR0_TS));
 
-    if ( curr->arch.pv.ctrlreg[0] & X86_CR0_TS )
-    {
-        pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
-        curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
-    }
-    else
-        TRACE_0D(TRC_PV_MATH_STATE_RESTORE);
+    /*
+     * PV ABI QUIRK: Classic Xen kernels (2.6.18 and SLES 11 SP4's
+     * 3.0) rely on Xen to clear TS. PVOPS kernels (3.0, 3.16 and 4.15
+     * are checked) always clear TS themselves.
+     */
+    clts();
+
+    pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
+    curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
 #else
     ASSERT_UNREACHABLE();
 #endif
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 92a65bd8d52c..19de2d570220 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -731,7 +731,6 @@ int handle_xsetbv(u32 index, u64 new_bv)
 {
     struct vcpu *curr = current;
     uint64_t xcr0_max = cpu_policy_xcr0_max(curr->domain->arch.cpuid);
-    u64 mask;
 
     if ( index != XCR_XFEATURE_ENABLED_MASK )
         return -EOPNOTSUPP;
@@ -766,34 +765,9 @@ int handle_xsetbv(u32 index, u64 new_bv)
         return -EFAULT;
     }
 
-    mask = new_bv & ~curr->arch.xcr0_accum;
     curr->arch.xcr0 = new_bv;
     curr->arch.xcr0_accum |= new_bv;
 
-    if ( new_bv & XSTATE_NONLAZY )
-        curr->arch.nonlazy_xstate_used = 1;
-
-    mask &= curr->fpu_dirtied ? ~XSTATE_FP_SSE : XSTATE_NONLAZY;
-    if ( mask )
-    {
-        unsigned long cr0 = read_cr0();
-
-        clts();
-        if ( curr->fpu_dirtied )
-            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
-        else if ( xstate_all(curr) )
-        {
-            /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
-            mask |= XSTATE_LAZY;
-            curr->fpu_initialised = 1;
-            curr->fpu_dirtied = 1;
-            cr0 &= ~X86_CR0_TS;
-        }
-        xrstor(curr, mask);
-        if ( cr0 & X86_CR0_TS )
-            write_cr0(cr0);
-    }
-
     return 0;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f6f557499660..450a7cf1814a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1488,8 +1488,6 @@ int vcpu_reset(struct vcpu *v)
     clear_bit(v->vcpu_id, d->poll_mask);
     v->poll_evtchn = 0;
 
-    v->fpu_initialised = 0;
-    v->fpu_dirtied     = 0;
     v->is_initialised  = 0;
     if ( v->affinity_broken & VCPU_AFFINITY_OVERRIDE )
         vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d952c3ba785e..273c03d676f8 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -85,12 +85,14 @@ struct efi_rs_state efi_rs_enter(void)
     static const u16 fcw = FCW_DEFAULT;
     static const u32 mxcsr = MXCSR_DEFAULT;
     struct efi_rs_state state = { .cr3 = 0 };
+    struct vcpu *curr = current;
 
     if ( mfn_eq(efi_l4_mfn, INVALID_MFN) )
         return state;
 
     state.cr3 = read_cr3();
-    save_fpu_enable();
+    if ( !is_idle_vcpu(curr) )
+        vcpu_save_fpu(curr);
     asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
     asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
 
@@ -101,7 +103,7 @@ struct efi_rs_state efi_rs_enter(void)
     /* prevent fixup_page_fault() from doing anything */
     irq_enter();
 
-    if ( is_pv_vcpu(current) && !is_idle_vcpu(current) )
+    if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
     {
         struct desc_ptr gdt_desc = {
             .limit = LAST_RESERVED_GDT_BYTE,
@@ -153,7 +155,8 @@ void efi_rs_leave(struct efi_rs_state *state)
     irq_exit();
     efi_rs_on_cpu = NR_CPUS;
     spin_unlock(&efi_rs_lock);
-    vcpu_restore_fpu_nonlazy(curr, true);
+    if ( !is_idle_vcpu(curr) )
+        vcpu_restore_fpu(curr);
 }
 
 bool efi_rs_using_pgtables(void)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f5922f3206..1da52e77dcdf 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -206,10 +206,6 @@ struct vcpu
     struct guest_area runstate_guest_area;
     unsigned int     new_state;
 
-    /* Has the FPU been initialised? */
-    bool             fpu_initialised;
-    /* Has the FPU been used since it was last saved? */
-    bool             fpu_dirtied;
     /* Initialization completed for this VCPU? */
     bool             is_initialised;
     /* Currently running on a CPU? */
-- 
2.42.0


