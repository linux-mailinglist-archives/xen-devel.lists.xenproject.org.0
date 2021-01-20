Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327E2FD206
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 14:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71386.127838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2DyC-0001GL-2L; Wed, 20 Jan 2021 13:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71386.127838; Wed, 20 Jan 2021 13:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2DyB-0001Ez-NY; Wed, 20 Jan 2021 13:56:23 +0000
Received: by outflank-mailman (input) for mailman id 71386;
 Wed, 20 Jan 2021 13:56:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2Dy9-0000k4-Un
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 13:56:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4351fec0-6979-4ca6-ac17-56a559d7bc62;
 Wed, 20 Jan 2021 13:56:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AF44AE65;
 Wed, 20 Jan 2021 13:56:02 +0000 (UTC)
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
X-Inumbo-ID: 4351fec0-6979-4ca6-ac17-56a559d7bc62
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611150962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/muUWGGP2zH35/xgppym3fqM4u0SphD3mtIprEyxGx4=;
	b=VMhJpHDcvSEXbFEWKA9GubVoQYp4VKaRYV9omEvfifdGNmsi2qdDYOkGgJ6+7WDTBR6gyk
	B71NjwQJcqEJvu/X24KcXkeH3pZwEr6mZKAvCfDxSMFiBAHsT80SVSZpgogWrNASZUrrCy
	YPoqNduc3X0yy06rcU/rkGtZqZpDqK8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH v4 09/15] x86: add new features for paravirt patching
Date: Wed, 20 Jan 2021 14:55:49 +0100
Message-Id: <20210120135555.32594-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120135555.32594-1-jgross@suse.com>
References: <20210120135555.32594-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For being able to switch paravirt patching from special cased custom
code sequences to ALTERNATIVE handling some X86_FEATURE_* are needed
as new features. This enables to have the standard indirect pv call
as the default code and to patch that with the non-Xen custom code
sequence via ALTERNATIVE patching later.

Make sure paravirt patching is performed before alternative patching.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- add comment (Boris Petkov)
- no negative features (Boris Petkov)

V4:
- move paravirt_set_cap() to paravirt-spinlocks.c
---
 arch/x86/include/asm/cpufeatures.h   |  2 ++
 arch/x86/include/asm/paravirt.h      | 10 ++++++++++
 arch/x86/kernel/alternative.c        | 30 ++++++++++++++++++++++++++--
 arch/x86/kernel/paravirt-spinlocks.c |  9 +++++++++
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 84b887825f12..3ae8944b253a 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -238,6 +238,8 @@
 #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* "" VMware prefers VMMCALL hypercall instruction */
 #define X86_FEATURE_SEV_ES		( 8*32+20) /* AMD Secure Encrypted Virtualization - Encrypted State */
 #define X86_FEATURE_VM_PAGE_FLUSH	( 8*32+21) /* "" VM Page Flush MSR is supported */
+#define X86_FEATURE_PVUNLOCK		( 8*32+22) /* "" PV unlock function */
+#define X86_FEATURE_VCPUPREEMPT		( 8*32+23) /* "" PV vcpu_is_preempted function */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word 9 */
 #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGSBASE, WRGSBASE instructions*/
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 1e45b46fae84..8c354099d9c3 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -47,6 +47,10 @@ static inline u64 paravirt_steal_clock(int cpu)
 	return static_call(pv_steal_clock)(cpu);
 }
 
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+void __init paravirt_set_cap(void);
+#endif
+
 /* The paravirtualized I/O functions */
 static inline void slow_down_io(void)
 {
@@ -811,5 +815,11 @@ static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
 {
 }
 #endif
+
+#ifndef CONFIG_PARAVIRT_SPINLOCKS
+static inline void paravirt_set_cap(void)
+{
+}
+#endif
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_X86_PARAVIRT_H */
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 0a904fb2678b..221acb2b868a 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -28,6 +28,7 @@
 #include <asm/insn.h>
 #include <asm/io.h>
 #include <asm/fixmap.h>
+#include <asm/paravirt.h>
 
 int __read_mostly alternatives_patched;
 
@@ -730,6 +731,33 @@ void __init alternative_instructions(void)
 	 * patching.
 	 */
 
+	/*
+	 * Paravirt patching and alternative patching can be combined to
+	 * replace a function call with a short direct code sequence (e.g.
+	 * by setting a constant return value instead of doing that in an
+	 * external function).
+	 * In order to make this work the following sequence is required:
+	 * 1. set (artificial) features depending on used paravirt
+	 *    functions which can later influence alternative patching
+	 * 2. apply paravirt patching (generally replacing an indirect
+	 *    function call with a direct one)
+	 * 3. apply alternative patching (e.g. replacing a direct function
+	 *    call with a custom code sequence)
+	 * Doing paravirt patching after alternative patching would clobber
+	 * the optimization of the custom code with a function call again.
+	 */
+	paravirt_set_cap();
+
+	/*
+	 * First patch paravirt functions, such that we overwrite the indirect
+	 * call with the direct call.
+	 */
+	apply_paravirt(__parainstructions, __parainstructions_end);
+
+	/*
+	 * Then patch alternatives, such that those paravirt calls that are in
+	 * alternatives can be overwritten by their immediate fragments.
+	 */
 	apply_alternatives(__alt_instructions, __alt_instructions_end);
 
 #ifdef CONFIG_SMP
@@ -748,8 +776,6 @@ void __init alternative_instructions(void)
 	}
 #endif
 
-	apply_paravirt(__parainstructions, __parainstructions_end);
-
 	restart_nmi();
 	alternatives_patched = 1;
 }
diff --git a/arch/x86/kernel/paravirt-spinlocks.c b/arch/x86/kernel/paravirt-spinlocks.c
index 4f75d0cf6305..9e1ea99ad9df 100644
--- a/arch/x86/kernel/paravirt-spinlocks.c
+++ b/arch/x86/kernel/paravirt-spinlocks.c
@@ -32,3 +32,12 @@ bool pv_is_native_vcpu_is_preempted(void)
 	return pv_ops.lock.vcpu_is_preempted.func ==
 		__raw_callee_save___native_vcpu_is_preempted;
 }
+
+void __init paravirt_set_cap(void)
+{
+	if (!pv_is_native_spin_unlock())
+		setup_force_cpu_cap(X86_FEATURE_PVUNLOCK);
+
+	if (!pv_is_native_vcpu_is_preempted())
+		setup_force_cpu_cap(X86_FEATURE_VCPUPREEMPT);
+}
-- 
2.26.2


