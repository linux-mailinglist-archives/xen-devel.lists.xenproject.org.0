Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B1A05FE9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867479.1279006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpo-0008NH-6X; Wed, 08 Jan 2025 15:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867479.1279006; Wed, 08 Jan 2025 15:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXpo-0008Lm-3h; Wed, 08 Jan 2025 15:19:04 +0000
Received: by outflank-mailman (input) for mailman id 867479;
 Wed, 08 Jan 2025 15:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXpm-0008Lg-Ut
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:03 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e3acc2-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:01 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so173420295e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:01 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:00 -0800 (PST)
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
X-Inumbo-ID: e3e3acc2-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349541; x=1736954341; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/91ShzS8VL58GKpah1RRh06XqBgOzqL+oZTNUXKZWds=;
        b=d7HMslq9yMrFodNd58RHYyE22GSjCiM4a3Mlgq8TvOJHv77B51UansBRyiyxoNWYoN
         IiM1vJcxJTYGm4tQKv+A4d6lgXZqAQVSPGnWhKhKGKGpDVR3fMLjQ5yfkHwKvmmdOWqJ
         PDXTvJmw2rVddpk+TWZKaK6+r1iIc0YSIYVRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349541; x=1736954341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/91ShzS8VL58GKpah1RRh06XqBgOzqL+oZTNUXKZWds=;
        b=UtRv14M9zDGlSt1vQJ1h9DvahS9z+OIpSvrIec9RfZ0LHVz7DniiyT1MndGy2bIdhg
         Zq8iM8z9m/Ydu8iKd6VHGDAC96675jEuDz+LK/ynZO63Xg4mQjEGtF966StLV/NWrlrY
         OXW6JpOHvshzp9JVLpl+qa75QKZ/RuZK0wwzBrX40Fvd+4rVI4J3FAOW1/RU9fGaPiQ6
         gJWF0WSzesZ8Kn81AC76vTkV3ZfNr4fqRVuwoWZJYlIPQLTxP6m6td6XEQsHkdAILicA
         /oM5/4BSu9INR4LMN0unOxT2belPNTyvSd/p1DoKz2uOGAlpCcsbn7teGxG5sAQjbhc/
         vSDA==
X-Gm-Message-State: AOJu0Yz5YxTXgDjpBtaOlzAtYhJ8wzxtbpA4iZFr4wpdq0+C2l0YcZMu
	i0O7zFz5L3gK/WzrfqfIeIIfLFzEyfuGDx8zWQT1Qjw1GYK+hooJGcadLv0UZgJ5gjeM2VpoxjG
	Vju9tdstj
X-Gm-Gg: ASbGncuTC6miXJgJNt0lvqbVqQiVVKozEvAazJ2l/nqAwhHn76HGZ4BxjHwRMk7u3Sm
	6LPsoOrHl13U2XLYakhmnRyZpgYSyazAydbTGm/83nzVF9S1JyQi/ZUpLWIK3QMyTw3rzhRNZoG
	K71n1LZswRdZICUZ9regvolO3fIeUKfNFcjnRH4/pdUAOQXd0oWNrEJmzgEOQtaRSzD420hyF9X
	WeFegpffRYarUEpKROopmkNdOpeQmjuYbKU6Un93+7vNMaAh2r6CfmDitVCWaNnYyqR9aR7FUKd
	CyU=
X-Google-Smtp-Source: AGHT+IFCGBRYIiVVbFLfC0bpoWRZUFKWVz1pMEI1fZRooWck3s+HgSL3+87RD41YSoer0s7rdrmGvg==
X-Received: by 2002:a5d:5f82:0:b0:385:fa26:f0ac with SMTP id ffacd0b85a97d-38a872fc03fmr2911734f8f.7.1736349540826;
        Wed, 08 Jan 2025 07:19:00 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 00/15] Remove the directmap
Date: Wed,  8 Jan 2025 15:18:07 +0000
Message-ID: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I picked v4 of this series and run it through XenRT extensively, fixing crashes
and errors as I hit them. Likewise, I've run it through Gitlab, fixing various
CI failures. I listed all changes per patch. I fixed ARM to the extent that
"Gitlab is happy when CONFIG_ONDEMAND_DIRECTMAP=y", but I didn't go much
further than that.

I _THINK_ I've covered previously unaddressed feedback, but please speak up if
I missed something. Otherwise, same old same old.

Cheers,
Alejandro

============== Original cover letter ==============

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

Alejandro Vallejo (1):
  xen/arm32: Hardwire zeroeth_table_offset to 0 on ARM_32

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

Julien Grall (4):
  xen/x86: Add support for the PMAP
  xen/arm64: mm: Use per-pCPU page-tables
  xen/arm64: Implement a mapcache for arm64
  xen/arm64: Allow the admin to enable/disable the directmap

Wei Liu (2):
  x86/pv: Use copy_domain_page() to manage domheap pages during initrd
    relocation
  x86: Initialize mapcache for PV, HVM, and idle domains

 docs/misc/xen-command-line.pandoc      | 11 ++++
 xen/arch/arm/Kconfig                   |  3 +-
 xen/arch/arm/arm32/mmu/mm.c            |  1 +
 xen/arch/arm/arm64/mmu/mm.c            | 51 ++++++++++++++-
 xen/arch/arm/include/asm/arm32/mm.h    |  8 ---
 xen/arch/arm/include/asm/arm64/mm.h    |  7 +-
 xen/arch/arm/include/asm/domain_page.h | 13 ++++
 xen/arch/arm/include/asm/lpae.h        |  2 +-
 xen/arch/arm/include/asm/mm.h          |  8 +++
 xen/arch/arm/include/asm/mmu/layout.h  | 13 +++-
 xen/arch/arm/include/asm/mmu/mm.h      |  2 +
 xen/arch/arm/mmu/domain_page.c         | 45 +++++++++++--
 xen/arch/arm/mmu/pt.c                  | 12 ++--
 xen/arch/arm/mmu/setup.c               | 23 +++----
 xen/arch/arm/mmu/smpboot.c             | 16 +----
 xen/arch/arm/setup.c                   |  3 +
 xen/arch/x86/Kconfig                   |  1 +
 xen/arch/x86/domain.c                  | 13 +++-
 xen/arch/x86/domain_page.c             | 80 ++++++++++++++++------
 xen/arch/x86/include/asm/config.h      | 10 ++-
 xen/arch/x86/include/asm/domain.h      | 15 +++--
 xen/arch/x86/include/asm/fixmap.h      | 31 +++++++++
 xen/arch/x86/include/asm/mm.h          |  6 ++
 xen/arch/x86/include/asm/pmap.h        | 35 ++++++++++
 xen/arch/x86/mm.c                      | 13 ++++
 xen/arch/x86/pv/dom0_build.c           | 70 ++++++++++++++------
 xen/arch/x86/pv/domain.c               | 44 +++++++++++--
 xen/arch/x86/setup.c                   | 91 +++++++++++++++++++++++---
 xen/arch/x86/spec_ctrl.c               |  7 ++
 xen/arch/x86/x86_64/asm-offsets.c      |  1 +
 xen/arch/x86/x86_64/entry.S            |  9 ++-
 xen/common/Kconfig                     | 22 +++++++
 xen/common/page_alloc.c                | 68 ++++++++++++++++---
 xen/include/xen/mm.h                   | 11 ++++
 34 files changed, 613 insertions(+), 132 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/domain_page.h
 create mode 100644 xen/arch/x86/include/asm/pmap.h

-- 
2.47.1


