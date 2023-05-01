Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751166F36CA
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528079.820669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCQ-0006ID-Dq; Mon, 01 May 2023 19:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528079.820669; Mon, 01 May 2023 19:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCQ-0006FY-Az; Mon, 01 May 2023 19:28:38 +0000
Received: by outflank-mailman (input) for mailman id 528079;
 Mon, 01 May 2023 19:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCP-0006FS-8Q
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:37 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d40efeb-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:28:36 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b5c4c76aaso2032564b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:36 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:33 -0700 (PDT)
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
X-Inumbo-ID: 5d40efeb-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969314; x=1685561314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipls6koA+AeH8J6j2WxgUhcq4mmw5a3NH+J2RY9iS6I=;
        b=eztCo5uQgzZ++c4nibUBiIDXpS2LGO24+qSzaafIbpKx+1BibUdX3vQLCCvqCM9QaK
         k2szVsQtO5BsNtu2gEbwQ2R1Cp8SZWTwumicPfkwsEEQtcvZx+KCA7E9E8yQbBLG/+U1
         YuKydYrLelSrUvEFcJOenbExJISoaZaYCzUq7BQHSqP3uoPFqEPYIMH3FrftdGe1VnOk
         18/QJSaB/qqzmIXnj9u6ae7JwxuEe1M8it5S+Q9K46yajD+0ZkqBf7KewtfRcvygNDOo
         LlI0LPcK+WO/JxG3p9SD85FYmZExm1luEC4PEkLlS1jz538f0/tapw7EjRytIfe2E8ce
         OeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969314; x=1685561314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipls6koA+AeH8J6j2WxgUhcq4mmw5a3NH+J2RY9iS6I=;
        b=KEq7r/fiVwRVpze8Askz1PFxUICXoM21VphjKTszh/jZgSJavPjyuoR6cXZlXQH+D7
         mXswhcMwIO7lOM5yI4EAvsyMZicI57/64IKPAz3SmDHEo3mU8G/0p/OInt/ARjISUOsU
         8Kp7C0sM0N42KgAtmIk+eOvfioKbWZgi8fTIuvr6jl02diG4z8ipSbGMKLDc97+WiMXI
         XJRbAsyPzsPdErLr9B3wJMkdoKJNSEKuuF4h3jBEvU/Hsw0X5H9Dse9K6lvbNu+pOstc
         luDtJf9ZhUPT7twtsPNw9mFe9bZSVLzyEEQmLgBaPx3xGrVcytnva7wIUhgYNEu+xUEN
         6PDA==
X-Gm-Message-State: AC+VfDy4XVkdykWiUNVWKkFNrR6R+eVPTnTyB/NZlij7f8Hq6IhdLjz1
	EKpn1eLTOd350AFhXWLYgbo=
X-Google-Smtp-Source: ACHHUZ4EtcVpfh2GrxC12spi0fGVMtR6JEHjWCZcT25vgipN1a5chaj6S10yX1bBKRrgSrOQ8bpQcQ==
X-Received: by 2002:a17:903:2310:b0:1a6:54ce:4311 with SMTP id d16-20020a170903231000b001a654ce4311mr18428090plh.43.1682969314058;
        Mon, 01 May 2023 12:28:34 -0700 (PDT)
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
Subject: [PATCH v2 00/34] Split ptdesc from struct page
Date: Mon,  1 May 2023 12:27:55 -0700
Message-Id: <20230501192829.17086-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
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

This is rebased on next-20230428.

v2:
  Fix a lot of compiler warning/errors
  Moved definition of ptdesc to outside CONFIG_MMU
  Revert commit 7e25de77bc5ea which had gmap use pmd_pgtable_page()
  Allow functions to preserve const-ness where applicable
  Define folio equivalents for PAGE_TYPE_OPS page functions

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
 include/linux/mm.h                            | 138 +++++++----
 include/linux/mm_types.h                      |  14 --
 include/linux/page-flags.h                    |  20 +-
 include/linux/pgtable.h                       |  61 +++++
 mm/memory.c                                   |   8 +-
 39 files changed, 648 insertions(+), 449 deletions(-)

-- 
2.39.2


