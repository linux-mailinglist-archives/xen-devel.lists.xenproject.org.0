Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C877AB5ADA
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983343.1369728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtAt-0007Lr-Ba; Tue, 13 May 2025 17:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983343.1369728; Tue, 13 May 2025 17:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtAt-0007JP-3h; Tue, 13 May 2025 17:12:15 +0000
Received: by outflank-mailman (input) for mailman id 983343;
 Tue, 13 May 2025 17:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5X-0003Mm-LE
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:43 +0000
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net
 [46.105.60.248]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a490bcf8-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:06:42 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.140.207])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjYt3ypbz1F88
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:42 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mdgms (unknown [10.110.164.115])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 07C2E1FD39;
 Tue, 13 May 2025 17:06:41 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-mdgms with ESMTPSA
 id JVrPMyF8I2ikSwEARrC/kw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:41 +0000
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
X-Inumbo-ID: a490bcf8-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-114S0082d89efb0-7dca-433b-9db6-efa760fdab17,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 07/22] x86/mtrr: expose functions for pausing caching
Date: Tue, 13 May 2025 20:05:44 +0300
Message-ID: <e67b2d4c04549b20871be759f4ccaf29d2f46d37.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8944711813313967260
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddugeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=p5/X8odYi3YN7N37QJCMftuc5hqSiV9vDM1ybqq3iiI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156002; v=1;
 b=hGHensDJA5nIUwOWVrg1VRKg9jr4cvOCYo5VjuKrGN6AbVFlRNHhkNOCFVPK/XTOonZ1uPZw
 1Gy9IgTSIK9REdsVXBm+mwzxcZHM1QG+pkrgWozYCrVueAcCT/WST6u7gyWyqZY3Ge5e4wUv4ts
 Tc1wmPYeKYNbG2/D8w2rmISFfW1Hj/FM41MrPp6wwkULLg3sxzTj/0yhcWLrEOKi/pFCTbAMGTY
 tJnxdMnr50bxsY+/J2AGNSfr/ZaxQy/YGixIBZ233hy58iaG+lvXIMRbMsUhr+1O1KyL659V+po
 0CQL3/X7p60mEcu223kHJvL/vOgrzHIsmEW2Wk9S01uPg==

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


