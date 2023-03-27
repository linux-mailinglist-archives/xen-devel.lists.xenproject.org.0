Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E936CABB5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 19:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515389.798196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgqT2-0004Xg-WD; Mon, 27 Mar 2023 17:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515389.798196; Mon, 27 Mar 2023 17:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgqT2-0004VJ-TA; Mon, 27 Mar 2023 17:17:12 +0000
Received: by outflank-mailman (input) for mailman id 515389;
 Mon, 27 Mar 2023 17:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pgqT1-0004V7-LB
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 17:17:11 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3457a44a-ccc3-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 19:17:09 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id e11so9804003lji.8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 10:17:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2e9804000000b002a03f9ffecesm2463322ljj.89.2023.03.27.10.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:17:07 -0700 (PDT)
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
X-Inumbo-ID: 3457a44a-ccc3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ls9nZ7WlKJ5lShAgqD+7Sylwd3APCPa2spkr26tAeoc=;
        b=VwdMtPdlDl7YEBoMYsSrqNvWpTL1b7VqPiG7RHqMC2NTNgeLnEcN3T/T7o2NB85vDa
         9svzDWlBHXFrLcBA8RWIzJkgqgT9XXxdYNhxQr6KslcTzUnf2qTtOKO9yemIRS7IgaQS
         wlnCtdgqQoEwIX1LhCyJIAarXnKt5FGVPKU0vpeiaH+AjLNLnLYXQe7ErMyKQs9sazVo
         KoPSkUNVtmMma2MZSa+zh5hpNlgM416dVXAxIXXfOpGZxjVyWiQxPOsJ1s9CmW0XvxSh
         k89I8vIBh9d3iUzBTRxiGoLJECAMhBtorXsYPhlE0/8CPK3h5gYlyyb4MdYuE9K5uyQa
         jkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ls9nZ7WlKJ5lShAgqD+7Sylwd3APCPa2spkr26tAeoc=;
        b=OxIwD3wJ1dHfyQrU+8MO8uFTLTGYWHySectylORPqGBGE8qbujI+41lYtJR/cQU3M6
         0DspOo4Icaiw69NyMaf5bO0Ayn+gtjs2sTQiY74tbry7Fez7yQ4tlKiJNEeTUulCtTn5
         OfVr339Tqys7YvOfrAJm0mxtDKOzJEsF1XdKJbCBSZbuhroElHvAF+uXzhFh80rwGLKH
         +tF/waf/s6Sk+zee5sv7XspOSpqYsLkEKN2rRdvDhEHBsC42/IPwsrtolYkCOucDpdaQ
         xJ0o7PwipFYn+8MYGywqnLgLb71A51N//q/XwmN1j6cVv5569xKIuNG9K1jmCKyJFtE0
         MVXA==
X-Gm-Message-State: AAQBX9eh5QBTNzmkybwDE7B1Z0vIlo+gbNnJb6fwXETtFsHfSaI7R7is
	i+JNBIzaRLsGwXji3HJ6VcOTHHa+kuPxeQ==
X-Google-Smtp-Source: AKy350aEcpiU6kruIGPJ2gqEiIpsR0PyOsjBWcpCBLaHqMrwtxdmGtM5Vlgtg/rPiX4fOupt4V1u7Q==
X-Received: by 2002:a2e:8eda:0:b0:2a0:201d:4c32 with SMTP id e26-20020a2e8eda000000b002a0201d4c32mr3621597ljl.30.1679937427997;
        Mon, 27 Mar 2023 10:17:07 -0700 (PDT)
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
Subject: [PATCH v3 0/3] enable MMU for RISC-V
Date: Mon, 27 Mar 2023 20:17:02 +0300
Message-Id: <cover.1679934166.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/config.h    |  15 +-
 xen/arch/riscv/include/asm/mm.h        |   9 +
 xen/arch/riscv/include/asm/page-bits.h |  10 +
 xen/arch/riscv/include/asm/page.h      |  62 ++++++
 xen/arch/riscv/mm.c                    | 277 +++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S          |   2 +
 xen/arch/riscv/setup.c                 |  22 +-
 xen/arch/riscv/xen.lds.S               |   3 +
 9 files changed, 392 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.39.2


