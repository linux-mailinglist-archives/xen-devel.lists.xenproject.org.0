Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3382F543
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668077.1039955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4q-0002kr-VZ; Tue, 16 Jan 2024 19:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668077.1039955; Tue, 16 Jan 2024 19:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp4q-0002iS-SH; Tue, 16 Jan 2024 19:26:24 +0000
Received: by outflank-mailman (input) for mailman id 668077;
 Tue, 16 Jan 2024 19:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp4p-0002iI-Ry
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:23 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff0e01a-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:21 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-b1c0e1d0.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:17 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2c-m6i4x-b1c0e1d0.us-west-2.amazon.com (Postfix)
 with ESMTPS id B2565800AA; Tue, 16 Jan 2024 19:26:16 +0000 (UTC)
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:62203]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.28.244:2525]
 with esmtp (Farcaster)
 id 8c1457d3-2081-4124-9d27-5ac477025126; Tue, 16 Jan 2024 19:26:16 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:16 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:15 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1ff0e01a-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433181; x=1736969181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xKWNH6kJRXsg48ZEc5dzphr9is8CTmsp5C95JI51wQI=;
  b=PZqe3dSlUhDvvROxMfvRlgqGrBTyOfKdgydtFeaTsXW2IB2/mkxrhL24
   daL5q5FQqm+RxaTEcUJhIoC6oPEk7Q0RknPDagnY61vQwFd3u6krS6GLs
   JF9tsnYGwvYzqgmVWJMFsjA5UgTDVhgy8nHTWIDEEK5QJl44qpIDCstWc
   0=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="58701446"
X-Farcaster-Flow-ID: 8c1457d3-2081-4124-9d27-5ac477025126
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko
	<lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v2 (resend) 00/27] Remove the directmap
Date: Tue, 16 Jan 2024 19:25:44 +0000
Message-ID: <20240116192611.41112-1-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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

Elias El Yandouzi (3):
  xen/x86: Add build assertion for fixmap entries
  Rename mfn_to_virt() calls
  Rename maddr_to_virt() calls

Hongyan Xia (13):
  acpi: vmap pages in acpi_os_alloc_memory
  xen/numa: vmap the pages for memnodemap
  x86/srat: vmap the pages for acpi_slit
  x86: Map/unmap pages in restore_all_guests
  x86/pv: Rewrite how building PV dom0 handles domheap mappings
  x86/pv: Map L4 page table for shim domain
  x86/mapcache: Initialise the mapcache for the idle domain
  x86: Add a boot option to enable and disable the direct map
  x86/domain_page: Remove the fast paths when mfn is not in the
    directmap
  xen/page_alloc: Add a path for xenheap when there is no direct map
  x86/setup: Leave early boot slightly earlier
  x86/setup: vmap heap nodes when they are outside the direct map
  x86/setup: Do not create valid mappings when directmap=no

Julien Grall (8):
  xen/vmap: Check the page has been mapped in vm_init_type()
  xen/vmap: Introduce vmap_size() and use it
  xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
  xen/x86: Add support for the PMAP
  xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
  xen/arm64: mm: Use per-pCPU page-tables
  xen/arm64: Implement a mapcache for arm64
  xen/arm64: Allow the admin to enable/disable the directmap

Wei Liu (3):
  x86/setup: Move vm_init() before acpi calls
  x86/pv: Domheap pages should be mapped while relocating initrd
  x86: Lift mapcache variable to the arch level

 docs/misc/xen-command-line.pandoc             |  12 ++
 xen/arch/arm/Kconfig                          |   3 +-
 xen/arch/arm/acpi/lib.c                       |  18 +--
 xen/arch/arm/arm64/mmu/mm.c                   |  45 +++++-
 xen/arch/arm/domain_page.c                    |  50 ++++++-
 xen/arch/arm/include/asm/arm32/mm.h           |   8 --
 xen/arch/arm/include/asm/arm64/mm.h           |   7 +-
 xen/arch/arm/include/asm/domain_page.h        |  13 ++
 xen/arch/arm/include/asm/early_printk.h       |   2 +-
 xen/arch/arm/include/asm/fixmap.h             |  16 +--
 xen/arch/arm/include/asm/mm.h                 |   9 ++
 xen/arch/arm/include/asm/mmu/layout.h         |  13 +-
 xen/arch/arm/include/asm/mmu/mm.h             |   2 +
 xen/arch/arm/mm.c                             |   1 +
 xen/arch/arm/mmu/pt.c                         |  12 +-
 xen/arch/arm/mmu/setup.c                      |  33 ++---
 xen/arch/arm/mmu/smpboot.c                    |  32 ++---
 xen/arch/arm/setup.c                          |   6 +-
 xen/arch/x86/Kconfig                          |   2 +
 xen/arch/x86/dmi_scan.c                       |   4 +-
 xen/arch/x86/domain.c                         |  12 +-
 xen/arch/x86/domain_page.c                    |  74 +++++++---
 xen/arch/x86/hvm/dom0_build.c                 |   4 +-
 xen/arch/x86/include/asm/config.h             |  12 +-
 xen/arch/x86/include/asm/domain.h             |  13 +-
 xen/arch/x86/include/asm/fixmap.h             |   9 ++
 .../x86/include/asm/mach-default/bios_ebda.h  |   2 +-
 xen/arch/x86/include/asm/mm.h                 |  10 +-
 xen/arch/x86/include/asm/page.h               |   8 +-
 xen/arch/x86/include/asm/pmap.h               |  25 ++++
 xen/arch/x86/include/asm/x86_64/page.h        |   2 +-
 xen/arch/x86/mm.c                             |  18 ++-
 xen/arch/x86/mpparse.c                        |   2 +-
 xen/arch/x86/pv/dom0_build.c                  |  73 +++++++---
 xen/arch/x86/pv/domain.c                      |  34 +++++
 xen/arch/x86/setup.c                          | 129 +++++++++++++++---
 xen/arch/x86/srat.c                           |   4 +-
 xen/arch/x86/tboot.c                          |   2 +-
 xen/arch/x86/x86_64/asm-offsets.c             |   1 +
 xen/arch/x86/x86_64/entry.S                   |   8 ++
 xen/arch/x86/x86_64/mm.c                      |  26 ++--
 xen/common/Kconfig                            |  17 +++
 xen/common/efi/boot.c                         |  23 ++--
 xen/common/numa.c                             |   9 +-
 xen/common/page_alloc.c                       |  89 ++++++++++--
 xen/common/pmap.c                             |   8 +-
 xen/common/trace.c                            |   8 +-
 xen/common/vmap.c                             |  62 ++++++---
 xen/drivers/acpi/osl.c                        |  14 +-
 xen/include/xen/mm.h                          |   7 +
 xen/include/xen/vmap.h                        |   4 +
 51 files changed, 753 insertions(+), 244 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/domain_page.h
 create mode 100644 xen/arch/x86/include/asm/pmap.h

-- 
2.40.1


