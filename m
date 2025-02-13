Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C319CA33A56
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887232.1296782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiV0m-0000QZ-PT; Thu, 13 Feb 2025 08:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887232.1296782; Thu, 13 Feb 2025 08:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiV0m-0000Nd-Jd; Thu, 13 Feb 2025 08:55:56 +0000
Received: by outflank-mailman (input) for mailman id 887232;
 Thu, 13 Feb 2025 08:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YDip=VE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiV0k-0008Vs-Lu
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:55:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54634b49-e9e8-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 09:55:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D522229A7;
 Thu, 13 Feb 2025 08:55:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49F83137DB;
 Thu, 13 Feb 2025 08:55:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M4uOEJizrWcTdgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Feb 2025 08:55:52 +0000
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
X-Inumbo-ID: 54634b49-e9e8-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739436952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIJbT7p+RWBm8N1M1rf2T5LjDA7WDiFc9SjxPhO+fQ0=;
	b=iAFR59lbL84z0ot4Z/yIZP3ZboFOospn171yHp7M1F2cUBYOPkUaVKKceH4Ihxo77o4UbP
	WeHu04klIY8m25kkbE75/5C9NPY7I0z1cFzE2HtM5zQ4IMowd0yl+nArOAbsvwLy7L0Rvj
	/mlyH84br7HmAF/poky0Y9fAsR8cKec=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iAFR59lb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739436952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIJbT7p+RWBm8N1M1rf2T5LjDA7WDiFc9SjxPhO+fQ0=;
	b=iAFR59lbL84z0ot4Z/yIZP3ZboFOospn171yHp7M1F2cUBYOPkUaVKKceH4Ihxo77o4UbP
	WeHu04klIY8m25kkbE75/5C9NPY7I0z1cFzE2HtM5zQ4IMowd0yl+nArOAbsvwLy7L0Rvj
	/mlyH84br7HmAF/poky0Y9fAsR8cKec=
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
	xen-devel@lists.xenproject.org,
	Alan Robinson <Alan.Robinson@fujitsu.com>
Subject: [PATCH v2 2/2] x86/xen: allow larger contiguous memory regions in PV guests
Date: Thu, 13 Feb 2025 09:55:38 +0100
Message-ID: <20250213085538.17060-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213085538.17060-1-jgross@suse.com>
References: <20250213085538.17060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9D522229A7
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Today a PV guest (including dom0) can create 2MB contiguous memory
regions for DMA buffers at max. This has led to problems at least
with the megaraid_sas driver, which wants to allocate a 2.3MB DMA
buffer.

The limiting factor is the frame array used to do the hypercall for
making the memory contiguous, which has 512 entries and is just a
static array in mmu_pv.c.

In order to not waste memory for non-PV guests, put the initial
frame array into .init.data section and dynamically allocate an array
from the .init_after_bootmem hook of PV guests.

In case a contiguous memory area larger than the initially supported
2MB is requested, allocate a larger buffer for the frame list. Note
that such an allocation is tried only after memory management has been
initialized properly, which is tested via a flag being set in the
.init_after_bootmem hook.

Fixes: 9f40ec84a797 ("xen/swiotlb: add alignment check for dma buffers")
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Alan Robinson <Alan.Robinson@fujitsu.com>
---
Note that the "Fixes:" tag is not really correct, as that patch didn't
introduce the problem, but rather made it visible. OTOH it is the best
indicator we have to identify kernel versions this patch should be
backported to.
---
 arch/x86/xen/mmu_pv.c | 71 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2c70cd35e72c..d078de2c952b 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -111,6 +111,51 @@ static pud_t level3_user_vsyscall[PTRS_PER_PUD] __page_aligned_bss;
  */
 static DEFINE_SPINLOCK(xen_reservation_lock);
 
+/* Protected by xen_reservation_lock. */
+#define MIN_CONTIG_ORDER 9 /* 2MB */
+static unsigned int discontig_frames_order = MIN_CONTIG_ORDER;
+static unsigned long discontig_frames_early[1UL << MIN_CONTIG_ORDER] __initdata;
+static unsigned long *discontig_frames __refdata = discontig_frames_early;
+static bool discontig_frames_dyn;
+
+static int alloc_discontig_frames(unsigned int order)
+{
+	unsigned long *new_array, *old_array;
+	unsigned int old_order;
+	unsigned long flags;
+
+	BUG_ON(order < MIN_CONTIG_ORDER);
+	BUILD_BUG_ON(sizeof(discontig_frames_early) != PAGE_SIZE);
+
+	new_array = (unsigned long *)__get_free_pages(GFP_KERNEL,
+						      order - MIN_CONTIG_ORDER);
+	if (!new_array)
+		return -ENOMEM;
+
+	spin_lock_irqsave(&xen_reservation_lock, flags);
+
+	old_order = discontig_frames_order;
+
+	if (order > discontig_frames_order || !discontig_frames_dyn) {
+		if (!discontig_frames_dyn)
+			old_array = NULL;
+		else
+			old_array = discontig_frames;
+
+		discontig_frames = new_array;
+		discontig_frames_order = order;
+		discontig_frames_dyn = true;
+	} else {
+		old_array = new_array;
+	}
+
+	spin_unlock_irqrestore(&xen_reservation_lock, flags);
+
+	free_pages((unsigned long)old_array, old_order - MIN_CONTIG_ORDER);
+
+	return 0;
+}
+
 /*
  * Note about cr3 (pagetable base) values:
  *
@@ -814,6 +859,9 @@ static void __init xen_after_bootmem(void)
 	SetPagePinned(virt_to_page(level3_user_vsyscall));
 #endif
 	xen_pgd_walk(&init_mm, xen_mark_pinned, FIXADDR_TOP);
+
+	if (alloc_discontig_frames(MIN_CONTIG_ORDER))
+		BUG();
 }
 
 static void xen_unpin_page(struct mm_struct *mm, struct page *page,
@@ -2203,10 +2251,6 @@ void __init xen_init_mmu_ops(void)
 	memset(dummy_mapping, 0xff, PAGE_SIZE);
 }
 
-/* Protected by xen_reservation_lock. */
-#define MAX_CONTIG_ORDER 9 /* 2MB */
-static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
-
 #define VOID_PTE (mfn_pte(0, __pgprot(0)))
 static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
 				unsigned long *in_frames,
@@ -2323,18 +2367,25 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				 unsigned int address_bits,
 				 dma_addr_t *dma_handle)
 {
-	unsigned long *in_frames = discontig_frames, out_frame;
+	unsigned long *in_frames, out_frame;
 	unsigned long  flags;
 	int            success;
 	unsigned long vstart = (unsigned long)phys_to_virt(pstart);
 
-	if (unlikely(order > MAX_CONTIG_ORDER))
-		return -ENOMEM;
+	if (unlikely(order > discontig_frames_order)) {
+		if (!discontig_frames_dyn)
+			return -ENOMEM;
+
+		if (alloc_discontig_frames(order))
+			return -ENOMEM;
+	}
 
 	memset((void *) vstart, 0, PAGE_SIZE << order);
 
 	spin_lock_irqsave(&xen_reservation_lock, flags);
 
+	in_frames = discontig_frames;
+
 	/* 1. Zap current PTEs, remembering MFNs. */
 	xen_zap_pfn_range(vstart, order, in_frames, NULL);
 
@@ -2358,12 +2409,12 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 
 void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 {
-	unsigned long *out_frames = discontig_frames, in_frame;
+	unsigned long *out_frames, in_frame;
 	unsigned long  flags;
 	int success;
 	unsigned long vstart;
 
-	if (unlikely(order > MAX_CONTIG_ORDER))
+	if (unlikely(order > discontig_frames_order))
 		return;
 
 	vstart = (unsigned long)phys_to_virt(pstart);
@@ -2371,6 +2422,8 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 
 	spin_lock_irqsave(&xen_reservation_lock, flags);
 
+	out_frames = discontig_frames;
+
 	/* 1. Find start MFN of contiguous extent. */
 	in_frame = virt_to_mfn((void *)vstart);
 
-- 
2.43.0


