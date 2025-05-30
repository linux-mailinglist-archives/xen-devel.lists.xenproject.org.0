Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E3AC8FB4
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000939.1381178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdN-0001ps-5A; Fri, 30 May 2025 13:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000939.1381178; Fri, 30 May 2025 13:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdN-0001nr-1K; Fri, 30 May 2025 13:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1000939;
 Fri, 30 May 2025 13:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdL-0008Jy-RY
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:51 +0000
Received: from 17.mo561.mail-out.ovh.net (17.mo561.mail-out.ovh.net
 [87.98.178.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0779712-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:18:50 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.25.252])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4b83j623d7z1TGn
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:50 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-kbk5q (unknown [10.110.164.164])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8FAE58498F;
 Fri, 30 May 2025 13:18:49 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-5b5ff79f4f-kbk5q with ESMTPSA
 id Gn6JDjmwOWg+tAAARlXHSA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:49 +0000
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
X-Inumbo-ID: a0779712-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-96R001935d236c-c23a-46fa-83b9-c100e535bc6e,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 07/22] x86/mtrr: expose functions for pausing caching
Date: Fri, 30 May 2025 16:17:49 +0300
Message-ID: <8d6e871f055c2456ab194e49bd470eafd04e454e.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12698462102722688156
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=p5/X8odYi3YN7N37QJCMftuc5hqSiV9vDM1ybqq3iiI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611130; v=1;
 b=Aiqs0UheTfDL8AWg3gjFuTcW2oP2wzTA8ZmsvhoLDGbS1fV9zG+lGtq6QSzMu1DqiYV/1dh6
 xwdDJJJ01w+6RDY+TPEb7KxNczTJvKigPVqC5Jnvoo6SWzN31hY8pYux59K1BMRjpQKImuGQhNK
 4LxoTe+3dTFlwhrgjBCwRqgxb+X2gnCj/k2cXWD2t3P8HuE/IE+0G8SKuQRo3DIBZYMmY3BheuB
 2wjeGk88cIRKdXiyQuGuQf5+THQBQx44Hjb30r7feVHX4lSl18WybfveM6RuqDFjcoYSoZlubDf
 UesS9HFaE2w+CdB4T/LIC+lzP8JCcaVlFFOkvXmARcu6A==

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


