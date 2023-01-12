Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6D6678F8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 16:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476283.738380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzOb-0005HA-OO; Thu, 12 Jan 2023 15:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476283.738380; Thu, 12 Jan 2023 15:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzOb-0005E2-KY; Thu, 12 Jan 2023 15:21:37 +0000
Received: by outflank-mailman (input) for mailman id 476283;
 Thu, 12 Jan 2023 15:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFzOa-0005Dv-4b
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 15:21:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccad159d-928c-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 16:21:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D54D40269;
 Thu, 12 Jan 2023 15:21:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E045513776;
 Thu, 12 Jan 2023 15:21:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1KxjNX0lwGM6IwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 12 Jan 2023 15:21:33 +0000
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
X-Inumbo-ID: ccad159d-928c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673536894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2n0IdQPvR+Gxy3g7DvPKITwTHiT/5QBMjcXvwvG5gq8=;
	b=aBmyfXqLewedueE1l8HgnS8oOWeLEQsBebQ3+JmtzpZzl9WKiSECnoSe2djtAFYUFg2yN/
	acxUR6stqti7Qe76GIxbS5WMojGnRTf19LbpN8XK+a9njRm4QPpWpJ8Z+aGoVqnwra2MEk
	bbQFMgCf9WV/aQ3RDAqPmCnv9Vf1osI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/paravirt: merge activate_mm and dup_mmap callbacks
Date: Thu, 12 Jan 2023 16:21:32 +0100
Message-Id: <20230112152132.4399-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two paravirt callbacks .mmu.activate_mm and .mmu.dup_mmap are
sharing the same implementations in all cases: for Xen PV guests they
are pinning the PGD of the new mm_struct, and for all other cases
they are a NOP.

So merge them to a common callback .mmu.enter_mmap (in contrast to the
corresponding already existing .mmu.exit_mmap).

As the first parameter of the old callbacks isn't used, drop it from
the replacement one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/mmu_context.h    |  4 ++--
 arch/x86/include/asm/paravirt.h       | 14 +++-----------
 arch/x86/include/asm/paravirt_types.h |  7 ++-----
 arch/x86/kernel/paravirt.c            |  3 +--
 arch/x86/xen/mmu_pv.c                 | 12 ++----------
 5 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index b8d40ddeab00..6a14b6c2165c 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -134,7 +134,7 @@ extern void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 
 #define activate_mm(prev, next)			\
 do {						\
-	paravirt_activate_mm((prev), (next));	\
+	paravirt_enter_mmap(next);		\
 	switch_mm((prev), (next), NULL);	\
 } while (0);
 
@@ -167,7 +167,7 @@ static inline void arch_dup_pkeys(struct mm_struct *oldmm,
 static inline int arch_dup_mmap(struct mm_struct *oldmm, struct mm_struct *mm)
 {
 	arch_dup_pkeys(oldmm, mm);
-	paravirt_arch_dup_mmap(oldmm, mm);
+	paravirt_enter_mmap(mm);
 	return ldt_dup_context(oldmm, mm);
 }
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 73e9522db7c1..07bbdceaf35a 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -332,16 +332,9 @@ static inline void tss_update_io_bitmap(void)
 }
 #endif
 
-static inline void paravirt_activate_mm(struct mm_struct *prev,
-					struct mm_struct *next)
+static inline void paravirt_enter_mmap(struct mm_struct *next)
 {
-	PVOP_VCALL2(mmu.activate_mm, prev, next);
-}
-
-static inline void paravirt_arch_dup_mmap(struct mm_struct *oldmm,
-					  struct mm_struct *mm)
-{
-	PVOP_VCALL2(mmu.dup_mmap, oldmm, mm);
+	PVOP_VCALL1(mmu.enter_mmap, next);
 }
 
 static inline int paravirt_pgd_alloc(struct mm_struct *mm)
@@ -787,8 +780,7 @@ extern void default_banner(void);
 
 #ifndef __ASSEMBLY__
 #ifndef CONFIG_PARAVIRT_XXL
-static inline void paravirt_arch_dup_mmap(struct mm_struct *oldmm,
-					  struct mm_struct *mm)
+static inline void paravirt_enter_mmap(struct mm_struct *mm)
 {
 }
 #endif
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 8c1da419260f..71bf64b963df 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -164,11 +164,8 @@ struct pv_mmu_ops {
 	unsigned long (*read_cr3)(void);
 	void (*write_cr3)(unsigned long);
 
-	/* Hooks for intercepting the creation/use of an mm_struct. */
-	void (*activate_mm)(struct mm_struct *prev,
-			    struct mm_struct *next);
-	void (*dup_mmap)(struct mm_struct *oldmm,
-			 struct mm_struct *mm);
+	/* Hook for intercepting the creation/use of an mm_struct. */
+	void (*enter_mmap)(struct mm_struct *mm);
 
 	/* Hooks for allocating and freeing a pagetable top-level */
 	int  (*pgd_alloc)(struct mm_struct *mm);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 327757afb027..ff1109b9c6cd 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -352,8 +352,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.make_pte		= PTE_IDENT,
 	.mmu.make_pgd		= PTE_IDENT,
 
-	.mmu.dup_mmap		= paravirt_nop,
-	.mmu.activate_mm	= paravirt_nop,
+	.mmu.enter_mmap		= paravirt_nop,
 
 	.mmu.lazy_mode = {
 		.enter		= paravirt_nop,
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index ee29fb558f2e..b3b8d289b9ab 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -885,14 +885,7 @@ void xen_mm_unpin_all(void)
 	spin_unlock(&pgd_lock);
 }
 
-static void xen_activate_mm(struct mm_struct *prev, struct mm_struct *next)
-{
-	spin_lock(&next->page_table_lock);
-	xen_pgd_pin(next);
-	spin_unlock(&next->page_table_lock);
-}
-
-static void xen_dup_mmap(struct mm_struct *oldmm, struct mm_struct *mm)
+static void xen_enter_mmap(struct mm_struct *mm)
 {
 	spin_lock(&mm->page_table_lock);
 	xen_pgd_pin(mm);
@@ -2153,8 +2146,7 @@ static const typeof(pv_ops) xen_mmu_ops __initconst = {
 		.make_p4d = PV_CALLEE_SAVE(xen_make_p4d),
 #endif
 
-		.activate_mm = xen_activate_mm,
-		.dup_mmap = xen_dup_mmap,
+		.enter_mmap = xen_enter_mmap,
 		.exit_mmap = xen_exit_mmap,
 
 		.lazy_mode = {
-- 
2.35.3


