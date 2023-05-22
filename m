Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D470BD6B
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537878.837475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V2-0000aq-Ty; Mon, 22 May 2023 12:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537878.837475; Mon, 22 May 2023 12:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V2-0000XU-R9; Mon, 22 May 2023 12:18:52 +0000
Received: by outflank-mailman (input) for mailman id 537878;
 Mon, 22 May 2023 12:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q14V1-0000XN-G2
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:18:51 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf3a08f8-f89a-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 14:18:50 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so2768429e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:18:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004f26aabbd6asm961120lft.130.2023.05.22.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 05:18:48 -0700 (PDT)
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
X-Inumbo-ID: cf3a08f8-f89a-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757930; x=1687349930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Mep4fqU20J6OtORroOetFURSGKFcHgL+B0ajvu4ad4=;
        b=NUnayCIPDW8FvhCjttV7QKRCUl87wwhoxlbCu7QVTF6FHyLVZl2MrXxcgfkfHKzxsc
         kbeJ2AniKGd8fBhiagRcU39Vq49yhDfdPVTdHte/cu8C+FQS0+bfEv9V/mrNU4CHnkbO
         F17+Gle3ipPFM/PfGpmZXdEbEFB0uJdnvVrPHnX580+oLkin52YMznqmZaEe6A+E6cXy
         olQZypcIeWRCJIQzX9eTiV2JMklf6StNOzklgA/+CY+1N62Gop6/87JjnTU6PGatpOad
         WwGIBgNeXQNl9NyJlTbsv+M2muidgL15gPaFXK89J6usEAmFSflOoNWeFxuFFOSwGsQJ
         fGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757930; x=1687349930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Mep4fqU20J6OtORroOetFURSGKFcHgL+B0ajvu4ad4=;
        b=EOaikeCm1HIHTvxtc2ZJB7Pg+DdEa/EEJ2NeSlchHK4nFXIQs71KAqMuavFvFa+3d6
         Ljgwzqj5GEq/5bUZLnI0+WoBQtUAfYy6T9LJ4mcnLZ/YlNfL51I2+4YmCv/f4PgkJsdS
         Dk//zVfcPCQGB6kqSwl/q/N0MYk8ZhvmqLxQoaMISOkauw73uGGdNXics9TIw0pvvDQg
         kDpFb/1zh7YN8Rk1+vLsQzASfcbIdS+PcqGQrCK9LeIWQ1dM7QXcqqv2lOsEHCpiAkg2
         1q8/EY6B4r+X1GnEU0kKRGnNKX5Lbfs9REfA3Ba37IHh8krNj9P1qB6B5kqDn0cX+NrN
         vucg==
X-Gm-Message-State: AC+VfDxm3Ym/ULRKhkiT/NXyWrbtbVJ7DZiDgkY9psd5I345AXtwlqiu
	LAaDvFBsTkQE4wpwG55sPTYfYPzjcPg=
X-Google-Smtp-Source: ACHHUZ5DzSmhlM1E/ZdaEQ0hKL6cNoOY3qU7hdIFpMpX2NSUS6UT6gH0Yap56ZQ9nVqrQsqdXwyrXQ==
X-Received: by 2002:ac2:4a85:0:b0:4f1:3eea:eaf9 with SMTP id l5-20020ac24a85000000b004f13eeaeaf9mr3516481lfp.24.1684757929287;
        Mon, 22 May 2023 05:18:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 0/5] enable MMU for RISC-V
Date: Mon, 22 May 2023 15:18:41 +0300
Message-Id: <cover.1684757267.git.oleksii.kurochko@gmail.com>
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
Changes in V8:
	- Add "#ifdef RV_STAGE1_MODE == SATP_MODE_SV39" instead of "#ifdef SV39"
	  in the comment to VM layout description.
	- Update the upper bound of direct map area in VM layout description.
	- Add parentheses for lvl in pt_index() macros.
	- introduce macros paddr_to_pfn() and pfn_to_paddr() and use them inside
	  paddr_to_pte()/pte_to_paddr().
	- Remove "__" in sfence_vma() and add blanks inside the parentheses of
	  asm volatile.
	- Parenthesize the two & against the || at the start of setup_initial_mapping()
	  function.
	- Code style fixes.
	- Remove ". = ALIGN(PAGE_SIZE);" before "*(.bss.page_aligned)" in vmlinux.lds.S
	  file as .bss.page_aligned specifies proper alignment themselves.
---
Changes in V7:
	- Fix range of frametable range in RV64 layout.
	- Add ifdef SV39 to the RV64 layout comment to make it explicit that
    description if for SV39 mode.
	- Add missed row in the RV64 layout table.
 	- define CONFIG_PAGING_LEVELS=2 for SATP_MODE_SV32.
 	- update switch_stack_and_jump macros(): add constraint 'X' for fn,
    memory clobber and wrap into do {} while ( false ).
 	- add noreturn to definition of enable_mmu().
 	- update pt_index() to "(pt_linear_offset(lvl, (va)) & VPN_MASK)".
 	- expand macros pte_to_addr()/addr_to_pte() in paddr_to_pte() and
    pte_to_paddr() functions and after drop them.
 	- remove inclusion of <asm/config.h>.
 	- update commit message around definition of PGTBL_INITIAL_COUNT.
 	- remove PGTBL_ENTRY_AMOUNT and use PAGETABLE_ENTRIES instead.
 	- code style fixes
 	- remove permission argument of setup_initial_mapping() function
 	- remove calc_pgtbl_lvls_num() as it's not needed anymore after definition
    of CONFIG_PAGING_LEVELS
 	- introduce sfence_vma()
 	- remove satp_mode argument from check_pgtbl_mode_support() and use
    RV_STAGE1_MODE directly instead.
 	- change .align to .p2align
 	- drop inclusion of <asm/asm-offsets.h> from head.S. This change isn't
    necessary for the current patch series.
 	- create a separate patch for xen.lds.S.
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

Oleksii Kurochko (5):
  xen/riscv: add VM space layout
  xen/riscv: introduce setup_initial_pages
  xen/riscv: align __bss_start
  xen/riscv: setup initial pagetables
  xen/riscv: remove dummy_bss variable

 xen/arch/riscv/Makefile                |   1 +
 xen/arch/riscv/include/asm/config.h    |  50 ++++-
 xen/arch/riscv/include/asm/current.h   |  11 +
 xen/arch/riscv/include/asm/mm.h        |  14 ++
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  61 ++++++
 xen/arch/riscv/include/asm/processor.h |   5 +
 xen/arch/riscv/mm.c                    | 277 +++++++++++++++++++++++++
 xen/arch/riscv/setup.c                 |  22 +-
 xen/arch/riscv/xen.lds.S               |   5 +-
 10 files changed, 446 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/current.h
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.40.1


