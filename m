Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1256A4B269
	for <lists+xen-devel@lfdr.de>; Sun,  2 Mar 2025 15:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899722.1307797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tokjq-0001uJ-TA; Sun, 02 Mar 2025 14:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899722.1307797; Sun, 02 Mar 2025 14:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tokjq-0001sY-Q6; Sun, 02 Mar 2025 14:56:18 +0000
Received: by outflank-mailman (input) for mailman id 899722;
 Sun, 02 Mar 2025 14:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRaO=VV=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tokjp-0001c4-4P
 for xen-devel@lists.xenproject.org; Sun, 02 Mar 2025 14:56:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7cb3eb1a-f776-11ef-9ab1-95dc52dad729;
 Sun, 02 Mar 2025 15:56:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5BE13D5;
 Sun,  2 Mar 2025 06:56:28 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B5213F5A1;
 Sun,  2 Mar 2025 06:56:11 -0800 (PST)
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
X-Inumbo-ID: 7cb3eb1a-f776-11ef-9ab1-95dc52dad729
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] sparc/mm: Disable preemption in lazy mmu mode
Date: Sun,  2 Mar 2025 14:55:52 +0000
Message-ID: <20250302145555.3236789-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302145555.3236789-1-ryan.roberts@arm.com>
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
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

Fixes: 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy updates")
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


