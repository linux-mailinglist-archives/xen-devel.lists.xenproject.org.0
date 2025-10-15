Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F83BDD71D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 10:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143263.1477022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8wzN-0002CZ-2V; Wed, 15 Oct 2025 08:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143263.1477022; Wed, 15 Oct 2025 08:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8wzM-0002BX-Uf; Wed, 15 Oct 2025 08:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1143263;
 Wed, 15 Oct 2025 08:36:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhcp=4Y=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1v8wsR-0006Qy-7H
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 08:28:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fbbbcee6-a9a0-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 10:28:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A1E2379;
 Wed, 15 Oct 2025 01:28:44 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2653F66E;
 Wed, 15 Oct 2025 01:28:47 -0700 (PDT)
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
X-Inumbo-ID: fbbbcee6-a9a0-11f0-980a-7dc792cee155
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
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
Date: Wed, 15 Oct 2025 09:27:27 +0100
Message-ID: <20251015082727.2395128-14-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

powerpc decides at runtime whether the lazy MMU mode should be used.

To avoid the overhead associated with managing
task_struct::lazy_mmu_state if the mode isn't used, introduce
arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
returns false. Add a default definition returning true, and an
appropriate implementation for powerpc.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
This patch seemed like a good idea to start with, but now I'm not so
sure that the churn added to the generic layer is worth it.

It provides a minor optimisation for just powerpc. x86 with XEN_PV also
chooses at runtime whether to implement lazy_mmu helpers or not, but
it doesn't fit this API so neatly and isn't handled here.
---
 .../include/asm/book3s/64/tlbflush-hash.h        | 11 ++++++-----
 include/linux/pgtable.h                          | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index bbc54690d374..a91b354cf87c 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -23,10 +23,14 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 
 extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
+#define arch_wants_lazy_mmu_mode arch_wants_lazy_mmu_mode
+static inline bool arch_wants_lazy_mmu_mode(void)
+{
+	return !radix_enabled();
+}
+
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	if (radix_enabled())
-		return;
 	/*
 	 * apply_to_page_range can call us this preempt enabled when
 	 * operating on kernel page tables.
@@ -46,9 +50,6 @@ static inline void arch_flush_lazy_mmu_mode(void)
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	if (radix_enabled())
-		return;
-
 	arch_flush_lazy_mmu_mode();
 	preempt_enable();
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 718c9c788114..db4f388d2a16 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -261,11 +261,19 @@ static inline int pmd_dirty(pmd_t pmd)
  * currently enabled.
  */
 #ifdef CONFIG_ARCH_LAZY_MMU
+
+#ifndef arch_wants_lazy_mmu_mode
+static inline bool arch_wants_lazy_mmu_mode(void)
+{
+	return true;
+}
+#endif
+
 static inline void lazy_mmu_mode_enable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_BUG_ON(state->count == U8_MAX);
@@ -283,7 +291,7 @@ static inline void lazy_mmu_mode_disable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_BUG_ON(state->count == 0);
@@ -303,7 +311,7 @@ static inline void lazy_mmu_mode_pause(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_WARN_ON(state->count == 0 || !state->enabled);
@@ -316,7 +324,7 @@ static inline void lazy_mmu_mode_resume(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_WARN_ON(state->count == 0 || state->enabled);
-- 
2.47.0


