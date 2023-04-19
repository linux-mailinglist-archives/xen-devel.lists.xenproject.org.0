Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7E6E7E94
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523576.813767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xP-0001yI-Hv; Wed, 19 Apr 2023 15:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523576.813767; Wed, 19 Apr 2023 15:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xP-0001up-E1; Wed, 19 Apr 2023 15:42:55 +0000
Received: by outflank-mailman (input) for mailman id 523576;
 Wed, 19 Apr 2023 15:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pp9xN-0001fS-Nq
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:42:53 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7f15698-dec8-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 17:42:51 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id h8so18879865ljf.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 08:42:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f3-20020a2e6a03000000b00298dc945e9bsm2945367ljc.125.2023.04.19.08.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 08:42:50 -0700 (PDT)
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
X-Inumbo-ID: d7f15698-dec8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681918971; x=1684510971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9Im33ejIUp7ApAAW/Ua4ZyW06n6nVeWXflx7lL6ZEM=;
        b=rd4a1AN3oWPZ6y22KK4Flk/1/D9CGdXd5tyPAB6U4Lx+sw6bedkIdEHH2kmMp3lpQZ
         ATgRl7K1MT6ApV1vT0Zz3HoJODR//jiQCkrbO4Wu+OVvgH3bCZVWPU++k/74OZqszNmm
         wkdrjkO0oa9rbze3PED7DLMeg7EMuWghY/tmWXNPVYoO5Vb8VcTAWgcCZ6eF48MB+aBu
         ivnVliPJadsrINW6QRPDupZrBB/uXnPXq4f8XH4+WrCshuL+Xoj/2VjFdMBMfvWoO/fr
         oqDoU57wPuOpymQb1Miei9rAuK1iU8bSUZ2WcNMX7/P897jAyvCQHbbJ4mnm00NHqIks
         Mf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681918971; x=1684510971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9Im33ejIUp7ApAAW/Ua4ZyW06n6nVeWXflx7lL6ZEM=;
        b=SmD4g8B7jj6MRZky8atmQHPjN2PgDJs4qgqE/nDaW+Lmgnq4uXrjhNYDoeXvTSk0Ez
         dOm5d8VU7kUrWUt2AnQgyipWe8zPm1qm3GFqI07zRhTtWggvxx7NekS7odE2x+3IcN6A
         1wsDE7VLC5C/HCf/ceZgc+6fxVHn27qxSUmF3pVZTN2eQmuWAKRCFbULuyvSGDQGxfxj
         4W7KRhQ2iYKIMvrcaeS5Q98Ab0wU//czt4VGXZVnlcLoVbMCjmBQ6bv3WpF4KcuFCNHQ
         aOnYOkRZTduSTyYpkmaW94pzZcUDwXP5dH1OWaSS9Zlmn1O3keYiny7hp8GFaDJ+MGjM
         3B9w==
X-Gm-Message-State: AAQBX9cfJ8txzANmT63fdEfPz02LKSCLMNTjey72HUgziCQgpNdrP7qG
	Ah9XjsOWvB8SCKi0mBMa8/UJiozbOgk=
X-Google-Smtp-Source: AKy350YvXotrsrOAfp1KIsVtnNfTmiB4HcxPkAUCpXC9hm8f/HY0ULz/E8RXXc9AohmAk7p8eUw2VQ==
X-Received: by 2002:a2e:9091:0:b0:2a7:6e12:f75a with SMTP id l17-20020a2e9091000000b002a76e12f75amr2080863ljg.53.1681918970586;
        Wed, 19 Apr 2023 08:42:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 0/4] enable MMU for RISC-V
Date: Wed, 19 Apr 2023 18:42:43 +0300
Message-Id: <cover.1681918194.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following things:
1. Functionality to build the page tables for Xen that map
   link-time to physical-time location.
2. Check that Xen is less then page size.
3. Check that load addresses don't overlap with linker addresses.
4. Prepare things for proper switch to virtual memory world.
5. Load the built page table into the SATP
6. Enable MMU.

---
Changes in V5:
  * rebase the patch series on top of current staging
  * Update cover letter: it was removed the info about the patches on which
    MMU patch series is based as they were merged to staging
  * add new patch with description of VM layout for RISC-V2
  * Indent fields of pte_t struct
	* Rename addr_to_pte() and ppn_to_paddr() to match their content
---
Changes in V4:
  * use GB() macros instead of defining SZ_1G
  * hardcode XEN_VIRT_START and add comment (ADDRESS_SPACE_END + 1 - GB(1))
  * remove unnecessary 'asm' word at the end of #error
  * encapsulate pte_t definition in a struct
  * rename addr_to_ppn() to ppn_to_paddr().
  * change type of paddr argument from const unsigned long to paddr_t
  * pte_to_paddr() update prototype.
  * calculate size of Xen binary based on an amount of page tables
  * use unsgined int instead of 'uint32_t' instead of uint32_t as
    their use isn't warranted.
  * remove extern of bss_{start,end} as they aren't used in mm.c anymore
  * fix code style
  * add argument for HANDLE_PGTBL macros instead of curr_lvl_num variable
  * make enable_mmu() as noinline to prevent under link-time optimization
    because of the nature of enable_mmu()
  * add function to check that SATP_MODE is supported.
  * update the commit message
  * update setup_initial_pagetables to set correct PTE flags in one pass
    instead of calling setup_pte_permissions after setup_initial_pagetables()
    as setup_initial_pagetables() isn't used to change permission flags.
---
Changes in V3:
  * Update the cover letter message: the patch series isn't depend on
    [ RISC-V basic exception handling implementation ] as it was decied
    to enable MMU before implementation of exception handling. Also MMU
    patch series is based on two other patches which weren't merged [1]
    and [2]
  - Update the commit message for [ [PATCH v3 1/3]
    xen/riscv: introduce setup_initial_pages ].
  - update definition of pte_t structure to have a proper size of pte_t in case of RV32.
  - update asm/mm.h with new functions and remove unnecessary 'extern'.
  - remove LEVEL_* macros as only XEN_PT_LEVEL_* are enough.
  - update paddr_to_pte() to receive permissions as an argument.
  - add check that map_start & pa_start is properly aligned.
  - move  defines PAGETABLE_ORDER, PAGETABLE_ENTRIES, PTE_PPN_SHIFT to <asm/page-bits.h>
  - Rename PTE_SHIFT to PTE_PPN_SHIFT
  - refactor setup_initial_pagetables: map all LINK addresses to LOAD addresses and after
    setup PTEs permission for sections; update check that linker and load addresses don't
    overlap.
  - refactor setup_initial_mapping: allocate pagetable 'dynamically' if it is necessary.
  - rewrite enable_mmu in C; add the check that map_start and pa_start are aligned on 4k
    boundary.
  - update the comment for setup_initial_pagetable funcion
  - Add RV_STAGE1_MODE to support different MMU modes.
  - update the commit message that MMU is also enabled here
  - set XEN_VIRT_START very high to not overlap with load address range
  - align bss section
---
Changes in V2:
  * Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
    introduce instead of them XEN_PT_LEVEL_*() and LEVEL_*
  * Rework pt_linear_offset() and pt_index based on  XEN_PT_LEVEL_*()
  * Remove clear_pagetables() functions as pagetables were zeroed during
    .bss initialization
  * Rename _setup_initial_pagetables() to setup_initial_mapping()
  * Make PTE_DEFAULT equal to RX.
  * Update prototype of setup_initial_mapping(..., bool writable) -> 
    setup_initial_mapping(..., UL flags)  
  * Update calls of setup_initial_mapping according to new prototype
  * Remove unnecessary call of:
    _setup_initial_pagetables(..., load_addr_start, load_addr_end, load_addr_start, ...)
  * Define index* in the loop of setup_initial_mapping
  * Remove attribute "__attribute__((section(".entry")))" for setup_initial_pagetables()
    as we don't have such section
  * make arguments of paddr_to_pte() and pte_is_valid() as const.
  * use <xen/kernel.h> instead of declaring extern unsigned long _stext, 0etext, _srodata, _erodata
  * update  'extern unsigned long __init_begin' to 'extern unsigned long __init_begin[]'
  * use aligned() instead of "__attribute__((__aligned__(PAGE_SIZE)))"
  * set __section(".bss.page_aligned") for page tables arrays
  * fix identatations
  * Change '__attribute__((section(".entry")))' to '__init'
  * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0); in
    setup_inital_mapping() as they should be already aligned.
  * Remove clear_pagetables() as initial pagetables will be
    zeroed during bss initialization
  * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
    as there is no such section in xen.lds.S
  * Update the argument of pte_is_valid() to "const pte_t *p"
  * Remove patch "[PATCH v1 3/3] automation: update RISC-V smoke test" from the patch series
    as it was introduced simplified approach for RISC-V smoke test by Andrew Cooper
  * Add patch [[xen/riscv: remove dummy_bss variable] as there is no any sense in
    dummy_bss variable after introduction of inittial page tables.
---

Oleksii Kurochko (4):
  xen/riscv: add VM space layout
  xen/riscv: introduce setup_initial_pages
  xen/riscv: setup initial pagetables
  xen/riscv: remove dummy_bss variable

 xen/arch/riscv/Makefile                |   1 +
 xen/arch/riscv/include/asm/config.h    |  43 +++-
 xen/arch/riscv/include/asm/mm.h        |   9 +
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  63 +++++
 xen/arch/riscv/mm.c                    | 319 +++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S          |   2 +
 xen/arch/riscv/setup.c                 |  22 +-
 xen/arch/riscv/xen.lds.S               |   4 +
 9 files changed, 464 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.39.2


