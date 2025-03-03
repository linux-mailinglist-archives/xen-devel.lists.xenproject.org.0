Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988EA4C30A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900326.1308237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aN-0004bx-18; Mon, 03 Mar 2025 14:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900326.1308237; Mon, 03 Mar 2025 14:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6aM-0004ZX-UI; Mon, 03 Mar 2025 14:15:58 +0000
Received: by outflank-mailman (input) for mailman id 900326;
 Mon, 03 Mar 2025 14:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm5g=VW=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tp6aL-0004ZK-DB
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:15:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 04f62c8f-f83a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 15:15:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 535C3106F;
 Mon,  3 Mar 2025 06:16:08 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com
 [10.1.196.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46EB83F66E;
 Mon,  3 Mar 2025 06:15:52 -0800 (PST)
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
X-Inumbo-ID: 04f62c8f-f83a-11ef-9ab2-95dc52dad729
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
Subject: [PATCH v2 0/5] Fix lazy mmu mode
Date: Mon,  3 Mar 2025 14:15:34 +0000
Message-ID: <20250303141542.3371656-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

I'm planning to implement lazy mmu mode for arm64 to optimize vmalloc. As part
of that, I will extend lazy mmu mode to cover kernel mappings in vmalloc table
walkers. While lazy mmu mode is already used for kernel mappings in a few
places, this will extend it's use significantly.

Having reviewed the existing lazy mmu implementations in powerpc, sparc and x86,
it looks like there are a bunch of bugs, some of which may be more likely to
trigger once I extend the use of lazy mmu. So this series attempts to clarify
the requirements and fix all the bugs in advance of that series. See patch #1
commit log for all the details.

Note that I have only been able to compile test these changes but I think they
are in good enough shape for some linux-next testing.

Applies on Friday's mm-unstable (5f089a9aa987), as I assume this would be
preferred via that tree.

Changes since v1
================
  - split v1 patch #1 into v2 patch #1 and #2; per David
  - Added Acked-by tags from David and Andreas; Thanks!
  - Refined the patches which are truely fixes and added to stable to cc

Thanks,
Ryan

Ryan Roberts (5):
  mm: Fix lazy mmu docs and usage
  fs/proc/task_mmu: Reduce scope of lazy mmu region
  sparc/mm: Disable preemption in lazy mmu mode
  sparc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes
  Revert "x86/xen: allow nesting of same lazy mode"

 arch/sparc/include/asm/pgtable_64.h   |  2 --
 arch/sparc/mm/tlb.c                   |  5 ++++-
 arch/x86/include/asm/xen/hypervisor.h | 15 ++-------------
 arch/x86/xen/enlighten_pv.c           |  1 -
 fs/proc/task_mmu.c                    | 11 ++++-------
 include/linux/pgtable.h               | 14 ++++++++------
 6 files changed, 18 insertions(+), 30 deletions(-)

--
2.43.0


