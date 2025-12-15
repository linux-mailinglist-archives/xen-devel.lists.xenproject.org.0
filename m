Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C3CBE7F2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 16:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187325.1508766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVAAS-0000BI-UG; Mon, 15 Dec 2025 15:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187325.1508766; Mon, 15 Dec 2025 15:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVAAS-00008Y-R9; Mon, 15 Dec 2025 15:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1187325;
 Mon, 15 Dec 2025 15:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lpeD=6V=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vVA7o-0004yw-GH
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 15:04:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5dcfa142-d9c7-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 16:04:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB8BF169E;
 Mon, 15 Dec 2025 07:04:26 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8EC3F73B;
 Mon, 15 Dec 2025 07:04:28 -0800 (PST)
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
X-Inumbo-ID: 5dcfa142-d9c7-11f0-9cce-f158ae23cfc8
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCH v6 10/14] arm64: mm: replace TIF_LAZY_MMU with is_lazy_mmu_mode_active()
Date: Mon, 15 Dec 2025 15:03:19 +0000
Message-ID: <20251215150323.2218608-11-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic lazy_mmu layer now tracks whether a task is in lazy MMU
mode. As a result we no longer need a TIF flag for that purpose -
let's use the new is_lazy_mmu_mode_active() helper instead.

The explicit check for in_interrupt() is no longer necessary either
as is_lazy_mmu_mode_active() always returns false in interrupt
context.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h     | 19 +++----------------
 arch/arm64/include/asm/thread_info.h |  3 +--
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7f528c36d53c..445e18e92221 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -62,28 +62,16 @@ static inline void emit_pte_barriers(void)
 
 static inline void queue_pte_barriers(void)
 {
-	unsigned long flags;
-
-	if (in_interrupt()) {
-		emit_pte_barriers();
-		return;
-	}
-
-	flags = read_thread_flags();
-
-	if (flags & BIT(TIF_LAZY_MMU)) {
+	if (is_lazy_mmu_mode_active()) {
 		/* Avoid the atomic op if already set. */
-		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
+		if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
 			set_thread_flag(TIF_LAZY_MMU_PENDING);
 	} else {
 		emit_pte_barriers();
 	}
 }
 
-static inline void arch_enter_lazy_mmu_mode(void)
-{
-	set_thread_flag(TIF_LAZY_MMU);
-}
+static inline void arch_enter_lazy_mmu_mode(void) {}
 
 static inline void arch_flush_lazy_mmu_mode(void)
 {
@@ -94,7 +82,6 @@ static inline void arch_flush_lazy_mmu_mode(void)
 static inline void arch_leave_lazy_mmu_mode(void)
 {
 	arch_flush_lazy_mmu_mode();
-	clear_thread_flag(TIF_LAZY_MMU);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index a803b887b0b4..e7cd017b07c8 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -84,8 +84,7 @@ void arch_setup_new_exec(void);
 #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
 #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
 #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
-#define TIF_LAZY_MMU		31	/* Task in lazy mmu mode */
-#define TIF_LAZY_MMU_PENDING	32	/* Ops pending for lazy mmu mode exit */
+#define TIF_LAZY_MMU_PENDING	31	/* Ops pending for lazy mmu mode exit */
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
-- 
2.51.2


