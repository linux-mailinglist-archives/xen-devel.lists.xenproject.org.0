Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7E718BEB
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542008.845374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPV-000727-WC; Wed, 31 May 2023 21:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542008.845374; Wed, 31 May 2023 21:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPV-0006zW-TA; Wed, 31 May 2023 21:31:13 +0000
Received: by outflank-mailman (input) for mailman id 542008;
 Wed, 31 May 2023 21:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPV-0006zB-2p
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:13 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75d6fa66-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:10 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-565e6beb7aaso732537b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:09 -0700 (PDT)
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
X-Inumbo-ID: 75d6fa66-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568670; x=1688160670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wjb7mkxds2Oxu0tDA//mCadvcwpJnafWf0cD82pJKQE=;
        b=nYeBH5p3+Qt6FUJ38UmFIxO7emaaMGST1TXgppBSGlquoGi0Vu88EMjm0R/stdK090
         rAkGmKWr2iOmn9u+Pb/kM3qRzmk4mZo0E/qCXj+6fXwb5xT2cyvDopKHOf2mbUaUTVkW
         IZJWedT+tZ8ojnhcwbCb2MsICPKO3NlZEBtylSK1ToQ7f9kqjkh5/U5nwImpNeor9qu5
         IqgnJLTK4zE+DQC6rph9ulLyMVpd89EilRZG10pjBGo7K+adbGLVnpAlHyiTcC9wvrmA
         MF9mV19ie8UWuPHO/B2dxtGuMvy+vvJd/sRqVo6b1JEZ5k0xW/bO1/+Ig0OmF8ty3QFr
         I20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568670; x=1688160670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wjb7mkxds2Oxu0tDA//mCadvcwpJnafWf0cD82pJKQE=;
        b=eKo0Kjvt0Ft7MNcsCxRdPmYjfUutf6PfTzLTai3z0cTLMeUKT3/aP5DwtsKxr/jlli
         h0y8pxZqwcDX2q+LMAgXvu0Rfzcc9jMWuMbyrI6otjvXwBmreP44hz0PpNgW09zvTdkv
         09T1esOJrBsYVRJpQqDgeUbxQBBKJREDJy27gze+9kTecVautP54suLXyE4zY4RO3F+Q
         HNjaYdrbJ+XZMyHptRd7uLSf2WtH4Kb4eZZZv1Rx0NrY4gRys8TFoGZJCsH8LZk1FGCr
         GAneJSyllYTl/mKVx1WIGvEAtkwwJOqWq5nHLaDw5Nm1Gf6ppTMGwxIWJtZodOiowFfR
         d4HA==
X-Gm-Message-State: AC+VfDwQVV2dRL0W7p2gjJy/Iko+uWNZiptNa316zLUk3rd72PPlHZKH
	mDQCDnYFn/1gVvMI+wSFBIg=
X-Google-Smtp-Source: ACHHUZ5BOuY9ns1UExUd8Gqiz8IGTSQZuNKoj5s1mEJ0QIzwi0ShIzlk0w6m3uPiq99qwG8NM2Rw1w==
X-Received: by 2002:a0d:df51:0:b0:55a:3560:8ee0 with SMTP id i78-20020a0ddf51000000b0055a35608ee0mr6881175ywe.20.1685568669613;
        Wed, 31 May 2023 14:31:09 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"David S. Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 00/34] Split ptdesc from struct page
Date: Wed, 31 May 2023 14:29:58 -0700
Message-Id: <20230531213032.25338-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MM subsystem is trying to shrink struct page. This patchset
introduces a memory descriptor for page table tracking - struct ptdesc.

This patchset introduces ptdesc, splits ptdesc from struct page, and
converts many callers of page table constructor/destructors to use ptdescs.

Ptdesc is a foundation to further standardize page tables, and eventually
allow for dynamic allocation of page tables independent of struct page.
However, the use of pages for page table tracking is quite deeply
ingrained and varied across archictectures, so there is still a lot of
work to be done before that can happen.

This is rebased on next-20230531.

v3:
  Got an Acked-by
  Fixed the arm64 compilation issue
  Rename some ptdesc utility functions to be pagetable_* instead
  Add some comments to functions describing their uses

Vishal Moola (Oracle) (34):
  mm: Add PAGE_TYPE_OP folio functions
  s390: Use _pt_s390_gaddr for gmap address tracking
  s390: Use pt_frag_refcount for pagetables
  pgtable: Create struct ptdesc
  mm: add utility functions for ptdesc
  mm: Convert pmd_pgtable_page() to pmd_ptdesc()
  mm: Convert ptlock_alloc() to use ptdescs
  mm: Convert ptlock_ptr() to use ptdescs
  mm: Convert pmd_ptlock_init() to use ptdescs
  mm: Convert ptlock_init() to use ptdescs
  mm: Convert pmd_ptlock_free() to use ptdescs
  mm: Convert ptlock_free() to use ptdescs
  mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
  powerpc: Convert various functions to use ptdescs
  x86: Convert various functions to use ptdescs
  s390: Convert various gmap functions to use ptdescs
  s390: Convert various pgalloc functions to use ptdescs
  mm: Remove page table members from struct page
  pgalloc: Convert various functions to use ptdescs
  arm: Convert various functions to use ptdescs
  arm64: Convert various functions to use ptdescs
  csky: Convert __pte_free_tlb() to use ptdescs
  hexagon: Convert __pte_free_tlb() to use ptdescs
  loongarch: Convert various functions to use ptdescs
  m68k: Convert various functions to use ptdescs
  mips: Convert various functions to use ptdescs
  nios2: Convert __pte_free_tlb() to use ptdescs
  openrisc: Convert __pte_free_tlb() to use ptdescs
  riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
  sh: Convert pte_free_tlb() to use ptdescs
  sparc64: Convert various functions to use ptdescs
  sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
  um: Convert {pmd, pte}_free_tlb() to use ptdescs
  mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers

 Documentation/mm/split_page_table_lock.rst    |  12 +-
 .../zh_CN/mm/split_page_table_lock.rst        |  14 +-
 arch/arm/include/asm/tlb.h                    |  12 +-
 arch/arm/mm/mmu.c                             |   6 +-
 arch/arm64/include/asm/tlb.h                  |  14 +-
 arch/arm64/mm/mmu.c                           |   7 +-
 arch/csky/include/asm/pgalloc.h               |   4 +-
 arch/hexagon/include/asm/pgalloc.h            |   8 +-
 arch/loongarch/include/asm/pgalloc.h          |  27 ++-
 arch/loongarch/mm/pgtable.c                   |   7 +-
 arch/m68k/include/asm/mcf_pgalloc.h           |  41 ++--
 arch/m68k/include/asm/sun3_pgalloc.h          |   8 +-
 arch/m68k/mm/motorola.c                       |   4 +-
 arch/mips/include/asm/pgalloc.h               |  31 +--
 arch/mips/mm/pgtable.c                        |   7 +-
 arch/nios2/include/asm/pgalloc.h              |   8 +-
 arch/openrisc/include/asm/pgalloc.h           |   8 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |  10 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  32 +--
 arch/powerpc/mm/pgtable-frag.c                |  46 ++--
 arch/riscv/include/asm/pgalloc.h              |   8 +-
 arch/riscv/mm/init.c                          |  16 +-
 arch/s390/include/asm/pgalloc.h               |   4 +-
 arch/s390/include/asm/tlb.h                   |   4 +-
 arch/s390/mm/gmap.c                           | 222 +++++++++++-------
 arch/s390/mm/pgalloc.c                        | 126 +++++-----
 arch/sh/include/asm/pgalloc.h                 |   9 +-
 arch/sparc/mm/init_64.c                       |  17 +-
 arch/sparc/mm/srmmu.c                         |   5 +-
 arch/um/include/asm/pgalloc.h                 |  18 +-
 arch/x86/mm/pgtable.c                         |  46 ++--
 arch/x86/xen/mmu_pv.c                         |   2 +-
 include/asm-generic/pgalloc.h                 |  62 +++--
 include/asm-generic/tlb.h                     |  11 +
 include/linux/mm.h                            | 155 ++++++++----
 include/linux/mm_types.h                      |  14 --
 include/linux/page-flags.h                    |  20 +-
 include/linux/pgtable.h                       |  61 +++++
 mm/memory.c                                   |   8 +-
 39 files changed, 665 insertions(+), 449 deletions(-)

-- 
2.40.1


