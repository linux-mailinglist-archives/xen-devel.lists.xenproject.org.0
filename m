Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677F761C5E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569767.890849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJUC-00051X-0q; Tue, 25 Jul 2023 14:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569767.890849; Tue, 25 Jul 2023 14:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJUB-0004y5-TX; Tue, 25 Jul 2023 14:58:03 +0000
Received: by outflank-mailman (input) for mailman id 569767;
 Tue, 25 Jul 2023 14:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p13o=DL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOJUA-0003ay-9B
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:58:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d2161d-2afb-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 16:58:00 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.75.91])
 by support.bugseng.com (Postfix) with ESMTPSA id 979614EE073E;
 Tue, 25 Jul 2023 16:57:59 +0200 (CEST)
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
X-Inumbo-ID: a5d2161d-2afb-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/4] automation: Add xen builds for the ECLAIR analyses
Date: Tue, 25 Jul 2023 16:55:55 +0200
Message-Id: <256dd32f1496400c7fc8554aa03db417e729c741.1690294965.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690294965.git.simone.ballarin@bugseng.com>
References: <cover.1690294965.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch defines an ARM64 and a X86_64 build for the
ECLAIR pipelines.

These files are used by the analyze.sh script in
automation/eclair_analysis: it initially calls prepare.sh,
then runs into an ECLAIR environment build.sh.

Only the toolchain invocations triggered by build.sh
are analyzed; the prepare.sh script is instead intended
to perform all the required operations for building xen
that are not supposed to be analyzed: e.g. dependencies
build.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

--
Changes in v3:
- split build definitions in a separate patch.

Changes in v2:
- add ECLAIR configuration files (before they were fetched from a separate
  repository);
- now the pipeline fails if there are new violations of guidelines tagged
  with clean:added.
---
 automation/eclair_analysis/Makefile.prepare |   6 +
 automation/eclair_analysis/build.sh         |  44 ++++++
 automation/eclair_analysis/prepare.sh       |  42 ++++++
 automation/eclair_analysis/xen_arm_config   | 147 +++++++++++++++++++
 automation/eclair_analysis/xen_x86_config   | 152 ++++++++++++++++++++
 5 files changed, 391 insertions(+)
 create mode 100644 automation/eclair_analysis/Makefile.prepare
 create mode 100755 automation/eclair_analysis/build.sh
 create mode 100755 automation/eclair_analysis/prepare.sh
 create mode 100644 automation/eclair_analysis/xen_arm_config
 create mode 100644 automation/eclair_analysis/xen_x86_config

diff --git a/automation/eclair_analysis/Makefile.prepare b/automation/eclai=
r_analysis/Makefile.prepare
new file mode 100644
index 0000000000..90f4a31172
--- /dev/null
+++ b/automation/eclair_analysis/Makefile.prepare
@@ -0,0 +1,6 @@
+include Makefile
+prepare:
+	$(Q)$(MAKE) $(build)=3Dtools
+	$(Q)$(MAKE) $(build)=3D. include/xen/compile.h
+	$(Q)$(MAKE) $(build)=3Dinclude all
+	$(Q)$(MAKE) $(build)=3Darch/$(SRCARCH) include
diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analys=
is/build.sh
new file mode 100755
index 0000000000..ec087dd822
--- /dev/null
+++ b/automation/eclair_analysis/build.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from =
0.
+set -e
+
+script_name=3D"$(basename "$0")"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name} <ARM64|X86_64>"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+fi
+
+if [ "$1" =3D "X86_64" ]; then
+  export CROSS_COMPILE=3D
+  export XEN_TARGET_ARCH=3Dx86_64
+elif [ "$1" =3D "ARM64" ]; then
+  export CROSS_COMPILE=3Daarch64-linux-gnu-
+  export XEN_TARGET_ARCH=3Darm64
+else
+  fatal "Unknown configuration: $1"
+fi
+
+if [[ -f /proc/cpuinfo ]]; then
+  PROCESSORS=3D$(grep -c ^processor /proc/cpuinfo)
+else
+  PROCESSORS=3D6
+fi
+
+(
+  cd xen
+
+  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
+       "CROSS_COMPILE=3D${CROSS_COMPILE}"         \
+       "CC=3D${CROSS_COMPILE}gcc-12"              \
+       "CXX=3D${CROSS_COMPILE}g++-12"             \
+       "XEN_TARGET_ARCH=3D${XEN_TARGET_ARCH}"
+)
diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_anal=
ysis/prepare.sh
new file mode 100755
index 0000000000..275a1a3f51
--- /dev/null
+++ b/automation/eclair_analysis/prepare.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from =
0.
+set -e
+
+script_name=3D"$(basename "$0")"
+script_dir=3D"$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name}"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+  exit 1
+fi
+
+export XEN_TARGET_ARCH
+
+if [ "$1" =3D "X86_64" ]; then
+  CONFIG_FILE=3D"${script_dir}/xen_x86_config"
+  XEN_TARGET_ARCH=3Dx86_64
+elif [ "$1" =3D "ARM64" ]; then
+  CONFIG_FILE=3D"${script_dir}/xen_arm_config"
+  XEN_TARGET_ARCH=3Darm64
+else
+  fatal "Unknown configuration: $1"
+fi
+
+(
+    cd xen
+    cp "${CONFIG_FILE}" .config
+    make clean
+    make -f ${script_dir}/Makefile.prepare prepare
+)
diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_=
analysis/xen_arm_config
new file mode 100644
index 0000000000..82102b889e
--- /dev/null
+++ b/automation/eclair_analysis/xen_arm_config
@@ -0,0 +1,147 @@
+# File provided in=0D
+# Re: Xen MISRA C: Source files in scope and out of scope=0D
+# from:	Stefano Stabellini <stefano.stabellini@amd.com>=0D
+# date:	6 giu 2023, 02:53=0D
+=0D
+#=0D
+# Automatically generated file; DO NOT EDIT.=0D
+# Xen/arm 4.18-unstable Configuration=0D
+#=0D
+CONFIG_CC_IS_GCC=3Dy=0D
+CONFIG_GCC_VERSION=3D90400=0D
+CONFIG_CLANG_VERSION=3D0=0D
+CONFIG_LD_IS_GNU=3Dy=0D
+CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=3Dy=0D
+CONFIG_ARM_64=3Dy=0D
+CONFIG_ARM=3Dy=0D
+CONFIG_ARCH_DEFCONFIG=3D"arch/arm/configs/arm64_defconfig"=0D
+=0D
+# UBSAN=0D
+CONFIG_UBSAN=3Dn=0D
+=0D
+#=0D
+# Architecture Features=0D
+#=0D
+CONFIG_ARM64_SVE=3Dn=0D
+CONFIG_64BIT=3Dy=0D
+CONFIG_NR_CPUS=3D4=0D
+# CONFIG_ACPI is not set=0D
+CONFIG_ARM_EFI=3Dy=0D
+CONFIG_GICV3=3Dy=0D
+CONFIG_HAS_ITS=3Dy=0D
+CONFIG_HVM=3Dy=0D
+# CONFIG_NEW_VGIC is not set=0D
+CONFIG_SBSA_VUART_CONSOLE=3Dy=0D
+CONFIG_ARM_SSBD=3Dy=0D
+CONFIG_HARDEN_BRANCH_PREDICTOR=3Dy=0D
+# CONFIG_TEE is not set=0D
+# CONFIG_STATIC_SHM is not set=0D
+# end of Architecture Features=0D
+=0D
+#=0D
+# ARM errata workaround via the alternative framework=0D
+#=0D
+CONFIG_ARM64_ERRATUM_827319=3Dy=0D
+CONFIG_ARM64_ERRATUM_824069=3Dy=0D
+CONFIG_ARM64_ERRATUM_819472=3Dy=0D
+CONFIG_ARM64_ERRATUM_843419=3Dy=0D
+CONFIG_ARM64_ERRATUM_832075=3Dy=0D
+CONFIG_ARM64_ERRATUM_834220=3Dy=0D
+CONFIG_ARM_ERRATUM_858921=3Dy=0D
+CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=3Dy=0D
+CONFIG_ARM64_ERRATUM_1286807=3Dy=0D
+# end of ARM errata workaround via the alternative framework=0D
+=0D
+CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=3Dy=0D
+# CONFIG_ALL_PLAT is not set=0D
+# CONFIG_QEMU is not set=0D
+# CONFIG_RCAR3 is not set=0D
+CONFIG_MPSOC=3Dy=0D
+# CONFIG_NO_PLAT is not set=0D
+CONFIG_MPSOC_PLATFORM=3Dy=0D
+=0D
+#=0D
+# Common Features=0D
+#=0D
+CONFIG_GRANT_TABLE=3Dy=0D
+CONFIG_HAS_ALTERNATIVE=3Dy=0D
+CONFIG_HAS_DEVICE_TREE=3Dy=0D
+CONFIG_HAS_FAST_MULTIPLY=3Dy=0D
+CONFIG_HAS_PDX=3Dy=0D
+CONFIG_HAS_PMAP=3Dy=0D
+# CONFIG_MEM_ACCESS is not set=0D
+CONFIG_STATIC_MEMORY=3Dy=0D
+=0D
+#=0D
+# Speculative hardening=0D
+#=0D
+CONFIG_SPECULATIVE_HARDEN_ARRAY=3Dy=0D
+# end of Speculative hardening=0D
+=0D
+# CONFIG_HYPFS is not set=0D
+CONFIG_IOREQ_SERVER=3Dy=0D
+# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set=0D
+# CONFIG_XSM is not set=0D
+# CONFIG_ARGO is not set=0D
+=0D
+#=0D
+# Schedulers=0D
+#=0D
+# CONFIG_SCHED_CREDIT is not set=0D
+CONFIG_SCHED_CREDIT2=3Dy=0D
+# CONFIG_SCHED_RTDS is not set=0D
+# CONFIG_SCHED_ARINC653 is not set=0D
+CONFIG_SCHED_NULL=3Dy=0D
+CONFIG_SCHED_CREDIT2_DEFAULT=3Dy=0D
+# CONFIG_SCHED_NULL_DEFAULT is not set=0D
+CONFIG_SCHED_DEFAULT=3D"credit2"=0D
+# end of Schedulers=0D
+=0D
+CONFIG_BOOT_TIME_CPUPOOLS=3Dy=0D
+# CONFIG_LIVEPATCH is not set=0D
+# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set=0D
+CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=3Dy=0D
+CONFIG_CMDLINE=3D""=0D
+CONFIG_DOM0_MEM=3D""=0D
+CONFIG_DTB_FILE=3D""=0D
+# CONFIG_TRACEBUFFER is not set=0D
+# end of Common Features=0D
+=0D
+#=0D
+# Device Drivers=0D
+#=0D
+# CONFIG_HAS_NS16550 is not set=0D
+CONFIG_HAS_CADENCE_UART=3Dy=0D
+# CONFIG_HAS_IMX_LPUART is not set=0D
+# CONFIG_HAS_MVEBU is not set=0D
+# CONFIG_HAS_MESON is not set=0D
+CONFIG_HAS_PL011=3Dy=0D
+# CONFIG_HAS_SCIF is not set=0D
+CONFIG_SERIAL_TX_BUFSIZE=3D16384=0D
+CONFIG_HAS_PASSTHROUGH=3Dy=0D
+CONFIG_ARM_SMMU=3Dy=0D
+CONFIG_ARM_SMMU_V3=3Dy=0D
+# CONFIG_IPMMU_VMSA is not set=0D
+CONFIG_IOMMU_FORCE_PT_SHARE=3Dy=0D
+# end of Device Drivers=0D
+=0D
+CONFIG_EXPERT=3Dy=0D
+CONFIG_UNSUPPORTED=3Dy=0D
+=0D
+#=0D
+# Debugging Options=0D
+#=0D
+CONFIG_DEBUG=3Dy=0D
+CONFIG_FRAME_POINTER=3Dy=0D
+CONFIG_COVERAGE=3Dy=0D
+CONFIG_DEBUG_LOCK_PROFILE=3Dy=0D
+CONFIG_DEBUG_LOCKS=3Dy=0D
+CONFIG_PERF_COUNTERS=3Dy=0D
+CONFIG_PERF_ARRAYS=3Dy=0D
+CONFIG_VERBOSE_DEBUG=3Dy=0D
+CONFIG_DEVICE_TREE_DEBUG=3Dy=0D
+CONFIG_SCRUB_DEBUG=3Dy=0D
+CONFIG_DEBUG_TRACE=3Dy=0D
+CONFIG_XMEM_POOL_POISON=3Dy=0D
+CONFIG_DEBUG_INFO=3Dy=0D
+# end of Debugging Options=0D
diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_=
analysis/xen_x86_config
new file mode 100644
index 0000000000..9b2709bfc8
--- /dev/null
+++ b/automation/eclair_analysis/xen_x86_config
@@ -0,0 +1,152 @@
+# File provided in=0D
+# Re: Xen MISRA C: Source files in scope and out of scope=0D
+# from:	Stefano Stabellini <stefano.stabellini@amd.com> =0D
+# date:	6 giu 2023, 02:53=0D
+=0D
+#=0D
+# Automatically generated file; DO NOT EDIT.=0D
+# Xen/x86 4.18-unstable Configuration=0D
+#=0D
+CONFIG_CC_IS_GCC=3Dy=0D
+CONFIG_GCC_VERSION=3D90400=0D
+CONFIG_CLANG_VERSION=3D0=0D
+CONFIG_LD_IS_GNU=3Dy=0D
+CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=3Dy=0D
+CONFIG_X86_64=3Dy=0D
+CONFIG_X86=3Dy=0D
+CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"=0D
+CONFIG_CC_HAS_INDIRECT_THUNK=3Dy=0D
+CONFIG_HAS_AS_CET_SS=3Dy=0D
+CONFIG_HAS_CC_CET_IBT=3Dy=0D
+=0D
+CONFIG_REQUIRE_NX=3Dn=0D
+=0D
+#=0D
+# Architecture Features=0D
+#=0D
+CONFIG_64BIT=3Dy=0D
+CONFIG_NR_CPUS=3D16=0D
+CONFIG_NR_NUMA_NODES=3D2=0D
+# CONFIG_PV is not set=0D
+CONFIG_HVM=3Dy=0D
+# CONFIG_XEN_SHSTK is not set=0D
+# CONFIG_XEN_IBT is not set=0D
+# CONFIG_SHADOW_PAGING is not set=0D
+# CONFIG_BIGMEM is not set=0D
+# CONFIG_HVM_FEP is not set=0D
+# CONFIG_TBOOT is not set=0D
+CONFIG_XEN_ALIGN_DEFAULT=3Dy=0D
+# CONFIG_XEN_ALIGN_2M is not set=0D
+CONFIG_X2APIC_PHYSICAL=3Dy=0D
+# CONFIG_XEN_GUEST is not set=0D
+# CONFIG_HYPERV_GUEST is not set=0D
+# CONFIG_MEM_PAGING is not set=0D
+# CONFIG_MEM_SHARING is not set=0D
+# end of Architecture Features=0D
+=0D
+#=0D
+# Common Features=0D
+#=0D
+CONFIG_COMPAT=3Dy=0D
+CONFIG_CORE_PARKING=3Dy=0D
+CONFIG_GRANT_TABLE=3Dy=0D
+CONFIG_ALTERNATIVE_CALL=3Dy=0D
+CONFIG_ARCH_MAP_DOMAIN_PAGE=3Dy=0D
+CONFIG_GENERIC_BUG_FRAME=3Dy=0D
+CONFIG_HAS_ALTERNATIVE=3Dy=0D
+CONFIG_HAS_COMPAT=3Dy=0D
+CONFIG_HAS_EX_TABLE=3Dy=0D
+CONFIG_HAS_FAST_MULTIPLY=3Dy=0D
+CONFIG_HAS_IOPORTS=3Dy=0D
+CONFIG_HAS_KEXEC=3Dy=0D
+CONFIG_HAS_PDX=3Dy=0D
+CONFIG_HAS_SCHED_GRANULARITY=3Dy=0D
+CONFIG_HAS_UBSAN=3Dy=0D
+CONFIG_MEM_ACCESS_ALWAYS_ON=3Dy=0D
+CONFIG_MEM_ACCESS=3Dy=0D
+CONFIG_NEEDS_LIBELF=3Dy=0D
+CONFIG_NUMA=3Dy=0D
+=0D
+#=0D
+# Speculative hardening=0D
+#=0D
+CONFIG_INDIRECT_THUNK=3Dy=0D
+CONFIG_SPECULATIVE_HARDEN_ARRAY=3Dy=0D
+CONFIG_SPECULATIVE_HARDEN_BRANCH=3Dy=0D
+# end of Speculative hardening=0D
+=0D
+# CONFIG_HYPFS is not set=0D
+CONFIG_IOREQ_SERVER=3Dy=0D
+# CONFIG_KEXEC is not set=0D
+# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set=0D
+# CONFIG_XENOPROF is not set=0D
+# CONFIG_XSM is not set=0D
+# CONFIG_ARGO is not set=0D
+=0D
+#=0D
+# Schedulers=0D
+#=0D
+# CONFIG_SCHED_CREDIT is not set=0D
+CONFIG_SCHED_CREDIT2=3Dy=0D
+# CONFIG_SCHED_RTDS is not set=0D
+# CONFIG_SCHED_ARINC653 is not set=0D
+CONFIG_SCHED_NULL=3Dy=0D
+CONFIG_SCHED_CREDIT2_DEFAULT=3Dy=0D
+# CONFIG_SCHED_NULL_DEFAULT is not set=0D
+CONFIG_SCHED_DEFAULT=3D"credit2"=0D
+# end of Schedulers=0D
+=0D
+# CONFIG_LIVEPATCH is not set=0D
+# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set=0D
+# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set=0D
+CONFIG_CMDLINE=3D""=0D
+CONFIG_DOM0_MEM=3D""=0D
+# CONFIG_TRACEBUFFER is not set=0D
+# end of Common Features=0D
+=0D
+#=0D
+# Device Drivers=0D
+#=0D
+CONFIG_ACPI=3Dy=0D
+CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy=0D
+CONFIG_ACPI_NUMA=3Dy=0D
+CONFIG_HAS_NS16550=3Dy=0D
+CONFIG_HAS_EHCI=3Dy=0D
+CONFIG_SERIAL_TX_BUFSIZE=3D16384=0D
+# CONFIG_XHCI is not set=0D
+CONFIG_HAS_CPUFREQ=3Dy=0D
+CONFIG_HAS_PASSTHROUGH=3Dy=0D
+CONFIG_AMD_IOMMU=3Dy=0D
+# CONFIG_INTEL_IOMMU is not set=0D
+# CONFIG_IOMMU_QUARANTINE_NONE is not set=0D
+CONFIG_IOMMU_QUARANTINE_BASIC=3Dy=0D
+# CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE is not set=0D
+CONFIG_HAS_PCI=3Dy=0D
+CONFIG_HAS_PCI_MSI=3Dy=0D
+CONFIG_VIDEO=3Dy=0D
+CONFIG_VGA=3Dy=0D
+CONFIG_HAS_VPCI=3Dy=0D
+# end of Device Drivers=0D
+=0D
+CONFIG_EXPERT=3Dy=0D
+CONFIG_UNSUPPORTED=3Dy=0D
+CONFIG_ARCH_SUPPORTS_INT128=3Dy=0D
+=0D
+#=0D
+# Debugging Options=0D
+#=0D
+CONFIG_DEBUG=3Dy=0D
+# CONFIG_CRASH_DEBUG is not set=0D
+CONFIG_GDBSX=3Dy=0D
+CONFIG_FRAME_POINTER=3Dy=0D
+# CONFIG_COVERAGE is not set=0D
+# CONFIG_DEBUG_LOCK_PROFILE is not set=0D
+CONFIG_DEBUG_LOCKS=3Dy=0D
+# CONFIG_PERF_COUNTERS is not set=0D
+CONFIG_VERBOSE_DEBUG=3Dy=0D
+CONFIG_SCRUB_DEBUG=3Dy=0D
+# CONFIG_UBSAN is not set=0D
+# CONFIG_DEBUG_TRACE is not set=0D
+CONFIG_XMEM_POOL_POISON=3Dy=0D
+CONFIG_DEBUG_INFO=3Dy=0D
+# end of Debugging Options=0D
--=20
2.34.1


