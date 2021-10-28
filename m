Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5443DC03
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 09:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217683.377815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzpQ-0004aq-Dq; Thu, 28 Oct 2021 07:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217683.377815; Thu, 28 Oct 2021 07:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzpQ-0004Wm-9R; Thu, 28 Oct 2021 07:28:00 +0000
Received: by outflank-mailman (input) for mailman id 217683;
 Thu, 28 Oct 2021 07:27:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfzpO-0004U4-Tx
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 07:27:58 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 913742bf-37c0-11ec-8499-12813bfff9fa;
 Thu, 28 Oct 2021 07:27:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04A4B21966;
 Thu, 28 Oct 2021 07:27:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADEA513ABD;
 Thu, 28 Oct 2021 07:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0KRSKftQemEmGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 07:27:55 +0000
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
X-Inumbo-ID: 913742bf-37c0-11ec-8499-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635406076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUfw6t8nwpxm2zhH5abaL+rPMYpBE9jrK9+wuQK9hvA=;
	b=gi6tqNuahpz4PiXSsejbjDh7zaV2+FLmXWLxMRdjprAWF5wE8v3Vjmp8qgy0D1hMn6S5vM
	wDB8UN/b58JMPqALcU8BEyk1mlq3oTqvRGoyECXLSjWaLEgOmzvBO8Ef8JKReLmj00h2Jz
	lTjxccr136CnGdVrXXgPiOH8c9oYrqU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 1/2] x86/xen: remove xen_have_vcpu_info_placement flag
Date: Thu, 28 Oct 2021 09:27:47 +0200
Message-Id: <20211028072748.29862-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028072748.29862-1-jgross@suse.com>
References: <20211028072748.29862-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flag xen_have_vcpu_info_placement was needed to support Xen
hypervisors older than version 3.4, which didn't support the
VCPUOP_register_vcpu_info hypercall. Today the Linux kernel requires
at least Xen 4.0 to be able to run, so xen_have_vcpu_info_placement
can be dropped (in theory the flag was used to ensure a working kernel
even in case of the VCPUOP_register_vcpu_info hypercall failing for
other reasons than the hypercall not being supported, but the only
cases covered by the flag would be parameter errors, which ought not
to be made anyway).

This allows to let some functions return void now, as they can never
fail.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/x86/xen/enlighten.c     | 97 +++++++++---------------------------
 arch/x86/xen/enlighten_hvm.c |  6 +--
 arch/x86/xen/enlighten_pv.c  | 28 ++---------
 arch/x86/xen/smp.c           | 24 ---------
 arch/x86/xen/xen-ops.h       |  4 +-
 5 files changed, 33 insertions(+), 126 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 95d970359e17..006b4a814fac 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -84,21 +84,6 @@ EXPORT_SYMBOL(xen_start_flags);
  */
 struct shared_info *HYPERVISOR_shared_info = &xen_dummy_shared_info;
 
-/*
- * Flag to determine whether vcpu info placement is available on all
- * VCPUs.  We assume it is to start with, and then set it to zero on
- * the first failure.  This is because it can succeed on some VCPUs
- * and not others, since it can involve hypervisor memory allocation,
- * or because the guest failed to guarantee all the appropriate
- * constraints on all VCPUs (ie buffer can't cross a page boundary).
- *
- * Note that any particular CPU may be using a placed vcpu structure,
- * but we can only optimise if the all are.
- *
- * 0: not available, 1: available
- */
-int xen_have_vcpu_info_placement = 1;
-
 static int xen_cpu_up_online(unsigned int cpu)
 {
 	xen_init_lock_cpu(cpu);
@@ -124,10 +109,8 @@ int xen_cpuhp_setup(int (*cpu_up_prepare_cb)(unsigned int),
 	return rc >= 0 ? 0 : rc;
 }
 
-static int xen_vcpu_setup_restore(int cpu)
+static void xen_vcpu_setup_restore(int cpu)
 {
-	int rc = 0;
-
 	/* Any per_cpu(xen_vcpu) is stale, so reset it */
 	xen_vcpu_info_reset(cpu);
 
@@ -136,11 +119,8 @@ static int xen_vcpu_setup_restore(int cpu)
 	 * be handled by hotplug.
 	 */
 	if (xen_pv_domain() ||
-	    (xen_hvm_domain() && cpu_online(cpu))) {
-		rc = xen_vcpu_setup(cpu);
-	}
-
-	return rc;
+	    (xen_hvm_domain() && cpu_online(cpu)))
+		xen_vcpu_setup(cpu);
 }
 
 /*
@@ -150,7 +130,7 @@ static int xen_vcpu_setup_restore(int cpu)
  */
 void xen_vcpu_restore(void)
 {
-	int cpu, rc;
+	int cpu;
 
 	for_each_possible_cpu(cpu) {
 		bool other_cpu = (cpu != smp_processor_id());
@@ -170,20 +150,9 @@ void xen_vcpu_restore(void)
 		if (xen_pv_domain() || xen_feature(XENFEAT_hvm_safe_pvclock))
 			xen_setup_runstate_info(cpu);
 
-		rc = xen_vcpu_setup_restore(cpu);
-		if (rc)
-			pr_emerg_once("vcpu restore failed for cpu=%d err=%d. "
-					"System will hang.\n", cpu, rc);
-		/*
-		 * In case xen_vcpu_setup_restore() fails, do not bring up the
-		 * VCPU. This helps us avoid the resulting OOPS when the VCPU
-		 * accesses pvclock_vcpu_time via xen_vcpu (which is NULL.)
-		 * Note that this does not improve the situation much -- now the
-		 * VM hangs instead of OOPSing -- with the VCPUs that did not
-		 * fail, spinning in stop_machine(), waiting for the failed
-		 * VCPUs to come up.
-		 */
-		if (other_cpu && is_up && (rc == 0) &&
+		xen_vcpu_setup_restore(cpu);
+
+		if (other_cpu && is_up &&
 		    HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL))
 			BUG();
 	}
@@ -200,7 +169,7 @@ void xen_vcpu_info_reset(int cpu)
 	}
 }
 
-int xen_vcpu_setup(int cpu)
+void xen_vcpu_setup(int cpu)
 {
 	struct vcpu_register_vcpu_info info;
 	int err;
@@ -221,44 +190,26 @@ int xen_vcpu_setup(int cpu)
 	 */
 	if (xen_hvm_domain()) {
 		if (per_cpu(xen_vcpu, cpu) == &per_cpu(xen_vcpu_info, cpu))
-			return 0;
+			return;
 	}
 
-	if (xen_have_vcpu_info_placement) {
-		vcpup = &per_cpu(xen_vcpu_info, cpu);
-		info.mfn = arbitrary_virt_to_mfn(vcpup);
-		info.offset = offset_in_page(vcpup);
+	vcpup = &per_cpu(xen_vcpu_info, cpu);
+	info.mfn = arbitrary_virt_to_mfn(vcpup);
+	info.offset = offset_in_page(vcpup);
 
-		/*
-		 * Check to see if the hypervisor will put the vcpu_info
-		 * structure where we want it, which allows direct access via
-		 * a percpu-variable.
-		 * N.B. This hypercall can _only_ be called once per CPU.
-		 * Subsequent calls will error out with -EINVAL. This is due to
-		 * the fact that hypervisor has no unregister variant and this
-		 * hypercall does not allow to over-write info.mfn and
-		 * info.offset.
-		 */
-		err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info,
-					 xen_vcpu_nr(cpu), &info);
-
-		if (err) {
-			pr_warn_once("register_vcpu_info failed: cpu=%d err=%d\n",
-				     cpu, err);
-			xen_have_vcpu_info_placement = 0;
-		} else {
-			/*
-			 * This cpu is using the registered vcpu info, even if
-			 * later ones fail to.
-			 */
-			per_cpu(xen_vcpu, cpu) = vcpup;
-		}
-	}
-
-	if (!xen_have_vcpu_info_placement)
-		xen_vcpu_info_reset(cpu);
+	/*
+	 * N.B. This hypercall can _only_ be called once per CPU.
+	 * Subsequent calls will error out with -EINVAL. This is due to
+	 * the fact that hypervisor has no unregister variant and this
+	 * hypercall does not allow to over-write info.mfn and
+	 * info.offset.
+	 */
+	err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
+				 &info);
+	if (err)
+		panic("register_vcpu_info failed: cpu=%d err=%d\n", cpu, err);
 
-	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
+	per_cpu(xen_vcpu, cpu) = vcpup;
 }
 
 void __init xen_banner(void)
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index e68ea5f4ad1c..42300941ec29 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -163,9 +163,9 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
 	else
 		per_cpu(xen_vcpu_id, cpu) = cpu;
-	rc = xen_vcpu_setup(cpu);
-	if (rc || !xen_have_vector_callback)
-		return rc;
+	xen_vcpu_setup(cpu);
+	if (!xen_have_vector_callback)
+		return 0;
 
 	if (xen_feature(XENFEAT_hvm_safe_pvclock))
 		xen_setup_timer(cpu);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index a7b7d674f500..2635a00be42d 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -993,31 +993,13 @@ void __init xen_setup_vcpu_info_placement(void)
 	for_each_possible_cpu(cpu) {
 		/* Set up direct vCPU id mapping for PV guests. */
 		per_cpu(xen_vcpu_id, cpu) = cpu;
-
-		/*
-		 * xen_vcpu_setup(cpu) can fail  -- in which case it
-		 * falls back to the shared_info version for cpus
-		 * where xen_vcpu_nr(cpu) < MAX_VIRT_CPUS.
-		 *
-		 * xen_cpu_up_prepare_pv() handles the rest by failing
-		 * them in hotplug.
-		 */
-		(void) xen_vcpu_setup(cpu);
+		xen_vcpu_setup(cpu);
 	}
 
-	/*
-	 * xen_vcpu_setup managed to place the vcpu_info within the
-	 * percpu area for all cpus, so make use of it.
-	 */
-	if (xen_have_vcpu_info_placement) {
-		pv_ops.irq.save_fl = __PV_IS_CALLEE_SAVE(xen_save_fl_direct);
-		pv_ops.irq.irq_disable =
-			__PV_IS_CALLEE_SAVE(xen_irq_disable_direct);
-		pv_ops.irq.irq_enable =
-			__PV_IS_CALLEE_SAVE(xen_irq_enable_direct);
-		pv_ops.mmu.read_cr2 =
-			__PV_IS_CALLEE_SAVE(xen_read_cr2_direct);
-	}
+	pv_ops.irq.save_fl = __PV_IS_CALLEE_SAVE(xen_save_fl_direct);
+	pv_ops.irq.irq_disable = __PV_IS_CALLEE_SAVE(xen_irq_disable_direct);
+	pv_ops.irq.irq_enable = __PV_IS_CALLEE_SAVE(xen_irq_enable_direct);
+	pv_ops.mmu.read_cr2 = __PV_IS_CALLEE_SAVE(xen_read_cr2_direct);
 }
 
 static const struct pv_info xen_info __initconst = {
diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index c1b2f764b29a..bafa61b1482f 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -121,34 +121,10 @@ int xen_smp_intr_init(unsigned int cpu)
 
 void __init xen_smp_cpus_done(unsigned int max_cpus)
 {
-	int cpu, rc, count = 0;
-
 	if (xen_hvm_domain())
 		native_smp_cpus_done(max_cpus);
 	else
 		calculate_max_logical_packages();
-
-	if (xen_have_vcpu_info_placement)
-		return;
-
-	for_each_online_cpu(cpu) {
-		if (xen_vcpu_nr(cpu) < MAX_VIRT_CPUS)
-			continue;
-
-		rc = remove_cpu(cpu);
-
-		if (rc == 0) {
-			/*
-			 * Reset vcpu_info so this cpu cannot be onlined again.
-			 */
-			xen_vcpu_info_reset(cpu);
-			count++;
-		} else {
-			pr_warn("%s: failed to bring CPU %d down, error %d\n",
-				__func__, cpu, rc);
-		}
-	}
-	WARN(count, "%s: brought %d CPUs offline\n", __func__, count);
 }
 
 void xen_smp_send_reschedule(int cpu)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 8bc8b72a205d..fd0fec6e92f4 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -76,9 +76,7 @@ irqreturn_t xen_debug_interrupt(int irq, void *dev_id);
 
 bool xen_vcpu_stolen(int vcpu);
 
-extern int xen_have_vcpu_info_placement;
-
-int xen_vcpu_setup(int cpu);
+void xen_vcpu_setup(int cpu);
 void xen_vcpu_info_reset(int cpu);
 void xen_setup_vcpu_info_placement(void);
 
-- 
2.26.2


