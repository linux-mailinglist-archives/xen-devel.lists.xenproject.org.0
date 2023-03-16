Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5486BD61C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510728.788987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhu-0002yr-NS; Thu, 16 Mar 2023 16:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510728.788987; Thu, 16 Mar 2023 16:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhu-0002vO-Hw; Thu, 16 Mar 2023 16:44:02 +0000
Received: by outflank-mailman (input) for mailman id 510728;
 Thu, 16 Mar 2023 16:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcqhs-0001vH-2U
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:44:00 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02c2b77-c419-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:43:59 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id ek18so10080796edb.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 09:43:59 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 hp12-20020a1709073e0c00b00925ce7c7705sm4019163ejc.162.2023.03.16.09.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:43:58 -0700 (PDT)
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
X-Inumbo-ID: c02c2b77-c419-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678985039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onUwUr6LuHPU/ho1g66l05dUKk1mCFhL1Fbzc0RBt8E=;
        b=jpr+6r5wRQH3RmYxjdu6DZealHW4UGgMxGMqa0wZV8/ZlScQxhjNYRQk4/sVdVu/im
         ojnI87x6QVENrxpXgIIn6nlpt3H6jqHcL2t8b5i/q+4jwq9m76ckYtb7/sEg75SalC67
         0bm1QNaVP4yZIIVDz6bWm8dTz4q2qLj7xoXasZR7XDIxzNKsJcZ0snC2E6BiY+tWUNtj
         yCEe06CIqwgQz58JI4KZA+RX2RcCF2w/O+x4QKO3fe7WknhvVojYRz4neDcjc+qOBz1b
         3LYT55ym21NE17zOZOZwFSOsowSjHu5pwQXjBjbBR7yI6SDQVMzjtAOVZlzhu3mb2G6z
         qYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onUwUr6LuHPU/ho1g66l05dUKk1mCFhL1Fbzc0RBt8E=;
        b=rRBF8V2y2Jo4PBxIlhezEQpU7WnNjwqySUsT7MVq5jltJ53zAKH0ivFcCHqQ0mJIpi
         LPqR+PeRn5RAh00KGQ9IvR9wiXnILNr7d142OW8vrdAT7tVp9CTRylZjkmNxldQHDBVV
         DZwC3fZJzghm35IKH7EE3zAixKNkxMCXKpB1PSUgaxCr15MUhwiPg8fv8h+tKR9fHp86
         bnNGTNpKAhgoxyHFZ/QEGLuLWuqVralflUOhXbh9gIJB8YD7rz56jov1LylcBgBpN8nI
         3WYpFNJj4ldUJAgGCYrgWyBFwfzAeIN44t+nVFRAJrypJ4/1yjfwF+dvpRRHZwCdMIaI
         VFgA==
X-Gm-Message-State: AO0yUKVNsI59MtDmpTcYVFI77HjzRFvsgAFqezjBfpJ3BUDlFTqScZ8U
	gnwij8gbIowSXSRo0lvYE12z9UxT81nSqw==
X-Google-Smtp-Source: AK7set+nfGMhngnKruzzsM3MNYzRQnbyrmVh841QxkQrERnd6qNu4ryIFHhlcIBjilAU5R4glQ012w==
X-Received: by 2002:a17:906:3196:b0:92b:6b6d:2daf with SMTP id 22-20020a170906319600b0092b6b6d2dafmr11047774ejy.77.1678985038679;
        Thu, 16 Mar 2023 09:43:58 -0700 (PDT)
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
Subject: [PATCH v2 0/3] enable MMU for RISC-V
Date: Thu, 16 Mar 2023 18:43:51 +0200
Message-Id: <cover.1678984041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on top of  'RISCV basic exception handling
implementation' patch series. [1]

The patch series introduces the following things:
1. Functionality to build the page tables for Xen that map
   link-time to physical-time location.
2. Check that Xen is less then page size.
3. Check that load addresses don't overlap with linker addresses.
4. Prepare things for proper switch to virtual memory world.
5. Load the built page table into the SATP
6. Enable MMU.

[1] https://lore.kernel.org/xen-devel/cover.1678976127.git.oleksii.kurochko@gmail.com/T/#t

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

 xen/arch/riscv/Makefile           |   1 +
 xen/arch/riscv/include/asm/mm.h   |   8 ++
 xen/arch/riscv/include/asm/page.h |  67 +++++++++++++++++
 xen/arch/riscv/mm.c               | 121 ++++++++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S     |  65 ++++++++++++++++
 xen/arch/riscv/setup.c            |  13 ++--
 xen/arch/riscv/xen.lds.S          |   2 +
 7 files changed, 269 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.39.2


