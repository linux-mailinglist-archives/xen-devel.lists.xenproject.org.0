Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA899C19A1B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 11:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152681.1483249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE3ED-0006yE-UC; Wed, 29 Oct 2025 10:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152681.1483249; Wed, 29 Oct 2025 10:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE3ED-0006sW-Qo; Wed, 29 Oct 2025 10:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1152681;
 Wed, 29 Oct 2025 10:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCkK=5G=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vE38f-0001HF-H8
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 10:10:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 882df8d2-b4af-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 11:10:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 310A22BF7;
 Wed, 29 Oct 2025 03:10:36 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CBC73F66E;
 Wed, 29 Oct 2025 03:10:38 -0700 (PDT)
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
X-Inumbo-ID: 882df8d2-b4af-11f0-9d16-b5c5bf9af7f9
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
Subject: [PATCH v4 10/12] sparc/mm: replace batch->active with in_lazy_mmu_mode()
Date: Wed, 29 Oct 2025 10:09:07 +0000
Message-ID: <20251029100909.3381140-11-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A per-CPU batch struct is activated when entering lazy MMU mode; its
lifetime is the same as the lazy MMU section (it is deactivated when
leaving the mode). Preemption is disabled in that interval to ensure
that the per-CPU reference remains valid.

The generic lazy_mmu layer now tracks whether a task is in lazy MMU
mode. We can therefore use the generic helper in_lazy_mmu_mode()
to tell whether a batch struct is active instead of tracking it
explicitly.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/include/asm/tlbflush_64.h | 1 -
 arch/sparc/mm/tlb.c                  | 9 +--------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 4e1036728e2f..6133306ba59a 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -12,7 +12,6 @@ struct tlb_batch {
 	unsigned int hugepage_shift;
 	struct mm_struct *mm;
 	unsigned long tlb_nr;
-	unsigned long active;
 	unsigned long vaddrs[TLB_BATCH_NR];
 };
 
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 7b5dfcdb1243..879e22c86e5c 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -52,11 +52,7 @@ void flush_tlb_pending(void)
 
 void arch_enter_lazy_mmu_mode(void)
 {
-	struct tlb_batch *tb;
-
 	preempt_disable();
-	tb = this_cpu_ptr(&tlb_batch);
-	tb->active = 1;
 }
 
 void arch_flush_lazy_mmu_mode(void)
@@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
 
 void arch_leave_lazy_mmu_mode(void)
 {
-	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
-
 	arch_flush_lazy_mmu_mode();
-	tb->active = 0;
 	preempt_enable();
 }
 
@@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
 		nr = 0;
 	}
 
-	if (!tb->active) {
+	if (!in_lazy_mmu_mode()) {
 		flush_tsb_user_page(mm, vaddr, hugepage_shift);
 		global_flush_tlb_page(mm, vaddr);
 		goto out;
-- 
2.47.0


