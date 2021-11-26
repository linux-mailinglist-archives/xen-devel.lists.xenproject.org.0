Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D410F45EE0A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232665.403441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRS-0001Yh-Jc; Fri, 26 Nov 2021 12:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232665.403441; Fri, 26 Nov 2021 12:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRS-0001V2-EK; Fri, 26 Nov 2021 12:35:02 +0000
Received: by outflank-mailman (input) for mailman id 232665;
 Fri, 26 Nov 2021 12:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRQ-0001F5-I4
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:00 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4330bf51-4eb5-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:34:58 +0100 (CET)
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
X-Inumbo-ID: 4330bf51-4eb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LfjCnt4ZdLknfcUZQY16/MU7yjWEP3iLFA7xjg9eTHQ=;
  b=Tu0V/MiLDZ4vpePd5mK18D/q7h4CRtk3iC+k82q4vSHSSvz7MPnfykAN
   RdLk0uirCs+Md2iM67LBlYH1Mct0/ZW/7E1O5sKrNhOLrSFb4GlntPBdY
   Mfzy9xDU8XDtvDdVSdcWC3UFJtq88+NkEzBtnvJUaZAcihBWRx9bsaQ+Y
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c71WcVeqG1OaNG2XZqoPK3Ryv6y4xmWBsOCIRuzERuW8LgtJaeQjiNtcUl1DOmH+Kylgfl0WdH
 hzto/LFP4DxEDMQUKuaok2irWdWkTtgq4mVNNUNuwaHmalku6xHxol4LSzMcelunv8ouH5CeyF
 0JKg2EnBhDNmDDdzztb9m8rJ4m1AY9TzyFmZoVS//AY4+GJEUT+IOlupXSXz6Bi22EijVeItmt
 S+3YHxE56uPTu8Cih6RBMAycFLDsfmA5KaZRUhx1nixQjyo0uU2Hs8Q2MEYQTQsXMrwQs20AVK
 k2CsOfRTbbMrJ7YZhyWPxYXK
X-SBRS: 5.1
X-MesageID: 59062302
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WxZFRKN6CEOKW3LvrR3gkcFynXyQoLVcMsEvi/4bfWQNrUonhTdVm
 zROWz2BP66NZTCgL9FxOoq29UwAvZWEmtM1QQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg9w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy3YxdFe6
 dJ8j4GPUiwgL4jgsucWbzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWZo2JoVRay2i
 8wxaxZjXQ3nXUB1F1oYMrMEl8uQrHjGbGgNwL6SjfVuuDWCpOBr65DvP8DSYceiXthOkwCTo
 Weu10bTDwweNdef4SGY6X/qjejK9Qv+UZgXHae19dZrhkOS3W0ZDBAKVVq9ruK9g0T4UNVaQ
 2QY4jErrLQy3EWzQ8PhQgajp3qZoh8bXcEWGOo/gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9v+pIA+iDrfQ9AlF7S65vXqHRngz
 jbMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEq9v1l4S6+iVra11kPw5OdlAKyaRWWo6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 ReL4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUixzyDAcollY
 P93lPpA615BUsyLKxLsGo8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/l6Ko
 4gCaJrWlUkEOAEbXsUx2dVIRbztBSJmba0aVuQNLrLTSuaYMD1J5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhihyCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNA4KUnw21vRZ3HNjfpWV8cIejElM+TMJmPHnBTixALu3Sfni
 7H/hA7dX7QZQAFuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59fz6N
 +VYxv3xKtMdm1NOv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/Wo4tUI7SEPs/hAWU9Hgt9Y7TRz+wQlxnT8e8xfBfw6hho8efVSk5VJRSN1nBQdeMnLIM/z
 O49k8cK8Ajj2AEyO9OLgy0IpWSBKnsMD/cuup0AWdK5jwMqzhdJYIDGCz+w65aKMo0ePk4vK
 z6SpazDm7UDmRaSLyttTSDAjbhHmJADmBFW11tTdV2Gl+3MiuIzwBAMoy88SR5Yz0kf3u9+U
 oSx25aZ+UlaE+9UufV+
IronPort-HdrOrdr: A9a23:sIjSUqFrgmeROl07pLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="59062302"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
Date: Fri, 26 Nov 2021 12:33:41 +0000
Message-ID: <20211126123446.32324-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CET Indirect Branch Tracking is a hardware feature designed to protect against
forward-edge control flow hijacking (Call/Jump oriented programming), and is a
companion feature to CET Shadow Stacks added in Xen 4.14.

This series depends on lots of previously posted patches.  See
xenbits/xen-cet-ibt for the full branch with all dependencies.

Patch 1 introduces some compile time infrastructure.

Patches 2 thru 56 annotate all function pointer targets in the common and x86
hypervisor code.  Patches are split by API and in no particular order, and
largely mechanical.  As such, I'm limiting review mainly to The Rest.  While
doing this work does depend on an experimental GCC change (patch 56), the
result does actually work properly with GCC 9 onwards.

Patches 57 thru 65 do the final enablement of CET-IBT.

I have developed this on a TigerLake NUC.  Many thanks to Marek who has also
given the series a spin on a TigerLake laptop.

Some CI runs, green across the board:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/416737379
  https://cirrus-ci.com/build/6547947216175104

Various note accumulated through the work:
  * I have already posted patches fixing some of the most egregious (ab)uses of
    function pointers.  There are plenty of other areas which could do with
    cleanup.
  * With everything turned on, we get 1688 runtime endbr64's, and 233 init
    time.  The number of runtime endbr64's is expected to reduce with
    Juergen's hypercall series (see later), and in common deployment cases
    where not everything is compiled in by default.
  * I have not checked for misaligned endbr64's, and I'm not sure there is
    anything useful we could do upon discovering that there were any.
    Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
    this doesn't account for the structure of x86 code, which is most
    certainly not a uniform random distribution of bytes.
  * I have followup work to reduce the number of runtime endbr64's using boot
    time patching, which further improves the security benefit.
  * Patches 2 and 3 are a minimal subset of Juergen's hypercall series, with
    patch 4 annotating every hypercall.  I failed to get the full series pass
    in CI, so put this together as a stopgap.  It reduces the dependencies
    involved, and patch 4 can be dropped if the hypercall series gets in
    first.
  * The x86 MTRR code is a complete mess, and as far as I can tell, is mostly
    pre-64bit support.  It could do with a prune.
  * We do many passes of the MADT counting objects.  This is a waste of time
    and we should count them on a single pass.
  * The NUMA setup (SRAT parsing) appears to happen twice.  I'm pretty sure
    this is one too many.

Andrew Cooper (63):
  x86: Introduce support for CET-IBT
  x86/hypercall: Annotate fnptr targets
  xen: Annotate fnptr targets from custom_param()
  xen: Annotate fnptr targets from __initcall()
  xen: Annotate fnptr targets from notifier callbacks
  xen: Annotate fnptr targets from acpi_table_parse()
  xen: Annotate fnptr targets from continue_hypercall_on_cpu()
  xen: Annotate fnptr targets from init_timer()
  xen: Annotate fnptr targets from call_rcu()
  xen: Annotate fnptr targets from IPIs
  xen: Annotate fnptr targets from open_softirq()
  xsm/flask:  Annotate fnptr targets in the security server
  xsm: Annotate fnptr targets
  xen/sched: Annotate fnptr targets
  xen/evtchn: Annotate fnptr targets
  xen/hypfs: Annotate fnptr targets
  xen/tasklet: Annotate fnptr targets
  xen/keyhandler: Annotate fnptr targets
  xen/vpci: Annotate fnptr targets
  xen/decompress: Annotate fnptr targets
  xen/iommu: Annotate fnptr targets
  xen/video: Annotate fnptr targets
  xen/console: Annotate fnptr targets
  xen/misc: Annotate fnptr targets
  x86: Annotate fnptr targets from request_irq()
  x86/hvm: Annotate fnptr targets from hvm_funcs
  x86/hvm: Annotate fnptr targets from device emulation
  x86/emul: Annotate fnptr targets
  x86/ucode: Annotate fnptr targets
  x86/power: Annotate fnptr targets
  x86/apic: Annotate fnptr targets
  x86/nmi: Annotate fnptr targets
  x86/mtrr: Annotate fnptr targets
  x86/idle: Annotate fnptr targets
  x86/quirks: Annotate fnptr targets
  x86/hvmsave: Annotate fnptr targets
  x86/mce: Annotate fnptr targets
  x86/pmu: Annotate fnptr targets
  x86/cpu: Annotate fnptr targets
  x86/guest: Annotate fnptr targets
  x86/logdirty: Annotate fnptr targets
  x86/shadow: Annotate fnptr targets
  x86/hap: Annotate fnptr targets
  x86/p2m: Annotate fnptr targets
  x86/irq: Annotate fnptr targets
  x86/aepi: Annotate fnptr targets
  x86/psr: Annotate fnptr targets
  x86/dpci: Annotate fnptr targets
  x86/pt: Annotate fnptr targets
  x86/time: Annotate fnptr targets
  x86/misc: Annotate fnptr targets
  x86/stack: Annotate fnptr targets
  x86/bugframe: Annotate fnptr targets
  x86: Use control flow typechecking where possible
  x86/setup: Read CR4 earlier in __start_xen()
  x86/alternatives: Clear CR4.CET when clearing CR0.WP
  x86/traps: Rework write_stub_trampoline() to not hardcode the jmp
  x86/emul: Update emulation stubs to be CET-IBT compatible
  x86/entry: Make syscall/sysenter entrypoints CET-IBT compatible
  x86/entry: Make IDT entrypoints CET-IBT compatible
  x86/setup: Rework MSR_S_CET handling for CET-IBT
  x86/efi: Disable CET-IBT around Runtime Services calls
  x86: Enable CET Indirect Branch Tracking

Juergen Gross (2):
  x86/pv-shim: don't modify hypercall table
  xen/x86: don't use hypercall table for calling compat hypercalls

 Config.mk                                    |   1 -
 docs/misc/xen-command-line.pandoc            |  16 +-
 tools/firmware/Makefile                      |   2 +
 tools/libs/guest/xg_dom_decompress_unsafe.h  |   4 +
 xen/arch/x86/Kconfig                         |  17 ++
 xen/arch/x86/acpi/boot.c                     |  24 +-
 xen/arch/x86/acpi/cpu_idle.c                 |  43 ++--
 xen/arch/x86/acpi/cpufreq/cpufreq.c          |  24 +-
 xen/arch/x86/acpi/cpufreq/powernow.c         |  21 +-
 xen/arch/x86/acpi/cpuidle_menu.c             |   6 +-
 xen/arch/x86/acpi/lib.c                      |   2 +-
 xen/arch/x86/acpi/power.c                    |   4 +-
 xen/arch/x86/acpi/wakeup_prot.S              |  37 +--
 xen/arch/x86/alternative.c                   |  13 +-
 xen/arch/x86/apic.c                          |  12 +-
 xen/arch/x86/arch.mk                         |   7 +
 xen/arch/x86/boot/x86_64.S                   |  29 ++-
 xen/arch/x86/compat.c                        |  21 +-
 xen/arch/x86/cpu/amd.c                       |   8 +-
 xen/arch/x86/cpu/centaur.c                   |   2 +-
 xen/arch/x86/cpu/common.c                    |   3 +-
 xen/arch/x86/cpu/cpu.h                       |   2 +-
 xen/arch/x86/cpu/hygon.c                     |   2 +-
 xen/arch/x86/cpu/intel.c                     |   6 +-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c       |   4 +-
 xen/arch/x86/cpu/mcheck/mce.c                |  22 +-
 xen/arch/x86/cpu/mcheck/mce.h                |   2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c            |   9 +-
 xen/arch/x86/cpu/mcheck/mce_amd.h            |   4 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c          |  49 ++--
 xen/arch/x86/cpu/mcheck/non-fatal.c          |   6 +-
 xen/arch/x86/cpu/mcheck/vmce.c               |   4 +-
 xen/arch/x86/cpu/microcode/amd.c             |   9 +-
 xen/arch/x86/cpu/microcode/core.c            |  15 +-
 xen/arch/x86/cpu/microcode/intel.c           |  10 +-
 xen/arch/x86/cpu/mtrr/generic.c              |  20 +-
 xen/arch/x86/cpu/mtrr/main.c                 |   4 +-
 xen/arch/x86/cpu/mtrr/mtrr.h                 |   8 +-
 xen/arch/x86/cpu/mwait-idle.c                |  12 +-
 xen/arch/x86/cpu/shanghai.c                  |   2 +-
 xen/arch/x86/cpu/vpmu.c                      |  13 +-
 xen/arch/x86/cpu/vpmu_amd.c                  |  16 +-
 xen/arch/x86/cpu/vpmu_intel.c                |  16 +-
 xen/arch/x86/cpuid.c                         |   2 +-
 xen/arch/x86/crash.c                         |   7 +-
 xen/arch/x86/dmi_scan.c                      |  10 +-
 xen/arch/x86/dom0_build.c                    |   8 +-
 xen/arch/x86/domain.c                        |  16 +-
 xen/arch/x86/efi/stub.c                      |   2 +
 xen/arch/x86/emul-i8254.c                    |  14 +-
 xen/arch/x86/extable.c                       |  20 +-
 xen/arch/x86/genapic/bigsmp.c                |   4 +-
 xen/arch/x86/genapic/delivery.c              |  12 +-
 xen/arch/x86/genapic/probe.c                 |   2 +-
 xen/arch/x86/genapic/x2apic.c                |  18 +-
 xen/arch/x86/guest/hyperv/hyperv.c           |  10 +-
 xen/arch/x86/guest/xen/xen.c                 |  15 +-
 xen/arch/x86/hpet.c                          |  29 +--
 xen/arch/x86/hvm/dm.c                        |   5 +-
 xen/arch/x86/hvm/dom0_build.c                |  16 +-
 xen/arch/x86/hvm/emulate.c                   |  93 ++++---
 xen/arch/x86/hvm/hpet.c                      |  12 +-
 xen/arch/x86/hvm/hvm.c                       |  47 ++--
 xen/arch/x86/hvm/hypercall.c                 |   5 +-
 xen/arch/x86/hvm/intercept.c                 |  28 ++-
 xen/arch/x86/hvm/io.c                        |  38 +--
 xen/arch/x86/hvm/ioreq.c                     |   2 +-
 xen/arch/x86/hvm/irq.c                       |  16 +-
 xen/arch/x86/hvm/mtrr.c                      |   8 +-
 xen/arch/x86/hvm/nestedhvm.c                 |   6 +-
 xen/arch/x86/hvm/pmtimer.c                   |  10 +-
 xen/arch/x86/hvm/quirks.c                    |   4 +-
 xen/arch/x86/hvm/rtc.c                       |  18 +-
 xen/arch/x86/hvm/stdvga.c                    |  19 +-
 xen/arch/x86/hvm/svm/nestedsvm.c             |  27 +-
 xen/arch/x86/hvm/svm/svm.c                   | 358 ++++++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c                  |   2 +-
 xen/arch/x86/hvm/vioapic.c                   |  12 +-
 xen/arch/x86/hvm/viridian/time.c             |   2 +-
 xen/arch/x86/hvm/viridian/viridian.c         |  17 +-
 xen/arch/x86/hvm/vlapic.c                    |  25 +-
 xen/arch/x86/hvm/vmsi.c                      |  16 +-
 xen/arch/x86/hvm/vmx/intr.c                  |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                  |  22 +-
 xen/arch/x86/hvm/vmx/vmx.c                   | 157 ++++++------
 xen/arch/x86/hvm/vmx/vvmx.c                  |  21 +-
 xen/arch/x86/hvm/vpic.c                      |   8 +-
 xen/arch/x86/hvm/vpt.c                       |   2 +-
 xen/arch/x86/i8259.c                         |  10 +-
 xen/arch/x86/io_apic.c                       |  28 +--
 xen/arch/x86/ioport_emulate.c                |   4 +-
 xen/arch/x86/irq.c                           |  28 +--
 xen/arch/x86/livepatch.c                     |   2 +-
 xen/arch/x86/mm.c                            |  35 +--
 xen/arch/x86/mm/hap/guest_walk.c             |   4 +-
 xen/arch/x86/mm/hap/hap.c                    |  29 +--
 xen/arch/x86/mm/hap/nested_hap.c             |   2 +-
 xen/arch/x86/mm/hap/private.h                |  30 +--
 xen/arch/x86/mm/mem_sharing.c                |   2 +-
 xen/arch/x86/mm/p2m-ept.c                    |  34 ++-
 xen/arch/x86/mm/p2m-pt.c                     |  19 +-
 xen/arch/x86/mm/paging.c                     |   3 +-
 xen/arch/x86/mm/shadow/common.c              |  33 +--
 xen/arch/x86/mm/shadow/hvm.c                 |  16 +-
 xen/arch/x86/mm/shadow/multi.c               |  80 +++---
 xen/arch/x86/mm/shadow/multi.h               |  20 +-
 xen/arch/x86/mm/shadow/private.h             |  12 +-
 xen/arch/x86/mm/shadow/pv.c                  |   4 +-
 xen/arch/x86/msi.c                           |  18 +-
 xen/arch/x86/nmi.c                           |  16 +-
 xen/arch/x86/numa.c                          |  10 +-
 xen/arch/x86/oprofile/nmi_int.c              |  16 +-
 xen/arch/x86/oprofile/op_model_athlon.c      |  18 +-
 xen/arch/x86/oprofile/op_model_p4.c          |  14 +-
 xen/arch/x86/oprofile/op_model_ppro.c        |  26 +-
 xen/arch/x86/percpu.c                        |   6 +-
 xen/arch/x86/physdev.c                       |   2 +-
 xen/arch/x86/platform_hypercall.c            |  11 +-
 xen/arch/x86/psr.c                           |  41 +--
 xen/arch/x86/pv/callback.c                   |  25 +-
 xen/arch/x86/pv/descriptor-tables.c          |  14 +-
 xen/arch/x86/pv/domain.c                     |  12 +-
 xen/arch/x86/pv/emul-gate-op.c               |   5 +-
 xen/arch/x86/pv/emul-priv-op.c               |  70 +++---
 xen/arch/x86/pv/emulate.h                    |   7 -
 xen/arch/x86/pv/hypercall.c                  |  11 +-
 xen/arch/x86/pv/iret.c                       |   4 +-
 xen/arch/x86/pv/misc-hypercalls.c            |  10 +-
 xen/arch/x86/pv/ro-page-fault.c              |  25 +-
 xen/arch/x86/pv/shim.c                       |  60 ++---
 xen/arch/x86/pv/traps.c                      |   2 +-
 xen/arch/x86/setup.c                         |  80 ++++--
 xen/arch/x86/shutdown.c                      |  10 +-
 xen/arch/x86/smp.c                           |  20 +-
 xen/arch/x86/smpboot.c                       |   2 +-
 xen/arch/x86/spec_ctrl.c                     |   6 +-
 xen/arch/x86/srat.c                          |   4 +-
 xen/arch/x86/sysctl.c                        |   4 +-
 xen/arch/x86/tboot.c                         |   2 +-
 xen/arch/x86/time.c                          |  68 ++---
 xen/arch/x86/traps.c                         |   8 +-
 xen/arch/x86/tsx.c                           |   2 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c             |   2 +-
 xen/arch/x86/x86_64/compat.c                 |   1 -
 xen/arch/x86/x86_64/compat/entry.S           |   1 +
 xen/arch/x86/x86_64/compat/mm.c              |   7 +-
 xen/arch/x86/x86_64/entry.S                  |  47 +++-
 xen/arch/x86/x86_64/mmconfig-shared.c        |  10 +-
 xen/arch/x86/x86_64/mmconfig.h               |   2 +-
 xen/arch/x86/x86_64/platform_hypercall.c     |   2 +-
 xen/arch/x86/x86_64/traps.c                  |  45 ++--
 xen/arch/x86/x86_emulate.c                   |  33 ++-
 xen/arch/x86/x86_emulate/x86_emulate.c       |  10 +-
 xen/arch/x86/x86_emulate/x86_emulate.h       |  38 +--
 xen/common/argo.c                            |   6 +-
 xen/common/bunzip2.c                         |   2 +-
 xen/common/compat/domain.c                   |   3 +-
 xen/common/compat/grant_table.c              |   5 +-
 xen/common/compat/kernel.c                   |   2 +-
 xen/common/compat/memory.c                   |   7 +-
 xen/common/compat/multicall.c                |   3 +-
 xen/common/core_parking.c                    |  10 +-
 xen/common/cpu.c                             |   4 +-
 xen/common/debugtrace.c                      |  10 +-
 xen/common/decompress.c                      |   2 +-
 xen/common/dm.c                              |   6 +-
 xen/common/domain.c                          |  15 +-
 xen/common/domctl.c                          |   2 +-
 xen/common/efi/boot.c                        |  12 +-
 xen/common/efi/runtime.c                     |  17 ++
 xen/common/event_2l.c                        |  21 +-
 xen/common/event_channel.c                   |  18 +-
 xen/common/event_fifo.c                      |  30 +--
 xen/common/gdbstub.c                         |   9 +-
 xen/common/grant_table.c                     |  29 ++-
 xen/common/hypfs.c                           |  63 +++--
 xen/common/irq.c                             |   6 +-
 xen/common/kernel.c                          |   6 +-
 xen/common/kexec.c                           |  18 +-
 xen/common/keyhandler.c                      |  47 ++--
 xen/common/livepatch.c                       |  15 +-
 xen/common/memory.c                          |   8 +-
 xen/common/multicall.c                       |   2 +-
 xen/common/page_alloc.c                      |  14 +-
 xen/common/perfc.c                           |   4 +-
 xen/common/radix-tree.c                      |   8 +-
 xen/common/random.c                          |   2 +-
 xen/common/rangeset.c                        |   2 +-
 xen/common/rcupdate.c                        |   8 +-
 xen/common/sched/arinc653.c                  |  20 +-
 xen/common/sched/compat.c                    |   2 +-
 xen/common/sched/core.c                      |  40 +--
 xen/common/sched/cpupool.c                   |  35 +--
 xen/common/sched/credit.c                    |  59 +++--
 xen/common/sched/credit2.c                   |  55 ++--
 xen/common/sched/null.c                      |  60 ++---
 xen/common/sched/rt.c                        |  47 ++--
 xen/common/spinlock.c                        |  12 +-
 xen/common/stop_machine.c                    |   6 +-
 xen/common/sysctl.c                          |   2 +-
 xen/common/tasklet.c                         |   4 +-
 xen/common/timer.c                           |   6 +-
 xen/common/trace.c                           |   4 +-
 xen/common/unlzma.c                          |   2 +-
 xen/common/vm_event.c                        |   6 +-
 xen/common/xenoprof.c                        |   2 +-
 xen/common/xmalloc_tlsf.c                    |   4 +-
 xen/common/zstd/zstd_common.c                |   4 +-
 xen/common/zstd/zstd_internal.h              |   4 +-
 xen/drivers/acpi/apei/apei-base.c            |  32 +--
 xen/drivers/acpi/apei/apei-internal.h        |  20 +-
 xen/drivers/acpi/apei/erst.c                 |  57 +++--
 xen/drivers/acpi/apei/hest.c                 |   4 +-
 xen/drivers/acpi/numa.c                      |  10 +-
 xen/drivers/acpi/tables.c                    |   2 +-
 xen/drivers/char/console.c                   |  36 +--
 xen/drivers/char/ehci-dbgp.c                 |  28 ++-
 xen/drivers/char/ns16550.c                   |  34 +--
 xen/drivers/cpufreq/cpufreq.c                |   6 +-
 xen/drivers/cpufreq/cpufreq_misc_governors.c |  22 +-
 xen/drivers/cpufreq/cpufreq_ondemand.c       |  10 +-
 xen/drivers/passthrough/amd/iommu.h          |  45 ++--
 xen/drivers/passthrough/amd/iommu_acpi.c     |  15 +-
 xen/drivers/passthrough/amd/iommu_guest.c    |  12 +-
 xen/drivers/passthrough/amd/iommu_init.c     |  49 ++--
 xen/drivers/passthrough/amd/iommu_intr.c     |  20 +-
 xen/drivers/passthrough/amd/iommu_map.c      |  22 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c  |  32 +--
 xen/drivers/passthrough/arm/smmu-v3.c        |   6 +-
 xen/drivers/passthrough/iommu.c              |  56 ++---
 xen/drivers/passthrough/pci.c                |  18 +-
 xen/drivers/passthrough/vtd/dmar.c           |   7 +-
 xen/drivers/passthrough/vtd/extern.h         |  38 +--
 xen/drivers/passthrough/vtd/intremap.c       |  14 +-
 xen/drivers/passthrough/vtd/iommu.c          |  96 +++----
 xen/drivers/passthrough/vtd/qinval.c         |  28 +--
 xen/drivers/passthrough/vtd/quirks.c         |   2 +-
 xen/drivers/passthrough/vtd/utils.c          |   2 +-
 xen/drivers/passthrough/vtd/x86/hvm.c        |   4 +-
 xen/drivers/passthrough/x86/hvm.c            |  14 +-
 xen/drivers/video/lfb.c                      |   4 +-
 xen/drivers/video/lfb.h                      |   4 +-
 xen/drivers/video/vesa.c                     |   6 +-
 xen/drivers/video/vga.c                      |   6 +-
 xen/drivers/vpci/header.c                    |  18 +-
 xen/drivers/vpci/msi.c                       |  42 ++--
 xen/drivers/vpci/msix.c                      |  20 +-
 xen/drivers/vpci/vpci.c                      |  16 +-
 xen/include/acpi/cpufreq/cpufreq.h           |   1 -
 xen/include/asm-x86/asm-defns.h              |   6 +
 xen/include/asm-x86/bug.h                    |  10 +-
 xen/include/asm-x86/cpufeature.h             |   1 +
 xen/include/asm-x86/cpufeatures.h            |   1 +
 xen/include/asm-x86/cpuidle.h                |   4 +-
 xen/include/asm-x86/current.h                |   2 +-
 xen/include/asm-x86/flushtlb.h               |   2 +-
 xen/include/asm-x86/genapic.h                |  18 +-
 xen/include/asm-x86/hpet.h                   |   8 +-
 xen/include/asm-x86/hvm/emulate.h            |   8 +-
 xen/include/asm-x86/hvm/save.h               |   2 +-
 xen/include/asm-x86/hvm/svm/nestedsvm.h      |  22 +-
 xen/include/asm-x86/hvm/svm/svm.h            |   1 -
 xen/include/asm-x86/hvm/vioapic.h            |   2 +-
 xen/include/asm-x86/hvm/vmx/vmcs.h           |   8 +-
 xen/include/asm-x86/hvm/vmx/vmx.h            |   4 +-
 xen/include/asm-x86/hvm/vmx/vvmx.h           |  23 +-
 xen/include/asm-x86/hypercall.h              |  81 +++---
 xen/include/asm-x86/irq.h                    |  24 +-
 xen/include/asm-x86/mm.h                     |  16 +-
 xen/include/asm-x86/msi.h                    |   8 +-
 xen/include/asm-x86/msr-index.h              |   1 +
 xen/include/asm-x86/mtrr.h                   |   2 +-
 xen/include/asm-x86/p2m.h                    |   4 +-
 xen/include/asm-x86/paging.h                 |   2 +-
 xen/include/asm-x86/processor.h              |   4 +-
 xen/include/asm-x86/pv/domain.h              |   4 +-
 xen/include/asm-x86/pv/shim.h                |   7 +-
 xen/include/asm-x86/shadow.h                 |   2 +-
 xen/include/asm-x86/smp.h                    |   6 +-
 xen/include/asm-x86/tboot.h                  |   2 +-
 xen/include/asm-x86/time.h                   |   6 +-
 xen/include/xen/acpi.h                       |   2 +-
 xen/include/xen/compiler.h                   |   6 +
 xen/include/xen/efi.h                        |   1 +
 xen/include/xen/hypercall.h                  |  69 +++---
 xen/include/xen/hypfs.h                      |  49 ++--
 xen/include/xen/irq.h                        |   6 +-
 xen/include/xen/lib.h                        |   2 +-
 xen/include/xen/perfc.h                      |   4 +-
 xen/include/xen/sched.h                      |   2 +-
 xen/include/xen/spinlock.h                   |   4 +-
 xen/include/xen/vpci.h                       |   8 +-
 xen/include/xsm/dummy.h                      | 211 ++++++++--------
 xen/xsm/flask/avc.c                          |   2 +-
 xen/xsm/flask/flask_op.c                     |   7 +-
 xen/xsm/flask/hooks.c                        | 232 +++++++++--------
 xen/xsm/flask/private.h                      |   4 +-
 xen/xsm/flask/ss/avtab.c                     |   4 +-
 xen/xsm/flask/ss/conditional.c               |  10 +-
 xen/xsm/flask/ss/conditional.h               |   6 +-
 xen/xsm/flask/ss/policydb.c                  |  53 ++--
 xen/xsm/flask/ss/services.c                  |   6 +-
 xen/xsm/flask/ss/symtab.c                    |   5 +-
 xen/xsm/silo.c                               |  24 +-
 xen/xsm/xsm_core.c                           |   6 +-
 305 files changed, 2963 insertions(+), 2619 deletions(-)

-- 
2.11.0


