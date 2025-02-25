Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4AA439CE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895563.1304236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOe-0008OO-Hh; Tue, 25 Feb 2025 09:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895563.1304236; Tue, 25 Feb 2025 09:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOe-0008Mi-Ef; Tue, 25 Feb 2025 09:38:36 +0000
Received: by outflank-mailman (input) for mailman id 895563;
 Tue, 25 Feb 2025 09:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GQ=VQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tmrOc-0007uj-SZ
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:38:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d426fe-f35c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:38:32 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id A7ABB4EEF419;
 Tue, 25 Feb 2025 10:38:31 +0100 (CET)
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
X-Inumbo-ID: 46d426fe-f35c-11ef-9897-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1740476312;
	b=dxOi2iAiTGUqiMx2GTVArA16f4gbHXD2osLGIj4nu2LMhyyLDMS1q6WlmXpE60rEamco
	 Ge2IzFdE1tRRsDDpvbuxyb5P5B6HNOCJ+uIAsvvn7a+ya4nOO8bwM6Oq7izIcN2jzkKLN
	 DzNvtRKmIt0JLMT4524kokJKUBHtJ9U85X94rp7wZIJwMQ0OcKyze6q6WEjvnkMR17KL0
	 jT0qSGLvy2v+hoVwrwQnioMCaGdDbKudJMb0D9ZmHQ7DP6qpTCVWt4Jd0Rk2oLGcQ4m7X
	 zGBCcyzuTzZp/LX4qV8LNJJ1PkaaiiBXvtozPHgqwocv0UTU+VppGXfc2urfTgHJxP5hg
	 JtxdqbbV9mjhB1jKUlVvHgVXDwoqS7lbJ5MpnoaAFauVC06k8MQpI3f9TlRr5BFRTSUwq
	 kmDsITqFK2VXa5DAdyMLWK46As/UjNxBdtV0hDk46n0kwaAC8VojVZTAuYdICNSRWoZC7
	 F+ezf4hlzPEuG8PzvpFOMsBkX64KnE1uxmNKfl7zvdhVnSbqouCcN3uSY/OgtxWWQwq/4
	 D41lKrdMMWrYVlBbm7kRm0AsfLa/2HYIvU434bhwZixap1T8F+Pcm+vzJm3fpf/FSwQ2L
	 0NVIW8MBBDM4OH+oK0Vmcb+Kd45vSvmxVUP/L5+643rb4pD51MU/gZUpusHXHnc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1740476312;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UVBX/hsJ3098u1YJ7DWvTChlHimdHgM6KhjX9q6PP+o=;
	b=3ioOijeu0hvdxVs2frOwhKc0IM2GFecTIqWj1N1GkUhAEc4AtrmD6erW9nmGVTi4CccR
	 tKgTa0cE8iDcqnxv2t19Mr9RlM9kB5/5IhuH1Wq9/IGhddYoz3nG51E8uue4B0HG1Wf98
	 RZnGzO/hhPh0OfyOM8SDzeoxqRaZ8PTIpZf3ZwJRzInRgbukJJHkJjdryFxhEGPIu+PVL
	 oFgG7NP5pJTI9q5hvNTAxbjzLG2x3xdDTY+5BwUuz6o0VqiPImr4RMtU/WmIq8uLp0DPa
	 kSBMO13YPko8lp258C4VeTig1f3C3of/eSnO+Wa+R0Z1E9hHj44WiCvJSfuofxtPxUWA6
	 Tb3Og/8++1qZCiZtQE6e20ZG1jjxpNDbn+kytmoEUpXNjHUckRjqgeeHqJK3UDAWG5KSg
	 4Yt9XwB0lt2KtEBA8zhJDkHiCNvIFlp05+edftnek7mIjiwvKnAqbMWEtimxugaS+82g1
	 K0wo/H5PYdMORGG2XDbtWEr0nEYByZSzyv1s2cI4JJxeMP/n5plF/ZIG1BHt6wQI5bd9W
	 KW12KNA8HlQaIIHRDNcZkYusfDsn1E0QWPRMNUGkIVH9+bPL/7C8UoGELZcItY6LBlCID
	 vSUeIuMpSZXVW3CwhV7AW+KslwquguNNcWnKJMxZ6EorAa5UaGed0ZUA1n6DNTk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1740476312; bh=dxCVLK5mc1cedb+GrWJHR49a9qftfFcxzud59P193Uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndSR5e2qabhRPffSO3tvOC2MbAbmfrwEJuAP362JIBVQ1ti0++pDq331u7bzXnpEd
	 kiZJhRfiC5hVbNubg8ocgN+DLX7vtB8b3HL3YvmewAG6qqYXfFfya3+8wgefyaC40I
	 omyyHG5aghZVo7ry40IFgq8FkvpW7pa3sm5w9NymHYeeMoBK/zeTYO8Fj33Ub+i/fJ
	 3h/+iDlmpP0VJaL1E0vJw71HgLjYW4m/uaTLMeniIAce9fcavH9DYgjpP9s9SFbkBl
	 veAd9sJsPkz6im3lRmaf62tqhcmD+p7dpZwh/fIqkVdb3D4WCXFfl3TvVpY2gTTiwT
	 QIVYp1nYtkHRw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 3/3] automation: Update ECLAIR analysis configuration
Date: Tue, 25 Feb 2025 10:38:24 +0100
Message-ID: <3926bf39f742a166d2190e2a10f1806a36cca2e9.1740476096.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740476096.git.nicola.vetrini@bugseng.com>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


