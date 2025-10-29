Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38EEC1995E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 11:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152592.1483134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE37t-0000X2-5J; Wed, 29 Oct 2025 10:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152592.1483134; Wed, 29 Oct 2025 10:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE37t-0000Uv-2m; Wed, 29 Oct 2025 10:09:57 +0000
Received: by outflank-mailman (input) for mailman id 1152592;
 Wed, 29 Oct 2025 10:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCkK=5G=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vE37r-0000Up-Hc
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 10:09:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 68f5bef1-b4af-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 11:09:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5A201AC1;
 Wed, 29 Oct 2025 03:09:43 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC8B73F66E;
 Wed, 29 Oct 2025 03:09:46 -0700 (PDT)
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
X-Inumbo-ID: 68f5bef1-b4af-11f0-980a-7dc792cee155
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
Subject: [PATCH v4 00/12] Nesting support for lazy MMU mode
Date: Wed, 29 Oct 2025 10:08:57 +0000
Message-ID: <20251029100909.3381140-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the lazy MMU mode was introduced eons ago, it wasn't made clear
whether such a sequence was legal:

	arch_enter_lazy_mmu_mode()
	...
		arch_enter_lazy_mmu_mode()
		...
		arch_leave_lazy_mmu_mode()
	...
	arch_leave_lazy_mmu_mode()

It seems fair to say that nested calls to
arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
architectures never explicitly supported it.

Nesting does in fact occur in certain configurations, and avoiding it
has proved difficult. This series therefore enables lazy_mmu sections to
nest, on all architectures.

Nesting is handled using a counter in task_struct (patch 7), like other
stateless APIs such as pagefault_{disable,enable}(). This is fully
handled in a new generic layer in <linux/pgtable.h>; the arch_* API
remains unchanged. A new pair of calls, lazy_mmu_mode_{pause,resume}(),
is also introduced to allow functions that are called with the lazy MMU
mode enabled to temporarily pause it, regardless of nesting.

An arch now opts in to using the lazy MMU mode by selecting
CONFIG_ARCH_LAZY_MMU; this is more appropriate now that we have a
generic API, especially with state conditionally added to task_struct.

---

Background: Ryan Roberts' series from March [1] attempted to prevent
nesting from ever occurring, and mostly succeeded. Unfortunately, a
corner case (DEBUG_PAGEALLOC) may still cause nesting to occur on arm64.
Ryan proposed [2] to address that corner case at the generic level but
this approach received pushback; [3] then attempted to solve the issue
on arm64 only, but it was deemed too fragile.

It feels generally difficult to guarantee that lazy_mmu sections don't
nest, because callers of various standard mm functions do not know if
the function uses lazy_mmu itself.

The overall approach in v3/v4 is very close to what David Hildenbrand
proposed on v2 [4].

Unlike in v1/v2, no special provision is made for architectures to
save/restore extra state when entering/leaving the mode. Based on the
discussions so far, this does not seem to be required - an arch can
store any relevant state in thread_struct during arch_enter() and
restore it in arch_leave(). Nesting is not a concern as these functions
are only called at the top level, not in nested sections.

The introduction of a generic layer, and tracking of the lazy MMU state
in task_struct, also allows to streamline the arch callbacks - this
series removes 72 lines from arch/.

Patch overview:

* Patch 1: cleanup - avoids having to deal with the powerpc
  context-switching code

* Patch 2-4: prepare arch_flush_lazy_mmu_mode() to be called from the
  generic layer (patch 7)

* Patch 5-6: new API + CONFIG_ARCH_LAZY_MMU

* Patch 7: nesting support

* Patch 8-12: move as much handling as possible to the generic layer

This series has been tested by running the mm kselfetsts on arm64 with
DEBUG_VM, DEBUG_PAGEALLOC and KFENCE. It was also build-tested on other
architectures (with and without XEN_PV on x86).

- Kevin

[1] https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
[4] https://lore.kernel.org/all/ef343405-c394-4763-a79f-21381f217b6c@redhat.com/
---
Changelog

v3..v4:

- Patch 2: restored ordering of preempt_{disable,enable}() [Dave Hansen]
- Patch 5 onwards: s/ARCH_LAZY_MMU/ARCH_HAS_LAZY_MMU_MODE/ [Mike Rapoport]
- Patch 7: renamed lazy_mmu_state members, removed VM_BUG_ON(),
  reordered writes to lazy_mmu_state members [David Hildenbrand]
- Dropped patch 13 as it doesn't seem justified [David H]
- Various improvements to commit messages [David H]

v3: https://lore.kernel.org/all/20251015082727.2395128-1-kevin.brodsky@arm.com/

v2..v3:

- Full rewrite; dropped all Acked-by/Reviewed-by.
- Rebased on v6.18-rc1.

v2: https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com/

v1..v2:
- Rebased on mm-unstable.
- Patch 2: handled new calls to enter()/leave(), clarified how the "flush"
  pattern (leave() followed by enter()) is handled.
- Patch 5,6: removed unnecessary local variable [Alexander Gordeev's
  suggestion].
- Added Mike Rapoport's Acked-by.

v1: https://lore.kernel.org/all/20250904125736.3918646-1-kevin.brodsky@arm.com/
---
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jann Horn <jannh@google.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: sparclinux@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
---
Alexander Gordeev (1):
  powerpc/64s: Do not re-activate batched TLB flush

Kevin Brodsky (11):
  x86/xen: simplify flush_lazy_mmu()
  powerpc/mm: implement arch_flush_lazy_mmu_mode()
  sparc/mm: implement arch_flush_lazy_mmu_mode()
  mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
  mm: introduce generic lazy_mmu helpers
  mm: enable lazy_mmu sections to nest
  arm64: mm: replace TIF_LAZY_MMU with in_lazy_mmu_mode()
  powerpc/mm: replace batch->active with in_lazy_mmu_mode()
  sparc/mm: replace batch->active with in_lazy_mmu_mode()
  x86/xen: use lazy_mmu_state when context-switching
  mm: bail out of lazy_mmu_mode_* in interrupt context

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/pgtable.h              |  46 +-------
 arch/arm64/include/asm/thread_info.h          |   3 +-
 arch/arm64/mm/mmu.c                           |   4 +-
 arch/arm64/mm/pageattr.c                      |   4 +-
 .../include/asm/book3s/64/tlbflush-hash.h     |  22 ++--
 arch/powerpc/include/asm/thread_info.h        |   2 -
 arch/powerpc/kernel/process.c                 |  25 -----
 arch/powerpc/mm/book3s64/hash_tlb.c           |  10 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 arch/sparc/Kconfig                            |   1 +
 arch/sparc/include/asm/tlbflush_64.h          |   5 +-
 arch/sparc/mm/tlb.c                           |  14 +--
 arch/x86/Kconfig                              |   1 +
 arch/x86/boot/compressed/misc.h               |   1 +
 arch/x86/boot/startup/sme.c                   |   1 +
 arch/x86/include/asm/paravirt.h               |   1 -
 arch/x86/include/asm/pgtable.h                |   3 +-
 arch/x86/include/asm/thread_info.h            |   4 +-
 arch/x86/xen/enlighten_pv.c                   |   3 +-
 arch/x86/xen/mmu_pv.c                         |   6 +-
 fs/proc/task_mmu.c                            |   4 +-
 include/linux/mm_types_task.h                 |   5 +
 include/linux/pgtable.h                       | 104 +++++++++++++++++-
 include/linux/sched.h                         |  19 ++++
 mm/Kconfig                                    |   3 +
 mm/kasan/shadow.c                             |   8 +-
 mm/madvise.c                                  |  18 +--
 mm/memory.c                                   |  16 +--
 mm/migrate_device.c                           |   4 +-
 mm/mprotect.c                                 |   4 +-
 mm/mremap.c                                   |   4 +-
 mm/userfaultfd.c                              |   4 +-
 mm/vmalloc.c                                  |  12 +-
 mm/vmscan.c                                   |  12 +-
 36 files changed, 213 insertions(+), 166 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.47.0


