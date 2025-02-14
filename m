Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C42A36713
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 21:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889053.1298311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZU-0000JN-6r; Fri, 14 Feb 2025 20:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889053.1298311; Fri, 14 Feb 2025 20:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZU-0000HI-2e; Fri, 14 Feb 2025 20:46:00 +0000
Received: by outflank-mailman (input) for mailman id 889053;
 Fri, 14 Feb 2025 20:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKzd=VF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tj2ZT-0008RW-55
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 20:45:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b10af914-eb14-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 21:45:57 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id AA7994EF5134;
 Fri, 14 Feb 2025 21:45:55 +0100 (CET)
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
X-Inumbo-ID: b10af914-eb14-11ef-9896-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739565957;
	b=Lla4XqTHOtWjPGen//yc8P17LwkRnoy7+pwpcaMQB7erb1t5SxAjjBQiMhiGqGkU7Mfx
	 niub6Hj3PjPU6i2OFEo9BpzQzTZcRHbt2IZRGCDgedGYcNjP8YWxWIW31e17VR1x6Yd4t
	 zEPdG3dBgc1yPzqt57VwMa1TFnqdJmWyCR8cSACKG/h5MIAArza1KsUtPjdXhEieyxTX2
	 C8mMG1Gnzj7nCVRpVBKhCSfmGx1j4dOGOo4AAq0P49CF4kiiFvfQ954yTCKT/CATlLp0R
	 qhB1S4WWcGbcqsKpi7fEmXYGVN7xcuhaDbapvjknht6kEv/2q+OR/Hx118By1oTl05cFe
	 Nf8KJ6k4zIxc/a3ZjhuE3hdS3Wz89vpeI1oMvWqU8jqc9mMD5Gu6jRlAypowI9LNYj+2e
	 Q4jTV8SFvT15vNlW0wph7yMaDDy+ZzjCq/VEN5TCXBKbxw6q/ux5t02fazedWIWObyFcw
	 VplhM0HEhH4a0mO+0JgHl/zy7yXpwAuTCTv3vO/oWUSQf7JK1uWHkupnP+Ueu7oI6siRW
	 RqRkDn7zKnA1vhc9NAN5PDRodR77Soam4pvqgX8R8sncEDCDPsrVBEvIOvqpJtLBkHoXK
	 gxMCyj0Ma3nNP+8ay2oBO1xnbIJXIPAY0xyAWcJmz9Lb8KdZTMQFl3b6ONWakNE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739565957;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Zb+EMl98O0ZzCZxtewSKJBtly4RcCPP87vJH7H6TQLM=;
	b=R1TgljP1wYSt3A37rBXRMMGsrUJs3uRY73KjrUs9ILRCrJ/MbTjOAJp2mIqkPvdnyBP4
	 hg/YE7G2DAlNDCd6CmYdV/TKSY7PhyU7AM4hR28ZkrhLe2xF5uYZvxTlemRdhCkgCkDYp
	 E4GpTT/wUU8Ukm/x3wK1tNaeuLKmPtvmg4ER5+d9v+RVi9IHbtuOgIbSwIEOR+hSsdGVY
	 Z4kakiTw+Nc4DQJ90yeK2EeGoRw6C1VdQTC7E6oiWGxypXatqynwLHzvmSutzlR4cHq6j
	 cmf7TRMfQ3bhZETtodEYoAJ4/uy7PoV1z+NSBh3d/6p5D6XtHtqi1cv18HRJqjQ/kBzqU
	 CQcOOUGDEUTj8TUYJxF8/BIB6514x9T2T+wNnUZ+28MMw09OIXBOWorElkeYPXWMSNGYQ
	 lqmzd0S83RfSkDqthhRMwmkv1+UljdlVGvuI0V4L+JvvZztonzJBryp53shBY2sQUUHeu
	 YDSQKwvktGs06yOUDmkTqR8FvpqjCLhpCds39y6crwrS7lpRTnYliaVDXS+pNqDLRZLM4
	 fQkRfXrCu9sO1ZpW67pppfGDttN6aSmpKnA+/I5uMSsF2DAZDkt0E+tZXOa4OTVf0GM51
	 Vb8vVqAt7w5QSTzp9cMIoukbd3NcU0LqQMv09V0peOlQxPIMeHjxfHE0oZ3efUw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739565957; bh=7a+q1HRRNPQx/8e6r9wT8jYCD+iO1bKhPB6DZuglAQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGG2RFB1OuiGBFmkRC3Gkd2axeyIMSVBYxCyxxcNvnEK8gZvgSoKQ5EfnOthHPBPJ
	 uIqtCn8aoeXZ+QHIqc4G0QpSpTWMec4ET0qlnlD1WuYC+VbyPrICXSQNPFAFkHmbwo
	 KmMTz1kUXZWu8bV3cXctD3bA8c5PjA7TR70RZaR/muD/sCan1BRJZT8BpcDZuCktkH
	 SzpFpRhsIFJ/XN7czRHIkbTMopQN9akNml8nvoqlLMU5KqbIY9ALxP5AThfajVeEAl
	 JGEsWZhn3WIjJ9xRIdMnoaxdTAvK70wJennadLn4Ejt+LR+QQECdm/h+9OgDY1UTLG
	 O2bKUVWT80ZdA==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 3/3] automation: Update ECLAIR analysis configuration
Date: Fri, 14 Feb 2025 21:45:23 +0100
Message-ID: <31d13d891b26cdc03c85ed8fc01dea8bee505f1c.1739564781.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739564781.git.nicola.vetrini@bugseng.com>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen configurations for the ARM64 and X86_64 ECLAIR analyses
is currently held in fixed files under
'automation/eclair_analysis/xen_{arm,x86}_config'. The values
of the configuration options there are susceptible to going stale
due to configuration option changes.

To enhance maintainability, the configuration under analysis is
derived from the respective architecture's defconfig, with suitable
changes added via EXTRA_XEN_CONFIG.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This patch should be applied on top of the other two in the series to
ensure that the CI has no failures related to clean guidelines.

Note that any out of date values taken by configuration options
currently in xen_*_config were determined to be benign with respect to
the analysis results, but this wasn't the right approach in the long
term.
---
 automation/eclair_analysis/prepare.sh     |   8 +-
 automation/eclair_analysis/xen_arm_config | 141 ---------------------
 automation/eclair_analysis/xen_x86_config | 143 ----------------------
 automation/gitlab-ci/analyze.yaml         |  68 ++++++++++
 4 files changed, 73 insertions(+), 287 deletions(-)
 delete mode 100644 automation/eclair_analysis/xen_arm_config
 delete mode 100644 automation/eclair_analysis/xen_x86_config

diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 3a646414a392..4285ff26de54 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -25,18 +25,20 @@ fi
 export XEN_TARGET_ARCH
 
 if [ "$1" = "X86_64" ]; then
-  CONFIG_FILE="${script_dir}/xen_x86_config"
   XEN_TARGET_ARCH=x86_64
 elif [ "$1" = "ARM64" ]; then
-  CONFIG_FILE="${script_dir}/xen_arm_config"
   XEN_TARGET_ARCH=arm64
 else
   fatal "Unknown configuration: $1"
 fi
 
 (
+    make -C xen defconfig
+    if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
+        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
+    fi
+
     ./configure
-    cp "${CONFIG_FILE}" xen/.config
     make clean
     find . -type f -name "*.safparse" -print -delete
     "${script_dir}/build.sh" "$1"
diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_analysis/xen_arm_config
deleted file mode 100644
index ef140ceb7383..000000000000
--- a/automation/eclair_analysis/xen_arm_config
+++ /dev/null
@@ -1,141 +0,0 @@
-CONFIG_CC_IS_GCC=y
-CONFIG_GCC_VERSION=90400
-CONFIG_CLANG_VERSION=0
-CONFIG_LD_IS_GNU=y
-CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=y
-CONFIG_ARM_64=y
-CONFIG_ARM=y
-CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
-
-# UBSAN
-CONFIG_UBSAN=n
-
-#
-# Architecture Features
-#
-CONFIG_ARM64_SVE=n
-CONFIG_64BIT=y
-CONFIG_NR_CPUS=4
-# CONFIG_ACPI is not set
-CONFIG_ARM_EFI=y
-CONFIG_GICV3=y
-CONFIG_HAS_ITS=y
-CONFIG_HVM=y
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=y
-CONFIG_ARM_SSBD=y
-CONFIG_HARDEN_BRANCH_PREDICTOR=y
-CONFIG_TEE=n
-CONFIG_OPTEE=n
-CONFIG_FFA=n
-# CONFIG_STATIC_SHM is not set
-# end of Architecture Features
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=y
-CONFIG_ARM64_ERRATUM_824069=y
-CONFIG_ARM64_ERRATUM_819472=y
-CONFIG_ARM64_ERRATUM_843419=y
-CONFIG_ARM64_ERRATUM_832075=y
-CONFIG_ARM64_ERRATUM_834220=y
-CONFIG_ARM64_ERRATUM_1508412=y
-CONFIG_ARM_ERRATUM_858921=y
-CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=y
-CONFIG_ARM64_ERRATUM_1286807=y
-# end of ARM errata workaround via the alternative framework
-
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
-# CONFIG_ALL_PLAT is not set
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-CONFIG_MPSOC=y
-# CONFIG_NO_PLAT is not set
-CONFIG_MPSOC_PLATFORM=y
-
-#
-# Common Features
-#
-CONFIG_GRANT_TABLE=y
-CONFIG_HAS_ALTERNATIVE=y
-CONFIG_HAS_DEVICE_TREE=y
-CONFIG_HAS_FAST_MULTIPLY=y
-CONFIG_HAS_PDX=y
-CONFIG_HAS_PMAP=y
-# CONFIG_MEM_ACCESS is not set
-CONFIG_STATIC_MEMORY=y
-
-#
-# Speculative hardening
-#
-CONFIG_SPECULATIVE_HARDEN_ARRAY=y
-# end of Speculative hardening
-
-# CONFIG_HYPFS is not set
-CONFIG_IOREQ_SERVER=y
-# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
-# CONFIG_XSM is not set
-# CONFIG_ARGO is not set
-
-#
-# Schedulers
-#
-# CONFIG_SCHED_CREDIT is not set
-CONFIG_SCHED_CREDIT2=y
-# CONFIG_SCHED_RTDS is not set
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=y
-CONFIG_SCHED_CREDIT2_DEFAULT=y
-# CONFIG_SCHED_NULL_DEFAULT is not set
-CONFIG_SCHED_DEFAULT="credit2"
-# end of Schedulers
-
-CONFIG_BOOT_TIME_CPUPOOLS=y
-# CONFIG_LIVEPATCH is not set
-# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
-CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
-CONFIG_CMDLINE=""
-CONFIG_DOM0_MEM=""
-CONFIG_DTB_FILE=""
-# CONFIG_TRACEBUFFER is not set
-# end of Common Features
-
-#
-# Device Drivers
-#
-# CONFIG_HAS_NS16550 is not set
-CONFIG_HAS_CADENCE_UART=y
-# CONFIG_HAS_IMX_LPUART is not set
-# CONFIG_HAS_MVEBU is not set
-# CONFIG_HAS_MESON is not set
-CONFIG_HAS_PL011=y
-# CONFIG_HAS_SCIF is not set
-CONFIG_SERIAL_TX_BUFSIZE=16384
-CONFIG_HAS_PASSTHROUGH=y
-CONFIG_ARM_SMMU=y
-CONFIG_ARM_SMMU_V3=y
-# CONFIG_IPMMU_VMSA is not set
-CONFIG_IOMMU_FORCE_PT_SHARE=y
-# end of Device Drivers
-
-CONFIG_EXPERT=y
-CONFIG_UNSUPPORTED=y
-
-#
-# Debugging Options
-#
-CONFIG_DEBUG=y
-CONFIG_FRAME_POINTER=y
-CONFIG_COVERAGE=y
-CONFIG_DEBUG_LOCK_PROFILE=y
-CONFIG_DEBUG_LOCKS=y
-CONFIG_PERF_COUNTERS=y
-CONFIG_PERF_ARRAYS=y
-CONFIG_VERBOSE_DEBUG=y
-CONFIG_DEVICE_TREE_DEBUG=y
-CONFIG_SCRUB_DEBUG=y
-CONFIG_DEBUG_TRACE=y
-CONFIG_XMEM_POOL_POISON=y
-CONFIG_DEBUG_INFO=y
-# end of Debugging Options
diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_analysis/xen_x86_config
deleted file mode 100644
index abc44d43e108..000000000000
--- a/automation/eclair_analysis/xen_x86_config
+++ /dev/null
@@ -1,143 +0,0 @@
-CONFIG_CC_IS_GCC=y
-CONFIG_GCC_VERSION=90400
-CONFIG_CLANG_VERSION=0
-CONFIG_LD_IS_GNU=y
-CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=y
-CONFIG_X86_64=y
-CONFIG_X86=y
-CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
-CONFIG_CC_HAS_INDIRECT_THUNK=y
-CONFIG_HAS_AS_CET_SS=y
-CONFIG_HAS_CC_CET_IBT=y
-
-CONFIG_REQUIRE_NX=n
-
-#
-# Architecture Features
-#
-CONFIG_64BIT=y
-CONFIG_NR_CPUS=16
-CONFIG_NR_NUMA_NODES=2
-# CONFIG_PV is not set
-CONFIG_HVM=y
-# CONFIG_XEN_SHSTK is not set
-# CONFIG_XEN_IBT is not set
-# CONFIG_SHADOW_PAGING is not set
-# CONFIG_BIGMEM is not set
-# CONFIG_HVM_FEP is not set
-# CONFIG_TBOOT is not set
-CONFIG_XEN_ALIGN_DEFAULT=y
-# CONFIG_XEN_ALIGN_2M is not set
-CONFIG_X2APIC_PHYSICAL=y
-# CONFIG_XEN_GUEST is not set
-# CONFIG_HYPERV_GUEST is not set
-# CONFIG_MEM_PAGING is not set
-# CONFIG_MEM_SHARING is not set
-# end of Architecture Features
-
-#
-# Common Features
-#
-CONFIG_COMPAT=y
-CONFIG_CORE_PARKING=y
-CONFIG_GRANT_TABLE=y
-CONFIG_ALTERNATIVE_CALL=y
-CONFIG_ARCH_MAP_DOMAIN_PAGE=y
-CONFIG_GENERIC_BUG_FRAME=y
-CONFIG_HAS_ALTERNATIVE=y
-CONFIG_HAS_COMPAT=y
-CONFIG_HAS_EX_TABLE=y
-CONFIG_HAS_FAST_MULTIPLY=y
-CONFIG_HAS_IOPORTS=y
-CONFIG_HAS_KEXEC=y
-CONFIG_HAS_PDX=y
-CONFIG_HAS_SCHED_GRANULARITY=y
-CONFIG_HAS_UBSAN=y
-CONFIG_MEM_ACCESS_ALWAYS_ON=y
-CONFIG_MEM_ACCESS=y
-CONFIG_NEEDS_LIBELF=y
-CONFIG_NUMA=y
-
-#
-# Speculative hardening
-#
-CONFIG_INDIRECT_THUNK=y
-CONFIG_SPECULATIVE_HARDEN_ARRAY=y
-CONFIG_SPECULATIVE_HARDEN_BRANCH=y
-# end of Speculative hardening
-
-# CONFIG_HYPFS is not set
-CONFIG_IOREQ_SERVER=y
-# CONFIG_KEXEC is not set
-# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
-# CONFIG_XENOPROF is not set
-# CONFIG_XSM is not set
-# CONFIG_ARGO is not set
-
-#
-# Schedulers
-#
-# CONFIG_SCHED_CREDIT is not set
-CONFIG_SCHED_CREDIT2=y
-# CONFIG_SCHED_RTDS is not set
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=y
-CONFIG_SCHED_CREDIT2_DEFAULT=y
-# CONFIG_SCHED_NULL_DEFAULT is not set
-CONFIG_SCHED_DEFAULT="credit2"
-# end of Schedulers
-
-# CONFIG_LIVEPATCH is not set
-# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
-# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
-CONFIG_CMDLINE=""
-CONFIG_DOM0_MEM=""
-# CONFIG_TRACEBUFFER is not set
-# end of Common Features
-
-#
-# Device Drivers
-#
-CONFIG_ACPI=y
-CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
-CONFIG_ACPI_NUMA=y
-CONFIG_HAS_NS16550=y
-CONFIG_HAS_EHCI=y
-CONFIG_SERIAL_TX_BUFSIZE=16384
-# CONFIG_XHCI is not set
-CONFIG_HAS_CPUFREQ=y
-CONFIG_HAS_PASSTHROUGH=y
-CONFIG_AMD_IOMMU=y
-# CONFIG_INTEL_IOMMU is not set
-# CONFIG_IOMMU_QUARANTINE_NONE is not set
-CONFIG_IOMMU_QUARANTINE_BASIC=y
-# CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE is not set
-CONFIG_HAS_PCI=y
-CONFIG_HAS_PCI_MSI=y
-CONFIG_VIDEO=y
-CONFIG_VGA=y
-CONFIG_HAS_VPCI=y
-# end of Device Drivers
-
-CONFIG_EXPERT=y
-CONFIG_UNSUPPORTED=y
-CONFIG_ARCH_SUPPORTS_INT128=y
-
-#
-# Debugging Options
-#
-CONFIG_DEBUG=y
-# CONFIG_CRASH_DEBUG is not set
-CONFIG_GDBSX=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_COVERAGE is not set
-# CONFIG_DEBUG_LOCK_PROFILE is not set
-CONFIG_DEBUG_LOCKS=y
-# CONFIG_PERF_COUNTERS is not set
-CONFIG_VERBOSE_DEBUG=y
-CONFIG_SCRUB_DEBUG=y
-# CONFIG_UBSAN is not set
-# CONFIG_DEBUG_TRACE is not set
-CONFIG_XMEM_POOL_POISON=y
-CONFIG_DEBUG_INFO=y
-# end of Debugging Options
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 02e0ea692c66..35ff3620cf8e 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -40,6 +40,36 @@ eclair-x86_64:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
     RULESET: "monitored"
+    EXTRA_XEN_CONFIG: |
+      CONFIG_AMD=y
+      CONFIG_INTEL=n
+      CONFIG_AMD_SVM=y
+      CONFIG_INTEL_VMX=n
+      CONFIG_NR_CPUS=16
+      CONFIG_NR_NUMA_NODES=2
+      CONFIG_PV=n
+      CONFIG_XEN_IBT=n
+      CONFIG_XEN_SHSTK=n
+      CONFIG_SHADOW_PAGING=n
+      CONFIG_HVM_FEP=n
+      CONFIG_TBOOT=n
+      CONFIG_HYPFS=n
+      CONFIG_KEXEC=n
+      CONFIG_ARGO=y
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_INTEL_IOMMU=n
+      CONFIG_EXPERT=y
+      CONFIG_DEBUG=y
+      CONFIG_GDBSX=n
+      CONFIG_FRAME_POINTER=n
+      CONFIG_SELF_TESTS=n
+      CONFIG_DEBUG_LOCKS=n
+      CONFIG_SCRUB_DEBUG=n
+      CONFIG_XMEM_POOL_POISON=n
 
 eclair-ARM64:
   extends: .eclair-analysis:triggered
@@ -47,6 +77,44 @@ eclair-ARM64:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
     RULESET: "monitored"
+    EXTRA_XEN_CONFIG: |
+      CONFIG_NR_CPUS=16
+      CONFIG_GICV2=n
+      CONFIG_GICV3=y
+      CONFIG_VGICV2=n
+      CONFIG_HAS_ITS=y
+      CONFIG_HWDOM_VUART=n
+      CONFIG_STATIC_SHM=y
+      CONFIG_STATIC_EVTCHN=y
+      CONFIG_STATIC_MEMORY=y
+      CONFIG_SCMI_SMC=n
+      CONFIG_PARTIAL_EMULATION=n
+      CONFIG_HYPFS=n
+      CONFIG_IOREQ_SERVER=y
+      CONFIG_XSM=n
+      CONFIG_ARGO=y
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_BOOT_TIME_CPUPOOLS=y
+      CONFIG_TRACEBUFFER=n
+      CONFIG_HAS_CADENCE_UART=n
+      CONFIG_HAS_NS16550=n
+      CONFIG_HAS_IMX_LPUART=n
+      CONFIG_HAS_MVEBU=n
+      CONFIG_HAS_MESON=n
+      CONFIG_HAS_OMAP=n
+      CONFIG_HAS_SCIF=n
+      CONFIG_HAS_LINFLEX=n
+      CONFIG_ARM_SMMU=n
+      CONFIG_ARM_SMMU_V3=y
+      CONFIG_EXPERT=y
+      CONFIG_DEBUG=y
+      CONFIG_FRAME_POINTER=n
+      CONFIG_SELF_TESTS=n
+      CONFIG_DEBUG_LOCKS=n
+      CONFIG_SCRUB_DEBUG=n
+      CONFIG_XMEM_POOL_POISON=n
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
-- 
2.43.0


