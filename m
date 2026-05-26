Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCOHGmq3FWrKYQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 17:08:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA935D8547
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 17:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320022.1587448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtOB-0007RV-SL; Tue, 26 May 2026 15:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320022.1587448; Tue, 26 May 2026 15:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtOB-0007PE-OO; Tue, 26 May 2026 15:08:15 +0000
Received: by outflank-mailman (input) for mailman id 1320022;
 Tue, 26 May 2026 15:08:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wRtO9-0007Ne-Qk
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:08:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRtO9-00BHE7-6i
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 17:08:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a15b750-2eae-0a2a0a5409dd-0a2a4505aa02-22
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:08:13 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a15b75c-aaa8-0a2a45050019-c387df839eee-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:08:13 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B5B4075EA1;
 Tue, 26 May 2026 15:08:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AECC5A280;
 Tue, 26 May 2026 15:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xZX0HFy3FWqaVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 26 May 2026 15:08:12 +0000
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
	t=1779808092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htKnackiGTLT6ra2yiyVCBoM5uojYzGpE60av2lvlE4=;
	b=PFA/dfob5jaYx8ziU/VgRy6SDe4zshqEhaFAiCgmyGJnLa9BG79cjVXHb65SY6s2PpEOb6
	ZelH9pCmaDauo7y1BTg/Wh4jQRtBNhSDp8kzKI+gHROm+cpqhCaDqubzp97my98RgEFJfP
	QRRvI7r+TZvT/QvfBIZsUjLJE/Ufimk=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779808092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htKnackiGTLT6ra2yiyVCBoM5uojYzGpE60av2lvlE4=;
	b=PFA/dfob5jaYx8ziU/VgRy6SDe4zshqEhaFAiCgmyGJnLa9BG79cjVXHb65SY6s2PpEOb6
	ZelH9pCmaDauo7y1BTg/Wh4jQRtBNhSDp8kzKI+gHROm+cpqhCaDqubzp97my98RgEFJfP
	QRRvI7r+TZvT/QvfBIZsUjLJE/Ufimk=
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
Subject: [PATCH 2/5] x86/xen: Change interface of xen_mc_issue()
Date: Tue, 26 May 2026 17:05:11 +0200
Message-ID: <20260526150514.129330-3-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526150514.129330-1-jgross@suse.com>
References: <20260526150514.129330-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-purgate-ID: tlsNG-c201ff/1779808093-DAF6E443-1EE9DBBB/0/0
X-purgate-type: clean
X-purgate-size: 7686
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CBA935D8547
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Today xen_mc_issue() is deciding whether to call xen_mc_flush() or not
based on the lazy mode input parameter passed.

Modify this interface to pass a boolean indicating whether the flush
should be done.

For querying lazy mmu mode use the is_lazy_mmu_mode_active() helper.

This is done in preparation for dropping the xen_lazy_mode percpu
variable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c |  8 ++++----
 arch/x86/xen/mmu_pv.c       | 38 ++++++++++++++++++-------------------
 arch/x86/xen/xen-ops.h      |  3 +--
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index ed2d7a3756ce..428189f5d437 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -544,7 +544,7 @@ static void xen_set_ldt(const void *addr, unsigned entries)
 
 	MULTI_mmuext_op(mcs.mc, op, 1, NULL, DOMID_SELF);
 
-	xen_mc_issue(XEN_LAZY_CPU);
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
 }
 
 static void xen_load_gdt(const struct desc_ptr *dtr)
@@ -649,7 +649,7 @@ static void xen_load_tls(struct thread_struct *t, unsigned int cpu)
 	load_TLS_descriptor(t, cpu, 1);
 	load_TLS_descriptor(t, cpu, 2);
 
-	xen_mc_issue(XEN_LAZY_CPU);
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
 }
 
 static void xen_load_gs_index(unsigned int idx)
@@ -1011,7 +1011,7 @@ static void xen_load_sp0(unsigned long sp0)
 
 	mcs = xen_mc_entry(0);
 	MULTI_stack_switch(mcs.mc, __KERNEL_DS, sp0);
-	xen_mc_issue(XEN_LAZY_CPU);
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
 	this_cpu_write(cpu_tss_rw.x86_tss.sp0, sp0);
 }
 
@@ -1071,7 +1071,7 @@ static void xen_write_cr0(unsigned long cr0)
 
 	MULTI_fpu_taskswitch(mcs.mc, (cr0 & X86_CR0_TS) != 0);
 
-	xen_mc_issue(XEN_LAZY_CPU);
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
 }
 
 static void xen_write_cr4(unsigned long cr4)
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index cd80406be9c6..51dbdc67c73c 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -290,7 +290,7 @@ static void xen_set_pmd_hyper(pmd_t *ptr, pmd_t val)
 	u.val = pmd_val_ma(val);
 	xen_extend_mmu_update(&u);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	preempt_enable();
 }
@@ -333,7 +333,7 @@ static bool xen_batched_set_pte(pte_t *ptep, pte_t pteval)
 	u.val = pte_val_ma(pteval);
 	xen_extend_mmu_update(&u);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	return true;
 }
@@ -380,7 +380,7 @@ static void xen_ptep_modify_prot_commit(struct vm_area_struct *vma,
 	u.val = pte_val_ma(pte);
 	xen_extend_mmu_update(&u);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 }
 
 /* Assume pteval_t is equivalent to all the other *val_t types. */
@@ -474,7 +474,7 @@ static void xen_set_pud_hyper(pud_t *ptr, pud_t val)
 	u.val = pud_val_ma(val);
 	xen_extend_mmu_update(&u);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	preempt_enable();
 }
@@ -557,7 +557,7 @@ static void __init xen_set_p4d_hyper(p4d_t *ptr, p4d_t val)
 
 	__xen_set_p4d_hyper(ptr, val);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	preempt_enable();
 }
@@ -589,7 +589,7 @@ static void xen_set_p4d(p4d_t *ptr, p4d_t val)
 	if (user_ptr)
 		__xen_set_p4d_hyper((p4d_t *)user_ptr, val);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 }
 
 __visible p4dval_t xen_p4d_val(p4d_t p4d)
@@ -816,7 +816,7 @@ static void __xen_pgd_pin(struct mm_struct *mm, pgd_t *pgd)
 			   PFN_DOWN(__pa(user_pgd)));
 	}
 
-	xen_mc_issue(0);
+	xen_mc_issue(true);
 }
 
 static void xen_pgd_pin(struct mm_struct *mm)
@@ -933,7 +933,7 @@ static void __xen_pgd_unpin(struct mm_struct *mm, pgd_t *pgd)
 
 	__xen_pgd_walk(mm, pgd, xen_unpin_page, USER_LIMIT);
 
-	xen_mc_issue(0);
+	xen_mc_issue(true);
 }
 
 static void xen_pgd_unpin(struct mm_struct *mm)
@@ -1309,7 +1309,7 @@ static noinline void xen_flush_tlb(void)
 	op->cmd = MMUEXT_TLB_FLUSH_LOCAL;
 	MULTI_mmuext_op(mcs.mc, op, 1, NULL, DOMID_SELF);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	preempt_enable();
 }
@@ -1329,7 +1329,7 @@ static void xen_flush_tlb_one_user(unsigned long addr)
 	op->arg1.linear_addr = addr & PAGE_MASK;
 	MULTI_mmuext_op(mcs.mc, op, 1, NULL, DOMID_SELF);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	preempt_enable();
 }
@@ -1366,7 +1366,7 @@ static void xen_flush_tlb_multi(const struct cpumask *cpus,
 
 	MULTI_mmuext_op(mcs.mc, &args->op, 1, NULL, DOMID_SELF);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 }
 
 static unsigned long xen_read_cr3(void)
@@ -1425,7 +1425,7 @@ static void xen_write_cr3(unsigned long cr3)
 	else
 		__xen_write_cr3(false, 0);
 
-	xen_mc_issue(XEN_LAZY_CPU);  /* interrupts restored */
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);  /* interrupts restored */
 }
 
 /*
@@ -1460,7 +1460,7 @@ static void __init xen_write_cr3_init(unsigned long cr3)
 
 	__xen_write_cr3(true, cr3);
 
-	xen_mc_issue(XEN_LAZY_CPU);  /* interrupts restored */
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);  /* interrupts restored */
 }
 
 static int xen_pgd_alloc(struct mm_struct *mm)
@@ -1622,7 +1622,7 @@ static inline void xen_alloc_ptpage(struct mm_struct *mm, unsigned long pfn,
 		    !pinned)
 			__pin_pagetable_pfn(MMUEXT_PIN_L1_TABLE, pfn);
 
-		xen_mc_issue(XEN_LAZY_MMU);
+		xen_mc_issue(!is_lazy_mmu_mode_active());
 	}
 }
 
@@ -1652,7 +1652,7 @@ static inline void xen_release_ptpage(unsigned long pfn, unsigned level)
 
 		__set_pfn_prot(pfn, PAGE_KERNEL);
 
-		xen_mc_issue(XEN_LAZY_MMU);
+		xen_mc_issue(!is_lazy_mmu_mode_active());
 
 		ClearPagePinned(page);
 	}
@@ -1875,7 +1875,7 @@ void __init xen_setup_kernel_pagetable(pgd_t *pgd, unsigned long max_pfn)
 	 */
 	xen_mc_batch();
 	__xen_write_cr3(true, __pa(init_top_pgt));
-	xen_mc_issue(XEN_LAZY_CPU);
+	xen_mc_issue(xen_get_lazy_mode() != XEN_LAZY_CPU);
 
 	/* We can't that easily rip out L3 and L2, as the Xen pagetables are
 	 * set out this way: [L4], [L1], [L2], [L3], [L1], [L1] ...  for
@@ -2266,7 +2266,7 @@ static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
 		if (out_frames)
 			out_frames[i] = virt_to_pfn((void *)vaddr);
 	}
-	xen_mc_issue(0);
+	xen_mc_issue(true);
 }
 
 /*
@@ -2309,7 +2309,7 @@ static void xen_remap_exchanged_ptes(unsigned long vaddr, int order,
 		set_phys_to_machine(virt_to_pfn((void *)vaddr), mfn);
 	}
 
-	xen_mc_issue(0);
+	xen_mc_issue(true);
 }
 
 /*
@@ -2450,7 +2450,7 @@ static noinline void xen_flush_tlb_all(void)
 	op->cmd = MMUEXT_TLB_FLUSH_ALL;
 	MULTI_mmuext_op(mcs.mc, op, 1, NULL, DOMID_SELF);
 
-	xen_mc_issue(XEN_LAZY_MMU);
+	xen_mc_issue(!is_lazy_mmu_mode_active());
 
 	preempt_enable();
 }
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index dc892f421f25..dc265bdda24d 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -112,9 +112,8 @@ static inline struct multicall_space xen_mc_entry(size_t args)
 void xen_mc_flush(void);
 
 /* Issue a multicall if we're not in a lazy mode */
-static inline void xen_mc_issue(unsigned mode)
+static inline void xen_mc_issue(bool flush)
 {
-	bool flush = !(xen_get_lazy_mode() & mode);
 	unsigned long flags = this_cpu_read(xen_mc_irq_flags);
 
 	trace_xen_mc_issue(flush, flags);
-- 
2.54.0


