Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB542333A73
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95962.181268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJp-0003CN-La; Wed, 10 Mar 2021 10:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95962.181268; Wed, 10 Mar 2021 10:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJp-0003Bn-FE; Wed, 10 Mar 2021 10:43:57 +0000
Received: by outflank-mailman (input) for mailman id 95962;
 Wed, 10 Mar 2021 10:43:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJwJm-00035F-Vp
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:43:55 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5f512f45-65b9-414c-a28e-504c0cbaa8ee;
 Wed, 10 Mar 2021 10:43:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C27211B3;
 Wed, 10 Mar 2021 02:43:48 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11B573F85F;
 Wed, 10 Mar 2021 02:43:46 -0800 (PST)
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
X-Inumbo-ID: 5f512f45-65b9-414c-a28e-504c0cbaa8ee
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	andrew.cooper3@citrix.com,
	amc96@cam.ac.uk
Subject: [XTF 4/4] arm: Add build support for arm64/arm32
Date: Wed, 10 Mar 2021 11:43:35 +0100
Message-Id: <20210310104335.14855-5-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210310104335.14855-1-michal.orzel@arm.com>
References: <20210310104335.14855-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for arm64/arm32 in the build
system, modify the common headers to be
aware of the new architectures and update
the documentation.

Architecture can be set using ARCH=arm64
or ARCH=arm32.

arm64: Currently only one test: tests/example
is supported allowing the startup code head.S
to be executed.

arm32: No tests supported. Only compile time
support.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 INSTALL                    |  18 ++
 Makefile                   |   6 +-
 README                     |   7 +
 build/arm-common-files.mk  |  14 ++
 build/arm32/arch-common.mk |   8 +
 build/arm32/arch-files.mk  |   7 +
 build/arm32/arch-tests.mk  |   4 +
 build/arm64/arch-common.mk |  15 ++
 build/arm64/arch-files.mk  |   7 +
 build/arm64/arch-tests.mk  |   4 +
 config/default-arm.cfg.in  |   6 +
 docs/introduction.dox      |  16 +-
 docs/mainpage.dox          |  34 ++-
 include/xen/arch-arm.h     | 452 +++++++++++++++++++++++++++++++++++++
 include/xen/xen.h          |   2 +
 include/xtf/hypercall.h    |  81 ++++---
 include/xtf/lib.h          |   9 +-
 17 files changed, 654 insertions(+), 36 deletions(-)
 create mode 100644 build/arm-common-files.mk
 create mode 100644 build/arm32/arch-common.mk
 create mode 100644 build/arm32/arch-files.mk
 create mode 100644 build/arm32/arch-tests.mk
 create mode 100644 build/arm64/arch-common.mk
 create mode 100644 build/arm64/arch-files.mk
 create mode 100644 build/arm64/arch-tests.mk
 create mode 100644 config/default-arm.cfg.in
 create mode 100644 include/xen/arch-arm.h

diff --git a/INSTALL b/INSTALL
index ed19623..296a0f0 100644
--- a/INSTALL
+++ b/INSTALL
@@ -2,6 +2,24 @@ Xen Test Framework
 
 Build requirements:
  - GNU Make >= 3.81
+For x86:
  - GNU compatible compiler, capable of:
    -std=gnu99
    -m64 and -m32
+For arm64/arm32:
+-when cross-compiling:
+ - GNU compatible cross-compiler toolchain for Aarch64/Aarch32
+-when building natively:
+ - GNU compatible toolchain for Aarch64/Aarch32
+
+To build XTF:
+-for x86:
+  $ make
+-for arm64 natively:
+  $ make ARCH=arm64
+-for arm64 when cross compiling:
+  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
+-for arm32 natively:
+  $ make ARCH=arm32
+-for arm32 when cross compiling:
+  $ make ARCH=arm32 CROSS_COMPILE=arm-linux-gnueabi-
diff --git a/Makefile b/Makefile
index 7c25b0d..2cb6abc 100644
--- a/Makefile
+++ b/Makefile
@@ -19,7 +19,7 @@ endif
 xtftestdir := $(xtfdir)/tests
 
 # Supported architectures
-SUPPORTED_ARCH := x86
+SUPPORTED_ARCH := x86 arm64 arm32
 # Default architecture
 ARCH ?= x86
 # Check if specified architecture is supported
@@ -42,6 +42,10 @@ PYTHON          := python
 
 export CC CPP INSTALL INSTALL_DATA INSTALL_DIR INSTALL_PROGRAM OBJCOPY PYTHON
 
+# Some tests are architecture specific. In this case we can have a list of tests
+# supported by a given architecture in $(ROOT)/build/$(ARCH)/arch-tests.mk
+-include $(ROOT)/build/$(ARCH)/arch-tests.mk
+
 # By default enable all the tests
 TESTS ?= $(wildcard tests/*)
 
diff --git a/README b/README
index 20d9127..c595a5b 100644
--- a/README
+++ b/README
@@ -9,12 +9,19 @@ Tests for more generic areas are build multiple times into different
 microkernels, to test the same functionality from different types of virtual
 machine.
 
+Currently there are 3 architectures available: x86, arm64 and arm32 although
+only x86 is truly supported. Initial support for arm64 is added allowing to run
+a startup code based on the test: tests/example. For arm32 only compile time
+support is added. This creates a base for future implementation.
+
 ## The framework consists of:
 
 * PV and HVM, 32 and 64 bit entry points
 * Hypercall interface
 * PV console driver (output)
 * Common reporting framework
+* Initial support for arm64 (startup code running)
+* Initial support for arm32 (currently no tests supported)
 
 ## TODO List:
 
diff --git a/build/arm-common-files.mk b/build/arm-common-files.mk
new file mode 100644
index 0000000..01e9d8d
--- /dev/null
+++ b/build/arm-common-files.mk
@@ -0,0 +1,14 @@
+# Common files compiled and linked for arm
+
+obj-perenv += $(ROOT)/common/console.o
+obj-perenv += $(ROOT)/common/lib.o
+obj-perenv += $(ROOT)/common/libc/stdio.o
+obj-perenv += $(ROOT)/common/libc/string.o
+obj-perenv += $(ROOT)/common/libc/vsnprintf.o
+obj-perenv += $(ROOT)/common/report.o
+obj-perenv += $(ROOT)/common/setup.o
+obj-perenv += $(ROOT)/common/xenbus.o
+
+obj-perenv += $(ROOT)/arch/arm/decode.o
+obj-perenv += $(ROOT)/arch/arm/setup.o
+obj-perenv += $(ROOT)/arch/arm/traps.o
diff --git a/build/arm32/arch-common.mk b/build/arm32/arch-common.mk
new file mode 100644
index 0000000..ef65b7f
--- /dev/null
+++ b/build/arm32/arch-common.mk
@@ -0,0 +1,8 @@
+# Architecture specific configuration for arm32
+
+ARCH_PATH := $(ROOT)/arch/arm
+ALL_ENVIRONMENTS := arm32
+
+arm32_arch   := arm32
+arm32_guest  := arm32
+defcfg-arm32 := $(ROOT)/config/default-arm.cfg.in
diff --git a/build/arm32/arch-files.mk b/build/arm32/arch-files.mk
new file mode 100644
index 0000000..8186d70
--- /dev/null
+++ b/build/arm32/arch-files.mk
@@ -0,0 +1,7 @@
+# Architecture specific files compiled and linked for arm32
+
+# Include arm common files
+include $(ROOT)/build/arm-common-files.mk
+
+# Specific files for arm32
+obj-perenv +=
diff --git a/build/arm32/arch-tests.mk b/build/arm32/arch-tests.mk
new file mode 100644
index 0000000..3736042
--- /dev/null
+++ b/build/arm32/arch-tests.mk
@@ -0,0 +1,4 @@
+# Supported tests by arm32
+
+# Currently no tests are supported for arm32
+TESTS :=
diff --git a/build/arm64/arch-common.mk b/build/arm64/arch-common.mk
new file mode 100644
index 0000000..85060c5
--- /dev/null
+++ b/build/arm64/arch-common.mk
@@ -0,0 +1,15 @@
+# Architecture specific configuration for arm64
+
+ARCH_PATH := $(ROOT)/arch/arm
+ALL_ENVIRONMENTS := arm64
+
+arm64_arch   := arm64
+arm64_guest  := arm64
+defcfg-arm64 := $(ROOT)/config/default-arm.cfg.in
+
+# Compilation recipe for arm64
+# arm64 needs linking normally, then converting to a binary format
+define build-arm64
+	$(CC) $$(LDFLAGS_arm64) $$(DEPS-arm64) -o $$@-syms
+	$(OBJCOPY) $$@-syms -O binary $$@
+endef
diff --git a/build/arm64/arch-files.mk b/build/arm64/arch-files.mk
new file mode 100644
index 0000000..f7a4007
--- /dev/null
+++ b/build/arm64/arch-files.mk
@@ -0,0 +1,7 @@
+# Architecture specific files compiled and linked for arm64
+
+# Include arm common files
+include $(ROOT)/build/arm-common-files.mk
+
+# Specific files for arm64
+obj-perenv += $(ROOT)/arch/arm/arm64/cache.o
diff --git a/build/arm64/arch-tests.mk b/build/arm64/arch-tests.mk
new file mode 100644
index 0000000..1a13ba9
--- /dev/null
+++ b/build/arm64/arch-tests.mk
@@ -0,0 +1,4 @@
+# Supported tests by arm64
+
+# Currently only example test is supported
+TESTS := $(ROOT)/tests/example
diff --git a/config/default-arm.cfg.in b/config/default-arm.cfg.in
new file mode 100644
index 0000000..26c0c50
--- /dev/null
+++ b/config/default-arm.cfg.in
@@ -0,0 +1,6 @@
+name="test-@@ENV@@-@@NAME@@@@VARIATION@@"
+
+vcpus=@@VCPUS@@
+
+memory=128
+kernel="@@XTFDIR@@/tests/@@NAME@@/test-@@ENV@@-@@NAME@@"
diff --git a/docs/introduction.dox b/docs/introduction.dox
index 9207941..ff5ceae 100644
--- a/docs/introduction.dox
+++ b/docs/introduction.dox
@@ -38,17 +38,29 @@ categories are:
 
 A test is built for one or more environments.  The environment encodes:
 
+For x86 architecture:
 - The Xen VM ABI in use (PV or HVM).
 - The compilation width (32bit or 64bit).
 - The primary paging mode (none, PSE, PAE).
 
-All available environments are:
+For arm64/arm32 there is currently a single environment called arm64/arm32.
+
+All available environments for x86 are:
+@dontinclude build/x86/arch-common.mk
 @skipline ALL_ENVIRONMENTS
 
-Some more specific collections for environments are also available:
+Some more specific collections for x86 environments are also available:
 @skipline PV_ENVIRONMENTS
 @until 64BIT_ENVIRONMENTS
 
+All available environments for arm64 are:
+@dontinclude build/arm64/arch-common.mk
+@skipline ALL_ENVIRONMENTS
+
+All available environments for arm32 are:
+@dontinclude build/arm32/arch-common.mk
+@skipline ALL_ENVIRONMENTS
+
 An individual test, compiled for more than one environment, will end up with a
 individual microkernel binary for each specified environment.
 
diff --git a/docs/mainpage.dox b/docs/mainpage.dox
index 4b09ce1..572c552 100644
--- a/docs/mainpage.dox
+++ b/docs/mainpage.dox
@@ -18,8 +18,14 @@ The build system and library abstractions are specifically designed to make it
 easy to write code once and compile it for multiple different environments
 (virtual machines).
 
+Currently there are 3 architectures available: x86, arm64 and arm32 although
+only x86 is truly supported. Initial support for arm64 is added allowing to run
+a startup code based on the test: tests/example. For arm32 only compile time
+support is added. This creates a base for future implementation.
+
 The current environments supported are:
 
+x86:
 Environment | Guest | Width | Paging
 :-----------|:------|:------|:---------
 `pv32pae`   | PV    | 32bit | PAE
@@ -29,18 +35,29 @@ Environment | Guest | Width | Paging
 `hvm32pae`  | HVM   | 32bit | PAE
 `hvm64`     | HVM   | 64bit | Long mode
 
+arm64:
+Environment | Guest | Width | Paging
+:-----------|:------|:------|:----------------
+`arm64`     | arm64 | 64bit | Currently no MMU
+
+arm32:
+Environment | Guest | Width | Paging
+:-----------|:------|:------|:----------------
+`arm32`     | arm32 | 32bit | Currently no MMU
 
 @section getting-started Getting Started
 
 Requirements:
 - GNU Make >= 3.81
+- Python 2.6 or later
+
+For x86:
 - GNU compatible 32 and 64-bit toolchain, capable of `-std=gnu99`, `-m64`, and
   `-m32`
     - For Debian-based systems, the `build-essential` package is
       sufficient. For RHEL-based systems, the `glibc-devel.i686` package is
       generally needed beyond the default toolchain packages.
     - Clang may be used, via `CC="clang"`
-- Python 2.6 or later
 
 Optionally:
 - A toolchain with x32 support.
@@ -49,11 +66,26 @@ Optionally:
       `elf32-i386` will be used which will load correctly, but disassemble
       incorrectly.
 
+For arm64/arm32:
+-when cross-compiling:
+ - GNU compatible cross-compiler toolchain for Aarch64/Aarch32
+-when building natively:
+ - GNU compatible toolchain for Aarch64/Aarch32
+
 To obtain and build:
 
     $ git clone git://xenbits.xen.org/xtf.git
     $ cd xtf
+    # To build for x86:
     $ make -j4
+    # To build for arm64 natively:
+    $ make ARCH=arm64
+    # To build for arm32 natively:
+    $ make ARCH=arm32
+    # To build for arm64 when cross compiling:
+    $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
+    # To build for arm32 when cross compiling:
+    $ make ARCH=arm32 CROSS_COMPILE=arm-linux-gnueabi-
 
 To run tests on a Xen host: (see @ref errata first)
 
diff --git a/include/xen/arch-arm.h b/include/xen/arch-arm.h
new file mode 100644
index 0000000..c77ee48
--- /dev/null
+++ b/include/xen/arch-arm.h
@@ -0,0 +1,452 @@
+#ifndef XEN_PUBLIC_ARCH_ARM_H
+#define XEN_PUBLIC_ARCH_ARM_H
+
+/*
+ * `incontents 50 arm_abi Hypercall Calling Convention
+ *
+ * A hypercall is issued using the ARM HVC instruction.
+ *
+ * A hypercall can take up to 5 arguments. These are passed in
+ * registers, the first argument in x0/r0 (for arm64/arm32 guests
+ * respectively irrespective of whether the underlying hypervisor is
+ * 32- or 64-bit), the second argument in x1/r1, the third in x2/r2,
+ * the forth in x3/r3 and the fifth in x4/r4.
+ *
+ * The hypercall number is passed in r12 (arm) or x16 (arm64). In both
+ * cases the relevant ARM procedure calling convention specifies this
+ * is an inter-procedure-call scratch register (e.g. for use in linker
+ * stubs). This use does not conflict with use during a hypercall.
+ *
+ * The HVC ISS must contain a Xen specific TAG: XEN_HYPERCALL_TAG.
+ *
+ * The return value is in x0/r0.
+ *
+ * The hypercall will clobber x16/r12 and the argument registers used
+ * by that hypercall (except r0 which is the return value) i.e. in
+ * addition to x16/r12 a 2 argument hypercall will clobber x1/r1 and a
+ * 4 argument hypercall will clobber x1/r1, x2/r2 and x3/r3.
+ *
+ * Parameter structs passed to hypercalls are laid out according to
+ * the Procedure Call Standard for the ARM Architecture (AAPCS, AKA
+ * EABI) and Procedure Call Standard for the ARM 64-bit Architecture
+ * (AAPCS64). Where there is a conflict the 64-bit standard should be
+ * used regardless of guest type. Structures which are passed as
+ * hypercall arguments are always little endian.
+ *
+ * All memory which is shared with other entities in the system
+ * (including the hypervisor and other guests) must reside in memory
+ * which is mapped as Normal Inner Write-Back Outer Write-Back Inner-Shareable.
+ * This applies to:
+ *  - hypercall arguments passed via a pointer to guest memory.
+ *  - memory shared via the grant table mechanism (including PV I/O
+ *    rings etc).
+ *  - memory shared with the hypervisor (struct shared_info, struct
+ *    vcpu_info, the grant table, etc).
+ *
+ * Any cache allocation hints are acceptable.
+ */
+
+/*
+ * `incontents 55 arm_hcall Supported Hypercalls
+ *
+ * Xen on ARM makes extensive use of hardware facilities and therefore
+ * only a subset of the potential hypercalls are required.
+ *
+ * Since ARM uses second stage paging any machine/physical addresses
+ * passed to hypercalls are Guest Physical Addresses (Intermediate
+ * Physical Addresses) unless otherwise noted.
+ *
+ * The following hypercalls (and sub operations) are supported on the
+ * ARM platform. Other hypercalls should be considered
+ * unavailable/unsupported.
+ *
+ *  HYPERVISOR_memory_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_domctl
+ *   All generic sub-operations, with the exception of:
+ *    * XEN_DOMCTL_irq_permission (not yet implemented)
+ *
+ *  HYPERVISOR_sched_op
+ *   All generic sub-operations, with the exception of:
+ *    * SCHEDOP_block -- prefer wfi hardware instruction
+ *
+ *  HYPERVISOR_console_io
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_xen_version
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_event_channel_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_physdev_op
+ *   No sub-operations are currenty supported
+ *
+ *  HYPERVISOR_sysctl
+ *   All generic sub-operations, with the exception of:
+ *    * XEN_SYSCTL_page_offline_op
+ *    * XEN_SYSCTL_get_pmstat
+ *    * XEN_SYSCTL_pm_op
+ *
+ *  HYPERVISOR_hvm_op
+ *   Exactly these sub-operations are supported:
+ *    * HVMOP_set_param
+ *    * HVMOP_get_param
+ *
+ *  HYPERVISOR_grant_table_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_vcpu_op
+ *   Exactly these sub-operations are supported:
+ *    * VCPUOP_register_vcpu_info
+ *    * VCPUOP_register_runstate_memory_area
+ *
+ *
+ * Other notes on the ARM ABI:
+ *
+ * - struct start_info is not exported to ARM guests.
+ *
+ * - struct shared_info is mapped by ARM guests using the
+ *   HYPERVISOR_memory_op sub-op XENMEM_add_to_physmap, passing
+ *   XENMAPSPACE_shared_info as space parameter.
+ *
+ * - All the per-cpu struct vcpu_info are mapped by ARM guests using the
+ *   HYPERVISOR_vcpu_op sub-op VCPUOP_register_vcpu_info, including cpu0
+ *   struct vcpu_info.
+ *
+ * - The grant table is mapped using the HYPERVISOR_memory_op sub-op
+ *   XENMEM_add_to_physmap, passing XENMAPSPACE_grant_table as space
+ *   parameter. The memory range specified under the Xen compatible
+ *   hypervisor node on device tree can be used as target gpfn for the
+ *   mapping.
+ *
+ * - Xenstore is initialized by using the two hvm_params
+ *   HVM_PARAM_STORE_PFN and HVM_PARAM_STORE_EVTCHN. They can be read
+ *   with the HYPERVISOR_hvm_op sub-op HVMOP_get_param.
+ *
+ * - The paravirtualized console is initialized by using the two
+ *   hvm_params HVM_PARAM_CONSOLE_PFN and HVM_PARAM_CONSOLE_EVTCHN. They
+ *   can be read with the HYPERVISOR_hvm_op sub-op HVMOP_get_param.
+ *
+ * - Event channel notifications are delivered using the percpu GIC
+ *   interrupt specified under the Xen compatible hypervisor node on
+ *   device tree.
+ *
+ * - The device tree Xen compatible node is fully described under Linux
+ *   at Documentation/devicetree/bindings/arm/xen.txt.
+ */
+
+#define XEN_HYPERCALL_TAG   0XEA1
+
+#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
+#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
+
+#ifndef __ASSEMBLY__
+#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
+    typedef union { type *p; unsigned long q; }                 \
+        __guest_handle_ ## name;                                \
+    typedef union { type *p; uint64_aligned_t q; }              \
+        __guest_handle_64_ ## name
+
+/*
+ * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
+ * in a struct in memory. On ARM is always 8 bytes sizes and 8 bytes
+ * aligned.
+ * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
+ * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.
+ */
+#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
+    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
+    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
+#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
+#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
+#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
+#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
+#define set_xen_guest_handle_raw(hnd, val)                  \
+    do {                                                    \
+        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \
+        _sxghr_tmp->q = 0;                                  \
+        _sxghr_tmp->p = val;                                \
+    } while ( 0 )
+#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
+
+typedef uint64_t xen_pfn_t;
+#define PRI_xen_pfn PRIx64
+#define PRIu_xen_pfn PRIu64
+
+/*
+ * Maximum number of virtual CPUs in legacy multi-processor guests.
+ * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
+ */
+#define XEN_LEGACY_MAX_VCPUS 1
+
+typedef uint64_t xen_ulong_t;
+#define PRI_xen_ulong PRIx64
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+/* Anonymous union includes both 32- and 64-bit names (e.g., r0/x0). */
+# define __DECL_REG(n64, n32) union {          \
+        uint64_t n64;                          \
+        uint32_t n32;                          \
+    }
+#else
+/* Non-gcc sources must always use the proper 64-bit name (e.g., x0). */
+#define __DECL_REG(n64, n32) uint64_t n64
+#endif
+
+struct vcpu_guest_core_regs
+{
+    /*         Aarch64       Aarch32 */
+    __DECL_REG(x0,           r0_usr);
+    __DECL_REG(x1,           r1_usr);
+    __DECL_REG(x2,           r2_usr);
+    __DECL_REG(x3,           r3_usr);
+    __DECL_REG(x4,           r4_usr);
+    __DECL_REG(x5,           r5_usr);
+    __DECL_REG(x6,           r6_usr);
+    __DECL_REG(x7,           r7_usr);
+    __DECL_REG(x8,           r8_usr);
+    __DECL_REG(x9,           r9_usr);
+    __DECL_REG(x10,          r10_usr);
+    __DECL_REG(x11,          r11_usr);
+    __DECL_REG(x12,          r12_usr);
+
+    __DECL_REG(x13,          sp_usr);
+    __DECL_REG(x14,          lr_usr);
+
+    __DECL_REG(x15,          __unused_sp_hyp);
+
+    __DECL_REG(x16,          lr_irq);
+    __DECL_REG(x17,          sp_irq);
+
+    __DECL_REG(x18,          lr_svc);
+    __DECL_REG(x19,          sp_svc);
+
+    __DECL_REG(x20,          lr_abt);
+    __DECL_REG(x21,          sp_abt);
+
+    __DECL_REG(x22,          lr_und);
+    __DECL_REG(x23,          sp_und);
+
+    __DECL_REG(x24,          r8_fiq);
+    __DECL_REG(x25,          r9_fiq);
+    __DECL_REG(x26,          r10_fiq);
+    __DECL_REG(x27,          r11_fiq);
+    __DECL_REG(x28,          r12_fiq);
+
+    __DECL_REG(x29,          sp_fiq);
+    __DECL_REG(x30,          lr_fiq);
+
+    /* Return address and mode */
+    __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
+    uint32_t cpsr;                              /* SPSR_EL2 */
+
+    union {
+        uint32_t spsr_el1;       /* AArch64 */
+        uint32_t spsr_svc;       /* AArch32 */
+    };
+
+    /* AArch32 guests only */
+    uint32_t spsr_fiq, spsr_irq, spsr_und, spsr_abt;
+
+    /* AArch64 guests only */
+    uint64_t sp_el0;
+    uint64_t sp_el1, elr_el1;
+};
+typedef struct vcpu_guest_core_regs vcpu_guest_core_regs_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_core_regs_t);
+
+#undef __DECL_REG
+
+struct vcpu_guest_context {
+#define _VGCF_online                   0
+#define VGCF_online                    (1<<_VGCF_online)
+    uint32_t flags;                         /* VGCF_* */
+
+    struct vcpu_guest_core_regs user_regs;  /* Core CPU registers */
+
+    uint64_t sctlr;
+    uint64_t ttbcr, ttbr0, ttbr1;
+};
+typedef struct vcpu_guest_context vcpu_guest_context_t;
+DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
+
+/*
+ * struct xen_arch_domainconfig's ABI is covered by
+ * XEN_DOMCTL_INTERFACE_VERSION.
+ */
+#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
+#define XEN_DOMCTL_CONFIG_GIC_V2        1
+#define XEN_DOMCTL_CONFIG_GIC_V3        2
+
+#define XEN_DOMCTL_CONFIG_TEE_NONE      0
+#define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
+
+struct xen_arch_domainconfig {
+    /* IN/OUT */
+    uint8_t gic_version;
+    /* IN */
+    uint16_t tee_type;
+    /* IN */
+    uint32_t nr_spis;
+    /*
+     * OUT
+     * Based on the property clock-frequency in the DT timer node.
+     * The property may be present when the bootloader/firmware doesn't
+     * set correctly CNTFRQ which hold the timer frequency.
+     *
+     * As it's not possible to trap this register, we have to replicate
+     * the value in the guest DT.
+     *
+     * = 0 => property not present
+     * > 0 => Value of the property
+     *
+     */
+    uint32_t clock_frequency;
+};
+
+struct arch_vcpu_info {
+};
+typedef struct arch_vcpu_info arch_vcpu_info_t;
+
+struct arch_shared_info {
+};
+typedef struct arch_shared_info arch_shared_info_t;
+typedef uint64_t xen_callback_t;
+
+#endif
+
+/* PSR bits (CPSR, SPSR) */
+
+#define PSR_THUMB       (1<<5)        /* Thumb Mode enable */
+#define PSR_FIQ_MASK    (1<<6)        /* Fast Interrupt mask */
+#define PSR_IRQ_MASK    (1<<7)        /* Interrupt mask */
+#define PSR_ABT_MASK    (1<<8)        /* Asynchronous Abort mask */
+#define PSR_BIG_ENDIAN  (1<<9)        /* arm32: Big Endian Mode */
+#define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
+#define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
+#define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
+
+/* 32 bit modes */
+#define PSR_MODE_USR 0x10
+#define PSR_MODE_FIQ 0x11
+#define PSR_MODE_IRQ 0x12
+#define PSR_MODE_SVC 0x13
+#define PSR_MODE_MON 0x16
+#define PSR_MODE_ABT 0x17
+#define PSR_MODE_HYP 0x1a
+#define PSR_MODE_UND 0x1b
+#define PSR_MODE_SYS 0x1f
+
+/* 64 bit modes */
+#define PSR_MODE_BIT  0x10 /* Set iff AArch32 */
+#define PSR_MODE_EL3h 0x0d
+#define PSR_MODE_EL3t 0x0c
+#define PSR_MODE_EL2h 0x09
+#define PSR_MODE_EL2t 0x08
+#define PSR_MODE_EL1h 0x05
+#define PSR_MODE_EL1t 0x04
+#define PSR_MODE_EL0t 0x00
+
+#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
+#define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
+
+#define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
+
+/*
+ * Virtual machine platform (memory layout, interrupts)
+ *
+ * These are defined for consistency between the tools and the
+ * hypervisor. Guests must not rely on these hardcoded values but
+ * should instead use the FDT.
+ */
+
+/* Physical Address Space */
+
+/*
+ * vGIC mappings: Only one set of mapping is used by the guest.
+ * Therefore they can overlap.
+ */
+
+/* vGIC v2 mappings */
+#define GUEST_GICD_BASE   xen_mk_ullong(0x03001000)
+#define GUEST_GICD_SIZE   xen_mk_ullong(0x00001000)
+#define GUEST_GICC_BASE   xen_mk_ullong(0x03002000)
+#define GUEST_GICC_SIZE   xen_mk_ullong(0x00002000)
+
+/* vGIC v3 mappings */
+#define GUEST_GICV3_GICD_BASE      xen_mk_ullong(0x03001000)
+#define GUEST_GICV3_GICD_SIZE      xen_mk_ullong(0x00010000)
+
+#define GUEST_GICV3_RDIST_REGIONS  1
+
+#define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
+#define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
+
+/* ACPI tables physical address */
+#define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
+#define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
+
+/* PL011 mappings */
+#define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
+#define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
+
+/*
+ * 16MB == 4096 pages reserved for guest to use as a region to map its
+ * grant table in.
+ */
+#define GUEST_GNTTAB_BASE xen_mk_ullong(0x38000000)
+#define GUEST_GNTTAB_SIZE xen_mk_ullong(0x01000000)
+
+#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
+#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
+
+#define GUEST_RAM_BANKS   2
+
+#define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM @ 1GB */
+#define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
+
+#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM @ 8GB */
+#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
+
+#define GUEST_RAM_BASE    GUEST_RAM0_BASE /* Lowest RAM address */
+/* Largest amount of actual RAM, not including holes */
+#define GUEST_RAM_MAX     (GUEST_RAM0_SIZE + GUEST_RAM1_SIZE)
+/* Suitable for e.g. const uint64_t ramfoo[] = GUEST_RAM_BANK_FOOS; */
+#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
+#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
+
+/* Current supported guest VCPUs */
+#define GUEST_MAX_VCPUS 128
+
+/* Interrupts */
+#define GUEST_TIMER_VIRT_PPI    27
+#define GUEST_TIMER_PHYS_S_PPI  29
+#define GUEST_TIMER_PHYS_NS_PPI 30
+#define GUEST_EVTCHN_PPI        31
+
+#define GUEST_VPL011_SPI        32
+
+/* PSCI functions */
+#define PSCI_cpu_suspend 0
+#define PSCI_cpu_off     1
+#define PSCI_cpu_on      2
+#define PSCI_migrate     3
+
+#ifndef __ASSEMBLY__
+/* Stub definition of PMU structure */
+typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
+#endif
+
+#endif /*  XEN_PUBLIC_ARCH_ARM_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 877f2f0..60af17c 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -7,6 +7,8 @@
 
 #if defined(__i386__) || defined(__x86_64__)
 #include "arch-x86/xen.h"
+#elif defined(__arm__) || defined (__aarch64__)
+#include "arch-arm.h"
 #else
 #error Bad architecture
 #endif
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
index acda592..7cf8a9d 100644
--- a/include/xtf/hypercall.h
+++ b/include/xtf/hypercall.h
@@ -22,6 +22,13 @@
 # define HYPERCALL3 _hypercall32_3
 # define HYPERCALL4 _hypercall32_4
 
+#elif defined(__aarch64__) || defined(__arm__)
+
+#include <arch/hypercall.h>
+# define HYPERCALL1 _hypercall_1
+# define HYPERCALL2 _hypercall_2
+# define HYPERCALL3 _hypercall_3
+
 #else
 # error Bad architecture for hypercalls
 #endif
@@ -48,6 +55,10 @@ extern uint8_t hypercall_page[PAGE_SIZE];
 /*
  * Hypercall primatives, compiled for the correct bitness
  */
+
+/* x86 specific hypercalls */
+#if defined(__x86_64__) || defined(__i386__)
+
 static inline long hypercall_set_trap_table(const struct xen_trap_info *ti)
 {
     return HYPERCALL1(long, __HYPERVISOR_set_trap_table, ti);
@@ -83,17 +94,6 @@ static inline long hypercall_update_descriptor(uint64_t maddr, user_desc desc)
 #endif
 }
 
-static inline long hypercall_memory_op(unsigned int cmd, void *arg)
-{
-    return HYPERCALL2(long, __HYPERVISOR_memory_op, cmd, arg);
-}
-
-static inline long hypercall_multicall(struct multicall_entry *list,
-                                       unsigned int nr)
-{
-    return HYPERCALL2(long, __HYPERVISOR_multicall, list, nr);
-}
-
 /*
  * This hypercall is misnamed in the Xen ABI, and actually operates on a
  * linear address, not a virtual address.
@@ -109,6 +109,34 @@ static inline long hypercall_update_va_mapping(
 #endif
 }
 
+static inline long hypercall_mmuext_op(const mmuext_op_t ops[],
+                                       unsigned int count,
+                                       unsigned int *done,
+                                       unsigned int foreigndom)
+{
+    return HYPERCALL4(long, __HYPERVISOR_mmuext_op,
+                      ops, count, done, foreigndom);
+}
+
+static inline long hypercall_callback_op(unsigned int cmd, const void *arg)
+{
+    return HYPERCALL2(long, __HYPERVISOR_callback_op, cmd, arg);
+}
+
+#endif /* defined(__x86_64__) || defined(__i386__) */
+
+/* Common hypercalls */
+static inline long hypercall_memory_op(unsigned int cmd, void *arg)
+{
+    return HYPERCALL2(long, __HYPERVISOR_memory_op, cmd, arg);
+}
+
+static inline long hypercall_multicall(struct multicall_entry *list,
+                                       unsigned int nr)
+{
+    return HYPERCALL2(long, __HYPERVISOR_multicall, list, nr);
+}
+
 static inline long hypercall_xen_version(unsigned int cmd, void *arg)
 {
     return HYPERCALL2(long, __HYPERVISOR_xen_version, cmd, arg);
@@ -131,25 +159,11 @@ static inline long hypercall_vcpu_op(unsigned int cmd, unsigned int vcpu,
     return HYPERCALL3(long, __HYPERVISOR_vcpu_op, cmd, vcpu, extra);
 }
 
-static inline long hypercall_mmuext_op(const mmuext_op_t ops[],
-                                       unsigned int count,
-                                       unsigned int *done,
-                                       unsigned int foreigndom)
-{
-    return HYPERCALL4(long, __HYPERVISOR_mmuext_op,
-                      ops, count, done, foreigndom);
-}
-
 static inline long hypercall_sched_op(unsigned int cmd, void *arg)
 {
     return HYPERCALL2(long, __HYPERVISOR_sched_op, cmd, arg);
 }
 
-static inline long hypercall_callback_op(unsigned int cmd, const void *arg)
-{
-    return HYPERCALL2(long, __HYPERVISOR_callback_op, cmd, arg);
-}
-
 static inline long hypercall_event_channel_op(unsigned int cmd, void *arg)
 {
     return HYPERCALL2(long, __HYPERVISOR_event_channel_op, cmd, arg);
@@ -173,6 +187,18 @@ static inline long hypercall_sysctl(xen_sysctl_t *arg)
 /*
  * Higher level hypercall helpers
  */
+
+/* x86 specific hypercall helpers */
+#if defined(__x86_64__) || defined(__i386__)
+
+static inline int hypercall_register_callback(const xen_callback_register_t *arg)
+{
+    return hypercall_callback_op(CALLBACKOP_register, arg);
+}
+
+#endif /* defined(__x86_64__) || defined(__i386__) */
+
+/* Common hypercall helpers */
 static inline void hypercall_console_write(const char *buf, unsigned long count)
 {
     (void)HYPERCALL3(long, __HYPERVISOR_console_io, CONSOLEIO_write, count, buf);
@@ -195,11 +221,6 @@ static inline long hypercall_poll(evtchn_port_t port)
     return hypercall_sched_op(SCHEDOP_poll, &poll);
 }
 
-static inline int hypercall_register_callback(const xen_callback_register_t *arg)
-{
-    return hypercall_callback_op(CALLBACKOP_register, arg);
-}
-
 static inline int hypercall_evtchn_send(evtchn_port_t port)
 {
     return hypercall_event_channel_op(EVTCHNOP_send, &port);
diff --git a/include/xtf/lib.h b/include/xtf/lib.h
index 3348464..8afdcf2 100644
--- a/include/xtf/lib.h
+++ b/include/xtf/lib.h
@@ -5,9 +5,9 @@
 #include <xtf/console.h>
 #include <xtf/types.h>
 
-#if defined(__i386__)
+#if defined(__i386__) || defined(__arm__)
 # define BYTES_PER_LONG 4
-#elif defined(__x86_64__)
+#elif defined(__x86_64__) || defined(__aarch64__)
 # define BYTES_PER_LONG 8
 #else
 # errror Bad width
@@ -36,6 +36,11 @@ void __noreturn panic(const char *fmt, ...) __printf(1, 2);
     ((void)sizeof(struct { char: -!!(cond); }))
 #endif
 
+#define UNIMPLEMENTED() do {                            \
+    panic("Unimplemented function -> %s:%u\n",          \
+          __FILE__, __LINE__);                          \
+} while(0)
+
 #define min(a, b)                                       \
     ({                                                  \
         const typeof(a) _a = (a);                       \
-- 
2.29.0


