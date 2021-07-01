Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A43B92EB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148710.274875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOp-0007Qw-Bh; Thu, 01 Jul 2021 14:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148710.274875; Thu, 01 Jul 2021 14:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOp-0007ME-4A; Thu, 01 Jul 2021 14:10:39 +0000
Received: by outflank-mailman (input) for mailman id 148710;
 Thu, 01 Jul 2021 14:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOn-0005F9-JC
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fe08080-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:19 +0000 (UTC)
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
X-Inumbo-ID: 0fe08080-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QdYelS8NaZ6G8BQPcUzIhJ1B8dc4YjNwoApXWn17CtM=;
  b=IjrJ5W+pShq2A1x5gJnE9NsjlOh1IQXTmuBLbMhgMrAIXy+PahNZk74w
   M4yXEZTE8X/uynk0SSlGcnGRIObPKy50kO+OjERC9dQ+TsYUl9UwNkx36
   n17FJJBSEOQaKZOSyV+UtoWhyNHQetvLsI8bgLQVYLFsAz20WkxMCqmMG
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7bgFLSzrs+Zu58NlCL1z+vgNXhDSUuJL27/RRn0GCfNfZokSPc0lqN08hTAvVA36oRoMprbeZL
 rYfTMQihX5kDoEZBAMfRemW6qg1E1W5v/xOpx/vuXsPrj55ASR97Z/K+qBRTP2vK9mXSrsBYKM
 608+w651r8XaXHEaJKQXY4ZnJo/dzSpgDjQRlE3ZbSftRQeRAqFkvQ/Meagabl8tt8+BbFeXj2
 c33vHYxWqg6urQ+eyzgCiJzdnEmiDE/hXU/anWyBkH2J6oLyQhwi8aqSYYp9w2EGrt5Lm77V7Q
 rsw=
X-SBRS: 5.1
X-MesageID: 47755309
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0OyC3ataI8u22IOSFmrXKua67skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755309"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Tim Deegan <tim@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Jan
 Beulich" <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Kevin Tian <kevin.tian@intel.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Wei Liu <wl@xen.org>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Lukasz Hawrylko
	<lukasz.hawrylko@linux.intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Julien Grall <julien@xen.org>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v6 00/31] xen: Build system improvements
Date: Thu, 1 Jul 2021 15:09:40 +0100
Message-ID: <20210701141011.785641-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v6

v6:
    This new version of the series get's us very close to be able to do
    out-of-tree build, but I've stop at been able to use Linux's `fixdep` and
    getting rid of those annoying *.d2 files generation.

    There a few patch left from the previous round within the first 8 patches
    (mixed with new or replaced patches). All the rest is new.

    The main patch is probably "build: build everything from the root dir, use
    obj=$subdir" which has still quite a few changes left. I might be still be
    able to break it down even more if needed to help with review (and might
    allow me to better explain some changes in it).

v5:
https://lore.kernel.org/xen-devel/20200421161208.2429539-1-anthony.perard@citrix.com/
- few changes detailed in patch notes.
- 1 new patch

Hi,

I have work toward building Xen (the hypervisor) with Linux's build system,
Kbuild.

The main reason for that is to be able to have out-of-tree build. It's annoying
when a build fail because of the pvshim. Other benefit is a much faster
rebuild, and `make clean` doesn't take ages, and better dependencies to figure
out what needs to be rebuild.

This new version of the series get's us very close to be able to do out-of-tree
build, but I've stop at been able to use Linux's `fixdep` and getting rid of
those annoying *.d2 files.

Cheers,

Anthony PERARD (31):
  build: fix %.s: %.S rule
  build: introduce cpp_flags macro
  build: use if_changed on built_in.o
  build: use if_changed_rules with %.o:%.c targets
  build: factorise generation of the linker scripts
  x86/mm: avoid building multiple .o from a single .c file
  build,include: rework compat-build-source.py
  build,include: rework compat-build-header.py
  build: clean "lib.a"
  build: use $(kconfig) shortcut in clean rule
  build: fix clean targets when subdir-y is used
  build: use subdir-y in test/Makefile
  build,tools: have default rules depends on symbols
  build,arm: move LDFLAGS change to arch.mk
  build: move make option changes check earlier
  build: avoid building arm/arm/*/head.o twice
  build: convert binfile use to if_changed
  xen: move include/asm-* to include/arch-*/asm
  build: rework .banner generation
  build: generate "include/xen/compile.h" with filechk
  build: set XEN_BUILD_EFI earlier
  build: fix $(TARGET).efi creation in arch/arm
  build: fix arch/x86/node.o rule
  build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
  build: remove unneeded deps of x86_emulate.o
  build: clean common temporary files from root makefile
  build: prepare to always invoke $(MAKE) from xen/, use $(obj)
  build: rework test/livepatch/Makefile
  build: build everything from the root dir, use obj=$subdir
  build: introduce if_changed_deps
  build,riscv: tell the build system about riscv64/head.S

 .gitignore                                    |   6 +-
 MAINTAINERS                                   |  36 +-
 tools/include/Makefile                        |   2 +-
 tools/misc/xen-access.c                       |   4 +-
 tools/tests/vhpet/Makefile                    |   2 +-
 xen/Makefile                                  | 209 ++++++---
 xen/Rules.mk                                  | 222 +++++-----
 xen/arch/arm/Makefile                         |  50 +--
 xen/arch/arm/README.LinuxPrimitives           |  10 +-
 xen/arch/arm/arch.mk                          |  13 +-
 xen/arch/arm/arm32/Makefile                   |   1 +
 xen/arch/arm/arm32/head.S                     |   2 +-
 xen/arch/arm/arm64/Makefile                   |   2 +
 xen/arch/arm/arm64/head.S                     |   2 +-
 xen/arch/arm/smpboot.c                        |   2 +-
 xen/arch/arm/vpsci.c                          |   2 +-
 xen/arch/riscv/arch.mk                        |   3 +-
 xen/arch/riscv/riscv64/Makefile               |   1 +
 xen/arch/x86/Makefile                         | 105 ++---
 xen/arch/x86/Rules.mk                         |   4 +-
 xen/arch/x86/arch.mk                          |  16 +-
 xen/arch/x86/boot/Makefile                    |  14 +-
 xen/arch/x86/efi/Makefile                     |   6 +-
 xen/arch/x86/mm/Makefile                      |   9 -
 xen/arch/x86/mm/guest_walk.c                  |   3 -
 xen/arch/x86/mm/guest_walk_2.c                |   2 +
 xen/arch/x86/mm/guest_walk_3.c                |   2 +
 xen/arch/x86/mm/guest_walk_4.c                |   2 +
 xen/arch/x86/mm/hap/Makefile                  |   9 -
 xen/arch/x86/mm/hap/guest_walk.c              |   3 -
 xen/arch/x86/mm/hap/guest_walk_2level.c       |   2 +
 xen/arch/x86/mm/hap/guest_walk_3level.c       |   2 +
 xen/arch/x86/mm/hap/guest_walk_4level.c       |   2 +
 xen/arch/x86/mm/shadow/Makefile               |   9 -
 xen/arch/x86/mm/shadow/guest_2.c              |   2 +
 xen/arch/x86/mm/shadow/guest_3.c              |   2 +
 xen/arch/x86/mm/shadow/guest_4.c              |   2 +
 xen/arch/x86/mm/shadow/multi.c                |   3 -
 xen/common/Makefile                           |  12 +-
 xen/common/efi/runtime.c                      |  14 +-
 xen/common/libelf/Makefile                    |   4 +-
 xen/common/libfdt/Makefile                    |   6 +-
 xen/common/page_alloc.c                       |   2 +-
 xen/include/Makefile                          |  60 ++-
 xen/include/{asm-arm => arch-arm/asm}/acpi.h  |   0
 .../{asm-arm => arch-arm/asm}/alternative.h   |   0
 .../{asm-arm => arch-arm/asm}/altp2m.h        |   0
 .../{asm-arm => arch-arm/asm}/arm32/atomic.h  |   0
 .../{asm-arm => arch-arm/asm}/arm32/bitops.h  |   0
 .../{asm-arm => arch-arm/asm}/arm32/bug.h     |   0
 .../{asm-arm => arch-arm/asm}/arm32/cmpxchg.h |   0
 .../asm}/arm32/flushtlb.h                     |   0
 .../{asm-arm => arch-arm/asm}/arm32/insn.h    |   0
 .../{asm-arm => arch-arm/asm}/arm32/io.h      |   0
 .../{asm-arm => arch-arm/asm}/arm32/macros.h  |   0
 .../{asm-arm => arch-arm/asm}/arm32/mm.h      |   0
 .../{asm-arm => arch-arm/asm}/arm32/page.h    |   0
 .../asm}/arm32/processor.h                    |   0
 .../{asm-arm => arch-arm/asm}/arm32/sysregs.h |   0
 .../{asm-arm => arch-arm/asm}/arm32/system.h  |   0
 .../{asm-arm => arch-arm/asm}/arm32/traps.h   |   0
 .../{asm-arm => arch-arm/asm}/arm32/vfp.h     |   0
 .../{asm-arm => arch-arm/asm}/arm64/atomic.h  |   0
 .../{asm-arm => arch-arm/asm}/arm64/bitops.h  |   0
 .../{asm-arm => arch-arm/asm}/arm64/brk.h     |   0
 .../{asm-arm => arch-arm/asm}/arm64/bug.h     |   0
 .../{asm-arm => arch-arm/asm}/arm64/cmpxchg.h |   0
 .../{asm-arm => arch-arm/asm}/arm64/efibind.h |   0
 .../asm}/arm64/flushtlb.h                     |   0
 .../{asm-arm => arch-arm/asm}/arm64/hsr.h     |   0
 .../{asm-arm => arch-arm/asm}/arm64/insn.h    |   0
 .../{asm-arm => arch-arm/asm}/arm64/io.h      |   0
 .../{asm-arm => arch-arm/asm}/arm64/macros.h  |   0
 .../{asm-arm => arch-arm/asm}/arm64/mm.h      |   0
 .../{asm-arm => arch-arm/asm}/arm64/page.h    |   0
 .../asm}/arm64/processor.h                    |   0
 .../{asm-arm => arch-arm/asm}/arm64/sysregs.h |   0
 .../{asm-arm => arch-arm/asm}/arm64/system.h  |   0
 .../{asm-arm => arch-arm/asm}/arm64/traps.h   |   0
 .../{asm-arm => arch-arm/asm}/arm64/vfp.h     |   0
 .../{asm-arm => arch-arm/asm}/asm_defns.h     |   0
 .../{asm-arm => arch-arm/asm}/atomic.h        |   0
 .../{asm-arm => arch-arm/asm}/bitops.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/bug.h   |   0
 .../{asm-arm => arch-arm/asm}/byteorder.h     |   0
 xen/include/{asm-arm => arch-arm/asm}/cache.h |   0
 .../{asm-arm => arch-arm/asm}/cadence-uart.h  |   0
 .../{asm-arm => arch-arm/asm}/config.h        |   0
 .../{asm-arm => arch-arm/asm}/cpregs.h        |   0
 .../{asm-arm => arch-arm/asm}/cpuerrata.h     |   0
 .../{asm-arm => arch-arm/asm}/cpufeature.h    |   0
 .../{asm-arm => arch-arm/asm}/current.h       |   0
 .../{asm-arm => arch-arm/asm}/debugger.h      |   0
 xen/include/{asm-arm => arch-arm/asm}/delay.h |   0
 xen/include/{asm-arm => arch-arm/asm}/desc.h  |   0
 .../{asm-arm => arch-arm/asm}/device.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/div64.h |   0
 .../{asm-arm => arch-arm/asm}/domain.h        |   0
 .../{asm-arm => arch-arm/asm}/domain_build.h  |   0
 .../{asm-arm => arch-arm/asm}/early_printk.h  |   0
 .../{asm-arm => arch-arm/asm}/efibind.h       |   0
 xen/include/{asm-arm => arch-arm/asm}/elf.h   |   0
 xen/include/{asm-arm => arch-arm/asm}/event.h |   0
 .../asm}/exynos4210-uart.h                    |   0
 .../{asm-arm => arch-arm/asm}/flushtlb.h      |   0
 xen/include/{asm-arm => arch-arm/asm}/gic.h   |   0
 .../{asm-arm => arch-arm/asm}/gic_v3_defs.h   |   0
 .../{asm-arm => arch-arm/asm}/gic_v3_its.h    |   0
 .../{asm-arm => arch-arm/asm}/grant_table.h   |   0
 .../{asm-arm => arch-arm/asm}/guest_access.h  |   0
 .../{asm-arm => arch-arm/asm}/guest_atomics.h |   0
 .../{asm-arm => arch-arm/asm}/guest_walk.h    |   0
 .../{asm-arm => arch-arm/asm}/hardirq.h       |   0
 xen/include/{asm-arm => arch-arm/asm}/hsr.h   |   0
 .../{asm-arm => arch-arm/asm}/hypercall.h     |   0
 xen/include/{asm-arm => arch-arm/asm}/init.h  |   0
 xen/include/{asm-arm => arch-arm/asm}/insn.h  |   0
 xen/include/{asm-arm => arch-arm/asm}/io.h    |   0
 xen/include/{asm-arm => arch-arm/asm}/iocap.h |   0
 xen/include/{asm-arm => arch-arm/asm}/iommu.h |   0
 .../{asm-arm => arch-arm/asm}/iommu_fwspec.h  |   0
 xen/include/{asm-arm => arch-arm/asm}/ioreq.h |   0
 xen/include/{asm-arm => arch-arm/asm}/irq.h   |   0
 .../{asm-arm => arch-arm/asm}/kernel.h        |   0
 .../{asm-arm => arch-arm/asm}/livepatch.h     |   0
 xen/include/{asm-arm => arch-arm/asm}/lpae.h  |   0
 .../{asm-arm => arch-arm/asm}/macros.h        |   0
 .../{asm-arm => arch-arm/asm}/mem_access.h    |   0
 xen/include/{asm-arm => arch-arm/asm}/mm.h    |   0
 xen/include/{asm-arm => arch-arm/asm}/mmio.h  |   0
 .../{asm-arm => arch-arm/asm}/monitor.h       |   0
 .../{asm-arm => arch-arm/asm}/new_vgic.h      |   0
 .../{asm-arm => arch-arm/asm}/nospec.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/numa.h  |   0
 xen/include/{asm-arm => arch-arm/asm}/p2m.h   |   0
 .../{asm-arm => arch-arm/asm}/page-bits.h     |   0
 xen/include/{asm-arm => arch-arm/asm}/page.h  |   0
 .../{asm-arm => arch-arm/asm}/paging.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/pci.h   |   0
 .../{asm-arm => arch-arm/asm}/percpu.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/perfc.h |   0
 .../{asm-arm => arch-arm/asm}/perfc_defn.h    |   0
 .../{asm-arm => arch-arm/asm}/pl011-uart.h    |   0
 .../{asm-arm => arch-arm/asm}/platform.h      |   0
 .../asm}/platforms/exynos5.h                  |   0
 .../asm}/platforms/midway.h                   |   0
 .../asm}/platforms/omap5.h                    |   0
 .../asm}/platforms/vexpress.h                 |   0
 .../asm}/platforms/xilinx-zynqmp-eemi.h       |   0
 .../{asm-arm => arch-arm/asm}/processor.h     |   0
 .../{asm-arm => arch-arm/asm}/procinfo.h      |   0
 xen/include/{asm-arm => arch-arm/asm}/psci.h  |   0
 .../{asm-arm => arch-arm/asm}/random.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/regs.h  |   0
 .../{asm-arm => arch-arm/asm}/scif-uart.h     |   0
 xen/include/{asm-arm => arch-arm/asm}/setup.h |   0
 .../{asm-arm => arch-arm/asm}/short-desc.h    |   0
 xen/include/{asm-arm => arch-arm/asm}/smccc.h |   0
 xen/include/{asm-arm => arch-arm/asm}/smp.h   |   0
 .../{asm-arm => arch-arm/asm}/softirq.h       |   0
 .../{asm-arm => arch-arm/asm}/spinlock.h      |   0
 .../{asm-arm => arch-arm/asm}/string.h        |   0
 .../{asm-arm => arch-arm/asm}/sysregs.h       |   0
 .../{asm-arm => arch-arm/asm}/system.h        |   0
 .../{asm-arm => arch-arm/asm}/tee/optee_msg.h |   0
 .../asm}/tee/optee_rpc_cmd.h                  |   0
 .../{asm-arm => arch-arm/asm}/tee/optee_smc.h |   0
 .../{asm-arm => arch-arm/asm}/tee/tee.h       |   0
 xen/include/{asm-arm => arch-arm/asm}/time.h  |   0
 xen/include/{asm-arm => arch-arm/asm}/trace.h |   0
 xen/include/{asm-arm => arch-arm/asm}/traps.h |   0
 xen/include/{asm-arm => arch-arm/asm}/types.h |   0
 xen/include/{asm-arm => arch-arm/asm}/vfp.h   |   0
 .../{asm-arm => arch-arm/asm}/vgic-emul.h     |   0
 xen/include/{asm-arm => arch-arm/asm}/vgic.h  |   0
 .../{asm-arm => arch-arm/asm}/vm_event.h      |   0
 .../{asm-arm => arch-arm/asm}/vpl011.h        |   0
 xen/include/{asm-arm => arch-arm/asm}/vpsci.h |   0
 xen/include/{asm-arm => arch-arm/asm}/vreg.h  |   0
 .../{asm-arm => arch-arm/asm}/vtimer.h        |   0
 .../{asm-arm => arch-arm/asm}/xenoprof.h      |   0
 .../{asm-riscv => arch-riscv/asm}/config.h    |   0
 xen/include/{asm-x86 => arch-x86/asm}/acpi.h  |   0
 .../asm}/alternative-asm.h                    |   0
 .../{asm-x86 => arch-x86/asm}/alternative.h   |   0
 .../{asm-x86 => arch-x86/asm}/altp2m.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/amd.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/apic.h  |   0
 .../{asm-x86 => arch-x86/asm}/apicdef.h       |   0
 .../{asm-x86 => arch-x86/asm}/asm-defns.h     |   0
 .../{asm-x86 => arch-x86/asm}/asm_defns.h     |   0
 .../{asm-x86 => arch-x86/asm}/atomic.h        |   0
 .../{asm-x86 => arch-x86/asm}/bitops.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/bug.h   |   0
 .../{asm-x86 => arch-x86/asm}/byteorder.h     |   0
 .../{asm-x86 => arch-x86/asm}/bzimage.h       |   0
 xen/include/{asm-x86 => arch-x86/asm}/cache.h |   0
 .../{asm-x86 => arch-x86/asm}/compat.h        |   0
 .../{asm-x86 => arch-x86/asm}/config.h        |   0
 .../{asm-x86 => arch-x86/asm}/cpufeature.h    |   0
 .../{asm-x86 => arch-x86/asm}/cpufeatures.h   |   0
 .../{asm-x86 => arch-x86/asm}/cpufeatureset.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/cpuid.h |   0
 .../{asm-x86 => arch-x86/asm}/cpuidle.h       |   0
 .../{asm-x86 => arch-x86/asm}/current.h       |   2 +-
 .../{asm-x86 => arch-x86/asm}/debugger.h      |   0
 .../{asm-x86 => arch-x86/asm}/debugreg.h      |   0
 xen/include/{asm-x86 => arch-x86/asm}/delay.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/desc.h  |   0
 .../{asm-x86 => arch-x86/asm}/device.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/div64.h |   0
 .../{asm-x86 => arch-x86/asm}/dom0_build.h    |   0
 .../{asm-x86 => arch-x86/asm}/domain.h        |   2 +-
 xen/include/{asm-x86 => arch-x86/asm}/e820.h  |   0
 xen/include/{asm-x86 => arch-x86/asm}/edd.h   |   0
 .../{asm-x86 => arch-x86/asm}/efibind.h       |   0
 xen/include/{asm-x86 => arch-x86/asm}/elf.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/event.h |   0
 .../{asm-x86 => arch-x86/asm}/fixmap.h        |   0
 .../{asm-x86 => arch-x86/asm}/flushtlb.h      |   0
 .../{asm-x86 => arch-x86/asm}/genapic.h       |   0
 .../{asm-x86 => arch-x86/asm}/grant_table.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/guest.h |   0
 .../asm}/guest/hyperv-hcall.h                 |   0
 .../asm}/guest/hyperv-tlfs.h                  |   0
 .../{asm-x86 => arch-x86/asm}/guest/hyperv.h  |   0
 .../asm}/guest/hypervisor.h                   |   0
 .../asm}/guest/pvh-boot.h                     |   0
 .../asm}/guest/xen-hcall.h                    |   0
 .../{asm-x86 => arch-x86/asm}/guest/xen.h     |   0
 .../{asm-x86 => arch-x86/asm}/guest_access.h  |   0
 .../{asm-x86 => arch-x86/asm}/guest_atomics.h |   0
 .../{asm-x86 => arch-x86/asm}/guest_pt.h      |   0
 xen/include/{asm-x86 => arch-x86/asm}/hap.h   |   0
 .../{asm-x86 => arch-x86/asm}/hardirq.h       |   0
 xen/include/{asm-x86 => arch-x86/asm}/hpet.h  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/asid.h      |   0
 .../{asm-x86 => arch-x86/asm}/hvm/cacheattr.h |   0
 .../{asm-x86 => arch-x86/asm}/hvm/domain.h    |   0
 .../{asm-x86 => arch-x86/asm}/hvm/emulate.h   |   0
 .../asm}/hvm/grant_table.h                    |   0
 .../asm}/hvm/guest_access.h                   |   0
 .../{asm-x86 => arch-x86/asm}/hvm/hvm.h       |   0
 .../{asm-x86 => arch-x86/asm}/hvm/io.h        |   0
 .../{asm-x86 => arch-x86/asm}/hvm/ioreq.h     |   0
 .../{asm-x86 => arch-x86/asm}/hvm/irq.h       |   0
 .../{asm-x86 => arch-x86/asm}/hvm/monitor.h   |   0
 .../{asm-x86 => arch-x86/asm}/hvm/nestedhvm.h |   0
 .../{asm-x86 => arch-x86/asm}/hvm/save.h      |   0
 .../{asm-x86 => arch-x86/asm}/hvm/support.h   |   0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/asid.h  |   0
 .../asm}/hvm/svm/emulate.h                    |   0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/intr.h  |   0
 .../asm}/hvm/svm/nestedsvm.h                  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/svm.h   |   0
 .../asm}/hvm/svm/svmdebug.h                   |   0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/vmcb.h  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/trace.h     |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vcpu.h      |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vioapic.h   |   0
 .../{asm-x86 => arch-x86/asm}/hvm/viridian.h  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vlapic.h    |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vm_event.h  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vmx/vmcs.h  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vmx/vmx.h   |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vmx/vvmx.h  |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vpic.h      |   0
 .../{asm-x86 => arch-x86/asm}/hvm/vpt.h       |   0
 .../{asm-x86 => arch-x86/asm}/hypercall.h     |   0
 xen/include/{asm-x86 => arch-x86/asm}/i387.h  |   0
 xen/include/{asm-x86 => arch-x86/asm}/init.h  |   0
 .../{asm-x86 => arch-x86/asm}/invpcid.h       |   0
 xen/include/{asm-x86 => arch-x86/asm}/io.h    |   0
 .../{asm-x86 => arch-x86/asm}/io_apic.h       |   0
 xen/include/{asm-x86 => arch-x86/asm}/iocap.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/iommu.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/ioreq.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/irq.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/ldt.h   |   0
 .../{asm-x86 => arch-x86/asm}/livepatch.h     |   0
 .../asm}/mach-default/bios_ebda.h             |   0
 .../asm}/mach-default/io_ports.h              |   0
 .../asm}/mach-default/irq_vectors.h           |   0
 .../asm}/mach-default/mach_mpparse.h          |   0
 .../asm}/mach-default/mach_mpspec.h           |   0
 .../asm}/mach-generic/mach_apic.h             |   0
 .../asm}/mach-generic/mach_mpparse.h          |   0
 .../{asm-x86 => arch-x86/asm}/machine_kexec.h |   0
 .../{asm-x86 => arch-x86/asm}/mc146818rtc.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/mce.h   |   0
 .../{asm-x86 => arch-x86/asm}/mem_access.h    |   0
 .../{asm-x86 => arch-x86/asm}/mem_paging.h    |   0
 .../{asm-x86 => arch-x86/asm}/mem_sharing.h   |   0
 .../{asm-x86 => arch-x86/asm}/microcode.h     |   0
 xen/include/{asm-x86 => arch-x86/asm}/mm.h    |   0
 .../{asm-x86 => arch-x86/asm}/monitor.h       |   0
 .../{asm-x86 => arch-x86/asm}/mpspec.h        |   0
 .../{asm-x86 => arch-x86/asm}/mpspec_def.h    |   0
 xen/include/{asm-x86 => arch-x86/asm}/msi.h   |   0
 .../{asm-x86 => arch-x86/asm}/msr-index.h     |   0
 xen/include/{asm-x86 => arch-x86/asm}/msr.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/mtrr.h  |   0
 .../{asm-x86 => arch-x86/asm}/multicall.h     |   0
 xen/include/{asm-x86 => arch-x86/asm}/mwait.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/nmi.h   |   0
 xen/include/{asm-x86 => arch-x86/asm}/nops.h  |   0
 .../{asm-x86 => arch-x86/asm}/nospec.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/numa.h  |   0
 xen/include/{asm-x86 => arch-x86/asm}/p2m.h   |   0
 .../{asm-x86 => arch-x86/asm}/page-bits.h     |   0
 xen/include/{asm-x86 => arch-x86/asm}/page.h  |   0
 .../{asm-x86 => arch-x86/asm}/paging.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/pci.h   |   0
 .../{asm-x86 => arch-x86/asm}/percpu.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/perfc.h |   0
 .../{asm-x86 => arch-x86/asm}/perfc_defn.h    |   0
 .../{asm-x86 => arch-x86/asm}/processor.h     |   0
 xen/include/{asm-x86 => arch-x86/asm}/psr.h   |   0
 .../{asm-x86 => arch-x86/asm}/pv/domain.h     |   0
 .../asm}/pv/grant_table.h                     |   0
 xen/include/{asm-x86 => arch-x86/asm}/pv/mm.h |   0
 .../{asm-x86 => arch-x86/asm}/pv/shim.h       |   0
 .../{asm-x86 => arch-x86/asm}/pv/traps.h      |   0
 .../{asm-x86 => arch-x86/asm}/random.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/regs.h  |   0
 xen/include/{asm-x86 => arch-x86/asm}/setup.h |   0
 .../{asm-x86 => arch-x86/asm}/shadow.h        |   0
 .../{asm-x86 => arch-x86/asm}/shared.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/smp.h   |   0
 .../{asm-x86 => arch-x86/asm}/softirq.h       |   0
 .../{asm-x86 => arch-x86/asm}/spec_ctrl.h     |   0
 .../{asm-x86 => arch-x86/asm}/spec_ctrl_asm.h |   0
 .../{asm-x86 => arch-x86/asm}/spinlock.h      |   0
 .../{asm-x86 => arch-x86/asm}/string.h        |   0
 .../{asm-x86 => arch-x86/asm}/system.h        |   0
 xen/include/{asm-x86 => arch-x86/asm}/tboot.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/time.h  |   0
 xen/include/{asm-x86 => arch-x86/asm}/trace.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/traps.h |   0
 xen/include/{asm-x86 => arch-x86/asm}/types.h |   0
 .../{asm-x86 => arch-x86/asm}/uaccess.h       |   0
 .../{asm-x86 => arch-x86/asm}/unaligned.h     |   0
 .../{asm-x86 => arch-x86/asm}/vm_event.h      |   0
 xen/include/{asm-x86 => arch-x86/asm}/vpmu.h  |   0
 .../{asm-x86 => arch-x86/asm}/x86-defns.h     |   0
 .../{asm-x86 => arch-x86/asm}/x86-vendors.h   |   0
 .../asm}/x86_64/efibind.h                     |   0
 .../{asm-x86 => arch-x86/asm}/x86_64/elf.h    |   0
 .../{asm-x86 => arch-x86/asm}/x86_64/page.h   |   0
 .../{asm-x86 => arch-x86/asm}/x86_64/regs.h   |   0
 .../{asm-x86 => arch-x86/asm}/x86_64/system.h |   0
 .../asm}/x86_64/uaccess.h                     |   0
 .../{asm-x86 => arch-x86/asm}/x86_emulate.h   |   0
 .../{asm-x86 => arch-x86/asm}/xenoprof.h      |   0
 .../{asm-x86 => arch-x86/asm}/xstate.h        |   0
 xen/include/xen/acpi.h                        |   4 +-
 xen/include/xen/bitmap.h                      |   2 +-
 xen/scripts/Kbuild.include                    |  80 +++-
 xen/scripts/Makefile.clean                    |  20 +-
 xen/test/Makefile                             |  16 +-
 xen/test/livepatch/Makefile                   | 215 ++++------
 xen/tools/Makefile                            |   8 +-
 xen/tools/compat-build-header.py              |  44 +-
 xen/tools/compat-build-source.py              |   8 +-
 xen/tools/fixdep.c                            | 404 ++++++++++++++++++
 xen/tools/symbols.c                           |  18 +-
 xen/xsm/flask/Makefile                        |  40 +-
 xen/xsm/flask/policy/mkaccess_vector.sh       |   7 +-
 xen/xsm/flask/ss/Makefile                     |   2 +-
 369 files changed, 1122 insertions(+), 616 deletions(-)
 create mode 100644 xen/arch/riscv/riscv64/Makefile
 create mode 100644 xen/arch/x86/mm/guest_walk_2.c
 create mode 100644 xen/arch/x86/mm/guest_walk_3.c
 create mode 100644 xen/arch/x86/mm/guest_walk_4.c
 create mode 100644 xen/arch/x86/mm/hap/guest_walk_2level.c
 create mode 100644 xen/arch/x86/mm/hap/guest_walk_3level.c
 create mode 100644 xen/arch/x86/mm/hap/guest_walk_4level.c
 create mode 100644 xen/arch/x86/mm/shadow/guest_2.c
 create mode 100644 xen/arch/x86/mm/shadow/guest_3.c
 create mode 100644 xen/arch/x86/mm/shadow/guest_4.c
 rename xen/include/{asm-arm => arch-arm/asm}/acpi.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/alternative.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/altp2m.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/atomic.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/bitops.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/bug.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/cmpxchg.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/flushtlb.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/insn.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/io.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/macros.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/mm.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/page.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/processor.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/sysregs.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/system.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/traps.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm32/vfp.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/atomic.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/bitops.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/brk.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/bug.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/cmpxchg.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/efibind.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/flushtlb.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/hsr.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/insn.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/io.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/macros.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/mm.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/page.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/processor.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/sysregs.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/system.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/traps.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/arm64/vfp.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/asm_defns.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/atomic.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/bitops.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/bug.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/byteorder.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/cache.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/cadence-uart.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/config.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/cpregs.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/cpuerrata.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/cpufeature.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/current.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/debugger.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/delay.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/desc.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/device.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/div64.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/domain.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/domain_build.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/early_printk.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/efibind.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/elf.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/event.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/exynos4210-uart.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/flushtlb.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/gic.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/gic_v3_defs.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/gic_v3_its.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/grant_table.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/guest_access.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/guest_atomics.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/guest_walk.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/hardirq.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/hsr.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/hypercall.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/init.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/insn.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/io.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/iocap.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/iommu.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/iommu_fwspec.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/ioreq.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/irq.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/kernel.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/livepatch.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/lpae.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/macros.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/mem_access.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/mm.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/mmio.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/monitor.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/new_vgic.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/nospec.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/numa.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/p2m.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/page-bits.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/page.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/paging.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/pci.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/percpu.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/perfc.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/perfc_defn.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/pl011-uart.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/platform.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/platforms/exynos5.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/platforms/midway.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/platforms/omap5.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/platforms/vexpress.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/platforms/xilinx-zynqmp-eemi.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/processor.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/procinfo.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/psci.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/random.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/regs.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/scif-uart.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/setup.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/short-desc.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/smccc.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/smp.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/softirq.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/spinlock.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/string.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/sysregs.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/system.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/tee/optee_msg.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/tee/optee_rpc_cmd.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/tee/optee_smc.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/tee/tee.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/time.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/trace.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/traps.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/types.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vfp.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vgic-emul.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vgic.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vm_event.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vpl011.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vpsci.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vreg.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/vtimer.h (100%)
 rename xen/include/{asm-arm => arch-arm/asm}/xenoprof.h (100%)
 rename xen/include/{asm-riscv => arch-riscv/asm}/config.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/acpi.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/alternative-asm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/alternative.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/altp2m.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/amd.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/apic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/apicdef.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/asm-defns.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/asm_defns.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/atomic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/bitops.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/bug.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/byteorder.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/bzimage.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/cache.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/compat.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/config.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/cpufeature.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/cpufeatures.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/cpufeatureset.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/cpuid.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/cpuidle.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/current.h (99%)
 rename xen/include/{asm-x86 => arch-x86/asm}/debugger.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/debugreg.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/delay.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/desc.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/device.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/div64.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/dom0_build.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/domain.h (99%)
 rename xen/include/{asm-x86 => arch-x86/asm}/e820.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/edd.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/efibind.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/elf.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/event.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/fixmap.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/flushtlb.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/genapic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/grant_table.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/hyperv-hcall.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/hyperv-tlfs.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/hyperv.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/hypervisor.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/pvh-boot.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/xen-hcall.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest/xen.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest_access.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest_atomics.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/guest_pt.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hap.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hardirq.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hpet.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/asid.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/cacheattr.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/domain.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/emulate.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/grant_table.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/guest_access.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/hvm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/io.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/ioreq.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/irq.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/monitor.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/nestedhvm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/save.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/support.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/asid.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/emulate.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/intr.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/nestedsvm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/svm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/svmdebug.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/svm/vmcb.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/trace.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vcpu.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vioapic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/viridian.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vlapic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vm_event.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vmx/vmcs.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vmx/vmx.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vmx/vvmx.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vpic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hvm/vpt.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/hypercall.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/i387.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/init.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/invpcid.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/io.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/io_apic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/iocap.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/iommu.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/ioreq.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/irq.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/ldt.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/livepatch.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-default/bios_ebda.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-default/io_ports.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-default/irq_vectors.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-default/mach_mpparse.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-default/mach_mpspec.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-generic/mach_apic.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mach-generic/mach_mpparse.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/machine_kexec.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mc146818rtc.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mce.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mem_access.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mem_paging.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mem_sharing.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/microcode.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/monitor.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mpspec.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mpspec_def.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/msi.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/msr-index.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/msr.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mtrr.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/multicall.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/mwait.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/nmi.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/nops.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/nospec.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/numa.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/p2m.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/page-bits.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/page.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/paging.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/pci.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/percpu.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/perfc.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/perfc_defn.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/processor.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/psr.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/pv/domain.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/pv/grant_table.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/pv/mm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/pv/shim.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/pv/traps.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/random.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/regs.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/setup.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/shadow.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/shared.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/smp.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/softirq.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/spec_ctrl.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/spec_ctrl_asm.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/spinlock.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/string.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/system.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/tboot.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/time.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/trace.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/traps.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/types.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/uaccess.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/unaligned.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/vm_event.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/vpmu.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86-defns.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86-vendors.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_64/efibind.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_64/elf.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_64/page.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_64/regs.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_64/system.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_64/uaccess.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/x86_emulate.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/xenoprof.h (100%)
 rename xen/include/{asm-x86 => arch-x86/asm}/xstate.h (100%)
 create mode 100644 xen/tools/fixdep.c

-- 
Anthony PERARD


