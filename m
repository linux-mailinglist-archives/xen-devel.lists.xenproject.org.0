Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A5A4C30D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900328.1308257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aR-00055Z-Eq; Mon, 03 Mar 2025 14:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900328.1308257; Mon, 03 Mar 2025 14:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aR-00053j-BE; Mon, 03 Mar 2025 14:16:03 +0000
Received: by outflank-mailman (input) for mailman id 900328;
 Mon, 03 Mar 2025 14:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm5g=VW=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tp6aQ-0004ZK-Ma
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:16:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 093af2e1-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:16:02 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 865D01BCA;
 Mon,  3 Mar 2025 06:16:15 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48FF23F66E;
 Mon,  3 Mar 2025 06:15:59 -0800 (PST)
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
X-Inumbo-ID: 093af2e1-f83a-11ef-9ab2-95dc52dad729
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
	stable@vger.kernel.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 3/5] sparc/mm: Disable preemption in lazy mmu mode
Date: Mon,  3 Mar 2025 14:15:37 +0000
Message-ID: <20250303141542.3371656-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with
lazy updates") it's been possible for arch_[enter|leave]_lazy_mmu_mode()
to be called without holding a page table lock (for the kernel mappings
case), and therefore it is possible that preemption may occur while in
the lazy mmu mode. The Sparc lazy mmu implementation is not robust to
preemption since it stores the lazy mode state in a per-cpu structure
and does not attempt to manage that state on task switch.

Powerpc had the same issue and fixed it by explicitly disabling
preemption in arch_enter_lazy_mmu_mode() and re-enabling in
arch_leave_lazy_mmu_mode(). See commit b9ef323ea168 ("powerpc/64s:
Disable preemption in hash lazy mmu mode").

Given Sparc's lazy mmu mode is based on powerpc's, let's fix it in the
same way here.

Cc: <stable@vger.kernel.org>
Fixes: 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy updates")
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/sparc/mm/tlb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 8648a50afe88..a35ddcca5e76 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -52,8 +52,10 @@ void flush_tlb_pending(void)
 
 void arch_enter_lazy_mmu_mode(void)
 {
-	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
+	struct tlb_batch *tb;
 
+	preempt_disable();
+	tb = this_cpu_ptr(&tlb_batch);
 	tb->active = 1;
 }
 
@@ -64,6 +66,7 @@ void arch_leave_lazy_mmu_mode(void)
 	if (tb->tlb_nr)
 		flush_tlb_pending();
 	tb->active = 0;
+	preempt_enable();
 }
 
 static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
-- 
2.43.0


