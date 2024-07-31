Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7F3942F83
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768593.1179466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8wX-0003kj-OK; Wed, 31 Jul 2024 13:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768593.1179466; Wed, 31 Jul 2024 13:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8wX-0003is-KW; Wed, 31 Jul 2024 13:00:37 +0000
Received: by outflank-mailman (input) for mailman id 768593;
 Wed, 31 Jul 2024 13:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q60C=O7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZ8wW-0003KO-NH
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:00:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00e31cd-4f3c-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:00:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BCA621B69;
 Wed, 31 Jul 2024 13:00:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49EB613297;
 Wed, 31 Jul 2024 13:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id z9SVEHI1qmbmWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jul 2024 13:00:34 +0000
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
X-Inumbo-ID: e00e31cd-4f3c-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722430834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFjXc7amrrMo+tzrt8XBmjjdTdsuxev2jTdhps3xh1w=;
	b=jB3dnJKbZKbnGEvuYJzIOGjksnvbL5bH40lwZN2/ZQcufdeCpsN7YPb4tsxDnyegrdMRef
	HiOyHmpSphiqH0wzgBTkc2niE3d4Bo9LgtVCiyRnSAq7EOqprBSLFIirzBUKLd6ugYesIY
	aoyM65PcQUam0CyzxIAEJr3iutjkdLI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722430834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFjXc7amrrMo+tzrt8XBmjjdTdsuxev2jTdhps3xh1w=;
	b=jB3dnJKbZKbnGEvuYJzIOGjksnvbL5bH40lwZN2/ZQcufdeCpsN7YPb4tsxDnyegrdMRef
	HiOyHmpSphiqH0wzgBTkc2niE3d4Bo9LgtVCiyRnSAq7EOqprBSLFIirzBUKLd6ugYesIY
	aoyM65PcQUam0CyzxIAEJr3iutjkdLI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] mini-os: mm: introduce generic page table walk function
Date: Wed, 31 Jul 2024 15:00:24 +0200
Message-ID: <20240731130026.8467-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731130026.8467-1-jgross@suse.com>
References: <20240731130026.8467-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

In x86 mm code there are multiple instances of page table walks for
different purposes.

Introduce a generic page table walker being able to cover the current
use cases. It will be used for other cases in future, too.

The page table walker needs some per-level data, so add a table for
that data. Merge it with the already existing pt_prot[] array.

Rewrite get_pgt() to use the new walker.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c | 152 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 113 insertions(+), 39 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 7ddf16e4..cc4d41e9 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -125,20 +125,25 @@ void arch_mm_preinit(void *p)
 }
 #endif
 
+static const struct {
+    unsigned int shift;
+    unsigned int entries;
+    pgentry_t prot;
+} ptdata[PAGETABLE_LEVELS + 1] = {
+    { 0, 0, 0 },
+    { L1_PAGETABLE_SHIFT, L1_PAGETABLE_ENTRIES, L1_PROT },
+    { L2_PAGETABLE_SHIFT, L2_PAGETABLE_ENTRIES, L2_PROT },
+    { L3_PAGETABLE_SHIFT, L3_PAGETABLE_ENTRIES, L3_PROT },
+#if defined(__x86_64__)
+    { L4_PAGETABLE_SHIFT, L4_PAGETABLE_ENTRIES, L4_PROT },
+#endif
+};
+
 /*
  * Make pt_pfn a new 'level' page table frame and hook it into the page
  * table at offset in previous level MFN (pref_l_mfn). pt_pfn is a guest
  * PFN.
  */
-static pgentry_t pt_prot[PAGETABLE_LEVELS] = {
-    L1_PROT,
-    L2_PROT,
-    L3_PROT,
-#if defined(__x86_64__)
-    L4_PROT,
-#endif
-};
-
 static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn, 
                          unsigned long offset, unsigned long level)
 {   
@@ -170,7 +175,7 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
     mmu_updates[0].ptr = (tab[l2_table_offset(pt_page)] & PAGE_MASK) + 
         sizeof(pgentry_t) * l1_table_offset(pt_page);
     mmu_updates[0].val = (pgentry_t)pfn_to_mfn(*pt_pfn) << PAGE_SHIFT | 
-        (pt_prot[level - 1] & ~_PAGE_RW);
+        (ptdata[level].prot & ~_PAGE_RW);
     
     if ( (rc = HYPERVISOR_mmu_update(mmu_updates, 1, NULL, DOMID_SELF)) < 0 )
     {
@@ -183,7 +188,7 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
     mmu_updates[0].ptr =
         ((pgentry_t)prev_l_mfn << PAGE_SHIFT) + sizeof(pgentry_t) * offset;
     mmu_updates[0].val = (pgentry_t)pfn_to_mfn(*pt_pfn) << PAGE_SHIFT |
-        pt_prot[level];
+        ptdata[level + 1].prot;
 
     if ( (rc = HYPERVISOR_mmu_update(mmu_updates, 1, NULL, DOMID_SELF)) < 0 ) 
     {
@@ -192,7 +197,7 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
     }
 #else
     tab = mfn_to_virt(prev_l_mfn);
-    tab[offset] = (*pt_pfn << PAGE_SHIFT) | pt_prot[level];
+    tab[offset] = (*pt_pfn << PAGE_SHIFT) | ptdata[level + 1].prot;
 #endif
 
     *pt_pfn += 1;
@@ -202,6 +207,82 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
 static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
 #endif
 
+/*
+ * Walk recursively through all PTEs calling a specified function. The function
+ * is allowed to change the PTE, the walker will follow the new value.
+ * The walk will cover the virtual address range [from_va .. to_va].
+ * The supplied function will be called with the following parameters:
+ * va: base virtual address of the area covered by the current PTE
+ * lvl: page table level of the PTE (1 = lowest level, PAGETABLE_LEVELS =
+ *      PTE in page table addressed by %cr3)
+ * is_leaf: true if PTE doesn't address another page table
+ * pte: address of the PTE
+ * par: parameter, passed to walk_pt() by caller
+ * Return value of func() being non-zero will terminate walk_pt(), walk_pt()
+ * will return that value in this case, zero else.
+ */
+static int walk_pt(unsigned long from_va, unsigned long to_va,
+                   int (func)(unsigned long va, unsigned int lvl,
+                              bool is_leaf, pgentry_t *pte, void *par),
+                   void *par)
+{
+    unsigned int lvl = PAGETABLE_LEVELS;
+    unsigned int ptindex[PAGETABLE_LEVELS + 1];
+    unsigned long va = round_pgdown(from_va);
+    unsigned long va_lvl;
+    pgentry_t *tab[PAGETABLE_LEVELS + 1];
+    pgentry_t *pte;
+    bool is_leaf;
+    int ret;
+
+    /* Start at top level page table. */
+    tab[lvl] = pt_base;
+    ptindex[lvl] = (va >> ptdata[lvl].shift) & (ptdata[lvl].entries - 1);
+
+    while ( va < (to_va | (PAGE_SIZE - 1)) )
+    {
+        pte = tab[lvl] + ptindex[lvl];
+        is_leaf = (lvl == L1_FRAME) || (*pte & _PAGE_PSE) ||
+                  !(*pte & _PAGE_PRESENT);
+        va_lvl = va & ~((1UL << ptdata[lvl].shift) - 1);
+        ret = func(va_lvl, lvl, is_leaf, pte, par);
+        if ( ret )
+            return ret;
+
+        /* PTE might have been modified by func(), reevaluate leaf state. */
+        is_leaf = (lvl == L1_FRAME) || (*pte & _PAGE_PSE) ||
+                  !(*pte & _PAGE_PRESENT);
+
+        if ( is_leaf )
+        {
+            /* Reached a leaf PTE. Advance to next page. */
+            va += 1UL << ptdata[lvl].shift;
+            ptindex[lvl]++;
+
+            /* Check for the need to traverse up again. */
+            while ( ptindex[lvl] == ptdata[lvl].entries )
+            {
+                /* End of virtual address space? */
+                if ( lvl == PAGETABLE_LEVELS )
+                    return 0;
+                /* Reached end of current page table, one level up. */
+                lvl++;
+                ptindex[lvl]++;
+            }
+        }
+        else
+        {
+            /* Not a leaf, walk one level down. */
+            lvl--;
+            tab[lvl] = mfn_to_virt(pte_to_mfn(*pte));
+            ptindex[lvl] = (va >> ptdata[lvl].shift) &
+                           (ptdata[lvl].entries - 1);
+        }
+    }
+
+    return 0;
+}
+
 /*
  * Build the initial pagetable.
  */
@@ -407,36 +488,29 @@ static void set_readonly(void *text, void *etext)
 /*
  * get the PTE for virtual address va if it exists. Otherwise NULL.
  */
-static pgentry_t *get_pgt(unsigned long va)
+static int get_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
+                        pgentry_t *pte, void *par)
 {
-    unsigned long mfn;
-    pgentry_t *tab;
-    unsigned offset;
+    pgentry_t **result;
 
-    tab = pt_base;
-    mfn = virt_to_mfn(pt_base);
+    if ( !(*pte & _PAGE_PRESENT) && lvl > L1_FRAME )
+        return -1;
 
-#if defined(__x86_64__)
-    offset = l4_table_offset(va);
-    if ( !(tab[offset] & _PAGE_PRESENT) )
-        return NULL;
-    mfn = pte_to_mfn(tab[offset]);
-    tab = mfn_to_virt(mfn);
-#endif
-    offset = l3_table_offset(va);
-    if ( !(tab[offset] & _PAGE_PRESENT) )
-        return NULL;
-    mfn = pte_to_mfn(tab[offset]);
-    tab = mfn_to_virt(mfn);
-    offset = l2_table_offset(va);
-    if ( !(tab[offset] & _PAGE_PRESENT) )
-        return NULL;
-    if ( tab[offset] & _PAGE_PSE )
-        return &tab[offset];
-    mfn = pte_to_mfn(tab[offset]);
-    tab = mfn_to_virt(mfn);
-    offset = l1_table_offset(va);
-    return &tab[offset];
+    if ( lvl > L1_FRAME && !(*pte & _PAGE_PSE) )
+        return 0;
+
+    result = par;
+    *result = pte;
+
+    return 0;
+}
+
+static pgentry_t *get_pgt(unsigned long va)
+{
+    pgentry_t *tab = NULL;
+
+    walk_pt(va, va, get_pgt_func, &tab);
+    return tab;
 }
 
 
-- 
2.43.0


