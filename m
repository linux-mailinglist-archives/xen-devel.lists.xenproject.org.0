Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C092673D65D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554954.866423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0T-0007h3-JG; Mon, 26 Jun 2023 03:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554954.866423; Mon, 26 Jun 2023 03:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0T-0007eu-GE; Mon, 26 Jun 2023 03:35:13 +0000
Received: by outflank-mailman (input) for mailman id 554954;
 Mon, 26 Jun 2023 03:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0R-0007ej-K7
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 726f0ddd-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751C61FB;
 Sun, 25 Jun 2023 20:35:51 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C40EE3F64C;
 Sun, 25 Jun 2023 20:35:03 -0700 (PDT)
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
X-Inumbo-ID: 726f0ddd-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 00/52] xen/arm: Add Armv8-R64 MPU support to Xen - Part#1
Date: Mon, 26 Jun 2023 11:33:51 +0800
Message-Id: <20230626033443.2943270-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

So sorry for the long long wait before v3 serie, since I got sidetracked to
a new high priority internal project for quite a time.

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
1. Support to boot MMU domains on Armv8-R64 Xen.
2. Support to boot MPU domains on Armv8-R64 Xen.
3. SMP and other advanced features of Xen support on Armv8-R64.

For having a overall undestanding for reviewers about MPU framework on Xen,
we have introduced a large patch serie here, including 52 commits. At this
stage, we could successfully boot a linux guest on FVP_BaseR_AEMv8R
model[3].

We will split these patches to several parts, this series is the
part#1, v1 is in [4], the full PoC can be found in [5]. More software for
Armv8-R64 can be found in [6];

[1] https://developer.arm.com/documentation/ddi0600/latest
[2] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg00643.html
[3] https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
[4] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg00289.html
[5] https://gitlab.com/xen-project/people/weic/xen/-/tree/integration/mpu_v3
[6] https://armv8r64-refstack.docs.arm.com/en/v5.0/

Penny Zheng (41):
  xen/arm: introduce CONFIG_HAS_MMU
  xen/arm: mmu: fold FIXMAP into MMU system
  xen/mmu: extract early uart mapping from setup_fixmap
  xen/mmu: move MMU-specific setup_mm to mmu/setup.c
  xen: make VMAP only support in MMU system
  xen/mmu: relocate copy_from_paddr into setup.c
  xen/arm: do not give memory back to static heap
  xen/arm: only map the init text section RW in free_init_memory
  xen/arm: switch to use ioremap_xxx in common file
  xen/mmu: move MMU specific P2M code to mmu/p2m.c and mmu/p2m.h
  xen: introduce CONFIG_HAS_PAGING_MEMPOOL
  xen/mmu: enable SMMU subsystem only in MMU
  xen/mpu: build up start-of-day Xen MPU memory region map
  xen/mpu: introduce helpers for MPU enablement
  xen/mpu: map early uart when earlyprintk on
  xen/mpu: introduce setup_mm_mappings
  xen/mpu: plump virt/maddr conversion in MPU system
  xen/mpu: introduce a pair helper
    read_protection_region()/write_protection_region()
  xen/mpu: populate a new region in Xen MPU mapping table
  xen/mpu: make early_fdt_map support in MPU systems
  xen/mpu: implement MPU version of setup_mm in mpu/setup.c
  xen/mpu: initialize frametable in MPU system
  xen/mpu: destroy an existing entry in Xen MPU memory mapping table
  xen/arm: map static memory on demand
  xen/mpu: implememt ioremap_xxx in MPU
  xen/mpu: implement MPU version of copy_from_paddr
  xen/mpu: map domain page in MPU system
  xen/mpu: support free_init_memory in MPU system
  xen/mpu: implement remove_early_mappings in MPU system
  xen/mpu: Use secure hypervisor timer in MPU system
  xen/mpu: implement setup_virt_paging for MPU system
  xen/mpu: configure VSTCR_EL2 in MPU system
  xen/mpu: P2M initialization in MPU system
  xen/mpu: insert an new entry into guest physmap in MPU system
  xen/mpu: look up entry in p2m table
  xen/mpu: support vcpu context switch in MPU system
  xen/mpu: enable MMIO region trap in MPU system
  xen/mpu: enable device passthrough in MPU system
  xen/mpu: dump debug message in MPU system
  xen/mpu: create stubs of function/variables for UNSUPPORTED features
  xen/arm: add Kconfig option CONFIG_HAS_MPU to enable MPU system
    support

Wei Chen (11):
  xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
  xen/arm: make ARM_EFI selectable for Arm64
  xen/arm: add an option to define Xen start address for Armv8-R
  xen/arm: add .text.idmap in ld script for Xen identity map sections
  xen/arm64: head: Introduce enable_boot_mmu and enable_runtime_mmu
  xen/arm64: prepare for moving MMU related code from head.S
  xen/arm64: move MMU related code from head.S to mmu/head.S
  xen/arm: use PA == VA for EARLY_UART_VIRTUAL_ADDRESS on MPU systems
  xen/arm: Move MMU related definitions from config.h to mmu/layout.h
  xen/mmu: extract mmu-specific codes from mm.c/mm.h
  xen/arm: create mpu/layout.h for MPU related address definitions

 xen/arch/arm/Kconfig                     |   52 +-
 xen/arch/arm/Kconfig.debug               |    7 +
 xen/arch/arm/Makefile                    |   15 +-
 xen/arch/arm/arm32/head.S                |    2 +-
 xen/arch/arm/arm64/Makefile              |    7 +-
 xen/arch/arm/arm64/head.S                |  472 +-----
 xen/arch/arm/arm64/mmu/head.S            |  463 ++++++
 xen/arch/arm/arm64/{ => mmu}/mm.c        |    7 +-
 xen/arch/arm/arm64/mpu/head.S            |  255 ++++
 xen/arch/arm/arm64/smpboot.c             |    6 +-
 xen/arch/arm/bootfdt.c                   |    2 +-
 xen/arch/arm/domain.c                    |    2 +
 xen/arch/arm/domain_build.c              |    2 +
 xen/arch/arm/include/asm/arm64/macros.h  |   51 +
 xen/arch/arm/include/asm/arm64/mm.h      |    7 +-
 xen/arch/arm/include/asm/arm64/mpu.h     |  140 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |   76 +
 xen/arch/arm/include/asm/config.h        |  129 +-
 xen/arch/arm/include/asm/cpufeature.h    |    7 +
 xen/arch/arm/include/asm/early_printk.h  |   20 +
 xen/arch/arm/include/asm/fixmap.h        |   31 +-
 xen/arch/arm/include/asm/mm.h            |   79 +-
 xen/arch/arm/include/asm/mmu/layout.h    |  141 ++
 xen/arch/arm/include/asm/mmu/mm.h        |   54 +
 xen/arch/arm/include/asm/mmu/p2m.h       |   18 +
 xen/arch/arm/include/asm/mpu/layout.h    |   32 +
 xen/arch/arm/include/asm/mpu/mm.h        |   36 +
 xen/arch/arm/include/asm/mpu/p2m.h       |   18 +
 xen/arch/arm/include/asm/p2m.h           |   48 +-
 xen/arch/arm/include/asm/page.h          |   46 +-
 xen/arch/arm/include/asm/processor.h     |   14 +
 xen/arch/arm/include/asm/setup.h         |   16 +-
 xen/arch/arm/kernel.c                    |   42 +-
 xen/arch/arm/mm.c                        | 1160 +-------------
 xen/arch/arm/mmu/mm.c                    | 1133 ++++++++++++++
 xen/arch/arm/mmu/p2m.c                   | 1612 +++++++++++++++++++
 xen/arch/arm/mmu/setup.c                 |  379 +++++
 xen/arch/arm/mpu/domain_page.c           |   68 +
 xen/arch/arm/mpu/mm.c                    |  959 ++++++++++++
 xen/arch/arm/mpu/p2m.c                   |  518 +++++++
 xen/arch/arm/mpu/setup.c                 |  102 ++
 xen/arch/arm/p2m.c                       | 1782 ++--------------------
 xen/arch/arm/platforms/Kconfig           |    8 +-
 xen/arch/arm/setup.c                     |  388 +----
 xen/arch/arm/smpboot.c                   |    6 +-
 xen/arch/arm/traps.c                     |   97 +-
 xen/arch/arm/xen.lds.S                   |    6 +-
 xen/arch/x86/Kconfig                     |    2 +
 xen/arch/x86/setup.c                     |    2 +
 xen/common/Kconfig                       |    8 +
 xen/common/Makefile                      |    2 +-
 xen/common/domctl.c                      |    2 +
 xen/common/vmap.c                        |    7 +
 xen/drivers/passthrough/Kconfig          |    3 +-
 xen/include/xen/vmap.h                   |   11 +-
 55 files changed, 6730 insertions(+), 3822 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mmu/head.S
 rename xen/arch/arm/arm64/{ => mmu}/mm.c (97%)
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
 create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
 create mode 100644 xen/arch/arm/mmu/mm.c
 create mode 100644 xen/arch/arm/mmu/p2m.c
 create mode 100644 xen/arch/arm/mmu/setup.c
 create mode 100644 xen/arch/arm/mpu/domain_page.c
 create mode 100644 xen/arch/arm/mpu/mm.c
 create mode 100644 xen/arch/arm/mpu/p2m.c
 create mode 100644 xen/arch/arm/mpu/setup.c

-- 
2.25.1


