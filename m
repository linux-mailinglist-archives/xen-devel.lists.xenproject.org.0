Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0896DAFE1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 17:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519065.806220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkoKV-0001tJ-LO; Fri, 07 Apr 2023 15:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519065.806220; Fri, 07 Apr 2023 15:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkoKV-0001rQ-Hj; Fri, 07 Apr 2023 15:48:47 +0000
Received: by outflank-mailman (input) for mailman id 519065;
 Fri, 07 Apr 2023 15:48:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVqb=76=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pkoKU-0001rE-Hs
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 15:48:46 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad08272b-d55b-11ed-b464-930f4c7d94ae;
 Fri, 07 Apr 2023 17:48:44 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id a44so25247209ljr.10
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 08:48:44 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 v12-20020a2e9f4c000000b00295a583a20bsm874765ljk.74.2023.04.07.08.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:48:42 -0700 (PDT)
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
X-Inumbo-ID: ad08272b-d55b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680882523; x=1683474523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5vGzdg5KR3sFgMIx6uCZ4DHW95hzYjHqWeD/lfZZlE=;
        b=DvyRYkPNMC1FS6LbAG0WIH+w+5ZqtKJkon2VKeUvTeA3MfxSThlGVOFOrMkGX+ibM0
         m6EiRv2Buf7bi0hj9PJuW2UTk/BDLLX4HP7HGGGEnPAORpG7AcezXnPdGgW5Dbz6EE23
         E/lnMv5uJhrkxImToTWgwDA8LUQee052WQbTxsbk83Z4CcH5jbe6Hg57yJbBEz/oqUrF
         Y0m8L31CU9FAov86ikTe6OBcZ5DzkEj9e9HM1m5Nhu+r9WYHZ0yM1L51OCJoFjb7KjaJ
         /flVT5RLe4Vg3xPX5h2B1bXWAuywEBgu9KFzrbu5MTtGjfh1+jgGS/MecoaQWjC+rzjV
         pBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680882523; x=1683474523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5vGzdg5KR3sFgMIx6uCZ4DHW95hzYjHqWeD/lfZZlE=;
        b=G74LdkQI6Bow3HCuaGVOE62zVhKVuaaO5r6b7zD211FzBuJ+suWusHuoH4kxAfqrIR
         ciBuM4rXM1IgFA4lhcAsxfZI3+vL7jx7wY6J1ZsLqTvkhGTvSnVYZkFMABEOSZjP6GI5
         yAXBhUkmBi5qR58twSucAGSTgolMUUGHNRl14grGHLagJX/CZVDKWhzjq/7XLHOOFHFq
         kyBNcNWeTh5ookSpw5G1O1E8BSK9LzItfnhAyOXzKzJ9qXUOYMRE9dAqkUClIrdmDzuk
         9dwjSqvcGf4SLn3QyZan2SPf+YqksnFcsgkB6/hDZiJywEbljwpgYF7AMLTo0s03jWsH
         rZ2g==
X-Gm-Message-State: AAQBX9eFOhLDt7Rs7iPj9jmGPv0O6FYeUIr/5qfbx2tFn1qYd9b2eOWo
	1tMRI8ma1WClXloxNB05ECDboBUZn6Q=
X-Google-Smtp-Source: AKy350YgFmRQ1UTY2zWln2c8Tl1UmqPWJBIhChxvfhk5ZQJuAPi68iEhGpcXUSckFx7SHu+pHMDJBQ==
X-Received: by 2002:a2e:97c1:0:b0:29e:a3a0:ee2f with SMTP id m1-20020a2e97c1000000b0029ea3a0ee2fmr649529ljj.30.1680882522804;
        Fri, 07 Apr 2023 08:48:42 -0700 (PDT)
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
Subject: [PATCH v4 0/3] enable MMU for RISC-V
Date: Fri,  7 Apr 2023 18:48:36 +0300
Message-Id: <cover.1680882176.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on top patches [1] and [2]

The patch series introduces the following things:
1. Functionality to build the page tables for Xen that map
   link-time to physical-time location.
2. Check that Xen is less then page size.
3. Check that load addresses don't overlap with linker addresses.
4. Prepare things for proper switch to virtual memory world.
5. Load the built page table into the SATP
6. Enable MMU.

[1] https://lore.kernel.org/xen-devel/2785518800dce64fafb3096480a5ae4c4e026bcb.1678970065.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/7c066d6dcc0618749df04785b34b93819148087d.1678970065.git.oleksii.kurochko@gmail.com/

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

Oleksii Kurochko (3):
  xen/riscv: introduce setup_initial_pages
  xen/riscv: setup initial pagetables
  xen/riscv: remove dummy_bss variable

 xen/arch/riscv/Makefile                |   1 +
 xen/arch/riscv/include/asm/config.h    |  12 +-
 xen/arch/riscv/include/asm/mm.h        |   9 +
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  65 +++++
 xen/arch/riscv/mm.c                    | 319 +++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S          |   2 +
 xen/arch/riscv/setup.c                 |  22 +-
 xen/arch/riscv/xen.lds.S               |   4 +
 9 files changed, 435 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.39.2


