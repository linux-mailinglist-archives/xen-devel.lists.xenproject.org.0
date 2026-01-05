Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69303CF3264
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 12:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195193.1513186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vciQl-0006R8-1C; Mon, 05 Jan 2026 11:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195193.1513186; Mon, 05 Jan 2026 11:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vciQk-0006Pd-Tq; Mon, 05 Jan 2026 11:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1195193;
 Mon, 05 Jan 2026 11:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Gm=7K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vciQX-0003bi-WF
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 11:07:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2074c1-ea26-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 12:07:08 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31BC85BE37;
 Mon,  5 Jan 2026 11:07:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8E743EA63;
 Mon,  5 Jan 2026 11:07:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L7x+L1ubW2lgWgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Jan 2026 11:07:07 +0000
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
X-Inumbo-ID: ad2074c1-ea26-11f0-9ccf-f158ae23cfc8
Authentication-Results: smtp-out2.suse.de;
	none
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
Subject: [PATCH v5 17/21] x86/xen: Drop xen_mmu_ops
Date: Mon,  5 Jan 2026 12:05:16 +0100
Message-ID: <20260105110520.21356-18-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105110520.21356-1-jgross@suse.com>
References: <20260105110520.21356-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 31BC85BE37
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

Instead of having a pre-filled array xen_mmu_ops for Xen PV paravirt
functions, drop the array and assign each element individually.

This is in preparation of reducing the paravirt include hell by
splitting paravirt.h into multiple more fine grained header files,
which will in turn require to split up the pv_ops vector as well.
Dropping the pre-filled array makes life easier for objtool to
detect missing initializers in multiple pv_ops_ arrays.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
index 8ab88f2b2c1b..61f3e0c48fcc 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -570,7 +570,6 @@ static int init_pv_ops(struct objtool_file *file)
 {
 	static const char *pv_ops_tables[] = {
 		"pv_ops",
-		"xen_mmu_ops",
 		NULL,
 	};
 	const char *pv_ops;
-- 
2.51.0


