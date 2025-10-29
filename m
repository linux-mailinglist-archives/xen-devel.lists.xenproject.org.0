Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00349C19A1E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 11:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152673.1483234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE3E8-0006NH-91; Wed, 29 Oct 2025 10:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152673.1483234; Wed, 29 Oct 2025 10:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE3E8-0006LX-4D; Wed, 29 Oct 2025 10:16:24 +0000
Received: by outflank-mailman (input) for mailman id 1152673;
 Wed, 29 Oct 2025 10:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCkK=5G=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vE38M-0000Up-89
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 10:10:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7ba1c811-b4af-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 11:10:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F8AF2BF2;
 Wed, 29 Oct 2025 03:10:15 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B05B3F66E;
 Wed, 29 Oct 2025 03:10:17 -0700 (PDT)
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
X-Inumbo-ID: 7ba1c811-b4af-11f0-980a-7dc792cee155
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
Date: Wed, 29 Oct 2025 10:09:03 +0000
Message-ID: <20251029100909.3381140-7-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The implementation of the lazy MMU mode is currently entirely
arch-specific; core code directly calls arch helpers:
arch_{enter,leave}_lazy_mmu_mode().

We are about to introduce support for nested lazy MMU sections.
As things stand we'd have to duplicate that logic in every arch
implementing lazy_mmu - adding to a fair amount of logic
already duplicated across lazy_mmu implementations.

This patch therefore introduces a new generic layer that calls the
existing arch_* helpers. Two pair of calls are introduced:

* lazy_mmu_mode_enable() ... lazy_mmu_mode_disable()
    This is the standard case where the mode is enabled for a given
    block of code by surrounding it with enable() and disable()
    calls.

* lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
    This is for situations where the mode is temporarily disabled
    by first calling pause() and then resume() (e.g. to prevent any
    batching from occurring in a critical section).

The documentation in <linux/pgtable.h> will be updated in a
subsequent patch.

No functional change should be introduced at this stage.
The implementation of enable()/resume() and disable()/pause() is
currently identical, but nesting support will change that.

Most of the call sites have been updated using the following
Coccinelle script:

@@
@@
{
...
- arch_enter_lazy_mmu_mode();
+ lazy_mmu_mode_enable();
...
- arch_leave_lazy_mmu_mode();
+ lazy_mmu_mode_disable();
...
}

@@
@@
{
...
- arch_leave_lazy_mmu_mode();
+ lazy_mmu_mode_pause();
...
- arch_enter_lazy_mmu_mode();
+ lazy_mmu_mode_resume();
...
}

A couple of notes regarding x86:

* Xen is currently the only case where explicit handling is required
  for lazy MMU when context-switching. This is purely an
  implementation detail and using the generic lazy_mmu_mode_*
  functions would cause trouble when nesting support is introduced,
  because the generic functions must be called from the current task.
  For that reason we still use arch_leave() and arch_enter() there.

* x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
  places, but only defines it if PARAVIRT_XXL is selected, and we
  are removing the fallback in <linux/pgtable.h>. Add a new fallback
  definition to <asm/pgtable.h> to keep things building.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/mm/mmu.c                     |  4 ++--
 arch/arm64/mm/pageattr.c                |  4 ++--
 arch/powerpc/mm/book3s64/hash_tlb.c     |  8 +++----
 arch/powerpc/mm/book3s64/subpage_prot.c |  4 ++--
 arch/x86/include/asm/pgtable.h          |  3 ++-
 fs/proc/task_mmu.c                      |  4 ++--
 include/linux/pgtable.h                 | 29 +++++++++++++++++++++----
 mm/kasan/shadow.c                       |  8 +++----
 mm/madvise.c                            | 18 +++++++--------
 mm/memory.c                             | 16 +++++++-------
 mm/migrate_device.c                     |  4 ++--
 mm/mprotect.c                           |  4 ++--
 mm/mremap.c                             |  4 ++--
 mm/userfaultfd.c                        |  4 ++--
 mm/vmalloc.c                            | 12 +++++-----
 mm/vmscan.c                             | 12 +++++-----
 16 files changed, 80 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b8d37eb037fc..d9c8e94f140f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -731,7 +731,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 		return -EINVAL;
 
 	mutex_lock(&pgtable_split_lock);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	/*
 	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
@@ -753,7 +753,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
 			ret = split_kernel_leaf_mapping_locked(end);
 	}
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	mutex_unlock(&pgtable_split_lock);
 	return ret;
 }
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 5135f2d66958..e4059f13c4ed 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -110,7 +110,7 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	if (WARN_ON_ONCE(ret))
 		return ret;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	/*
 	 * The caller must ensure that the range we are operating on does not
@@ -119,7 +119,7 @@ static int update_range_prot(unsigned long start, unsigned long size,
 	 */
 	ret = walk_kernel_page_table_range_lockless(start, start + size,
 						    &pageattr_ops, NULL, &data);
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 
 	return ret;
 }
diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index 21fcad97ae80..787f7a0e27f0 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -205,7 +205,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
 	 * way to do things but is fine for our needs here.
 	 */
 	local_irq_save(flags);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	for (; start < end; start += PAGE_SIZE) {
 		pte_t *ptep = find_init_mm_pte(start, &hugepage_shift);
 		unsigned long pte;
@@ -217,7 +217,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
 			continue;
 		hpte_need_flush(&init_mm, start, ptep, pte, hugepage_shift);
 	}
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	local_irq_restore(flags);
 }
 
@@ -237,7 +237,7 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
 	 * way to do things but is fine for our needs here.
 	 */
 	local_irq_save(flags);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	start_pte = pte_offset_map(pmd, addr);
 	if (!start_pte)
 		goto out;
@@ -249,6 +249,6 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
 	}
 	pte_unmap(start_pte);
 out:
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	local_irq_restore(flags);
 }
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index ec98e526167e..07c47673bba2 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -73,13 +73,13 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	for (; npages > 0; --npages) {
 		pte_update(mm, addr, pte, 0, 0, 0);
 		addr += PAGE_SIZE;
 		++pte;
 	}
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(pte - 1, ptl);
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index e33df3da6980..14fd672bc9b2 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -117,7 +117,8 @@ extern pmdval_t early_pmd_flags;
 #define pte_val(x)	native_pte_val(x)
 #define __pte(x)	native_make_pte(x)
 
-#define arch_end_context_switch(prev)	do {} while(0)
+#define arch_end_context_switch(prev)	do {} while (0)
+#define arch_flush_lazy_mmu_mode()	do {} while (0)
 #endif	/* CONFIG_PARAVIRT_XXL */
 
 static inline pmd_t pmd_set_flags(pmd_t pmd, pmdval_t set)
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index fc35a0543f01..d16ba1d32169 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2703,7 +2703,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 		return 0;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
 		/* Fast path for performing exclusive WP */
@@ -2773,7 +2773,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	if (flush_end)
 		flush_tlb_range(vma, start, addr);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(start_pte, ptl);
 
 	cond_resched();
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 9894366e768b..b5fdf32c437f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -231,10 +231,31 @@ static inline int pmd_dirty(pmd_t pmd)
  * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
  * and the mode cannot be used in interrupt context.
  */
-#ifndef CONFIG_ARCH_HAS_LAZY_MMU_MODE
-static inline void arch_enter_lazy_mmu_mode(void) {}
-static inline void arch_leave_lazy_mmu_mode(void) {}
-static inline void arch_flush_lazy_mmu_mode(void) {}
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+static inline void lazy_mmu_mode_enable(void)
+{
+	arch_enter_lazy_mmu_mode();
+}
+
+static inline void lazy_mmu_mode_disable(void)
+{
+	arch_leave_lazy_mmu_mode();
+}
+
+static inline void lazy_mmu_mode_pause(void)
+{
+	arch_leave_lazy_mmu_mode();
+}
+
+static inline void lazy_mmu_mode_resume(void)
+{
+	arch_enter_lazy_mmu_mode();
+}
+#else
+static inline void lazy_mmu_mode_enable(void) {}
+static inline void lazy_mmu_mode_disable(void) {}
+static inline void lazy_mmu_mode_pause(void) {}
+static inline void lazy_mmu_mode_resume(void) {}
 #endif
 
 #ifndef pte_batch_hint
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 5d2a876035d6..c49b029d3593 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	pte_t pte;
 	int index;
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_pause();
 
 	index = PFN_DOWN(addr - data->start);
 	page = data->pages[index];
@@ -319,7 +319,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	}
 	spin_unlock(&init_mm.page_table_lock);
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_resume();
 
 	return 0;
 }
@@ -482,7 +482,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	pte_t pte;
 	int none;
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_pause();
 
 	spin_lock(&init_mm.page_table_lock);
 	pte = ptep_get(ptep);
@@ -494,7 +494,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(!none))
 		__free_page(pfn_to_page(pte_pfn(pte)));
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_resume();
 
 	return 0;
 }
diff --git a/mm/madvise.c b/mm/madvise.c
index fb1c86e630b6..536026772160 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -455,7 +455,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 	if (!start_pte)
 		return 0;
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
 		nr = 1;
 		ptent = ptep_get(pte);
@@ -463,7 +463,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		if (++batch_count == SWAP_CLUSTER_MAX) {
 			batch_count = 0;
 			if (need_resched()) {
-				arch_leave_lazy_mmu_mode();
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(start_pte, ptl);
 				cond_resched();
 				goto restart;
@@ -499,7 +499,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				if (!folio_trylock(folio))
 					continue;
 				folio_get(folio);
-				arch_leave_lazy_mmu_mode();
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(start_pte, ptl);
 				start_pte = NULL;
 				err = split_folio(folio);
@@ -510,7 +510,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 				if (!start_pte)
 					break;
 				flush_tlb_batched_pending(mm);
-				arch_enter_lazy_mmu_mode();
+				lazy_mmu_mode_enable();
 				if (!err)
 					nr = 0;
 				continue;
@@ -558,7 +558,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 	}
 
 	if (start_pte) {
-		arch_leave_lazy_mmu_mode();
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
 	}
 	if (pageout)
@@ -677,7 +677,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!start_pte)
 		return 0;
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	for (; addr != end; pte += nr, addr += PAGE_SIZE * nr) {
 		nr = 1;
 		ptent = ptep_get(pte);
@@ -727,7 +727,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				if (!folio_trylock(folio))
 					continue;
 				folio_get(folio);
-				arch_leave_lazy_mmu_mode();
+				lazy_mmu_mode_disable();
 				pte_unmap_unlock(start_pte, ptl);
 				start_pte = NULL;
 				err = split_folio(folio);
@@ -738,7 +738,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				if (!start_pte)
 					break;
 				flush_tlb_batched_pending(mm);
-				arch_enter_lazy_mmu_mode();
+				lazy_mmu_mode_enable();
 				if (!err)
 					nr = 0;
 				continue;
@@ -778,7 +778,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	if (nr_swap)
 		add_mm_counter(mm, MM_SWAPENTS, nr_swap);
 	if (start_pte) {
-		arch_leave_lazy_mmu_mode();
+		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
 	}
 	cond_resched();
diff --git a/mm/memory.c b/mm/memory.c
index 74b45e258323..2d662dee5ae7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1254,7 +1254,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
 	orig_src_pte = src_pte;
 	orig_dst_pte = dst_pte;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	do {
 		nr = 1;
@@ -1323,7 +1323,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
 		 addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(orig_src_pte, src_ptl);
 	add_mm_rss_vec(dst_mm, rss);
 	pte_unmap_unlock(orig_dst_pte, dst_ptl);
@@ -1842,7 +1842,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		return addr;
 
 	flush_tlb_batched_pending(mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	do {
 		bool any_skipped = false;
 
@@ -1874,7 +1874,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		direct_reclaim = try_get_and_clear_pmd(mm, pmd, &pmdval);
 
 	add_mm_rss_vec(mm, rss);
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 
 	/* Do the actual TLB flush before dropping ptl */
 	if (force_flush) {
@@ -2817,7 +2817,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
 	if (!pte)
 		return -ENOMEM;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	do {
 		BUG_ON(!pte_none(ptep_get(pte)));
 		if (!pfn_modify_allowed(pfn, prot)) {
@@ -2827,7 +2827,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
 		pfn++;
 	} while (pte++, addr += PAGE_SIZE, addr != end);
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(mapped_pte, ptl);
 	return err;
 }
@@ -3134,7 +3134,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			return -EINVAL;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	if (fn) {
 		do {
@@ -3147,7 +3147,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	}
 	*mask |= PGTBL_PTE_MODIFIED;
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 
 	if (mm != &init_mm)
 		pte_unmap_unlock(mapped_pte, ptl);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index abd9f6850db6..dcdc46b96cc7 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -110,7 +110,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
 	if (!ptep)
 		goto again;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	for (; addr < end; addr += PAGE_SIZE, ptep++) {
 		struct dev_pagemap *pgmap;
@@ -287,7 +287,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 	if (unmapped)
 		flush_tlb_range(walk->vma, start, end);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(ptep - 1, ptl);
 
 	return 0;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 113b48985834..bcb183a6fd2f 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -293,7 +293,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 		target_node = numa_node_id();
 
 	flush_tlb_batched_pending(vma->vm_mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 	do {
 		nr_ptes = 1;
 		oldpte = ptep_get(pte);
@@ -439,7 +439,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			}
 		}
 	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(pte - 1, ptl);
 
 	return pages;
diff --git a/mm/mremap.c b/mm/mremap.c
index bd7314898ec5..a2e2cd8f279a 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -256,7 +256,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
 	flush_tlb_batched_pending(vma->vm_mm);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
 		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
@@ -301,7 +301,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		}
 	}
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	if (force_flush)
 		flush_tlb_range(vma, old_end - len, old_end);
 	if (new_ptl != old_ptl)
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index af61b95c89e4..e01f7813e15c 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1100,7 +1100,7 @@ static long move_present_ptes(struct mm_struct *mm,
 	/* It's safe to drop the reference now as the page-table is holding one. */
 	folio_put(*first_src_folio);
 	*first_src_folio = NULL;
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	while (true) {
 		orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
@@ -1138,7 +1138,7 @@ static long move_present_ptes(struct mm_struct *mm,
 			break;
 	}
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	if (src_addr > src_start)
 		flush_tlb_range(src_vma, src_start, src_addr);
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46..b9940590a40d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -105,7 +105,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	if (!pte)
 		return -ENOMEM;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	do {
 		if (unlikely(!pte_none(ptep_get(pte)))) {
@@ -131,7 +131,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
@@ -359,7 +359,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	unsigned long size = PAGE_SIZE;
 
 	pte = pte_offset_kernel(pmd, addr);
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	do {
 #ifdef CONFIG_HUGETLB_PAGE
@@ -378,7 +378,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
 }
 
@@ -526,7 +526,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	if (!pte)
 		return -ENOMEM;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	do {
 		struct page *page = pages[*nr];
@@ -548,7 +548,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		(*nr)++;
 	} while (pte++, addr += PAGE_SIZE, addr != end);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
 
 	return err;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b2fc8b626d3d..7d2d87069530 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3551,7 +3551,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		return false;
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
 		unsigned long pfn;
@@ -3592,7 +3592,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
 		goto restart;
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	pte_unmap_unlock(pte, ptl);
 
 	return suitable_to_scan(total, young);
@@ -3633,7 +3633,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 	if (!spin_trylock(ptl))
 		goto done;
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	do {
 		unsigned long pfn;
@@ -3680,7 +3680,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
 
 	walk_update_folio(walk, last, gen, dirty);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 	spin_unlock(ptl);
 done:
 	*first = -1;
@@ -4279,7 +4279,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		}
 	}
 
-	arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_enable();
 
 	pte -= (addr - start) / PAGE_SIZE;
 
@@ -4313,7 +4313,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 
 	walk_update_folio(walk, last, gen, dirty);
 
-	arch_leave_lazy_mmu_mode();
+	lazy_mmu_mode_disable();
 
 	/* feedback from rmap walkers to page table walkers */
 	if (mm_state && suitable_to_scan(i, young))
-- 
2.47.0


