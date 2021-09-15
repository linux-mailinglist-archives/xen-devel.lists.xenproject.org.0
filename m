Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B773840C313
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187424.336278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRbn-0007IP-9q; Wed, 15 Sep 2021 09:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187424.336278; Wed, 15 Sep 2021 09:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQRbn-0007Gc-6n; Wed, 15 Sep 2021 09:53:39 +0000
Received: by outflank-mailman (input) for mailman id 187424;
 Wed, 15 Sep 2021 09:53:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFyV=OF=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mQRbl-0007GV-GM
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:53:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ca052d36-160a-11ec-b4f1-12813bfff9fa;
 Wed, 15 Sep 2021 09:53:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C29C6D;
 Wed, 15 Sep 2021 02:53:33 -0700 (PDT)
Received: from [10.57.23.30] (unknown [10.57.23.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 896283F5A1;
 Wed, 15 Sep 2021 02:53:32 -0700 (PDT)
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
X-Inumbo-ID: ca052d36-160a-11ec-b4f1-12813bfff9fa
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <5419c010-c860-42a5-aa6c-9ba328b0c7c6@arm.com>
Date: Wed, 15 Sep 2021 11:53:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 24.08.2021 12:49, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v7
> 
> v7:
>     Out-of-tree build!
> 
>     This mean many more patches. Everything after patch 27 is new.
> 
>     There's a few new patch before that, but otherwise are rework of v6.
> 
> v6:
>     This new version of the series get's us very close to be able to do
>     out-of-tree build, but I've stop at been able to use Linux's `fixdep` and
>     getting rid of those annoying *.d2 files generation.
> 
>     There a few patch left from the previous round within the first 8 patches
>     (mixed with new or replaced patches). All the rest is new.
> 
>     The main patch is probably "build: build everything from the root dir, use
>     obj=$subdir" which has still quite a few changes left. I might be still be
>     able to break it down even more if needed to help with review (and might
>     allow me to better explain some changes in it).
> 
> v5:
> https://lore.kernel.org/xen-devel/20200421161208.2429539-1-anthony.perard@citrix.com/
> - few changes detailed in patch notes.
> - 1 new patch
> 
> Hi,
> 
> I have work toward building Xen (the hypervisor) with Linux's build system,
> Kbuild.
> 
> The main reason for that is to be able to have out-of-tree build. It's annoying
> when a build fail because of the pvshim. Other benefit is a much faster
> rebuild, and `make clean` doesn't take ages, and better dependencies to figure
> out what needs to be rebuild.
> 
I wanted to let you know that I tested out-of-tree build using v7 series on arm64/arm32 and it works.
Also I tested it with Yocto building Xen(to check if it does not break the builds) and
it also works. Rebuilding/cleaning is really much quicker. Great work.

> This new version of the series get's us very close to be able to do out-of-tree
> build, but I've stop at been able to use Linux's `fixdep` and getting rid of
> those annoying *.d2 files.
> 
> Cheers,
> 
Cheers,
Michal

> Anthony PERARD (51):
>   build: introduce cpp_flags macro
>   build: use if_changed on built_in.o
>   build: use if_changed_rules with %.o:%.c targets
>   build: factorise generation of the linker scripts
>   x86/mm: avoid building multiple .o from a single .c file
>   build,include: rework compat-build-source.py
>   build,include: rework compat-build-header.py
>   build: fix clean targets when subdir-y is used
>   build: use subdir-y in test/Makefile
>   build,arm: move LDFLAGS change to arch.mk
>   build: move make option changes check earlier
>   build: avoid building arm/arm/*/head.o twice
>   build: convert binfile use to if_changed
>   xen: move include/asm-* to arch/*/include/asm
>   build,riscv: tell the build system about riscv64/head.S
>   build: generate "include/xen/compile.h" with if_changed
>   build: set XEN_BUILD_EFI earlier
>   build: fix $(TARGET).efi creation in arch/arm
>   build: fix arch/x86/note.o rule
>   build: avoid re-executing the main Makefile by introducing build.mk
>   build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
>   build: clean common temporary files from root makefile
>   build,include: remove arch-*/*.h public header listing from
>     headers*.chk
>   build: prepare to always invoke $(MAKE) from xen/, use $(obj)
>   build: rework test/livepatch/Makefile
>   build: build everything from the root dir, use obj=$subdir
>   build: introduce if_changed_deps
>   build: rename __LINKER__ to LINKER_SCRIPT
>   build: add an other explicite rules to not build $(XEN_ROOT)/.config
>   build: hook kconfig into xen build system
>   xen/tools/kconfig: fix build with -Wdeclaration-after-statement
>   build: Remove KBUILD_ specific from Makefile.host
>   build: handle always-y and hostprogs-always-y
>   build: start building the tools with the main makefiles
>   build: Add headers path to CFLAGS once for all archs
>   build: generate x86's asm-macros.h with filechk
>   build: clean-up "clean" rules of duplication
>   build: use main rune to build host binary x86's mkelf32 and mkreloc
>   build: rework coverage and ubsan CFLAGS handling
>   build: fix dependencies in arch/x86/boot
>   build,x86: remove the need for build32.mk
>   build: grab common EFI source files in arch specific dir
>   build: replace $(BASEDIR) by $(objtree)
>   build: add $(srctree) in few key places
>   build: rework cloc recipe
>   build: replace $(BASEDIR) by $(srctree)
>   build: Rework "clean" to clean from the root dir
>   build: Rework "headers*.chk" prerequisite in include/
>   build: adding out-of-tree support to the xen build
>   build: specify source tree in include/ for prerequisite
>   build: add %.E targets
> 
>  .gitignore                                    |   7 +-
>  MAINTAINERS                                   |  37 +-
>  tools/include/Makefile                        |   2 +-
>  tools/misc/xen-access.c                       |   4 +-
>  tools/tests/vhpet/Makefile                    |   2 +-
>  xen/Kconfig                                   |   4 +-
>  xen/Makefile                                  | 408 +++++++++++-------
>  xen/Rules.mk                                  | 293 ++++++++-----
>  xen/arch/arm/Makefile                         |  62 +--
>  xen/arch/arm/README.LinuxPrimitives           |  10 +-
>  xen/arch/arm/arch.mk                          |  12 +-
>  xen/arch/arm/arm32/Makefile                   |   1 +
>  xen/arch/arm/arm32/head.S                     |   2 +-
>  xen/arch/arm/arm64/Makefile                   |   2 +
>  xen/arch/arm/arm64/head.S                     |   2 +-
>  xen/arch/arm/efi/Makefile                     |   9 +
>  .../asm-arm => arch/arm/include/asm}/acpi.h   |   0
>  .../arm/include/asm}/alternative.h            |   0
>  .../asm-arm => arch/arm/include/asm}/altp2m.h |   0
>  .../arm/include/asm}/arm32/atomic.h           |   0
>  .../arm/include/asm}/arm32/bitops.h           |   0
>  .../arm/include/asm}/arm32/bug.h              |   0
>  .../arm/include/asm}/arm32/cmpxchg.h          |   0
>  .../arm/include/asm}/arm32/flushtlb.h         |   0
>  .../arm/include/asm}/arm32/insn.h             |   0
>  .../arm/include/asm}/arm32/io.h               |   0
>  .../arm/include/asm}/arm32/macros.h           |   0
>  .../arm/include/asm}/arm32/mm.h               |   0
>  .../arm/include/asm}/arm32/page.h             |   0
>  .../arm/include/asm}/arm32/processor.h        |   0
>  .../arm/include/asm}/arm32/sysregs.h          |   0
>  .../arm/include/asm}/arm32/system.h           |   0
>  .../arm/include/asm}/arm32/traps.h            |   0
>  .../arm/include/asm}/arm32/vfp.h              |   0
>  .../arm/include/asm}/arm64/atomic.h           |   0
>  .../arm/include/asm}/arm64/bitops.h           |   0
>  .../arm/include/asm}/arm64/brk.h              |   0
>  .../arm/include/asm}/arm64/bug.h              |   0
>  .../arm/include/asm}/arm64/cmpxchg.h          |   0
>  .../arm/include/asm}/arm64/efibind.h          |   0
>  .../arm/include/asm}/arm64/flushtlb.h         |   0
>  .../arm/include/asm}/arm64/hsr.h              |   0
>  .../arm/include/asm}/arm64/insn.h             |   0
>  .../arm/include/asm}/arm64/io.h               |   0
>  .../arm/include/asm}/arm64/macros.h           |   0
>  .../arm/include/asm}/arm64/mm.h               |   0
>  .../arm/include/asm}/arm64/page.h             |   0
>  .../arm/include/asm}/arm64/processor.h        |   0
>  .../arm/include/asm}/arm64/sysregs.h          |   0
>  .../arm/include/asm}/arm64/system.h           |   0
>  .../arm/include/asm}/arm64/traps.h            |   0
>  .../arm/include/asm}/arm64/vfp.h              |   0
>  .../arm/include/asm}/asm_defns.h              |   0
>  .../asm-arm => arch/arm/include/asm}/atomic.h |   0
>  .../asm-arm => arch/arm/include/asm}/bitops.h |   0
>  .../asm-arm => arch/arm/include/asm}/bug.h    |   0
>  .../arm/include/asm}/byteorder.h              |   0
>  .../asm-arm => arch/arm/include/asm}/cache.h  |   0
>  .../arm/include/asm}/cadence-uart.h           |   0
>  .../asm-arm => arch/arm/include/asm}/config.h |   2 +-
>  .../asm-arm => arch/arm/include/asm}/cpregs.h |   0
>  .../arm/include/asm}/cpuerrata.h              |   0
>  .../arm/include/asm}/cpufeature.h             |   0
>  .../arm/include/asm}/current.h                |   0
>  .../arm/include/asm}/debugger.h               |   0
>  .../asm-arm => arch/arm/include/asm}/delay.h  |   0
>  .../asm-arm => arch/arm/include/asm}/desc.h   |   0
>  .../asm-arm => arch/arm/include/asm}/device.h |   0
>  .../asm-arm => arch/arm/include/asm}/div64.h  |   0
>  .../asm-arm => arch/arm/include/asm}/domain.h |   0
>  .../arm/include/asm}/domain_build.h           |   0
>  .../arm/include/asm}/early_printk.h           |   0
>  .../arm/include/asm}/efibind.h                |   0
>  .../asm-arm => arch/arm/include/asm}/elf.h    |   0
>  .../asm-arm => arch/arm/include/asm}/event.h  |   0
>  .../arm/include/asm}/exynos4210-uart.h        |   0
>  .../arm/include/asm}/flushtlb.h               |   0
>  .../asm-arm => arch/arm/include/asm}/gic.h    |   0
>  .../arm/include/asm}/gic_v3_defs.h            |   0
>  .../arm/include/asm}/gic_v3_its.h             |   0
>  .../arm/include/asm}/grant_table.h            |   0
>  .../arm/include/asm}/guest_access.h           |   0
>  .../arm/include/asm}/guest_atomics.h          |   0
>  .../arm/include/asm}/guest_walk.h             |   0
>  .../arm/include/asm}/hardirq.h                |   0
>  .../asm-arm => arch/arm/include/asm}/hsr.h    |   0
>  .../arm/include/asm}/hypercall.h              |   0
>  .../asm-arm => arch/arm/include/asm}/init.h   |   0
>  .../asm-arm => arch/arm/include/asm}/insn.h   |   0
>  .../asm-arm => arch/arm/include/asm}/io.h     |   0
>  .../asm-arm => arch/arm/include/asm}/iocap.h  |   0
>  .../asm-arm => arch/arm/include/asm}/iommu.h  |   0
>  .../arm/include/asm}/iommu_fwspec.h           |   0
>  .../asm-arm => arch/arm/include/asm}/ioreq.h  |   0
>  .../asm-arm => arch/arm/include/asm}/irq.h    |   0
>  .../asm-arm => arch/arm/include/asm}/kernel.h |   0
>  .../arm/include/asm}/livepatch.h              |   0
>  .../asm-arm => arch/arm/include/asm}/lpae.h   |   0
>  .../asm-arm => arch/arm/include/asm}/macros.h |   0
>  .../arm/include/asm}/mem_access.h             |   0
>  .../asm-arm => arch/arm/include/asm}/mm.h     |   0
>  .../asm-arm => arch/arm/include/asm}/mmio.h   |   0
>  .../arm/include/asm}/monitor.h                |   0
>  .../arm/include/asm}/new_vgic.h               |   0
>  .../asm-arm => arch/arm/include/asm}/nospec.h |   0
>  .../asm-arm => arch/arm/include/asm}/numa.h   |   0
>  .../asm-arm => arch/arm/include/asm}/p2m.h    |   0
>  .../arm/include/asm}/page-bits.h              |   0
>  .../asm-arm => arch/arm/include/asm}/page.h   |   0
>  .../asm-arm => arch/arm/include/asm}/paging.h |   0
>  .../asm-arm => arch/arm/include/asm}/pci.h    |   0
>  .../asm-arm => arch/arm/include/asm}/percpu.h |   0
>  .../asm-arm => arch/arm/include/asm}/perfc.h  |   0
>  .../arm/include/asm}/perfc_defn.h             |   0
>  .../arm/include/asm}/pl011-uart.h             |   0
>  .../arm/include/asm}/platform.h               |   0
>  .../arm/include/asm}/platforms/exynos5.h      |   0
>  .../arm/include/asm}/platforms/midway.h       |   0
>  .../arm/include/asm}/platforms/omap5.h        |   0
>  .../arm/include/asm}/platforms/vexpress.h     |   0
>  .../asm}/platforms/xilinx-zynqmp-eemi.h       |   0
>  .../arm/include/asm}/processor.h              |   0
>  .../arm/include/asm}/procinfo.h               |   0
>  .../asm-arm => arch/arm/include/asm}/psci.h   |   0
>  .../asm-arm => arch/arm/include/asm}/random.h |   0
>  .../asm-arm => arch/arm/include/asm}/regs.h   |   0
>  .../arm/include/asm}/scif-uart.h              |   0
>  .../asm-arm => arch/arm/include/asm}/setup.h  |   0
>  .../arm/include/asm}/short-desc.h             |   0
>  .../asm-arm => arch/arm/include/asm}/smccc.h  |   0
>  .../asm-arm => arch/arm/include/asm}/smp.h    |   0
>  .../arm/include/asm}/softirq.h                |   0
>  .../arm/include/asm}/spinlock.h               |   0
>  .../asm-arm => arch/arm/include/asm}/string.h |   0
>  .../arm/include/asm}/sysregs.h                |   0
>  .../asm-arm => arch/arm/include/asm}/system.h |   0
>  .../arm/include/asm}/tee/optee_msg.h          |   0
>  .../arm/include/asm}/tee/optee_rpc_cmd.h      |   0
>  .../arm/include/asm}/tee/optee_smc.h          |   0
>  .../arm/include/asm}/tee/tee.h                |   0
>  .../asm-arm => arch/arm/include/asm}/time.h   |   0
>  .../asm-arm => arch/arm/include/asm}/trace.h  |   0
>  .../asm-arm => arch/arm/include/asm}/traps.h  |   0
>  .../asm-arm => arch/arm/include/asm}/types.h  |   0
>  .../asm-arm => arch/arm/include/asm}/vfp.h    |   0
>  .../arm/include/asm}/vgic-emul.h              |   0
>  .../asm-arm => arch/arm/include/asm}/vgic.h   |   0
>  .../arm/include/asm}/vm_event.h               |   0
>  .../asm-arm => arch/arm/include/asm}/vpl011.h |   0
>  .../asm-arm => arch/arm/include/asm}/vpsci.h  |   0
>  .../asm-arm => arch/arm/include/asm}/vreg.h   |   0
>  .../asm-arm => arch/arm/include/asm}/vtimer.h |   0
>  .../arm/include/asm}/xenoprof.h               |   0
>  xen/arch/arm/smpboot.c                        |   2 +-
>  xen/arch/arm/vpsci.c                          |   2 +-
>  xen/arch/riscv/arch.mk                        |   1 -
>  .../riscv/include/asm}/config.h               |   0
>  xen/arch/riscv/riscv64/Makefile               |   1 +
>  xen/arch/x86/Makefile                         | 204 ++++-----
>  xen/arch/x86/Rules.mk                         |   4 +-
>  xen/arch/x86/arch.mk                          |  54 ++-
>  xen/arch/x86/boot/Makefile                    |  62 ++-
>  xen/arch/x86/boot/build32.mk                  |  40 --
>  xen/arch/x86/efi/Makefile                     |  15 +-
>  .../asm-x86 => arch/x86/include/asm}/acpi.h   |   0
>  .../x86/include/asm}/alternative-asm.h        |   0
>  .../x86/include/asm}/alternative.h            |   0
>  .../asm-x86 => arch/x86/include/asm}/altp2m.h |   0
>  .../asm-x86 => arch/x86/include/asm}/amd.h    |   0
>  .../asm-x86 => arch/x86/include/asm}/apic.h   |   0
>  .../x86/include/asm}/apicdef.h                |   0
>  .../x86/include/asm}/asm-defns.h              |   0
>  .../x86/include/asm}/asm_defns.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/atomic.h |   0
>  .../asm-x86 => arch/x86/include/asm}/bitops.h |   0
>  .../asm-x86 => arch/x86/include/asm}/bug.h    |   0
>  .../x86/include/asm}/byteorder.h              |   0
>  .../x86/include/asm}/bzimage.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/cache.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/compat.h |   0
>  .../asm-x86 => arch/x86/include/asm}/config.h |   0
>  .../x86/include/asm}/cpufeature.h             |   0
>  .../x86/include/asm}/cpufeatures.h            |   0
>  .../x86/include/asm}/cpufeatureset.h          |   0
>  .../asm-x86 => arch/x86/include/asm}/cpuid.h  |   0
>  .../x86/include/asm}/cpuidle.h                |   0
>  .../x86/include/asm}/current.h                |   2 +-
>  .../x86/include/asm}/debugger.h               |   0
>  .../x86/include/asm}/debugreg.h               |   0
>  .../asm-x86 => arch/x86/include/asm}/delay.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/desc.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/device.h |   0
>  .../asm-x86 => arch/x86/include/asm}/div64.h  |   0
>  .../x86/include/asm}/dom0_build.h             |   0
>  .../asm-x86 => arch/x86/include/asm}/domain.h |   2 +-
>  .../asm-x86 => arch/x86/include/asm}/e820.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/edd.h    |   0
>  .../x86/include/asm}/efibind.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/elf.h    |   0
>  .../asm-x86 => arch/x86/include/asm}/event.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/fixmap.h |   0
>  .../x86/include/asm}/flushtlb.h               |   0
>  .../x86/include/asm}/genapic.h                |   0
>  .../x86/include/asm}/grant_table.h            |   0
>  .../asm-x86 => arch/x86/include/asm}/guest.h  |   0
>  .../x86/include/asm}/guest/hyperv-hcall.h     |   0
>  .../x86/include/asm}/guest/hyperv-tlfs.h      |   0
>  .../x86/include/asm}/guest/hyperv.h           |   0
>  .../x86/include/asm}/guest/hypervisor.h       |   0
>  .../x86/include/asm}/guest/pvh-boot.h         |   0
>  .../x86/include/asm}/guest/xen-hcall.h        |   0
>  .../x86/include/asm}/guest/xen.h              |   0
>  .../x86/include/asm}/guest_access.h           |   0
>  .../x86/include/asm}/guest_atomics.h          |   0
>  .../x86/include/asm}/guest_pt.h               |   0
>  .../asm-x86 => arch/x86/include/asm}/hap.h    |   0
>  .../x86/include/asm}/hardirq.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/hpet.h   |   0
>  .../x86/include/asm}/hvm/asid.h               |   0
>  .../x86/include/asm}/hvm/cacheattr.h          |   0
>  .../x86/include/asm}/hvm/domain.h             |   0
>  .../x86/include/asm}/hvm/emulate.h            |   0
>  .../x86/include/asm}/hvm/grant_table.h        |   0
>  .../x86/include/asm}/hvm/guest_access.h       |   0
>  .../x86/include/asm}/hvm/hvm.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/hvm/io.h |   0
>  .../x86/include/asm}/hvm/ioreq.h              |   0
>  .../x86/include/asm}/hvm/irq.h                |   0
>  .../x86/include/asm}/hvm/monitor.h            |   0
>  .../x86/include/asm}/hvm/nestedhvm.h          |   0
>  .../x86/include/asm}/hvm/save.h               |   0
>  .../x86/include/asm}/hvm/support.h            |   0
>  .../x86/include/asm}/hvm/svm/asid.h           |   0
>  .../x86/include/asm}/hvm/svm/emulate.h        |   0
>  .../x86/include/asm}/hvm/svm/intr.h           |   0
>  .../x86/include/asm}/hvm/svm/nestedsvm.h      |   0
>  .../x86/include/asm}/hvm/svm/svm.h            |   0
>  .../x86/include/asm}/hvm/svm/svmdebug.h       |   0
>  .../x86/include/asm}/hvm/svm/vmcb.h           |   0
>  .../x86/include/asm}/hvm/trace.h              |   0
>  .../x86/include/asm}/hvm/vcpu.h               |   0
>  .../x86/include/asm}/hvm/vioapic.h            |   0
>  .../x86/include/asm}/hvm/viridian.h           |   0
>  .../x86/include/asm}/hvm/vlapic.h             |   0
>  .../x86/include/asm}/hvm/vm_event.h           |   0
>  .../x86/include/asm}/hvm/vmx/vmcs.h           |   0
>  .../x86/include/asm}/hvm/vmx/vmx.h            |   0
>  .../x86/include/asm}/hvm/vmx/vvmx.h           |   0
>  .../x86/include/asm}/hvm/vpic.h               |   0
>  .../x86/include/asm}/hvm/vpt.h                |   0
>  .../x86/include/asm}/hypercall.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/i387.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/init.h   |   0
>  .../x86/include/asm}/invpcid.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/io.h     |   0
>  .../x86/include/asm}/io_apic.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/iocap.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/iommu.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/ioreq.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/irq.h    |   0
>  .../asm-x86 => arch/x86/include/asm}/ldt.h    |   0
>  .../x86/include/asm}/livepatch.h              |   0
>  .../x86/include/asm}/mach-default/bios_ebda.h |   0
>  .../x86/include/asm}/mach-default/io_ports.h  |   0
>  .../include/asm}/mach-default/irq_vectors.h   |   0
>  .../include/asm}/mach-default/mach_mpparse.h  |   0
>  .../include/asm}/mach-default/mach_mpspec.h   |   0
>  .../x86/include/asm}/mach-generic/mach_apic.h |   0
>  .../include/asm}/mach-generic/mach_mpparse.h  |   0
>  .../x86/include/asm}/machine_kexec.h          |   0
>  .../x86/include/asm}/mc146818rtc.h            |   0
>  .../asm-x86 => arch/x86/include/asm}/mce.h    |   0
>  .../x86/include/asm}/mem_access.h             |   0
>  .../x86/include/asm}/mem_paging.h             |   0
>  .../x86/include/asm}/mem_sharing.h            |   0
>  .../x86/include/asm}/microcode.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/mm.h     |   0
>  .../x86/include/asm}/monitor.h                |   0
>  .../asm-x86 => arch/x86/include/asm}/mpspec.h |   0
>  .../x86/include/asm}/mpspec_def.h             |   0
>  .../asm-x86 => arch/x86/include/asm}/msi.h    |   0
>  .../x86/include/asm}/msr-index.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/msr.h    |   0
>  .../asm-x86 => arch/x86/include/asm}/mtrr.h   |   0
>  .../x86/include/asm}/multicall.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/mwait.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/nmi.h    |   0
>  .../asm-x86 => arch/x86/include/asm}/nops.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/nospec.h |   0
>  .../asm-x86 => arch/x86/include/asm}/numa.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/p2m.h    |   0
>  .../x86/include/asm}/page-bits.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/page.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/paging.h |   0
>  .../asm-x86 => arch/x86/include/asm}/pci.h    |   0
>  .../asm-x86 => arch/x86/include/asm}/percpu.h |   0
>  .../asm-x86 => arch/x86/include/asm}/perfc.h  |   0
>  .../x86/include/asm}/perfc_defn.h             |   0
>  .../x86/include/asm}/processor.h              |   0
>  .../asm-x86 => arch/x86/include/asm}/psr.h    |   0
>  .../x86/include/asm}/pv/domain.h              |   0
>  .../x86/include/asm}/pv/grant_table.h         |   0
>  .../asm-x86 => arch/x86/include/asm}/pv/mm.h  |   0
>  .../x86/include/asm}/pv/shim.h                |   0
>  .../x86/include/asm}/pv/traps.h               |   0
>  .../asm-x86 => arch/x86/include/asm}/random.h |   0
>  .../asm-x86 => arch/x86/include/asm}/regs.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/setup.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/shadow.h |   0
>  .../asm-x86 => arch/x86/include/asm}/shared.h |   0
>  .../asm-x86 => arch/x86/include/asm}/smp.h    |   0
>  .../x86/include/asm}/softirq.h                |   0
>  .../x86/include/asm}/spec_ctrl.h              |   0
>  .../x86/include/asm}/spec_ctrl_asm.h          |   0
>  .../x86/include/asm}/spinlock.h               |   0
>  .../asm-x86 => arch/x86/include/asm}/string.h |   0
>  .../asm-x86 => arch/x86/include/asm}/system.h |   0
>  .../asm-x86 => arch/x86/include/asm}/tboot.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/time.h   |   0
>  .../asm-x86 => arch/x86/include/asm}/trace.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/traps.h  |   0
>  .../asm-x86 => arch/x86/include/asm}/types.h  |   0
>  .../x86/include/asm}/uaccess.h                |   0
>  .../x86/include/asm}/unaligned.h              |   0
>  .../x86/include/asm}/vm_event.h               |   0
>  .../asm-x86 => arch/x86/include/asm}/vpmu.h   |   0
>  .../x86/include/asm}/x86-defns.h              |   0
>  .../x86/include/asm}/x86-vendors.h            |   0
>  .../x86/include/asm}/x86_64/efibind.h         |   0
>  .../x86/include/asm}/x86_64/elf.h             |   0
>  .../x86/include/asm}/x86_64/page.h            |   0
>  .../x86/include/asm}/x86_64/regs.h            |   0
>  .../x86/include/asm}/x86_64/system.h          |   0
>  .../x86/include/asm}/x86_64/uaccess.h         |   0
>  .../x86/include/asm}/x86_emulate.h            |   2 +-
>  .../x86/include/asm}/xenoprof.h               |   0
>  .../asm-x86 => arch/x86/include/asm}/xstate.h |   0
>  xen/arch/x86/mm/Makefile                      |   9 -
>  xen/arch/x86/mm/guest_walk.c                  |   3 -
>  xen/arch/x86/mm/guest_walk_2.c                |   2 +
>  xen/arch/x86/mm/guest_walk_3.c                |   2 +
>  xen/arch/x86/mm/guest_walk_4.c                |   2 +
>  xen/arch/x86/mm/hap/Makefile                  |  15 +-
>  xen/arch/x86/mm/hap/guest_walk.c              |   3 -
>  xen/arch/x86/mm/hap/guest_walk_2.c            |   2 +
>  xen/arch/x86/mm/hap/guest_walk_3.c            |   2 +
>  xen/arch/x86/mm/hap/guest_walk_4.c            |   2 +
>  xen/arch/x86/mm/shadow/Makefile               |   9 -
>  xen/arch/x86/mm/shadow/guest_2.c              |   2 +
>  xen/arch/x86/mm/shadow/guest_3.c              |   2 +
>  xen/arch/x86/mm/shadow/guest_4.c              |   2 +
>  xen/arch/x86/mm/shadow/multi.c                |   3 -
>  xen/build.mk                                  |  87 ++++
>  xen/common/Makefile                           |  14 +-
>  xen/common/efi/runtime.c                      |   2 +-
>  xen/common/libelf/Makefile                    |   4 +-
>  xen/common/libfdt/Makefile                    |   8 +-
>  xen/common/page_alloc.c                       |   2 +-
>  xen/include/Makefile                          |  81 ++--
>  xen/include/xen/acpi.h                        |   5 +-
>  xen/include/xen/bitmap.h                      |   2 +-
>  xen/scripts/Kbuild.include                    |  65 ++-
>  xen/scripts/Kconfig.include                   |   2 +-
>  xen/scripts/Makefile.clean                    |  40 +-
>  xen/{tools/kconfig => scripts}/Makefile.host  |  29 +-
>  xen/scripts/mkmakefile                        |  17 +
>  xen/test/Makefile                             |  16 +-
>  xen/test/livepatch/Makefile                   | 213 ++++-----
>  xen/tools/Makefile                            |  14 +-
>  xen/tools/compat-build-header.py              |  44 +-
>  xen/tools/compat-build-source.py              |   8 +-
>  xen/tools/fixdep.c                            | 404 +++++++++++++++++
>  xen/tools/kconfig/Makefile.kconfig            | 106 -----
>  xen/tools/kconfig/confdata.c                  |   2 +-
>  xen/tools/symbols.c                           |  18 +-
>  xen/xsm/flask/Makefile                        |  45 +-
>  xen/xsm/flask/policy/mkaccess_vector.sh       |   7 +-
>  xen/xsm/flask/ss/Makefile                     |   5 +-
>  378 files changed, 1572 insertions(+), 978 deletions(-)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/acpi.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/alternative.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/altp2m.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/atomic.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/bitops.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/bug.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/cmpxchg.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/flushtlb.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/insn.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/io.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/macros.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/mm.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/page.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/processor.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/sysregs.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/system.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/traps.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm32/vfp.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/atomic.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/bitops.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/brk.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/bug.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/cmpxchg.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/efibind.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/flushtlb.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/hsr.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/insn.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/io.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/macros.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/mm.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/page.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/processor.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/sysregs.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/system.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/traps.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/arm64/vfp.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/asm_defns.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/atomic.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/bitops.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/bug.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/byteorder.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/cache.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/cadence-uart.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/config.h (99%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/cpregs.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/cpuerrata.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/cpufeature.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/current.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/debugger.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/delay.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/desc.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/device.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/div64.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/domain.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/domain_build.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/early_printk.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/efibind.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/elf.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/event.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/exynos4210-uart.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/flushtlb.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/gic.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/gic_v3_defs.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/gic_v3_its.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/grant_table.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/guest_access.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/guest_atomics.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/guest_walk.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/hardirq.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/hsr.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/hypercall.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/init.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/insn.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/io.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/iocap.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/iommu.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/iommu_fwspec.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/ioreq.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/irq.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/kernel.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/livepatch.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/lpae.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/macros.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/mem_access.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/mm.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/mmio.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/monitor.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/new_vgic.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/nospec.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/numa.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/p2m.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/page-bits.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/page.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/paging.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/pci.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/percpu.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/perfc.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/perfc_defn.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/pl011-uart.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/platform.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/exynos5.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/midway.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/omap5.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/vexpress.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/platforms/xilinx-zynqmp-eemi.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/processor.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/procinfo.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/psci.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/random.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/regs.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/scif-uart.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/setup.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/short-desc.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/smccc.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/smp.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/softirq.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/spinlock.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/string.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/sysregs.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/system.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_msg.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_rpc_cmd.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/tee/optee_smc.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/tee/tee.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/time.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/trace.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/traps.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/types.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vfp.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vgic-emul.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vgic.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vm_event.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vpl011.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vpsci.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vreg.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/vtimer.h (100%)
>  rename xen/{include/asm-arm => arch/arm/include/asm}/xenoprof.h (100%)
>  rename xen/{include/asm-riscv => arch/riscv/include/asm}/config.h (100%)
>  create mode 100644 xen/arch/riscv/riscv64/Makefile
>  delete mode 100644 xen/arch/x86/boot/build32.mk
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/acpi.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/alternative-asm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/alternative.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/altp2m.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/amd.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/apic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/apicdef.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/asm-defns.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/asm_defns.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/atomic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/bitops.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/bug.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/byteorder.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/bzimage.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/cache.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/compat.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/config.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeature.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeatures.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/cpufeatureset.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/cpuid.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/cpuidle.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/current.h (99%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/debugger.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/debugreg.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/delay.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/desc.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/device.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/div64.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/dom0_build.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/domain.h (99%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/e820.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/edd.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/efibind.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/elf.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/event.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/fixmap.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/flushtlb.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/genapic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/grant_table.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv-hcall.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv-tlfs.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hyperv.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/hypervisor.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/pvh-boot.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/xen-hcall.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest/xen.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_access.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_atomics.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/guest_pt.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hap.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hardirq.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hpet.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/asid.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/cacheattr.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/domain.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/emulate.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/grant_table.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/guest_access.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/hvm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/io.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/ioreq.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/irq.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/monitor.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/nestedhvm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/save.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/support.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/asid.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/emulate.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/intr.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/nestedsvm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/svm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/svmdebug.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/svm/vmcb.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/trace.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vcpu.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vioapic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/viridian.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vlapic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vm_event.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vmcs.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vmx.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vmx/vvmx.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vpic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hvm/vpt.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/hypercall.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/i387.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/init.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/invpcid.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/io.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/io_apic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/iocap.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/iommu.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/ioreq.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/irq.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/ldt.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/livepatch.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/bios_ebda.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/io_ports.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/irq_vectors.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/mach_mpparse.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-default/mach_mpspec.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-generic/mach_apic.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mach-generic/mach_mpparse.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/machine_kexec.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mc146818rtc.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mce.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_access.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_paging.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mem_sharing.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/microcode.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/monitor.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mpspec.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mpspec_def.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/msi.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/msr-index.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/msr.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mtrr.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/multicall.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/mwait.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/nmi.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/nops.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/nospec.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/numa.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/p2m.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/page-bits.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/page.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/paging.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/pci.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/percpu.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/perfc.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/perfc_defn.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/processor.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/psr.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/domain.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/grant_table.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/mm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/shim.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/pv/traps.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/random.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/regs.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/setup.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/shadow.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/shared.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/smp.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/softirq.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/spec_ctrl.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/spec_ctrl_asm.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/spinlock.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/string.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/system.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/tboot.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/time.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/trace.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/traps.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/types.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/uaccess.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/unaligned.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/vm_event.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/vpmu.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86-defns.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86-vendors.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/efibind.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/elf.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/page.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/regs.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/system.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_64/uaccess.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/x86_emulate.h (89%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/xenoprof.h (100%)
>  rename xen/{include/asm-x86 => arch/x86/include/asm}/xstate.h (100%)
>  create mode 100644 xen/arch/x86/mm/guest_walk_2.c
>  create mode 100644 xen/arch/x86/mm/guest_walk_3.c
>  create mode 100644 xen/arch/x86/mm/guest_walk_4.c
>  create mode 100644 xen/arch/x86/mm/hap/guest_walk_2.c
>  create mode 100644 xen/arch/x86/mm/hap/guest_walk_3.c
>  create mode 100644 xen/arch/x86/mm/hap/guest_walk_4.c
>  create mode 100644 xen/arch/x86/mm/shadow/guest_2.c
>  create mode 100644 xen/arch/x86/mm/shadow/guest_3.c
>  create mode 100644 xen/arch/x86/mm/shadow/guest_4.c
>  create mode 100644 xen/build.mk
>  rename xen/{tools/kconfig => scripts}/Makefile.host (88%)
>  create mode 100755 xen/scripts/mkmakefile
>  create mode 100644 xen/tools/fixdep.c
>  delete mode 100644 xen/tools/kconfig/Makefile.kconfig
> 

