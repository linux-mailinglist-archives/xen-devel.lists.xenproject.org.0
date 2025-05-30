Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7EAC9101
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001233.1381469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0MU-0007O0-0L; Fri, 30 May 2025 14:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001233.1381469; Fri, 30 May 2025 14:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0MT-0007K6-TY; Fri, 30 May 2025 14:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1001233;
 Fri, 30 May 2025 14:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m5RA=YO=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1uL0MS-00064k-9M
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:05:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 22fc754e-3d5f-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 16:05:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC0EB2682;
 Fri, 30 May 2025 07:05:09 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F963F673;
 Fri, 30 May 2025 07:05:21 -0700 (PDT)
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
X-Inumbo-ID: 22fc754e-3d5f-11f0-a2ff-13f23c93f187
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 4/6] mm: Introduce arch_in_lazy_mmu_mode()
Date: Fri, 30 May 2025 15:04:42 +0100
Message-ID: <20250530140446.2387131-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new arch_in_lazy_mmu_mode() API, which returns true if the
calling context is currently in lazy mmu mode or false otherwise. Each
arch that supports lazy mmu mode must provide an implementation of this
API.

The API will shortly be used to prevent accidental lazy mmu mode nesting
when performing an allocation, and will additionally be used to ensure
pte modification vs tlb flushing order does not get inadvertantly
swapped.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h                  |  8 ++++++++
 .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++++++
 arch/sparc/include/asm/tlbflush_64.h              |  1 +
 arch/sparc/mm/tlb.c                               | 12 ++++++++++++
 arch/x86/include/asm/paravirt.h                   |  5 +++++
 arch/x86/include/asm/paravirt_types.h             |  1 +
 arch/x86/kernel/paravirt.c                        |  6 ++++++
 arch/x86/xen/mmu_pv.c                             |  6 ++++++
 include/linux/pgtable.h                           |  1 +
 9 files changed, 55 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 5285757ee0c1..add75dee49f5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -119,6 +119,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	clear_thread_flag(TIF_LAZY_MMU);
 }
 
+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	if (in_interrupt())
+		return false;
+
+	return test_thread_flag(TIF_LAZY_MMU);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..4123a9da32cc 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -57,6 +57,21 @@ static inline void arch_leave_lazy_mmu_mode(void)
 
 #define arch_flush_lazy_mmu_mode()      do {} while (0)
 
+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	struct ppc64_tlb_batch *batch;
+	bool active;
+
+	if (radix_enabled())
+		return false;
+
+	batch = get_cpu_ptr(&ppc64_tlb_batch);
+	active = batch->active;
+	put_cpu_ptr(&ppc64_tlb_batch);
+
+	return active;
+}
+
 extern void hash__tlbiel_all(unsigned int action);
 
 extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 8b8cdaa69272..204bc957df9e 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -45,6 +45,7 @@ void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
 void arch_leave_lazy_mmu_mode(void);
 #define arch_flush_lazy_mmu_mode()      do {} while (0)
+bool arch_in_lazy_mmu_mode(void);
 
 /* Local cpu only.  */
 void __flush_tlb_all(void);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index a35ddcca5e76..83ab4ba4f4fb 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -69,6 +69,18 @@ void arch_leave_lazy_mmu_mode(void)
 	preempt_enable();
 }
 
+bool arch_in_lazy_mmu_mode(void)
+{
+	struct tlb_batch *tb;
+	bool active;
+
+	tb = get_cpu_ptr(&tlb_batch);
+	active = tb->active;
+	put_cpu_ptr(&tlb_batch);
+
+	return active;
+}
+
 static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
 			      bool exec, unsigned int hugepage_shift)
 {
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b5e59a7ba0d0..c7ea3ccb8a41 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -542,6 +542,11 @@ static inline void arch_flush_lazy_mmu_mode(void)
 	PVOP_VCALL0(mmu.lazy_mode.flush);
 }
 
+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	return PVOP_CALL0(bool, mmu.lazy_mode.in);
+}
+
 static inline void __set_fixmap(unsigned /* enum fixed_addresses */ idx,
 				phys_addr_t phys, pgprot_t flags)
 {
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 37a8627d8277..41001ca9d010 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -46,6 +46,7 @@ struct pv_lazy_ops {
 	void (*enter)(void);
 	void (*leave)(void);
 	void (*flush)(void);
+	bool (*in)(void);
 } __no_randomize_layout;
 #endif
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc69..9af1a04a47fd 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -106,6 +106,11 @@ static noinstr void pv_native_set_debugreg(int regno, unsigned long val)
 {
 	native_set_debugreg(regno, val);
 }
+
+static noinstr bool paravirt_retfalse(void)
+{
+	return false;
+}
 #endif
 
 struct pv_info pv_info = {
@@ -228,6 +233,7 @@ struct paravirt_patch_template pv_ops = {
 		.enter		= paravirt_nop,
 		.leave		= paravirt_nop,
 		.flush		= paravirt_nop,
+		.in		= paravirt_retfalse,
 	},
 
 	.mmu.set_fixmap		= native_set_fixmap,
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2a4a8deaf612..74f7a8537911 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2147,6 +2147,11 @@ static void xen_flush_lazy_mmu(void)
 	preempt_enable();
 }
 
+static bool xen_in_lazy_mmu(void)
+{
+	return xen_get_lazy_mode() == XEN_LAZY_MMU;
+}
+
 static void __init xen_post_allocator_init(void)
 {
 	pv_ops.mmu.set_pte = xen_set_pte;
@@ -2230,6 +2235,7 @@ static const typeof(pv_ops) xen_mmu_ops __initconst = {
 			.enter = xen_enter_lazy_mmu,
 			.leave = xen_leave_lazy_mmu,
 			.flush = xen_flush_lazy_mmu,
+			.in = xen_in_lazy_mmu,
 		},
 
 		.set_fixmap = xen_set_fixmap,
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..580d9971f435 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -235,6 +235,7 @@ static inline int pmd_dirty(pmd_t pmd)
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
 #define arch_leave_lazy_mmu_mode()	do {} while (0)
 #define arch_flush_lazy_mmu_mode()	do {} while (0)
+#define arch_in_lazy_mmu_mode()		false
 #endif
 
 #ifndef pte_batch_hint
-- 
2.43.0


