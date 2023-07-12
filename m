Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EF375048A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562200.878788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXAM-00064E-2J; Wed, 12 Jul 2023 10:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562200.878788; Wed, 12 Jul 2023 10:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXAL-00062V-Vp; Wed, 12 Jul 2023 10:33:49 +0000
Received: by outflank-mailman (input) for mailman id 562200;
 Wed, 12 Jul 2023 10:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAK-00061z-6N
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:33:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 949e7cab-209f-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:33:46 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 9085C4EE0737;
 Wed, 12 Jul 2023 12:33:43 +0200 (CEST)
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
X-Inumbo-ID: 949e7cab-209f-11ee-8611-37d641c3527e
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
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v3 00/15] xen: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:01 +0200
Message-Id: <cover.1689152719.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline
states:
"A 'u' or 'U' suffix shall be applied to all integer constants that are
represented in an unsigned type".

These violations are caused by the missing "u" or "U" suffix in unsigned
integer constants, such as:

xen/arch/x86/hvm/hypercall.c:132.17-132.26
if ( (eax & 0x80000000) && is_viridian_domain(currd) )

If a rule is not met, fixes are needed in order to achieve compliance.
The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by
adding the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Changes to macros 'X86_CR0_PG' and 'MSR_EFER' in files
"xen/arch/x86/include/asm/x86-defns.h" and "xen/arch/x86/include/asm/msr-index.h"
are not made since they are used also in assembly files.

---
Changes in v3:
- fixes following review comments
- change some commit messages
- change 'Signed-off-by' ordering
- create two new commits

Changes in v2:
- fixes following review comments
- change title and commit messages
- remove changes in out of scope files
- remove changes in some macros

Gianluca Luparini (15):
  x86/cpufreq: fix violations of MISRA C:2012 Rule 7.2
  AMD/IOMMU: fix violations of MISRA C:2012 Rule 7.2
  x86/svm: fix violations of MISRA C:2012 Rule 7.2
  xen/arm: fix violations of MISRA C:2012 Rule 7.2
  xen/device-tree: fix violations of MISRA C:2012 Rule 7.2
  xen/efi: fix violations of MISRA C:2012 Rule 7.2
  x86/vmx: fix violations of MISRA C:2012 Rule 7.2
  xen/pci: fix violations of MISRA C:2012 Rule 7.2
  xen/public: fix violations of MISRA C:2012 Rule 7.2
  x86/monitor: fix violations of MISRA C:2012 Rule 7.2
  xen/vpci: fix violations of MISRA C:2012 Rule 7.2
  xen/x86: fix violations of MISRA C:2012 Rule 7.2
  x86/viridian: fix violations of MISRA C:2012 Rule 7.2
  ACPI/APEI: fix violations of MISRA C:2012 Rule 7.2
  xen: fix violations of MISRA C:2012 Rule 7.2

 xen/arch/arm/domain_build.c                  |   4 +-
 xen/arch/arm/efi/efi-boot.h                  |   2 +-
 xen/arch/arm/gic-v2.c                        |   6 +-
 xen/arch/arm/gic-v3.c                        |  10 +-
 xen/arch/arm/include/asm/arm64/brk.h         |   2 +-
 xen/arch/arm/include/asm/arm64/efibind.h     |  10 +-
 xen/arch/arm/include/asm/arm64/insn.h        |  16 +-
 xen/arch/arm/include/asm/vreg.h              |   2 +-
 xen/arch/arm/kernel.c                        |   2 +-
 xen/arch/arm/traps.c                         |  14 +-
 xen/arch/arm/vgic-v2.c                       |   2 +-
 xen/arch/arm/vgic-v3.c                       |   2 +-
 xen/arch/x86/acpi/cpufreq/powernow.c         |  14 +-
 xen/arch/x86/apic.c                          |   2 +-
 xen/arch/x86/cpu-policy.c                    |  18 +-
 xen/arch/x86/cpu/mcheck/mce-apei.c           |   4 +-
 xen/arch/x86/cpu/vpmu_intel.c                |   2 +-
 xen/arch/x86/cpuid.c                         |   8 +-
 xen/arch/x86/efi/efi-boot.h                  |   6 +-
 xen/arch/x86/extable.c                       |   2 +-
 xen/arch/x86/hvm/hypercall.c                 |   2 +-
 xen/arch/x86/hvm/irq.c                       |   2 +-
 xen/arch/x86/hvm/pmtimer.c                   |   4 +-
 xen/arch/x86/hvm/stdvga.c                    |  50 ++---
 xen/arch/x86/hvm/svm/asid.c                  |   2 +-
 xen/arch/x86/hvm/svm/svm.c                   |   8 +-
 xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
 xen/arch/x86/hvm/vlapic.c                    |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
 xen/arch/x86/hvm/vmx/vvmx.c                  |   8 +-
 xen/arch/x86/include/asm/apicdef.h           |   2 +-
 xen/arch/x86/include/asm/config.h            |   2 +-
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
 xen/arch/x86/include/asm/hpet.h              |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |  84 ++++----
 xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  16 +-
 xen/arch/x86/include/asm/msi.h               |   2 +-
 xen/arch/x86/include/asm/msr-index.h         | 202 +++++++++----------
 xen/arch/x86/include/asm/pci.h               |   8 +-
 xen/arch/x86/include/asm/x86-defns.h         |   2 +-
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
 xen/drivers/video/vesa.c                     |   2 +-
 xen/drivers/vpci/msi.c                       |   2 +-
 xen/drivers/vpci/msix.c                      |   2 +-
 xen/drivers/vpci/vpci.c                      |   6 +-
 xen/include/acpi/cpufreq/processor_perf.h    |   2 +-
 xen/include/public/arch-arm/smccc.h          |   4 +-
 xen/include/public/io/ring.h                 |  10 +-
 xen/include/public/memory.h                  |   2 +-
 xen/include/public/sysctl.h                  |   4 +-
 xen/include/xen/bitops.h                     |  10 +-
 xen/include/xen/cper.h                       |  18 +-
 xen/lib/muldiv64.c                           |   2 +-
 xen/lib/x86/cpuid.c                          |   8 +-
 xen/lib/x86/policy.c                         |   2 +-
 71 files changed, 409 insertions(+), 409 deletions(-)

-- 
2.41.0


