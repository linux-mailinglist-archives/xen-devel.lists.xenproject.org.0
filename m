Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5FAC90FB
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001226.1381449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0MI-0006h9-Ga; Fri, 30 May 2025 14:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001226.1381449; Fri, 30 May 2025 14:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0MI-0006em-Cw; Fri, 30 May 2025 14:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1001226;
 Fri, 30 May 2025 14:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m5RA=YO=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1uL0MG-00064k-QC
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:05:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1c9df385-3d5f-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 16:05:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23F3F2247;
 Fri, 30 May 2025 07:04:59 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DD213F673;
 Fri, 30 May 2025 07:05:10 -0700 (PDT)
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
X-Inumbo-ID: 1c9df385-3d5f-11f0-a2ff-13f23c93f187
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
Subject: [RFC PATCH v1 2/6] mm: Fix pte update and tlb maintenance ordering in migrate_vma_collect_pmd()
Date: Fri, 30 May 2025 15:04:40 +0100
Message-ID: <20250530140446.2387131-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

migrate_vma_collect_pmd() was previously modifying ptes while in lazy
mmu mode, then performing tlb maintenance for the modified ptes, then
leaving lazy mmu mode. But any pte modifications during lazy mmu mode
may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
ordering between pte modificaiton and tlb maintenance.

Let's fix that by leaving mmu mode (forcing all the pte updates to be
actioned) before doing the tlb maintenance.

This is a theorectical bug discovered during code review.

Fixes: 60bae7370896 ("mm/migrate_device.c: flush TLB while holding PTL")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/migrate_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 3158afe7eb23..fc73a940c112 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -283,11 +283,12 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		migrate->src[migrate->npages++] = mpfn;
 	}
 
+	arch_leave_lazy_mmu_mode();
+
 	/* Only flush the TLB if we actually modified any entries */
 	if (unmapped)
 		flush_tlb_range(walk->vma, start, end);
 
-	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(ptep - 1, ptl);
 
 	return 0;
-- 
2.43.0


