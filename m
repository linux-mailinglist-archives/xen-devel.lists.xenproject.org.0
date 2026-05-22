Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK0sF4t0EGquXgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:21:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC395B6D01
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316986.1586304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRgl-0004fH-Gb; Fri, 22 May 2026 15:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316986.1586304; Fri, 22 May 2026 15:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRgl-0004c4-CX; Fri, 22 May 2026 15:21:27 +0000
Received: by outflank-mailman (input) for mailman id 1316986;
 Fri, 22 May 2026 15:21:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wQRgk-0004bU-0d
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:21:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQRgj-007385-6Z
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:21:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a107474-2eae-0a2a0a5409dd-0a2a4505b378-2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:21:25 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a107474-aaa8-0a2a45050019-c387df83c356-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:21:25 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A39AD67CF3;
 Fri, 22 May 2026 15:21:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6765E593A8;
 Fri, 22 May 2026 15:21:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KGomGHN0EGqFHwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 22 May 2026 15:21:23 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779463284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gtEy/TKWNMRa8HbImrFhVuemzU/aU6A58QyV+4lRq8=;
	b=knOvWJxqLEbZsqZ/12jKynptTSPZZ8mcm/H1vh5n25yo7u4vEQYRHni9ssjMHo3KS2GBPj
	EW2XsAIG0/ACRDaj5LpCQK18oOME/NvvBrrO9EGMwz0leb9FUtP/wafuyPr2/T5YrfaHPN
	06NOtYASFynBPmc+4IBLr5SM2Hiu3I0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779463283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gtEy/TKWNMRa8HbImrFhVuemzU/aU6A58QyV+4lRq8=;
	b=IPM2b6PLDn3U/LQmXOAjd6W7Y5PJqlQ6yv/Hl59HGVGwb8MkNApRRu7+mBqiF3eZpv4cvt
	oW02/9yiacnedlFv1icPuSNLnR/XD3DZqbnsZHoDZL4meT5cpHfnH5xIySrYUAGRJgeTBF
	ZOnKJeqdQMqz4gg4+MVO+vtEuTvcCpY=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] x86/xen: Guard PV-only stuff in xen-ops.h with CONFIG_XEN_PV
Date: Fri, 22 May 2026 17:21:12 +0200
Message-ID: <20260522152114.77319-2-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522152114.77319-1-jgross@suse.com>
References: <20260522152114.77319-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-c201ff/1779463285-E318B443-ED6AF8A5/0/0
X-purgate-type: clean
X-purgate-size: 11424
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0FC395B6D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A lot of arch/x86/xen/xen-ops.h is meant to be for PV only. Guard all
of it with CONFIG_XEN_PV in order to avoid someone misusing it in
non-PV builds. Additionally any 64-bit tests for now guarded items can
be dropped.

Move the enum pt_level definition to mmu_pv.c, as it is used only there.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu_pv.c  |   8 ++
 arch/x86/xen/xen-ops.h | 240 ++++++++++++++++++++---------------------
 2 files changed, 123 insertions(+), 125 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 3eee5f84f8a7..cd80406be9c6 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -84,6 +84,14 @@
 
 #include "xen-ops.h"
 
+enum pt_level {
+	PT_PGD,
+	PT_P4D,
+	PT_PUD,
+	PT_PMD,
+	PT_PTE
+};
+
 /*
  * Prototypes for functions called via PV_CALLEE_SAVE_REGS_THUNK() in order
  * to avoid warnings with "-Wmissing-prototypes".
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index f6c331b20fad..a27ab1f50cf9 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -12,28 +12,24 @@
 
 #include <asm/page.h>
 
+#ifdef CONFIG_XEN_PV
+
 #include <trace/events/xen.h>
 
 /* These are code, but not functions.  Defined in entry.S */
 extern const char xen_failsafe_callback[];
 
-void xen_entry_SYSENTER_compat(void);
-#ifdef CONFIG_X86_64
-void xen_entry_SYSCALL_64(void);
-void xen_entry_SYSCALL_compat(void);
-#endif
+DECLARE_PER_CPU(unsigned long, xen_cr3);
 
 extern void *xen_initial_gdt;
+extern cpumask_var_t xen_cpu_initialized_map;
 
 struct trap_info;
 void xen_copy_trap_info(struct trap_info *traps);
 
-DECLARE_PER_CPU_ALIGNED(struct vcpu_info, xen_vcpu_info);
-DECLARE_PER_CPU(unsigned long, xen_cr3);
-
-extern struct start_info *xen_start_info;
-extern struct shared_info xen_dummy_shared_info;
-extern struct shared_info *HYPERVISOR_shared_info;
+void xen_entry_SYSENTER_compat(void);
+void xen_entry_SYSCALL_64(void);
+void xen_entry_SYSCALL_compat(void);
 
 void xen_setup_mfn_list_list(void);
 void xen_build_mfn_list_list(void);
@@ -44,13 +40,10 @@ void __init xen_pt_check_e820(void);
 
 void xen_mm_pin_all(void);
 void xen_mm_unpin_all(void);
-#ifdef CONFIG_X86_64
 void __init xen_relocate_p2m(void);
-#endif
 void __init xen_do_remap_nonram(void);
 void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
 				 unsigned long size);
-
 void __init xen_chk_is_e820_usable(phys_addr_t start, phys_addr_t size,
 				   const char *component);
 unsigned long __ref xen_chk_extra_mem(unsigned long pfn);
@@ -59,17 +52,119 @@ void __init xen_remap_memory(void);
 phys_addr_t __init xen_find_free_area(phys_addr_t size);
 char * __init xen_memory_setup(void);
 void __init xen_arch_setup(void);
-void xen_banner(void);
 void xen_enable_syscall(void);
-void xen_vcpu_restore(void);
+void __init xen_build_dynamic_phys_to_machine(void);
+void __init xen_vmalloc_p2m_tree(void);
+void xen_init_irq_ops(void);
+void xen_setup_vcpu_info_placement(void);
+void __init xen_init_apic(void);
+
+__visible void xen_irq_enable_direct(void);
+__visible void xen_irq_disable_direct(void);
+__visible unsigned long xen_save_fl_direct(void);
+
+__visible unsigned long xen_read_cr2(void);
+__visible unsigned long xen_read_cr2_direct(void);
+
+/* These are not functions, and cannot be called normally */
+__visible void xen_iret(void);
+
+void xen_force_evtchn_callback(void);
+
+void xen_pv_pre_suspend(void);
+void xen_pv_post_suspend(int suspend_cancelled);
+void xen_start_kernel(struct start_info *si);
+
+void set_pte_mfn(unsigned long vaddr, unsigned long pfn, pgprot_t flags);
+void xen_init_mmu_ops(void);
+
+/* Multicalls */
+struct multicall_space
+{
+	struct multicall_entry *mc;
+	void *args;
+};
+
+/* Allocate room for a multicall and its args */
+struct multicall_space __xen_mc_entry(size_t args);
+
+DECLARE_PER_CPU(unsigned long, xen_mc_irq_flags);
+
+/* Call to start a batch of multiple __xen_mc_entry()s.  Must be
+   paired with xen_mc_issue() */
+static inline void xen_mc_batch(void)
+{
+	unsigned long flags;
+
+	/* need to disable interrupts until this entry is complete */
+	local_irq_save(flags);
+	trace_xen_mc_batch(xen_get_lazy_mode());
+	__this_cpu_write(xen_mc_irq_flags, flags);
+}
+
+static inline struct multicall_space xen_mc_entry(size_t args)
+{
+	xen_mc_batch();
+	return __xen_mc_entry(args);
+}
+
+/* Flush all pending multicalls */
+void xen_mc_flush(void);
+
+/* Issue a multicall if we're not in a lazy mode */
+static inline void xen_mc_issue(unsigned mode)
+{
+	trace_xen_mc_issue(mode);
+
+	if ((xen_get_lazy_mode() & mode) == 0)
+		xen_mc_flush();
+
+	/* restore flags saved in xen_mc_batch */
+	local_irq_restore(this_cpu_read(xen_mc_irq_flags));
+}
+
+/* Set up a callback to be called when the current batch is flushed */
+void xen_mc_callback(void (*fn)(void *), void *data);
+
+/*
+ * Try to extend the arguments of the previous multicall command.  The
+ * previous command's op must match.  If it does, then it attempts to
+ * extend the argument space allocated to the multicall entry by
+ * arg_size bytes.
+ *
+ * The returned multicall_space will return with mc pointing to the
+ * command on success, or NULL on failure, and args pointing to the
+ * newly allocated space.
+ */
+struct multicall_space xen_mc_extend_args(unsigned long op, size_t arg_size);
+
+extern bool is_xen_pmu;
+
+irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id);
+bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read);
+int pmu_apic_update(uint32_t reg);
+u64 xen_read_pmc(int counter);
+
+void xen_hypercall_pv(void);
+
+#else
+
+static inline void xen_pv_pre_suspend(void) {}
+static inline void xen_pv_post_suspend(int suspend_cancelled) {}
 
+#endif /* CONFIG_XEN_PV */
+
+DECLARE_PER_CPU_ALIGNED(struct vcpu_info, xen_vcpu_info);
+
+extern struct start_info *xen_start_info;
+extern struct shared_info xen_dummy_shared_info;
+extern struct shared_info *HYPERVISOR_shared_info;
+
+void xen_banner(void);
+void xen_vcpu_restore(void);
 void xen_hvm_init_shared_info(void);
 void xen_unplug_emulated_devices(void);
 
-void __init xen_build_dynamic_phys_to_machine(void);
-void __init xen_vmalloc_p2m_tree(void);
-
-void xen_init_irq_ops(void);
 void xen_setup_timer(int cpu);
 void xen_setup_runstate_info(int cpu);
 void xen_teardown_timer(int cpu);
@@ -83,13 +178,10 @@ bool xen_vcpu_stolen(int vcpu);
 
 void xen_vcpu_setup(int cpu);
 void xen_vcpu_info_reset(int cpu);
-void xen_setup_vcpu_info_placement(void);
 
 #ifdef CONFIG_SMP
 void xen_smp_init(void);
 void __init xen_hvm_smp_init(void);
-
-extern cpumask_var_t xen_cpu_initialized_map;
 #else
 static inline void xen_smp_init(void) {}
 static inline void xen_hvm_smp_init(void) {}
@@ -125,8 +217,6 @@ static inline void __init xen_init_vga(const struct dom0_vga_console_info *info,
 
 void xen_add_preferred_consoles(void);
 
-void __init xen_init_apic(void);
-
 #ifdef CONFIG_XEN_EFI
 extern void xen_efi_init(struct boot_params *boot_params);
 #else
@@ -135,16 +225,6 @@ static inline void __init xen_efi_init(struct boot_params *boot_params)
 }
 #endif
 
-__visible void xen_irq_enable_direct(void);
-__visible void xen_irq_disable_direct(void);
-__visible unsigned long xen_save_fl_direct(void);
-
-__visible unsigned long xen_read_cr2(void);
-__visible unsigned long xen_read_cr2_direct(void);
-
-/* These are not functions, and cannot be called normally */
-__visible void xen_iret(void);
-
 extern int xen_panic_handler_init(void);
 
 int xen_cpuhp_setup(int (*cpu_up_prepare_cb)(unsigned int),
@@ -153,16 +233,6 @@ int xen_cpuhp_setup(int (*cpu_up_prepare_cb)(unsigned int),
 void xen_pin_vcpu(int cpu);
 
 void xen_emergency_restart(void);
-void xen_force_evtchn_callback(void);
-
-#ifdef CONFIG_XEN_PV
-void xen_pv_pre_suspend(void);
-void xen_pv_post_suspend(int suspend_cancelled);
-void xen_start_kernel(struct start_info *si);
-#else
-static inline void xen_pv_pre_suspend(void) {}
-static inline void xen_pv_post_suspend(int suspend_cancelled) {}
-#endif
 
 #ifdef CONFIG_XEN_PVHVM
 void xen_hvm_post_suspend(int suspend_cancelled);
@@ -186,83 +256,9 @@ void xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns);
 
 struct dentry * __init xen_init_debugfs(void);
 
-enum pt_level {
-	PT_PGD,
-	PT_P4D,
-	PT_PUD,
-	PT_PMD,
-	PT_PTE
-};
-
 bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn);
-void set_pte_mfn(unsigned long vaddr, unsigned long pfn, pgprot_t flags);
-unsigned long xen_read_cr2_direct(void);
-void xen_init_mmu_ops(void);
 void xen_hvm_init_mmu_ops(void);
 
-/* Multicalls */
-struct multicall_space
-{
-	struct multicall_entry *mc;
-	void *args;
-};
-
-/* Allocate room for a multicall and its args */
-struct multicall_space __xen_mc_entry(size_t args);
-
-DECLARE_PER_CPU(unsigned long, xen_mc_irq_flags);
-
-/* Call to start a batch of multiple __xen_mc_entry()s.  Must be
-   paired with xen_mc_issue() */
-static inline void xen_mc_batch(void)
-{
-	unsigned long flags;
-
-	/* need to disable interrupts until this entry is complete */
-	local_irq_save(flags);
-	trace_xen_mc_batch(xen_get_lazy_mode());
-	__this_cpu_write(xen_mc_irq_flags, flags);
-}
-
-static inline struct multicall_space xen_mc_entry(size_t args)
-{
-	xen_mc_batch();
-	return __xen_mc_entry(args);
-}
-
-/* Flush all pending multicalls */
-void xen_mc_flush(void);
-
-/* Issue a multicall if we're not in a lazy mode */
-static inline void xen_mc_issue(unsigned mode)
-{
-	trace_xen_mc_issue(mode);
-
-	if ((xen_get_lazy_mode() & mode) == 0)
-		xen_mc_flush();
-
-	/* restore flags saved in xen_mc_batch */
-	local_irq_restore(this_cpu_read(xen_mc_irq_flags));
-}
-
-/* Set up a callback to be called when the current batch is flushed */
-void xen_mc_callback(void (*fn)(void *), void *data);
-
-/*
- * Try to extend the arguments of the previous multicall command.  The
- * previous command's op must match.  If it does, then it attempts to
- * extend the argument space allocated to the multicall entry by
- * arg_size bytes.
- *
- * The returned multicall_space will return with mc pointing to the
- * command on success, or NULL on failure, and args pointing to the
- * newly allocated space.
- */
-struct multicall_space xen_mc_extend_args(unsigned long op, size_t arg_size);
-
-extern bool is_xen_pmu;
-
-irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id);
 #ifdef CONFIG_XEN_HAVE_VPMU
 void xen_pmu_init(int cpu);
 void xen_pmu_finish(int cpu);
@@ -270,9 +266,6 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read);
-int pmu_apic_update(uint32_t reg);
-u64 xen_read_pmc(int counter);
 
 #ifdef CONFIG_SMP
 
@@ -321,9 +314,6 @@ static inline void xen_smp_intr_free_pv(unsigned int cpu) {}
 static inline void xen_smp_count_cpus(void) { }
 #endif /* CONFIG_SMP */
 
-#ifdef CONFIG_XEN_PV
-void xen_hypercall_pv(void);
-#endif
 void xen_hypercall_hvm(void);
 void xen_hypercall_amd(void);
 void xen_hypercall_intel(void);
-- 
2.54.0


