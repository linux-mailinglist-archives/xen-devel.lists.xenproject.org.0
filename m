Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB40A96FEE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962774.1353972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDe-0002GV-4t; Tue, 22 Apr 2025 15:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962774.1353972; Tue, 22 Apr 2025 15:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDd-0002Dr-VX; Tue, 22 Apr 2025 15:07:29 +0000
Received: by outflank-mailman (input) for mailman id 962774;
 Tue, 22 Apr 2025 15:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDd-0008SP-0e
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:29 +0000
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net
 [46.105.63.121]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f7a7aab-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:25 +0200 (CEST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.16])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlvw0s3Lz27Y7
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:23 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fnzlb (unknown [10.108.42.75])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2E3471FEA2;
 Tue, 22 Apr 2025 15:07:22 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-5b5ff79f4f-fnzlb with ESMTPSA
 id N52PL6qwB2i2/wQAUkQdEw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:22 +0000
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
X-Inumbo-ID: 7f7a7aab-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-105G006674ba4df-a111-49e8-8f59-2ab0d0e0c115,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 07/21] x86/mtrr: expose functions for pausing caching
Date: Tue, 22 Apr 2025 18:06:41 +0300
Message-ID: <d3237171f5964b82d1de916c401172f6f406faec.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12730268772191679644
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=p5/X8odYi3YN7N37QJCMftuc5hqSiV9vDM1ybqq3iiI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334444; v=1;
 b=l1vUQY5hsQn3ZgjUTDZJJXrr01X7MmNzXwCZd8f8lJEWw5Cx/7e1M/N9kRWj6XJMfCx+hQO+
 kXk8/lMQSTXgwmEmmIPuvZlL8gBXMyD4X7Eqa6K3YnEZWM5uxDmJ3Aum/d+WPK4IuRWugyoLF5i
 fAa9hu8CfIqKaQ0CHRPKN961MQ0rDkDJitet6UxKq2w55AYbPFoqQx48FS/ZlG33yl6WHK7Ozlx
 i8fmzi8ebwqwPUoMje2PADCKCgFWLQmLyqR77x288GddgCSFTZzQSUa8AA6fq7s4jPvHJS6OYuE
 b/a7By/oOkqZDTmcUapk8+CCZwpAcHCJ9VsbTttgKRvPQ==

This allows the functionality to be reused by other units that need to
update MTRRs.

This also gets rid of a static variable.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/cpu/mtrr/generic.c | 51 ++++++++++++++++-----------------
 xen/arch/x86/include/asm/mtrr.h |  8 ++++++
 2 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..2a8dd1d8ff 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -396,9 +396,7 @@ static bool set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
 	return changed;
 }
 
-static uint64_t deftype;
-
-static unsigned long set_mtrr_state(void)
+static unsigned long set_mtrr_state(uint64_t *deftype)
 /*  [SUMMARY] Set the MTRR state for this CPU.
     <state> The MTRR state information to read.
     <ctxt> Some relevant CPU context.
@@ -416,14 +414,12 @@ static unsigned long set_mtrr_state(void)
 	if (mtrr_state.have_fixed && set_fixed_ranges(mtrr_state.fixed_ranges))
 		change_mask |= MTRR_CHANGE_MASK_FIXED;
 
-	/*  Set_mtrr_restore restores the old value of MTRRdefType,
-	   so to set it we fiddle with the saved value  */
-	if ((deftype & 0xff) != mtrr_state.def_type
-	    || MASK_EXTR(deftype, MTRRdefType_E) != mtrr_state.enabled
-	    || MASK_EXTR(deftype, MTRRdefType_FE) != mtrr_state.fixed_enabled) {
-		deftype = (deftype & ~0xcff) | mtrr_state.def_type |
-		          MASK_INSR(mtrr_state.enabled, MTRRdefType_E) |
-		          MASK_INSR(mtrr_state.fixed_enabled, MTRRdefType_FE);
+	if ((*deftype & 0xff) != mtrr_state.def_type
+	    || MASK_EXTR(*deftype, MTRRdefType_E) != mtrr_state.enabled
+	    || MASK_EXTR(*deftype, MTRRdefType_FE) != mtrr_state.fixed_enabled) {
+		*deftype = (*deftype & ~0xcff) | mtrr_state.def_type |
+		           MASK_INSR(mtrr_state.enabled, MTRRdefType_E) |
+		           MASK_INSR(mtrr_state.fixed_enabled, MTRRdefType_FE);
 		change_mask |= MTRR_CHANGE_MASK_DEFTYPE;
 	}
 
@@ -440,9 +436,10 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
  * has been called.
  */
 
-static bool prepare_set(void)
+struct mtrr_pausing_state mtrr_pause_caching(void)
 {
 	unsigned long cr4;
+	struct mtrr_pausing_state state;
 
 	/*  Note that this is not ideal, since the cache is only flushed/disabled
 	   for this CPU while the MTRRs are changed, but changing this requires
@@ -462,7 +459,9 @@ static bool prepare_set(void)
 	alternative("wbinvd", "", X86_FEATURE_XEN_SELFSNOOP);
 
 	cr4 = read_cr4();
-	if (cr4 & X86_CR4_PGE)
+	state.pge = cr4 & X86_CR4_PGE;
+
+	if (state.pge)
 		write_cr4(cr4 & ~X86_CR4_PGE);
 	else if (use_invpcid)
 		invpcid_flush_all();
@@ -470,27 +469,27 @@ static bool prepare_set(void)
 		write_cr3(read_cr3());
 
 	/*  Save MTRR state */
-	rdmsrl(MSR_MTRRdefType, deftype);
+	rdmsrl(MSR_MTRRdefType, state.def_type);
 
 	/*  Disable MTRRs, and set the default type to uncached  */
-	mtrr_wrmsr(MSR_MTRRdefType, deftype & ~0xcff);
+	mtrr_wrmsr(MSR_MTRRdefType, state.def_type & ~0xcff);
 
 	/* Again, only flush caches if we have to. */
 	alternative("wbinvd", "", X86_FEATURE_XEN_SELFSNOOP);
 
-	return cr4 & X86_CR4_PGE;
+	return state;
 }
 
-static void post_set(bool pge)
+void mtrr_resume_caching(struct mtrr_pausing_state state)
 {
 	/* Intel (P6) standard MTRRs */
-	mtrr_wrmsr(MSR_MTRRdefType, deftype);
+	mtrr_wrmsr(MSR_MTRRdefType, state.def_type);
 
 	/*  Enable caches  */
 	write_cr0(read_cr0() & ~X86_CR0_CD);
 
 	/*  Reenable CR4.PGE (also flushes the TLB) */
-	if (pge)
+	if (state.pge)
 		write_cr4(read_cr4() | X86_CR4_PGE);
 	else if (use_invpcid)
 		invpcid_flush_all();
@@ -504,15 +503,15 @@ void mtrr_set_all(void)
 {
 	unsigned long mask, count;
 	unsigned long flags;
-	bool pge;
+	struct mtrr_pausing_state pausing_state;
 
 	local_irq_save(flags);
-	pge = prepare_set();
+	pausing_state = mtrr_pause_caching();
 
 	/* Actually set the state */
-	mask = set_mtrr_state();
+	mask = set_mtrr_state(&pausing_state.def_type);
 
-	post_set(pge);
+	mtrr_resume_caching(pausing_state);
 	local_irq_restore(flags);
 
 	/*  Use the atomic bitops to update the global mask  */
@@ -537,12 +536,12 @@ void mtrr_set(
 {
 	unsigned long flags;
 	struct mtrr_var_range *vr;
-	bool pge;
+	struct mtrr_pausing_state pausing_state;
 
 	vr = &mtrr_state.var_ranges[reg];
 
 	local_irq_save(flags);
-	pge = prepare_set();
+	pausing_state = mtrr_pause_caching();
 
 	if (size == 0) {
 		/* The invalid bit is kept in the mask, so we simply clear the
@@ -563,7 +562,7 @@ void mtrr_set(
 		mtrr_wrmsr(MSR_IA32_MTRR_PHYSMASK(reg), vr->mask);
 	}
 
-	post_set(pge);
+	mtrr_resume_caching(pausing_state);
 	local_irq_restore(flags);
 }
 
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 25d442659d..82ea427ba0 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -66,6 +66,14 @@ extern uint8_t pat_type_2_pte_flags(uint8_t pat_type);
 extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
 
+struct mtrr_pausing_state {
+	bool pge;
+	uint64_t def_type;
+};
+
+extern struct mtrr_pausing_state mtrr_pause_caching(void);
+extern void mtrr_resume_caching(struct mtrr_pausing_state state);
+
 extern bool mtrr_var_range_msr_set(struct domain *d, struct mtrr_state *m,
                                    uint32_t msr, uint64_t msr_content);
 extern bool mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
-- 
2.49.0


