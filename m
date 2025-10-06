Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2693BBD48F
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 09:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137913.1473754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5g4y-0004E6-6e; Mon, 06 Oct 2025 07:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137913.1473754; Mon, 06 Oct 2025 07:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5g4y-0004BP-34; Mon, 06 Oct 2025 07:56:20 +0000
Received: by outflank-mailman (input) for mailman id 1137913;
 Mon, 06 Oct 2025 07:56:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kU4J=4P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v5fwn-0000J4-Qe
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 07:47:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3afc22e-a288-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 09:47:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0BBA1F789;
 Mon,  6 Oct 2025 07:47:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B31013A7E;
 Mon,  6 Oct 2025 07:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GwqBHCh042i6HgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Oct 2025 07:47:52 +0000
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
X-Inumbo-ID: c3afc22e-a288-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759736872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8D2Ip9zKf+rwkE/itGYhpzZbDiv28YhmlJL38GD5X2o=;
	b=JjbP5y+hnPx4a5gWixM95oKg7rWHdi+hbnN119BCYYw6QhKnwkE238vxXgesFkNzIzmwTe
	EZ7COrOkoQldCZVxqNOFG9PVXxD9olzFu/Z3kiEVr3umfSK5nzshss4DtKDGZxSUPDGnlm
	CWg9bnUm5PKNDJ8YaU8b14kEmunQbQ8=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=JjbP5y+h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759736872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8D2Ip9zKf+rwkE/itGYhpzZbDiv28YhmlJL38GD5X2o=;
	b=JjbP5y+hnPx4a5gWixM95oKg7rWHdi+hbnN119BCYYw6QhKnwkE238vxXgesFkNzIzmwTe
	EZ7COrOkoQldCZVxqNOFG9PVXxD9olzFu/Z3kiEVr3umfSK5nzshss4DtKDGZxSUPDGnlm
	CWg9bnUm5PKNDJ8YaU8b14kEmunQbQ8=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 17/21] x86/xen: Drop xen_mmu_ops
Date: Mon,  6 Oct 2025 09:46:02 +0200
Message-ID: <20251006074606.1266-18-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006074606.1266-1-jgross@suse.com>
References: <20251006074606.1266-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E0BBA1F789
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Spam-Score: -3.01

Instead of having a pre-filled array xen_mmu_ops for Xen PV paravirt
functions, drop the array and assign each element individually.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/xen/mmu_pv.c | 100 ++++++++++++++++--------------------------
 tools/objtool/check.c |   1 -
 2 files changed, 38 insertions(+), 63 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2a4a8deaf612..9fa00c4a8858 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2175,73 +2175,49 @@ static void xen_leave_lazy_mmu(void)
 	preempt_enable();
 }
 
-static const typeof(pv_ops) xen_mmu_ops __initconst = {
-	.mmu = {
-		.read_cr2 = __PV_IS_CALLEE_SAVE(xen_read_cr2),
-		.write_cr2 = xen_write_cr2,
-
-		.read_cr3 = xen_read_cr3,
-		.write_cr3 = xen_write_cr3_init,
-
-		.flush_tlb_user = xen_flush_tlb,
-		.flush_tlb_kernel = xen_flush_tlb,
-		.flush_tlb_one_user = xen_flush_tlb_one_user,
-		.flush_tlb_multi = xen_flush_tlb_multi,
-
-		.pgd_alloc = xen_pgd_alloc,
-		.pgd_free = xen_pgd_free,
-
-		.alloc_pte = xen_alloc_pte_init,
-		.release_pte = xen_release_pte_init,
-		.alloc_pmd = xen_alloc_pmd_init,
-		.release_pmd = xen_release_pmd_init,
-
-		.set_pte = xen_set_pte_init,
-		.set_pmd = xen_set_pmd_hyper,
-
-		.ptep_modify_prot_start = xen_ptep_modify_prot_start,
-		.ptep_modify_prot_commit = xen_ptep_modify_prot_commit,
-
-		.pte_val = PV_CALLEE_SAVE(xen_pte_val),
-		.pgd_val = PV_CALLEE_SAVE(xen_pgd_val),
-
-		.make_pte = PV_CALLEE_SAVE(xen_make_pte_init),
-		.make_pgd = PV_CALLEE_SAVE(xen_make_pgd),
-
-		.set_pud = xen_set_pud_hyper,
-
-		.make_pmd = PV_CALLEE_SAVE(xen_make_pmd),
-		.pmd_val = PV_CALLEE_SAVE(xen_pmd_val),
-
-		.pud_val = PV_CALLEE_SAVE(xen_pud_val),
-		.make_pud = PV_CALLEE_SAVE(xen_make_pud),
-		.set_p4d = xen_set_p4d_hyper,
-
-		.alloc_pud = xen_alloc_pmd_init,
-		.release_pud = xen_release_pmd_init,
-
-		.p4d_val = PV_CALLEE_SAVE(xen_p4d_val),
-		.make_p4d = PV_CALLEE_SAVE(xen_make_p4d),
-
-		.enter_mmap = xen_enter_mmap,
-		.exit_mmap = xen_exit_mmap,
-
-		.lazy_mode = {
-			.enter = xen_enter_lazy_mmu,
-			.leave = xen_leave_lazy_mmu,
-			.flush = xen_flush_lazy_mmu,
-		},
-
-		.set_fixmap = xen_set_fixmap,
-	},
-};
-
 void __init xen_init_mmu_ops(void)
 {
 	x86_init.paging.pagetable_init = xen_pagetable_init;
 	x86_init.hyper.init_after_bootmem = xen_after_bootmem;
 
-	pv_ops.mmu = xen_mmu_ops.mmu;
+	pv_ops.mmu.read_cr2 = __PV_IS_CALLEE_SAVE(xen_read_cr2);
+	pv_ops.mmu.write_cr2 = xen_write_cr2;
+	pv_ops.mmu.read_cr3 = xen_read_cr3;
+	pv_ops.mmu.write_cr3 = xen_write_cr3_init;
+	pv_ops.mmu.flush_tlb_user = xen_flush_tlb;
+	pv_ops.mmu.flush_tlb_kernel = xen_flush_tlb;
+	pv_ops.mmu.flush_tlb_one_user = xen_flush_tlb_one_user;
+	pv_ops.mmu.flush_tlb_multi = xen_flush_tlb_multi;
+	pv_ops.mmu.pgd_alloc = xen_pgd_alloc;
+	pv_ops.mmu.pgd_free = xen_pgd_free;
+	pv_ops.mmu.alloc_pte = xen_alloc_pte_init;
+	pv_ops.mmu.release_pte = xen_release_pte_init;
+	pv_ops.mmu.alloc_pmd = xen_alloc_pmd_init;
+	pv_ops.mmu.release_pmd = xen_release_pmd_init;
+	pv_ops.mmu.set_pte = xen_set_pte_init;
+	pv_ops.mmu.set_pmd = xen_set_pmd_hyper;
+	pv_ops.mmu.ptep_modify_prot_start = xen_ptep_modify_prot_start;
+	pv_ops.mmu.ptep_modify_prot_commit = xen_ptep_modify_prot_commit;
+	pv_ops.mmu.pte_val = PV_CALLEE_SAVE(xen_pte_val);
+	pv_ops.mmu.pgd_val = PV_CALLEE_SAVE(xen_pgd_val);
+	pv_ops.mmu.make_pte = PV_CALLEE_SAVE(xen_make_pte_init);
+	pv_ops.mmu.make_pgd = PV_CALLEE_SAVE(xen_make_pgd);
+	pv_ops.mmu.set_pud = xen_set_pud_hyper;
+	pv_ops.mmu.make_pmd = PV_CALLEE_SAVE(xen_make_pmd);
+	pv_ops.mmu.pmd_val = PV_CALLEE_SAVE(xen_pmd_val);
+	pv_ops.mmu.pud_val = PV_CALLEE_SAVE(xen_pud_val);
+	pv_ops.mmu.make_pud = PV_CALLEE_SAVE(xen_make_pud);
+	pv_ops.mmu.set_p4d = xen_set_p4d_hyper;
+	pv_ops.mmu.alloc_pud = xen_alloc_pmd_init;
+	pv_ops.mmu.release_pud = xen_release_pmd_init;
+	pv_ops.mmu.p4d_val = PV_CALLEE_SAVE(xen_p4d_val);
+	pv_ops.mmu.make_p4d = PV_CALLEE_SAVE(xen_make_p4d);
+	pv_ops.mmu.enter_mmap = xen_enter_mmap;
+	pv_ops.mmu.exit_mmap = xen_exit_mmap;
+	pv_ops.mmu.lazy_mode.enter = xen_enter_lazy_mmu;
+	pv_ops.mmu.lazy_mode.leave = xen_leave_lazy_mmu;
+	pv_ops.mmu.lazy_mode.flush = xen_flush_lazy_mmu;
+	pv_ops.mmu.set_fixmap = xen_set_fixmap;
 
 	memset(dummy_mapping, 0xff, PAGE_SIZE);
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3d8a5ffb0fee..8793b73d50d2 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -592,7 +592,6 @@ static int init_pv_ops(struct objtool_file *file)
 {
 	static const char *pv_ops_tables[] = {
 		"pv_ops",
-		"xen_mmu_ops",
 		NULL,
 	};
 	const char *pv_ops;
-- 
2.51.0


