Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D466E736A31
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551535.861143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ71-00087w-KO; Tue, 20 Jun 2023 11:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551535.861143; Tue, 20 Jun 2023 11:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ71-00085z-Gp; Tue, 20 Jun 2023 11:01:27 +0000
Received: by outflank-mailman (input) for mailman id 551535;
 Tue, 20 Jun 2023 10:35:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYhh-0004Ou-BS
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a4a4f1-0f56-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:35:15 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 6730C4EE0737;
 Tue, 20 Jun 2023 12:35:12 +0200 (CEST)
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
X-Inumbo-ID: 24a4a4f1-0f56-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 00/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:34:52 +0200
Message-Id: <cover.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline 
states:
"A "u" or "U" suffix shall be applied to all integer constants that are 
represented in an unsigned type".

These violations are caused by the missing "u" or "U" suffix in unsigned 
integer constants, such as:

xen/arch/x86/hvm/hypercall.c:132.17-132.26
if ( (eax & 0x80000000) && is_viridian_domain(currd) )

The patches in this series achieve compliance for MISRA C:2012 Rule 7.2
by adding the "U" suffix to explicitly state when an integer constant is
represented in an unsigned type.

Some changes are proposed for homogeneity in order to keep the code as
unambiguous as possible.


Gianluca Luparini (13):
  xen/x86: fixed violations of MISRA C:2012 Rule 7.2
  AMD/IOMMU: fixed violations of MISRA C:2012 Rule 7.2
  xen/x86: fixed violations of MISRA C:2012 Rule 7.2
  xen/arm: fixed violations of MISRA C:2012 Rule 7.2
  xen/common: fixed violations of MISRA C:2012 Rule 7.2
  xen/efi: fixed violations of MISRA C:2012 Rule 7.2
  xen/x86: fixed violations of MISRA C:2012 Rule 7.2
  xen/pci: fixed violations of MISRA C:2012 Rule 7.2
  xen/public: fixed violations of MISRA C:2012 Rule 7.2
  xen/x86: fixed violations of MISRA C:2012 Rule 7.2
  xen/vpci: fixed violations of MISRA C:2012 Rule 7.2
  xen/x86: fixed violations of MISRA C:2012 Rule 7.2
  xen: fixed violations of MISRA C:2012 Rule 7.2

 xen/arch/arm/domain_build.c                  |   2 +-
 xen/arch/arm/efi/efi-boot.h                  |   2 +-
 xen/arch/arm/gic-v2.c                        |   6 +-
 xen/arch/arm/include/asm/arm64/brk.h         |   2 +-
 xen/arch/arm/include/asm/arm64/efibind.h     |  10 +-
 xen/arch/arm/include/asm/arm64/insn.h        |  16 +-
 xen/arch/arm/include/asm/vreg.h              |   2 +-
 xen/arch/arm/kernel.c                        |   2 +-
 xen/arch/arm/traps.c                         |   4 +-
 xen/arch/arm/vgic-v2.c                       |   2 +-
 xen/arch/x86/acpi/cpufreq/powernow.c         |  14 +-
 xen/arch/x86/apic.c                          |   2 +-
 xen/arch/x86/cpu-policy.c                    |   8 +-
 xen/arch/x86/cpu/mcheck/mce-apei.c           |   8 +-
 xen/arch/x86/cpu/vpmu_intel.c                |   4 +-
 xen/arch/x86/cpuid.c                         |   8 +-
 xen/arch/x86/efi/efi-boot.h                  |   6 +-
 xen/arch/x86/hvm/hypercall.c                 |   2 +-
 xen/arch/x86/hvm/irq.c                       |   2 +-
 xen/arch/x86/hvm/pmtimer.c                   |   4 +-
 xen/arch/x86/hvm/stdvga.c                    |  66 +++---
 xen/arch/x86/hvm/svm/asid.c                  |   2 +-
 xen/arch/x86/hvm/svm/svm.c                   |   8 +-
 xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
 xen/arch/x86/hvm/vlapic.c                    |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
 xen/arch/x86/hvm/vmx/vvmx.c                  |  12 +-
 xen/arch/x86/include/asm/apicdef.h           |   2 +-
 xen/arch/x86/include/asm/config.h            |   2 +-
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
 xen/arch/x86/include/asm/hpet.h              |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |   6 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  32 +--
 xen/arch/x86/include/asm/msi.h               |   2 +-
 xen/arch/x86/include/asm/msr-index.h         | 204 +++++++++----------
 xen/arch/x86/include/asm/pci.h               |   8 +-
 xen/arch/x86/include/asm/x86-defns.h         |  24 +--
 xen/arch/x86/include/asm/x86_64/efibind.h    |  10 +-
 xen/arch/x86/monitor.c                       |   6 +-
 xen/arch/x86/percpu.c                        |   2 +-
 xen/arch/x86/psr.c                           |   2 +-
 xen/arch/x86/spec_ctrl.c                     |   8 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c             |   2 +-
 xen/arch/x86/x86_64/pci.c                    |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
 xen/common/device_tree.c                     |   4 +-
 xen/common/efi/boot.c                        |   8 +-
 xen/common/efi/runtime.c                     |   2 +-
 xen/common/gunzip.c                          |   2 +-
 xen/common/xmalloc_tlsf.c                    |   2 +-
 xen/drivers/char/ehci-dbgp.c                 |   4 +-
 xen/drivers/passthrough/amd/iommu-defs.h     | 122 +++++------
 xen/drivers/passthrough/pci.c                |   4 +-
 xen/drivers/vpci/msi.c                       |   2 +-
 xen/drivers/vpci/msix.c                      |   2 +-
 xen/drivers/vpci/vpci.c                      |   6 +-
 xen/include/acpi/cpufreq/processor_perf.h    |   2 +-
 xen/include/efi/efiapi.h                     |  10 +-
 xen/include/efi/efidef.h                     |   2 +-
 xen/include/efi/efiprot.h                    |  22 +-
 xen/include/public/arch-arm/smccc.h          |   8 +-
 xen/include/public/arch-x86/xen-x86_64.h     |   8 +-
 xen/include/public/io/ring.h                 |  10 +-
 xen/include/public/memory.h                  |   2 +-
 xen/include/public/sysctl.h                  |   4 +-
 xen/include/xen/bitops.h                     |  10 +-
 xen/include/xen/cper.h                       |  34 ++--
 xen/include/xen/libfdt/fdt.h                 |   2 +-
 xen/include/xen/libfdt/libfdt.h              |   2 +-
 xen/lib/muldiv64.c                           |   2 +-
 xen/lib/x86/cpuid.c                          |   8 +-
 xen/lib/x86/policy.c                         |   2 +-
 74 files changed, 422 insertions(+), 422 deletions(-)

-- 
2.41.0


