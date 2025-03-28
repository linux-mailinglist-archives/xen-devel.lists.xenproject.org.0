Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E8A7461B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930363.1333010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5ml-0001qQ-C6; Fri, 28 Mar 2025 09:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930363.1333010; Fri, 28 Mar 2025 09:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5ml-0001oC-8p; Fri, 28 Mar 2025 09:13:55 +0000
Received: by outflank-mailman (input) for mailman id 930363;
 Fri, 28 Mar 2025 09:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHkx=WP=li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1ty5mj-0001nv-VA
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:13:53 +0000
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [2a02:8070:a484:e780::f9cd])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e5b158-0bb4-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 10:13:52 +0100 (CET)
Received: from agordeev by li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com
 with local (Exim 4.98.1)
 (envelope-from <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>)
 id 1ty5mY-00000001t9q-24st; Fri, 28 Mar 2025 10:13:42 +0100
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
X-Inumbo-ID: f6e5b158-0bb4-11f0-9ea3-5ba50f476ded
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 4/4] mm: Protect kernel pgtables in apply_to_pte_range()
Date: Fri, 28 Mar 2025 10:13:42 +0100
Message-ID: <d13e7b254a018e72f7a660e7b177e483d41178e4.1743079720.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1743079720.git.agordeev@linux.ibm.com>
References: <cover.1743079720.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Alexander Gordeev <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>

The lazy MMU mode can only be entered and left under the protection
of the page table locks for all page tables which may be modified.
Yet, when it comes to kernel mappings apply_to_pte_range() does not
take any locks. That does not conform arch_enter|leave_lazy_mmu_mode()
semantics and could potentially lead to re-schedulling a process while
in lazy MMU mode or racing on a kernel page table updates.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/kasan/shadow.c | 7 ++-----
 mm/memory.c       | 5 ++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index edfa77959474..6531a7aa8562 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -308,14 +308,14 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	__memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
 	pte = pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
 
-	spin_lock(&init_mm.page_table_lock);
 	if (likely(pte_none(ptep_get(ptep)))) {
 		set_pte_at(&init_mm, addr, ptep, pte);
 		page = 0;
 	}
-	spin_unlock(&init_mm.page_table_lock);
+
 	if (page)
 		free_page(page);
+
 	return 0;
 }
 
@@ -401,13 +401,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 
 	page = (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
 
-	spin_lock(&init_mm.page_table_lock);
-
 	if (likely(!pte_none(ptep_get(ptep)))) {
 		pte_clear(&init_mm, addr, ptep);
 		free_page(page);
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;
 }
diff --git a/mm/memory.c b/mm/memory.c
index 00f253404db5..c000377cad0c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2895,6 +2895,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			pte = pte_offset_kernel(pmd, addr);
 		if (!pte)
 			return err;
+		spin_lock(&init_mm.page_table_lock);
 	} else {
 		if (create)
 			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
@@ -2920,7 +2921,9 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 
 	arch_leave_lazy_mmu_mode();
 
-	if (mm != &init_mm)
+	if (mm == &init_mm)
+		spin_unlock(&init_mm.page_table_lock);
+	else
 		pte_unmap_unlock(mapped_pte, ptl);
 
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.45.2


