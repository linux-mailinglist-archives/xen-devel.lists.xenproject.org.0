Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD83A4C30B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900327.1308247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aO-0004pc-7u; Mon, 03 Mar 2025 14:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900327.1308247; Mon, 03 Mar 2025 14:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aO-0004nP-4X; Mon, 03 Mar 2025 14:16:00 +0000
Received: by outflank-mailman (input) for mailman id 900327;
 Mon, 03 Mar 2025 14:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm5g=VW=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tp6aM-0004ZK-5S
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:15:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 065d83c2-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:15:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDB7D113E;
 Mon,  3 Mar 2025 06:16:10 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 807673F66E;
 Mon,  3 Mar 2025 06:15:54 -0800 (PST)
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
X-Inumbo-ID: 065d83c2-f83a-11ef-9ab2-95dc52dad729
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
Subject: [PATCH v2 1/5] mm: Fix lazy mmu docs and usage
Date: Mon,  3 Mar 2025 14:15:35 +0000
Message-ID: <20250303141542.3371656-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
is a bit of a mess (to put it politely). There are a number of issues
related to nesting of lazy mmu regions and confusion over whether the
task, when in a lazy mmu region, is preemptible or not. Fix all the
issues relating to the core-mm. Follow up commits will fix the
arch-specific implementations. 3 arches implement lazy mmu; powerpc,
sparc and x86.

When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
expected that lazy mmu regions would never nest and that the appropriate
page table lock(s) would be held while in the region, thus ensuring the
region is non-preemptible. Additionally lazy mmu regions were only used
during manipulation of user mappings.

Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
updates") started invoking the lazy mmu mode in apply_to_pte_range(),
which is used for both user and kernel mappings. For kernel mappings the
region is no longer protected by any lock so there is no longer any
guarantee about non-preemptibility. Additionally, for RT configs, the
holding the PTL only implies no CPU migration, it doesn't prevent
preemption.

Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
set_ptes(), used by x86. So after this commit, lazy mmu regions can be
nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
page table range API") and commit 9fee28baa601 ("powerpc: implement the
new page table range API") did the same for the sparc and powerpc
set_ptes() overrides.

powerpc couldn't deal with preemption so avoids it in commit
b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
which explicitly disables preemption for the whole region in its
implementation. x86 can support preemption (or at least it could until
it tried to add support nesting; more on this below). Sparc looks to be
totally broken in the face of preemption, as far as I can tell.

powerpc can't deal with nesting, so avoids it in commit 47b8def9358c
("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
which removes the lazy mmu calls from its implementation of set_ptes().
x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
nesting of same lazy mode") but as far as I can tell, this breaks its
support for preemption.

In short, it's all a mess; the semantics for
arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
result the implementations all have different expectations, sticking
plasters and bugs.

arm64 is aiming to start using these hooks, so let's clean everything up
before adding an arm64 implementation. Update the documentation to state
that lazy mmu regions can never be nested, must not be called in
interrupt context and preemption may or may not be enabled for the
duration of the region. And fix the generic implementation of set_ptes()
to avoid nesting.

arch-specific fixes to conform to the new spec will proceed this one.

These issues were spotted by code review and I have no evidence of
issues being reported in the wild.

Cc: <stable@vger.kernel.org>
Fixes: bcc6cc832573 ("mm: add default definition of set_ptes()")
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/pgtable.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372..787c632ee2c9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -222,10 +222,14 @@ static inline int pmd_dirty(pmd_t pmd)
  * hazard could result in the direct mode hypervisor case, since the actual
  * write to the page tables may not yet have taken place, so reads though
  * a raw PTE pointer after it has been modified are not guaranteed to be
- * up to date.  This mode can only be entered and left under the protection of
- * the page table locks for all page tables which may be modified.  In the UP
- * case, this is required so that preemption is disabled, and in the SMP case,
- * it must synchronize the delayed page table writes properly on other CPUs.
+ * up to date.
+ *
+ * In the general case, no lock is guaranteed to be held between entry and exit
+ * of the lazy mode. So the implementation must assume preemption may be enabled
+ * and cpu migration is possible; it must take steps to be robust against this.
+ * (In practice, for user PTE updates, the appropriate page table lock(s) are
+ * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
+ * and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
@@ -287,7 +291,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 {
 	page_table_check_ptes_set(mm, ptep, pte, nr);
 
-	arch_enter_lazy_mmu_mode();
 	for (;;) {
 		set_pte(ptep, pte);
 		if (--nr == 0)
@@ -295,7 +298,6 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		ptep++;
 		pte = pte_next_pfn(pte);
 	}
-	arch_leave_lazy_mmu_mode();
 }
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
-- 
2.43.0


