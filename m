Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD8B43C72
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 15:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110052.1459430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9dZ-0006Mr-Ha; Thu, 04 Sep 2025 13:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110052.1459430; Thu, 04 Sep 2025 13:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9dZ-0006Ir-8l; Thu, 04 Sep 2025 13:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1110052;
 Thu, 04 Sep 2025 12:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBMC=3P=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uu9Y2-0003uI-4h
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:58:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e17c05a8-898e-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 14:58:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2267F2ECB;
 Thu,  4 Sep 2025 05:58:32 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64E73F6A8;
 Thu,  4 Sep 2025 05:58:35 -0700 (PDT)
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
X-Inumbo-ID: e17c05a8-898e-11f0-9d12-b5c5bf9af7f9
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
Subject: [PATCH 4/7] x86/xen: support nested lazy_mmu sections (again)
Date: Thu,  4 Sep 2025 13:57:33 +0100
Message-ID: <20250904125736.3918646-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 49147beb0ccb ("x86/xen: allow nesting of same lazy mode")
originally introduced support for nested lazy sections (LAZY_MMU and
LAZY_CPU). It later got reverted by commit c36549ff8d84 as its
implementation turned out to be intolerant to preemption.

Now that the lazy_mmu API allows enter() to pass through a state to
the matching leave() call, we can support nesting again for the
LAZY_MMU mode in a preemption-safe manner. If xen_enter_lazy_mmu() is
called inside an active lazy_mmu section, xen_lazy_mode will already
be set to XEN_LAZY_MMU and we can then return LAZY_MMU_NESTED to
instruct the matching xen_leave_lazy_mmu() call to leave
xen_lazy_mode unchanged.

The only effect of this patch is to ensure that xen_lazy_mode
remains set to XEN_LAZY_MMU until the outermost lazy_mmu section
ends. xen_leave_lazy_mmu() still calls xen_mc_flush()
unconditionally.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/x86/include/asm/paravirt.h       |  6 ++----
 arch/x86/include/asm/paravirt_types.h |  4 ++--
 arch/x86/xen/mmu_pv.c                 | 11 ++++++++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 65a0d394fba1..4ecd3a6b1dea 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -529,14 +529,12 @@ static inline void arch_end_context_switch(struct task_struct *next)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
-	PVOP_VCALL0(mmu.lazy_mode.enter);
-
-	return LAZY_MMU_DEFAULT;
+	return PVOP_CALL0(lazy_mmu_state_t, mmu.lazy_mode.enter);
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 {
-	PVOP_VCALL0(mmu.lazy_mode.leave);
+	PVOP_VCALL1(mmu.lazy_mode.leave, state);
 }
 
 static inline void arch_flush_lazy_mmu_mode(void)
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index bc1af86868a3..b7c567ccbf32 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -45,8 +45,8 @@ typedef int lazy_mmu_state_t;
 
 struct pv_lazy_ops {
 	/* Set deferred update mode, used for batching operations. */
-	void (*enter)(void);
-	void (*leave)(void);
+	lazy_mmu_state_t (*enter)(void);
+	void (*leave)(lazy_mmu_state_t);
 	void (*flush)(void);
 } __no_randomize_layout;
 #endif
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2039d5132ca3..6e5390ff06a5 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2130,9 +2130,13 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
 #endif
 }
 
-static void xen_enter_lazy_mmu(void)
+static lazy_mmu_state_t xen_enter_lazy_mmu(void)
 {
+	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
+		return LAZY_MMU_NESTED;
+
 	enter_lazy(XEN_LAZY_MMU);
+	return LAZY_MMU_DEFAULT;
 }
 
 static void xen_flush_lazy_mmu(void)
@@ -2167,11 +2171,12 @@ static void __init xen_post_allocator_init(void)
 	pv_ops.mmu.write_cr3 = &xen_write_cr3;
 }
 
-static void xen_leave_lazy_mmu(void)
+static void xen_leave_lazy_mmu(lazy_mmu_state_t state)
 {
 	preempt_disable();
 	xen_mc_flush();
-	leave_lazy(XEN_LAZY_MMU);
+	if (state != LAZY_MMU_NESTED)
+		leave_lazy(XEN_LAZY_MMU);
 	preempt_enable();
 }
 
-- 
2.47.0


