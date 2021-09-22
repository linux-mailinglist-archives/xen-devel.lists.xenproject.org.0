Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A841463D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192463.342936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzX1-0002U2-Nw; Wed, 22 Sep 2021 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192463.342936; Wed, 22 Sep 2021 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzX1-0002Qr-KF; Wed, 22 Sep 2021 10:31:15 +0000
Received: by outflank-mailman (input) for mailman id 192463;
 Wed, 22 Sep 2021 10:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSzWz-0001rn-Tf
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:31:13 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e77e6817-55e9-45f3-ba1c-791dba56408a;
 Wed, 22 Sep 2021 10:31:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C57DC201E0;
 Wed, 22 Sep 2021 10:31:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EEA813D69;
 Wed, 22 Sep 2021 10:31:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gNPdGesFS2GHWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Sep 2021 10:31:07 +0000
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
X-Inumbo-ID: e77e6817-55e9-45f3-ba1c-791dba56408a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632306667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86firgN1jlIPP55LKir2kex+Qi/Crgc5F8hTbnkpj2U=;
	b=kZGArRO73g3w8z8IReMclRkOaaUnVYe0ECsdBZfUOlFhmaUZHgqupIR64JXeM1AHaQXDsA
	CijKASyMoETKc7tdXh1H8YtbxRn7zNVjB1cwhvD/ldCJZSZDDhSIuExXIGRBBu3MMqWqB4
	WjQ9ub50sn99ss24Wydkqxj9LgIgvOY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	Juergen Gross <jgross@suse.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] x86/xen: switch initial pvops IRQ functions to dummy ones
Date: Wed, 22 Sep 2021 12:31:02 +0200
Message-Id: <20210922103102.3589-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210922103102.3589-1-jgross@suse.com>
References: <20210922103102.3589-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial pvops functions handling irq flags will only ever be called
before interrupts are being enabled.

So make the __init and switch them to be dummy functions:
- xen_save_fl() can always return 0
- xen_irq_disable() is a nop
- xen_irq_enable() can BUG()

Add some generic paravirt functions for that purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
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
index 04cafc057bed..4f0ebc46a15d 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -46,6 +46,17 @@ asm (".pushsection .entry.text, \"ax\"\n"
      ".type _paravirt_nop, @function\n\t"
      ".popsection");
 
+/* stub always return ing 0. */
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
+void paravirt_BUG(void)
 {
 	BUG();
 }
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 8a7bd3f4591e..d96cabe34a01 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -27,25 +27,10 @@ EXPORT_SYMBOL_GPL(hypercall_page);
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


