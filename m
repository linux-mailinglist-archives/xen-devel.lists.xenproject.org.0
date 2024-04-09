Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816189D5EC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 11:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702211.1097083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru84Z-0000OQ-9w; Tue, 09 Apr 2024 09:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702211.1097083; Tue, 09 Apr 2024 09:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru84Z-0000LT-7D; Tue, 09 Apr 2024 09:47:23 +0000
Received: by outflank-mailman (input) for mailman id 702211;
 Tue, 09 Apr 2024 09:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/B/Z=LO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ru84Y-0000LN-G5
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 09:47:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28ba7a75-f656-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 11:47:21 +0200 (CEST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0909233904;
 Tue,  9 Apr 2024 09:47:17 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A2F511332F;
 Tue,  9 Apr 2024 09:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0XM5JqQOFWZASgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 09 Apr 2024 09:47:16 +0000
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
X-Inumbo-ID: 28ba7a75-f656-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712656040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cEE8Wkn6d/y/YCLZKnivxV/RHoBHYd8a0gnOUebWuHI=;
	b=QPIsBPKXFZQh4+vLDEzgsnt0bg3YwEGyDRlmiwKIi4lKPWao9NQZRxJwCvyIKmVZj87H5d
	e9JmVvhPyixj49BBxhRrWJ7XdSsk6dejLV3tZpzaKk3sCVZwgb132fGAthHr0MLbmlTek6
	xiWX1K9ko21Q7zNv+XBqvuMiiAoYiak=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712656037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cEE8Wkn6d/y/YCLZKnivxV/RHoBHYd8a0gnOUebWuHI=;
	b=XQCW9dDhAKoIQB09DrYFhr2OwWLpOb3l1/9HziRBilLuIN+Zhn1eVM7/5v7y/fmBJcGULR
	/3rpmrNegO5XOQgiFiPECw0sXaSDA4wbUSrXTrBtU8VexfLw8SVOaEY8a/U/hwbKv/TJbD
	bmhEots0E6NDYp1ZAqEULxHfNQrXMKk=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] x86/pat: fix W^X violation false-positives when running as Xen PV guest
Date: Tue,  9 Apr 2024 11:47:12 +0200
Message-Id: <20240409094712.21285-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_CC(0.00)[suse.com,lists.xenproject.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,kernel.org,infradead.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]

When running as Xen PV guest in some cases W^X violation WARN()s have
been observed. Those WARN()s are produced by verify_rwx(), which looks
into the PTE to verify that writable kernel pages have the NX bit set
in order to avoid code modifications of the kernel by rogue code.

As the NX bits of all levels of translation entries are or-ed and the
RW bits of all levels are and-ed, looking just into the PTE isn't enough
for the decision that a writable page is executable, too. When running
as a Xen PV guest, kernel initialization will set the NX bit in PMD
entries of the initial page tables covering the .data segment.

When finding the PTE to have set the RW bit but no NX bit, higher level
entries must be looked at. Only when all levels have the RW bit set and
no NX bit set, the W^X violation should be flagged.

Additionally show_fault_oops() has a similar problem: it will issue the
"kernel tried to execute NX-protected page" message only if it finds
the NX bit set in the leaf translation entry, while any NX bit in
non-leaf entries are being ignored for issuing the message.

Modify lookup_address_in_pgd() to return the effective NX and RW bit
values of the non-leaf translation entries and evaluate those as well
in verify_rwx() and show_fault_oops().

Fixes: 652c5bf380ad ("x86/mm: Refuse W^X violations")
Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/pgtable_types.h |  2 +-
 arch/x86/kernel/sev.c                |  3 +-
 arch/x86/mm/fault.c                  |  7 ++--
 arch/x86/mm/pat/set_memory.c         | 56 +++++++++++++++++++++-------
 arch/x86/virt/svm/sev.c              |  3 +-
 5 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 0b748ee16b3d..91ab538d3872 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -565,7 +565,7 @@ static inline void update_page_count(int level, unsigned long pages) { }
  */
 extern pte_t *lookup_address(unsigned long address, unsigned int *level);
 extern pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
-				    unsigned int *level);
+				    unsigned int *level, bool *nx, bool *rw);
 extern pmd_t *lookup_pmd_address(unsigned long address);
 extern phys_addr_t slow_virt_to_phys(void *__address);
 extern int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn,
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 38ad066179d8..adba581e999d 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -516,12 +516,13 @@ static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt
 	unsigned long va = (unsigned long)vaddr;
 	unsigned int level;
 	phys_addr_t pa;
+	bool nx, rw;
 	pgd_t *pgd;
 	pte_t *pte;
 
 	pgd = __va(read_cr3_pa());
 	pgd = &pgd[pgd_index(va)];
-	pte = lookup_address_in_pgd(pgd, va, &level);
+	pte = lookup_address_in_pgd(pgd, va, &level, &nx, &rw);
 	if (!pte) {
 		ctxt->fi.vector     = X86_TRAP_PF;
 		ctxt->fi.cr2        = vaddr;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 622d12ec7f08..eb8e897a5653 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -514,18 +514,19 @@ show_fault_oops(struct pt_regs *regs, unsigned long error_code, unsigned long ad
 
 	if (error_code & X86_PF_INSTR) {
 		unsigned int level;
+		bool nx, rw;
 		pgd_t *pgd;
 		pte_t *pte;
 
 		pgd = __va(read_cr3_pa());
 		pgd += pgd_index(address);
 
-		pte = lookup_address_in_pgd(pgd, address, &level);
+		pte = lookup_address_in_pgd(pgd, address, &level, &nx, &rw);
 
-		if (pte && pte_present(*pte) && !pte_exec(*pte))
+		if (pte && pte_present(*pte) && (!pte_exec(*pte) || nx))
 			pr_crit("kernel tried to execute NX-protected page - exploit attempt? (uid: %d)\n",
 				from_kuid(&init_user_ns, current_uid()));
-		if (pte && pte_present(*pte) && pte_exec(*pte) &&
+		if (pte && pte_present(*pte) && pte_exec(*pte) && !nx &&
 				(pgd_flags(*pgd) & _PAGE_USER) &&
 				(__read_cr4() & X86_CR4_SMEP))
 			pr_crit("unable to execute userspace code (SMEP?) (uid: %d)\n",
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 80c9037ffadf..baa4dc4748e9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -619,7 +619,8 @@ static inline pgprot_t static_protections(pgprot_t prot, unsigned long start,
  * Validate strict W^X semantics.
  */
 static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long start,
-				  unsigned long pfn, unsigned long npg)
+				  unsigned long pfn, unsigned long npg,
+				  bool nx, bool rw)
 {
 	unsigned long end;
 
@@ -641,6 +642,10 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
 	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
 		return new;
 
+	/* Non-leaf translation entries can disable writing or execution. */
+	if (!rw || nx)
+		return new;
+
 	end = start + npg * PAGE_SIZE - 1;
 	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
 		  (unsigned long long)pgprot_val(old),
@@ -660,17 +665,22 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
  * Return a pointer to the entry and the level of the mapping.
  */
 pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
-			     unsigned int *level)
+			     unsigned int *level, bool *nx, bool *rw)
 {
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 
 	*level = PG_LEVEL_NONE;
+	*nx = false;
+	*rw = true;
 
 	if (pgd_none(*pgd))
 		return NULL;
 
+	*nx |= pgd_flags(*pgd) & _PAGE_NX;
+	*rw &= pgd_flags(*pgd) & _PAGE_RW;
+
 	p4d = p4d_offset(pgd, address);
 	if (p4d_none(*p4d))
 		return NULL;
@@ -679,6 +689,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
 		return (pte_t *)p4d;
 
+	*nx |= p4d_flags(*p4d) & _PAGE_NX;
+	*rw &= p4d_flags(*p4d) & _PAGE_RW;
+
 	pud = pud_offset(p4d, address);
 	if (pud_none(*pud))
 		return NULL;
@@ -687,6 +700,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 	if (pud_leaf(*pud) || !pud_present(*pud))
 		return (pte_t *)pud;
 
+	*nx |= pud_flags(*pud) & _PAGE_NX;
+	*rw &= pud_flags(*pud) & _PAGE_RW;
+
 	pmd = pmd_offset(pud, address);
 	if (pmd_none(*pmd))
 		return NULL;
@@ -695,6 +711,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
 		return (pte_t *)pmd;
 
+	*nx |= pmd_flags(*pmd) & _PAGE_NX;
+	*rw &= pmd_flags(*pmd) & _PAGE_RW;
+
 	*level = PG_LEVEL_4K;
 
 	return pte_offset_kernel(pmd, address);
@@ -710,18 +729,24 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
  */
 pte_t *lookup_address(unsigned long address, unsigned int *level)
 {
-	return lookup_address_in_pgd(pgd_offset_k(address), address, level);
+	bool nx, rw;
+
+	return lookup_address_in_pgd(pgd_offset_k(address), address, level,
+				     &nx, &rw);
 }
 EXPORT_SYMBOL_GPL(lookup_address);
 
 static pte_t *_lookup_address_cpa(struct cpa_data *cpa, unsigned long address,
-				  unsigned int *level)
+				  unsigned int *level, bool *nx, bool *rw)
 {
-	if (cpa->pgd)
-		return lookup_address_in_pgd(cpa->pgd + pgd_index(address),
-					       address, level);
+	pgd_t *pgd;
+
+	if (!cpa->pgd)
+		pgd = pgd_offset_k(address);
+	else
+		pgd = cpa->pgd + pgd_index(address);
 
-	return lookup_address(address, level);
+	return lookup_address_in_pgd(pgd, address, level, nx, rw);
 }
 
 /*
@@ -849,12 +874,13 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 	pgprot_t old_prot, new_prot, req_prot, chk_prot;
 	pte_t new_pte, *tmp;
 	enum pg_level level;
+	bool nx, rw;
 
 	/*
 	 * Check for races, another CPU might have split this page
 	 * up already:
 	 */
-	tmp = _lookup_address_cpa(cpa, address, &level);
+	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
 	if (tmp != kpte)
 		return 1;
 
@@ -965,7 +991,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 	new_prot = static_protections(req_prot, lpaddr, old_pfn, numpages,
 				      psize, CPA_DETECT);
 
-	new_prot = verify_rwx(old_prot, new_prot, lpaddr, old_pfn, numpages);
+	new_prot = verify_rwx(old_prot, new_prot, lpaddr, old_pfn, numpages,
+			      nx, rw);
 
 	/*
 	 * If there is a conflict, split the large page.
@@ -1046,6 +1073,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	pte_t *pbase = (pte_t *)page_address(base);
 	unsigned int i, level;
 	pgprot_t ref_prot;
+	bool nx, rw;
 	pte_t *tmp;
 
 	spin_lock(&pgd_lock);
@@ -1053,7 +1081,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	 * Check for races, another CPU might have split this page
 	 * up for us already:
 	 */
-	tmp = _lookup_address_cpa(cpa, address, &level);
+	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
 	if (tmp != kpte) {
 		spin_unlock(&pgd_lock);
 		return 1;
@@ -1594,10 +1622,11 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
 	int do_split, err;
 	unsigned int level;
 	pte_t *kpte, old_pte;
+	bool nx, rw;
 
 	address = __cpa_addr(cpa, cpa->curpage);
 repeat:
-	kpte = _lookup_address_cpa(cpa, address, &level);
+	kpte = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
 	if (!kpte)
 		return __cpa_process_fault(cpa, address, primary);
 
@@ -1619,7 +1648,8 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
 		new_prot = static_protections(new_prot, address, pfn, 1, 0,
 					      CPA_PROTECT);
 
-		new_prot = verify_rwx(old_prot, new_prot, address, pfn, 1);
+		new_prot = verify_rwx(old_prot, new_prot, address, pfn, 1,
+				      nx, rw);
 
 		new_prot = pgprot_clear_protnone_bits(new_prot);
 
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index ab0e8448bb6e..3d73b44a64a7 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -338,12 +338,13 @@ void snp_dump_hva_rmpentry(unsigned long hva)
 {
 	unsigned long paddr;
 	unsigned int level;
+	bool nx, rw;
 	pgd_t *pgd;
 	pte_t *pte;
 
 	pgd = __va(read_cr3_pa());
 	pgd += pgd_index(hva);
-	pte = lookup_address_in_pgd(pgd, hva, &level);
+	pte = lookup_address_in_pgd(pgd, hva, &level, &nx, &rw);
 
 	if (!pte) {
 		pr_err("Can't dump RMP entry for HVA %lx: no PTE/PFN found\n", hva);
-- 
2.35.3


