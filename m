Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2CAC90FA
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001224.1381429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0M9-00066J-V4; Fri, 30 May 2025 14:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001224.1381429; Fri, 30 May 2025 14:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0M9-00064s-SF; Fri, 30 May 2025 14:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1001224;
 Fri, 30 May 2025 14:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m5RA=YO=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1uL0M7-00064k-V4
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:05:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 166495fb-3d5f-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 16:05:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82C55169C;
 Fri, 30 May 2025 07:04:48 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E5D3F673;
 Fri, 30 May 2025 07:04:59 -0700 (PDT)
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
X-Inumbo-ID: 166495fb-3d5f-11f0-a2ff-13f23c93f187
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
Subject: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Date: Fri, 30 May 2025 15:04:38 +0100
Message-ID: <20250530140446.2387131-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

I recently added support for lazy mmu mode on arm64. The series is now in
Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
found some ugly corners (unexpected nesting). I was able to fix those issues by
making the arm64 implementation more permissive (like the other arches). But
this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
lazy mmu mode never nests, and more importantly, that code never makes pgtable
modifications expecting them to be immediate, not knowing that it's actually in
lazy mmu mode so the changes get deferred.

The first 2 patches are unrelated, very obvious bug fixes. They don't affect
arm64 because arm64 only uses lazy mmu for kernel mappings. But I noticed them
during code review and think they should be fixed.

The next 3 patches are aimed at solving the nesting issue.

And the final patch is reverting the "permissive" fix I did for arm64, which is
no longer needed after the previous 3 patches.

I've labelled this RFC for now because it depends on the arm64 lazy mmu patches
in Linus's master, so it won't apply to mm-unstable. But I'm keen to get review
and siince I'm touching various arches and modifying some core mm stuff, I
thought that might take a while so thought I'd beat the rush and get a first
version out early.

I've build-tested all the affected arches. And I've run mm selftests for the
arm64 build, with no issues (with DEBUG_PAGEALLOC and KFENCE enabled).

Applies against Linus's master branch (f66bc387efbe).

Thanks,
Ryan


Ryan Roberts (6):
  fs/proc/task_mmu: Fix pte update and tlb maintenance ordering in
    pagemap_scan_pmd_entry()
  mm: Fix pte update and tlb maintenance ordering in
    migrate_vma_collect_pmd()
  mm: Avoid calling page allocator from apply_to_page_range()
  mm: Introduce arch_in_lazy_mmu_mode()
  mm: Avoid calling page allocator while in lazy mmu mode
  Revert "arm64/mm: Permit lazy_mmu_mode to be nested"

 arch/arm64/include/asm/pgtable.h              | 22 ++++----
 .../include/asm/book3s/64/tlbflush-hash.h     | 15 ++++++
 arch/sparc/include/asm/tlbflush_64.h          |  1 +
 arch/sparc/mm/tlb.c                           | 12 +++++
 arch/x86/include/asm/paravirt.h               |  5 ++
 arch/x86/include/asm/paravirt_types.h         |  1 +
 arch/x86/kernel/paravirt.c                    |  6 +++
 arch/x86/xen/mmu_pv.c                         |  6 +++
 fs/proc/task_mmu.c                            |  3 +-
 include/asm-generic/tlb.h                     |  2 +
 include/linux/mm.h                            |  6 +++
 include/linux/pgtable.h                       |  1 +
 kernel/bpf/arena.c                            |  6 +--
 mm/kasan/shadow.c                             |  2 +-
 mm/memory.c                                   | 54 ++++++++++++++-----
 mm/migrate_device.c                           |  3 +-
 mm/mmu_gather.c                               | 15 ++++++
 17 files changed, 128 insertions(+), 32 deletions(-)

--
2.43.0


