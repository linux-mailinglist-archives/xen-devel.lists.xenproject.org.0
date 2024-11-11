Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6859A9C3F63
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833729.1248931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUD9-0007qy-3p; Mon, 11 Nov 2024 13:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833729.1248931; Mon, 11 Nov 2024 13:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUD9-0007pJ-0c; Mon, 11 Nov 2024 13:12:07 +0000
Received: by outflank-mailman (input) for mailman id 833729;
 Mon, 11 Nov 2024 13:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUD8-0007pD-8i
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:06 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f10774-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:01 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:11:58 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.0.204:48770]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.13.234:2525]
 with esmtp (Farcaster)
 id 8605e4df-8454-4f66-9ec1-c086a3de2078; Mon, 11 Nov 2024 13:11:57 +0000 (UTC)
Received: from EX19D008UEC002.ant.amazon.com (10.252.135.242) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:11:56 +0000
Received: from EX19MTAUWC002.ant.amazon.com (10.250.64.143) by
 EX19D008UEC002.ant.amazon.com (10.252.135.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:11:55 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:11:55 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id DD88C42116; Mon, 11 Nov 2024 13:11:54 +0000 (UTC)
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
X-Inumbo-ID: 88f10774-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjExOS4yMTMuMTU2IiwiaGVsbyI6InNtdHAtZnctNTIwMDUuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg4ZjEwNzc0LWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzIxLjg1MTU1MSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330722; x=1762866722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yXXOHoIPHky88JTb9rF73LR/UCSBziQW9WWeOuavneQ=;
  b=uZ6dWlSBiAMIq3s+PsCHYLuemp8SHlWiMrB2dfgELPpLGJzZUe+sL6/H
   PkeESoi9Y4bcedJeWj4Mkpz4KpVunuG5l9jIj1qfLS2j/gZJgyrkXaUny
   3+SLVhkV01Mdi8TsPDvCyyzmyYF3y7VC1uExDfERzCi0OkYWGVpl5+bKV
   I=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="694473681"
X-Farcaster-Flow-ID: 8605e4df-8454-4f66-9ec1-c086a3de2078
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>
Subject: [PATCH V4 00/15] Remove the directmap 
Date: Mon, 11 Nov 2024 13:11:33 +0000
Message-ID: <20241111131148.52568-1-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

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

Hongyan Xia (8):
  x86: Create per-domain mapping for guest_root_pt
  x86/pv: Rewrite how building PV dom0 handles domheap mappings
  x86: Add a boot option to enable and disable the direct map
  x86/domain_page: Remove the fast paths when mfn is not in the
    directmap
  xen/page_alloc: Add a path for xenheap when there is no direct map
  x86/setup: Leave early boot slightly earlier
  xen/page_alloc: vmap heap nodes when they are outside the direct map
  x86/setup: Do not create valid mappings when directmap=no

Julien Grall (5):
  xen/x86: Add support for the PMAP
  xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
  xen/arm64: mm: Use per-pCPU page-tables
  xen/arm64: Implement a mapcache for arm64
  xen/arm64: Allow the admin to enable/disable the directmap

Wei Liu (2):
  x86/pv: Use copy_domain_page() to manage domheap pages during initrd
    relocation
  x86: Initialize mapcache for PV, HVM, and idle domains

 docs/misc/xen-command-line.pandoc      | 12 ++++
 xen/arch/arm/Kconfig                   |  2 +-
 xen/arch/arm/arm64/mmu/mm.c            | 45 ++++++++++++-
 xen/arch/arm/include/asm/arm32/mm.h    |  8 ---
 xen/arch/arm/include/asm/arm64/mm.h    |  7 +-
 xen/arch/arm/include/asm/domain_page.h | 13 ++++
 xen/arch/arm/include/asm/mm.h          |  8 +++
 xen/arch/arm/include/asm/mmu/layout.h  | 13 +++-
 xen/arch/arm/include/asm/mmu/mm.h      |  2 +
 xen/arch/arm/mm.c                      |  1 +
 xen/arch/arm/mmu/domain_page.c         | 45 +++++++++++--
 xen/arch/arm/mmu/pt.c                  | 12 ++--
 xen/arch/arm/mmu/setup.c               | 28 +++-----
 xen/arch/arm/mmu/smpboot.c             | 32 +++------
 xen/arch/arm/setup.c                   |  2 +
 xen/arch/x86/Kconfig                   |  1 +
 xen/arch/x86/domain.c                  |  8 +--
 xen/arch/x86/domain_page.c             | 72 ++++++++++++++------
 xen/arch/x86/include/asm/config.h      | 10 ++-
 xen/arch/x86/include/asm/domain.h      | 13 ++--
 xen/arch/x86/include/asm/fixmap.h      | 31 +++++++++
 xen/arch/x86/include/asm/mm.h          |  6 ++
 xen/arch/x86/include/asm/pmap.h        | 35 ++++++++++
 xen/arch/x86/mm.c                      | 12 ++++
 xen/arch/x86/pv/dom0_build.c           | 70 +++++++++++++------
 xen/arch/x86/pv/domain.c               | 45 +++++++++++--
 xen/arch/x86/setup.c                   | 93 +++++++++++++++++++++++---
 xen/arch/x86/x86_64/asm-offsets.c      |  1 +
 xen/arch/x86/x86_64/entry.S            |  9 ++-
 xen/common/Kconfig                     | 18 +++++
 xen/common/domain.c                    |  9 +++
 xen/common/page_alloc.c                | 77 ++++++++++++++++++---
 xen/include/xen/mm.h                   | 11 +++
 33 files changed, 604 insertions(+), 147 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/domain_page.h
 create mode 100644 xen/arch/x86/include/asm/pmap.h

-- 
2.40.1


