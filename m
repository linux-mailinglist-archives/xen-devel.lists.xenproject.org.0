Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECECB6FF822
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 19:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533491.830234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nS-0002d0-3t; Thu, 11 May 2023 17:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533491.830234; Thu, 11 May 2023 17:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nR-0002am-VN; Thu, 11 May 2023 17:09:41 +0000
Received: by outflank-mailman (input) for mailman id 533491;
 Thu, 11 May 2023 17:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPy6=BA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1px9nQ-0002Li-Ht
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 17:09:40 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c21bbbd-f01e-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 19:09:37 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac79d4858dso94947541fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 10:09:37 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05651c014900b002aa3cff0529sm2443830ljd.74.2023.05.11.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:09:36 -0700 (PDT)
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
X-Inumbo-ID: 9c21bbbd-f01e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824977; x=1686416977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75YVbwcoEhV6c5MmFHSJFEPsCkZJGLQGgPUplClZnLQ=;
        b=OsC105rR0ZNVkg7vGNJd6ytk/frQyk6vIwX7D/9ZQZafRORAjrUbwmIpj/ScdOU3+X
         VuFncD3JgzSxXkLwAsljYYXk7JDwFoogdzcq08gpGiTmqxhcsPJFam8GP3/YATrcmQEZ
         00D6JZZRMmItChSCTdNAYQ0lBPdVTK4dhyLMmmdZU2TF0cZXNk6mNUfS1F6IS1r8Stas
         Z2k31nYL5ckEVnSZnks4jp0d/aJfqpp4rMpJ4pN0H7gaizLDh9cVA0e5qfM9pQuiX9HJ
         zvcqEvyR3SoBYR6JZhl90zsbAMCQsH+jpWSKgGQdRs5k+SJpB8ZB6mUsiiNgCNsbF0Ot
         +jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824977; x=1686416977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75YVbwcoEhV6c5MmFHSJFEPsCkZJGLQGgPUplClZnLQ=;
        b=iX+3PJg6Rr5umPDURZ2YprQrAZL2PZEKWH4rd5Q1hJIgF7xD3jO70S8Db8G8U4gO7g
         hEtYvMbR1QwwGWWkULik3LRPoe4ytZ2Qw1XpS/Ds8PCK2TljvqZ1GAjjh6MCoWJyd+JH
         TYXBJRCh4U2skqo8Ep6mpx6wcyASNJyhtjh96Ovu12+VEeBRDoqZGbEK5C2NbpJcbJVY
         8Iv2BRdGGXT4byCbFbzq0UifueXFyr8rALoXRtBmoGU7ZD36iiYYOl+iKQor+zMGahdW
         iV2vSDbewUfoiYS57xOoeqzsxNmsrnrzCFyKyLRLg8zIhMBnuEL6uBZezizrg+yw/QWb
         Jrmw==
X-Gm-Message-State: AC+VfDwFxKQRsAwDEOwXb54zqYt2StOuE6Pd73owwNjd522QX/tcVohX
	5E4pWmm3IxUqn940PA6Hrj1THsZjS6w=
X-Google-Smtp-Source: ACHHUZ6ZSzuN6D0Y7dcswyHvx7MsYvOAOjDP/rRUDueTRYqjqRsId8YcoMtOapaQTFt/9UsQwU43iw==
X-Received: by 2002:a2e:9dca:0:b0:2ac:795a:5a90 with SMTP id x10-20020a2e9dca000000b002ac795a5a90mr3318934ljj.38.1683824976761;
        Thu, 11 May 2023 10:09:36 -0700 (PDT)
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
Subject: [PATCH v7 0/5] enable MMU for RISC-V
Date: Thu, 11 May 2023 20:09:28 +0300
Message-Id: <cover.1683824347.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/mm.h        |   9 +
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  58 ++++++
 xen/arch/riscv/include/asm/processor.h |   5 +
 xen/arch/riscv/mm.c                    | 277 +++++++++++++++++++++++++
 xen/arch/riscv/setup.c                 |  22 +-
 xen/arch/riscv/xen.lds.S               |   4 +
 10 files changed, 438 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/current.h
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.40.1


