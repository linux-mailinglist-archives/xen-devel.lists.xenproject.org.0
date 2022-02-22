Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB74BFC80
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276855.473197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4V-0006mU-II; Tue, 22 Feb 2022 15:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276855.473197; Tue, 22 Feb 2022 15:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4V-0006jE-D4; Tue, 22 Feb 2022 15:27:23 +0000
Received: by outflank-mailman (input) for mailman id 276855;
 Tue, 22 Feb 2022 15:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4T-0006Cs-00
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf94108-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:27:19 +0100 (CET)
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
X-Inumbo-ID: ebf94108-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543639;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4K+rq1ET+69I5UkEpWtzBL2Q+U1T0lAFfJpGQ9h5iPw=;
  b=BLkwFL7+kJ/5lCby55LvUw6XyDoh7/t637ONuD0wjoYYxtpxUME3mMwu
   9Mf8qyTxPuf+l6yneCtm/S0qIhU09Hta0knk9flAEGKfws5FZ5uOs+6CX
   NHCsEFLgkail1EzK6zNuRja0KZyTjdHthhGa0yRGtLHlmXjm8mYg/EKr4
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65138254
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:URV+Pa3PZgj2FEbMz/bD5Qxxkn2cJEfYwER7XKvMYLTBsI5bp2NTm
 2QbUTrUPP2KMzT1eY0lbt+09BgAvpPVzd8xHQttpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1PiZGxGQA1Y5TQhcI2WR9ZCyJGHIdZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDP
 pFJM2czBPjGSzJGAksIUZYnoPn23yjlIyJRiVmcg7VitgA/yyQuieOwYbI5YOeiZ+9Yg0KZr
 WLu5HniD1cRM9n34TiK6HW3ncfUgDj2HokVEdWQ8/dwhVSJy287CRsIVEC6q/20lk6/Xd1EL
 0UevCEpqMAa9lGvT9T7dw21pjiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqeissXQYDpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7j/IG1vW84Q3+ny+KjZLPTxY23iT9QTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C9TbwJtdiON7Kih6Sdkifdp0mCgmbKggjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ymk0r2jOfEOCfNIVvgDLdoRrpihE9jiF+Im
 +uzyuPQk0kPOAEASnO/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3LY9laUtF
 6FdIa1twJ1nE1z6xtjUVrGlxKQKSfhhrVjm0/aNCNTnQ6Ndeg==
IronPort-HdrOrdr: A9a23:mG72gakbYRQXkSUCwT7JIxrn5lfpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="65138254"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v3 00/70 (not all posted)] x86: Support for CET Indirect Branch Tracking
Date: Tue, 22 Feb 2022 15:26:30 +0000
Message-ID: <20220222152645.8844-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

To avoid spamming everyone, I have only re-sent patches with changes in v3.

CET Indirect Branch Tracking is a hardware feature designed to protect against
forward-edge control flow hijacking (Call/Jump oriented programming), and is a
companion feature to CET Shadow Stacks added in Xen 4.14.

Patches 1 thru 5 are prerequisites.  Patches 6 thru 59 are fairly mechanical
annotations of function pointer targets.  Patches 60 thru 70 are the final
enablement of CET-IBT.

This series functions correctly with GCC 9 and later, although an experimental
GCC patch is required to get more helpful typechecking at build time.  A
container with this fix has been added to CI.

Tested on a TigerLake NUC by me, and by Marek also.

CI pipelines:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/476819536
  https://cirrus-ci.com/build/4634902334275584

Andrew Cooper (67):
  xen/sort: Switch to an extern inline implementation
  xen/xsm: Move {do,compat}_flask_op() declarations into a header
  x86/kexec: Annotate embedded data with ELF metadata
  x86: Introduce support for CET-IBT
  xen: CFI hardening for x86 hypercalls
  xen: CFI hardening for custom_param()
  xen: CFI hardening for __initcall()
  xen: CFI hardening for notifier callbacks
  xen: CFI hardening for acpi_table_parse()
  xen: CFI hardening for continue_hypercall_on_cpu()
  xen: CFI hardening for init_timer()
  xen: CFI hardening for call_rcu()
  xen: CFI hardening for IPIs
  xen: CFI hardening for open_softirq()
  xsm/flask/ss: CFI hardening
  xsm: CFI hardening
  xen/sched: CFI hardening
  xen/evtchn: CFI hardening
  xen/hypfs: CFI hardening
  xen/tasklet: CFI hardening
  xen/keyhandler: CFI hardening
  xen/vpci: CFI hardening
  xen/decompress: CFI hardening
  xen/iommu: CFI hardening
  xen/video: CFI hardening
  xen/console: CFI hardening
  xen/misc: CFI hardening
  x86: CFI hardening for request_irq()
  x86/hvm: CFI hardening for hvm_funcs
  x86/hvm: CFI hardening for device emulation
  x86/emul: CFI hardening
  x86/ucode: CFI hardening
  x86/power: CFI hardening
  x86/apic: CFI hardening
  x86/nmi: CFI hardening
  x86/mtrr: CFI hardening
  x86/idle: CFI hardening
  x86/quirks: CFI hardening
  x86/hvmsave: CFI hardening
  x86/mce: CFI hardening
  x86/pmu: CFI hardening
  x86/cpu: CFI hardening
  x86/guest: CFI hardening
  x86/logdirty: CFI hardening
  x86/shadow: CFI hardening
  x86/hap: CFI hardening
  x86/p2m: CFI hardening
  x86/irq: CFI hardening
  x86/apei: CFI hardening
  x86/psr: CFI hardening
  x86/dpci: CFI hardening
  x86/pt: CFI hardening
  x86/time: CFI hardening
  x86/misc: CFI hardening
  x86/stack: CFI hardening
  x86/bugframe: CFI hardening
  x86: Use control flow typechecking where possible
  x86/setup: Read CR4 earlier in __start_xen()
  x86/alternatives: Clear CR4.CET when clearing CR0.WP
  x86/traps: Rework write_stub_trampoline() to not hardcode the jmp
  x86: Introduce helpers/checks for endbr64 instructions
  x86/emul: Update emulation stubs to be CET-IBT compatible
  x86/entry: Make syscall/sysenter entrypoints CET-IBT compatible
  x86/entry: Make IDT entrypoints CET-IBT compatible
  x86/setup: Rework MSR_S_CET handling for CET-IBT
  x86/efi: Disable CET-IBT around Runtime Services calls
  x86: Enable CET Indirect Branch Tracking

Juergen Gross (2):
  x86/pv-shim: Don't modify the hypercall table
  x86: Don't use the hypercall table for calling compat hypercalls

Marek Marczykowski-Górecki (1):
  x86: Build check for embedded endbr64 instructions

 Config.mk                                         |   1 -
 README                                            |   1 +
 automation/build/debian/buster-gcc-ibt.dockerfile |  66 ++++
 automation/gitlab-ci/build.yaml                   |   6 +
 automation/scripts/containerize                   |   1 +
 docs/misc/xen-command-line.pandoc                 |  16 +-
 tools/firmware/Makefile                           |   2 +
 tools/libs/guest/xg_dom_decompress_unsafe.h       |   2 +
 tools/tests/x86_emulator/x86-emulate.h            |   2 +
 xen/arch/arm/bootfdt.c                            |   9 +-
 xen/arch/arm/io.c                                 |   9 +-
 xen/arch/x86/Kconfig                              |  17 +
 xen/arch/x86/Makefile                             |   6 +
 xen/arch/x86/acpi/boot.c                          |  24 +-
 xen/arch/x86/acpi/cpu_idle.c                      |  43 ++-
 xen/arch/x86/acpi/cpufreq/cpufreq.c               |  24 +-
 xen/arch/x86/acpi/cpufreq/powernow.c              |  21 +-
 xen/arch/x86/acpi/cpuidle_menu.c                  |   6 +-
 xen/arch/x86/acpi/lib.c                           |   2 +-
 xen/arch/x86/acpi/power.c                         |   4 +-
 xen/arch/x86/acpi/wakeup_prot.S                   |  38 +-
 xen/arch/x86/alternative.c                        |  13 +-
 xen/arch/x86/apic.c                               |  12 +-
 xen/arch/x86/arch.mk                              |   7 +
 xen/arch/x86/boot/x86_64.S                        |  30 +-
 xen/arch/x86/compat.c                             |  21 +-
 xen/arch/x86/configs/pvshim_defconfig             |   1 +
 xen/arch/x86/cpu/amd.c                            |   8 +-
 xen/arch/x86/cpu/centaur.c                        |   2 +-
 xen/arch/x86/cpu/common.c                         |   3 +-
 xen/arch/x86/cpu/cpu.h                            |   2 +-
 xen/arch/x86/cpu/hygon.c                          |   2 +-
 xen/arch/x86/cpu/intel.c                          |   6 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c            |   4 +-
 xen/arch/x86/cpu/mcheck/mce.c                     |  22 +-
 xen/arch/x86/cpu/mcheck/mce.h                     |   2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c                 |   9 +-
 xen/arch/x86/cpu/mcheck/mce_amd.h                 |   4 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c               |  49 ++-
 xen/arch/x86/cpu/mcheck/non-fatal.c               |   6 +-
 xen/arch/x86/cpu/mcheck/vmce.c                    |   4 +-
 xen/arch/x86/cpu/microcode/amd.c                  |   9 +-
 xen/arch/x86/cpu/microcode/core.c                 |  15 +-
 xen/arch/x86/cpu/microcode/intel.c                |  10 +-
 xen/arch/x86/cpu/mtrr/generic.c                   |  20 +-
 xen/arch/x86/cpu/mtrr/main.c                      |   4 +-
 xen/arch/x86/cpu/mtrr/mtrr.h                      |   8 +-
 xen/arch/x86/cpu/mwait-idle.c                     |  12 +-
 xen/arch/x86/cpu/shanghai.c                       |   2 +-
 xen/arch/x86/cpu/vpmu.c                           |  13 +-
 xen/arch/x86/cpu/vpmu_amd.c                       |  16 +-
 xen/arch/x86/cpu/vpmu_intel.c                     |  16 +-
 xen/arch/x86/cpuid.c                              |   8 +-
 xen/arch/x86/crash.c                              |   7 +-
 xen/arch/x86/dmi_scan.c                           |  10 +-
 xen/arch/x86/dom0_build.c                         |   8 +-
 xen/arch/x86/domain.c                             |  16 +-
 xen/arch/x86/emul-i8254.c                         |  14 +-
 xen/arch/x86/extable.c                            |  18 +-
 xen/arch/x86/genapic/bigsmp.c                     |   4 +-
 xen/arch/x86/genapic/delivery.c                   |  12 +-
 xen/arch/x86/genapic/probe.c                      |   2 +-
 xen/arch/x86/genapic/x2apic.c                     |  18 +-
 xen/arch/x86/guest/hyperv/hyperv.c                |  10 +-
 xen/arch/x86/guest/xen/xen.c                      |  15 +-
 xen/arch/x86/hpet.c                               |  29 +-
 xen/arch/x86/hvm/dm.c                             |   5 +-
 xen/arch/x86/hvm/dom0_build.c                     |  16 +-
 xen/arch/x86/hvm/emulate.c                        |  93 +++--
 xen/arch/x86/hvm/hpet.c                           |  12 +-
 xen/arch/x86/hvm/hvm.c                            |  47 +--
 xen/arch/x86/hvm/hypercall.c                      |   5 +-
 xen/arch/x86/hvm/intercept.c                      |  28 +-
 xen/arch/x86/hvm/io.c                             |  38 +-
 xen/arch/x86/hvm/ioreq.c                          |   2 +-
 xen/arch/x86/hvm/irq.c                            |  16 +-
 xen/arch/x86/hvm/mtrr.c                           |   8 +-
 xen/arch/x86/hvm/nestedhvm.c                      |   6 +-
 xen/arch/x86/hvm/pmtimer.c                        |  10 +-
 xen/arch/x86/hvm/quirks.c                         |   4 +-
 xen/arch/x86/hvm/rtc.c                            |  18 +-
 xen/arch/x86/hvm/stdvga.c                         |  19 +-
 xen/arch/x86/hvm/svm/nestedsvm.c                  |  22 +-
 xen/arch/x86/hvm/svm/svm.c                        | 404 +++++++++++-----------
 xen/arch/x86/hvm/svm/vmcb.c                       |   2 +-
 xen/arch/x86/hvm/vioapic.c                        |  12 +-
 xen/arch/x86/hvm/viridian/time.c                  |   2 +-
 xen/arch/x86/hvm/viridian/viridian.c              |  17 +-
 xen/arch/x86/hvm/vlapic.c                         |  25 +-
 xen/arch/x86/hvm/vmsi.c                           |  16 +-
 xen/arch/x86/hvm/vmx/intr.c                       |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                       |  22 +-
 xen/arch/x86/hvm/vmx/vmx.c                        | 155 +++++----
 xen/arch/x86/hvm/vmx/vvmx.c                       |  16 +-
 xen/arch/x86/hvm/vpic.c                           |   8 +-
 xen/arch/x86/hvm/vpt.c                            |   2 +-
 xen/arch/x86/i8259.c                              |  10 +-
 xen/arch/x86/include/asm/asm-defns.h              |   6 +
 xen/arch/x86/include/asm/bug.h                    |  10 +-
 xen/arch/x86/include/asm/cpufeature.h             |   1 +
 xen/arch/x86/include/asm/cpufeatures.h            |   1 +
 xen/arch/x86/include/asm/cpuidle.h                |   4 +-
 xen/arch/x86/include/asm/current.h                |   6 +-
 xen/arch/x86/include/asm/endbr.h                  |  55 +++
 xen/arch/x86/include/asm/flushtlb.h               |   2 +-
 xen/arch/x86/include/asm/genapic.h                |  18 +-
 xen/arch/x86/include/asm/hpet.h                   |   8 +-
 xen/arch/x86/include/asm/hvm/emulate.h            |   8 +-
 xen/arch/x86/include/asm/hvm/save.h               |   2 +-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h      |  18 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h            |   1 -
 xen/arch/x86/include/asm/hvm/vioapic.h            |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h           |   8 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h            |   4 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h           |  18 +-
 xen/arch/x86/include/asm/hypercall.h              |  81 +++--
 xen/arch/x86/include/asm/irq.h                    |  24 +-
 xen/arch/x86/include/asm/machine_kexec.h          |   2 +-
 xen/arch/x86/include/asm/mm.h                     |  16 +-
 xen/arch/x86/include/asm/msi.h                    |   8 +-
 xen/arch/x86/include/asm/msr-index.h              |   1 +
 xen/arch/x86/include/asm/mtrr.h                   |   2 +-
 xen/arch/x86/include/asm/p2m.h                    |   4 +-
 xen/arch/x86/include/asm/paging.h                 |   2 +-
 xen/arch/x86/include/asm/processor.h              |   4 +-
 xen/arch/x86/include/asm/pv/domain.h              |   4 +-
 xen/arch/x86/include/asm/pv/shim.h                |  11 +-
 xen/arch/x86/include/asm/shadow.h                 |   2 +-
 xen/arch/x86/include/asm/smp.h                    |   6 +-
 xen/arch/x86/include/asm/tboot.h                  |   2 +-
 xen/arch/x86/include/asm/time.h                   |   6 +-
 xen/arch/x86/io_apic.c                            |  28 +-
 xen/arch/x86/ioport_emulate.c                     |   4 +-
 xen/arch/x86/irq.c                                |  28 +-
 xen/arch/x86/livepatch.c                          |   2 +-
 xen/arch/x86/machine_kexec.c                      |   2 +-
 xen/arch/x86/mm.c                                 |  35 +-
 xen/arch/x86/mm/hap/guest_walk.c                  |   4 +-
 xen/arch/x86/mm/hap/hap.c                         |  29 +-
 xen/arch/x86/mm/hap/nested_hap.c                  |   2 +-
 xen/arch/x86/mm/hap/private.h                     |  30 +-
 xen/arch/x86/mm/mem_sharing.c                     |   2 +-
 xen/arch/x86/mm/p2m-ept.c                         |  34 +-
 xen/arch/x86/mm/p2m-pt.c                          |  19 +-
 xen/arch/x86/mm/paging.c                          |   3 +-
 xen/arch/x86/mm/shadow/common.c                   |  33 +-
 xen/arch/x86/mm/shadow/hvm.c                      |  16 +-
 xen/arch/x86/mm/shadow/multi.c                    |  80 +++--
 xen/arch/x86/mm/shadow/multi.h                    |  20 +-
 xen/arch/x86/mm/shadow/none.c                     |  20 +-
 xen/arch/x86/mm/shadow/private.h                  |  12 +-
 xen/arch/x86/mm/shadow/pv.c                       |   4 +-
 xen/arch/x86/msi.c                                |  18 +-
 xen/arch/x86/nmi.c                                |  16 +-
 xen/arch/x86/numa.c                               |  10 +-
 xen/arch/x86/oprofile/nmi_int.c                   |  16 +-
 xen/arch/x86/oprofile/op_model_athlon.c           |  18 +-
 xen/arch/x86/oprofile/op_model_p4.c               |  14 +-
 xen/arch/x86/oprofile/op_model_ppro.c             |  26 +-
 xen/arch/x86/percpu.c                             |   6 +-
 xen/arch/x86/physdev.c                            |   2 +-
 xen/arch/x86/platform_hypercall.c                 |  11 +-
 xen/arch/x86/psr.c                                |  41 +--
 xen/arch/x86/pv/callback.c                        |  25 +-
 xen/arch/x86/pv/descriptor-tables.c               |  14 +-
 xen/arch/x86/pv/domain.c                          |  12 +-
 xen/arch/x86/pv/emul-gate-op.c                    |   9 +-
 xen/arch/x86/pv/emul-priv-op.c                    |  71 ++--
 xen/arch/x86/pv/emulate.h                         |   7 -
 xen/arch/x86/pv/hypercall.c                       |  11 +-
 xen/arch/x86/pv/iret.c                            |   4 +-
 xen/arch/x86/pv/misc-hypercalls.c                 |  10 +-
 xen/arch/x86/pv/ro-page-fault.c                   |  31 +-
 xen/arch/x86/pv/shim.c                            |  60 ++--
 xen/arch/x86/pv/traps.c                           |   2 +-
 xen/arch/x86/setup.c                              |  80 ++++-
 xen/arch/x86/shutdown.c                           |  10 +-
 xen/arch/x86/smp.c                                |  20 +-
 xen/arch/x86/smpboot.c                            |   2 +-
 xen/arch/x86/spec_ctrl.c                          |   6 +-
 xen/arch/x86/srat.c                               |   4 +-
 xen/arch/x86/sysctl.c                             |   4 +-
 xen/arch/x86/tboot.c                              |   2 +-
 xen/arch/x86/time.c                               |  68 ++--
 xen/arch/x86/traps.c                              |   8 +-
 xen/arch/x86/tsx.c                                |   2 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c                  |   2 +-
 xen/arch/x86/x86_64/compat.c                      |   1 -
 xen/arch/x86/x86_64/compat/entry.S                |   1 +
 xen/arch/x86/x86_64/compat/mm.c                   |   7 +-
 xen/arch/x86/x86_64/entry.S                       |  49 ++-
 xen/arch/x86/x86_64/kexec_reloc.S                 |  23 +-
 xen/arch/x86/x86_64/mmconfig-shared.c             |  10 +-
 xen/arch/x86/x86_64/mmconfig.h                    |   2 +-
 xen/arch/x86/x86_64/platform_hypercall.c          |   2 +-
 xen/arch/x86/x86_64/traps.c                       |  42 ++-
 xen/arch/x86/x86_emulate.c                        |  34 +-
 xen/arch/x86/x86_emulate/x86_emulate.c            |  10 +-
 xen/arch/x86/x86_emulate/x86_emulate.h            |  33 +-
 xen/arch/x86/xen.lds.S                            |   3 +-
 xen/common/argo.c                                 |   6 +-
 xen/common/bunzip2.c                              |   2 +-
 xen/common/compat/domain.c                        |   3 +-
 xen/common/compat/grant_table.c                   |   5 +-
 xen/common/compat/kernel.c                        |   2 +-
 xen/common/compat/memory.c                        |   7 +-
 xen/common/compat/multicall.c                     |   3 +-
 xen/common/core_parking.c                         |  10 +-
 xen/common/coverage/gcov.c                        |   8 +-
 xen/common/cpu.c                                  |   4 +-
 xen/common/debugtrace.c                           |  10 +-
 xen/common/decompress.c                           |   2 +-
 xen/common/dm.c                                   |   6 +-
 xen/common/domain.c                               |  15 +-
 xen/common/domctl.c                               |   2 +-
 xen/common/efi/boot.c                             |   6 +-
 xen/common/efi/runtime.c                          |  18 +
 xen/common/event_2l.c                             |  21 +-
 xen/common/event_channel.c                        |  18 +-
 xen/common/event_fifo.c                           |  30 +-
 xen/common/gdbstub.c                              |   9 +-
 xen/common/grant_table.c                          |  29 +-
 xen/common/hypfs.c                                |  63 ++--
 xen/common/irq.c                                  |   6 +-
 xen/common/kernel.c                               |   6 +-
 xen/common/kexec.c                                |  18 +-
 xen/common/keyhandler.c                           |  47 +--
 xen/common/livepatch.c                            |  15 +-
 xen/common/memory.c                               |   8 +-
 xen/common/multicall.c                            |   2 +-
 xen/common/page_alloc.c                           |  14 +-
 xen/common/perfc.c                                |   4 +-
 xen/common/radix-tree.c                           |   8 +-
 xen/common/random.c                               |   2 +-
 xen/common/rangeset.c                             |   2 +-
 xen/common/rcupdate.c                             |   8 +-
 xen/common/sched/arinc653.c                       |  20 +-
 xen/common/sched/compat.c                         |   2 +-
 xen/common/sched/core.c                           |  40 +--
 xen/common/sched/cpupool.c                        |  35 +-
 xen/common/sched/credit.c                         |  59 ++--
 xen/common/sched/credit2.c                        |  55 ++-
 xen/common/sched/null.c                           |  60 ++--
 xen/common/sched/rt.c                             |  47 +--
 xen/common/spinlock.c                             |  12 +-
 xen/common/stop_machine.c                         |   6 +-
 xen/common/sysctl.c                               |   2 +-
 xen/common/tasklet.c                              |   4 +-
 xen/common/timer.c                                |   6 +-
 xen/common/trace.c                                |   4 +-
 xen/common/unlzma.c                               |   2 +-
 xen/common/vm_event.c                             |   6 +-
 xen/common/xenoprof.c                             |   2 +-
 xen/common/xmalloc_tlsf.c                         |   4 +-
 xen/common/zstd/zstd_common.c                     |   4 +-
 xen/common/zstd/zstd_internal.h                   |   4 +-
 xen/drivers/acpi/apei/apei-base.c                 |  32 +-
 xen/drivers/acpi/apei/apei-internal.h             |  20 +-
 xen/drivers/acpi/apei/erst.c                      |  57 ++-
 xen/drivers/acpi/apei/hest.c                      |   4 +-
 xen/drivers/acpi/numa.c                           |  10 +-
 xen/drivers/acpi/tables.c                         |   2 +-
 xen/drivers/char/console.c                        |  36 +-
 xen/drivers/char/ehci-dbgp.c                      |  28 +-
 xen/drivers/char/ns16550.c                        |  34 +-
 xen/drivers/cpufreq/cpufreq.c                     |   6 +-
 xen/drivers/cpufreq/cpufreq_misc_governors.c      |  22 +-
 xen/drivers/cpufreq/cpufreq_ondemand.c            |  10 +-
 xen/drivers/passthrough/amd/iommu.h               |  45 +--
 xen/drivers/passthrough/amd/iommu_acpi.c          |  15 +-
 xen/drivers/passthrough/amd/iommu_guest.c         |  12 +-
 xen/drivers/passthrough/amd/iommu_init.c          |  49 +--
 xen/drivers/passthrough/amd/iommu_intr.c          |  20 +-
 xen/drivers/passthrough/amd/iommu_map.c           |  22 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c       |  32 +-
 xen/drivers/passthrough/iommu.c                   |  56 ++-
 xen/drivers/passthrough/pci.c                     |  18 +-
 xen/drivers/passthrough/vtd/dmar.c                |   7 +-
 xen/drivers/passthrough/vtd/extern.h              |  38 +-
 xen/drivers/passthrough/vtd/intremap.c            |  14 +-
 xen/drivers/passthrough/vtd/iommu.c               |  94 ++---
 xen/drivers/passthrough/vtd/qinval.c              |  28 +-
 xen/drivers/passthrough/vtd/quirks.c              |   2 +-
 xen/drivers/passthrough/vtd/utils.c               |   2 +-
 xen/drivers/passthrough/vtd/x86/hvm.c             |   4 +-
 xen/drivers/passthrough/x86/hvm.c                 |  14 +-
 xen/drivers/video/lfb.c                           |   4 +-
 xen/drivers/video/lfb.h                           |   4 +-
 xen/drivers/video/vesa.c                          |   6 +-
 xen/drivers/video/vga.c                           |   6 +-
 xen/drivers/vpci/header.c                         |  18 +-
 xen/drivers/vpci/msi.c                            |  42 +--
 xen/drivers/vpci/msix.c                           |  20 +-
 xen/drivers/vpci/vpci.c                           |  16 +-
 xen/include/acpi/cpufreq/cpufreq.h                |   1 -
 xen/include/xen/acpi.h                            |   2 +-
 xen/include/xen/compiler.h                        |   6 +
 xen/include/xen/domain.h                          |   2 +-
 xen/include/xen/hypercall.h                       |  69 ++--
 xen/include/xen/hypfs.h                           |  49 ++-
 xen/include/xen/irq.h                             |   6 +-
 xen/include/xen/lib.h                             |   2 +-
 xen/include/xen/perfc.h                           |   4 +-
 xen/include/xen/sched.h                           |   2 +-
 xen/include/xen/sort.h                            |  55 ++-
 xen/include/xen/spinlock.h                        |   4 +-
 xen/include/xen/vpci.h                            |   8 +-
 xen/include/xsm/dummy.h                           | 211 +++++------
 xen/lib/sort.c                                    |  80 +----
 xen/tools/check-endbr.sh                          |  85 +++++
 xen/xsm/flask/avc.c                               |   2 +-
 xen/xsm/flask/flask_op.c                          |   8 +-
 xen/xsm/flask/hooks.c                             | 236 +++++++------
 xen/xsm/flask/private.h                           |   9 +
 xen/xsm/flask/ss/avtab.c                          |   4 +-
 xen/xsm/flask/ss/conditional.c                    |  10 +-
 xen/xsm/flask/ss/conditional.h                    |   6 +-
 xen/xsm/flask/ss/policydb.c                       |  53 +--
 xen/xsm/flask/ss/services.c                       |   6 +-
 xen/xsm/flask/ss/symtab.c                         |   5 +-
 xen/xsm/silo.c                                    |  24 +-
 xen/xsm/xsm_core.c                                |   6 +-
 322 files changed, 3316 insertions(+), 2739 deletions(-)
 create mode 100644 automation/build/debian/buster-gcc-ibt.dockerfile
 create mode 100644 xen/arch/x86/include/asm/endbr.h
 create mode 100755 xen/tools/check-endbr.sh
 create mode 100644 xen/xsm/flask/private.h

-- 
2.11.0


