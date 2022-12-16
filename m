Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F664EAD3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464424.722814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D2-0003Wy-CT; Fri, 16 Dec 2022 11:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464424.722814; Fri, 16 Dec 2022 11:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D2-0003VB-9V; Fri, 16 Dec 2022 11:49:00 +0000
Received: by outflank-mailman (input) for mailman id 464424;
 Fri, 16 Dec 2022 11:48:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D0-0003V0-Pm
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:48:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D0-0002Ca-Ee; Fri, 16 Dec 2022 11:48:58 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D0-0004sN-5B; Fri, 16 Dec 2022 11:48:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=3cyfX6VRmfkRmBRP2xPbR0+h3cqQiViAlzl0YRHWdPg=; b=Eg1qy/
	U2LZqGD2w+Gk3S1uDj2UZqAKOeNxL2BH7q2+JMWiJtxGYJh/8h5m+iyJXJYB/z/pRKST/YkaKS8Vt
	9xdPyB4KmTUtkzqvvgeU2KFncck3Gv1wbfEwYJF86q2sKvGmUF0JIwd3yLptXy0O8b3aXwZuTkH0I
	1ZqlO8kvNuE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 00/22] Remove the directmap
Date: Fri, 16 Dec 2022 11:48:31 +0000
Message-Id: <20221216114853.8227-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

A few years ago, Wei Liu implemented a PoC to remove the directmap
from Xen. The last version was sent by Hongyan Xia [1].

I will start with thanking both Wei and Hongyan for the initial work
to upstream the feature. A lot of patches already went in and this is
the last few patches missing to effectively enable the feature.

=== What is the directmap? ===

At the moment, on both arm64 and x86, most of the RAM is mapped
in Xen address space. This means that domain memory is easily
accessible in Xen.

=== Why do we want to remove the directmap? ===

(Summarizing my understanding of the previous discussion)

Speculation attacks (like Spectre SP1) rely on loading piece of memory
in the cache. If the region is not mapped then it can't be loaded.

So removing reducing the amount of memory mapped in Xen will also
reduce the surface attack.

=== What's the performance impact? ===

As the guest memory is not always mapped, then the cost of mapping
will increase. I haven't done the numbers with this new version, but
some measurement were provided in the previous version for x86.

=== Improvement possible ===

The known area to improve on x86 are:
   * Mapcache: There was a patch sent by Hongyan:
     https://lore.kernel.org/xen-devel/4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com/
   * EPT: At the moment an guest page-tabel walk requires about 20 map/unmap.
     This will have an very high impact on the performance. We need to decide
     whether keep the EPT always mapped is a problem

The original series didn't have support for Arm64. But as there were
some interest, I have provided a PoC.

There are more extra work for Arm64:
   * The mapcache is quite simple. We would investigate the performance
   * The mapcache should be made compliant to the Arm Arm (this is now
     more critical).
   * We will likely have the same problem as for the EPT.
   * We have no support for merging table to a superpage, neither
     free empty page-tables. (See more below)

=== Implementation ===

The subject is probably a misnomer. The directmap is still present but
the RAM is not mapped by default. Instead, the region will still be used
to map pages allocate via alloc_xenheap_pages().

The advantage is the solution is simple (so IHMO good enough for been
merged as a tech preview). The disadvantage is the page allocator is not
trying to keep all the xenheap pages together. So we may end up to have
an increase of page table usage.

In the longer term, we should consider to remove the direct map
completely and switch to vmap(). The main problem with this approach
is it is frequent to use mfn_to_virt() in the code. So we would need
to cache the mapping (maybe in the struct page_info).

=== Why arm32 is not covered? ===

On Arm32, the domheap and xenheap is always separated. So by design
the guest memory is not mapped by default.

At this stage, it seems unnecessary to have to map/unmap xenheap pages
every time they are allocated.

=== Why not using a separate domheap and xenheap? ===

While a separate xenheap/domheap reduce the page-table usage (all
xenheap pages are contiguous and could be always mapped), it is also
currently less scalable because the split is fixed at boot time (XXX:
Can this be dynamic?).

=== Future of secret-free hypervisor ===

There are some information in an e-mail from Andrew a few years ago:

https://lore.kernel.org/xen-devel/e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com/

Cheers,

[1] https://lore.kernel.org/xen-devel/cover.1588278317.git.hongyxia@amazon.com/

*** BLURB HERE ***

Hongyan Xia (12):
  acpi: vmap pages in acpi_os_alloc_memory
  xen/numa: vmap the pages for memnodemap
  x86/srat: vmap the pages for acpi_slit
  x86: map/unmap pages in restore_all_guests
  x86/pv: rewrite how building PV dom0 handles domheap mappings
  x86/mapcache: initialise the mapcache for the idle domain
  x86: add a boot option to enable and disable the direct map
  x86/domain_page: remove the fast paths when mfn is not in the
    directmap
  xen/page_alloc: add a path for xenheap when there is no direct map
  x86/setup: leave early boot slightly earlier
  x86/setup: vmap heap nodes when they are outside the direct map
  x86/setup: do not create valid mappings when directmap=no

Julien Grall (7):
  xen/common: page_alloc: Re-order includes
  xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
  xen/x86: Add support for the PMAP
  xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
  xen/arm64: mm: Use per-pCPU page-tables
  xen/arm64: Implement a mapcache for arm64
  xen/arm64: Allow the admin to enable/disable the directmap

Wei Liu (3):
  x86/setup: move vm_init() before acpi calls
  x86/pv: domheap pages should be mapped while relocating initrd
  x86: lift mapcache variable to the arch level

 docs/misc/xen-command-line.pandoc       |  12 +++
 xen/arch/arm/Kconfig                    |   1 +
 xen/arch/arm/acpi/lib.c                 |  18 ++--
 xen/arch/arm/domain_page.c              |  49 +++++++++-
 xen/arch/arm/include/asm/arm32/mm.h     |   8 --
 xen/arch/arm/include/asm/arm64/mm.h     |   2 +-
 xen/arch/arm/include/asm/config.h       |   7 ++
 xen/arch/arm/include/asm/domain_page.h  |  13 +++
 xen/arch/arm/include/asm/early_printk.h |   2 +-
 xen/arch/arm/include/asm/fixmap.h       |  16 +--
 xen/arch/arm/include/asm/mm.h           |  17 ++++
 xen/arch/arm/kernel.c                   |   6 +-
 xen/arch/arm/mm.c                       | 104 +++++++++++---------
 xen/arch/arm/setup.c                    |  10 +-
 xen/arch/x86/Kconfig                    |   1 +
 xen/arch/x86/domain.c                   |   4 +-
 xen/arch/x86/domain_page.c              |  70 +++++++++----
 xen/arch/x86/include/asm/domain.h       |  12 +--
 xen/arch/x86/include/asm/fixmap.h       |   4 +
 xen/arch/x86/include/asm/mm.h           |  17 +++-
 xen/arch/x86/include/asm/pmap.h         |  25 +++++
 xen/arch/x86/mm.c                       |   6 ++
 xen/arch/x86/pv/dom0_build.c            |  74 +++++++++++---
 xen/arch/x86/setup.c                    | 125 ++++++++++++++++++++----
 xen/arch/x86/srat.c                     |   3 +-
 xen/arch/x86/x86_64/entry.S             |  27 ++++-
 xen/common/numa.c                       |   8 +-
 xen/common/page_alloc.c                 | 112 ++++++++++++++++-----
 xen/common/pmap.c                       |   8 +-
 xen/common/vmap.c                       |  42 ++++++--
 xen/drivers/acpi/osl.c                  |  13 ++-
 xen/include/xen/vmap.h                  |   2 +
 32 files changed, 627 insertions(+), 191 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/domain_page.h
 create mode 100644 xen/arch/x86/include/asm/pmap.h

-- 
2.38.1


