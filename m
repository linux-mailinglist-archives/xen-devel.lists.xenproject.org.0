Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE+NGHcuD2r+HQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:10:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C7C5A8F24
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315489.1585305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5yT-00051O-12; Thu, 21 May 2026 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315489.1585305; Thu, 21 May 2026 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5yS-0004yH-TF; Thu, 21 May 2026 16:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1315489;
 Thu, 21 May 2026 16:10:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wQ5yR-0004y5-0A
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:10:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5yQ-003iNH-Co
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:10:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0f2e5d-5cb7-0a2a0a5109dd-0a2a450286d6-26
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:10:14 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0f2e65-af86-0a2a45020019-a0658309b444-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:10:13 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id A7E9E8237B6C;
 Thu, 21 May 2026 12:09:01 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 1/2] tests/native: Add native Xen test environment
Date: Thu, 21 May 2026 17:08:07 +0100
Message-Id: <7b5f434e3bf602edadd5387936b80bf3079885ec.1779379609.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779379609.git.bernhard.kaindl@citrix.com>
References: <cover.1779379609.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1779379814-837622C1-C55CBD39/0/0
X-purgate-type: clean
X-purgate-size: 109683
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: A9C7C5A8F24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a native test environment for hypercall testing that runs
without a Xen instance.

The initial focus is the page allocator (page_alloc.c) and its
hypercalls. In general, APIs testable with this environment
include:

- DOMCTL APIs via xc_domain.c, e.g. xc_domain_claim_memory().
- XENMEM APIs via xc_domain.c, e.g. xc_domain_claim_pages().
- SYSCTL APIs via xc_domain.c, e.g. xc_availheap().

The test programs build the Xen code under test into the same
compilation unit as the test case source. This gives the tests
full control over the environment and allows selected functions
to be stubbed, mocked, or wrapped as required by the scenario
under test.

For the runtime buddy allocator in page_alloc.c, the environment
creates a synthetic Xen heap. Each test program can define a Xen
configuration, for example whether CONFIG_NUMA and CONFIG_SYSCTL
are enabled. The test cases populate the free lists individually
for each test scenario as needed and can check the heap state.

For testing new code across multiple target architectures, the
harness supports cross-compilation of both the tests and the
code under test for x86_64, arm64, arm32, and riscv64 by passing
cross=y to the build.

If binfmt-misc and qemu-user-static are configured, the
cross-compiled test programs can also be run. Where supported,
clang-based builds are automatically added to the test matrix.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/Makefile                          |   1 +
 tools/tests/native/.gitignore                 |   4 +
 tools/tests/native/Makefile                   | 206 +++++++++++
 tools/tests/native/README.rst                 | 166 +++++++++
 tools/tests/native/harness/common.h           | 280 +++++++++++++++
 tools/tests/native/harness/domctl-shim.h      | 228 ++++++++++++
 tools/tests/native/harness/domctl-wrapper.h   |  28 ++
 tools/tests/native/harness/memory-shim.h      | 201 +++++++++++
 tools/tests/native/harness/memory-wrapper.h   |  42 +++
 tools/tests/native/harness/mm-wrapper.h       | 118 +++++++
 tools/tests/native/harness/native.h           |  81 +++++
 tools/tests/native/harness/page-alloc-env.h   | 254 ++++++++++++++
 tools/tests/native/harness/page-alloc-shim.h  | 328 ++++++++++++++++++
 tools/tests/native/harness/sysctl-shim.h      | 155 +++++++++
 tools/tests/native/harness/sysctl-wrapper.h   |  38 ++
 tools/tests/native/harness/testcase-asserts.h | 310 +++++++++++++++++
 tools/tests/native/harness/xc-domain-env.h    |  77 ++++
 tools/tests/native/harness/xen-macros.h       | 118 +++++++
 tools/tests/native/harness/xenctrl-shim.h     | 170 +++++++++
 19 files changed, 2805 insertions(+)
 create mode 100644 tools/tests/native/.gitignore
 create mode 100644 tools/tests/native/Makefile
 create mode 100644 tools/tests/native/README.rst
 create mode 100644 tools/tests/native/harness/common.h
 create mode 100644 tools/tests/native/harness/domctl-shim.h
 create mode 100644 tools/tests/native/harness/domctl-wrapper.h
 create mode 100644 tools/tests/native/harness/memory-shim.h
 create mode 100644 tools/tests/native/harness/memory-wrapper.h
 create mode 100644 tools/tests/native/harness/mm-wrapper.h
 create mode 100644 tools/tests/native/harness/native.h
 create mode 100644 tools/tests/native/harness/page-alloc-env.h
 create mode 100644 tools/tests/native/harness/page-alloc-shim.h
 create mode 100644 tools/tests/native/harness/sysctl-shim.h
 create mode 100644 tools/tests/native/harness/sysctl-wrapper.h
 create mode 100644 tools/tests/native/harness/testcase-asserts.h
 create mode 100644 tools/tests/native/harness/xc-domain-env.h
 create mode 100644 tools/tests/native/harness/xen-macros.h
 create mode 100644 tools/tests/native/harness/xenctrl-shim.h

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 6477a4386dda..2b7af7606992 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -16,6 +16,7 @@ SUBDIRS-$(CONFIG_X86) += tsx
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
+SUBDIRS-$(CONFIG_X86) += native
 
 .PHONY: all clean install distclean uninstall
 all clean distclean install uninstall: %: subdirs-%
diff --git a/tools/tests/native/.gitignore b/tools/tests/native/.gitignore
new file mode 100644
index 000000000000..d33db3518337
--- /dev/null
+++ b/tools/tests/native/.gitignore
@@ -0,0 +1,4 @@
+*.x86_64*
+*.arm32*
+*.arm64*
+*.riscv64*
diff --git a/tools/tests/native/Makefile b/tools/tests/native/Makefile
new file mode 100644
index 000000000000..04cbd5d2776b
--- /dev/null
+++ b/tools/tests/native/Makefile
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Makefile for building and running the native tests.
+XEN_ROOT := $(abspath $(CURDIR)/../../..)
+obj      := .
+src      := .
+srctree  := $(XEN_ROOT)/xen
+objtree  := $(XEN_ROOT)/xen
+export srctree objtree
+
+# Load Per-architecture CFLAGS
+define LOAD_ARCH_CFLAGS
+	CFLAGS :=
+	include $(XEN_ROOT)/config/$(1).mk
+	ARCH_CFLAGS_$(1) := $$(CFLAGS)
+endef
+$(foreach arch,$(TEST_ARCHS), \
+	$(eval $(call LOAD_ARCH_CFLAGS,$(arch))))
+
+# Include Xen rules and Kbuild infrastructure
+include $(XEN_ROOT)/tools/Rules.mk
+include $(XEN_ROOT)/xen/scripts/Kbuild.include
+
+# For recursive make calls, don't print the Entering/Leaving messages here.
+MAKEFLAGS += --no-print-directory
+
+# Define SRCARCH and SUBPATH for the Kbuild infrastructure
+define srcarch
+$(subst _,,$(subst 32,,$(subst 64,,$(1))))
+endef
+SRCARCH := $(call srcarch,$(XEN_TARGET_ARCH))
+SUBPATH := $(subst $(XEN_ROOT)/,,$(CURDIR))
+
+# Common CFLAGS for building the tests
+# filter-out -m64
+COMMON_CFLAGS := $(filter-out $(ARCH_CFLAGS_$(XEN_TARGET_ARCH)),$(CFLAGS))
+COMMON_CFLAGS += -D__XEN_TOOLS__ $(APPEND_CFLAGS)
+COMMON_CFLAGS += -D_SUBPATH_=\"$(SUBPATH)\"
+COMMON_CFLAGS += -I$(srctree)/include
+COMMON_CFLAGS += $(CFLAGS_xeninclude)
+
+ifdef TARGETS
+# make test TARGETS="host-claims another-test"
+TEST_SOURCES := $(addsuffix .c,$(TARGETS))
+else
+TEST_SOURCES := $(notdir $(wildcard *.c))
+endif
+
+# Requested architectures
+TEST_ARCHS := x86_64 arm64 arm32 riscv64
+
+# GNU target triples for clang and gcc
+TARGET_TRIPLE_arm64   := aarch64-linux-gnu
+TARGET_TRIPLE_arm32   := arm-linux-gnueabihf
+TARGET_TRIPLE_x86_64  := x86_64-linux-gnu
+TARGET_TRIPLE_riscv64 := riscv64-linux-gnu
+
+ifeq ($(cross),y)
+ifneq ($(filter test run,$(MAKECMDGOALS)),)
+BINFMT_SUPP := $(if $(wildcard /etc/init.d/binfmt-support),1,0)
+QEMU_BINFMT := $(if $(wildcard /usr/libexec/qemu-binfmt),1,0)
+ifneq ($(BINFMT_SUPP)$(QEMU_BINFMT),11)
+$(error "Cross-testing requires binfmt-support and qemu-user-static")
+endif
+endif
+endif
+
+# Detect and select the found cross compilers if enabled with cross=y
+ifneq ($(cross),y)
+ SUPPORTED_ARCHS := $(XEN_TARGET_ARCH)
+else
+ ifneq ($(clang),y)
+  define HAVE_GCC
+   $(if $(shell command -v $(TARGET_TRIPLE_$(1))-gcc 2>/dev/null),$(1))
+  endef
+ endif
+ define HAVE_CLANG
+  $(if $(shell echo 'int main(){}' | clang --target=$(TARGET_TRIPLE_$(1)) -x \
+               c - -o /dev/null >/dev/null 2>&1 && echo y),$(1)-clang)
+ endef
+ SUPPORTED_ARCHS := $(foreach arch,$(TEST_ARCHS),$(call HAVE_GCC,$(arch))) \
+		    $(foreach arch,$(TEST_ARCHS),$(call HAVE_CLANG,$(arch)))
+endif
+$(SUPPORTED_ARCHS):
+	@$(MAKE) XEN_TARGET_ARCH=$(patsubst %-clang,%,$@) build-$@
+
+$(addprefix make-output-,$(SUPPORTED_ARCHS)):
+	@$(MAKE) XEN_TARGET_ARCH=$(patsubst %-clang,%,$(@:make-output-%=%)) \
+		 output-$(@:make-output-%=%)
+
+define ARCH_template
+ARCH_$(1) := $$(patsubst %-clang,%,$(1))
+SRCARCH_$(1) := $$(call srcarch,$$(ARCH_$(1)))
+TEST_SOURCES_$(1) := $$(TEST_SOURCES)
+ifneq ($$(ARCH_$(1)),x86_64)
+# node-claims.c relies on NUMA (only available on x86_64 for now)
+TEST_SOURCES_$(1) := $$(filter-out node-claims.c,$$(TEST_SOURCES_$(1)))
+endif
+
+OBJ_$(1) := $$(addprefix $(obj)/,$$(TEST_SOURCES_$(1):.c=.$(1).o))
+BIN_$(1) := $$(addprefix $(obj)/,$$(TEST_SOURCES_$(1):.c=.$(1)))
+OUTPUT_$(1) := $$(addprefix $(obj)/,$$(TEST_SOURCES_$(1):.c=.$(1).out))
+ALL_BINS += $$(BIN_$(1))
+ALL_OUTPUTS += $$(OUTPUT_$(1))
+
+ifeq ($$(filter %-clang,$(1)),)
+# GCC build
+$$(OBJ_$(1)) $$(BIN_$(1)): CROSS_COMPILE := $$(TARGET_TRIPLE_$$(ARCH_$(1)))-
+else
+$$(OBJ_$(1)) $$(BIN_$(1)): CC := clang
+$$(OBJ_$(1)) $$(BIN_$(1)): CLANG_FLAGS := -fdiagnostics-absolute-paths \
+	--target=$$(TARGET_TRIPLE_$$(ARCH_$(1)))
+endif
+
+DEPS += $(subst ./,.,$(OBJ_$(1):.o=.o.d))
+O_CFLAGS_$$(ARCH_$(1)) := $$(COMMON_CFLAGS) $$(ARCH_CFLAGS_$$(ARCH_$(1)))
+O_CFLAGS_$$(ARCH_$(1)) += -I$(srctree)/arch/$$(SRCARCH_$(1))/include
+O_CFLAGS_$$(ARCH_$(1)) += -I$(objtree)/arch/$$(SRCARCH_$(1))/include/generated
+
+ifeq ($$(ARCH_$(1)),$(XEN_COMPILE_ARCH))
+O_CFLAGS_$$(ARCH_$(1)) += -fsanitize=address -fno-omit-frame-pointer
+else
+O_CFLAGS_$$(ARCH_$(1)) += -static
+endif
+
+$(obj)/%.$(1).o: $(src)/%.c
+	$(Q)$$(CC) $$(CLANG_FLAGS) -c -o $$@ $$< $$(O_CFLAGS_$$(ARCH_$(1)))
+
+$(obj)/%.$(1): $(obj)/%.$(1).o
+	$(Q)$$(CC) $$(CLANG_FLAGS) -o $$@ $$< \
+		$$(LDFLAGS) $$(O_CFLAGS_$$(ARCH_$(1)))
+	@echo "Built $(SUBPATH)/$$@" >> $$(obj)/$(1).result
+
+# Create the .out files by running the test binaries and capturing their output.
+$(obj)/%.$(1).out: $(obj)/%.$(1) FORCE
+	@echo "\nRunning $$< $(RUN_ARGS)to generate $$@..."
+	@./$$< $(RUN_ARGS) >$$@ 2>&1 || \
+	 (sed 's/^/> /' $$@; echo "Test $$< failed"; exit 1)
+	@echo "\n$(SUBPATH)/$$< was successful: $$< output:"
+	@sed 's/^/| /' $$@
+	@tail -1 $$@ >> $$(obj)/$(1).result
+	@$(RM) $$< $$<.o*
+
+# Can only be used with XEN_TARGET_ARCH set to the appropriate architecture:
+# e.g. make XEN_TARGET_ARCH=arm64 build-arm64
+
+.PHONY: $(objtree)/arch/$$(SRCARCH_$(1))/include/generated/asm
+$(objtree)/arch/$$(SRCARCH_$(1))/include/generated/asm::
+	$(Q)$(MAKE) $(asm-generic)=$$@ XEN_TARGET_ARCH=$$(ARCH_$(1))
+
+.PHONY: setup-$(1)
+setup-$(1): $(objtree)/arch/$$(SRCARCH_$(1))/include/generated/asm
+
+.PHONY: build-$(1)
+build-$(1): setup-$(1) $$(BIN_$(1))
+
+.PHONY: output-$(1)
+output-$(1): $$(OUTPUT_$(1))
+
+.PHONY: clean-$(1)
+clean-$(1): $(objtree)/arch/$$(SRCARCH_$(1))/include/generated/asm
+	$(Q)$(RM) -- $$(OBJ_$(1)) $$(BIN_$(1)) $$(OUTPUT_$(1))
+endef
+$(foreach arch,$(SUPPORTED_ARCHS), $(eval $(call ARCH_template,$(arch))))
+
+.PHONY: all run test
+run test: all
+	@:
+# Allow the build to run in parallel with clean before and after, and reporting.
+all: setup
+	$(Q)$(MAKE) clean
+	$(Q)$(MAKE) $(MFLAGS) $(SUPPORTED_ARCHS)
+	@sort $(obj)/*.result
+	@$(RM) $(obj)/*.result
+# If the goal also has run or test in it, run the tests after building.
+ifneq ($(filter run test,$(MAKECMDGOALS)),)
+	$(Q)$(MAKE) $(addprefix make-output-,$(SUPPORTED_ARCHS))
+	@sort $(obj)/*.result
+	@$(RM) $(obj)/*.result ..d
+endif
+
+.PHONY: setup
+setup: $(XEN_ROOT)/tools/include/xen/xen.h
+$(XEN_ROOT)/tools/include/xen/xen.h:
+	@$(MAKE) -C $(XEN_ROOT)/tools/include all
+
+.PHONY: clean clean-archs
+clean-archs: $(addprefix clean-,$(SUPPORTED_ARCHS))
+clean: clean-archs
+	@$(RM) -v -- *.o $(TARGETS) $(DEPS_RM)
+
+.PHONY: postclean-test
+postclean-test: test clean
+
+.PHONY: distclean
+distclean: clean
+	$(Q)$(RM) -- *~
+
+.PHONY: install
+install: all
+	@echo "install: No install; the source is tested, not another Xen host"
+
+.PHONY: uninstall
+uninstall:
+
+-include $(DEPS)
diff --git a/tools/tests/native/README.rst b/tools/tests/native/README.rst
new file mode 100644
index 000000000000..c98552cc4a66
--- /dev/null
+++ b/tools/tests/native/README.rst
@@ -0,0 +1,166 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Native Xen Test Harness
+=======================
+
+Native test environment for Xen, initially focused on the hypercall
+API and exercising the page allocator APIs in native test programs.
+Available APIs include:
+
+- ``DOMCTL`` APIs via ``xc_domain.c``, e.g. ``xc_domain_claim_memory()``.
+- ``XENMEM`` APIs via ``xc_domain.c``, e.g. ``xc_domain_claim_pages()``.
+- ``SYSCTL`` APIs via ``xc_domain.c``, e.g. ``xc_availheap()``.
+
+Each test executable builds the Xen code under test into the same
+compilation unit as the test case source. This gives the tests full
+control over the environment and allows selected functions to be
+stubbed, mocked, or wrapped for the scenario under test.
+
+For the buddy allocator in ``page_alloc.c``, the environment creates
+a synthetic Xen heap. Each test case populates the free lists as needed
+for the scenario under test, and the test cases can check the resulting
+state of the heap after exercising the code under test.
+
+As the code under test is built as a native executable, all advantages
+of native execution are available. The test cases can wrap selected
+functions, and the resulting test programs can be debugged directly
+using ``printf``-style diagnostics. For not cross-compiled builds,
+``AddressSanitizer`` is enabled as well. Cross-compiled builds use
+static binaries that can be run on the host using Linux ``binfmt-misc``
+and ``qemu-user-static`` support.
+
+Harness Shape
+-------------
+
+The harness lives under ``tools/tests/native/harness``. Its main role
+is to provide the Xen runtime environment required by the code under
+test.
+
+The harness uses real Xen headers and definitions wherever possible.
+It does not attempt to replicate Xen internals or maintain local
+copies when they can be avoided. This ensures that the tests always
+use the real definitions and minimises the maintenance burden of
+keeping them in sync.
+
+In particular, it includes 16 Xen headers, including the core headers
+that provide the fundamental data structures and definitions used by
+the code under test. These include central Xen headers such as:
+
+- ``public/xen.h``
+- ``xen/compiler.h``
+- ``xen/config.h``
+- ``xen/domain.h``
+- ``xen/kernel.h``
+- ``xen/macros.h``
+- ``xen/mm.h``
+- ``xen/nospec.h``
+- ``xen/numa.h``
+- ``xen/page-size.h``
+- ``xen/sched.h``
+- ``xen/typesafe.h``
+- ``xenctrl.h``
+
+The remaining shims are intentionally limited to runtime state for
+the test context and the minimal set of shims and stubs needed to
+support the code under test, such as:
+
+- Synthetic heap setup and management
+- Guest-copy helpers backed by host memory copies
+- PDX/frame-table translations matching the synthetic heap
+- Shims for code not yet used by the tests
+
+This keeps Xen definitions in Xen headers wherever possible and
+limits the harness primarily to modelling the execution environment.
+
+How Tests Work
+--------------
+
+Each test case starts from a clean allocator state and initialises a
+synthetic frame table with pages on the free lists. After the
+allocator operations under test, each scenario checks the resulting
+state using assertion helpers.
+
+As running the tests after a change takes only a few seconds, they
+can be used as a quick regression check during development. The test
+cases can also be extended easily to cover new scenarios, and code
+coverage tools can be integrated straightforwardly.
+
+Running The Tests
+-----------------
+
+The ``Makefile`` automatically discovers the C test programs in this
+directory and builds one executable per source file.
+
+The ``test`` target executes the built tests when they are runnable
+on the build host. If ``CC`` and ``HOSTCC`` differ, execution is only
+attempted when ``binfmt`` support for the target architecture is
+available.
+
+Example to clean, build, and run the tests for the default target
+architecture:
+
+.. code:: shell
+
+    make -C tools/tests/native clean test
+
+To build and run a single test program:
+
+.. code:: shell
+
+    make -C tools/tests/native test TARGETS=host-claims
+
+To build and run a given test program with specific arguments:
+
+.. code:: shell
+
+    make -C tools/tests/native test TARGETS=host-claims RUN_ARGS=CNGS
+
+In this example, ``CNGS`` is a test case defined in the ``host-claims.c``
+source file. The test binary is built and executed with ``CNGS`` as an
+argument, causing it to run only that scenario instead of all scenarios
+in the source file. This is useful when working on a specific test case.
+
+Cross-tests
+^^^^^^^^^^^
+
+For broad coverage, the ``test`` target builds and runs the tests for
+all active Xen target architectures when suitable cross-compilers are
+installed. On Debian-based systems, the required cross-compilers can
+be installed with:
+
+.. code:: shell
+
+    sudo apt install -y \
+        gcc-{aarch64,riscv64}-linux-gnu \
+        gcc-arm-linux-gnueabihf
+
+The ``test`` target provides a convenient way to build and run all tests
+for multiple Xen target architectures. This is useful for broader coverage
+and for catching regressions that may only appear on specific architectures.
+
+For target architectures that are not directly executable on the
+host, Linux ``binfmt`` and ``qemu-user-static`` support are required
+so the built test executables can run. On Debian-based systems, these
+can be installed with:
+
+.. code:: shell
+
+    sudo apt install -y binfmt-support qemu-user-static
+
+To obtain broad coverage across multiple Xen target architectures,
+pass ``cross=y`` with the ``test`` target to build and run the tests
+for all supported Xen target architectures with detected
+cross-compilers:
+
+.. code:: shell
+
+    make -C tools/tests/native test cross=y
+
+To build and run tests for a specific Xen target architecture:
+
+.. code:: shell
+
+    make -C tools/tests/native test TEST_ARCHS=x86_64
+    make -C tools/tests/native test TEST_ARCHS=arm64
+    make -C tools/tests/native test TEST_ARCHS=arm32
+    make -C tools/tests/native test TEST_ARCHS=riscv64
diff --git a/tools/tests/native/harness/common.h b/tools/tests/native/harness/common.h
new file mode 100644
index 000000000000..1324368bf7d8
--- /dev/null
+++ b/tools/tests/native/harness/common.h
@@ -0,0 +1,280 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Common test harness for page allocation unit tests.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef TOOLS_TESTS_ALLOC_HARNESS_H
+#define TOOLS_TESTS_ALLOC_HARNESS_H
+
+/* Assertion helpers shared by the tests. */
+#include "testcase-asserts.h"
+
+/* Configure the Xen code for the test context */
+#define CONFIG_DEBUG
+#define COMPILE_OFFSETS
+#ifdef __x86_64__
+#define __ASM_I386_CPUFEATURE_H
+#define __XEN_X86_CPUFEATURESET_H__
+#define _X86_BITOPS_H
+#define X86_FEATURE_XEN_SMAP 0
+#endif
+#define CONFIG_MMU
+#ifdef __arm__
+#define CONFIG_ARM_32
+#define CONFIG_PADDR_BITS 40
+#endif
+#ifdef __aarch64__
+#define CONFIG_ARM_64
+#define CONFIG_PADDR_BITS 48
+#endif
+#ifdef __riscv
+#define CONFIG_RISCV_64
+#define CONFIG_QEMU_PLATFORM
+#endif
+
+#define CONFIG_NR_CPUS 2048
+#if defined(CONFIG_NUMA) && !defined(CONFIG_NR_NUMA_NODES)
+/* Xen supports at least 64 nodes. New HW can have a lot more memory nodes. */
+#define CONFIG_NR_NUMA_NODES 254 /* 255(0xFF) is reserved for NUMA_NO_NODE. */
+#endif
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
+/* Header guards we always need to block (configuration-independent)*/
+#define __ARM_CURRENT_H__
+#define __ASM_X86_X86_EMULATE_H__
+#define __X86_CURRENT_H__
+#define __XEN_IOCAP_H__
+#define __XEN_PAGING_H__
+#define __XEN_RCUPDATE_H
+#define __XSM_H__
+
+/* Blocking P2M headers needs fewer shims than including them */
+#define _XEN_P2M_H
+#define _XEN_ASM_X86_P2M_H
+#define ASM__RISCV__P2M_H
+#define map_mmio_regions(d, gfn, nr, mfn)   0
+#define unmap_mmio_regions(d, gfn, nr, mfn) 0
+struct p2m_domain { int dummy; }; /* riscv */
+
+/* Common Xen types used by the test environment. */
+/* Short integer types (xen/types.h blocked by __TYPES_H__) */
+typedef uint8_t u8;
+typedef uint16_t u16;
+typedef uint32_t u32;
+typedef uint64_t u64;
+typedef uint16_t __be16;
+typedef uint32_t __be32;
+typedef uint64_t __be64;
+typedef uint16_t __le16;
+typedef uint32_t __le32;
+typedef uint64_t __le64;
+typedef unsigned long cpumask_t;
+typedef long long s_time_t;
+typedef bool spinlock_t;
+typedef spinlock_t rwlock_t;
+typedef spinlock_t rspinlock_t;
+typedef spinlock_t percpu_rwlock_t;
+
+#define __XEN_BITMAP_H
+#ifndef BITS_TO_LONGS
+#define BITS_TO_LONGS(bits) (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
+#endif
+#ifndef DECLARE_BITMAP
+#define DECLARE_BITMAP(name, bits) unsigned long name[BITS_TO_LONGS(bits)]
+#endif
+
+/*
+ * If testcase_assert_verbose_assertions is enabled, the spinlock
+ * functions print the spinlock being acquired or released along with
+ * the file and line number of the assertion that triggered it.
+ * This can be helpful for debugging test failures and understanding
+ * the sequence of events leading up to the failure.
+ */
+#define spin_lock(l)              ((void)(l))
+#define spin_unlock(l)            ((void)(l))
+#define spin_lock_cb(l, cb, data) spin_lock(l)
+#define spin_lock_kick()          ((void)0)
+#define nrspin_lock(l)            spin_lock(l)
+#define nrspin_unlock(l)          spin_unlock(l)
+#define rspin_lock(l)             spin_lock(l)
+#define rspin_unlock(l)           spin_unlock(l)
+#define read_lock(rwl)            spin_lock(rwl)
+#define read_unlock(rwl)          spin_unlock(rwl)
+#define read_trylock(rwl)         (spin_lock(rwl), true)
+#define write_lock(rwl)           spin_lock(rwl)
+#define write_unlock(rwl)         spin_unlock(rwl)
+/*
+ * For the test context, we assume all locks are always held to avoid having
+ * to manage lock state in the test helpers.  This allows the test helpers
+ * to call allocator functions that require locks to be held without needing
+ * to acquire those locks, which simplifies the test code and focuses on
+ * exercising the allocator logic under test.
+ *
+ * Invariants that would normally be protected by locks must still be upheld
+ * by the test helpers, but the test helpers can assume they have exclusive
+ * access to the allocator state and do not need to worry about concurrency.
+ */
+#define rw_is_locked(rwl)         true
+#define rw_is_write_locked(rwl)   true
+#define spin_is_locked(l)         true
+#define rspin_is_locked(l)        true
+#define DEFINE_SPINLOCK(l)        spinlock_t l
+
+/* Heap allocator stubs */
+#define __XMALLOC_H__
+#define xmalloc(type)             calloc(1, sizeof(type))
+#define xmalloc_array(type, nr)   calloc((nr), sizeof(type))
+#define xvzalloc_array(type, nr)  calloc((nr), sizeof(type))
+#define xzalloc(type)             calloc(1, sizeof(type))
+#define xfree(p)                  free(p)
+#define xvfree(p)                 free(p)
+
+/* xvmalloc_array supports both 2-arg (type, n) used by page_alloc.c and
+ * 3-arg (type, rows, cols) used by domctl.c via a variadic helper.
+ * The helper appends a sentinel '1' so the 2-arg form multiplies by 1. */
+#define xvmalloc_array(type, ...)    _xvmalloc_impl(type, __VA_ARGS__, 1)
+#define _xvmalloc_impl(t, a, b, ...) calloc((size_t)(a) * (size_t)(b), \
+                                            sizeof(t))
+
+/*
+ * Use the real guest_access functions and provide stubs for
+ * xen/asm-x86/guest_access.h's __raw_copy_{to,from}_guest() functions
+ * which are used by the high-level copy_{to,from}_guest*() functions.
+ */
+#define __X86_UACCESS_H__
+#define __ASM_X86_GUEST_ACCESS_H__
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
+{
+    memcpy(to, from, len);
+    return 0;
+}
+#define __raw_copy_to_guest raw_copy_to_guest
+unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
+                                             unsigned int len)
+{
+    memcpy(to, from, len);
+    return 0;
+}
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned int len)
+{
+    memcpy(to, from, len);
+    return 0;
+}
+#define __raw_copy_from_guest raw_copy_from_guest
+unsigned long raw_clear_guest(void *to, unsigned int len)
+{
+    memset(to, 0, len);
+    return 0;
+}
+
+/* nodemask support for the test environment. */
+#define nodes_intersects(a, b)    ((a) & (b))
+#define nodes_and(dst, a, b)      ((dst) = (a) & (b))
+#define nodes_andnot(dst, a, b)   ((dst) = (a) & ~(b))
+#define nodes_clear(dst)          ((dst) = 0)
+#define nodemask_test(node, mask) ((*(mask) >> (node)) & 1UL)
+#define node_set(node, mask)      ((mask) |= (1UL << (node)))
+#define node_clear(node, mask)    ((mask) &= ~(1UL << (node)))
+#define nodemask_bits(maskp)      ((unsigned long *)(maskp))
+#define node_test_and_set(node, mask)                   \
+        ({                                              \
+             bool was_set = nodemask_test(node, &mask); \
+             node_set(node, mask);                      \
+             was_set;                                   \
+         })
+#define for_each_online_node(i)   for ( (i) = 0; (i) < MAX_NUMNODES; ++(i) )
+#define for_each_cpu(i, mask)     for ( (i) = 0; (i) < 1; ++(i) )
+#define alternative(a, b, c)      ((void)(a), (void)(b))
+#define DECLARE_PER_CPU(type, name) static __used type shim_per_cpu__##name
+static cpumask_t cpu_online_map = ~0UL;
+
+/*
+ * PDX compression not yet actively used for the synthetic heap of the tests.
+ * Use a small identity PDX bridge because pulling in full xen/pdx.h would
+ * bring compressed-PDX runtime tables that the lib does not initialise yet.
+ *
+ * That is a deliberate shim boundary to allow testing without needing to
+ * support PDX runtime in the test harness.  The test cases can use the
+ * mfn_to_pdx and pdx_to_mfn helpers to work with PDX values, and the test
+ * harness will track the valid range of PDX values based on the frame_table
+ * size and the MFNs of the test pages that are initialised during the tests,
+ * but the PDX values are not actually compressed in the test harness.
+ */
+#define mfn_to_pdx(mfn) mfn_x(mfn)
+#define pdx_to_mfn(pdx) _mfn(pdx)
+#define page_to_pdx(pg) ((unsigned long)((pg) - frame_table))
+#define pdx_to_page(pdx) (frame_table + (pdx))
+#define __mfn_valid(mfn) true
+
+/* tlbflush.h */
+#define per_cpu(a, b) (0)
+bool tlb_clk_enabled;
+u32 tlbflush_clock;
+#define tlbflush_time 0U
+#define __cpumask_clear_cpu(cpu, mask) ((void)(cpu), (void)(mask))
+
+#ifdef __x86_64__
+#define cpu_has_cx16 true
+#define cpu_relax()                         ((void)0)
+#define test_and_clear_bit(nr, addr)                         \
+        ({                                                   \
+             bool was_set = test_bit((nr), (addr));          \
+             *(addr) &= ~(1UL << (nr));                      \
+             was_set;                                        \
+         })
+unsigned int attr_const generic_flsl(unsigned long x)
+{
+    return ((x) ? (sizeof(long) * 8) - __builtin_clzl(x) : 0);
+}
+unsigned int attr_const generic_ffsl(unsigned long x)
+{
+    return __builtin_ffsl((long)(x));
+}
+#else
+void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    (void)mfn;
+    (void)sync_icache;
+}
+#endif
+
+/*
+ * Some functions need to use types defined in specific headers,
+ * so we include them and define header guards to prevent unwanted
+ * definitions from those headers that conflict with the test harness
+ * or bring in Xen-internal structures that are already provided by
+ * the natural C compiler defines, libc defines and stubs in this shim.
+ */
+#define __TYPES_H__
+#define __LIB_H__ /* C runtime library, only for the hypervisor */
+#define XEN_SOFTIRQ_H
+#define XEN__XVMALLOC_H
+#define _LINUX_INIT_H
+#define __LINUX_NODEMASK_H
+#define __RWLOCK_H__
+#define __XEN_SMP_H__
+#define __XEN_BUG_H__
+#define __XEN_ERRNO_H__
+#define _TIMER_H_
+#define __XEN_PERCPU_H__
+#define __XEN_STRING_H__
+#define __XEN_TIME_H__
+#define __XEN_RCUPDATE_H
+#define __XEN_PREEMPT_H__
+#define __XEN_TASKLET_H__
+#define __XEN_PERFC_H__
+#define __SPINLOCK_H__
+#define __VM_EVENT_H__
+#define __XEN_EVENT_H__
+#define __XEN_CPUMASK_H
+#define __XEN_IRQ_H__
+#define __XEN_PDX_H__
+#define __ASM_DOMAIN_H__
+#define __X86_ALTERNATIVE_H__
+#endif
diff --git a/tools/tests/native/harness/domctl-shim.h b/tools/tests/native/harness/domctl-shim.h
new file mode 100644
index 000000000000..36dfe2bd8edb
--- /dev/null
+++ b/tools/tests/native/harness/domctl-shim.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Minimal shim to include xen/common/domctl.c in native program tests.
+ *
+ * This shim provides the minimal Xen definitions that domctl.c
+ * needs to run in a native program test environment.  It replaces a
+ * minimal subset of the Xen environment that xen/common/domctl.c
+ * interacts with with stubs so it can run in the test environment,
+ * allowing test scenarios to verify the behavior of domctl.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef _TEST_ALLOC_DOMCTL_SHIM_
+#define _TEST_ALLOC_DOMCTL_SHIM_
+
+/*
+ * Guard against language servers and linters picking up this header.
+ *
+ * This shim is intended to be used in test programs for testing
+ * the code of xen/common/domctl.c in a native program test environment,
+ * and test programs need to define TEST_WRAP_XEN_COMMON_DOMCTL_C
+ * to enable the definitions in this header.
+ */
+#ifndef TEST_WRAP_XEN_COMMON_DOMCTL_C
+#warning "Include this header only in integration tests using domctl.c"
+#else
+
+/*
+ * Inside the intended test context, provide stub definitions.
+ *
+ * Some functions need to use types defined in specific headers,
+ * so we include them and define header guards to prevent unwanted
+ * definitions from those headers that conflict with the test harness
+ * or bring in Xen-internal structures that are already provided by
+ * the natural C compiler defines, libc defines and stubs in this shim.
+ */
+
+/* Include xen/domain.h for types required by the stubs below. */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+/* Header guards to block not yet supported domain.h includes */
+#define __XEN_ERRNO_H__
+#define __ASM_DOMAIN_H__
+#define __RWLOCK_H__
+#include <xen/domain.h>
+#pragma GCC diagnostic pop
+
+#ifdef __XEN_FRAME_NUM_H__ /* x86_64 header differnce */
+#define mfn_to_gfn(d, mfn)   ((void)(d), _gfn(mfn_x(mfn)))
+#endif
+
+/* bitmap_to/from_xenctl_bitmap are in xen/bitmap.h (blocked).
+ * Stub them as no-ops; domctl.c uses them only for NUMA info export. */
+#define bitmap_to_xenctl_bitmap(d, s, n) 0
+#define xenctl_bitmap_to_bitmap(d, s, n) 0
+
+/* Domain dying states (normally in xen/sched.h, blocked by __SCHED_H__) */
+#define DOMDYING_alive 0U
+#define DOMDYING_dying 1U
+#define DOMDYING_dead  2U
+
+/* vcpu_runstate_info is now provided by xen/sched.h (via public/vcpu.h) */
+#define RUNSTATE_running 0
+#define vcpu_runstate_get(v, r) ((void)(v), memset((r), 0, sizeof(*(r))))
+
+/* vcpu iteration: no vCPUs in the test context */
+/* for_each_vcpu is provided by xen/sched.h; override with test stub */
+#undef for_each_vcpu
+#define for_each_vcpu(d, v) for ( (v) = NULL; (v) != NULL; )
+
+/* Domain predicates not derived from any included header */
+#define is_hvm_domain(d) false
+#define cpupool_get_id(d) 0
+
+/* spin_trylock: in the test context all locks are always available */
+#define spin_trylock(l) (spin_lock(l), true)
+
+/* XSM hooks: permit all operations in the test context */
+#define XSM_OTHER                         0
+#define XSM_XS_PRIV                       0
+#define XSM_HOOK                          0
+#define XSM_PRIV                          0
+#define xsm_security_domaininfo(d, info)  ((void)(d), (void)(info))
+#define xsm_domctl(xsm, d, ...)           0
+#define xsm_getdomaininfo(xsm, d)         0
+#define xsm_irq_permission(xsm, d, ...)   0
+#define xsm_iomem_permission(xsm, d, ...) 0
+#define xsm_iomem_mapping(xsm, d, ...)    0
+#define xsm_set_target(xsm, d, e)         0
+#define xsm_claim_pages(xsm, d)           0
+
+/* XEN_DOMCTL_soft_reset_cont is inside #ifdef __XEN__ in public/domctl.h */
+#ifndef XEN_DOMCTL_soft_reset_cont
+#define XEN_DOMCTL_soft_reset_cont 23
+#endif
+
+/* physical address bit-width of the hypervisor */
+#define paddr_bits PADDR_BITS
+
+/* vcpu_guest_context allocation helpers */
+#define alloc_vcpu_guest_context()  calloc(1, sizeof(struct vcpu_guest_context))
+#define free_vcpu_guest_context(p)  free(p)
+
+/* Domain lifecycle stubs */
+#define domain_pause(d)                          ((void)(d))
+#define domain_unpause(d)                        ((void)(d))
+#define domain_resume(d)                         ((void)(d))
+#define domain_kill(d)                           0
+#define domain_soft_reset(d, cont)               (-ENOSYS)
+#define domain_create(id, cfg, hvm)              ((struct domain *)NULL)
+#define domain_update_node_affinity(d)           ((void)(d))
+#define domain_set_node_affinity(d, mask)        0
+#define domain_pause_by_systemcontroller(d)      0
+#define domain_unpause_by_systemcontroller(d)    0
+#define domain_set_time_offset(d, off)           ((void)(d))
+#define get_domain_by_id(id)                     ((struct domain *)NULL)
+#define hypercall_create_continuation(...)       0
+
+/* vCPU stubs */
+#define vcpu_pause(v)      ((void)(v))
+#define vcpu_unpause(v)    ((void)(v))
+
+/* Scheduling / affinity stubs */
+#define sched_adjust(d, op)               0
+#define vcpu_affinity_domctl(d, cmd, aff) 0
+
+/* IOMEM and MMIO stubs */
+#define iomem_access_permitted(d, ...)      false
+#define iomem_permit_access(d, ...)         0
+#define iomem_deny_access(d, ...)           0
+#define paging_mode_translate(d)            false
+#define is_hardware_domain(d)               false
+#define is_xenstore_domain(d)               false
+
+/* Misc domctl sub-operation stubs */
+#define vm_event_domctl(d, op)            (-EOPNOTSUPP)
+#define set_global_virq_handler(d, virq)  0
+#define iommu_do_domctl(op, d, u)         (-EOPNOTSUPP)
+#define get_domain_state(st, d, id)       (-EOPNOTSUPP)
+#define arch_do_domctl(op, d, u)          (-EOPNOTSUPP)
+
+/* Provide no-op stubs for these */
+domid_t domid_alloc(domid_t domid)
+{
+    return domid;
+}
+
+/* For do_domctl() to work with multiple domains for testing claims */
+struct domain *rcu_lock_domain_by_id(domid_t domain_id)
+{
+    struct domain *d;
+
+    for_each_domain ( d )
+    {
+        if ( d->domain_id == domain_id )
+            return d;
+    }
+    return NULL;
+}
+
+struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
+{
+    (void)(d);
+    (void)(vcpu_id);
+    return NULL;
+}
+
+int vcpu_reset(struct vcpu *v)
+{
+    (void)(v);
+    return 0;
+}
+
+int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    (void)(v);
+    (void)(c);
+    return 0;
+}
+void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    (void)(v);
+    (void)(c);
+    return;
+}
+
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    (void)(d);
+    (void)(info);
+}
+
+void arch_p2m_set_access_required(struct domain *d, bool access_required)
+{
+    (void)(d);
+    (void)(access_required);
+}
+
+bool arch_use_domctl_lock(const struct xen_domctl *op)
+{
+    (void)op;
+
+    return false;
+}
+
+#if XEN_DOMCTL_get_runstate_info == 1099
+void domain_runstate_get(struct domain *d,
+                         struct xen_domctl_runstate_info_ext *info)
+{
+    (void)d;
+    (void)info;
+}
+#endif
+
+#if (XEN_DOMCTL_numa_op == 1101 && defined(CONFIG_NUMA))
+int numa_domctl(struct domain *d, struct xen_domctl_numa_op *numa,
+                bool *copyback)
+{
+    (void)d;
+    (void)numa;
+    (void)copyback;
+
+    return -EOPNOTSUPP;
+}
+#endif
+#endif
+#endif
diff --git a/tools/tests/native/harness/domctl-wrapper.h b/tools/tests/native/harness/domctl-wrapper.h
new file mode 100644
index 000000000000..ef7d387e4d70
--- /dev/null
+++ b/tools/tests/native/harness/domctl-wrapper.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Wrapper around xen/common/domctl.c for the allocator test framework.
+ *
+ * This file includes the real domctl.c directly in its translation unit.
+ *
+ * It allows to pass hypercalls from xc_domain to the do_domctl()
+ * hypercall handler bin xen/common/domctl.c, which is the entry
+ * point for domctl commands in the Xen hypervisor.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_DOMCTL_WRAPPER_H
+#define TOOLS_TESTS_NATIVE_HARNESS_DOMCTL_WRAPPER_H
+#ifdef TEST_WRAP_XEN_COMMON_DOMCTL_C
+#include "domctl-shim.h"
+#pragma GCC diagnostic push
+/* Header guards for xen/common/domctl.c inclusion. */
+#define _ASM_HW_IRQ_H
+#define __XEN_HYPERCALL_H__
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#ifdef __clang__
+#pragma clang diagnostic ignored "-Wfor-loop-analysis"
+#endif
+#include "../../xen/common/domctl.c"
+#pragma GCC diagnostic pop
+#endif
+#endif
diff --git a/tools/tests/native/harness/memory-shim.h b/tools/tests/native/harness/memory-shim.h
new file mode 100644
index 000000000000..f65e359e676d
--- /dev/null
+++ b/tools/tests/native/harness/memory-shim.h
@@ -0,0 +1,201 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Minimal shim to include xen/common/domctl.c in host-side tests.
+ *
+ * This shim provides the minimal Xen definitions that domctl.c
+ * needs to run in a host-side test environment.  It replaces a
+ * minimal subset of the Xen environment that xen/common/domctl.c
+ * interacts with with stubs so it can run in the test environment,
+ * allowing test scenarios to verify the behavior of domctl.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_MEMORY_SHIM_H
+#define TOOLS_TESTS_NATIVE_HARNESS_MEMORY_SHIM_H
+
+/*
+ * Guard against language servers and linters picking up this header.
+ *
+ * This shim is intended to be used in test programs for testing
+ * the code of xen/common/domctl.c in a host-side test environment,
+ * and test programs need to define TEST_WRAP_XEN_COMMON_MEMORY_C
+ * to enable the definitions in this header.
+ */
+#ifndef TEST_WRAP_XEN_COMMON_MEMORY_C
+#warning "Include this header only in integration tests using memory.c"
+#else
+
+/*
+ * Inside the intended test context, provide stub definitions.
+ *
+ * Some functions need to use types defined in specific headers,
+ * so we include them and define header guards to prevent unwanted
+ * definitions from those headers that conflict with the test harness
+ * or bring in Xen-internal structures that are already provided by
+ * the natural C compiler defines, libc defines and stubs in this shim.
+ */
+
+/*
+ * Block headers whose content conflicts with the test harness or that pull in
+ * types and functions not available in the host environment.  Stubs for the
+ * symbols that memory.c actually uses from those headers are provided below.
+ */
+#define __XEN_IOREQ_H__         /* ioreq types unavailable; code under CONFIG_IOREQ_SERVER */
+#define __XEN_GRANT_TABLE_H__   /* gnttab_* stubs provided below */
+#define __XEN_LLC_COLORING_H__  /* llc_coloring_enabled stub provided below */
+#define _XEN_MEM_ACCESS_H       /* mem_access_memop stub provided below */
+#define __ASM_HARDIRQ_H         /* in_irq() stub provided below */
+#define ARM_GENERIC_HARDIRQ_H   /* in_irq() stub provided below */
+#define __ASM_GENERIC_HARDIRQ_H /* in_irq() stub provided below */
+
+/*
+ * Stubs for symbols from the blocked headers that memory.c actually uses.
+ */
+
+/*
+ * XSM hooks used by memory.c beyond those already stubbed in domctl-shim.h.
+ * The test environment permits all operations.
+ */
+#ifndef XSM_TARGET
+#define XSM_TARGET      0
+#endif
+#ifndef XSM_DM_PRIV
+#define XSM_DM_PRIV     0
+#endif
+#define xsm_memory_exchange(xsm, d)              0
+#define xsm_add_to_physmap(xsm, d1, d2)          0
+#define xsm_domain_resource_map(xsm, d)          0
+#define xsm_memory_adjust_reservation(xsm, a, b) 0
+#define xsm_memory_stat_reservation(xsm, a, b)   0
+#define xsm_remove_from_physmap(xsm, a, b)       0
+#define xsm_get_vnumainfo(xsm, d)                0
+
+/*
+ * MFN equality and invalid sentinel: mm-frame.h is blocked by
+ * __XEN_FRAME_NUM_H__, so provide these here.
+ */
+#define mfn_eq(x, y) (mfn_x(x) == mfn_x(y))
+
+/*
+ * Guest-handle range check: asm/guest_access.h is blocked; in the test
+ * context the handle always covers the requested range.
+ */
+#ifndef guest_handle_subrange_okay
+#define guest_handle_subrange_okay(hnd, first, last) 1
+#endif
+
+/*
+ * Static memory: not used in the test environment.
+ * acquire_reserved_page is declared in xen/mm.h (blocked) and used only
+ * when is_domain_using_staticmem() is true — which is never in the tests.
+ */
+#define acquire_reserved_page(d, flags) INVALID_MFN
+
+/*
+ * P2M populate-on-demand helpers used in decrease_reservation.
+ * These paths are not exercised by claim tests.
+ */
+#define p2m_pod_decrease_reservation(d, gfn, order) 0UL
+
+/*
+ * Physmap and p2m operations: stubs for the non-x86 code paths in memory.c.
+ * On x86 the real implementations live in asm/p2m.h (already blocked by
+ * domctl-shim.h); the code paths below the #ifdefs still reference these.
+ */
+#define gfn_to_mfn(d, gfn)                                    _mfn(~0UL)
+#define guest_physmap_add_page(d, gfn, mfn, order)            (-EOPNOTSUPP)
+#define guest_physmap_remove_page(d, gfn, mfn, order)         (-EOPNOTSUPP)
+#define guest_physmap_mark_populate_on_demand(d, gpfn, order) (-EOPNOTSUPP)
+
+/* Page reference count helpers used in guest_remove_page and helpers */
+#define get_page(pg, d)         true
+#define put_page_alloc_ref(pg)  ((void)(pg))
+#define get_page_type(pg, type) false
+#define put_page_and_type(pg)   ((void)(pg))
+
+/* Arch page operations used in clear_domain_page / copy_domain_page */
+#ifndef clear_page
+#define clear_page(ptr)         memset((ptr), 0, PAGE_SIZE)
+#endif
+#define copy_page_cold(dst, src) memcpy((dst), (src), PAGE_SIZE)
+#define copy_page_hot(dst, src)  copy_page_cold(dst, src)
+
+/*
+ * Memory extent hypercall shift: defined in xen/hypercall.h (blocked).
+ * do_memory_op() right-shifts cmd by this amount to extract the start extent.
+ */
+#define MEMOP_EXTENT_SHIFT      6
+#define MEMOP_CMD_MASK          ((1 << MEMOP_EXTENT_SHIFT) - 1)
+
+/*
+ * GFN equality and invalid sentinel: mm-frame.h is blocked by
+ * __XEN_FRAME_NUM_H__; gfn_t may be a type-safe wrapper in debug builds.
+ */
+#define gfn_eq(x, y)           (gfn_x(x) == gfn_x(y))
+#define invalidate_icache()    ((void)0)
+
+/*
+ * RCU domain locking for remote domains: sched.h declares
+ * rcu_lock_remote_domain_by_id() as a non-static extern.  Provide a
+ * matching non-static definition here.
+ */
+int rcu_lock_remote_domain_by_id(domid_t dom, struct domain **dp)
+{
+    struct domain *d;
+
+    for_each_domain ( d )
+    {
+        if ( d->domain_id == dom )
+        {
+            *dp = d;
+            return 0;
+        }
+    }
+    return -ESRCH;
+}
+
+/*
+ * p2m_type_t and related constants: architecture p2m.h is blocked by the
+ * wrapper because its helpers need too much real arch_domain state for this
+ * harness.  Provide the minimal subset used by memory.c.
+ */
+typedef unsigned int p2m_type_t;
+typedef unsigned int p2m_query_t;
+#define P2M_ALLOC   (1u << 0)
+#define P2M_UNSHARE (1u << 1)
+#define get_page_from_gfn(d, gfn, t, q) \
+        ((void)(t), (void)(q), (struct page_info *)NULL)
+
+/* grant_table.h: resource frame query/acquire stubs */
+#define gnttab_resource_max_frames(d, id)       0
+#define gnttab_acquire_resource(d, id, f, n, l) (-EOPNOTSUPP)
+
+/*
+ * Maximum GPFN: architecture-specific; in the test environment there is no
+ * real guest memory so return 0.
+ */
+#define domain_get_maximum_gpfn(d) 0UL
+
+/*
+ * Physmap stubs for xenmem_add_to_physmap_one() and set_foreign_p2m_entry().
+ * These arch-level operations are not currently supported in the test env.
+ */
+#define set_foreign_p2m_entry(d, fd, gfn, mfn) (-EOPNOTSUPP)
+
+/* arch_memory_op: architecture-specific memory operations not tested here. */
+#define arch_memory_op(cmd, arg)   (-EOPNOTSUPP)
+
+/* Stealing is initially not supported in the test environment */
+#define steal_page(d, page, flags) (-EOPNOTSUPP)
+
+/* mem_access.h: memory access operations are not tested here */
+#define mem_access_memop(cmd, arg) (-EOPNOTSUPP)
+#define arch_acquire_resource_check(d) false
+
+#ifndef in_irq
+#define in_irq()             false /* Tests aren't in interrupt context */
+#endif
+#define is_control_domain(d) false /* All test domains are unprivileged */
+
+#endif
+#endif
diff --git a/tools/tests/native/harness/memory-wrapper.h b/tools/tests/native/harness/memory-wrapper.h
new file mode 100644
index 000000000000..bec31804e1d9
--- /dev/null
+++ b/tools/tests/native/harness/memory-wrapper.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Wrapper around xen/common/memory.c for the allocator test environment.
+ * It also provides the pass-through implementation of the xc_memory_op()
+ * function, which is used by the memory-related hypercalls implemented in
+ * xc_domain.c to call the memory operation handler in xen/common/memory.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_MEMORY_WRAPPER_H
+#define TOOLS_TESTS_NATIVE_HARNESS_MEMORY_WRAPPER_H
+#ifdef TEST_WRAP_XEN_COMMON_MEMORY_C
+#include "memory-shim.h"
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#pragma GCC diagnostic ignored "-Wunused-variable"
+#pragma GCC diagnostic ignored "-Wunused-function"
+#include "../../xen/common/memory.c"
+#pragma GCC diagnostic pop
+
+/*
+ * Pass libxenctrl's xc_memory_op() calls to the Xen hypervisor's
+ * do_memory_op() handler in xen/common/memory.c to run the memory
+ * operations in the test environment.
+ */
+long xc_memory_op(xc_interface *xch, unsigned int cmd,
+                  void *arg, size_t arg_size)
+{
+    union {
+        XEN_GUEST_HANDLE_PARAM(void) handle;
+        void *ptr;
+    } u = { .ptr = arg };
+
+    ASSERT(xch == &test_xc_handle);
+    (void)arg_size;
+
+    /* Call xen/common/memory.c's do_memory_op() handler */
+    return do_memory_op(cmd, u.handle);
+}
+
+#endif
+#endif
diff --git a/tools/tests/native/harness/mm-wrapper.h b/tools/tests/native/harness/mm-wrapper.h
new file mode 100644
index 000000000000..f6d1093b2608
--- /dev/null
+++ b/tools/tests/native/harness/mm-wrapper.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Proxy to include definitions from xen/mm.h for native tests.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_MM_PROXY_H
+#define TOOLS_TESTS_NATIVE_HARNESS_MM_PROXY_H
+
+#ifndef TEST_WRAP_XEN_INCLUDE_XEN_MM_H
+#warning "Include this header only in integration tests that need xen/mm.h"
+#else
+#include "common.h"
+
+#define __XEN_KCONFIG_H
+#include <xen/config.h>
+#undef cf_check
+#define cf_check __used
+
+#define register_t foo; /* Workaround for arm64 sys/types conflict */
+#include <asm/types.h>
+#undef  register_t
+
+/*
+ * In the real hypervisor, the frame table is located at a fixed virtual
+ * address, but in the test harness, it is allocated in BSS or heap, so
+ * replace the fixed virtual address definitions with dynamic ones.
+ * xen/mm.h defines the frame_table define put point to the virt start.
+ */
+#undef FRAMETABLE_VIRT_START
+#undef FRAMETABLE_VIRT_END
+unsigned long FRAMETABLE_VIRT_START;
+unsigned long FRAMETABLE_VIRT_END;
+
+/*
+ * The test environment needs the virtual address of the direct map which
+ * the test environment emulates with the bss symbol directmap_virt_start
+ * defined below.  In the real hypervisor, this is a fixed virtual address,
+ * but in the test environment, it is allocated in BSS, so replace the fixed
+ * virtual address definition with a dynamic one.
+ *
+ * For example, page_set_owner() and page_get_owner() are used to get and set
+ * the virtual address of the owner domain of a page. They use pdx_to_virt()
+ * and virt_to_pdx() which use DIRECTMAP_VIRT_START to translate between the
+ * page_info struct's pdx-encoded owner field and the virtual address of
+ * the owner domain, so setting DIRECTMAP_VIRT_START to the address of a
+ * an early page-aligned symbol in the test binary (e.g. test_bss_start)
+ * allows the test code to set up and get page ownership.
+ */
+#undef DIRECTMAP_VIRT_START
+unsigned long DIRECTMAP_VIRT_START = (unsigned long)&test_bss_start;
+
+/* Shim definitions for including xen/mm.h in the test context. */
+#define maddr_to_directmapoff(ma)  ((unsigned long)(ma))
+#define directmapoff_to_maddr(off) ((paddr_t)(off))
+#define perfc_incr(x)              ((void)0)
+#define cpumask_copy(dst, src)     ((void)(dst), (void)(src))
+#define cpumask_empty(mask)        true
+
+unsigned long phys_offset;
+unsigned long xen_phys_start;
+char __init_begin[1], __init_end[1];
+struct domain; /* Forward declaration for struct domain* used in arguments */
+
+/* Include xen/mm.h into the test context */
+#include <xen/macros.h>
+#include <asm/types.h>
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#ifndef __clang__
+#pragma GCC diagnostic ignored "-Wbuiltin-declaration-mismatch"
+#endif
+#include <xen/mm.h>
+#pragma GCC diagnostic pop
+
+/* Provide definitions for a minimum synthetic heap */
+#undef page_to_mfn
+#undef mfn_to_page
+#undef mfn_valid
+#define page_to_mfn(pg)    _mfn((pg) - &frame_table[0])
+#define mfn_to_page(mfn)   (&frame_table[mfn_x(mfn)])
+#define mfn_valid(mfn) \
+        (mfn_x(mfn) >= mfn_x(first_valid_mfn) &&  mfn_x(mfn) < max_page)
+
+/* Provide virtual addresses for synthetic memory provided by the harness */
+#undef mfn_to_virt
+#undef __mfn_to_virt
+#undef page_to_virt
+#undef virt_to_page
+static unsigned char       test_dummy_storage[PAGE_SIZE];
+#define mfn_to_virt(mfn)   ((void *)&test_dummy_storage)
+#define __mfn_to_virt(mfn) mfn_to_virt(mfn)
+#define page_to_virt(pg)   ((void *)(pg))
+#define virt_to_page(v)    ((struct page_info *)(v))
+
+/* Not supported by the test harness yet, only used by heap init functions. */
+#undef maddr_to_page
+#define maddr_to_page(pa) (ASSERT_UNREACHABLE(), NULL)
+#endif
+
+#if defined(__arm__) || defined(__aarch64__)
+void dump_hyp_walk(vaddr_t addr)
+{
+    (void)addr;
+}
+
+void __attribute__((__noreturn__)) panic_PAR(uint64_t par)
+{
+    (void)par;
+    ASSERT_UNREACHABLE();
+}
+#endif
+
+#if defined(__riscv)
+vaddr_t directmap_virt_start;
+#endif
+
+#endif
diff --git a/tools/tests/native/harness/native.h b/tools/tests/native/harness/native.h
new file mode 100644
index 000000000000..87553d45d7ec
--- /dev/null
+++ b/tools/tests/native/harness/native.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Main header of the test environment.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_NATIVE_H
+#define TOOLS_TESTS_NATIVE_HARNESS_NATIVE_H
+
+#pragma GCC diagnostic error "-Wextra"
+#include "common.h"
+
+/*
+ * The test environment needs the virtual address of the direct map which
+ * the test environment emulates with the bss symbol directmap_virt_start
+ * defined below.  In the real hypervisor, this is a fixed virtual address,
+ * but in the test environment, it is allocated in BSS, so replace the fixed
+ * virtual address definition with a dynamic one.
+ *
+ * For example, page_set_owner() and page_get_owner() are used to get and set
+ * the virtual address of the owner domain of a page. They use pdx_to_virt()
+ * and virt_to_pdx() which use DIRECTMAP_VIRT_START to translate between the
+ * page_info struct's pdx-encoded owner field and the virtual address of
+ * the owner domain, so setting DIRECTMAP_VIRT_START to the address of a
+ * an early page-aligned symbol in the test binary (e.g. test_bss_start)
+ * allows the test code to set up and get page ownership.
+ */
+void __aligned(PAGE_SIZE) *test_bss_start;
+
+#ifdef TEST_ENABLE_XC_DOMAIN_C
+#define TEST_WRAP_XEN_COMMON_SYSCTL_C
+#endif
+
+/* If sysctl.c is included, enable CONFIG_SYSCTL for it dependencies */
+#ifdef TEST_WRAP_XEN_COMMON_SYSCTL_C
+#define CONFIG_SYSCTL 1
+#endif
+
+/*
+ * The test environment uses the real Xen page allocator, so include the
+ * page-alloc-shim which provides the necessary supporting structures and
+ * stubs for it to function correctly in the test environment.
+ */
+#define TEST_WRAP_XEN_COMMON_PAGE_ALLOC_C
+#include "page-alloc-shim.h"
+
+/* Include the real page_alloc.c for testing */
+#pragma GCC diagnostic push
+/* At a later point, fix the remaining sign-compare warnings in page_alloc.c */
+#pragma GCC diagnostic ignored "-Wsign-compare"
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+/*
+ * Instrumenting the BUG() macro asserting to hit it means it is no longer
+ * noreturn, and a function expects it to be noreturn, so disable this warning
+ */
+#pragma GCC diagnostic ignored "-Wreturn-type"
+#include "../../xen/common/page_alloc.c"
+#pragma GCC diagnostic pop
+
+#ifdef TEST_WRAP_XEN_COMMON_DOMCTL_C
+#include "domctl-wrapper.h"
+#endif
+
+#ifdef TEST_ENABLE_XC_DOMAIN_C
+#include "xc-domain-env.h"
+#define TEST_WRAP_XEN_COMMON_MEMORY_C
+#endif
+
+#ifdef TEST_WRAP_XEN_COMMON_MEMORY_C
+#include "memory-wrapper.h"
+#endif
+
+#ifdef TEST_WRAP_XEN_COMMON_SYSCTL_C
+#include "sysctl-wrapper.h"
+#endif
+
+#ifdef TEST_WRAP_XEN_COMMON_PAGE_ALLOC_C
+#include "page-alloc-env.h"
+#endif
+
+#endif
diff --git a/tools/tests/native/harness/page-alloc-env.h b/tools/tests/native/harness/page-alloc-env.h
new file mode 100644
index 000000000000..53e36c8a3f05
--- /dev/null
+++ b/tools/tests/native/harness/page-alloc-env.h
@@ -0,0 +1,254 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test environment to compile xen/common/page_alloc.c into the test
+ * environment and provide the necessary supporting structures and stubs
+ * for it to function correctly.
+ *
+ * Also provide helper functions to set up test scenarios and check the
+ * resulting state of the page allocator.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_PAGE_ALLOC_ENV_H
+#define TOOLS_TESTS_NATIVE_PAGE_ALLOC_ENV_H
+
+#ifdef TEST_WRAP_XEN_COMMON_PAGE_ALLOC_C
+#include "native.h"
+static const unsigned int node = 0;
+static const unsigned int node0 = 0;
+static const unsigned int node1 = 1;
+static const unsigned int order0 = 0;
+static const unsigned int order1 = 1;
+static const unsigned int order2 = 2;
+static const unsigned int order3 = 3;
+
+/* Backing storage for the synthetic allocator state used by the tests. */
+#ifndef PAGES_PER_ZONE
+#define PAGES_PER_ZONE 8
+#endif
+
+#ifndef MAX_PAGES
+#define MAX_PAGES (MAX_NUMNODES * NR_ZONES * PAGES_PER_ZONE)
+#endif
+
+/*
+ * The synthetic frame table backs the page_info entries used by the tests.
+ * It is indexed by MFN so helper code and the imported allocator can
+ * translate directly between MFNs and page_info pointers.
+ */
+struct page_info test_frame_table[MAX_PAGES];
+static heap_by_zone_and_order_t test_heap_storage[MAX_NUMNODES];
+static unsigned long test_avail_storage[MAX_NUMNODES][NR_ZONES];
+struct domain *domain_list;
+
+static void init_numa_node_data(unsigned int start_mfn)
+{
+    (void)start_mfn;
+#ifdef CONFIG_NUMA
+    unsigned long node_spanned_pages = 16;
+
+    for ( unsigned int i = 0; i < NR_CPUS; i++ )
+        cpu_to_node[i] = i;
+
+    for ( unsigned int i = 0; i < MAX_NUMNODES; i++ )
+        node_to_cpumask[i] = (1UL << i);
+
+    for ( unsigned int i = 0; i < MAX_NUMNODES; i++ )
+    {
+        node_data[i].node_start_pfn = start_mfn + (i * node_spanned_pages);
+        node_data[i].node_present_pages = node_spanned_pages;
+        node_data[i].node_spanned_pages = node_spanned_pages;
+    }
+    memnode_shift = fls(node_spanned_pages - 1);
+    for ( unsigned int i = 0; i < 64; i++ )
+        memnodemap[i] = (nodeid_t)i;
+#endif
+}
+
+static void init_dummy_domains(void)
+{
+    nodemask_t dom_node_affinity;
+    struct domain *dom;
+    int dom_id = 1;
+
+    nodes_clear(dom_node_affinity);
+    node_set(node0, dom_node_affinity);
+    node_set(node1, dom_node_affinity);
+    test_current_vcpu.domain = &test_dummy_domain1;
+    domain_list = &test_dummy_domain1;
+    test_dummy_domain1.next_in_list = &test_dummy_domain2;
+
+    for_each_domain ( dom )
+    {
+        dom->node_affinity = dom_node_affinity;
+        dom->max_pages = MAX_PAGES;
+        dom->domain_id = dom_id++;
+        INIT_PAGE_LIST_HEAD(&dom->page_list);
+    }
+}
+
+/* Internal correctness check: page_get_owner and page_set_owner must match. */
+static void sanity_check_page_ownership_accessors(void)
+{
+    struct page_info *page = &frame_table[0];
+
+    /* Ignore the always true warning caused by the static dummy domain */
+    #pragma GCC diagnostic push
+    #pragma GCC diagnostic ignored "-Waddress"
+    page_set_owner(page, &test_dummy_domain1);
+    #pragma GCC diagnostic pop
+
+    ASSERT(page_get_owner(page) == &test_dummy_domain1);
+    page_set_owner(page, NULL); /* Clear the owner again */
+}
+
+static void reset_page_alloc_state(int start_mfn)
+{
+    unsigned int zone, order;
+
+    /* Initialize frame table and heap structures */
+    FRAMETABLE_VIRT_START = (unsigned long)test_frame_table;
+    FRAMETABLE_VIRT_END = (unsigned long)(test_frame_table + MAX_PAGES);
+    memset(test_frame_table, 0, sizeof(test_frame_table));
+    memset(test_heap_storage, 0, sizeof(test_heap_storage));
+    memset(test_avail_storage, 0, sizeof(test_avail_storage));
+    memset(&test_dummy_domain1, 0, sizeof(test_dummy_domain1));
+    memset(&test_dummy_domain2, 0, sizeof(test_dummy_domain2));
+    memset(&test_current_vcpu, 0, sizeof(test_current_vcpu));
+    system_state = SYS_STATE_active;
+    INIT_PAGE_LIST_HEAD(&page_offlined_list);
+    INIT_PAGE_LIST_HEAD(&page_broken_list);
+
+    init_numa_node_data(start_mfn);
+    for ( nodeid_t node = 0; node < MAX_NUMNODES; node++ )
+    {
+        _heap[node] = &test_heap_storage[node];
+        avail[node] = test_avail_storage[node];
+        node_avail_pages[node] = 0;
+        claimed_pages[node] = 0;
+        for ( zone = 0; zone < NR_ZONES; zone++ )
+            for ( order = 0; order <= MAX_ORDER; order++ )
+                INIT_PAGE_LIST_HEAD(&heap(node, zone, order));
+    }
+    total_avail_pages = 0;
+    outstanding_claims = 0;
+    first_valid_mfn = _mfn(start_mfn);
+    max_page = sizeof(test_frame_table) / sizeof(test_frame_table[0]);
+    ASSERT(mfn_x(first_valid_mfn) < max_page);
+    init_dummy_domains();
+    sanity_check_page_ownership_accessors();
+    testcase_assert_verbose_assertions = true;
+}
+
+static void __used init_page_alloc_tests(void)
+{
+    setup_testcase_init_func(reset_page_alloc_state);
+}
+
+static void init_test_page(struct page_info *page, unsigned int order,
+                           unsigned long state)
+{
+    mfn_t mfn = page_to_mfn(page);
+
+    if ( mfn_x(mfn) < mfn_x(first_valid_mfn) && mfn_x(mfn) > 0 &&
+         mfn_x(mfn) < max_page )
+        first_valid_mfn = mfn;
+
+    if ( mfn_x(mfn) >= max_page && mfn_x(mfn) < ARRAY_SIZE(test_frame_table) )
+        max_page = mfn_x(mfn) + 1;
+
+    memset(page, 0, sizeof(*page));
+    page->v.free.order = order;
+    page->u.free.first_dirty = INVALID_DIRTY_IDX;
+    page->u.free.scrub_state = BUDDY_NOT_SCRUBBING;
+    page->count_info = state;
+}
+
+/* Check whether the page is aligned to its order (is size-aligned) */
+static bool page_aligned(struct page_info *pg)
+{
+    return IS_ALIGNED(mfn_x(page_to_mfn(pg)), 1UL << PFN_ORDER(pg));
+}
+
+static size_t __used page_list_add_buddy(struct page_info *pages,
+                                         unsigned int order,
+                                         const char *caller_file,
+                                         const char *caller_func,
+                                         int caller_line)
+{
+    size_t i, num_pages = 1U << order;
+    bool verbose = testcase_assert_verbose_assertions;
+
+    testcase_assert_verbose_assertions = false;
+    init_test_page(&pages[0], order, PGC_state_inuse);
+    for ( i = 1; i < num_pages; i++ )
+        init_test_page(&pages[i], order0, PGC_state_inuse);
+    free_heap_pages(&pages[0], order, false);
+
+    if ( !page_aligned(&pages[0]))
+        testcase_assert(false, caller_file, caller_line, caller_func,
+                        "Buddy of order %u at MFN %lu is not size-aligned",
+                        order, mfn_x(page_to_mfn(&pages[0])));
+    if ( page_to_zone(&pages[0]) != page_to_zone(&pages[num_pages - 1]) )
+        testcase_assert(false, caller_file, caller_line, caller_func,
+                        "Buddy of order %u at MFN %lu crosses zones: "
+                        "start zone %u, end zone %u", order,
+                        mfn_x(page_to_mfn(&pages[0])),
+                        page_to_zone(&pages[0]),
+                        page_to_zone(&pages[num_pages - 1]));
+    testcase_assert_verbose_assertions = verbose;
+    return page_to_zone(&pages[0]);
+}
+#define test_page_list_add_buddy(pages, order) \
+        page_list_add_buddy(pages, order, __FILE__, __func__, __LINE__)
+
+#define test_page_list_add_node_buddy(node, start_mfn, order)             \
+        page_list_add_buddy(frame_table + node_data[node].node_start_pfn + \
+                            (start_mfn), order, __FILE__, __func__, __LINE__)
+
+#define test_get_node_page(node, offset) \
+        (frame_table + node_data[node].node_start_pfn + (offset))
+
+/* Check consistency of total xc_availheap() pages with total_avail_pages */
+static void check_xc_avail_heap(const char *file, int line, const char *func)
+{
+#if defined(TEST_ENABLE_XC_DOMAIN_C) && defined(TEST_WRAP_XEN_COMMON_SYSCTL_C)
+    uint64_t free_bytes;
+
+    testcase_assert(xc_availheap(xch, 0, 0, -1, &free_bytes) == 0,
+                    file, line, func, "xc_availheap() failed");
+    testcase_assert(free_bytes / XC_PAGE_SIZE == total_avail_pages,
+                    file, line, func, "xc_availheap() != total_avail_pages");
+#endif
+}
+
+/* Get the number of free pages with consistency checks */
+unsigned long get_free_pages(const char *file, int line, const char *func)
+{
+    bool verbose = testcase_assert_verbose_assertions;
+
+    testcase_assert_verbose_assertions = false;
+    check_xc_avail_heap(file, line, func);
+    testcase_assert(avail_heap_pages(MEMZONE_XEN, NR_ZONES - 1, -1) ==
+                    total_avail_pages, file, line, func, "avail_heap_pages()");
+    testcase_assert_verbose_assertions = verbose;
+    return total_avail_pages;
+}
+
+#define FREE_PAGES get_free_pages(__FILE__, __LINE__, __func__)
+#define TOTAL_CLAIMS (outstanding_claims)
+
+/* Stubs needed for the page allocator */
+
+/* Stub for page_alloc.c's keyhandler registrations */
+void __init register_keyhandler(unsigned char key, keyhandler_fn_t *fn,
+                                const char *desc, bool diagnostic)
+{
+    (void)key;
+    (void)fn;
+    (void)desc;
+    (void)diagnostic;
+}
+
+#endif
+#endif
diff --git a/tools/tests/native/harness/page-alloc-shim.h b/tools/tests/native/harness/page-alloc-shim.h
new file mode 100644
index 000000000000..75652c9291ba
--- /dev/null
+++ b/tools/tests/native/harness/page-alloc-shim.h
@@ -0,0 +1,328 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Minimal shim to include xen/common/page_alloc.c in host-side tests.
+ *
+ * This shim provides the minimal Xen definitions that page_alloc.c
+ * needs to run in a host-side test environment.  It replaces a
+ * minimal subset of the Xen environment that xen/common/page_alloc.c
+ * interacts with with stubs so it can run in the test environment,
+ * allowing test scenarios to verify the behavior of page_alloc.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_PAGE_ALLOC_SHIM_H
+#define TOOLS_TESTS_NATIVE_HARNESS_PAGE_ALLOC_SHIM_H
+
+/*
+ * Guard against language servers and linters picking up this header.
+ *
+ * This shim is intended to be used in test programs for testing the
+ * code of xen/common/page_alloc.c in a host-side test environment,
+ * and test programs need to define TEST_WRAP_XEN_COMMON_PAGE_ALLOC_C
+ * to enable the definitions in this header.
+ */
+#ifdef TEST_WRAP_XEN_COMMON_PAGE_ALLOC_C
+#define CONFIG_SCRUB_DEBUG
+#define TEST_WRAP_XEN_INCLUDE_XEN_MM_H
+
+/* Provide struct page_info and related Xen definitions */
+#include "common.h"
+#include "mm-wrapper.h"
+
+#include <xen/nospec.h>     /* xen/pci.h needs to include xen/nospec.h */
+#include <xen/kernel.h>
+#include <xen/typesafe.h>
+#include <public/xen.h>
+
+/* Include xen/numa.h with stubs and unused parameter warnings disabled */
+#define cpumask_clear_cpu(cpu, mask) ((void)(cpu), (void)(mask))
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#include <xen/numa.h>
+#pragma GCC diagnostic pop
+
+/* Flexible definition to support 32- and 64-bit architectures */
+typedef unsigned long nodemask_t;
+
+/*
+ * Include xen/sched.h for struct domain and struct vcpu definitions.
+ * The guards need to prevent inclusion of the conflicting headers
+ * that would cause problems in the test context, but sched.h itself
+ * is needed to provide the full definitions of struct domain and
+ * struct vcpu that page_alloc.c interacts with.
+ */
+
+/*
+ * Provide stubs for types from blocked headers that xen/sched.h's struct
+ * domain and struct vcpu reference by value.  These are minimal empty
+ * definitions sufficient to make the structs compile in the test context.
+ */
+typedef cpumask_t *cpumask_var_t;
+struct timer {};
+#ifndef __riscv
+struct arch_domain {};
+struct arch_vcpu {};
+struct arch_vcpu_io {};
+#endif
+struct lock_profile {};
+struct lock_profile_qhead {};
+struct tasklet {};
+struct _rcu_read_lock {};
+typedef struct _rcu_read_lock rcu_read_lock_t;
+
+/* rcu_dereference is used by for_each_domain in sched.h (rcupdate.h blocked) */
+#define rcu_dereference(p) (p)
+
+/* perfc_incr is used in SCHED_STAT_CRANK (perfc.h blocked) */
+#define perfc_incr(x)      ((void)0)
+
+/*
+ * Macros and stubs needed by sched.h's inline function bodies during header
+ * compilation.  These come from headers that are blocked above.  Some are
+ * also redefined in the stubs section below.
+ */
+
+/*
+ * RCU annotation and helper stubs.  rcupdate.h is blocked; provide the
+ * minimal definitions that radix-tree.h and sched.h need during compilation.
+ */
+#define __rcu                           /* RCU ownership annotation (empty) */
+#define rcu_assign_pointer(p, v)        ((p) = (v))
+struct rcu_head {
+    struct rcu_head *next;
+    void             (*func)(struct rcu_head *);
+};
+
+static struct vcpu __used *current;  /* zero-init; assigned via constructor below */
+enum system_state system_state = SYS_STATE_active;
+
+/* Macros used by sched.h inline functions (blocked headers provide these) */
+#define cpumask_weight(mask)  1U
+#define rcu_read_lock(lock)   ((void)(lock))
+#define rcu_read_unlock(lock) ((void)(lock))
+/*
+ * Minimal per-CPU stubs: sched.h uses DECLARE_PER_CPU and this_cpu() in
+ * inline functions.  These come from the blocked percpu.h.  Map onto simple
+ * file-scope static variables to satisfy compilation.
+ */
+#define this_cpu(x)                 (shim_per_cpu__##x)
+
+/*
+ * page_to_list is a macro in mock-page-list.h (included earlier) AND a
+ * static inline in sched.h.  Undefine the macro before the include so that
+ * sched.h can define the function without a conflicting macro expansion.
+ * The mock macro is restored after sched.h is included.
+ */
+#undef page_to_list
+#undef is_xen_heap_page
+#undef is_xen_fixed_mfn
+#undef is_xen_heap_mfn
+#define is_xen_heap_page(pg)  false
+#define is_xen_fixed_mfn(mfn) false
+#define is_xen_heap_mfn(mfn)  false
+
+/*
+ * domain_crash has a 1-arg macro in hypervisor-macros.h and a variadic
+ * macro in sched.h.  Undefine before the include to avoid -Wmacro-redefined;
+ * sched.h's variadic version plus the __domain_crash() stub provided below
+ * give us the correct behaviour in the test context.
+ */
+#undef domain_crash
+
+/* ioreq.h provides ioreq_t used by struct vcpu_io inside sched.h */
+#include <public/hvm/ioreq.h>
+
+/*
+ * Include the real xen/sched.h to get struct domain, struct vcpu, and
+ * all related declarations.  The guards above prevent conflicting
+ * subsidiary headers from being pulled in.  Suppress warnings about
+ * unused parameters in the Xen header inline functions.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+/*
+ * Suppress builtin declaration mismatch warnings for Xen's ffsl and flsl
+ * definitions, Xen's ffs macros are unsigned while gcc expects signed.
+ */
+#ifndef __clang__
+#pragma GCC diagnostic ignored "-Wbuiltin-declaration-mismatch"
+#else
+#pragma clang diagnostic ignored "-Wtypedef-redefinition"
+#endif
+#include <xen/sched.h>
+#pragma GCC diagnostic pop
+
+/* Dummy domains for allocations and page ownership in the test context */
+static struct domain test_dummy_domain1;
+static struct domain test_dummy_domain2;
+static struct domain __used *dom1 = &test_dummy_domain1;
+static struct domain __used *dom2 = &test_dummy_domain2;
+
+/*
+ * Restore test-friendly overrides for sched.h macros that reference
+ * real Xen runtime infrastructure (domain_destroy, etc.).
+ */
+#undef put_domain
+#define put_domain(d)       ((void)(d))
+
+/* RCU domain locking (additional stubs beyond rcu_lock_domain already there) */
+#define rcu_unlock_domain(d) ((void)(d))
+#define dom_io               (&test_dummy_domain1)
+#define dom_xen              (&test_dummy_domain2)
+
+/* To provide a current vcpu/domain pair for code paths that inspect it. */
+
+static struct vcpu test_current_vcpu;
+/* 'current' was forward-declared before sched.h.  Set the pointer at
+ * program startup via a constructor so that test helpers see the right vcpu
+ * from the very first call into the allocator. */
+static void __attribute__((constructor)) _page_alloc_shim_init_current(void)
+{
+    current = &test_current_vcpu;
+}
+/* dom_cow is a domain pointer used by the memory sharing code */
+#ifdef CONFIG_MEM_SHARING
+static struct domain *dom_cow;
+#else
+#define dom_cow NULL
+#endif
+
+/* NUMA stubs for unit testing NUMA-aware page allocator logic. */
+#define first_node(mask)                    \
+        ({                                  \
+             unsigned long __mask = (mask); \
+             __builtin_ffs(__mask) - 1;     \
+         })
+#define next_node(node, mask)                                              \
+        ({                                                                 \
+             unsigned long __mask = (mask) & ~((1UL << ((node) + 1)) - 1); \
+             __builtin_ffs(__mask) - 1;                                    \
+         })
+#define cycle_node(node, mask)                                             \
+        ({                                                                 \
+             unsigned long __mask = (mask) & ~((1UL << ((node) + 1)) - 1); \
+             int __next = __builtin_ffs(__mask) - 1;                       \
+             __next >= 0 ? __next : first_node(mask);                      \
+         })
+#define num_online_nodes()        MAX_NUMNODES
+#define node_online(node)         ((node) < MAX_NUMNODES)
+static nodemask_t node_online_map = ~0UL;
+
+#ifdef CONFIG_NUMA
+/* Replacements for common/numa.c */
+#define __node_distance(a, b) 0
+nodeid_t cpu_to_node[NR_CPUS];
+cpumask_t node_to_cpumask[MAX_NUMNODES];
+struct node_data node_data[MAX_NUMNODES];
+unsigned int memnode_shift;
+static typeof(*memnodemap) _memnodemap[64];
+nodeid_t *memnodemap = _memnodemap;
+unsigned long memnodemapsize = sizeof(_memnodemap);
+#endif /* CONFIG_NUMA */
+
+/*
+ * Stub definitions for Xen functions and macros used by page_alloc.c,
+ * sufficient to support the test scenarios.
+ *
+ * These are not intended to be complete or accurate for general use
+ * in other test contexts or as a general-purpose shim for page_alloc.c.
+ */
+#define rcu_lock_domain(id)               (&test_dummy_domain1)
+#define rcu_lock_domain_by_any_id(id)     (&test_dummy_domain1)
+#define NOW()                             0LL
+#define cpu_online(cpu)                   ((cpu) == 0)
+#define smp_processor_id()                0U
+/* smp_wmb and cpumask_weight defined before sched.h include; identical
+ * redefinitions here are benign but kept for clarity. */
+#define cpumask_empty(mask)               true
+#define cpumask_clear(mask)               ((void)(mask))
+#define cpumask_and(dst, a, b)            ((void)(dst), (void)(a), (void)(b))
+#define cpumask_or(dst, a, b)             ((void)(dst), (void)(a), (void)(b))
+#define cpumask_copy(dst, src)            ((void)(dst), (void)(src))
+#define cpumask_first(mask)               0U
+#define cpumask_intersects(a, b)          false
+
+#define parse_bool(s, e) (-1) /* Use the default register_keyhandler value */
+
+/* cpumask_weight defined before sched.h; identical redefinition is benign */
+#define __cpumask_set_cpu(cpu, mask)      ((void)(cpu), (void)(mask))
+#define page_get_owner_and_reference(pg)  page_get_owner(pg)
+#define page_is_offlinable(mfn)           true
+#define softirq_pending(cpu)              false
+#define process_pending_softirqs()        ((void)0)
+#define on_selected_cpus(msk, f, data, w) ((void)0)
+#define get_order_from_pages(nr)          0U
+#define get_order_from_bytes(bytes)       0U
+
+/* Testing hypercall preemption is not supported yet. */
+#undef hypercall_preempt_check
+#define hypercall_preempt_check()  0
+
+#undef arch_free_heap_page
+#define arch_free_heap_page(d, pg) ((void)(d), (void)(pg))
+#define unmap_domain_page(ptr)     ((void)(ptr))
+#define ASSERT_ALLOC_CONTEXT()     ((void)0)
+#define get_knownalive_domain(d)   ((void)(d))
+#define mem_paging_enabled(d)      false
+
+#define put_page(pg) ((void)(pg))
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    (void)page;
+    (void)domain;
+    return false;
+}
+
+#ifdef __x86_64__
+#define clear_page_hot(ptr)          memset((ptr), 0, PAGE_SIZE)
+#define clear_page_cold(ptr)         memset((ptr), 0, PAGE_SIZE)
+#define scrub_page_hot(ptr)          clear_page_hot(ptr)
+#define scrub_page_cold(ptr)         clear_page_cold(ptr)
+#define set_gpfn_from_mfn(mfn, gpfn) ((void)0)
+
+unsigned int arch_get_dma_bitsize(void)
+{
+    return 32U;
+}
+#endif
+
+#if defined(__arm__) || defined(__aarch64__)
+#define test_and_clear_bit(nr, addr) generic__test_and_clear_bit(nr, addr)
+#endif
+
+/* LLC (Last Level Cache) coloring support stubs */
+#define llc_coloring_enabled false
+unsigned int get_max_nr_llc_colors(void)
+{
+    return 1U;
+}
+
+unsigned int page_to_llc_color(const struct page_info *pg)
+{
+    (void)pg;
+    return 0U;
+}
+
+void send_global_virq(uint32_t virq)
+{
+    (void)virq;
+}
+
+unsigned long simple_strtoul(const char *cp, const char **endp,
+                             unsigned int base)
+{
+    return strtoul(cp, (char **)endp, base);
+}
+
+/*
+ * __domain_crash is declared by sched.h (via domain_crash macro) but has no
+ * definition for the test environment.  Provide a no-op stub so the test
+ * binary links correctly if domain_crash is ever expanded.
+ */
+void __domain_crash(struct domain *d)
+{
+    (void)d;
+}
+
+#endif
+#endif
diff --git a/tools/tests/native/harness/sysctl-shim.h b/tools/tests/native/harness/sysctl-shim.h
new file mode 100644
index 000000000000..e4170619c46b
--- /dev/null
+++ b/tools/tests/native/harness/sysctl-shim.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Minimal shim to include xen/common/sysctl.c in host-side tests.
+ *
+ * This shim provides the minimal Xen definitions that sysctl.c
+ * needs to run in a host-side test environment.  It replaces a
+ * minimal subset of the Xen environment that xen/common/sysctl.c
+ * interacts with with stubs so it can run in the test environment,
+ * allowing test scenarios to verify the behavior of sysctl.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_SYSCTL_SHIM_H
+#define TOOLS_TESTS_NATIVE_HARNESS_SYSCTL_SHIM_H
+
+/*
+ * Guard against language servers and linters picking up this header.
+ *
+ * This shim is intended to be used in test programs for testing
+ * the code of xen/common/sysctl.c in a host-side test environment,
+ * and test programs need to define TEST_WRAP_XEN_COMMON_SYSCTL_C
+ * to enable the definitions in this header.
+ */
+#ifndef TEST_WRAP_XEN_COMMON_SYSCTL_C
+#warning "Include this header only in integration tests using sysctl.c"
+#else
+
+/*
+ * Inside the intended test context, provide stub definitions.
+ *
+ * Some functions need to use types defined in specific headers,
+ * so we include them and define header guards to prevent unwanted
+ * definitions from those headers that conflict with the test harness
+ * or bring in Xen-internal structures that are already provided by
+ * the natural C compiler defines, libc defines and stubs in this shim.
+ */
+
+/*
+ * Block headers whose content conflicts with the test harness or that pull in
+ * types and functions not available in the host environment.  Stubs for the
+ * symbols that sysctl.c actually uses from those headers are provided below.
+ */
+
+/* console.h: read_console_ring stub provided below. */
+#define __CONSOLE_H__
+
+/*
+ * RCU read-side locking.
+ *
+ * struct _rcu_read_lock, rcu_read_lock_t, rcu_read_lock(), and
+ * rcu_read_unlock() are now provided by page-alloc-shim.h (before sched.h
+ * is included).  Only keep the helpers that sysctl-shim.h itself uses.
+ */
+#define DEFINE_RCU_READ_LOCK(x) static rcu_read_lock_t x
+
+/* domlist_read_lock is declared extern in sched.h; provide the definition. */
+rcu_read_lock_t domlist_read_lock;
+
+/*
+ * XSM hooks used by sysctl.c beyond those already stubbed in
+ * domctl-shim.h and memory-shim.h.
+ * The test environment permits all operations.
+ */
+#define xsm_sysctl(xsm, d)             ((void)(d), 0)
+#define xsm_readconsole(xsm, clear)    ((void)(clear), 0)
+#define xsm_page_offline(xsm, cmd)     ((void)(cmd), 0)
+
+/* console.h stubs: read_console_ring is not tested here. */
+#define read_console_ring(op)           ((void)(op), -EOPNOTSUPP)
+
+/*
+ * keyhandler.h is already included by page-alloc-shim.h; stub
+ * handle_keypress as a no-op so the debug-keys sysctl case compiles.
+ */
+#define handle_keypress(key, ctx)       ((void)(key), (void)(ctx))
+
+/*
+ * Scheduler stubs.
+ *
+ * sched.h is blocked by __SCHED_H__ in page-alloc-shim.h.
+ */
+#define scheduler_id()                  0
+#define sched_adjust_global(op)         ((void)(op), -EOPNOTSUPP)
+#define get_cpu_idle_time(cpu)          ((void)(cpu), 0ULL)
+
+/* cpupool_do_sysctl: cpupool operations are not tested here. */
+#define cpupool_do_sysctl(op)           ((void)(op), -EOPNOTSUPP)
+
+/*
+ * CPU and node count stubs.
+ *
+ * cpumask.h is blocked by __XEN_CPUMASK_H in page-alloc-shim.h.
+ * nodemask.h is blocked by __LINUX_NODEMASK_H there too.
+ */
+#define nr_cpu_ids                      1U
+#define num_online_cpus()               1U
+
+/* cpumask_last: highest present CPU index.  Single-CPU host → 0. */
+#define cpumask_last(mask)              0U
+
+/*
+ * cpu_present_map: reuse cpu_online_map which is already defined as a
+ * static cpumask_t in page-alloc-shim.h.
+ */
+#define cpu_present_map                 cpu_online_map
+#define cpu_present(i)                  ((i) == 0U)
+
+/*
+ * last_node(mask): index of the highest-set bit in the nodemask.
+ * nodemask_t is unsigned long in this test environment (harness.h).
+ * Return MAX_NUMNODES-1 so num_nodes = MAX_NUMNODES consistently with
+ * num_online_nodes().
+ */
+#define last_node(mask)                 ((int)(MAX_NUMNODES - 1))
+
+/* CPU topology: single-socket single-core test host. */
+#ifdef __x86_64__
+#define cpu_to_core(cpu)                ((void)(cpu), 0U)
+#define cpu_to_socket(cpu)              ((void)(cpu), 0U)
+#endif
+
+/* get_upper_mfn_bound: arch-specific stub; return 0 for the test. */
+#define get_upper_mfn_bound()           0UL
+
+/* arch_do_physinfo: no-op arch extension to XEN_SYSCTL_physinfo. */
+#define arch_do_physinfo(pi)            ((void)(pi))
+
+/* arch_do_sysctl: fall-through for unrecognised sysctl commands. */
+#define arch_do_sysctl(op, u)           ((void)(op), (void)(u), -EOPNOTSUPP)
+
+/*
+ * cpu_khz: nominal 1 GHz for the test environment.
+ *
+ * Using a variable rather than a macro avoids the preprocessor expanding
+ * the name inside struct-member access expressions like pi->cpu_khz.
+ */
+static unsigned long cpu_khz = 1000000UL;
+
+/* IOMMU: not configured in the test environment. */
+#define iommu_enabled      false
+#define iommu_hap_pt_share false
+
+/*
+ * vmtrace_available is already #define'd false via xen/domain.h when
+ * CONFIG_VMTRACE is not set.
+ *
+ * vpmu_is_available is declared extern in xen/domain.h with no CONFIG
+ * guard; shadow it here so no definition is needed at link time.
+ */
+#define vpmu_is_available false
+
+/* xen/grant_table.h is blocked by __XEN_GRANT_TABLE_H__ in memory-shim.h. */
+#define opt_gnttab_max_version 0
+#endif
+#endif
diff --git a/tools/tests/native/harness/sysctl-wrapper.h b/tools/tests/native/harness/sysctl-wrapper.h
new file mode 100644
index 000000000000..48857bbc800b
--- /dev/null
+++ b/tools/tests/native/harness/sysctl-wrapper.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Wrapper around xen/common/sysctl.c for the allocator test framework.
+ *
+ * Includes the real sysctl.c directly in its translation unit.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_SYSCTL_WRAPPER_H
+#define TOOLS_TESTS_NATIVE_HARNESS_SYSCTL_WRAPPER_H
+#ifdef TEST_WRAP_XEN_COMMON_SYSCTL_C
+
+#include "sysctl-shim.h"
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#pragma GCC diagnostic ignored "-Wunused-variable"
+#pragma GCC diagnostic ignored "-Wunused-function"
+#include "../../xen/common/sysctl.c"
+#pragma GCC diagnostic pop
+
+#define TEST_WRAP_TOOLS_INCLUDE_XENCTRL_H
+#include "xenctrl-shim.h"
+
+int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl)
+{
+    /* Convert from sysctl pointer to xen_sysctl_t handle */
+    union {
+        XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) handle;
+        struct xen_sysctl *ptr;
+    } u = { .ptr = sysctl };
+
+    sysctl->interface_version = XEN_SYSCTL_INTERFACE_VERSION;
+    ASSERT(xch == &test_xc_handle);
+    return do_sysctl(u.handle); /* Call xen/common/sysctl.c's do_sysctl() */
+}
+
+#endif
+#endif
diff --git a/tools/tests/native/harness/testcase-asserts.h b/tools/tests/native/harness/testcase-asserts.h
new file mode 100644
index 000000000000..ac850a8fb052
--- /dev/null
+++ b/tools/tests/native/harness/testcase-asserts.h
@@ -0,0 +1,310 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Functions for running test cases and reporting results.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_TESTCASE_ASSERTS_H
+#define TOOLS_TESTS_NATIVE_HARNESS_TESTCASE_ASSERTS_H
+
+/* Common macros compatible with the test environment. */
+#include "xen-macros.h"
+
+/* Macros for assertions and test case management. */
+#ifndef _SUBPATH_
+#define _SUBPATH_ "tools/tests/native"
+#endif
+#define __used __attribute__((__used__))
+#define assert_failed_str "Assertion failed: "
+#define CHECK(condition, fmt, ...)                                    \
+        testcase_assert(condition, __FILE__, __LINE__, __func__, fmt, \
+                        ##__VA_ARGS__)
+#define ASSERT(x) \
+        testcase_assert(x, __FILE__, __LINE__, __func__, assert_failed_str #x)
+#define BUG_ON(x) \
+        testcase_assert(!(x), __FILE__, __LINE__, __func__, "BUG_ON: " #x)
+#define ASSERT_UNREACHABLE() assert(false)
+#define EXPECT_FAIL_BEGIN() (testcase_assert_expect_fail = true)
+#define EXPECT_FAIL_END(c) testcase_assert_check_expected_failures(c)
+
+/* Structure to hold information about each test case. */
+struct testcase {
+    const char *name;              /* test case name */
+    const char *tid;               /* Test ID */
+    int         intarg;            /* passed to the test case */
+    void        (*func)(int);      /* Test case function */
+    int         passed_asserts;    /* Number of ASSERTS that passed. */
+    int         expected_failures; /* Number of XFAILs */
+    bool        disabled;          /* Whether the test case is disabled */
+    bool        failed;            /* Whether the test case failed */
+} testcases[40];
+
+/* Global variables to track the current test case and assertion results. */
+struct testcase *current_testcase = testcases;
+static bool testcase_assert_expect_fail = false;
+static bool testcase_assert_verbose_assertions;
+static int testcase_assert_verbose_indent_level;
+static int testcase_assert_expected_failures;
+static int testcase_assert_expected_failures_total;
+static int testcase_assert_successful_assert_total;
+static void (*testcase_init_func)(int);
+static char **testcase_assert_enabled_tests;
+static const char *testcase_program_name;
+static const char *testcase_assert_current_func;
+
+/* Print a report for a single test, including its ID, name, and results. */
+static void testcase_print_tid_report(struct testcase *tc)
+{
+    printf("- %-5s %-34s %2d: ", tc->tid, tc->name, tc->intarg);
+    if ( tc->disabled )
+        printf("    disabled"); /* This test case was disabled */
+    else
+    {
+        printf("%3d assertions passed", tc->passed_asserts);
+        if ( tc->failed )
+            printf(" (FAILED)");
+        if ( tc->expected_failures )
+            printf(" (%2d XFAIL)", tc->expected_failures);
+    }
+    printf("\n");
+}
+
+/* Print a summary of all test cases, including totals of the enabled tests. */
+static void testcase_print_summary(void)
+{
+    int total_asserts = 0, expected_failures = 0;
+
+    printf("\nTest Report:\n");
+
+    current_testcase = testcases;
+    for ( size_t i = 0; i < ARRAY_SIZE(testcases) && current_testcase->func;
+          i++ )
+    {
+        testcase_print_tid_report(current_testcase);
+        total_asserts += current_testcase->passed_asserts;
+        expected_failures += current_testcase->expected_failures;
+        current_testcase++;
+    }
+    current_testcase->tid = "Total";
+    current_testcase->name = "";
+    current_testcase->passed_asserts = total_asserts;
+    current_testcase->expected_failures = expected_failures;
+    current_testcase->intarg = current_testcase - testcases;
+    testcase_print_tid_report(current_testcase);
+
+    /* Print if testcase_assert_enabled_tests has tests which were enabled */
+    if ( *testcase_assert_enabled_tests )
+    {
+        printf("\nEnabled tests:");
+        for ( char **p = testcase_assert_enabled_tests; *p; p++ )
+        {
+            printf(" %s", *p);
+            /* Check if the enabled test was actually run, if not print a warning. */
+            bool found = false;
+            current_testcase = testcases;
+            for ( size_t i = 0;
+                  i < ARRAY_SIZE(testcases) && current_testcase->func; i++ )
+            {
+                if ( strcmp(current_testcase->tid, *p) == 0 )
+                {
+                    found = true;
+                    break;
+                }
+                current_testcase++;
+            }
+            if ( !found )
+                printf(" (WARNING: test not found)");
+        }
+        printf("\n");
+    }
+}
+
+/* Print a test report and complete the test program successfully. */
+static int test_complete(void)
+{
+    testcase_print_summary();
+    printf("\nTest program %s completed.\n", testcase_program_name);
+    return 0;
+}
+
+/* Print a test report and abort the test program. */
+static void test_abort(void)
+{
+    testcase_print_summary();
+    printf("\nTest program %s aborted.\n", testcase_program_name);
+    abort();
+}
+
+/* Check if the expected number of assertion failures occurred. */
+static void __used testcase_assert_check_expected_failures(int expected)
+{
+    if ( testcase_assert_expected_failures != expected )
+    {
+        fprintf(stderr, "Expected %d assertion failures, got %d\n",
+                expected, testcase_assert_expected_failures);
+        current_testcase->failed = true;
+        test_abort();
+    }
+    testcase_assert_expect_fail = false;
+    testcase_assert_expected_failures = 0;
+    testcase_assert_expected_failures_total += expected;
+}
+
+/* Set up the initialization function for a test case. */
+static void __used setup_testcase_init_func(void (*init_fn)(int))
+{
+    testcase_init_func = init_fn;
+}
+
+/* Assert a condition, record the result and print a message if it fails. */
+__attribute__((format(printf, 5, 6)))
+static void testcase_assert(bool condition, const char *file, int line,
+                            const char *func, const char *fmt, ...)
+{
+    va_list ap;
+    const char *relpath = file;
+
+    fflush(stdout);
+    while ( (file = strstr(relpath, "../")) )
+        relpath += 3;
+
+    va_start(ap, fmt);
+    if ( testcase_assert_expect_fail )
+    {
+        fprintf(stderr, "\n- Test assertion %s at %s:%d:\n  ",
+                condition ? "unexpectedly passed" : "failed as expected",
+                relpath, line);
+        vfprintf(stderr, fmt, ap);
+        fprintf(stderr, "\n\n");
+
+        if ( condition )
+        {
+            current_testcase->failed = true;
+            test_abort(); /* Unexpected pass, treat as test failure */
+        }
+        else
+            testcase_assert_expected_failures++; /* Count for the report. */
+        goto out;
+    }
+    if ( !condition )
+    {
+        fprintf(stderr, "Test assertion failed at %s:%d: ", relpath, line);
+        vfprintf(stderr, fmt, ap);
+        fprintf(stderr, "\n\n%s/%s:%d, %s():\n", _SUBPATH_, relpath, line, func);
+        fprintf(stderr, "Testcase %s(%s, %d) failed!\n", current_testcase->name,
+                current_testcase->tid, current_testcase->intarg);
+        current_testcase->failed = true;
+        test_abort();
+    }
+    testcase_assert_successful_assert_total++;
+    if ( testcase_assert_verbose_assertions )
+    {
+        if ( strncmp(fmt, assert_failed_str, strlen(assert_failed_str)) == 0 )
+            fmt += strlen(assert_failed_str);
+
+        if ( strcmp(fmt, "ret == 0") == 0 )
+            goto out;
+
+        for ( int i = 0; i < testcase_assert_verbose_indent_level; i++ )
+            printf("  ");
+
+        printf("%s:%d: ", relpath, line);
+        if ( (testcase_assert_current_func == NULL ||
+              strcmp(testcase_assert_current_func, func)) &&
+             (strncmp(relpath, "test-", strlen("test-")) &&
+              strncmp(func, "test_", strlen("test_"))) )
+            printf("%s(): ", func);
+
+        if ( strncmp(fmt, "BUG_ON:", 7) )
+            printf("ASSERT(");
+
+        vprintf(fmt, ap);
+
+        if ( strncmp(fmt, "BUG_ON:", 7) )
+            printf(")");
+
+        printf("\n");
+    }
+ out:
+    va_end(ap);
+}
+
+/* Run a test case function with the given argument and report results. */
+static void run_testcase(void (*case_func)(int), int int_arg, const char *tid,
+                         const char *case_name)
+{
+    current_testcase->name = case_name;
+    current_testcase->func = case_func;
+    current_testcase->intarg = int_arg;
+    current_testcase->tid = tid;
+    current_testcase->passed_asserts = 0;
+    current_testcase->expected_failures = 0;
+
+    if ( *testcase_assert_enabled_tests )
+    {
+        bool enabled = false;
+
+        for ( char **p = testcase_assert_enabled_tests; *p; p++ )
+        {
+            if ( strcmp(*p, tid) == 0 )
+            {
+                enabled = true;
+                break;
+            }
+        }
+        if ( !enabled )
+        {
+            current_testcase->disabled = true;
+            goto skip;
+        }
+    }
+    printf("\nTest Case: %s...\n", case_name);
+
+    if ( testcase_init_func && int_arg >= 0 )
+        testcase_init_func(int_arg);
+
+    case_func(int_arg);
+
+    current_testcase->passed_asserts = testcase_assert_successful_assert_total;
+    current_testcase->expected_failures =
+        testcase_assert_expected_failures_total;
+
+    testcase_assert_successful_assert_total = 0;
+    testcase_assert_expected_failures_total = 0;
+
+    printf("\nResults:\n");
+    testcase_print_tid_report(current_testcase);
+ skip:
+    current_testcase++;
+    if ( current_testcase - testcases >= (long)ARRAY_SIZE(testcases) )
+    {
+        fprintf(stderr, "Too many tests, increase the size of testcases[]\n");
+        test_abort();
+    }
+}
+
+/* Macro to run a test case with the given ID, function, and argument. */
+#define RUN_TESTCASE(tid, func, arg) run_testcase(func, arg, tid, #func)
+
+/* Parse command-line arguments and return the program name. */
+static const char *parse_args(int argc, char *argv[], const char *topic)
+{
+    const char *program_name = argv[0];
+    (void)argc;
+
+    program_name = strrchr(program_name, '/');
+    if ( program_name )
+        program_name++;
+    else
+        program_name = argv[0];
+
+    testcase_assert_enabled_tests = &argv[1];
+    printf("Program: %s\n", program_name);
+    printf("Topic  : %s\n", topic);
+    memset(testcases, 0, sizeof(testcases));
+    testcase_program_name = program_name;
+    return program_name;
+}
+
+#endif
diff --git a/tools/tests/native/harness/xc-domain-env.h b/tools/tests/native/harness/xc-domain-env.h
new file mode 100644
index 000000000000..0d4c6821729b
--- /dev/null
+++ b/tools/tests/native/harness/xc-domain-env.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Wrapper around tools/libs/ctrl/xc_domain.c for the allocator test harness.
+ *
+ * The test framework includes the real xc_domain.c directly in its
+ * translation unit, together with a small shim for the libxc internals it
+ * uses and a proxy that redirects do_domctl(xch, domctl) to the wrapped Xen
+ * domctl handler already present in this harness.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_XC_DOMAIN_ENV_H
+#define TOOLS_TESTS_NATIVE_HARNESS_XC_DOMAIN_ENV_H
+#ifdef TEST_ENABLE_XC_DOMAIN_C
+
+#define TEST_WRAP_XEN_COMMON_DOMCTL_C
+#include "domctl-wrapper.h"
+
+#define TEST_WRAP_TOOLS_INCLUDE_XENCTRL_H
+#include "xenctrl-shim.h"
+
+/* Hypercall passthrough of xc's do_domctl() to the hypervisor's do_domctl() */
+static inline int do_domctl_hypervisor_passthrough(xc_interface *xch,
+                                                   struct xen_domctl *domctl)
+{
+    /* Convert from domctl pointer to xen_domctl_t handle */
+    union {
+        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) handle;
+        struct xen_domctl *ptr;
+    } u = { .ptr = domctl };
+
+    domctl->interface_version = XEN_DOMCTL_INTERFACE_VERSION;
+    ASSERT(xch == &test_xc_handle);
+    return do_domctl(u.handle); /* Call xen/common/domctl.c's do_domctl() */
+}
+
+/* Make do_domctl() calls in libs/ctrl/xc_domain.c use the passthrough */
+#define do_domctl do_domctl_hypervisor_passthrough
+
+/* Include the real tools/libs/ctrl/xc_domain.c */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wsign-compare"
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#include <../libs/ctrl/xc_domain.c>
+#pragma GCC diagnostic pop
+
+/* Assert claim set via xc_domain_claim_memory(XEN_DOMCTL_CLAIM_MEMORY_GET) */
+void assert_claims_via_domctl(xc_interface *xch, struct domain *d,
+                              uint32_t expected_entries,
+                              xen_memory_claim_t *expected_claims,
+                              const char *file, int line, const char *func)
+{
+    uint32_t entries = expected_entries;
+    xen_memory_claim_t claim_set[expected_entries];
+    int ret = xc_domain_claim_memory(xch, d->domain_id,
+                                     XEN_DOMCTL_CLAIM_MEMORY_GET,
+                                     &entries, claim_set);
+
+    testcase_assert(ret == 0, file, line, func, "XEN_DOMCTL_CLAIM_MEMORY_GET");
+    testcase_assert(entries == expected_entries, file, line, func,
+                    "Got %u entries", entries);
+
+    for ( uint32_t i = 0; i < expected_entries; i++ )
+        testcase_assert(claim_set[i].pages == expected_claims[i].pages &&
+                        claim_set[i].target == expected_claims[i].target,
+                        file, line, func,
+                        "Entry %u: node %u with %" PRIu64 " pages",
+                        i, claim_set[i].target, claim_set[i].pages);
+}
+
+/* Assert the current claim set for a domain matches the expected set. */
+#define CLAIMS(d, claim_set)                                               \
+        assert_claims_via_domctl(xch, d, ARRAY_SIZE(claim_set), claim_set, \
+                                 __FILE__, __LINE__, __func__)
+
+#endif
+#endif
diff --git a/tools/tests/native/harness/xen-macros.h b/tools/tests/native/harness/xen-macros.h
new file mode 100644
index 000000000000..e13b49aa5d78
--- /dev/null
+++ b/tools/tests/native/harness/xen-macros.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Provide basic macros expected by Xen hypervisor code for native compilation.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_XEN_MACROS_H
+#define TOOLS_TESTS_NATIVE_HARNESS_XEN_MACROS_H
+
+/*
+ * Central list if glibc headers to include in the test context, to ensure
+ * that the Xen-specific versions of certain functions are used.
+ *
+ * Standard ffs/ffsl and gcc's built-ins are signed, Xen's are unsigned
+ */
+#define ffs glibc_ffs
+#define ffsl glibc_ffsl
+#include <assert.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#undef ffs
+#undef ffsl
+/* xen/config.h defines these without value, glibc defines them with value */
+#undef __LITTLE_ENDIAN
+#undef __BIG_ENDIAN
+
+/*
+ * In Xen, STATIC_IF(x) and config_enabled(x) are defined in kconfig.h,
+ * which cannot be included here. Define the required subset locally.
+ */
+#define STATIC_IF(option)        static_if(option)
+#define static_if(value)         _static_if(__ARG_PLACEHOLDER_##value)
+#define _static_if(arg1_or_junk) ___config_enabled(arg1_or_junk static, )
+#define __ARG_PLACEHOLDER_1      0,
+#define IS_ENABLED(opt)          config_enabled(opt)
+#define config_enabled(cfg)      _config_enabled(cfg)
+#define _config_enabled(value)   __config_enabled(__ARG_PLACEHOLDER_##value)
+
+#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 1, 0)
+
+#define ___config_enabled(__ignored, val, ...) val
+
+/*
+ * Reuse the Xen-tools macros from common-macros.h. They are not
+ * necessarily identical to the hypervisor variants, but they are close
+ * enough for this test environment.
+ */
+#include <xen-tools/common-macros.h>
+
+/* Undefine conflicting macros from the Xen-tools headers. */
+#undef BUILD_BUG_ON
+#undef container_of
+#undef MASK_INSR
+#undef MASK_EXTR
+#undef ROUNDUP
+#undef ARRAY_SIZE
+#undef min
+#undef max
+#undef min_t
+#undef max_t
+#undef __nonnull
+#undef offsetof
+#undef __AC
+#undef _AC
+
+/* Include Xen headers for compiler, macros, and page size definitions. */
+#include <xen/compiler.h>
+#include <xen/macros.h>
+#include <xen/page-size.h>
+
+/* Define Xen-specific macros and functions for the test environment. */
+#define domain_crash(d)           ((void)(d))
+#define PRI_mfn                   "05lx"
+#define PRI_stime                 "lld"
+#define dprintk(level, fmt, ...)  printk(fmt, ##__VA_ARGS__)
+#define gdprintk(level, fmt, ...) printk(fmt, ##__VA_ARGS__)
+#define gprintk(level, fmt, ...)  printk(fmt, ##__VA_ARGS__)
+#define panic(fmt, ...)          (printk(fmt, ##__VA_ARGS__), abort())
+#define printk(...)              (fflush(stdout), fprintf(stderr, __VA_ARGS__))
+#define ACCESS_ONCE(x)           (x)
+
+__attribute__((format(printf, 5, 6)))
+static void testcase_assert(bool condition, const char *file, int line,
+                            const char *func, const char *fmt, ...);
+
+static int testcase_assert_expect_to_hit_bug;
+
+/* The BUG() macro for the test environment */
+#define BUG() test_bug(__FILE__, __LINE__, __func__)
+
+/* If the test expects to hit a bug, log it. Otherwise assert and fail. */
+static void test_bug(const char *file, int line, const char *func)
+{
+    fflush(stdout);
+    if ( testcase_assert_expect_to_hit_bug )
+    {
+        printk("\n%s:%d: WE INVOKED a XEN BUG in %s()\n\n", file, line, func);
+        testcase_assert_expect_to_hit_bug = false;
+        return;
+    }
+    testcase_assert(false, file, line, func, "Unexpected XEN BUG WAS INVOKED");
+}
+
+/* The test environment needs to define these as __used */
+#define __initdata
+#define __init        __used
+#define __initconst   __used
+#define __initsetup   __used
+#define __initcall(f) static int __used (*f##_ptr)(void) = (f)
+#endif
diff --git a/tools/tests/native/harness/xenctrl-shim.h b/tools/tests/native/harness/xenctrl-shim.h
new file mode 100644
index 000000000000..4c90cd6222f1
--- /dev/null
+++ b/tools/tests/native/harness/xenctrl-shim.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Minimal shim to include tools/libs/ctrl/xc_domain.c in native tests.
+ *
+ * This shim provides the small subset of libxc internals that xc_domain.c
+ * needs so the allocator harness can exercise libxenctrl paths without
+ * a live Xen instance.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_NATIVE_HARNESS_XENCTRL_SHIM_H
+#define TOOLS_TESTS_NATIVE_HARNESS_XENCTRL_SHIM_H
+#ifdef TEST_WRAP_TOOLS_INCLUDE_XENCTRL_H
+#include "common.h"
+
+/*
+ * This file replaces the private APIs of xc_private.h. By doing this, we can
+ * include xc_domain.c in the test context and test its functionality without
+ * needing a live Xen instance. The functions defined here are minimal
+ * implementations that allow the test cases to run without errors, while
+ * still exercising the relevant code paths in xc_domain.c.
+ *
+ * This enables calling the Xen hypervisor code built into the test program
+ * from the libxenctrl APIs inside the native test environment.
+ */
+#define XC_PRIVATE_H
+
+/* Include xenctrl.h into the test context for libxc integration testing */
+#define __XEN_KEXEC_H__
+#include <public/version.h>
+#include <public/kexec.h>
+
+/* xenctrl.h conflicts with the Xen hypervisor define, it should be renamed */
+#define XEN_INVALID_MFN _mfn(INVALID_MFN_RAW)
+#undef INVALID_MFN
+#define XEN_BARRIER_H /* riscv is missing in tools/include/xen-barrier.h */
+#include <xenctrl.h>
+#undef INVALID_MFN
+#define INVALID_MFN XEN_INVALID_MFN
+
+struct xc_interface_core {
+    void *xcall;
+};
+
+/* Provision a xc_interface handle for the test context */
+static xc_interface test_xc_handle, *xch = &test_xc_handle;
+
+enum {
+    XC_HYPERCALL_BUFFER_BOUNCE_NONE = 0,
+    XC_HYPERCALL_BUFFER_BOUNCE_IN   = 1,
+    XC_HYPERCALL_BUFFER_BOUNCE_OUT  = 2,
+    XC_HYPERCALL_BUFFER_BOUNCE_BOTH = 3,
+};
+
+xc_hypercall_buffer_t XC__HYPERCALL_BUFFER_NAME(HYPERCALL_BUFFER_NULL) =
+{
+    .hbuf = NULL,
+    .param_shadow = NULL,
+    HYPERCALL_BUFFER_INIT_NO_BOUNCE
+};
+
+#define PERROR(_m, _a ...) ((void)0)
+#define DPRINTF(_m, _a ...) ((void)0)
+
+#define DECLARE_NAMED_HYPERCALL_BOUNCE(_name, _ubuf, _sz, _dir)    \
+        xc_hypercall_buffer_t XC__HYPERCALL_BUFFER_NAME(_name) = { \
+            .hbuf = NULL,                                          \
+            .param_shadow = NULL,                                  \
+            .sz = (_sz),                                           \
+            .dir = (_dir),                                         \
+            .ubuf = (_ubuf),                                       \
+        }
+
+#define DECLARE_HYPERCALL_BOUNCE(_ubuf, _sz, _dir) \
+        DECLARE_NAMED_HYPERCALL_BOUNCE(_ubuf, _ubuf, _sz, _dir)
+
+#define HYPERCALL_BOUNCE_SET_SIZE(b, s) ((HYPERCALL_BUFFER(b))->sz = (s))
+
+void *xc__hypercall_buffer_alloc(xc_interface *xch,
+                                 xc_hypercall_buffer_t *b,
+                                 size_t size)
+{
+    (void)xch;
+    b->hbuf = calloc(size ? size : 1, 1);
+    return b->hbuf;
+}
+
+void xc__hypercall_buffer_free(xc_interface *xch,
+                               xc_hypercall_buffer_t *b)
+{
+    (void)xch;
+    free(b->hbuf);
+    b->hbuf = NULL;
+}
+
+void *xc__hypercall_buffer_alloc_pages(xc_interface *xch,
+                                       xc_hypercall_buffer_t *b,
+                                       int nr_pages)
+{
+    return xc__hypercall_buffer_alloc(xch, b,
+                                      (size_t)(nr_pages ? nr_pages : 1) *
+                                      XC_PAGE_SIZE);
+}
+
+void xc__hypercall_buffer_free_pages(xc_interface *xch,
+                                     xc_hypercall_buffer_t *b,
+                                     int nr_pages)
+{
+    (void)nr_pages;
+    xc__hypercall_buffer_free(xch, b);
+}
+
+static inline int xc__hypercall_bounce_pre(xc_interface *xch,
+                                           xc_hypercall_buffer_t *b)
+{
+    (void)xch;
+    if ( b->ubuf == (void *)-1 || b->dir == XC_HYPERCALL_BUFFER_BOUNCE_NONE )
+        abort();
+    b->hbuf = b->ubuf;
+    return 0;
+}
+
+static inline void xc__hypercall_bounce_post(xc_interface *xch,
+                                             xc_hypercall_buffer_t *b)
+{
+    (void)xch;
+    if ( b->ubuf == (void *)-1 || b->dir == XC_HYPERCALL_BUFFER_BOUNCE_NONE )
+        abort();
+    b->hbuf = NULL;
+}
+
+#define xc_hypercall_bounce_pre(_xch, _name) \
+        xc__hypercall_bounce_pre(_xch, HYPERCALL_BUFFER(_name))
+
+#define xc_hypercall_bounce_post(_xch, _name) \
+        xc__hypercall_bounce_post(_xch, HYPERCALL_BUFFER(_name))
+
+static inline int xencall2(void *xcall, unsigned int op,
+                           unsigned long arg1, unsigned long arg2)
+{
+    (void)xcall;
+    (void)op;
+    (void)arg1;
+    (void)arg2;
+    errno = EOPNOTSUPP;
+    return -1;
+}
+
+int xc_get_cpumap_size(xc_interface *xch)
+{
+    (void)xch;
+    return 1;
+}
+
+int xc_get_nodemap_size(xc_interface *xch)
+{
+    (void)xch;
+    return sizeof(unsigned long);
+}
+
+static inline bool xc_core_arch_auto_translated_physmap(
+    const xc_domaininfo_t *info)
+{
+    (void)info;
+    return false;
+}
+
+#endif
+
+#endif
\ No newline at end of file
-- 
2.39.5


