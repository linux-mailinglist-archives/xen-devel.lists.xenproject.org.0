Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09343B931B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148800.275128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZg-0004h8-12; Thu, 01 Jul 2021 14:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148800.275128; Thu, 01 Jul 2021 14:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZf-0004aL-Lt; Thu, 01 Jul 2021 14:21:51 +0000
Received: by outflank-mailman (input) for mailman id 148800;
 Thu, 01 Jul 2021 14:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxQ9-0005tj-2T
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:12:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14314842-9033-4700-8274-ee518aa90883;
 Thu, 01 Jul 2021 14:10:50 +0000 (UTC)
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
X-Inumbo-ID: 14314842-9033-4700-8274-ee518aa90883
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wMjlawSRiHWoCe7r05Ixqb8i36LDLWl65IFqglV03NE=;
  b=do6jNoofOfnXTttEgepaHSGq5kt9anqnWGtjZzxTgkM1ZO2Ww799UQZS
   U2Jskkcj+nlx6MV6ZDNCC922rAWy78EW4af/Q/BntHTLpNTz4/2nnteGx
   bwYqmek8Sl4c/REyHmRYheBpy4WxRGE7BqFTHgJPmBZ/pabi4ropw4JZ7
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KgwEwwFdSBHbhudaD0OB5De4OnkPFINgasweJBn6pR6QQ/NUuqOlmp6gehc6fy/LN+yub+3WJp
 XzCi6DTGhEu2+nsdMT897ZyEx0H4InQTwmoIdV1NSD+tkJuJukgjQAiDSUh6yJ5FJnlNrK6CGE
 +4XHn1lDokFsEGeECg0IcP3OgBEJzWfrILQYCdTmveOxs51UaT4L+4XEyqfohwOw//jC/U2Y/o
 MhY+W9uwbqDrplUwc2mHnf3OOczOxMwr2FrI80eYKHZhZOCI56swkvU7KcnBHSyTGtwvDSlDQu
 sfY=
X-SBRS: 5.1
X-MesageID: 47446833
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8nisKqj4p6cD5EExsIYXmfKnd3BQXgkji2hC6mlwRA09TyVXrb
 HMoB19726OtN/LYgBZpTnkAsK9qBznhPlICOUqUotKGTOKhILKFvAa0WKB+UyEJ8SWzIc06U
 4jScRD4fLLfDxHZK3BjjVQfexB/DEPm5rDuQ9Rp00dMD2Dt8lbnn1EIzfeMEF7XTNLAodRLv
 uhDrMtnUvHRZ1uVLXYOkU4
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47446833"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	<aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Paul Durrant <paul@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, "Kevin Tian" <kevin.tian@intel.com>, Lukasz
 Hawrylko <lukasz.hawrylko@linux.intel.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [XEN PATCH v6 18/31] xen: move include/asm-* to include/arch-*/asm
Date: Thu, 1 Jul 2021 15:09:58 +0100
Message-ID: <20210701141011.785641-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This avoid the need to create the symbolic link "include/asm".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Other possible locations that I could think of:
include/arch/*/asm
arch/*/include/asm
---
 .gitignore                                    |  5 ++-
 MAINTAINERS                                   | 36 +++++++++----------
 tools/include/Makefile                        |  2 +-
 tools/misc/xen-access.c                       |  4 +--
 tools/tests/vhpet/Makefile                    |  2 +-
 xen/Makefile                                  | 13 ++++---
 xen/arch/arm/README.LinuxPrimitives           | 10 +++---
 xen/arch/arm/arch.mk                          |  1 +
 xen/arch/arm/arm32/head.S                     |  2 +-
 xen/arch/arm/arm64/head.S                     |  2 +-
 xen/arch/arm/smpboot.c                        |  2 +-
 xen/arch/arm/vpsci.c                          |  2 +-
 xen/arch/x86/Makefile                         |  6 ++--
 xen/arch/x86/arch.mk                          |  5 +--
 xen/common/efi/runtime.c                      | 14 ++++----
 xen/common/page_alloc.c                       |  2 +-
 xen/include/{asm-arm => arch-arm/asm}/acpi.h  |  0
 .../{asm-arm => arch-arm/asm}/alternative.h   |  0
 .../{asm-arm => arch-arm/asm}/altp2m.h        |  0
 .../{asm-arm => arch-arm/asm}/arm32/atomic.h  |  0
 .../{asm-arm => arch-arm/asm}/arm32/bitops.h  |  0
 .../{asm-arm => arch-arm/asm}/arm32/bug.h     |  0
 .../{asm-arm => arch-arm/asm}/arm32/cmpxchg.h |  0
 .../asm}/arm32/flushtlb.h                     |  0
 .../{asm-arm => arch-arm/asm}/arm32/insn.h    |  0
 .../{asm-arm => arch-arm/asm}/arm32/io.h      |  0
 .../{asm-arm => arch-arm/asm}/arm32/macros.h  |  0
 .../{asm-arm => arch-arm/asm}/arm32/mm.h      |  0
 .../{asm-arm => arch-arm/asm}/arm32/page.h    |  0
 .../asm}/arm32/processor.h                    |  0
 .../{asm-arm => arch-arm/asm}/arm32/sysregs.h |  0
 .../{asm-arm => arch-arm/asm}/arm32/system.h  |  0
 .../{asm-arm => arch-arm/asm}/arm32/traps.h   |  0
 .../{asm-arm => arch-arm/asm}/arm32/vfp.h     |  0
 .../{asm-arm => arch-arm/asm}/arm64/atomic.h  |  0
 .../{asm-arm => arch-arm/asm}/arm64/bitops.h  |  0
 .../{asm-arm => arch-arm/asm}/arm64/brk.h     |  0
 .../{asm-arm => arch-arm/asm}/arm64/bug.h     |  0
 .../{asm-arm => arch-arm/asm}/arm64/cmpxchg.h |  0
 .../{asm-arm => arch-arm/asm}/arm64/efibind.h |  0
 .../asm}/arm64/flushtlb.h                     |  0
 .../{asm-arm => arch-arm/asm}/arm64/hsr.h     |  0
 .../{asm-arm => arch-arm/asm}/arm64/insn.h    |  0
 .../{asm-arm => arch-arm/asm}/arm64/io.h      |  0
 .../{asm-arm => arch-arm/asm}/arm64/macros.h  |  0
 .../{asm-arm => arch-arm/asm}/arm64/mm.h      |  0
 .../{asm-arm => arch-arm/asm}/arm64/page.h    |  0
 .../asm}/arm64/processor.h                    |  0
 .../{asm-arm => arch-arm/asm}/arm64/sysregs.h |  0
 .../{asm-arm => arch-arm/asm}/arm64/system.h  |  0
 .../{asm-arm => arch-arm/asm}/arm64/traps.h   |  0
 .../{asm-arm => arch-arm/asm}/arm64/vfp.h     |  0
 .../{asm-arm => arch-arm/asm}/asm_defns.h     |  0
 .../{asm-arm => arch-arm/asm}/atomic.h        |  0
 .../{asm-arm => arch-arm/asm}/bitops.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/bug.h   |  0
 .../{asm-arm => arch-arm/asm}/byteorder.h     |  0
 xen/include/{asm-arm => arch-arm/asm}/cache.h |  0
 .../{asm-arm => arch-arm/asm}/cadence-uart.h  |  0
 .../{asm-arm => arch-arm/asm}/config.h        |  0
 .../{asm-arm => arch-arm/asm}/cpregs.h        |  0
 .../{asm-arm => arch-arm/asm}/cpuerrata.h     |  0
 .../{asm-arm => arch-arm/asm}/cpufeature.h    |  0
 .../{asm-arm => arch-arm/asm}/current.h       |  0
 .../{asm-arm => arch-arm/asm}/debugger.h      |  0
 xen/include/{asm-arm => arch-arm/asm}/delay.h |  0
 xen/include/{asm-arm => arch-arm/asm}/desc.h  |  0
 .../{asm-arm => arch-arm/asm}/device.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/div64.h |  0
 .../{asm-arm => arch-arm/asm}/domain.h        |  0
 .../{asm-arm => arch-arm/asm}/domain_build.h  |  0
 .../{asm-arm => arch-arm/asm}/early_printk.h  |  0
 .../{asm-arm => arch-arm/asm}/efibind.h       |  0
 xen/include/{asm-arm => arch-arm/asm}/elf.h   |  0
 xen/include/{asm-arm => arch-arm/asm}/event.h |  0
 .../asm}/exynos4210-uart.h                    |  0
 .../{asm-arm => arch-arm/asm}/flushtlb.h      |  0
 xen/include/{asm-arm => arch-arm/asm}/gic.h   |  0
 .../{asm-arm => arch-arm/asm}/gic_v3_defs.h   |  0
 .../{asm-arm => arch-arm/asm}/gic_v3_its.h    |  0
 .../{asm-arm => arch-arm/asm}/grant_table.h   |  0
 .../{asm-arm => arch-arm/asm}/guest_access.h  |  0
 .../{asm-arm => arch-arm/asm}/guest_atomics.h |  0
 .../{asm-arm => arch-arm/asm}/guest_walk.h    |  0
 .../{asm-arm => arch-arm/asm}/hardirq.h       |  0
 xen/include/{asm-arm => arch-arm/asm}/hsr.h   |  0
 .../{asm-arm => arch-arm/asm}/hypercall.h     |  0
 xen/include/{asm-arm => arch-arm/asm}/init.h  |  0
 xen/include/{asm-arm => arch-arm/asm}/insn.h  |  0
 xen/include/{asm-arm => arch-arm/asm}/io.h    |  0
 xen/include/{asm-arm => arch-arm/asm}/iocap.h |  0
 xen/include/{asm-arm => arch-arm/asm}/iommu.h |  0
 .../{asm-arm => arch-arm/asm}/iommu_fwspec.h  |  0
 xen/include/{asm-arm => arch-arm/asm}/ioreq.h |  0
 xen/include/{asm-arm => arch-arm/asm}/irq.h   |  0
 .../{asm-arm => arch-arm/asm}/kernel.h        |  0
 .../{asm-arm => arch-arm/asm}/livepatch.h     |  0
 xen/include/{asm-arm => arch-arm/asm}/lpae.h  |  0
 .../{asm-arm => arch-arm/asm}/macros.h        |  0
 .../{asm-arm => arch-arm/asm}/mem_access.h    |  0
 xen/include/{asm-arm => arch-arm/asm}/mm.h    |  0
 xen/include/{asm-arm => arch-arm/asm}/mmio.h  |  0
 .../{asm-arm => arch-arm/asm}/monitor.h       |  0
 .../{asm-arm => arch-arm/asm}/new_vgic.h      |  0
 .../{asm-arm => arch-arm/asm}/nospec.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/numa.h  |  0
 xen/include/{asm-arm => arch-arm/asm}/p2m.h   |  0
 .../{asm-arm => arch-arm/asm}/page-bits.h     |  0
 xen/include/{asm-arm => arch-arm/asm}/page.h  |  0
 .../{asm-arm => arch-arm/asm}/paging.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/pci.h   |  0
 .../{asm-arm => arch-arm/asm}/percpu.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/perfc.h |  0
 .../{asm-arm => arch-arm/asm}/perfc_defn.h    |  0
 .../{asm-arm => arch-arm/asm}/pl011-uart.h    |  0
 .../{asm-arm => arch-arm/asm}/platform.h      |  0
 .../asm}/platforms/exynos5.h                  |  0
 .../asm}/platforms/midway.h                   |  0
 .../asm}/platforms/omap5.h                    |  0
 .../asm}/platforms/vexpress.h                 |  0
 .../asm}/platforms/xilinx-zynqmp-eemi.h       |  0
 .../{asm-arm => arch-arm/asm}/processor.h     |  0
 .../{asm-arm => arch-arm/asm}/procinfo.h      |  0
 xen/include/{asm-arm => arch-arm/asm}/psci.h  |  0
 .../{asm-arm => arch-arm/asm}/random.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/regs.h  |  0
 .../{asm-arm => arch-arm/asm}/scif-uart.h     |  0
 xen/include/{asm-arm => arch-arm/asm}/setup.h |  0
 .../{asm-arm => arch-arm/asm}/short-desc.h    |  0
 xen/include/{asm-arm => arch-arm/asm}/smccc.h |  0
 xen/include/{asm-arm => arch-arm/asm}/smp.h   |  0
 .../{asm-arm => arch-arm/asm}/softirq.h       |  0
 .../{asm-arm => arch-arm/asm}/spinlock.h      |  0
 .../{asm-arm => arch-arm/asm}/string.h        |  0
 .../{asm-arm => arch-arm/asm}/sysregs.h       |  0
 .../{asm-arm => arch-arm/asm}/system.h        |  0
 .../{asm-arm => arch-arm/asm}/tee/optee_msg.h |  0
 .../asm}/tee/optee_rpc_cmd.h                  |  0
 .../{asm-arm => arch-arm/asm}/tee/optee_smc.h |  0
 .../{asm-arm => arch-arm/asm}/tee/tee.h       |  0
 xen/include/{asm-arm => arch-arm/asm}/time.h  |  0
 xen/include/{asm-arm => arch-arm/asm}/trace.h |  0
 xen/include/{asm-arm => arch-arm/asm}/traps.h |  0
 xen/include/{asm-arm => arch-arm/asm}/types.h |  0
 xen/include/{asm-arm => arch-arm/asm}/vfp.h   |  0
 .../{asm-arm => arch-arm/asm}/vgic-emul.h     |  0
 xen/include/{asm-arm => arch-arm/asm}/vgic.h  |  0
 .../{asm-arm => arch-arm/asm}/vm_event.h      |  0
 .../{asm-arm => arch-arm/asm}/vpl011.h        |  0
 xen/include/{asm-arm => arch-arm/asm}/vpsci.h |  0
 xen/include/{asm-arm => arch-arm/asm}/vreg.h  |  0
 .../{asm-arm => arch-arm/asm}/vtimer.h        |  0
 .../{asm-arm => arch-arm/asm}/xenoprof.h      |  0
 .../{asm-riscv => arch-riscv/asm}/config.h    |  0
 xen/include/{asm-x86 => arch-x86/asm}/acpi.h  |  0
 .../asm}/alternative-asm.h                    |  0
 .../{asm-x86 => arch-x86/asm}/alternative.h   |  0
 .../{asm-x86 => arch-x86/asm}/altp2m.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/amd.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/apic.h  |  0
 .../{asm-x86 => arch-x86/asm}/apicdef.h       |  0
 .../{asm-x86 => arch-x86/asm}/asm-defns.h     |  0
 .../{asm-x86 => arch-x86/asm}/asm_defns.h     |  0
 .../{asm-x86 => arch-x86/asm}/atomic.h        |  0
 .../{asm-x86 => arch-x86/asm}/bitops.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/bug.h   |  0
 .../{asm-x86 => arch-x86/asm}/byteorder.h     |  0
 .../{asm-x86 => arch-x86/asm}/bzimage.h       |  0
 xen/include/{asm-x86 => arch-x86/asm}/cache.h |  0
 .../{asm-x86 => arch-x86/asm}/compat.h        |  0
 .../{asm-x86 => arch-x86/asm}/config.h        |  0
 .../{asm-x86 => arch-x86/asm}/cpufeature.h    |  0
 .../{asm-x86 => arch-x86/asm}/cpufeatures.h   |  0
 .../{asm-x86 => arch-x86/asm}/cpufeatureset.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/cpuid.h |  0
 .../{asm-x86 => arch-x86/asm}/cpuidle.h       |  0
 .../{asm-x86 => arch-x86/asm}/current.h       |  2 +-
 .../{asm-x86 => arch-x86/asm}/debugger.h      |  0
 .../{asm-x86 => arch-x86/asm}/debugreg.h      |  0
 xen/include/{asm-x86 => arch-x86/asm}/delay.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/desc.h  |  0
 .../{asm-x86 => arch-x86/asm}/device.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/div64.h |  0
 .../{asm-x86 => arch-x86/asm}/dom0_build.h    |  0
 .../{asm-x86 => arch-x86/asm}/domain.h        |  2 +-
 xen/include/{asm-x86 => arch-x86/asm}/e820.h  |  0
 xen/include/{asm-x86 => arch-x86/asm}/edd.h   |  0
 .../{asm-x86 => arch-x86/asm}/efibind.h       |  0
 xen/include/{asm-x86 => arch-x86/asm}/elf.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/event.h |  0
 .../{asm-x86 => arch-x86/asm}/fixmap.h        |  0
 .../{asm-x86 => arch-x86/asm}/flushtlb.h      |  0
 .../{asm-x86 => arch-x86/asm}/genapic.h       |  0
 .../{asm-x86 => arch-x86/asm}/grant_table.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/guest.h |  0
 .../asm}/guest/hyperv-hcall.h                 |  0
 .../asm}/guest/hyperv-tlfs.h                  |  0
 .../{asm-x86 => arch-x86/asm}/guest/hyperv.h  |  0
 .../asm}/guest/hypervisor.h                   |  0
 .../asm}/guest/pvh-boot.h                     |  0
 .../asm}/guest/xen-hcall.h                    |  0
 .../{asm-x86 => arch-x86/asm}/guest/xen.h     |  0
 .../{asm-x86 => arch-x86/asm}/guest_access.h  |  0
 .../{asm-x86 => arch-x86/asm}/guest_atomics.h |  0
 .../{asm-x86 => arch-x86/asm}/guest_pt.h      |  0
 xen/include/{asm-x86 => arch-x86/asm}/hap.h   |  0
 .../{asm-x86 => arch-x86/asm}/hardirq.h       |  0
 xen/include/{asm-x86 => arch-x86/asm}/hpet.h  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/asid.h      |  0
 .../{asm-x86 => arch-x86/asm}/hvm/cacheattr.h |  0
 .../{asm-x86 => arch-x86/asm}/hvm/domain.h    |  0
 .../{asm-x86 => arch-x86/asm}/hvm/emulate.h   |  0
 .../asm}/hvm/grant_table.h                    |  0
 .../asm}/hvm/guest_access.h                   |  0
 .../{asm-x86 => arch-x86/asm}/hvm/hvm.h       |  0
 .../{asm-x86 => arch-x86/asm}/hvm/io.h        |  0
 .../{asm-x86 => arch-x86/asm}/hvm/ioreq.h     |  0
 .../{asm-x86 => arch-x86/asm}/hvm/irq.h       |  0
 .../{asm-x86 => arch-x86/asm}/hvm/monitor.h   |  0
 .../{asm-x86 => arch-x86/asm}/hvm/nestedhvm.h |  0
 .../{asm-x86 => arch-x86/asm}/hvm/save.h      |  0
 .../{asm-x86 => arch-x86/asm}/hvm/support.h   |  0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/asid.h  |  0
 .../asm}/hvm/svm/emulate.h                    |  0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/intr.h  |  0
 .../asm}/hvm/svm/nestedsvm.h                  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/svm.h   |  0
 .../asm}/hvm/svm/svmdebug.h                   |  0
 .../{asm-x86 => arch-x86/asm}/hvm/svm/vmcb.h  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/trace.h     |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vcpu.h      |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vioapic.h   |  0
 .../{asm-x86 => arch-x86/asm}/hvm/viridian.h  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vlapic.h    |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vm_event.h  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vmx/vmcs.h  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vmx/vmx.h   |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vmx/vvmx.h  |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vpic.h      |  0
 .../{asm-x86 => arch-x86/asm}/hvm/vpt.h       |  0
 .../{asm-x86 => arch-x86/asm}/hypercall.h     |  0
 xen/include/{asm-x86 => arch-x86/asm}/i387.h  |  0
 xen/include/{asm-x86 => arch-x86/asm}/init.h  |  0
 .../{asm-x86 => arch-x86/asm}/invpcid.h       |  0
 xen/include/{asm-x86 => arch-x86/asm}/io.h    |  0
 .../{asm-x86 => arch-x86/asm}/io_apic.h       |  0
 xen/include/{asm-x86 => arch-x86/asm}/iocap.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/iommu.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/ioreq.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/irq.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/ldt.h   |  0
 .../{asm-x86 => arch-x86/asm}/livepatch.h     |  0
 .../asm}/mach-default/bios_ebda.h             |  0
 .../asm}/mach-default/io_ports.h              |  0
 .../asm}/mach-default/irq_vectors.h           |  0
 .../asm}/mach-default/mach_mpparse.h          |  0
 .../asm}/mach-default/mach_mpspec.h           |  0
 .../asm}/mach-generic/mach_apic.h             |  0
 .../asm}/mach-generic/mach_mpparse.h          |  0
 .../{asm-x86 => arch-x86/asm}/machine_kexec.h |  0
 .../{asm-x86 => arch-x86/asm}/mc146818rtc.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/mce.h   |  0
 .../{asm-x86 => arch-x86/asm}/mem_access.h    |  0
 .../{asm-x86 => arch-x86/asm}/mem_paging.h    |  0
 .../{asm-x86 => arch-x86/asm}/mem_sharing.h   |  0
 .../{asm-x86 => arch-x86/asm}/microcode.h     |  0
 xen/include/{asm-x86 => arch-x86/asm}/mm.h    |  0
 .../{asm-x86 => arch-x86/asm}/monitor.h       |  0
 .../{asm-x86 => arch-x86/asm}/mpspec.h        |  0
 .../{asm-x86 => arch-x86/asm}/mpspec_def.h    |  0
 xen/include/{asm-x86 => arch-x86/asm}/msi.h   |  0
 .../{asm-x86 => arch-x86/asm}/msr-index.h     |  0
 xen/include/{asm-x86 => arch-x86/asm}/msr.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/mtrr.h  |  0
 .../{asm-x86 => arch-x86/asm}/multicall.h     |  0
 xen/include/{asm-x86 => arch-x86/asm}/mwait.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/nmi.h   |  0
 xen/include/{asm-x86 => arch-x86/asm}/nops.h  |  0
 .../{asm-x86 => arch-x86/asm}/nospec.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/numa.h  |  0
 xen/include/{asm-x86 => arch-x86/asm}/p2m.h   |  0
 .../{asm-x86 => arch-x86/asm}/page-bits.h     |  0
 xen/include/{asm-x86 => arch-x86/asm}/page.h  |  0
 .../{asm-x86 => arch-x86/asm}/paging.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/pci.h   |  0
 .../{asm-x86 => arch-x86/asm}/percpu.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/perfc.h |  0
 .../{asm-x86 => arch-x86/asm}/perfc_defn.h    |  0
 .../{asm-x86 => arch-x86/asm}/processor.h     |  0
 xen/include/{asm-x86 => arch-x86/asm}/psr.h   |  0
 .../{asm-x86 => arch-x86/asm}/pv/domain.h     |  0
 .../asm}/pv/grant_table.h                     |  0
 xen/include/{asm-x86 => arch-x86/asm}/pv/mm.h |  0
 .../{asm-x86 => arch-x86/asm}/pv/shim.h       |  0
 .../{asm-x86 => arch-x86/asm}/pv/traps.h      |  0
 .../{asm-x86 => arch-x86/asm}/random.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/regs.h  |  0
 xen/include/{asm-x86 => arch-x86/asm}/setup.h |  0
 .../{asm-x86 => arch-x86/asm}/shadow.h        |  0
 .../{asm-x86 => arch-x86/asm}/shared.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/smp.h   |  0
 .../{asm-x86 => arch-x86/asm}/softirq.h       |  0
 .../{asm-x86 => arch-x86/asm}/spec_ctrl.h     |  0
 .../{asm-x86 => arch-x86/asm}/spec_ctrl_asm.h |  0
 .../{asm-x86 => arch-x86/asm}/spinlock.h      |  0
 .../{asm-x86 => arch-x86/asm}/string.h        |  0
 .../{asm-x86 => arch-x86/asm}/system.h        |  0
 xen/include/{asm-x86 => arch-x86/asm}/tboot.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/time.h  |  0
 xen/include/{asm-x86 => arch-x86/asm}/trace.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/traps.h |  0
 xen/include/{asm-x86 => arch-x86/asm}/types.h |  0
 .../{asm-x86 => arch-x86/asm}/uaccess.h       |  0
 .../{asm-x86 => arch-x86/asm}/unaligned.h     |  0
 .../{asm-x86 => arch-x86/asm}/vm_event.h      |  0
 xen/include/{asm-x86 => arch-x86/asm}/vpmu.h  |  0
 .../{asm-x86 => arch-x86/asm}/x86-defns.h     |  0
 .../{asm-x86 => arch-x86/asm}/x86-vendors.h   |  0
 .../asm}/x86_64/efibind.h                     |  0
 .../{asm-x86 => arch-x86/asm}/x86_64/elf.h    |  0
 .../{asm-x86 => arch-x86/asm}/x86_64/page.h   |  0
 .../{asm-x86 => arch-x86/asm}/x86_64/regs.h   |  0
 .../{asm-x86 => arch-x86/asm}/x86_64/system.h |  0
 .../asm}/x86_64/uaccess.h                     |  0
 .../{asm-x86 => arch-x86/asm}/x86_emulate.h   |  0
 .../{asm-x86 => arch-x86/asm}/xenoprof.h      |  0
 .../{asm-x86 => arch-x86/asm}/xstate.h        |  0
 xen/include/xen/acpi.h                        |  4 +--
 xen/include/xen/bitmap.h                      |  2 +-
 329 files changed, 59 insertions(+), 59 deletions(-)
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

diff --git a/.gitignore b/.gitignore
index 38a085e398e3..91ae22ae9216 100644
--- a/.gitignore
+++ b/.gitignore
@@ -328,9 +328,8 @@ xen/asm-offsets.s
 xen/common/config_data.S
 xen/common/config.gz
 xen/include/headers*.chk
-xen/include/asm
-xen/include/asm-*/asm-offsets.h
-xen/include/asm-x86/asm-macros.h
+xen/include/arch-*/asm/asm-offsets.h
+xen/include/arch-x86/asm/asm-macros.h
 xen/include/compat/*
 xen/include/config/
 xen/include/generated/
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a52a03969fe..03a5553116a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -245,7 +245,7 @@ F:	xen/drivers/char/omap-uart.c
 F:	xen/drivers/char/pl011.c
 F:	xen/drivers/char/scif-uart.c
 F:	xen/drivers/passthrough/arm/
-F:	xen/include/asm-arm/
+F:	xen/include/arch-arm/
 F:	xen/include/public/arch-arm/
 F:	xen/include/public/arch-arm.h
 
@@ -293,8 +293,8 @@ S:	Supported
 F:	xen/arch/x86/efi/
 F:	xen/common/efi/
 F:	xen/include/efi/
-F:	xen/include/asm-x86/efi*.h
-F:	xen/include/asm-x86/x86_*/efi*.h
+F:	xen/include/arch-x86/asm/efi*.h
+F:	xen/include/arch-x86/asm/x86_*/efi*.h
 
 GDBSX DEBUGGER
 M:	Elena Ufimtseva <elena.ufimtseva@oracle.com>
@@ -321,7 +321,7 @@ INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
 S:	Odd Fixes
 F:	xen/arch/x86/tboot.c
-F:	xen/include/asm-x86/tboot.h
+F:	xen/include/arch-x86/asm/tboot.h
 
 INTEL(R) VT FOR DIRECTED I/O (VT-D)
 M:	Kevin Tian <kevin.tian@intel.com>
@@ -334,7 +334,7 @@ M:	Kevin Tian <kevin.tian@intel.com>
 S:	Supported
 F:	xen/arch/x86/hvm/vmx/
 F:	xen/arch/x86/mm/p2m-ept.c
-F:	xen/include/asm-x86/hvm/vmx/
+F:	xen/include/arch-x86/asm/hvm/vmx/
 F:	xen/arch/x86/cpu/vpmu_intel.c
 
 IOMMU VENDOR INDEPENDENT CODE
@@ -399,7 +399,7 @@ F:	tools/misc/xen-livepatch.c
 F:	xen/arch/*/livepatch*
 F:	xen/arch/*/*/livepatch*
 F:	xen/common/livepatch*
-F:	xen/include/asm-*/livepatch.h
+F:	xen/include/arch-*/asm/livepatch.h
 F:	xen/include/xen/livepatch*
 F:	xen/test/livepatch/*
 
@@ -500,7 +500,7 @@ TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 S:	Supported
 F:	xen/arch/arm/tee/
-F:	xen/include/asm-arm/tee
+F:	xen/include/arch-arm/asm/tee
 
 TOOLSTACK
 M:	Ian Jackson <iwj@xenproject.org>
@@ -537,8 +537,8 @@ F:	xen/common/vm_event.c
 F:	xen/include/*/mem_access.h
 F:	xen/include/*/monitor.h
 F:	xen/include/*/vm_event.h
-F:	xen/include/asm-x86/hvm/monitor.h
-F:	xen/include/asm-x86/hvm/vm_event.h
+F:	xen/include/arch-x86/asm/hvm/monitor.h
+F:	xen/include/arch-x86/asm/hvm/vm_event.h
 
 VPCI
 M:	Roger Pau Monné <roger.pau@citrix.com>
@@ -564,7 +564,7 @@ R:	Wei Liu <wl@xen.org>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
-F:	xen/include/asm-x86/
+F:	xen/include/arch-x86/
 F:	xen/include/public/arch-x86/
 F:	xen/include/xen/lib/x86
 F:	xen/lib/x86
@@ -584,10 +584,10 @@ F:	xen/arch/x86/hvm/emulate.c
 F:	xen/arch/x86/hvm/intercept.c
 F:	xen/arch/x86/hvm/io.c
 F:	xen/arch/x86/hvm/ioreq.c
-F:	xen/include/asm-x86/hvm/emulate.h
-F:	xen/include/asm-x86/hvm/io.h
-F:	xen/include/asm-x86/hvm/ioreq.h
-F:	xen/include/asm-x86/ioreq.h
+F:	xen/include/arch-x86/asm/hvm/emulate.h
+F:	xen/include/arch-x86/asm/hvm/io.h
+F:	xen/include/arch-x86/asm/hvm/ioreq.h
+F:	xen/include/arch-x86/asm/ioreq.h
 
 X86 MEMORY MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
@@ -619,10 +619,10 @@ M:	Wei Liu <wl@xen.org>
 S:	Supported
 F:	xen/arch/x86/guest/hyperv/
 F:	xen/arch/x86/hvm/viridian/
-F:	xen/include/asm-x86/guest/hyperv.h
-F:	xen/include/asm-x86/guest/hyperv-hcall.h
-F:	xen/include/asm-x86/guest/hyperv-tlfs.h
-F:	xen/include/asm-x86/hvm/viridian.h
+F:	xen/include/arch-x86/asm/guest/hyperv.h
+F:	xen/include/arch-x86/asm/guest/hyperv-hcall.h
+F:	xen/include/arch-x86/asm/guest/hyperv-tlfs.h
+F:	xen/include/arch-x86/asm/hvm/viridian.h
 
 XENSTORE
 M:	Ian Jackson <iwj@xenproject.org>
diff --git a/tools/include/Makefile b/tools/include/Makefile
index 42605d46b937..85b105173741 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -30,7 +30,7 @@ xen-dir:
 	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
 	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
 ifeq ($(CONFIG_X86),y)
-	ln -s $(XEN_ROOT)/xen/include/asm-x86 xen/asm
+	ln -s $(XEN_ROOT)/xen/include/arch-x86/asm xen/asm
 	mkdir -p xen/lib/x86
 	ln -s $(filter-out %autogen.h,$(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h)) xen/lib/x86/
 	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
diff --git a/tools/misc/xen-access.c b/tools/misc/xen-access.c
index 4bbef0bd2e10..d87325800c5b 100644
--- a/tools/misc/xen-access.c
+++ b/tools/misc/xen-access.c
@@ -56,11 +56,11 @@
 #define ERROR(a, b...) fprintf(stderr, a "\n", ## b)
 #define PERROR(a, b...) fprintf(stderr, a ": %s\n", ## b, strerror(errno))
 
-/* From xen/include/asm-x86/processor.h */
+/* From xen/include/arch-x86/asm/processor.h */
 #define X86_TRAP_DEBUG  1
 #define X86_TRAP_INT3   3
 
-/* From xen/include/asm-x86/x86-defns.h */
+/* From xen/include/arch-x86/asm/x86-defns.h */
 #define X86_CR4_PGE        0x00000080 /* enable global pages */
 
 typedef struct vm_event {
diff --git a/tools/tests/vhpet/Makefile b/tools/tests/vhpet/Makefile
index cb88dd01c5f8..72f08dea22d8 100644
--- a/tools/tests/vhpet/Makefile
+++ b/tools/tests/vhpet/Makefile
@@ -32,7 +32,7 @@ distclean: clean
 .PHONY: install
 install:
 
-hpet.h: $(XEN_ROOT)/xen/include/asm-x86/hpet.h
+hpet.h: $(XEN_ROOT)/xen/include/arch-x86/asm/hpet.h
 	cp $< $@
 
 hpet.c: $(XEN_ROOT)/xen/arch/x86/hvm/hpet.c
diff --git a/xen/Makefile b/xen/Makefile
index 06d7bfab3e2c..7e3e4c42d77b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -164,7 +164,7 @@ ifeq ($(TARGET_ARCH),x86)
 t1 = $(call as-insn,$(CC),".L0: .L1: .skip (.L1 - .L0)",,-no-integrated-as)
 
 # Check whether clang asm()-s support .include.
-t2 = $(call as-insn,$(CC) -I$(BASEDIR)/include,".include \"asm-x86/asm-defns.h\"",,-no-integrated-as)
+t2 = $(call as-insn,$(CC) -I$(BASEDIR)/include/arch-x86,".include \"asm/asm-defns.h\"",,-no-integrated-as)
 
 # Check whether clang keeps .macro-s between asm()-s:
 # https://bugs.llvm.org/show_bug.cgi?id=36110
@@ -367,7 +367,7 @@ _clean: delete-unfresh-files
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
-	rm -f asm-offsets.s include/asm-*/asm-offsets.h
+	rm -f asm-offsets.s include/arch-*/asm/asm-offsets.h
 	rm -f .banner
 
 .PHONY: _distclean
@@ -381,7 +381,6 @@ $(TARGET).gz: $(TARGET)
 $(TARGET): delete-unfresh-files
 	$(MAKE) -C tools
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
-	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
 		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
 		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
@@ -389,7 +388,7 @@ $(TARGET): delete-unfresh-files
 		true
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
-	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
+	$(MAKE) -f $(BASEDIR)/Rules.mk include/arch-$(TARGET_ARCH)/asm/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
 # drivers/char/console.o contains static banner/compile info. Blow it away.
@@ -429,7 +428,7 @@ asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
-include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
+include/arch-$(TARGET_ARCH)/asm/asm-offsets.h: asm-offsets.s
 	@(set -e; \
 	  echo "/*"; \
 	  echo " * DO NOT MODIFY."; \
@@ -447,8 +446,8 @@ include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
 
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
-    ( find include/asm-$(TARGET_ARCH) -name '*.h' -print; \
-      find include -name 'asm-*' -prune -o -name '*.h' -print; \
+    ( find include/arch-$(TARGET_ARCH) -name '*.h' -print; \
+      find include -name 'arch-*' -prune -o -name '*.h' -print; \
       find $(SUBDIRS) -name '*.[chS]' -print )
 endef
 
diff --git a/xen/arch/arm/README.LinuxPrimitives b/xen/arch/arm/README.LinuxPrimitives
index 664a9f89ed27..733cc22c2cd5 100644
--- a/xen/arch/arm/README.LinuxPrimitives
+++ b/xen/arch/arm/README.LinuxPrimitives
@@ -8,19 +8,19 @@ arm64:
 
 bitops: last sync @ v3.16-rc6 (last commit: 8715466b6027)
 
-linux/arch/arm64/include/asm/bitops.h   xen/include/asm-arm/arm64/bitops.h
+linux/arch/arm64/include/asm/bitops.h   xen/include/arch-arm/asm/arm64/bitops.h
 
 ---------------------------------------------------------------------
 
 cmpxchg: last sync @ v3.16-rc6 (last commit: e1dfda9ced9b)
 
-linux/arch/arm64/include/asm/cmpxchg.h  xen/include/asm-arm/arm64/cmpxchg.h
+linux/arch/arm64/include/asm/cmpxchg.h  xen/include/arch-arm/asm/arm64/cmpxchg.h
 
 ---------------------------------------------------------------------
 
 atomics: last sync @ v3.16-rc6 (last commit: 8715466b6027)
 
-linux/arch/arm64/include/asm/atomic.h   xen/include/asm-arm/arm64/atomic.h
+linux/arch/arm64/include/asm/atomic.h   xen/include/arch-arm/asm/arm64/atomic.h
 
 The following functions were taken from Linux:
     atomic_add(), atomic_add_return(), atomic_sub(), atomic_sub_return(),
@@ -76,13 +76,13 @@ diff -u ../linux/arch/arm/lib/findbit.S xen/arch/arm/arm32/lib/findbit.S
 
 cmpxchg: last sync @ v3.16-rc6 (last commit: c32ffce0f66e)
 
-linux/arch/arm/include/asm/cmpxchg.h    xen/include/asm-arm/arm32/cmpxchg.h
+linux/arch/arm/include/asm/cmpxchg.h    xen/include/arch-arm/asm/arm32/cmpxchg.h
 
 ---------------------------------------------------------------------
 
 atomics: last sync @ v3.16-rc6 (last commit: 030d0178bdbd)
 
-linux/arch/arm/include/asm/atomic.h     xen/include/asm-arm/arm32/atomic.h
+linux/arch/arm/include/asm/atomic.h     xen/include/arch-arm/asm/arm32/atomic.h
 
 The following functions were taken from Linux:
     atomic_add(), atomic_add_return(), atomic_sub(), atomic_sub_return(),
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 6a2982059486..f54e602301be 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
 
 CFLAGS += -I$(BASEDIR)/include
+CFLAGS += -I$(BASEDIR)/include/arch-$(TARGET_ARCH)
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 7178865f48c3..5cd4f19aa199 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -599,7 +599,7 @@ remove_identity_mapping:
         strd  r2, r3, [r0, r1]
 
 identity_mapping_removed:
-        /* See asm-arm/arm32/flushtlb.h for the explanation of the sequence. */
+        /* See arch-arm/asm/arm32/flushtlb.h for the explanation of the sequence. */
         dsb   nshst
         mcr   CP32(r0, TLBIALLH)
         dsb   nsh
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c76498..135fdccabdf0 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -737,7 +737,7 @@ remove_identity_mapping:
         str   xzr, [x0, x1, lsl #3]
 
 identity_mapping_removed:
-        /* See asm-arm/arm64/flushtlb.h for the explanation of the sequence. */
+        /* See arch-arm/asm/arm64/flushtlb.h for the explanation of the sequence. */
         dsb   nshst
         tlbi  alle2
         dsb   nsh
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a1ee3146efeb..df10c617c8f7 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -46,7 +46,7 @@ struct cpuinfo_arm cpu_data[NR_CPUS];
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
-/* Fake one node for now. See also include/asm-arm/numa.h */
+/* Fake one node for now. See also include/arch-arm/asm/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* Xen stack for bringing up the first CPU. */
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index c1e250be5967..8b93fd2cd5b7 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -278,7 +278,7 @@ bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid)
 bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     /*
-     * /!\ VPSCI_NR_FUNCS (in asm-arm/vpsci.h) should be updated when
+     * /!\ VPSCI_NR_FUNCS (in arch-arm/asm/vpsci.h) should be updated when
      * adding/removing a function. SCCC_SMCCC_*_REVISION should be
      * updated once per release.
      */
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 08a4ec1944d3..bb446a1b928d 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -275,11 +275,11 @@ efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
 efi/buildid.o efi/relocs-dummy.o: ;
 
 .PHONY: include
-include: $(BASEDIR)/include/asm-x86/asm-macros.h
+include: $(BASEDIR)/include/arch-x86/asm/asm-macros.h
 
 asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
+$(BASEDIR)/include/arch-x86/asm/asm-macros.h: asm-macros.i Makefile
 	echo '#if 0' >$@.new
 	echo '.if 0' >>$@.new
 	echo '#endif' >>$@.new
@@ -306,7 +306,7 @@ efi/mkreloc: efi/mkreloc.c
 .PHONY: clean
 clean::
 	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
-	rm -f asm-macros.i $(BASEDIR)/include/asm-x86/asm-macros.*
+	rm -f asm-macros.i $(BASEDIR)/include/arch-x86/asm/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index ce0c1a0e7fb2..9f5fade39e91 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -4,8 +4,9 @@
 export XEN_IMG_OFFSET := 0x200000
 
 CFLAGS += -I$(BASEDIR)/include
-CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
-CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
+CFLAGS += -I$(BASEDIR)/include/arch-$(TARGET_ARCH)
+CFLAGS += -I$(BASEDIR)/include/arch-x86/asm/mach-generic
+CFLAGS += -I$(BASEDIR)/include/arch-x86/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 375b94229e13..d54bae560487 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -12,13 +12,13 @@ struct efi_rs_state {
 #ifdef CONFIG_X86
  /*
   * The way stacks get set up leads to them always being on an 8-byte
-  * boundary not evenly divisible by 16 (see asm-x86/current.h). The EFI ABI,
-  * just like the CPU one, however requires stacks to be 16-byte aligned
-  * before every function call. Since the compiler assumes this (unless
-  * passing it -mpreferred-stack-boundary=3), it wouldn't generate code to
-  * align the stack to 16 bytes even if putting a 16-byte aligned object
-  * there. Hence we need to force larger than 16-byte alignment, even if we
-  * don't strictly need that.
+  * boundary not evenly divisible by 16 (see arch-x86/asm/current.h). The
+  * EFI ABI, just like the CPU one, however requires stacks to be 16-byte
+  * aligned before every function call. Since the compiler assumes this
+  * (unless passing it -mpreferred-stack-boundary=3), it wouldn't generate
+  * code to align the stack to 16 bytes even if putting a 16-byte aligned
+  * object there. Hence we need to force larger than 16-byte alignment,
+  * even if we don't strictly need that.
   */
  unsigned long __aligned(32) cr3;
 #endif
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0cd9256..5cf9b3011cdb 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -241,7 +241,7 @@ PAGE_LIST_HEAD(page_broken_list);
 
 /*
  * first_valid_mfn is exported because it is use in ARM specific NUMA
- * helpers. See comment in asm-arm/numa.h.
+ * helpers. See comment in arch-arm/asm/numa.h.
  */
 mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
 
diff --git a/xen/include/asm-arm/acpi.h b/xen/include/arch-arm/asm/acpi.h
similarity index 100%
rename from xen/include/asm-arm/acpi.h
rename to xen/include/arch-arm/asm/acpi.h
diff --git a/xen/include/asm-arm/alternative.h b/xen/include/arch-arm/asm/alternative.h
similarity index 100%
rename from xen/include/asm-arm/alternative.h
rename to xen/include/arch-arm/asm/alternative.h
diff --git a/xen/include/asm-arm/altp2m.h b/xen/include/arch-arm/asm/altp2m.h
similarity index 100%
rename from xen/include/asm-arm/altp2m.h
rename to xen/include/arch-arm/asm/altp2m.h
diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/include/arch-arm/asm/arm32/atomic.h
similarity index 100%
rename from xen/include/asm-arm/arm32/atomic.h
rename to xen/include/arch-arm/asm/arm32/atomic.h
diff --git a/xen/include/asm-arm/arm32/bitops.h b/xen/include/arch-arm/asm/arm32/bitops.h
similarity index 100%
rename from xen/include/asm-arm/arm32/bitops.h
rename to xen/include/arch-arm/asm/arm32/bitops.h
diff --git a/xen/include/asm-arm/arm32/bug.h b/xen/include/arch-arm/asm/arm32/bug.h
similarity index 100%
rename from xen/include/asm-arm/arm32/bug.h
rename to xen/include/arch-arm/asm/arm32/bug.h
diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/arch-arm/asm/arm32/cmpxchg.h
similarity index 100%
rename from xen/include/asm-arm/arm32/cmpxchg.h
rename to xen/include/arch-arm/asm/arm32/cmpxchg.h
diff --git a/xen/include/asm-arm/arm32/flushtlb.h b/xen/include/arch-arm/asm/arm32/flushtlb.h
similarity index 100%
rename from xen/include/asm-arm/arm32/flushtlb.h
rename to xen/include/arch-arm/asm/arm32/flushtlb.h
diff --git a/xen/include/asm-arm/arm32/insn.h b/xen/include/arch-arm/asm/arm32/insn.h
similarity index 100%
rename from xen/include/asm-arm/arm32/insn.h
rename to xen/include/arch-arm/asm/arm32/insn.h
diff --git a/xen/include/asm-arm/arm32/io.h b/xen/include/arch-arm/asm/arm32/io.h
similarity index 100%
rename from xen/include/asm-arm/arm32/io.h
rename to xen/include/arch-arm/asm/arm32/io.h
diff --git a/xen/include/asm-arm/arm32/macros.h b/xen/include/arch-arm/asm/arm32/macros.h
similarity index 100%
rename from xen/include/asm-arm/arm32/macros.h
rename to xen/include/arch-arm/asm/arm32/macros.h
diff --git a/xen/include/asm-arm/arm32/mm.h b/xen/include/arch-arm/asm/arm32/mm.h
similarity index 100%
rename from xen/include/asm-arm/arm32/mm.h
rename to xen/include/arch-arm/asm/arm32/mm.h
diff --git a/xen/include/asm-arm/arm32/page.h b/xen/include/arch-arm/asm/arm32/page.h
similarity index 100%
rename from xen/include/asm-arm/arm32/page.h
rename to xen/include/arch-arm/asm/arm32/page.h
diff --git a/xen/include/asm-arm/arm32/processor.h b/xen/include/arch-arm/asm/arm32/processor.h
similarity index 100%
rename from xen/include/asm-arm/arm32/processor.h
rename to xen/include/arch-arm/asm/arm32/processor.h
diff --git a/xen/include/asm-arm/arm32/sysregs.h b/xen/include/arch-arm/asm/arm32/sysregs.h
similarity index 100%
rename from xen/include/asm-arm/arm32/sysregs.h
rename to xen/include/arch-arm/asm/arm32/sysregs.h
diff --git a/xen/include/asm-arm/arm32/system.h b/xen/include/arch-arm/asm/arm32/system.h
similarity index 100%
rename from xen/include/asm-arm/arm32/system.h
rename to xen/include/arch-arm/asm/arm32/system.h
diff --git a/xen/include/asm-arm/arm32/traps.h b/xen/include/arch-arm/asm/arm32/traps.h
similarity index 100%
rename from xen/include/asm-arm/arm32/traps.h
rename to xen/include/arch-arm/asm/arm32/traps.h
diff --git a/xen/include/asm-arm/arm32/vfp.h b/xen/include/arch-arm/asm/arm32/vfp.h
similarity index 100%
rename from xen/include/asm-arm/arm32/vfp.h
rename to xen/include/arch-arm/asm/arm32/vfp.h
diff --git a/xen/include/asm-arm/arm64/atomic.h b/xen/include/arch-arm/asm/arm64/atomic.h
similarity index 100%
rename from xen/include/asm-arm/arm64/atomic.h
rename to xen/include/arch-arm/asm/arm64/atomic.h
diff --git a/xen/include/asm-arm/arm64/bitops.h b/xen/include/arch-arm/asm/arm64/bitops.h
similarity index 100%
rename from xen/include/asm-arm/arm64/bitops.h
rename to xen/include/arch-arm/asm/arm64/bitops.h
diff --git a/xen/include/asm-arm/arm64/brk.h b/xen/include/arch-arm/asm/arm64/brk.h
similarity index 100%
rename from xen/include/asm-arm/arm64/brk.h
rename to xen/include/arch-arm/asm/arm64/brk.h
diff --git a/xen/include/asm-arm/arm64/bug.h b/xen/include/arch-arm/asm/arm64/bug.h
similarity index 100%
rename from xen/include/asm-arm/arm64/bug.h
rename to xen/include/arch-arm/asm/arm64/bug.h
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/arch-arm/asm/arm64/cmpxchg.h
similarity index 100%
rename from xen/include/asm-arm/arm64/cmpxchg.h
rename to xen/include/arch-arm/asm/arm64/cmpxchg.h
diff --git a/xen/include/asm-arm/arm64/efibind.h b/xen/include/arch-arm/asm/arm64/efibind.h
similarity index 100%
rename from xen/include/asm-arm/arm64/efibind.h
rename to xen/include/arch-arm/asm/arm64/efibind.h
diff --git a/xen/include/asm-arm/arm64/flushtlb.h b/xen/include/arch-arm/asm/arm64/flushtlb.h
similarity index 100%
rename from xen/include/asm-arm/arm64/flushtlb.h
rename to xen/include/arch-arm/asm/arm64/flushtlb.h
diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/include/arch-arm/asm/arm64/hsr.h
similarity index 100%
rename from xen/include/asm-arm/arm64/hsr.h
rename to xen/include/arch-arm/asm/arm64/hsr.h
diff --git a/xen/include/asm-arm/arm64/insn.h b/xen/include/arch-arm/asm/arm64/insn.h
similarity index 100%
rename from xen/include/asm-arm/arm64/insn.h
rename to xen/include/arch-arm/asm/arm64/insn.h
diff --git a/xen/include/asm-arm/arm64/io.h b/xen/include/arch-arm/asm/arm64/io.h
similarity index 100%
rename from xen/include/asm-arm/arm64/io.h
rename to xen/include/arch-arm/asm/arm64/io.h
diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/include/arch-arm/asm/arm64/macros.h
similarity index 100%
rename from xen/include/asm-arm/arm64/macros.h
rename to xen/include/arch-arm/asm/arm64/macros.h
diff --git a/xen/include/asm-arm/arm64/mm.h b/xen/include/arch-arm/asm/arm64/mm.h
similarity index 100%
rename from xen/include/asm-arm/arm64/mm.h
rename to xen/include/arch-arm/asm/arm64/mm.h
diff --git a/xen/include/asm-arm/arm64/page.h b/xen/include/arch-arm/asm/arm64/page.h
similarity index 100%
rename from xen/include/asm-arm/arm64/page.h
rename to xen/include/arch-arm/asm/arm64/page.h
diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/include/arch-arm/asm/arm64/processor.h
similarity index 100%
rename from xen/include/asm-arm/arm64/processor.h
rename to xen/include/arch-arm/asm/arm64/processor.h
diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/arch-arm/asm/arm64/sysregs.h
similarity index 100%
rename from xen/include/asm-arm/arm64/sysregs.h
rename to xen/include/arch-arm/asm/arm64/sysregs.h
diff --git a/xen/include/asm-arm/arm64/system.h b/xen/include/arch-arm/asm/arm64/system.h
similarity index 100%
rename from xen/include/asm-arm/arm64/system.h
rename to xen/include/arch-arm/asm/arm64/system.h
diff --git a/xen/include/asm-arm/arm64/traps.h b/xen/include/arch-arm/asm/arm64/traps.h
similarity index 100%
rename from xen/include/asm-arm/arm64/traps.h
rename to xen/include/arch-arm/asm/arm64/traps.h
diff --git a/xen/include/asm-arm/arm64/vfp.h b/xen/include/arch-arm/asm/arm64/vfp.h
similarity index 100%
rename from xen/include/asm-arm/arm64/vfp.h
rename to xen/include/arch-arm/asm/arm64/vfp.h
diff --git a/xen/include/asm-arm/asm_defns.h b/xen/include/arch-arm/asm/asm_defns.h
similarity index 100%
rename from xen/include/asm-arm/asm_defns.h
rename to xen/include/arch-arm/asm/asm_defns.h
diff --git a/xen/include/asm-arm/atomic.h b/xen/include/arch-arm/asm/atomic.h
similarity index 100%
rename from xen/include/asm-arm/atomic.h
rename to xen/include/arch-arm/asm/atomic.h
diff --git a/xen/include/asm-arm/bitops.h b/xen/include/arch-arm/asm/bitops.h
similarity index 100%
rename from xen/include/asm-arm/bitops.h
rename to xen/include/arch-arm/asm/bitops.h
diff --git a/xen/include/asm-arm/bug.h b/xen/include/arch-arm/asm/bug.h
similarity index 100%
rename from xen/include/asm-arm/bug.h
rename to xen/include/arch-arm/asm/bug.h
diff --git a/xen/include/asm-arm/byteorder.h b/xen/include/arch-arm/asm/byteorder.h
similarity index 100%
rename from xen/include/asm-arm/byteorder.h
rename to xen/include/arch-arm/asm/byteorder.h
diff --git a/xen/include/asm-arm/cache.h b/xen/include/arch-arm/asm/cache.h
similarity index 100%
rename from xen/include/asm-arm/cache.h
rename to xen/include/arch-arm/asm/cache.h
diff --git a/xen/include/asm-arm/cadence-uart.h b/xen/include/arch-arm/asm/cadence-uart.h
similarity index 100%
rename from xen/include/asm-arm/cadence-uart.h
rename to xen/include/arch-arm/asm/cadence-uart.h
diff --git a/xen/include/asm-arm/config.h b/xen/include/arch-arm/asm/config.h
similarity index 100%
rename from xen/include/asm-arm/config.h
rename to xen/include/arch-arm/asm/config.h
diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/arch-arm/asm/cpregs.h
similarity index 100%
rename from xen/include/asm-arm/cpregs.h
rename to xen/include/arch-arm/asm/cpregs.h
diff --git a/xen/include/asm-arm/cpuerrata.h b/xen/include/arch-arm/asm/cpuerrata.h
similarity index 100%
rename from xen/include/asm-arm/cpuerrata.h
rename to xen/include/arch-arm/asm/cpuerrata.h
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/arch-arm/asm/cpufeature.h
similarity index 100%
rename from xen/include/asm-arm/cpufeature.h
rename to xen/include/arch-arm/asm/cpufeature.h
diff --git a/xen/include/asm-arm/current.h b/xen/include/arch-arm/asm/current.h
similarity index 100%
rename from xen/include/asm-arm/current.h
rename to xen/include/arch-arm/asm/current.h
diff --git a/xen/include/asm-arm/debugger.h b/xen/include/arch-arm/asm/debugger.h
similarity index 100%
rename from xen/include/asm-arm/debugger.h
rename to xen/include/arch-arm/asm/debugger.h
diff --git a/xen/include/asm-arm/delay.h b/xen/include/arch-arm/asm/delay.h
similarity index 100%
rename from xen/include/asm-arm/delay.h
rename to xen/include/arch-arm/asm/delay.h
diff --git a/xen/include/asm-arm/desc.h b/xen/include/arch-arm/asm/desc.h
similarity index 100%
rename from xen/include/asm-arm/desc.h
rename to xen/include/arch-arm/asm/desc.h
diff --git a/xen/include/asm-arm/device.h b/xen/include/arch-arm/asm/device.h
similarity index 100%
rename from xen/include/asm-arm/device.h
rename to xen/include/arch-arm/asm/device.h
diff --git a/xen/include/asm-arm/div64.h b/xen/include/arch-arm/asm/div64.h
similarity index 100%
rename from xen/include/asm-arm/div64.h
rename to xen/include/arch-arm/asm/div64.h
diff --git a/xen/include/asm-arm/domain.h b/xen/include/arch-arm/asm/domain.h
similarity index 100%
rename from xen/include/asm-arm/domain.h
rename to xen/include/arch-arm/asm/domain.h
diff --git a/xen/include/asm-arm/domain_build.h b/xen/include/arch-arm/asm/domain_build.h
similarity index 100%
rename from xen/include/asm-arm/domain_build.h
rename to xen/include/arch-arm/asm/domain_build.h
diff --git a/xen/include/asm-arm/early_printk.h b/xen/include/arch-arm/asm/early_printk.h
similarity index 100%
rename from xen/include/asm-arm/early_printk.h
rename to xen/include/arch-arm/asm/early_printk.h
diff --git a/xen/include/asm-arm/efibind.h b/xen/include/arch-arm/asm/efibind.h
similarity index 100%
rename from xen/include/asm-arm/efibind.h
rename to xen/include/arch-arm/asm/efibind.h
diff --git a/xen/include/asm-arm/elf.h b/xen/include/arch-arm/asm/elf.h
similarity index 100%
rename from xen/include/asm-arm/elf.h
rename to xen/include/arch-arm/asm/elf.h
diff --git a/xen/include/asm-arm/event.h b/xen/include/arch-arm/asm/event.h
similarity index 100%
rename from xen/include/asm-arm/event.h
rename to xen/include/arch-arm/asm/event.h
diff --git a/xen/include/asm-arm/exynos4210-uart.h b/xen/include/arch-arm/asm/exynos4210-uart.h
similarity index 100%
rename from xen/include/asm-arm/exynos4210-uart.h
rename to xen/include/arch-arm/asm/exynos4210-uart.h
diff --git a/xen/include/asm-arm/flushtlb.h b/xen/include/arch-arm/asm/flushtlb.h
similarity index 100%
rename from xen/include/asm-arm/flushtlb.h
rename to xen/include/arch-arm/asm/flushtlb.h
diff --git a/xen/include/asm-arm/gic.h b/xen/include/arch-arm/asm/gic.h
similarity index 100%
rename from xen/include/asm-arm/gic.h
rename to xen/include/arch-arm/asm/gic.h
diff --git a/xen/include/asm-arm/gic_v3_defs.h b/xen/include/arch-arm/asm/gic_v3_defs.h
similarity index 100%
rename from xen/include/asm-arm/gic_v3_defs.h
rename to xen/include/arch-arm/asm/gic_v3_defs.h
diff --git a/xen/include/asm-arm/gic_v3_its.h b/xen/include/arch-arm/asm/gic_v3_its.h
similarity index 100%
rename from xen/include/asm-arm/gic_v3_its.h
rename to xen/include/arch-arm/asm/gic_v3_its.h
diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/arch-arm/asm/grant_table.h
similarity index 100%
rename from xen/include/asm-arm/grant_table.h
rename to xen/include/arch-arm/asm/grant_table.h
diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/arch-arm/asm/guest_access.h
similarity index 100%
rename from xen/include/asm-arm/guest_access.h
rename to xen/include/arch-arm/asm/guest_access.h
diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/include/arch-arm/asm/guest_atomics.h
similarity index 100%
rename from xen/include/asm-arm/guest_atomics.h
rename to xen/include/arch-arm/asm/guest_atomics.h
diff --git a/xen/include/asm-arm/guest_walk.h b/xen/include/arch-arm/asm/guest_walk.h
similarity index 100%
rename from xen/include/asm-arm/guest_walk.h
rename to xen/include/arch-arm/asm/guest_walk.h
diff --git a/xen/include/asm-arm/hardirq.h b/xen/include/arch-arm/asm/hardirq.h
similarity index 100%
rename from xen/include/asm-arm/hardirq.h
rename to xen/include/arch-arm/asm/hardirq.h
diff --git a/xen/include/asm-arm/hsr.h b/xen/include/arch-arm/asm/hsr.h
similarity index 100%
rename from xen/include/asm-arm/hsr.h
rename to xen/include/arch-arm/asm/hsr.h
diff --git a/xen/include/asm-arm/hypercall.h b/xen/include/arch-arm/asm/hypercall.h
similarity index 100%
rename from xen/include/asm-arm/hypercall.h
rename to xen/include/arch-arm/asm/hypercall.h
diff --git a/xen/include/asm-arm/init.h b/xen/include/arch-arm/asm/init.h
similarity index 100%
rename from xen/include/asm-arm/init.h
rename to xen/include/arch-arm/asm/init.h
diff --git a/xen/include/asm-arm/insn.h b/xen/include/arch-arm/asm/insn.h
similarity index 100%
rename from xen/include/asm-arm/insn.h
rename to xen/include/arch-arm/asm/insn.h
diff --git a/xen/include/asm-arm/io.h b/xen/include/arch-arm/asm/io.h
similarity index 100%
rename from xen/include/asm-arm/io.h
rename to xen/include/arch-arm/asm/io.h
diff --git a/xen/include/asm-arm/iocap.h b/xen/include/arch-arm/asm/iocap.h
similarity index 100%
rename from xen/include/asm-arm/iocap.h
rename to xen/include/arch-arm/asm/iocap.h
diff --git a/xen/include/asm-arm/iommu.h b/xen/include/arch-arm/asm/iommu.h
similarity index 100%
rename from xen/include/asm-arm/iommu.h
rename to xen/include/arch-arm/asm/iommu.h
diff --git a/xen/include/asm-arm/iommu_fwspec.h b/xen/include/arch-arm/asm/iommu_fwspec.h
similarity index 100%
rename from xen/include/asm-arm/iommu_fwspec.h
rename to xen/include/arch-arm/asm/iommu_fwspec.h
diff --git a/xen/include/asm-arm/ioreq.h b/xen/include/arch-arm/asm/ioreq.h
similarity index 100%
rename from xen/include/asm-arm/ioreq.h
rename to xen/include/arch-arm/asm/ioreq.h
diff --git a/xen/include/asm-arm/irq.h b/xen/include/arch-arm/asm/irq.h
similarity index 100%
rename from xen/include/asm-arm/irq.h
rename to xen/include/arch-arm/asm/irq.h
diff --git a/xen/include/asm-arm/kernel.h b/xen/include/arch-arm/asm/kernel.h
similarity index 100%
rename from xen/include/asm-arm/kernel.h
rename to xen/include/arch-arm/asm/kernel.h
diff --git a/xen/include/asm-arm/livepatch.h b/xen/include/arch-arm/asm/livepatch.h
similarity index 100%
rename from xen/include/asm-arm/livepatch.h
rename to xen/include/arch-arm/asm/livepatch.h
diff --git a/xen/include/asm-arm/lpae.h b/xen/include/arch-arm/asm/lpae.h
similarity index 100%
rename from xen/include/asm-arm/lpae.h
rename to xen/include/arch-arm/asm/lpae.h
diff --git a/xen/include/asm-arm/macros.h b/xen/include/arch-arm/asm/macros.h
similarity index 100%
rename from xen/include/asm-arm/macros.h
rename to xen/include/arch-arm/asm/macros.h
diff --git a/xen/include/asm-arm/mem_access.h b/xen/include/arch-arm/asm/mem_access.h
similarity index 100%
rename from xen/include/asm-arm/mem_access.h
rename to xen/include/arch-arm/asm/mem_access.h
diff --git a/xen/include/asm-arm/mm.h b/xen/include/arch-arm/asm/mm.h
similarity index 100%
rename from xen/include/asm-arm/mm.h
rename to xen/include/arch-arm/asm/mm.h
diff --git a/xen/include/asm-arm/mmio.h b/xen/include/arch-arm/asm/mmio.h
similarity index 100%
rename from xen/include/asm-arm/mmio.h
rename to xen/include/arch-arm/asm/mmio.h
diff --git a/xen/include/asm-arm/monitor.h b/xen/include/arch-arm/asm/monitor.h
similarity index 100%
rename from xen/include/asm-arm/monitor.h
rename to xen/include/arch-arm/asm/monitor.h
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/arch-arm/asm/new_vgic.h
similarity index 100%
rename from xen/include/asm-arm/new_vgic.h
rename to xen/include/arch-arm/asm/new_vgic.h
diff --git a/xen/include/asm-arm/nospec.h b/xen/include/arch-arm/asm/nospec.h
similarity index 100%
rename from xen/include/asm-arm/nospec.h
rename to xen/include/arch-arm/asm/nospec.h
diff --git a/xen/include/asm-arm/numa.h b/xen/include/arch-arm/asm/numa.h
similarity index 100%
rename from xen/include/asm-arm/numa.h
rename to xen/include/arch-arm/asm/numa.h
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/arch-arm/asm/p2m.h
similarity index 100%
rename from xen/include/asm-arm/p2m.h
rename to xen/include/arch-arm/asm/p2m.h
diff --git a/xen/include/asm-arm/page-bits.h b/xen/include/arch-arm/asm/page-bits.h
similarity index 100%
rename from xen/include/asm-arm/page-bits.h
rename to xen/include/arch-arm/asm/page-bits.h
diff --git a/xen/include/asm-arm/page.h b/xen/include/arch-arm/asm/page.h
similarity index 100%
rename from xen/include/asm-arm/page.h
rename to xen/include/arch-arm/asm/page.h
diff --git a/xen/include/asm-arm/paging.h b/xen/include/arch-arm/asm/paging.h
similarity index 100%
rename from xen/include/asm-arm/paging.h
rename to xen/include/arch-arm/asm/paging.h
diff --git a/xen/include/asm-arm/pci.h b/xen/include/arch-arm/asm/pci.h
similarity index 100%
rename from xen/include/asm-arm/pci.h
rename to xen/include/arch-arm/asm/pci.h
diff --git a/xen/include/asm-arm/percpu.h b/xen/include/arch-arm/asm/percpu.h
similarity index 100%
rename from xen/include/asm-arm/percpu.h
rename to xen/include/arch-arm/asm/percpu.h
diff --git a/xen/include/asm-arm/perfc.h b/xen/include/arch-arm/asm/perfc.h
similarity index 100%
rename from xen/include/asm-arm/perfc.h
rename to xen/include/arch-arm/asm/perfc.h
diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/arch-arm/asm/perfc_defn.h
similarity index 100%
rename from xen/include/asm-arm/perfc_defn.h
rename to xen/include/arch-arm/asm/perfc_defn.h
diff --git a/xen/include/asm-arm/pl011-uart.h b/xen/include/arch-arm/asm/pl011-uart.h
similarity index 100%
rename from xen/include/asm-arm/pl011-uart.h
rename to xen/include/arch-arm/asm/pl011-uart.h
diff --git a/xen/include/asm-arm/platform.h b/xen/include/arch-arm/asm/platform.h
similarity index 100%
rename from xen/include/asm-arm/platform.h
rename to xen/include/arch-arm/asm/platform.h
diff --git a/xen/include/asm-arm/platforms/exynos5.h b/xen/include/arch-arm/asm/platforms/exynos5.h
similarity index 100%
rename from xen/include/asm-arm/platforms/exynos5.h
rename to xen/include/arch-arm/asm/platforms/exynos5.h
diff --git a/xen/include/asm-arm/platforms/midway.h b/xen/include/arch-arm/asm/platforms/midway.h
similarity index 100%
rename from xen/include/asm-arm/platforms/midway.h
rename to xen/include/arch-arm/asm/platforms/midway.h
diff --git a/xen/include/asm-arm/platforms/omap5.h b/xen/include/arch-arm/asm/platforms/omap5.h
similarity index 100%
rename from xen/include/asm-arm/platforms/omap5.h
rename to xen/include/arch-arm/asm/platforms/omap5.h
diff --git a/xen/include/asm-arm/platforms/vexpress.h b/xen/include/arch-arm/asm/platforms/vexpress.h
similarity index 100%
rename from xen/include/asm-arm/platforms/vexpress.h
rename to xen/include/arch-arm/asm/platforms/vexpress.h
diff --git a/xen/include/asm-arm/platforms/xilinx-zynqmp-eemi.h b/xen/include/arch-arm/asm/platforms/xilinx-zynqmp-eemi.h
similarity index 100%
rename from xen/include/asm-arm/platforms/xilinx-zynqmp-eemi.h
rename to xen/include/arch-arm/asm/platforms/xilinx-zynqmp-eemi.h
diff --git a/xen/include/asm-arm/processor.h b/xen/include/arch-arm/asm/processor.h
similarity index 100%
rename from xen/include/asm-arm/processor.h
rename to xen/include/arch-arm/asm/processor.h
diff --git a/xen/include/asm-arm/procinfo.h b/xen/include/arch-arm/asm/procinfo.h
similarity index 100%
rename from xen/include/asm-arm/procinfo.h
rename to xen/include/arch-arm/asm/procinfo.h
diff --git a/xen/include/asm-arm/psci.h b/xen/include/arch-arm/asm/psci.h
similarity index 100%
rename from xen/include/asm-arm/psci.h
rename to xen/include/arch-arm/asm/psci.h
diff --git a/xen/include/asm-arm/random.h b/xen/include/arch-arm/asm/random.h
similarity index 100%
rename from xen/include/asm-arm/random.h
rename to xen/include/arch-arm/asm/random.h
diff --git a/xen/include/asm-arm/regs.h b/xen/include/arch-arm/asm/regs.h
similarity index 100%
rename from xen/include/asm-arm/regs.h
rename to xen/include/arch-arm/asm/regs.h
diff --git a/xen/include/asm-arm/scif-uart.h b/xen/include/arch-arm/asm/scif-uart.h
similarity index 100%
rename from xen/include/asm-arm/scif-uart.h
rename to xen/include/arch-arm/asm/scif-uart.h
diff --git a/xen/include/asm-arm/setup.h b/xen/include/arch-arm/asm/setup.h
similarity index 100%
rename from xen/include/asm-arm/setup.h
rename to xen/include/arch-arm/asm/setup.h
diff --git a/xen/include/asm-arm/short-desc.h b/xen/include/arch-arm/asm/short-desc.h
similarity index 100%
rename from xen/include/asm-arm/short-desc.h
rename to xen/include/arch-arm/asm/short-desc.h
diff --git a/xen/include/asm-arm/smccc.h b/xen/include/arch-arm/asm/smccc.h
similarity index 100%
rename from xen/include/asm-arm/smccc.h
rename to xen/include/arch-arm/asm/smccc.h
diff --git a/xen/include/asm-arm/smp.h b/xen/include/arch-arm/asm/smp.h
similarity index 100%
rename from xen/include/asm-arm/smp.h
rename to xen/include/arch-arm/asm/smp.h
diff --git a/xen/include/asm-arm/softirq.h b/xen/include/arch-arm/asm/softirq.h
similarity index 100%
rename from xen/include/asm-arm/softirq.h
rename to xen/include/arch-arm/asm/softirq.h
diff --git a/xen/include/asm-arm/spinlock.h b/xen/include/arch-arm/asm/spinlock.h
similarity index 100%
rename from xen/include/asm-arm/spinlock.h
rename to xen/include/arch-arm/asm/spinlock.h
diff --git a/xen/include/asm-arm/string.h b/xen/include/arch-arm/asm/string.h
similarity index 100%
rename from xen/include/asm-arm/string.h
rename to xen/include/arch-arm/asm/string.h
diff --git a/xen/include/asm-arm/sysregs.h b/xen/include/arch-arm/asm/sysregs.h
similarity index 100%
rename from xen/include/asm-arm/sysregs.h
rename to xen/include/arch-arm/asm/sysregs.h
diff --git a/xen/include/asm-arm/system.h b/xen/include/arch-arm/asm/system.h
similarity index 100%
rename from xen/include/asm-arm/system.h
rename to xen/include/arch-arm/asm/system.h
diff --git a/xen/include/asm-arm/tee/optee_msg.h b/xen/include/arch-arm/asm/tee/optee_msg.h
similarity index 100%
rename from xen/include/asm-arm/tee/optee_msg.h
rename to xen/include/arch-arm/asm/tee/optee_msg.h
diff --git a/xen/include/asm-arm/tee/optee_rpc_cmd.h b/xen/include/arch-arm/asm/tee/optee_rpc_cmd.h
similarity index 100%
rename from xen/include/asm-arm/tee/optee_rpc_cmd.h
rename to xen/include/arch-arm/asm/tee/optee_rpc_cmd.h
diff --git a/xen/include/asm-arm/tee/optee_smc.h b/xen/include/arch-arm/asm/tee/optee_smc.h
similarity index 100%
rename from xen/include/asm-arm/tee/optee_smc.h
rename to xen/include/arch-arm/asm/tee/optee_smc.h
diff --git a/xen/include/asm-arm/tee/tee.h b/xen/include/arch-arm/asm/tee/tee.h
similarity index 100%
rename from xen/include/asm-arm/tee/tee.h
rename to xen/include/arch-arm/asm/tee/tee.h
diff --git a/xen/include/asm-arm/time.h b/xen/include/arch-arm/asm/time.h
similarity index 100%
rename from xen/include/asm-arm/time.h
rename to xen/include/arch-arm/asm/time.h
diff --git a/xen/include/asm-arm/trace.h b/xen/include/arch-arm/asm/trace.h
similarity index 100%
rename from xen/include/asm-arm/trace.h
rename to xen/include/arch-arm/asm/trace.h
diff --git a/xen/include/asm-arm/traps.h b/xen/include/arch-arm/asm/traps.h
similarity index 100%
rename from xen/include/asm-arm/traps.h
rename to xen/include/arch-arm/asm/traps.h
diff --git a/xen/include/asm-arm/types.h b/xen/include/arch-arm/asm/types.h
similarity index 100%
rename from xen/include/asm-arm/types.h
rename to xen/include/arch-arm/asm/types.h
diff --git a/xen/include/asm-arm/vfp.h b/xen/include/arch-arm/asm/vfp.h
similarity index 100%
rename from xen/include/asm-arm/vfp.h
rename to xen/include/arch-arm/asm/vfp.h
diff --git a/xen/include/asm-arm/vgic-emul.h b/xen/include/arch-arm/asm/vgic-emul.h
similarity index 100%
rename from xen/include/asm-arm/vgic-emul.h
rename to xen/include/arch-arm/asm/vgic-emul.h
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/arch-arm/asm/vgic.h
similarity index 100%
rename from xen/include/asm-arm/vgic.h
rename to xen/include/arch-arm/asm/vgic.h
diff --git a/xen/include/asm-arm/vm_event.h b/xen/include/arch-arm/asm/vm_event.h
similarity index 100%
rename from xen/include/asm-arm/vm_event.h
rename to xen/include/arch-arm/asm/vm_event.h
diff --git a/xen/include/asm-arm/vpl011.h b/xen/include/arch-arm/asm/vpl011.h
similarity index 100%
rename from xen/include/asm-arm/vpl011.h
rename to xen/include/arch-arm/asm/vpl011.h
diff --git a/xen/include/asm-arm/vpsci.h b/xen/include/arch-arm/asm/vpsci.h
similarity index 100%
rename from xen/include/asm-arm/vpsci.h
rename to xen/include/arch-arm/asm/vpsci.h
diff --git a/xen/include/asm-arm/vreg.h b/xen/include/arch-arm/asm/vreg.h
similarity index 100%
rename from xen/include/asm-arm/vreg.h
rename to xen/include/arch-arm/asm/vreg.h
diff --git a/xen/include/asm-arm/vtimer.h b/xen/include/arch-arm/asm/vtimer.h
similarity index 100%
rename from xen/include/asm-arm/vtimer.h
rename to xen/include/arch-arm/asm/vtimer.h
diff --git a/xen/include/asm-arm/xenoprof.h b/xen/include/arch-arm/asm/xenoprof.h
similarity index 100%
rename from xen/include/asm-arm/xenoprof.h
rename to xen/include/arch-arm/asm/xenoprof.h
diff --git a/xen/include/asm-riscv/config.h b/xen/include/arch-riscv/asm/config.h
similarity index 100%
rename from xen/include/asm-riscv/config.h
rename to xen/include/arch-riscv/asm/config.h
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/arch-x86/asm/acpi.h
similarity index 100%
rename from xen/include/asm-x86/acpi.h
rename to xen/include/arch-x86/asm/acpi.h
diff --git a/xen/include/asm-x86/alternative-asm.h b/xen/include/arch-x86/asm/alternative-asm.h
similarity index 100%
rename from xen/include/asm-x86/alternative-asm.h
rename to xen/include/arch-x86/asm/alternative-asm.h
diff --git a/xen/include/asm-x86/alternative.h b/xen/include/arch-x86/asm/alternative.h
similarity index 100%
rename from xen/include/asm-x86/alternative.h
rename to xen/include/arch-x86/asm/alternative.h
diff --git a/xen/include/asm-x86/altp2m.h b/xen/include/arch-x86/asm/altp2m.h
similarity index 100%
rename from xen/include/asm-x86/altp2m.h
rename to xen/include/arch-x86/asm/altp2m.h
diff --git a/xen/include/asm-x86/amd.h b/xen/include/arch-x86/asm/amd.h
similarity index 100%
rename from xen/include/asm-x86/amd.h
rename to xen/include/arch-x86/asm/amd.h
diff --git a/xen/include/asm-x86/apic.h b/xen/include/arch-x86/asm/apic.h
similarity index 100%
rename from xen/include/asm-x86/apic.h
rename to xen/include/arch-x86/asm/apic.h
diff --git a/xen/include/asm-x86/apicdef.h b/xen/include/arch-x86/asm/apicdef.h
similarity index 100%
rename from xen/include/asm-x86/apicdef.h
rename to xen/include/arch-x86/asm/apicdef.h
diff --git a/xen/include/asm-x86/asm-defns.h b/xen/include/arch-x86/asm/asm-defns.h
similarity index 100%
rename from xen/include/asm-x86/asm-defns.h
rename to xen/include/arch-x86/asm/asm-defns.h
diff --git a/xen/include/asm-x86/asm_defns.h b/xen/include/arch-x86/asm/asm_defns.h
similarity index 100%
rename from xen/include/asm-x86/asm_defns.h
rename to xen/include/arch-x86/asm/asm_defns.h
diff --git a/xen/include/asm-x86/atomic.h b/xen/include/arch-x86/asm/atomic.h
similarity index 100%
rename from xen/include/asm-x86/atomic.h
rename to xen/include/arch-x86/asm/atomic.h
diff --git a/xen/include/asm-x86/bitops.h b/xen/include/arch-x86/asm/bitops.h
similarity index 100%
rename from xen/include/asm-x86/bitops.h
rename to xen/include/arch-x86/asm/bitops.h
diff --git a/xen/include/asm-x86/bug.h b/xen/include/arch-x86/asm/bug.h
similarity index 100%
rename from xen/include/asm-x86/bug.h
rename to xen/include/arch-x86/asm/bug.h
diff --git a/xen/include/asm-x86/byteorder.h b/xen/include/arch-x86/asm/byteorder.h
similarity index 100%
rename from xen/include/asm-x86/byteorder.h
rename to xen/include/arch-x86/asm/byteorder.h
diff --git a/xen/include/asm-x86/bzimage.h b/xen/include/arch-x86/asm/bzimage.h
similarity index 100%
rename from xen/include/asm-x86/bzimage.h
rename to xen/include/arch-x86/asm/bzimage.h
diff --git a/xen/include/asm-x86/cache.h b/xen/include/arch-x86/asm/cache.h
similarity index 100%
rename from xen/include/asm-x86/cache.h
rename to xen/include/arch-x86/asm/cache.h
diff --git a/xen/include/asm-x86/compat.h b/xen/include/arch-x86/asm/compat.h
similarity index 100%
rename from xen/include/asm-x86/compat.h
rename to xen/include/arch-x86/asm/compat.h
diff --git a/xen/include/asm-x86/config.h b/xen/include/arch-x86/asm/config.h
similarity index 100%
rename from xen/include/asm-x86/config.h
rename to xen/include/arch-x86/asm/config.h
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/arch-x86/asm/cpufeature.h
similarity index 100%
rename from xen/include/asm-x86/cpufeature.h
rename to xen/include/arch-x86/asm/cpufeature.h
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/arch-x86/asm/cpufeatures.h
similarity index 100%
rename from xen/include/asm-x86/cpufeatures.h
rename to xen/include/arch-x86/asm/cpufeatures.h
diff --git a/xen/include/asm-x86/cpufeatureset.h b/xen/include/arch-x86/asm/cpufeatureset.h
similarity index 100%
rename from xen/include/asm-x86/cpufeatureset.h
rename to xen/include/arch-x86/asm/cpufeatureset.h
diff --git a/xen/include/asm-x86/cpuid.h b/xen/include/arch-x86/asm/cpuid.h
similarity index 100%
rename from xen/include/asm-x86/cpuid.h
rename to xen/include/arch-x86/asm/cpuid.h
diff --git a/xen/include/asm-x86/cpuidle.h b/xen/include/arch-x86/asm/cpuidle.h
similarity index 100%
rename from xen/include/asm-x86/cpuidle.h
rename to xen/include/arch-x86/asm/cpuidle.h
diff --git a/xen/include/asm-x86/current.h b/xen/include/arch-x86/asm/current.h
similarity index 99%
rename from xen/include/asm-x86/current.h
rename to xen/include/arch-x86/asm/current.h
index a74ad4bc4c44..c0f949eb2a19 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/arch-x86/asm/current.h
@@ -53,7 +53,7 @@ struct cpu_info {
     unsigned long xen_cr3;
     unsigned long pv_cr3;
 
-    /* See asm-x86/spec_ctrl_asm.h for usage. */
+    /* See arch-x86/asm/spec_ctrl_asm.h for usage. */
     unsigned int shadow_spec_ctrl;
     uint8_t      xen_spec_ctrl;
     uint8_t      spec_ctrl_flags;
diff --git a/xen/include/asm-x86/debugger.h b/xen/include/arch-x86/asm/debugger.h
similarity index 100%
rename from xen/include/asm-x86/debugger.h
rename to xen/include/arch-x86/asm/debugger.h
diff --git a/xen/include/asm-x86/debugreg.h b/xen/include/arch-x86/asm/debugreg.h
similarity index 100%
rename from xen/include/asm-x86/debugreg.h
rename to xen/include/arch-x86/asm/debugreg.h
diff --git a/xen/include/asm-x86/delay.h b/xen/include/arch-x86/asm/delay.h
similarity index 100%
rename from xen/include/asm-x86/delay.h
rename to xen/include/arch-x86/asm/delay.h
diff --git a/xen/include/asm-x86/desc.h b/xen/include/arch-x86/asm/desc.h
similarity index 100%
rename from xen/include/asm-x86/desc.h
rename to xen/include/arch-x86/asm/desc.h
diff --git a/xen/include/asm-x86/device.h b/xen/include/arch-x86/asm/device.h
similarity index 100%
rename from xen/include/asm-x86/device.h
rename to xen/include/arch-x86/asm/device.h
diff --git a/xen/include/asm-x86/div64.h b/xen/include/arch-x86/asm/div64.h
similarity index 100%
rename from xen/include/asm-x86/div64.h
rename to xen/include/arch-x86/asm/div64.h
diff --git a/xen/include/asm-x86/dom0_build.h b/xen/include/arch-x86/asm/dom0_build.h
similarity index 100%
rename from xen/include/asm-x86/dom0_build.h
rename to xen/include/arch-x86/asm/dom0_build.h
diff --git a/xen/include/asm-x86/domain.h b/xen/include/arch-x86/asm/domain.h
similarity index 99%
rename from xen/include/asm-x86/domain.h
rename to xen/include/arch-x86/asm/domain.h
index 92d54de0b9a1..85ad302c0e92 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/arch-x86/asm/domain.h
@@ -384,7 +384,7 @@ struct arch_domain
     struct PITState vpit;
 
     /* TSC management (emulation, pv, scaling, stats) */
-    int tsc_mode;            /* see include/asm-x86/time.h */
+    int tsc_mode;            /* see include/arch-x86/asm/time.h */
     bool_t vtsc;             /* tsc is emulated (may change after migrate) */
     s_time_t vtsc_last;      /* previous TSC value (guarantee monotonicity) */
     uint64_t vtsc_offset;    /* adjustment for save/restore/migrate */
diff --git a/xen/include/asm-x86/e820.h b/xen/include/arch-x86/asm/e820.h
similarity index 100%
rename from xen/include/asm-x86/e820.h
rename to xen/include/arch-x86/asm/e820.h
diff --git a/xen/include/asm-x86/edd.h b/xen/include/arch-x86/asm/edd.h
similarity index 100%
rename from xen/include/asm-x86/edd.h
rename to xen/include/arch-x86/asm/edd.h
diff --git a/xen/include/asm-x86/efibind.h b/xen/include/arch-x86/asm/efibind.h
similarity index 100%
rename from xen/include/asm-x86/efibind.h
rename to xen/include/arch-x86/asm/efibind.h
diff --git a/xen/include/asm-x86/elf.h b/xen/include/arch-x86/asm/elf.h
similarity index 100%
rename from xen/include/asm-x86/elf.h
rename to xen/include/arch-x86/asm/elf.h
diff --git a/xen/include/asm-x86/event.h b/xen/include/arch-x86/asm/event.h
similarity index 100%
rename from xen/include/asm-x86/event.h
rename to xen/include/arch-x86/asm/event.h
diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/arch-x86/asm/fixmap.h
similarity index 100%
rename from xen/include/asm-x86/fixmap.h
rename to xen/include/arch-x86/asm/fixmap.h
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/include/arch-x86/asm/flushtlb.h
similarity index 100%
rename from xen/include/asm-x86/flushtlb.h
rename to xen/include/arch-x86/asm/flushtlb.h
diff --git a/xen/include/asm-x86/genapic.h b/xen/include/arch-x86/asm/genapic.h
similarity index 100%
rename from xen/include/asm-x86/genapic.h
rename to xen/include/arch-x86/asm/genapic.h
diff --git a/xen/include/asm-x86/grant_table.h b/xen/include/arch-x86/asm/grant_table.h
similarity index 100%
rename from xen/include/asm-x86/grant_table.h
rename to xen/include/arch-x86/asm/grant_table.h
diff --git a/xen/include/asm-x86/guest.h b/xen/include/arch-x86/asm/guest.h
similarity index 100%
rename from xen/include/asm-x86/guest.h
rename to xen/include/arch-x86/asm/guest.h
diff --git a/xen/include/asm-x86/guest/hyperv-hcall.h b/xen/include/arch-x86/asm/guest/hyperv-hcall.h
similarity index 100%
rename from xen/include/asm-x86/guest/hyperv-hcall.h
rename to xen/include/arch-x86/asm/guest/hyperv-hcall.h
diff --git a/xen/include/asm-x86/guest/hyperv-tlfs.h b/xen/include/arch-x86/asm/guest/hyperv-tlfs.h
similarity index 100%
rename from xen/include/asm-x86/guest/hyperv-tlfs.h
rename to xen/include/arch-x86/asm/guest/hyperv-tlfs.h
diff --git a/xen/include/asm-x86/guest/hyperv.h b/xen/include/arch-x86/asm/guest/hyperv.h
similarity index 100%
rename from xen/include/asm-x86/guest/hyperv.h
rename to xen/include/arch-x86/asm/guest/hyperv.h
diff --git a/xen/include/asm-x86/guest/hypervisor.h b/xen/include/arch-x86/asm/guest/hypervisor.h
similarity index 100%
rename from xen/include/asm-x86/guest/hypervisor.h
rename to xen/include/arch-x86/asm/guest/hypervisor.h
diff --git a/xen/include/asm-x86/guest/pvh-boot.h b/xen/include/arch-x86/asm/guest/pvh-boot.h
similarity index 100%
rename from xen/include/asm-x86/guest/pvh-boot.h
rename to xen/include/arch-x86/asm/guest/pvh-boot.h
diff --git a/xen/include/asm-x86/guest/xen-hcall.h b/xen/include/arch-x86/asm/guest/xen-hcall.h
similarity index 100%
rename from xen/include/asm-x86/guest/xen-hcall.h
rename to xen/include/arch-x86/asm/guest/xen-hcall.h
diff --git a/xen/include/asm-x86/guest/xen.h b/xen/include/arch-x86/asm/guest/xen.h
similarity index 100%
rename from xen/include/asm-x86/guest/xen.h
rename to xen/include/arch-x86/asm/guest/xen.h
diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/arch-x86/asm/guest_access.h
similarity index 100%
rename from xen/include/asm-x86/guest_access.h
rename to xen/include/arch-x86/asm/guest_access.h
diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/arch-x86/asm/guest_atomics.h
similarity index 100%
rename from xen/include/asm-x86/guest_atomics.h
rename to xen/include/arch-x86/asm/guest_atomics.h
diff --git a/xen/include/asm-x86/guest_pt.h b/xen/include/arch-x86/asm/guest_pt.h
similarity index 100%
rename from xen/include/asm-x86/guest_pt.h
rename to xen/include/arch-x86/asm/guest_pt.h
diff --git a/xen/include/asm-x86/hap.h b/xen/include/arch-x86/asm/hap.h
similarity index 100%
rename from xen/include/asm-x86/hap.h
rename to xen/include/arch-x86/asm/hap.h
diff --git a/xen/include/asm-x86/hardirq.h b/xen/include/arch-x86/asm/hardirq.h
similarity index 100%
rename from xen/include/asm-x86/hardirq.h
rename to xen/include/arch-x86/asm/hardirq.h
diff --git a/xen/include/asm-x86/hpet.h b/xen/include/arch-x86/asm/hpet.h
similarity index 100%
rename from xen/include/asm-x86/hpet.h
rename to xen/include/arch-x86/asm/hpet.h
diff --git a/xen/include/asm-x86/hvm/asid.h b/xen/include/arch-x86/asm/hvm/asid.h
similarity index 100%
rename from xen/include/asm-x86/hvm/asid.h
rename to xen/include/arch-x86/asm/hvm/asid.h
diff --git a/xen/include/asm-x86/hvm/cacheattr.h b/xen/include/arch-x86/asm/hvm/cacheattr.h
similarity index 100%
rename from xen/include/asm-x86/hvm/cacheattr.h
rename to xen/include/arch-x86/asm/hvm/cacheattr.h
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/arch-x86/asm/hvm/domain.h
similarity index 100%
rename from xen/include/asm-x86/hvm/domain.h
rename to xen/include/arch-x86/asm/hvm/domain.h
diff --git a/xen/include/asm-x86/hvm/emulate.h b/xen/include/arch-x86/asm/hvm/emulate.h
similarity index 100%
rename from xen/include/asm-x86/hvm/emulate.h
rename to xen/include/arch-x86/asm/hvm/emulate.h
diff --git a/xen/include/asm-x86/hvm/grant_table.h b/xen/include/arch-x86/asm/hvm/grant_table.h
similarity index 100%
rename from xen/include/asm-x86/hvm/grant_table.h
rename to xen/include/arch-x86/asm/hvm/grant_table.h
diff --git a/xen/include/asm-x86/hvm/guest_access.h b/xen/include/arch-x86/asm/hvm/guest_access.h
similarity index 100%
rename from xen/include/asm-x86/hvm/guest_access.h
rename to xen/include/arch-x86/asm/hvm/guest_access.h
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/arch-x86/asm/hvm/hvm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/hvm.h
rename to xen/include/arch-x86/asm/hvm/hvm.h
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/arch-x86/asm/hvm/io.h
similarity index 100%
rename from xen/include/asm-x86/hvm/io.h
rename to xen/include/arch-x86/asm/hvm/io.h
diff --git a/xen/include/asm-x86/hvm/ioreq.h b/xen/include/arch-x86/asm/hvm/ioreq.h
similarity index 100%
rename from xen/include/asm-x86/hvm/ioreq.h
rename to xen/include/arch-x86/asm/hvm/ioreq.h
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/arch-x86/asm/hvm/irq.h
similarity index 100%
rename from xen/include/asm-x86/hvm/irq.h
rename to xen/include/arch-x86/asm/hvm/irq.h
diff --git a/xen/include/asm-x86/hvm/monitor.h b/xen/include/arch-x86/asm/hvm/monitor.h
similarity index 100%
rename from xen/include/asm-x86/hvm/monitor.h
rename to xen/include/arch-x86/asm/hvm/monitor.h
diff --git a/xen/include/asm-x86/hvm/nestedhvm.h b/xen/include/arch-x86/asm/hvm/nestedhvm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/nestedhvm.h
rename to xen/include/arch-x86/asm/hvm/nestedhvm.h
diff --git a/xen/include/asm-x86/hvm/save.h b/xen/include/arch-x86/asm/hvm/save.h
similarity index 100%
rename from xen/include/asm-x86/hvm/save.h
rename to xen/include/arch-x86/asm/hvm/save.h
diff --git a/xen/include/asm-x86/hvm/support.h b/xen/include/arch-x86/asm/hvm/support.h
similarity index 100%
rename from xen/include/asm-x86/hvm/support.h
rename to xen/include/arch-x86/asm/hvm/support.h
diff --git a/xen/include/asm-x86/hvm/svm/asid.h b/xen/include/arch-x86/asm/hvm/svm/asid.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/asid.h
rename to xen/include/arch-x86/asm/hvm/svm/asid.h
diff --git a/xen/include/asm-x86/hvm/svm/emulate.h b/xen/include/arch-x86/asm/hvm/svm/emulate.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/emulate.h
rename to xen/include/arch-x86/asm/hvm/svm/emulate.h
diff --git a/xen/include/asm-x86/hvm/svm/intr.h b/xen/include/arch-x86/asm/hvm/svm/intr.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/intr.h
rename to xen/include/arch-x86/asm/hvm/svm/intr.h
diff --git a/xen/include/asm-x86/hvm/svm/nestedsvm.h b/xen/include/arch-x86/asm/hvm/svm/nestedsvm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/nestedsvm.h
rename to xen/include/arch-x86/asm/hvm/svm/nestedsvm.h
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/arch-x86/asm/hvm/svm/svm.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/svm.h
rename to xen/include/arch-x86/asm/hvm/svm/svm.h
diff --git a/xen/include/asm-x86/hvm/svm/svmdebug.h b/xen/include/arch-x86/asm/hvm/svm/svmdebug.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/svmdebug.h
rename to xen/include/arch-x86/asm/hvm/svm/svmdebug.h
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/arch-x86/asm/hvm/svm/vmcb.h
similarity index 100%
rename from xen/include/asm-x86/hvm/svm/vmcb.h
rename to xen/include/arch-x86/asm/hvm/svm/vmcb.h
diff --git a/xen/include/asm-x86/hvm/trace.h b/xen/include/arch-x86/asm/hvm/trace.h
similarity index 100%
rename from xen/include/asm-x86/hvm/trace.h
rename to xen/include/arch-x86/asm/hvm/trace.h
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/arch-x86/asm/hvm/vcpu.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vcpu.h
rename to xen/include/arch-x86/asm/hvm/vcpu.h
diff --git a/xen/include/asm-x86/hvm/vioapic.h b/xen/include/arch-x86/asm/hvm/vioapic.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vioapic.h
rename to xen/include/arch-x86/asm/hvm/vioapic.h
diff --git a/xen/include/asm-x86/hvm/viridian.h b/xen/include/arch-x86/asm/hvm/viridian.h
similarity index 100%
rename from xen/include/asm-x86/hvm/viridian.h
rename to xen/include/arch-x86/asm/hvm/viridian.h
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/arch-x86/asm/hvm/vlapic.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vlapic.h
rename to xen/include/arch-x86/asm/hvm/vlapic.h
diff --git a/xen/include/asm-x86/hvm/vm_event.h b/xen/include/arch-x86/asm/hvm/vm_event.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vm_event.h
rename to xen/include/arch-x86/asm/hvm/vm_event.h
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/arch-x86/asm/hvm/vmx/vmcs.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vmx/vmcs.h
rename to xen/include/arch-x86/asm/hvm/vmx/vmcs.h
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/arch-x86/asm/hvm/vmx/vmx.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vmx/vmx.h
rename to xen/include/arch-x86/asm/hvm/vmx/vmx.h
diff --git a/xen/include/asm-x86/hvm/vmx/vvmx.h b/xen/include/arch-x86/asm/hvm/vmx/vvmx.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vmx/vvmx.h
rename to xen/include/arch-x86/asm/hvm/vmx/vvmx.h
diff --git a/xen/include/asm-x86/hvm/vpic.h b/xen/include/arch-x86/asm/hvm/vpic.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vpic.h
rename to xen/include/arch-x86/asm/hvm/vpic.h
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/arch-x86/asm/hvm/vpt.h
similarity index 100%
rename from xen/include/asm-x86/hvm/vpt.h
rename to xen/include/arch-x86/asm/hvm/vpt.h
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/arch-x86/asm/hypercall.h
similarity index 100%
rename from xen/include/asm-x86/hypercall.h
rename to xen/include/arch-x86/asm/hypercall.h
diff --git a/xen/include/asm-x86/i387.h b/xen/include/arch-x86/asm/i387.h
similarity index 100%
rename from xen/include/asm-x86/i387.h
rename to xen/include/arch-x86/asm/i387.h
diff --git a/xen/include/asm-x86/init.h b/xen/include/arch-x86/asm/init.h
similarity index 100%
rename from xen/include/asm-x86/init.h
rename to xen/include/arch-x86/asm/init.h
diff --git a/xen/include/asm-x86/invpcid.h b/xen/include/arch-x86/asm/invpcid.h
similarity index 100%
rename from xen/include/asm-x86/invpcid.h
rename to xen/include/arch-x86/asm/invpcid.h
diff --git a/xen/include/asm-x86/io.h b/xen/include/arch-x86/asm/io.h
similarity index 100%
rename from xen/include/asm-x86/io.h
rename to xen/include/arch-x86/asm/io.h
diff --git a/xen/include/asm-x86/io_apic.h b/xen/include/arch-x86/asm/io_apic.h
similarity index 100%
rename from xen/include/asm-x86/io_apic.h
rename to xen/include/arch-x86/asm/io_apic.h
diff --git a/xen/include/asm-x86/iocap.h b/xen/include/arch-x86/asm/iocap.h
similarity index 100%
rename from xen/include/asm-x86/iocap.h
rename to xen/include/arch-x86/asm/iocap.h
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/arch-x86/asm/iommu.h
similarity index 100%
rename from xen/include/asm-x86/iommu.h
rename to xen/include/arch-x86/asm/iommu.h
diff --git a/xen/include/asm-x86/ioreq.h b/xen/include/arch-x86/asm/ioreq.h
similarity index 100%
rename from xen/include/asm-x86/ioreq.h
rename to xen/include/arch-x86/asm/ioreq.h
diff --git a/xen/include/asm-x86/irq.h b/xen/include/arch-x86/asm/irq.h
similarity index 100%
rename from xen/include/asm-x86/irq.h
rename to xen/include/arch-x86/asm/irq.h
diff --git a/xen/include/asm-x86/ldt.h b/xen/include/arch-x86/asm/ldt.h
similarity index 100%
rename from xen/include/asm-x86/ldt.h
rename to xen/include/arch-x86/asm/ldt.h
diff --git a/xen/include/asm-x86/livepatch.h b/xen/include/arch-x86/asm/livepatch.h
similarity index 100%
rename from xen/include/asm-x86/livepatch.h
rename to xen/include/arch-x86/asm/livepatch.h
diff --git a/xen/include/asm-x86/mach-default/bios_ebda.h b/xen/include/arch-x86/asm/mach-default/bios_ebda.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/bios_ebda.h
rename to xen/include/arch-x86/asm/mach-default/bios_ebda.h
diff --git a/xen/include/asm-x86/mach-default/io_ports.h b/xen/include/arch-x86/asm/mach-default/io_ports.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/io_ports.h
rename to xen/include/arch-x86/asm/mach-default/io_ports.h
diff --git a/xen/include/asm-x86/mach-default/irq_vectors.h b/xen/include/arch-x86/asm/mach-default/irq_vectors.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/irq_vectors.h
rename to xen/include/arch-x86/asm/mach-default/irq_vectors.h
diff --git a/xen/include/asm-x86/mach-default/mach_mpparse.h b/xen/include/arch-x86/asm/mach-default/mach_mpparse.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/mach_mpparse.h
rename to xen/include/arch-x86/asm/mach-default/mach_mpparse.h
diff --git a/xen/include/asm-x86/mach-default/mach_mpspec.h b/xen/include/arch-x86/asm/mach-default/mach_mpspec.h
similarity index 100%
rename from xen/include/asm-x86/mach-default/mach_mpspec.h
rename to xen/include/arch-x86/asm/mach-default/mach_mpspec.h
diff --git a/xen/include/asm-x86/mach-generic/mach_apic.h b/xen/include/arch-x86/asm/mach-generic/mach_apic.h
similarity index 100%
rename from xen/include/asm-x86/mach-generic/mach_apic.h
rename to xen/include/arch-x86/asm/mach-generic/mach_apic.h
diff --git a/xen/include/asm-x86/mach-generic/mach_mpparse.h b/xen/include/arch-x86/asm/mach-generic/mach_mpparse.h
similarity index 100%
rename from xen/include/asm-x86/mach-generic/mach_mpparse.h
rename to xen/include/arch-x86/asm/mach-generic/mach_mpparse.h
diff --git a/xen/include/asm-x86/machine_kexec.h b/xen/include/arch-x86/asm/machine_kexec.h
similarity index 100%
rename from xen/include/asm-x86/machine_kexec.h
rename to xen/include/arch-x86/asm/machine_kexec.h
diff --git a/xen/include/asm-x86/mc146818rtc.h b/xen/include/arch-x86/asm/mc146818rtc.h
similarity index 100%
rename from xen/include/asm-x86/mc146818rtc.h
rename to xen/include/arch-x86/asm/mc146818rtc.h
diff --git a/xen/include/asm-x86/mce.h b/xen/include/arch-x86/asm/mce.h
similarity index 100%
rename from xen/include/asm-x86/mce.h
rename to xen/include/arch-x86/asm/mce.h
diff --git a/xen/include/asm-x86/mem_access.h b/xen/include/arch-x86/asm/mem_access.h
similarity index 100%
rename from xen/include/asm-x86/mem_access.h
rename to xen/include/arch-x86/asm/mem_access.h
diff --git a/xen/include/asm-x86/mem_paging.h b/xen/include/arch-x86/asm/mem_paging.h
similarity index 100%
rename from xen/include/asm-x86/mem_paging.h
rename to xen/include/arch-x86/asm/mem_paging.h
diff --git a/xen/include/asm-x86/mem_sharing.h b/xen/include/arch-x86/asm/mem_sharing.h
similarity index 100%
rename from xen/include/asm-x86/mem_sharing.h
rename to xen/include/arch-x86/asm/mem_sharing.h
diff --git a/xen/include/asm-x86/microcode.h b/xen/include/arch-x86/asm/microcode.h
similarity index 100%
rename from xen/include/asm-x86/microcode.h
rename to xen/include/arch-x86/asm/microcode.h
diff --git a/xen/include/asm-x86/mm.h b/xen/include/arch-x86/asm/mm.h
similarity index 100%
rename from xen/include/asm-x86/mm.h
rename to xen/include/arch-x86/asm/mm.h
diff --git a/xen/include/asm-x86/monitor.h b/xen/include/arch-x86/asm/monitor.h
similarity index 100%
rename from xen/include/asm-x86/monitor.h
rename to xen/include/arch-x86/asm/monitor.h
diff --git a/xen/include/asm-x86/mpspec.h b/xen/include/arch-x86/asm/mpspec.h
similarity index 100%
rename from xen/include/asm-x86/mpspec.h
rename to xen/include/arch-x86/asm/mpspec.h
diff --git a/xen/include/asm-x86/mpspec_def.h b/xen/include/arch-x86/asm/mpspec_def.h
similarity index 100%
rename from xen/include/asm-x86/mpspec_def.h
rename to xen/include/arch-x86/asm/mpspec_def.h
diff --git a/xen/include/asm-x86/msi.h b/xen/include/arch-x86/asm/msi.h
similarity index 100%
rename from xen/include/asm-x86/msi.h
rename to xen/include/arch-x86/asm/msi.h
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/arch-x86/asm/msr-index.h
similarity index 100%
rename from xen/include/asm-x86/msr-index.h
rename to xen/include/arch-x86/asm/msr-index.h
diff --git a/xen/include/asm-x86/msr.h b/xen/include/arch-x86/asm/msr.h
similarity index 100%
rename from xen/include/asm-x86/msr.h
rename to xen/include/arch-x86/asm/msr.h
diff --git a/xen/include/asm-x86/mtrr.h b/xen/include/arch-x86/asm/mtrr.h
similarity index 100%
rename from xen/include/asm-x86/mtrr.h
rename to xen/include/arch-x86/asm/mtrr.h
diff --git a/xen/include/asm-x86/multicall.h b/xen/include/arch-x86/asm/multicall.h
similarity index 100%
rename from xen/include/asm-x86/multicall.h
rename to xen/include/arch-x86/asm/multicall.h
diff --git a/xen/include/asm-x86/mwait.h b/xen/include/arch-x86/asm/mwait.h
similarity index 100%
rename from xen/include/asm-x86/mwait.h
rename to xen/include/arch-x86/asm/mwait.h
diff --git a/xen/include/asm-x86/nmi.h b/xen/include/arch-x86/asm/nmi.h
similarity index 100%
rename from xen/include/asm-x86/nmi.h
rename to xen/include/arch-x86/asm/nmi.h
diff --git a/xen/include/asm-x86/nops.h b/xen/include/arch-x86/asm/nops.h
similarity index 100%
rename from xen/include/asm-x86/nops.h
rename to xen/include/arch-x86/asm/nops.h
diff --git a/xen/include/asm-x86/nospec.h b/xen/include/arch-x86/asm/nospec.h
similarity index 100%
rename from xen/include/asm-x86/nospec.h
rename to xen/include/arch-x86/asm/nospec.h
diff --git a/xen/include/asm-x86/numa.h b/xen/include/arch-x86/asm/numa.h
similarity index 100%
rename from xen/include/asm-x86/numa.h
rename to xen/include/arch-x86/asm/numa.h
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/arch-x86/asm/p2m.h
similarity index 100%
rename from xen/include/asm-x86/p2m.h
rename to xen/include/arch-x86/asm/p2m.h
diff --git a/xen/include/asm-x86/page-bits.h b/xen/include/arch-x86/asm/page-bits.h
similarity index 100%
rename from xen/include/asm-x86/page-bits.h
rename to xen/include/arch-x86/asm/page-bits.h
diff --git a/xen/include/asm-x86/page.h b/xen/include/arch-x86/asm/page.h
similarity index 100%
rename from xen/include/asm-x86/page.h
rename to xen/include/arch-x86/asm/page.h
diff --git a/xen/include/asm-x86/paging.h b/xen/include/arch-x86/asm/paging.h
similarity index 100%
rename from xen/include/asm-x86/paging.h
rename to xen/include/arch-x86/asm/paging.h
diff --git a/xen/include/asm-x86/pci.h b/xen/include/arch-x86/asm/pci.h
similarity index 100%
rename from xen/include/asm-x86/pci.h
rename to xen/include/arch-x86/asm/pci.h
diff --git a/xen/include/asm-x86/percpu.h b/xen/include/arch-x86/asm/percpu.h
similarity index 100%
rename from xen/include/asm-x86/percpu.h
rename to xen/include/arch-x86/asm/percpu.h
diff --git a/xen/include/asm-x86/perfc.h b/xen/include/arch-x86/asm/perfc.h
similarity index 100%
rename from xen/include/asm-x86/perfc.h
rename to xen/include/arch-x86/asm/perfc.h
diff --git a/xen/include/asm-x86/perfc_defn.h b/xen/include/arch-x86/asm/perfc_defn.h
similarity index 100%
rename from xen/include/asm-x86/perfc_defn.h
rename to xen/include/arch-x86/asm/perfc_defn.h
diff --git a/xen/include/asm-x86/processor.h b/xen/include/arch-x86/asm/processor.h
similarity index 100%
rename from xen/include/asm-x86/processor.h
rename to xen/include/arch-x86/asm/processor.h
diff --git a/xen/include/asm-x86/psr.h b/xen/include/arch-x86/asm/psr.h
similarity index 100%
rename from xen/include/asm-x86/psr.h
rename to xen/include/arch-x86/asm/psr.h
diff --git a/xen/include/asm-x86/pv/domain.h b/xen/include/arch-x86/asm/pv/domain.h
similarity index 100%
rename from xen/include/asm-x86/pv/domain.h
rename to xen/include/arch-x86/asm/pv/domain.h
diff --git a/xen/include/asm-x86/pv/grant_table.h b/xen/include/arch-x86/asm/pv/grant_table.h
similarity index 100%
rename from xen/include/asm-x86/pv/grant_table.h
rename to xen/include/arch-x86/asm/pv/grant_table.h
diff --git a/xen/include/asm-x86/pv/mm.h b/xen/include/arch-x86/asm/pv/mm.h
similarity index 100%
rename from xen/include/asm-x86/pv/mm.h
rename to xen/include/arch-x86/asm/pv/mm.h
diff --git a/xen/include/asm-x86/pv/shim.h b/xen/include/arch-x86/asm/pv/shim.h
similarity index 100%
rename from xen/include/asm-x86/pv/shim.h
rename to xen/include/arch-x86/asm/pv/shim.h
diff --git a/xen/include/asm-x86/pv/traps.h b/xen/include/arch-x86/asm/pv/traps.h
similarity index 100%
rename from xen/include/asm-x86/pv/traps.h
rename to xen/include/arch-x86/asm/pv/traps.h
diff --git a/xen/include/asm-x86/random.h b/xen/include/arch-x86/asm/random.h
similarity index 100%
rename from xen/include/asm-x86/random.h
rename to xen/include/arch-x86/asm/random.h
diff --git a/xen/include/asm-x86/regs.h b/xen/include/arch-x86/asm/regs.h
similarity index 100%
rename from xen/include/asm-x86/regs.h
rename to xen/include/arch-x86/asm/regs.h
diff --git a/xen/include/asm-x86/setup.h b/xen/include/arch-x86/asm/setup.h
similarity index 100%
rename from xen/include/asm-x86/setup.h
rename to xen/include/arch-x86/asm/setup.h
diff --git a/xen/include/asm-x86/shadow.h b/xen/include/arch-x86/asm/shadow.h
similarity index 100%
rename from xen/include/asm-x86/shadow.h
rename to xen/include/arch-x86/asm/shadow.h
diff --git a/xen/include/asm-x86/shared.h b/xen/include/arch-x86/asm/shared.h
similarity index 100%
rename from xen/include/asm-x86/shared.h
rename to xen/include/arch-x86/asm/shared.h
diff --git a/xen/include/asm-x86/smp.h b/xen/include/arch-x86/asm/smp.h
similarity index 100%
rename from xen/include/asm-x86/smp.h
rename to xen/include/arch-x86/asm/smp.h
diff --git a/xen/include/asm-x86/softirq.h b/xen/include/arch-x86/asm/softirq.h
similarity index 100%
rename from xen/include/asm-x86/softirq.h
rename to xen/include/arch-x86/asm/softirq.h
diff --git a/xen/include/asm-x86/spec_ctrl.h b/xen/include/arch-x86/asm/spec_ctrl.h
similarity index 100%
rename from xen/include/asm-x86/spec_ctrl.h
rename to xen/include/arch-x86/asm/spec_ctrl.h
diff --git a/xen/include/asm-x86/spec_ctrl_asm.h b/xen/include/arch-x86/asm/spec_ctrl_asm.h
similarity index 100%
rename from xen/include/asm-x86/spec_ctrl_asm.h
rename to xen/include/arch-x86/asm/spec_ctrl_asm.h
diff --git a/xen/include/asm-x86/spinlock.h b/xen/include/arch-x86/asm/spinlock.h
similarity index 100%
rename from xen/include/asm-x86/spinlock.h
rename to xen/include/arch-x86/asm/spinlock.h
diff --git a/xen/include/asm-x86/string.h b/xen/include/arch-x86/asm/string.h
similarity index 100%
rename from xen/include/asm-x86/string.h
rename to xen/include/arch-x86/asm/string.h
diff --git a/xen/include/asm-x86/system.h b/xen/include/arch-x86/asm/system.h
similarity index 100%
rename from xen/include/asm-x86/system.h
rename to xen/include/arch-x86/asm/system.h
diff --git a/xen/include/asm-x86/tboot.h b/xen/include/arch-x86/asm/tboot.h
similarity index 100%
rename from xen/include/asm-x86/tboot.h
rename to xen/include/arch-x86/asm/tboot.h
diff --git a/xen/include/asm-x86/time.h b/xen/include/arch-x86/asm/time.h
similarity index 100%
rename from xen/include/asm-x86/time.h
rename to xen/include/arch-x86/asm/time.h
diff --git a/xen/include/asm-x86/trace.h b/xen/include/arch-x86/asm/trace.h
similarity index 100%
rename from xen/include/asm-x86/trace.h
rename to xen/include/arch-x86/asm/trace.h
diff --git a/xen/include/asm-x86/traps.h b/xen/include/arch-x86/asm/traps.h
similarity index 100%
rename from xen/include/asm-x86/traps.h
rename to xen/include/arch-x86/asm/traps.h
diff --git a/xen/include/asm-x86/types.h b/xen/include/arch-x86/asm/types.h
similarity index 100%
rename from xen/include/asm-x86/types.h
rename to xen/include/arch-x86/asm/types.h
diff --git a/xen/include/asm-x86/uaccess.h b/xen/include/arch-x86/asm/uaccess.h
similarity index 100%
rename from xen/include/asm-x86/uaccess.h
rename to xen/include/arch-x86/asm/uaccess.h
diff --git a/xen/include/asm-x86/unaligned.h b/xen/include/arch-x86/asm/unaligned.h
similarity index 100%
rename from xen/include/asm-x86/unaligned.h
rename to xen/include/arch-x86/asm/unaligned.h
diff --git a/xen/include/asm-x86/vm_event.h b/xen/include/arch-x86/asm/vm_event.h
similarity index 100%
rename from xen/include/asm-x86/vm_event.h
rename to xen/include/arch-x86/asm/vm_event.h
diff --git a/xen/include/asm-x86/vpmu.h b/xen/include/arch-x86/asm/vpmu.h
similarity index 100%
rename from xen/include/asm-x86/vpmu.h
rename to xen/include/arch-x86/asm/vpmu.h
diff --git a/xen/include/asm-x86/x86-defns.h b/xen/include/arch-x86/asm/x86-defns.h
similarity index 100%
rename from xen/include/asm-x86/x86-defns.h
rename to xen/include/arch-x86/asm/x86-defns.h
diff --git a/xen/include/asm-x86/x86-vendors.h b/xen/include/arch-x86/asm/x86-vendors.h
similarity index 100%
rename from xen/include/asm-x86/x86-vendors.h
rename to xen/include/arch-x86/asm/x86-vendors.h
diff --git a/xen/include/asm-x86/x86_64/efibind.h b/xen/include/arch-x86/asm/x86_64/efibind.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/efibind.h
rename to xen/include/arch-x86/asm/x86_64/efibind.h
diff --git a/xen/include/asm-x86/x86_64/elf.h b/xen/include/arch-x86/asm/x86_64/elf.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/elf.h
rename to xen/include/arch-x86/asm/x86_64/elf.h
diff --git a/xen/include/asm-x86/x86_64/page.h b/xen/include/arch-x86/asm/x86_64/page.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/page.h
rename to xen/include/arch-x86/asm/x86_64/page.h
diff --git a/xen/include/asm-x86/x86_64/regs.h b/xen/include/arch-x86/asm/x86_64/regs.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/regs.h
rename to xen/include/arch-x86/asm/x86_64/regs.h
diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/arch-x86/asm/x86_64/system.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/system.h
rename to xen/include/arch-x86/asm/x86_64/system.h
diff --git a/xen/include/asm-x86/x86_64/uaccess.h b/xen/include/arch-x86/asm/x86_64/uaccess.h
similarity index 100%
rename from xen/include/asm-x86/x86_64/uaccess.h
rename to xen/include/arch-x86/asm/x86_64/uaccess.h
diff --git a/xen/include/asm-x86/x86_emulate.h b/xen/include/arch-x86/asm/x86_emulate.h
similarity index 100%
rename from xen/include/asm-x86/x86_emulate.h
rename to xen/include/arch-x86/asm/x86_emulate.h
diff --git a/xen/include/asm-x86/xenoprof.h b/xen/include/arch-x86/asm/xenoprof.h
similarity index 100%
rename from xen/include/asm-x86/xenoprof.h
rename to xen/include/arch-x86/asm/xenoprof.h
diff --git a/xen/include/asm-x86/xstate.h b/xen/include/arch-x86/asm/xstate.h
similarity index 100%
rename from xen/include/asm-x86/xstate.h
rename to xen/include/arch-x86/asm/xstate.h
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 088c238a504a..e03ae4e74ee3 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -40,8 +40,8 @@
 #define ACPI_MADT_GET_TRIGGER(inti)	ACPI_MADT_GET_(TRIGGER, inti)
 
 /*
- * Fixmap pages to reserve for ACPI boot-time tables (see asm-x86/fixmap.h or
- * asm-arm/config.h, 64 pages(256KB) is large enough for most cases.)
+ * Fixmap pages to reserve for ACPI boot-time tables (see arch-x86/asm/fixmap.h
+ * or arch-arm/asm/config.h, 64 pages(256KB) is large enough for most cases.)
  */
 #define NUM_FIXMAP_ACPI_PAGES  64
 
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 634a259645fb..6d69c72c2e03 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -14,7 +14,7 @@
  *
  * Function implementations generic to all architectures are in
  * lib/bitmap.c.  Functions implementations that are architecture
- * specific are in various include/asm-<arch>/bitops.h headers
+ * specific are in various include/arch-<arch>/asm/bitops.h headers
  * and other arch/<arch> specific files.
  *
  * See lib/bitmap.c for more details.
-- 
Anthony PERARD


