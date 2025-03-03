Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADCA4C30C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900331.1308268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aT-0005MW-MJ; Mon, 03 Mar 2025 14:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900331.1308268; Mon, 03 Mar 2025 14:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aT-0005KT-Ir; Mon, 03 Mar 2025 14:16:05 +0000
Received: by outflank-mailman (input) for mailman id 900331;
 Mon, 03 Mar 2025 14:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm5g=VW=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tp6aS-0005Dw-Rs
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:16:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 07d01255-f83a-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 15:15:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ABF8175A;
 Mon,  3 Mar 2025 06:16:13 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6783F66E;
 Mon,  3 Mar 2025 06:15:56 -0800 (PST)
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
X-Inumbo-ID: 07d01255-f83a-11ef-9898-31a8f345e629
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 2/5] fs/proc/task_mmu: Reduce scope of lazy mmu region
Date: Mon,  3 Mar 2025 14:15:36 +0000
Message-ID: <20250303141542.3371656-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the way arch_[enter|leave]_lazy_mmu_mode() is called in
pagemap_scan_pmd_entry() to follow the normal pattern of holding the ptl
for user space mappings. As a result the scope is reduced to only the
pte table, but that's where most of the performance win is.

While I believe there wasn't technically a bug here, the original scope
made it easier to accidentally nest or, worse, accidentally call
something like kmap() which would expect an immediate mode pte
modification but it would end up deferred.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 fs/proc/task_mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index c17615e21a5d..b0f189815512 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2459,22 +2459,19 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	spinlock_t *ptl;
 	int ret;
 
-	arch_enter_lazy_mmu_mode();
-
 	ret = pagemap_scan_thp_entry(pmd, start, end, walk);
-	if (ret != -ENOENT) {
-		arch_leave_lazy_mmu_mode();
+	if (ret != -ENOENT)
 		return ret;
-	}
 
 	ret = 0;
 	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, start, &ptl);
 	if (!pte) {
-		arch_leave_lazy_mmu_mode();
 		walk->action = ACTION_AGAIN;
 		return 0;
 	}
 
+	arch_enter_lazy_mmu_mode();
+
 	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
 		/* Fast path for performing exclusive WP */
 		for (addr = start; addr != end; pte++, addr += PAGE_SIZE) {
@@ -2543,8 +2540,8 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	if (flush_end)
 		flush_tlb_range(vma, start, addr);
 
-	pte_unmap_unlock(start_pte, ptl);
 	arch_leave_lazy_mmu_mode();
+	pte_unmap_unlock(start_pte, ptl);
 
 	cond_resched();
 	return ret;
-- 
2.43.0


