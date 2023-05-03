Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C976F5C11
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529378.823717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOj-0003rd-R8; Wed, 03 May 2023 16:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529378.823717; Wed, 03 May 2023 16:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOj-0003px-O4; Wed, 03 May 2023 16:32:09 +0000
Received: by outflank-mailman (input) for mailman id 529378;
 Wed, 03 May 2023 16:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1puFOi-0003pe-LE
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:32:08 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac7d538-e9d0-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 18:32:06 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac785015d6so5005641fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 09:32:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h20-20020a2e9ed4000000b002a634bfa224sm6074321ljk.40.2023.05.03.09.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 09:32:04 -0700 (PDT)
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
X-Inumbo-ID: 0ac7d538-e9d0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683131525; x=1685723525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWeR2qcurw4IzjHMr6XJWFzGIGAQGUDuYVTUhmEWiwA=;
        b=UXJ6jF2MYR5jhjvd7sXNNq9wGZuk7Z/kA1pQbsm3a9PjKdqhRsWejMfJ9y7o2FPLmS
         IV7/smydWp6/vfnGWUGpbtMfQ0+w4mnc8KTmf1szhotCEswsrtKn9AEOavqJOhrC/tqE
         cHTZ0r0Uw0iRfE2TZMhrmTiwdlVHJCtSMsll4Are/9MiLGkqN1a73ytgX79wlJlQF4ke
         +sFl4rBzipRzHZokuwX4dGG5TubK/TurL0TtVDPUgK1SpkkmihfSFVW0N8farxL6SUKg
         vjAjo3TdnnnNZcOrx9pkSXC9ol08m5rxiXIEpoNf4gyncLtVX3/W3gzroJAD7I90U9s6
         gbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683131525; x=1685723525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWeR2qcurw4IzjHMr6XJWFzGIGAQGUDuYVTUhmEWiwA=;
        b=PsTE7EORsviiLB8B9g6iYzgpkz6+SDmzKx8U4VXsbT7T0ZXYZ8Ovopnn0MELdARG4E
         Y9jFb2PEShX+DQ6pxDvBbDeVRF+W07SIzk76RFIPJWj3svpZ44chPU1/S4PnuCanJXv9
         LYGUWus9Z427h1C68YVwgxk5Pbh6LXR8kiwns1OMndf51WAzhYJ2ioXZtZ8/AShniMKp
         7ZLQeiFawRh4kXpJYtgEsxUPjHElqSNuOgrtKLvZVgNcyoPMBHGHkpg/VJ0dHfxICVr6
         OShLrjrMdMBZEBeaU9sd5w5IlTUq7IWoULMRtJ8IBTsP75oNKem24n6yj4lYEgQQn56O
         KpLA==
X-Gm-Message-State: AC+VfDxT/pTfyssY7Em16mSqozvBct/zdgtdEfX0s04+Yl7QymRm1G01
	kuy7fLUBgIKJhC3G/w5zOZe5XCiH/vw=
X-Google-Smtp-Source: ACHHUZ7glxPCRwO7qFBhiTeHjIW6cp91jCb1h0bTuP4OpAw0eE7y3beNZGyL2fnKjsEQSFsif8ejkA==
X-Received: by 2002:a05:651c:117:b0:2a6:1682:3a1e with SMTP id a23-20020a05651c011700b002a616823a1emr147641ljb.31.1683131525180;
        Wed, 03 May 2023 09:32:05 -0700 (PDT)
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
Subject: [PATCH v6 0/4] enable MMU for RISC-V
Date: Wed,  3 May 2023 19:31:57 +0300
Message-Id: <cover.1683131359.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Changes in V6:
  - update RV VM layout and related to it things
 	- move PAGE_SHIFT, PADDR_BITS to the top of page-bits.h
 	- cast argument x of pte_to_addr() macros to paddr_t to avoid risk of overflow for RV32
 	- update type of num_levels from 'unsigned long' to 'unsigned int'
 	- define PGTBL_INITIAL_COUNT as ((CONFIG_PAGING_LEVELS - 1) + 1)
 	- update type of permission arguments. changed it from 'unsgined long' to 'unsigned int'
 	- fix code style
 	- switch while 'loop' to 'for' loop
 	- undef HANDLE_PGTBL
 	- clean root page table after MMU is disabled in check_pgtbl_mode_support() function
 	- align __bss_start properly
 	- remove unnecesssary const for paddr_to_pte, pte_to_paddr, pte_is_valid functions
 	- add switch_stack_and_jump macros and use it inside enable_mmu() before jump to
 	  cont_after_mmu_is_enabled() function

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
 xen/arch/riscv/include/asm/config.h    |  44 +++-
 xen/arch/riscv/include/asm/current.h   |  10 +
 xen/arch/riscv/include/asm/mm.h        |   9 +
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  62 +++++
 xen/arch/riscv/mm.c                    | 315 +++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S          |   1 +
 xen/arch/riscv/setup.c                 |  22 +-
 xen/arch/riscv/xen.lds.S               |   4 +
 10 files changed, 469 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/current.h
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.40.1


