Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98679668B51
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476495.738698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdP-0005vo-22; Fri, 13 Jan 2023 05:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476495.738698; Fri, 13 Jan 2023 05:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdO-0005sQ-Um; Fri, 13 Jan 2023 05:29:46 +0000
Received: by outflank-mailman (input) for mailman id 476495;
 Fri, 13 Jan 2023 05:29:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdM-0005sJ-Vj
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:29:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 47aff3bf-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:29:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D57FEC;
 Thu, 12 Jan 2023 21:30:23 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 570693F587;
 Thu, 12 Jan 2023 21:29:37 -0800 (PST)
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
X-Inumbo-ID: 47aff3bf-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 00/41] xen/arm: Add Armv8-R64 MPU support to Xen - Part#1
Date: Fri, 13 Jan 2023 13:28:33 +0800
Message-Id: <20230113052914.3845596-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armv8-R architecture profile was designed to support use cases
that have a high sensitivity to deterministic execution. (e.g.
Fuel Injection, Brake control, Drive trains, Motor control etc)

Arm announced Armv8-R in 2013, it is the latest generation Arm
architecture targeted at the Real-time profile. It introduces
virtualization at the highest security level while retaining the
Protected Memory System Architecture (PMSA) based on a Memory
Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
The latest Armv8-R64 document can be found [1]. And the features of
Armv8-R64 architecture:
  - An exception model that is compatible with the Armv8-A model
  - Virtualization with support for guest operating systems
  - PMSA virtualization using MPUs In EL2.
  - Adds support for the 64-bit A64 instruction set.
  - Supports up to 48-bit physical addressing.
  - Supports three Exception Levels (ELs)
        - Secure EL2 - The Highest Privilege
        - Secure EL1 - RichOS (MMU) or RTOS (MPU)
        - Secure EL0 - Application Workloads
 - Supports only a single Security state - Secure.
 - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.

These patch series are implementing the Armv8-R64 MPU support
for Xen, which are based on the discussion of
"Proposal for Porting Xen to Armv8-R64 - DraftC" [2].

We will implement the Armv8-R64 and MPU support in three stages:
1. Boot Xen itself to idle thread, do not create any guests on it.
2. Support to boot MPU and MMU domains on Armv8-R64 Xen.
3. SMP and other advanced features of Xen support on Armv8-R64.

As we have not implemented guest support in part#1 series of MPU
support, Xen can not create any guest in boot time. So in this
patch serie, we provide an extra DNM-commit in the last for users
to test Xen boot to idle on MPU system.

We will split these patches to several parts, this series is the
part#1, v1 is in [3], the full PoC can be found in [4]. More software for
Armv8-R64 can be found in [5];

[1] https://developer.arm.com/documentation/ddi0600/latest
[2] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg00643.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg00289.html
[4] https://gitlab.com/xen-project/people/weic/xen/-/tree/integration/mpu_v2
[5] https://armv8r64-refstack.docs.arm.com/en/v5.0/

Penny Zheng (28):
  xen/mpu: build up start-of-day Xen MPU memory region map
  xen/mpu: introduce helpers for MPU enablement
  xen/mpu: introduce unified function setup_early_uart to map early UART
  xen/arm64: head: Jump to the runtime mapping in enable_mm()
  xen/arm: introduce setup_mm_mappings
  xen/mpu: plump virt/maddr/mfn convertion in MPU system
  xen/mpu: introduce helper access_protection_region
  xen/mpu: populate a new region in Xen MPU mapping table
  xen/mpu: plump early_fdt_map in MPU systems
  xen/arm: move MMU-specific setup_mm to setup_mmu.c
  xen/mpu: implement MPU version of setup_mm in setup_mpu.c
  xen/mpu: initialize frametable in MPU system
  xen/mpu: introduce "mpu,xxx-memory-section"
  xen/mpu: map MPU guest memory section before static memory
    initialization
  xen/mpu: destroy an existing entry in Xen MPU memory mapping table
  xen/mpu: map device memory resource in MPU system
  xen/mpu: map boot module section in MPU system
  xen/mpu: introduce mpu_memory_section_contains for address range check
  xen/mpu: disable VMAP sub-system for MPU systems
  xen/mpu: disable FIXMAP in MPU system
  xen/mpu: implement MPU version of ioremap_xxx
  xen/mpu: free init memory in MPU system
  xen/mpu: destroy boot modules and early FDT mapping in MPU system
  xen/mpu: Use secure hypervisor timer for AArch64v8R
  xen/mpu: move MMU specific P2M code to p2m_mmu.c
  xen/mpu: implement setup_virt_paging for MPU system
  xen/mpu: re-order xen_mpumap in arch_init_finialize
  xen/mpu: add Kconfig option to enable Armv8-R AArch64 support

Wei Chen (13):
  xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
  xen/arm: make ARM_EFI selectable for Arm64
  xen/arm: adjust Xen TLB helpers for Armv8-R64 PMSA
  xen/arm: add an option to define Xen start address for Armv8-R
  xen/arm64: prepare for moving MMU related code from head.S
  xen/arm64: move MMU related code from head.S to head_mmu.S
  xen/arm64: add .text.idmap for Xen identity map sections
  xen/arm: use PA == VA for EARLY_UART_VIRTUAL_ADDRESS on Armv-8R
  xen/arm: decouple copy_from_paddr with FIXMAP
  xen/arm: split MMU and MPU config files from config.h
  xen/arm: move MMU-specific memory management code to mm_mmu.c/mm_mmu.h
  xen/arm: check mapping status and attributes for MPU copy_from_paddr
  xen/mpu: make Xen boot to idle on MPU systems(DNM)

 xen/arch/arm/Kconfig                      |   44 +-
 xen/arch/arm/Makefile                     |   17 +-
 xen/arch/arm/arm64/Makefile               |    5 +
 xen/arch/arm/arm64/head.S                 |  466 +----
 xen/arch/arm/arm64/head_mmu.S             |  399 ++++
 xen/arch/arm/arm64/head_mpu.S             |  394 ++++
 xen/arch/arm/bootfdt.c                    |   13 +-
 xen/arch/arm/domain_build.c               |    4 +
 xen/arch/arm/include/asm/alternative.h    |   15 +
 xen/arch/arm/include/asm/arm64/flushtlb.h |   25 +
 xen/arch/arm/include/asm/arm64/macros.h   |   51 +
 xen/arch/arm/include/asm/arm64/mpu.h      |  174 ++
 xen/arch/arm/include/asm/arm64/sysregs.h  |   77 +
 xen/arch/arm/include/asm/config.h         |  105 +-
 xen/arch/arm/include/asm/config_mmu.h     |  112 +
 xen/arch/arm/include/asm/config_mpu.h     |   25 +
 xen/arch/arm/include/asm/cpregs.h         |    4 +-
 xen/arch/arm/include/asm/cpuerrata.h      |   12 +
 xen/arch/arm/include/asm/cpufeature.h     |    7 +
 xen/arch/arm/include/asm/early_printk.h   |   13 +
 xen/arch/arm/include/asm/fixmap.h         |   28 +-
 xen/arch/arm/include/asm/flushtlb.h       |   22 +
 xen/arch/arm/include/asm/mm.h             |   78 +-
 xen/arch/arm/include/asm/mm_mmu.h         |   77 +
 xen/arch/arm/include/asm/mm_mpu.h         |   54 +
 xen/arch/arm/include/asm/p2m.h            |   27 +-
 xen/arch/arm/include/asm/p2m_mmu.h        |   28 +
 xen/arch/arm/include/asm/processor.h      |   13 +
 xen/arch/arm/include/asm/setup.h          |   39 +
 xen/arch/arm/kernel.c                     |   31 +-
 xen/arch/arm/mm.c                         | 1340 +-----------
 xen/arch/arm/mm_mmu.c                     | 1376 +++++++++++++
 xen/arch/arm/mm_mpu.c                     | 1056 ++++++++++
 xen/arch/arm/p2m.c                        | 2282 +--------------------
 xen/arch/arm/p2m_mmu.c                    | 2257 ++++++++++++++++++++
 xen/arch/arm/p2m_mpu.c                    |  274 +++
 xen/arch/arm/platforms/Kconfig            |   16 +-
 xen/arch/arm/setup.c                      |  394 +---
 xen/arch/arm/setup_mmu.c                  |  391 ++++
 xen/arch/arm/setup_mpu.c                  |  208 ++
 xen/arch/arm/time.c                       |   14 +-
 xen/arch/arm/traps.c                      |    2 +
 xen/arch/arm/xen.lds.S                    |   10 +-
 xen/arch/x86/Kconfig                      |    1 +
 xen/common/Kconfig                        |    6 +
 xen/common/Makefile                       |    2 +-
 xen/include/xen/vmap.h                    |   93 +-
 47 files changed, 7500 insertions(+), 4581 deletions(-)
 create mode 100644 xen/arch/arm/arm64/head_mmu.S
 create mode 100644 xen/arch/arm/arm64/head_mpu.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
 create mode 100644 xen/arch/arm/include/asm/config_mmu.h
 create mode 100644 xen/arch/arm/include/asm/config_mpu.h
 create mode 100644 xen/arch/arm/include/asm/mm_mmu.h
 create mode 100644 xen/arch/arm/include/asm/mm_mpu.h
 create mode 100644 xen/arch/arm/include/asm/p2m_mmu.h
 create mode 100644 xen/arch/arm/mm_mmu.c
 create mode 100644 xen/arch/arm/mm_mpu.c
 create mode 100644 xen/arch/arm/p2m_mmu.c
 create mode 100644 xen/arch/arm/p2m_mpu.c
 create mode 100644 xen/arch/arm/setup_mmu.c
 create mode 100644 xen/arch/arm/setup_mpu.c

-- 
2.25.1


