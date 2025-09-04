Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA83B43C74
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 15:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110056.1459434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9dZ-0006SE-Pq; Thu, 04 Sep 2025 13:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110056.1459434; Thu, 04 Sep 2025 13:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9dZ-0006MT-Ie; Thu, 04 Sep 2025 13:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1110056;
 Thu, 04 Sep 2025 12:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBMC=3P=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uu9Y6-0003uI-SO
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:58:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e45b61f3-898e-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 14:58:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A6F2ED2;
 Thu,  4 Sep 2025 05:58:37 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0CAA3F6A8;
 Thu,  4 Sep 2025 05:58:40 -0700 (PDT)
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
X-Inumbo-ID: e45b61f3-898e-11f0-9d12-b5c5bf9af7f9
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
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
Date: Thu,  4 Sep 2025 13:57:34 +0100
Message-ID: <20250904125736.3918646-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lazy_mmu API now allows nested sections to be handled by arch
code: enter() can return a flag if called inside another lazy_mmu
section, so that the matching call to leave() leaves any
optimisation enabled.

This patch implements that new logic for powerpc: if there is an
active batch, then enter() returns LAZY_MMU_NESTED and the matching
leave() leaves batch->active set. The preempt_{enable,disable} calls
are left untouched as they already handle nesting themselves.

TLB flushing is still done in leave() regardless of the nesting
level, as the caller may rely on it whether nesting is occurring or
not.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index c9f1e819e567..001c474da1fe 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -30,6 +30,7 @@ typedef int lazy_mmu_state_t;
 static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
+	int lazy_mmu_nested;
 
 	if (radix_enabled())
 		return LAZY_MMU_DEFAULT;
@@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 	 */
 	preempt_disable();
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
-	batch->active = 1;
+	lazy_mmu_nested = batch->active;
 
-	return LAZY_MMU_DEFAULT;
+	if (!lazy_mmu_nested) {
+		batch->active = 1;
+		return LAZY_MMU_DEFAULT;
+	} else {
+		return LAZY_MMU_NESTED;
+	}
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
@@ -54,7 +60,10 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 
 	if (batch->index)
 		__flush_tlb_pending(batch);
-	batch->active = 0;
+
+	if (state != LAZY_MMU_NESTED)
+		batch->active = 0;
+
 	preempt_enable();
 }
 
-- 
2.47.0


