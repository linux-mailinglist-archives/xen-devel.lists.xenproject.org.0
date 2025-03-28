Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C0A74618
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930366.1333032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mn-0002FH-Bs; Fri, 28 Mar 2025 09:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930366.1333032; Fri, 28 Mar 2025 09:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mn-0002CA-7D; Fri, 28 Mar 2025 09:13:57 +0000
Received: by outflank-mailman (input) for mailman id 930366;
 Fri, 28 Mar 2025 09:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHkx=WP=li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1ty5ml-0001o1-54
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:13:55 +0000
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [2a02:8070:a484:e780::f9cd])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e79d94-0bb4-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 10:13:52 +0100 (CET)
Received: from agordeev by li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com
 with local (Exim 4.98.1)
 (envelope-from <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>)
 id 1ty5mY-00000001t9o-1wfb; Fri, 28 Mar 2025 10:13:42 +0100
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
X-Inumbo-ID: f6e79d94-0bb4-11f0-9ffa-bf95429c2676
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
Subject: [PATCH 3/4] mm: Cleanup apply_to_pte_range() routine
Date: Fri, 28 Mar 2025 10:13:41 +0100
Message-ID: <6a4580bd289b4c62b09f8ef656d242c027c0c866.1743079720.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1743079720.git.agordeev@linux.ibm.com>
References: <cover.1743079720.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Alexander Gordeev <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>

Reverse 'create' vs 'mm == &init_mm' conditions and move
page table mask modification out of the atomic context.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/memory.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index fb7b8dc75167..00f253404db5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2884,24 +2884,28 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 				     pte_fn_t fn, void *data, bool create,
 				     pgtbl_mod_mask *mask)
 {
+	int err = create ? -ENOMEM : -EINVAL;
 	pte_t *pte, *mapped_pte;
-	int err = 0;
 	spinlock_t *ptl;
 
-	if (create) {
-		mapped_pte = pte = (mm == &init_mm) ?
-			pte_alloc_kernel_track(pmd, addr, mask) :
-			pte_alloc_map_lock(mm, pmd, addr, &ptl);
+	if (mm == &init_mm) {
+		if (create)
+			pte = pte_alloc_kernel_track(pmd, addr, mask);
+		else
+			pte = pte_offset_kernel(pmd, addr);
 		if (!pte)
-			return -ENOMEM;
+			return err;
 	} else {
-		mapped_pte = pte = (mm == &init_mm) ?
-			pte_offset_kernel(pmd, addr) :
-			pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (create)
+			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
+		else
+			pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 		if (!pte)
-			return -EINVAL;
+			return err;
+		mapped_pte = pte;
 	}
 
+	err = 0;
 	arch_enter_lazy_mmu_mode();
 
 	if (fn) {
@@ -2913,12 +2917,14 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			}
 		} while (addr += PAGE_SIZE, addr != end);
 	}
-	*mask |= PGTBL_PTE_MODIFIED;
 
 	arch_leave_lazy_mmu_mode();
 
 	if (mm != &init_mm)
 		pte_unmap_unlock(mapped_pte, ptl);
+
+	*mask |= PGTBL_PTE_MODIFIED;
+
 	return err;
 }
 
-- 
2.45.2


