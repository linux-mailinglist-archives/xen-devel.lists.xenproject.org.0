Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F843DC02
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 09:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217684.377830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzpT-00055a-MV; Thu, 28 Oct 2021 07:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217684.377830; Thu, 28 Oct 2021 07:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzpT-00051s-JC; Thu, 28 Oct 2021 07:28:03 +0000
Received: by outflank-mailman (input) for mailman id 217684;
 Thu, 28 Oct 2021 07:28:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfzpS-0004Ty-K0
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 07:28:02 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f56227c9-2e4c-43c5-be9e-7872ee2bb4ea;
 Thu, 28 Oct 2021 07:27:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68ADB21967;
 Thu, 28 Oct 2021 07:27:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D40313ABD;
 Thu, 28 Oct 2021 07:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UAr+AfxQemEmGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 07:27:56 +0000
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
X-Inumbo-ID: f56227c9-2e4c-43c5-be9e-7872ee2bb4ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635406076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggMgRCzUrgVk3/nbGHlSVTwAJfT38iDHULHtl55v/o8=;
	b=L+hv7qAjrtmHYTJ8VoWW7a/cmADpjn9JUa+yjIIp8HlLmnZVXHLcZHpgdATMNLaxfScin7
	eTxF6U3n9v2kka9NS4TuR31Zc2y4baK1ldiDDkiidpC1V7KxUJ3PibOnOsjl7eYQNoMpUP
	6PXws49K+zxxzYg50k1WwNhWqNMKcY0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 2/2] x86/xen: switch initial pvops IRQ functions to dummy ones
Date: Thu, 28 Oct 2021 09:27:48 +0200
Message-Id: <20211028072748.29862-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028072748.29862-1-jgross@suse.com>
References: <20211028072748.29862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial pvops functions handling irq flags will only ever be called
before interrupts are being enabled.

So switch them to be dummy functions:
- xen_save_fl() can always return 0
- xen_irq_disable() is a nop
- xen_irq_enable() can BUG()

Add some generic paravirt functions for that purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
V3:
- make paravirt_BUG() noinstr
---
 arch/x86/include/asm/paravirt_types.h |  2 +
 arch/x86/kernel/paravirt.c            | 13 +++++-
 arch/x86/xen/enlighten.c              | 19 +--------
 arch/x86/xen/irq.c                    | 61 ++-------------------------
 4 files changed, 20 insertions(+), 75 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index d9d6b0203ec4..fc1151e77569 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -577,7 +577,9 @@ void paravirt_leave_lazy_mmu(void);
 void paravirt_flush_lazy_mmu(void);
 
 void _paravirt_nop(void);
+void paravirt_BUG(void);
 u64 _paravirt_ident_64(u64);
+unsigned long paravirt_ret0(void);
 
 #define paravirt_nop	((void *)_paravirt_nop)
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 04cafc057bed..b44814dfe83f 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -46,6 +46,17 @@ asm (".pushsection .entry.text, \"ax\"\n"
      ".type _paravirt_nop, @function\n\t"
      ".popsection");
 
+/* stub always returning 0. */
+asm (".pushsection .entry.text, \"ax\"\n"
+     ".global paravirt_ret0\n"
+     "paravirt_ret0:\n\t"
+     "xor %" _ASM_AX ", %" _ASM_AX ";\n\t"
+     "ret\n\t"
+     ".size paravirt_ret0, . - paravirt_ret0\n\t"
+     ".type paravirt_ret0, @function\n\t"
+     ".popsection");
+
+
 void __init default_banner(void)
 {
 	printk(KERN_INFO "Booting paravirtualized kernel on %s\n",
@@ -53,7 +64,7 @@ void __init default_banner(void)
 }
 
 /* Undefined instruction for dealing with missing ops pointers. */
-static void paravirt_BUG(void)
+noinstr void paravirt_BUG(void)
 {
 	BUG();
 }
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 006b4a814fac..30c6e986a6cd 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -31,25 +31,10 @@ EXPORT_SYMBOL_GPL(hypercall_page);
  * Pointer to the xen_vcpu_info structure or
  * &HYPERVISOR_shared_info->vcpu_info[cpu]. See xen_hvm_init_shared_info
  * and xen_vcpu_setup for details. By default it points to share_info->vcpu_info
- * but if the hypervisor supports VCPUOP_register_vcpu_info then it can point
- * to xen_vcpu_info. The pointer is used in __xen_evtchn_do_upcall to
- * acknowledge pending events.
- * Also more subtly it is used by the patched version of irq enable/disable
- * e.g. xen_irq_enable_direct and xen_iret in PV mode.
- *
- * The desire to be able to do those mask/unmask operations as a single
- * instruction by using the per-cpu offset held in %gs is the real reason
- * vcpu info is in a per-cpu pointer and the original reason for this
- * hypercall.
- *
+ * but during boot it is switched to point to xen_vcpu_info.
+ * The pointer is used in __xen_evtchn_do_upcall to acknowledge pending events.
  */
 DEFINE_PER_CPU(struct vcpu_info *, xen_vcpu);
-
-/*
- * Per CPU pages used if hypervisor supports VCPUOP_register_vcpu_info
- * hypercall. This can be used both in PV and PVHVM mode. The structure
- * overrides the default per_cpu(xen_vcpu, cpu) value.
- */
 DEFINE_PER_CPU(struct vcpu_info, xen_vcpu_info);
 
 /* Linux <-> Xen vCPU id mapping */
diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
index dfa091d79c2e..ae8537583102 100644
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -24,60 +24,6 @@ void xen_force_evtchn_callback(void)
 	(void)HYPERVISOR_xen_version(0, NULL);
 }
 
-asmlinkage __visible unsigned long xen_save_fl(void)
-{
-	struct vcpu_info *vcpu;
-	unsigned long flags;
-
-	vcpu = this_cpu_read(xen_vcpu);
-
-	/* flag has opposite sense of mask */
-	flags = !vcpu->evtchn_upcall_mask;
-
-	/* convert to IF type flag
-	   -0 -> 0x00000000
-	   -1 -> 0xffffffff
-	*/
-	return (-flags) & X86_EFLAGS_IF;
-}
-PV_CALLEE_SAVE_REGS_THUNK(xen_save_fl);
-
-asmlinkage __visible void xen_irq_disable(void)
-{
-	/* There's a one instruction preempt window here.  We need to
-	   make sure we're don't switch CPUs between getting the vcpu
-	   pointer and updating the mask. */
-	preempt_disable();
-	this_cpu_read(xen_vcpu)->evtchn_upcall_mask = 1;
-	preempt_enable_no_resched();
-}
-PV_CALLEE_SAVE_REGS_THUNK(xen_irq_disable);
-
-asmlinkage __visible void xen_irq_enable(void)
-{
-	struct vcpu_info *vcpu;
-
-	/*
-	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
-	 * cleared, so disable preemption to ensure we check for
-	 * events on the VCPU we are still running on.
-	 */
-	preempt_disable();
-
-	vcpu = this_cpu_read(xen_vcpu);
-	vcpu->evtchn_upcall_mask = 0;
-
-	/* Doesn't matter if we get preempted here, because any
-	   pending event will get dealt with anyway. */
-
-	barrier(); /* unmask then check (avoid races) */
-	if (unlikely(vcpu->evtchn_upcall_pending))
-		xen_force_evtchn_callback();
-
-	preempt_enable();
-}
-PV_CALLEE_SAVE_REGS_THUNK(xen_irq_enable);
-
 static void xen_safe_halt(void)
 {
 	/* Blocking includes an implicit local_irq_enable(). */
@@ -95,9 +41,10 @@ static void xen_halt(void)
 }
 
 static const struct pv_irq_ops xen_irq_ops __initconst = {
-	.save_fl = PV_CALLEE_SAVE(xen_save_fl),
-	.irq_disable = PV_CALLEE_SAVE(xen_irq_disable),
-	.irq_enable = PV_CALLEE_SAVE(xen_irq_enable),
+	/* Initial interrupt flag handling only called while interrupts off. */
+	.save_fl = __PV_IS_CALLEE_SAVE(paravirt_ret0),
+	.irq_disable = __PV_IS_CALLEE_SAVE(paravirt_nop),
+	.irq_enable = __PV_IS_CALLEE_SAVE(paravirt_BUG),
 
 	.safe_halt = xen_safe_halt,
 	.halt = xen_halt,
-- 
2.26.2


