Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHEmI/wo5mnesgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:24:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFA42BA2E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285823.1567054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEoba-0005Gj-1S; Mon, 20 Apr 2026 13:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285823.1567054; Mon, 20 Apr 2026 13:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEobZ-0005EC-Ub; Mon, 20 Apr 2026 13:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1285823;
 Mon, 20 Apr 2026 13:24:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wEobY-0005E4-Sq
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:24:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEobW-008KMW-OI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:24:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e628ee-2eae-0a2a0a5409dd-0a2a450b988e-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:24:00 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e628ef-212f-0a2a450b0019-a0658309e0a6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:23:59 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 0F5B78185701;
 Mon, 20 Apr 2026 09:23:02 -0400 (EDT)
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
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/4] tools/tests/alloc: Add Page Allocator Test Environment
Date: Mon, 20 Apr 2026 14:19:41 +0100
Message-Id: <3c17deb670d5471f2a5df04084e2a88e62502343.1776690702.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776690702.git.bernhard.kaindl@citrix.com>
References: <cover.1776690702.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776691440-246B7F3B-55BC0E22/0/0
X-purgate-type: clean
X-purgate-size: 56028
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.638];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: C9DFA42BA2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide a small, self-contained test environment for Xen's page allocator.

Instead of reimplementing allocator logic in a model, these tests compile
the real allocator code into ordinary host executables and exercise it in a
controlled environment with a synthetic Xen heap and domain state. This
gives direct visibility into allocator state while keeping the test harness
self-contained.

This is intended for scenarios that are difficult to cover with system-level
testing alone, such as:

* inspecting NUMA claims in response to allocator operations
* rebuilding buddies after offlining subpages
* reproducing edge cases while inspecting heap state during allocation and
  free operations

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/Makefile                   |   1 +
 tools/tests/alloc/.gitignore           |   7 +
 tools/tests/alloc/Makefile             | 141 +++++++++
 tools/tests/alloc/README.rst           |  98 ++++++
 tools/tests/alloc/check-asserts.h      | 225 ++++++++++++++
 tools/tests/alloc/harness.h            |  57 ++++
 tools/tests/alloc/hypervisor-macros.h  |  95 ++++++
 tools/tests/alloc/libtest-page-alloc.h | 145 +++++++++
 tools/tests/alloc/mock-page-list.h     | 167 ++++++++++
 tools/tests/alloc/page-alloc-shim.h    | 411 +++++++++++++++++++++++++
 tools/tests/alloc/page-alloc-wrapper.h |  64 ++++
 11 files changed, 1411 insertions(+)
 create mode 100644 tools/tests/alloc/.gitignore
 create mode 100644 tools/tests/alloc/Makefile
 create mode 100644 tools/tests/alloc/README.rst
 create mode 100644 tools/tests/alloc/check-asserts.h
 create mode 100644 tools/tests/alloc/harness.h
 create mode 100644 tools/tests/alloc/hypervisor-macros.h
 create mode 100644 tools/tests/alloc/libtest-page-alloc.h
 create mode 100644 tools/tests/alloc/mock-page-list.h
 create mode 100644 tools/tests/alloc/page-alloc-shim.h
 create mode 100644 tools/tests/alloc/page-alloc-wrapper.h

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 6477a4386dda..ca3de4c7b54a 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS-y :=
+SUBDIRS-y += alloc
 SUBDIRS-y += domid
 SUBDIRS-y += mem-claim
 SUBDIRS-y += paging-mempool
diff --git a/tools/tests/alloc/.gitignore b/tools/tests/alloc/.gitignore
new file mode 100644
index 000000000000..b0597936e234
--- /dev/null
+++ b/tools/tests/alloc/.gitignore
@@ -0,0 +1,7 @@
+/test-claims-basic
+/test-claims-numa-install
+/test-claims-numa-redeem
+/test-online-page
+/test-offlining-claims
+/test-reserve-offline-page
+/test-unaligned-buddies
diff --git a/tools/tests/alloc/Makefile b/tools/tests/alloc/Makefile
new file mode 100644
index 000000000000..f5724aa3f699
--- /dev/null
+++ b/tools/tests/alloc/Makefile
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Makefile for tools/tests/alloc
+
+XEN_ROOT := $(abspath $(CURDIR)/../../..)
+include $(XEN_ROOT)/tools/Rules.mk
+RELDIR := $(subst $(XEN_ROOT)/,,$(CURDIR))
+
+TEST_SOURCES := $(notdir $(wildcard test-*.c))
+TARGETS := $(TEST_SOURCES:.c=)
+
+.PHONY: all
+all: $(TARGETS)
+
+define RUN_TESTS
+	@echo "Build configuration:"
+	@echo "CC=$(CC)"
+	@echo "CFLAGS='$(CFLAGS)'"
+	@for test in $? ; do \
+		echo;echo "$(RELDIR): RUN_TESTS: $$test...";echo; \
+		./$$test ; EXIT_CODE=$$? ; \
+		if [ $$EXIT_CODE -ne 0 ]; then \
+			echo "Test $$test failed with exit code $$EXIT_CODE"; \
+			exit 1; \
+		fi; \
+	done
+	@echo
+	@echo "Tests executed successfully:"
+	@for test in $? ; do \
+		echo "  - $$test"; \
+	done
+endef
+
+# Run the tests if possible, otherwise print a warning and skip them.
+.PHONY: run
+# Determine if the tests can be run on the build host. If CC and HOSTCC
+# are the same, we can run the tests directly. If they differ, we check
+# if binfmt-support and qemu-binfmt are available to run the tests under
+# using binfmt-misc using qemu-user-static.
+ifeq ($(CC),$(HOSTCC))
+    TESTS_RUNNABLE=yes
+else
+    BINFMT_SUPP := $(if $(wildcard /etc/init.d/binfmt-support),1,0)
+    QEMU_BINFMT := $(if $(wildcard /usr/libexec/qemu-binfmt),1,0)
+    ifeq ($(BINFMT_SUPP)$(QEMU_BINFMT),11)
+        # Running static binaries doesn't need extra setup besides qemu-binfmt
+        CFLAGS += -static
+        TESTS_RUNNABLE=yes
+    else
+        TESTS_RUNNABLE=no
+    endif
+endif
+
+run: $(TARGETS)
+ifeq ($(TESTS_RUNNABLE),yes)
+	$(RUN_TESTS)
+else
+	$(warning HOSTCC != CC, and qemu-binfmt not detected, skipping alloc tests)
+endif
+
+# Run the tests  binfmt-misc set up
+BINFMT_SUPP := $(if $(wildcard /etc/init.d/binfmt-support),1,0)
+QEMU_BINFMT := $(if $(wildcard /usr/libexec/qemu-binfmt),1,0)
+.PHONY: run-tests
+run-tests: $(TARGETS)
+ifeq ($(CC),$(HOSTCC))
+	$(RUN_TESTS)
+else ifeq ($(BINFMT_SUPP)$(QEMU_BINFMT),11)
+	$(RUN_TESTS)
+else
+	$(warning Note: binfmt-support or qemu-user not found, skipping run-tests)
+endif
+
+#
+# Build and run the tests for multiple architectures,
+# skipping if the appropriate cross-compiler is not found.
+# The default XEN_TARGET_ARCH is always built and tested as well.
+# This is gcc-specific, but can be adapted for other toolchains.
+#
+ARCHS := arm64-aarch64-linux-gnu arm32-arm-linux-gnueabihf
+ARCHS += x86_32-i686-linux-gnu x86_64-x86_64-linux-gnu
+ARCHS += ppc64-powerpc64le-linux-gnu riscv64-riscv64-linux-gnu
+.PHONY: run-archs
+run-archs: $(TARGETS)
+ifneq ($(CC),gcc)
+	$(warning run-archs target is only supported with CC=gcc for now, skipping)
+else
+	@set -e;PASSES=;SKIPPED_ARCHS=; \
+	MAKEFLAGS="$$MAKEFLAGS --no-print-directory"; \
+
+	for t in $(ARCHS); do \
+		A=$${t%%-*}; C=$${t#*-}; \
+	    [ $$A != $(XEN_TARGET_ARCH) ] || continue; \
+		if ! type "$${C}-gcc" >/dev/null 2>&1; then \
+	        echo " $${C}-gcc not found, skipping $${A}"; \
+			SKIPPED_ARCHS="$${SKIPPED_ARCHS} $${A}"; continue; \
+	    fi; \
+		if [ $${A} = $(XEN_TARGET_ARCH) ]; then C=$(CROSS_COMPILE); fi; \
+		make XEN_TARGET_ARCH="$${A}" CROSS_COMPILE=$$C- clean run-tests; \
+		PASSES="$${PASSES} $${A}"; \
+	done;\
+	echo "$@ successful for:$${PASSES} $(XEN_TARGET_ARCH)";\
+	[ -z "$${SKIPPED_ARCHS}" ] || echo "Skipped architectures:$${SKIPPED_ARCHS}"
+endif
+
+.PHONY: clean
+.NOTPARALLEL: clean
+clean:
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
+
+# CFLAGS for building the tests
+XEN_INCLUDE_ARCH := $(subst x86_64,x86,$(XEN_COMPILE_ARCH))
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += -I$(XEN_ROOT)/xen/include
+CFLAGS += -I$(XEN_ROOT)/xen/arch/$(XEN_INCLUDE_ARCH)/include
+CFLAGS += $(CFLAGS_xeninclude)
+
+# Enable sanitizers to catch memory errors and undefined behavior in the code
+# for x86_64. Other architectures do not support -fstatic with it.
+ifeq ($(XEN_TARGET_ARCH),x86_64)
+CFLAGS += -fsanitize=address -fsanitize=undefined -fno-common
+endif
+
+# Build rules for the tests
+$(TARGETS): %: %.o $(LIB_OBJ)
+	$(CC) -o $@ $^ $(LDFLAGS) $(CPPFLAGS) $(CFLAGS) $(APPEND_CFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/alloc/README.rst b/tools/tests/alloc/README.rst
new file mode 100644
index 000000000000..f91587d7f4b2
--- /dev/null
+++ b/tools/tests/alloc/README.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Page Allocator Test Environment
+===============================
+
+The files in ``tools/tests/alloc`` provide a small, self-contained test
+environment for Xen's page allocator in ``xen/common/page_alloc.c``.
+
+Instead of reimplementing allocator logic in a model, the tests compile
+the real allocator code into ordinary host executables and exercise it
+inside a controlled environment with a synthetic Xen heap and domain
+state and direct visibility into the allocator's internal state.
+
+This approach is intended for test scenarios that are difficult to cover
+through system-level testing alone, such as:
+
+* rebuilding buddies after offlining subpages,
+* checking page-list and zone accounting after allocator operations,
+* verifying NUMA-aware allocator behaviour in synthetic topologies, and
+* reproducing edge cases with precise control over ``struct page_info``
+    state.
+
+What The Environment Provides
+-----------------------------
+
+The test environment is assembled from a few small components:
+
+* ``harness.h`` defines the common test harness, assertion helpers, and a
+    minimal set of Xen-compatible types and macros used by the allocator.
+
+* ``mock-page-list.h`` provides a lightweight page-list implementation
+    and the ``struct page_info`` layout needed by ``page_alloc.c``.
+
+* ``page-alloc-shim.h`` supplies the Xen definitions, stubs, and mock state
+    that the allocator expects when built inside the test environment.
+
+* ``page-alloc-wrapper.h`` includes the real ``xen/common/page_alloc.c``
+    directly, wraps selected allocator entry points, and adds logging that
+    makes allocator state transitions easier to follow.
+
+* ``libtest-page-alloc.h`` ties the pieces together and adds helpers for
+    common setup tasks such as resetting allocator state, preparing NUMA
+    nodes, creating synthetic buddies, and checking resulting heap state.
+
+The result is a test binary that executes real allocator code while keeping
+the surrounding test environment small, explicit, and easy to inspect.
+
+How Tests Work
+--------------
+
+Each test case starts from a clean allocator state. The library code resets
+the imported allocator globals, initialises the synthetic frame table,
+prepares the free lists and accounting state, and creates a minimal domain
+and NUMA configuration for the scenario.
+
+Tests then construct the required allocator state directly by manipulating
+``struct page_info`` entries in the synthetic frame table and by using the
+same allocator helpers that Xen uses at runtime, such as
+``free_heap_pages()``. This keeps test setup aligned with allocator
+behaviour instead of relying on an idealised model.
+
+After invoking the allocator operation under test, each test scenario checks
+the resulting state through assertion helpers. Typical checks include:
+
+* the content and order of free lists,
+* the contents of the offlined-page and broken-page lists,
+* per-zone and per-node accounting,
+* buddy order and alignment invariants, and
+* page-local state such as ``count_info`` and ``first_dirty``.
+
+Because the wrapper logs important allocator actions, test failures are
+usually accompanied by enough context to show which allocator transition
+broke.
+
+Running The Tests
+-----------------
+
+The ``Makefile`` automatically discovers all ``test-*.c`` files in this
+directory and builds one executable per source file.
+
+To build and run all allocator tests:
+
+.. code:: shell
+
+        make -C tools/tests/alloc clean all run
+
+To build and run a single test binary:
+
+.. code:: shell
+
+        make -C tools/tests/alloc clean all run TARGETS=test-reserve-offline-page
+
+The ``run`` target executes the built tests when they are runnable on the
+build host. If ``CC`` and ``HOSTCC`` differ, it will only attempt execution
+when ``binfmt`` support for the target architecture is available.
+
+For broader coverage, the ``run-archs`` target builds and runs the tests for
+multiple Xen target architectures when suitable cross-compilers are installed.
diff --git a/tools/tests/alloc/check-asserts.h b/tools/tests/alloc/check-asserts.h
new file mode 100644
index 000000000000..fe26de909683
--- /dev/null
+++ b/tools/tests/alloc/check-asserts.h
@@ -0,0 +1,225 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Helpers for assertions used by unit tests.
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef TOOLS_TESTS_ALLOC_CHECK_ASSERTS_H
+#define TOOLS_TESTS_ALLOC_CHECK_ASSERTS_H
+
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/utsname.h>
+
+static bool testcase_assert_expected_to_fail = false;
+static bool testcase_assert_verbose_assertions = true;
+static const char *testcase_assert_current_func = NULL;
+static int testcase_assert_verbose_indent_level = 0;
+static int testcase_assert_expected_failures = 0;
+static int testcase_assert_expected_failures_total = 0;
+static int testcase_assert_successful_assert_total = 0;
+static void (*testcase_init_func)(int);
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
+#define EXPECTED_TO_FAIL_BEGIN() (testcase_assert_expected_to_fail = true)
+#define EXPECTED_TO_FAIL_END(c) testcase_assert_check_expected_failures(c)
+
+static void __used testcase_assert_check_expected_failures(int expected)
+{
+    if ( testcase_assert_expected_failures != expected )
+    {
+        fprintf(stderr, "Expected %d assertion failures, got %d\n",
+                expected, testcase_assert_expected_failures);
+        abort();
+    }
+    testcase_assert_expected_to_fail = false;
+    testcase_assert_expected_failures = 0;
+    testcase_assert_expected_failures_total += expected;
+}
+
+static void __used setup_testcase_init_func(void (*init_fn)(int))
+{
+    testcase_init_func = init_fn;
+}
+
+__attribute__((format(printf, 5, 6)))
+static void testcase_assert(bool condition, const char *file, int line,
+                            const char *func, const char *fmt, ...)
+{
+    va_list ap;
+    const char *relpath = file;
+
+    while ( (file = strstr(relpath, "../")) )
+        relpath += 3;
+
+    va_start(ap, fmt);
+    if ( testcase_assert_expected_to_fail )
+    {
+        fprintf(stderr, "\n- Test assertion %s at %s:%d:\n  ",
+                condition ? "unexpectedly passed" : "failed as expected",
+                relpath, line);
+        vfprintf(stderr, fmt, ap);
+        fprintf(stderr, "\n");
+
+        if ( condition )
+            abort(); /* Unexpected pass, treat as test failure */
+        else
+            testcase_assert_expected_failures++; /* Count for the report. */
+        goto out;
+    }
+    if ( !condition )
+    {
+        fprintf(stderr, "Test assertion failed at %s:%d: ", relpath, line);
+        vfprintf(stderr, fmt, ap);
+        fprintf(stderr, "\n");
+        abort();
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
+out:
+    va_end(ap);
+}
+
+struct testcase {
+    const char *name;              /* test case name */
+    const char *tid;               /* Test ID */
+    int         intarg;            /* passed to the test case */
+    void        (*func)(int);      /* Test case function */
+    int         passed_asserts;    /* Number of ASSERTS that passed. */
+    int         expected_failures; /* Number of XFAILs */
+} testcases[40];
+struct testcase *current_testcase = testcases;
+
+static void print_testcase_report(struct testcase *tc)
+{
+    printf("- %-5s %-34s %2d: %3d assertions passed", tc->tid, tc->name,
+           tc->intarg, tc->passed_asserts);
+    if ( tc->expected_failures )
+        printf(" (%2d XFAIL)", tc->expected_failures);
+    printf("\n");
+}
+
+static void run_testcase(void (*case_func)(int), int int_arg, const char *tid,
+                         const char *case_name)
+{
+    printf("\nTest Case: %s...\n", case_name);
+    current_testcase->name = case_name;
+    current_testcase->func = case_func;
+    current_testcase->intarg = int_arg;
+    current_testcase->tid = tid;
+    current_testcase->passed_asserts = 0;
+    current_testcase->expected_failures = 0;
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
+    print_testcase_report(current_testcase);
+    current_testcase++;
+}
+#define RUN_TESTCASE(tid, func, arg) run_testcase(func, arg, #tid, #func)
+
+static int testcase_print_summary(const char *argv0)
+{
+    struct utsname uts;
+    int total_asserts = 0, expected_failures = 0;
+
+    fprintf(stderr, "\nTest Report:\n");
+
+    current_testcase = testcases;
+    for ( size_t i = 0; i < ARRAY_SIZE(testcases) && current_testcase->func;
+          i++ )
+    {
+        print_testcase_report(current_testcase);
+        total_asserts += current_testcase->passed_asserts;
+        expected_failures += current_testcase->expected_failures;
+        current_testcase++;
+    }
+    current_testcase->tid = "Total";
+    current_testcase->name = "";
+    current_testcase->passed_asserts = total_asserts;
+    current_testcase->expected_failures = expected_failures;
+    current_testcase->intarg = current_testcase - testcases;
+    print_testcase_report(current_testcase);
+
+    uname(&uts);
+    printf("\nTest suite %s for %s completed.\n", argv0, uts.machine);
+    return 0;
+}
+
+static const char *parse_args(int argc, char *argv[], const char *topic)
+{
+    const char *program_name = argv[0];
+    struct utsname uts;
+
+    if ( argc != 1 )
+    {
+        fprintf(stderr, "Usage: %s\n", argv[0]);
+        return NULL;
+    }
+    program_name = strrchr(program_name, '/');
+    if ( program_name )
+        program_name++;
+    else
+        program_name = argv[0];
+
+    uname(&uts);
+    printf("Suite : %s\n", program_name);
+    printf("Topic : %s\n", topic);
+    printf("Config: CONFIG_NUMA %s\n",
+           config_enabled(CONFIG_NUMA) ? "enabled" : "disabled");
+#ifndef __clang__
+    printf("Target: gcc %s/%s\n", __VERSION__, uts.machine);
+#else
+    printf("Target: %s/%s\n", __VERSION__, uts.machine);
+#endif
+    return program_name;
+}
+#endif
diff --git a/tools/tests/alloc/harness.h b/tools/tests/alloc/harness.h
new file mode 100644
index 000000000000..e5880cef25cc
--- /dev/null
+++ b/tools/tests/alloc/harness.h
@@ -0,0 +1,57 @@
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
+#include <assert.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdint.h>
+#include <stdio.h>
+
+/* Enable additional debug checks. */
+#define CONFIG_DEBUG
+
+/* Common macros compatible with the test environment. */
+#include "hypervisor-macros.h"
+
+/* Assertion helpers shared by the tests. */
+#include "check-asserts.h"
+
+/* Common Xen types used by the test environment. */
+typedef uint8_t u8;
+typedef uint64_t paddr_t;
+typedef unsigned long cpumask_t;
+typedef long long s_time_t;
+typedef bool spinlock_t;
+
+/*
+ * The original reserve_offlined_page() implementation triggers an
+ * AddressSanitizer (ASAN) stack-buffer-overflow report in both GCC and
+ * Clang when test_merge_tail_pair runs with ASAN enabled and verifies
+ * the heap free-list state.
+ *
+ * ASAN reports several list-pointer errors in the heap state, and one of
+ * them appears to trigger the stack-buffer-overflow detection on x86_64.
+ *
+ * As a temporary workaround, detect whether ASAN is enabled so the test
+ * can skip the ASSERT_LIST_EQUAL verification that triggers the report,
+ * while still running the rest of the case under ASAN.
+ */
+#if defined(__has_feature)
+/* Clang uses __has_feature to detect AddressSanitizer */
+# if __has_feature(address_sanitizer)
+#  define ASAN_ENABLED 1
+# endif
+/* GCC uses __SANITIZE_ADDRESS__ to detect AddressSanitizer */
+#elif defined(__SANITIZE_ADDRESS__)
+# define ASAN_ENABLED 1
+#else
+# define ASAN_ENABLED 0
+#endif
+#endif
diff --git a/tools/tests/alloc/hypervisor-macros.h b/tools/tests/alloc/hypervisor-macros.h
new file mode 100644
index 000000000000..be59d6dd7df5
--- /dev/null
+++ b/tools/tests/alloc/hypervisor-macros.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Common macros and definitions for building host-side unit tests
+ * for the Xen hypervisor.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef TOOLS_TESTS_ALLOC_HYPERVISOR_MACROS_H
+#define TOOLS_TESTS_ALLOC_HYPERVISOR_MACROS_H
+
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+
+/*
+ * In Xen, STATIC_IF(x) and config_enabled(x) are defined in kconfig.h,
+ * which cannot be included here. Define the required subset locally.
+ */
+#define STATIC_IF(option)        static_if(option)
+#define static_if(value)         _static_if(__ARG_PLACEHOLDER_##value)
+#define _static_if(arg1_or_junk) ___config_enabled(arg1_or_junk static, )
+#define __ARG_PLACEHOLDER_1      0,
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
+/*
+ * Predefine the include guards for Xen headers whose hypervisor
+ * variants would otherwise conflict with definitions from
+ * common-macros.h and bitops.h.
+ */
+#define __XEN_CONST_H__
+#define __MACROS_H__
+
+/*
+ * Provide Xen hypervisor macros used by xen/common/page_alloc.c that
+ * common-macros.h does not supply, or redefine them where the test
+ * build must match hypervisor behavior.
+ */
+#define IS_ALIGNED(x, a) (!((x) & ((a) - 1)))
+
+/*
+ * Reuse the Xen-tools bit operations from bitops.h. They are not
+ * necessarily identical to the hypervisor versions, but they are close
+ * enough for this test environment.
+ */
+#include <xen-tools/bitops.h>
+
+/*
+ * After including Xen-tools bitops.h, redefine ffsl and flsl to match
+ * Xen hypervisor behavior. Here they return unsigned int, which matters
+ * for signed/unsigned conversion checks and type expectations. Also
+ * undefine conflicting macros from the Xen-tools headers.
+ */
+#undef BITS_PER_LONG
+#undef __LITTLE_ENDIAN
+#undef __BIG_ENDIAN
+#undef ffsl
+#define ffsl(x) ((unsigned int)__builtin_ffsl(x))
+#define flsl(x) ((unsigned int)((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0))
+
+static bool testcase_assert_expected_to_fail;
+__attribute__((format(printf, 5, 6)))
+static void testcase_assert(bool condition, const char *file, int line,
+                            const char *func, const char *fmt, ...);
+#define BUG()                     assert(false)
+#define domain_crash(d)           ((void)(d))
+#define PRI_mfn                   "lu"
+#define PRI_stime                 "lld"
+#define printk                    printf
+#define dprintk(level, fmt, ...)  printk(fmt, ##__VA_ARGS__)
+#define gdprintk(level, fmt, ...) printk(fmt, ##__VA_ARGS__)
+#define gprintk(level, fmt, ...)  printk(fmt, ##__VA_ARGS__)
+#define panic(fmt, ...)                          \
+        do                                       \
+        {                                        \
+            fprintf(stderr, fmt, ##__VA_ARGS__); \
+            abort();                             \
+        } while ( 0 )
+#define __initdata
+#define __init        __used
+#define __initcall(f) static int __used (*f##_ptr)(void) = (f)
+#endif
diff --git a/tools/tests/alloc/libtest-page-alloc.h b/tools/tests/alloc/libtest-page-alloc.h
new file mode 100644
index 000000000000..2644c87e9c8e
--- /dev/null
+++ b/tools/tests/alloc/libtest-page-alloc.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test framework for xen/common/page_alloc.c.
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_ALLOC_LIBTEST_PAGE_ALLOC_H
+#define TOOLS_TESTS_ALLOC_LIBTEST_PAGE_ALLOC_H
+
+#pragma GCC diagnostic error "-Wextra"
+#include "page-alloc-wrapper.h"
+static const unsigned int node = 0;
+static const unsigned int node0 = 0;
+static const unsigned int node1 = 1;
+static const unsigned int order0 = 0;
+static const unsigned int order1 = 1;
+static const unsigned int order2 = 2;
+
+static heap_by_zone_and_order_t test_heap_storage[MAX_NUMNODES];
+static unsigned long test_avail_storage[MAX_NUMNODES][NR_ZONES];
+struct domain *domain_list;
+
+static void init_numa_node_data(unsigned int start_mfn)
+{
+    (void)start_mfn;
+#ifdef CONFIG_NUMA
+    for ( unsigned int i = 0; i < NR_CPUS; i++ )
+        cpu_to_node[i] = i;
+
+    for ( unsigned int i = 0; i < MAX_NUMNODES; i++ )
+        node_to_cpumask[i] = (1UL << i);
+
+    for ( unsigned int i = 0; i < MAX_NUMNODES; i++ )
+    {
+        node_data[i].node_start_pfn = start_mfn + (i * 8);
+        node_data[i].node_present_pages = 8UL;
+        node_data[i].node_spanned_pages = 8UL;
+    }
+    memnode_shift = 3;
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
+    }
+}
+
+static void reset_page_alloc_state(int start_mfn)
+{
+    unsigned int zone;
+    unsigned int order;
+
+    memset(frame_table, 0, sizeof(frame_table));
+    memset(test_heap_storage, 0, sizeof(test_heap_storage));
+    memset(test_avail_storage, 0, sizeof(test_avail_storage));
+    memset(&test_dummy_domain1, 0, sizeof(test_dummy_domain1));
+    memset(&test_dummy_domain2, 0, sizeof(test_dummy_domain2));
+    memset(&test_current_vcpu, 0, sizeof(test_current_vcpu));
+    INIT_PAGE_LIST_HEAD(&page_offlined_list);
+    INIT_PAGE_LIST_HEAD(&page_broken_list);
+    INIT_PAGE_LIST_HEAD(&test_page_list);
+
+    init_numa_node_data(start_mfn);
+    for ( nodeid_t node = 0; node < MAX_NUMNODES; node++ )
+    {
+        _heap[node] = &test_heap_storage[node];
+        avail[node] = test_avail_storage[node];
+        node_avail_pages[node] = 0;
+        for ( zone = 0; zone < NR_ZONES; zone++ )
+            for ( order = 0; order <= MAX_ORDER; order++ )
+                INIT_PAGE_LIST_HEAD(&heap(node, zone, order));
+    }
+    total_avail_pages = 0;
+    outstanding_claims = 0;
+    first_valid_mfn = start_mfn;
+    max_page = sizeof(frame_table) / sizeof(frame_table[0]);
+    assert(first_valid_mfn < max_page);
+    init_dummy_domains();
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
+    if ( mfn < first_valid_mfn && mfn > 0 && mfn < max_page )
+        first_valid_mfn = mfn;
+
+    if ( mfn >= max_page && mfn < ARRAY_SIZE(frame_table) )
+        max_page = mfn + 1;
+
+    memset(page, 0, sizeof(*page));
+    page->v.free.order = order;
+    page->u.free.first_dirty = INVALID_DIRTY_IDX;
+    page->u.free.scrub_state = BUDDY_NOT_SCRUBBING;
+    page->count_info = state;
+}
+
+static size_t __used page_list_add_buddy(struct page_info *pages,
+                                         unsigned int order,
+                                         const char *caller_file,
+                                         const char *caller_func,
+                                         int caller_line)
+{
+    size_t i, num_pages = 1U << order;
+
+    init_test_page(&pages[0], order, PGC_state_inuse);
+    for ( i = 1; i < num_pages; i++ )
+        init_test_page(&pages[i], order0, PGC_state_inuse);
+    free_heap_pages(&pages[0], order, false);
+
+    if ( page_to_zone(&pages[0]) != page_to_zone(&pages[num_pages - 1]) )
+        testcase_assert(false, caller_file, caller_line, caller_func,
+                        "Buddy of order %u at MFN %lu crosses zones: "
+                        "start zone %u, end zone %u", order,
+                        page_to_mfn(&pages[0]),
+                        page_to_zone(&pages[0]),
+                        page_to_zone(&pages[num_pages - 1]));
+    return page_to_zone(&pages[0]);
+}
+#define test_page_list_add_buddy(pages, order) \
+        page_list_add_buddy(pages, order, __FILE__, __func__, __LINE__)
+#endif
diff --git a/tools/tests/alloc/mock-page-list.h b/tools/tests/alloc/mock-page-list.h
new file mode 100644
index 000000000000..d49f43f60933
--- /dev/null
+++ b/tools/tests/alloc/mock-page-list.h
@@ -0,0 +1,167 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Mock page-list implementation for page allocator tests.
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_ALLOC_MOCK_PAGE_LIST_H
+#define TOOLS_TESTS_ALLOC_MOCK_PAGE_LIST_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#include "harness.h"
+
+#define __XEN_KCONFIG_H
+#undef __nonnull
+#undef offsetof
+#include <xen/config.h>
+#undef cf_check
+#define cf_check __used
+
+#define MAX_ORDER 20
+
+struct page_info {
+    unsigned long count_info;
+    union {
+        struct {
+            unsigned long type_info;
+        } inuse;
+        union {
+            struct {
+                unsigned int  first_dirty : MAX_ORDER + 1;
+#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
+                bool          need_tlbflush : 1;
+                unsigned long scrub_state : 2;
+#define BUDDY_NOT_SCRUBBING 0
+#define BUDDY_SCRUBBING     1
+#define BUDDY_SCRUB_ABORT   2
+            };
+            unsigned long val;
+        } free;
+    } u;
+    union {
+        struct {
+            unsigned int order;
+#define PFN_ORDER(pg) ((pg)->v.free.order)
+        } free;
+        unsigned long type_info;
+    } v;
+    uint32_t          tlbflush_timestamp;
+    struct domain    *owner;
+    struct page_info *list_next;
+    struct page_info *list_prev;
+};
+
+struct page_list_head {
+    struct page_info *head;
+    struct page_info *tail;
+    unsigned int      count;
+};
+static struct page_list_head test_page_list;
+typedef unsigned long mfn_t;
+
+#define PAGE_LIST_HEAD(name) struct page_list_head name = {NULL, NULL, 0}
+
+extern struct page_info frame_table[];
+#define page_to_mfn(pg)   ((mfn_t)((pg) - &frame_table[0]))
+#define mfn_to_page(mfn)  (&frame_table[(mfn)])
+#define mfn_valid(mfn)    (mfn >= first_valid_mfn && mfn < max_page)
+#define maddr_to_page(pa) (CHECK(false, "Not implemented"))
+
+static void test_page_list_init(struct page_list_head *list)
+{
+    list->head = NULL;
+    list->tail = NULL;
+    list->count = 0;
+}
+#define INIT_PAGE_LIST_HEAD(l)       test_page_list_init(l)
+#define page_list_empty(list)        ((list)->head == NULL)
+#define page_list_first(list)        ((list)->head)
+#define page_list_last(list)         ((list)->tail)
+#define page_list_remove_head(list)  test_page_list_del((list)->head, (list))
+#define page_to_list(d, pg)          (&test_page_list)
+#define page_list_add(pg, list)      test_page_list_add(pg, list)
+#define page_list_add_tail(pg, list) test_page_list_add_tail(pg, list)
+#define page_list_del(pg, list)      test_page_list_del(pg, list);
+#define page_list_for_each_safe(pos, tmp, list)        \
+        for ( (pos) = page_list_first(list),           \
+              (tmp) = (pos) ? (pos)->list_next : NULL; \
+              (pos) != NULL;                           \
+              (pos) = (tmp), (tmp) = (pos) ? (pos)->list_next : NULL )
+
+static void test_page_list_add_common(struct page_info *pg,
+                                      struct page_list_head *list,
+                                      bool at_tail)
+{
+    pg->list_next = NULL;
+    pg->list_prev = NULL;
+
+    if ( list->head == NULL )
+    {
+        list->head = pg;
+        list->tail = pg;
+    }
+    else if ( at_tail )
+    {
+        pg->list_prev = list->tail;
+        list->tail->list_next = pg;
+        list->tail = pg;
+    }
+    else
+    {
+        pg->list_next = list->head;
+        list->head->list_prev = pg;
+        list->head = pg;
+    }
+    list->count++;
+}
+
+#define test_page_list_add(pg, list) test_page_list_add_common(pg, list, false)
+#define test_page_list_add_tail(pg, list) \
+        test_page_list_add_common(pg, list, true)
+
+static struct page_info *test_page_list_del(struct page_info *pg,
+                                            struct page_list_head *list)
+{
+    if ( !pg )
+        return NULL;
+    if ( pg->list_prev )
+        pg->list_prev->list_next = pg->list_next;
+    else
+        list->head = pg->list_next;
+
+    if ( pg->list_next )
+        pg->list_next->list_prev = pg->list_prev;
+    else
+        list->tail = pg->list_prev;
+
+    pg->list_next = NULL;
+    pg->list_prev = NULL;
+
+    ASSERT(list->count > 0);
+    list->count--;
+    return pg;
+}
+
+#define PG_shift(idx)         (BITS_PER_LONG - (idx))
+#define PG_mask(x, idx)       (x##UL << PG_shift(idx))
+#define PGT_count_width       PG_shift(2)
+#define PGT_count_mask        ((1UL << PGT_count_width) - 1)
+#define PGC_allocated         PG_mask(1, 1)
+#define PGC_xen_heap          PG_mask(1, 2)
+#define _PGC_need_scrub       PG_shift(4)
+#define PGC_need_scrub        PG_mask(1, 4)
+#define _PGC_broken           PG_shift(7)
+#define PGC_broken            PG_mask(1, 7)
+#define PGC_state             PG_mask(3, 9)
+#define PGC_state_inuse       PG_mask(0, 9)
+#define PGC_state_offlining   PG_mask(1, 9)
+#define PGC_state_offlined    PG_mask(2, 9)
+#define PGC_state_free        PG_mask(3, 9)
+#define page_state_is(pg, st) (((pg)->count_info & PGC_state) == PGC_state_##st)
+#define PGC_count_width       PG_shift(9)
+#define PGC_count_mask        ((1UL << PGC_count_width) - 1)
+#define _PGC_extra            PG_shift(10)
+#define PGC_extra             PG_mask(1, 10)
+#endif
diff --git a/tools/tests/alloc/page-alloc-shim.h b/tools/tests/alloc/page-alloc-shim.h
new file mode 100644
index 000000000000..0e682327fe07
--- /dev/null
+++ b/tools/tests/alloc/page-alloc-shim.h
@@ -0,0 +1,411 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Page allocator shim for xen/common/page_alloc.c.
+ *
+ * This shim provides the minimal Xen definitions that page_alloc.c needs
+ * in the unit-test environment.  It models a minimal subset of the Xen
+ * environment, such as domain and NUMA node management, that page_alloc.c
+ * interacts with, so that the allocator logic so the allocator behaves
+ * as it does in the hypervisor while giving direct visibility into the
+ * allocator state for verification in the tests.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef _TEST_ALLOC_PAGE_ALLOC_SHIM_
+#define _TEST_ALLOC_PAGE_ALLOC_SHIM_
+
+/*
+ * Guard against language servers and linters picking up this header in
+ * the wrong context.
+ *
+ * This header is only intended to be used in the test program for unit
+ * testing functions in xen/common/page_alloc.c, and test programs define
+ * TEST_USES_PAGE_ALLOC_SHIM to enable the definitions in this header.
+ */
+#ifndef TEST_USES_PAGE_ALLOC_SHIM
+#warning "This header is only for use in page_alloc.c unit tests."
+#else
+/*
+ * Inside the intended test context, provide mocks and stub definitions.
+ */
+
+/* Configure the included headers for the test context */
+#ifndef CONFIG_NR_CPUS
+#define CONFIG_NR_CPUS 64
+#endif
+
+#if defined(CONFIG_NUMA) && !defined(CONFIG_NR_NUMA_NODES)
+#define CONFIG_NR_NUMA_NODES 64
+#endif
+
+#define CONFIG_SCRUB_DEBUG
+
+/* Provide struct page_info and related Xen definitions */
+#include "mock-page-list.h"
+
+/* Include the common check_asserts library for test assertions */
+#include "check-asserts.h"
+
+/*
+ * We add the Xen headers to the include path so page_alloc.c can
+ * resolve its #include directives without having to replicate all
+ * headers as actual files in the test tree:
+ *
+ * We define the header guards of those files to prevent unwanted
+ * definitions from those headers that conflict with the test harness.
+ */
+#define XEN_SOFTIRQ_H
+#define XEN__XVMALLOC_H
+#define _LINUX_INIT_H
+#define _XEN_PARAM_H
+#define __LIB_H__ /* C runtime library, only for the hypervisor */
+#define __LINUX_NODEMASK_H
+#define __FLUSHTLB_H__
+#define __SCHED_H__
+#define __SPINLOCK_H__
+#define __TYPES_H__ /* Conflicts with the compiler-provided types */
+#define __VM_EVENT_H__
+#define __X86_PAGE_H__
+#define __XEN_CPUMASK_H
+#define __XEN_EVENT_H__
+#define __XEN_FRAME_NUM_H__
+#define __XEN_IRQ_H__
+#define __XEN_MM_H__
+#define __XEN_PDX_H__
+
+#include <xen/keyhandler.h>
+#include <xen/page-size.h>
+#include <public/xen.h>
+
+/* Include xen/numa.h with stubs and unused parameter warnings disabled */
+#define cpumask_clear_cpu(cpu, mask) ((void)(cpu), (void)(mask))
+#define mfn_to_pdx(mfn)              ((unsigned long)(mfn))
+#pragma GCC diagnostic push
+#ifndef CONFIG_NUMA
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#endif
+#include <xen/numa.h>
+#pragma GCC diagnostic pop
+
+/* Flexible definition to support 32- and 64-bit architectures */
+#undef PADDR_BITS
+#define PADDR_BITS              (BITS_PER_LONG - PAGE_SHIFT)
+#define pfn_to_paddr(pfn)       ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)        ((unsigned long)((pa) >> PAGE_SHIFT))
+#define INVALID_MFN_INITIALIZER (~0UL)
+
+typedef unsigned long nodemask_t;
+
+/* struct domain for testing domain-specific page allocation and claims */
+struct domain {
+    spinlock_t     page_alloc_lock;
+    nodemask_t     node_affinity;
+    nodeid_t       last_alloc_node;
+    domid_t        domain_id;
+    unsigned int   tot_pages;
+    unsigned int   max_pages;
+    unsigned int   extra_pages;
+    unsigned int   global_claims;
+    unsigned int   node_claims;
+    unsigned int   claims[MAX_NUMNODES];
+    unsigned int   xenheap_pages;
+    bool           is_dying;
+    struct domain *next_in_list;
+};
+extern struct domain *domain_list;
+
+struct vcpu {
+    struct domain *domain;
+};
+
+/*
+ * Provide two domains for the test context, so that test helpers can call
+ * allocator functions that require domain context and verify behavior that
+ * depends on domain state, such as claims accounting and page allocation
+ * for specific domains.
+ */
+static struct domain test_dummy_domain1;
+static struct domain test_dummy_domain2;
+static struct domain __used *dom1 = &test_dummy_domain1;
+static struct domain __used *dom2 = &test_dummy_domain2;
+
+/* To provide a current vcpu/domain pair for code paths that inspect it. */
+static unsigned char test_dummy_storage[PAGE_SIZE];
+static struct vcpu test_current_vcpu;
+static struct vcpu *current = &test_current_vcpu;
+static cpumask_t cpu_online_map = ~0UL;
+
+#define for_each_domain(_d) \
+        for ( (_d) = domain_list; (_d) != NULL; (_d) = (_d)->next_in_list )
+#define for_each_online_node(i) for ( (i) = 0; (i) < MAX_NUMNODES; ++(i) )
+#define for_each_cpu(i, mask)   for ( (i) = 0; (i) < 1; ++(i) )
+
+/* dom_cow is a domain pointer used by the memory sharing code */
+#ifdef CONFIG_MEM_SHARING
+static struct domain *dom_cow;
+#else
+#define dom_cow NULL
+#endif
+
+/*
+ * Logging spinlock for the test context
+ */
+static spinlock_t *heap_lock_ptr;
+
+/* Helper function to track spinlock actions for additional context */
+static void print_spinlock(const char *action, spinlock_t *lock,
+                           const char *file, int line, const char *func)
+{
+    const char *relpath = file;
+
+    if ( !testcase_assert_verbose_assertions )
+        return;
+
+    while ( (file = strstr(relpath, "../")) )
+        relpath += 3;
+
+    for ( int i = 0; i < testcase_assert_verbose_indent_level; i++ )
+        printf("  ");
+
+    /* Print the path first:*/
+    if ( testcase_assert_current_func == NULL ||
+         strcmp(testcase_assert_current_func, func) != 0 )
+        printf("%s:%d: %s(): ", relpath, line, func);
+    else
+        printf("%s:%d: ", relpath, line);
+
+    if ( lock == heap_lock_ptr )
+        printf("heap_lock %s\n", action);
+    else if ( domain_list && lock == &test_dummy_domain1.page_alloc_lock )
+        printf("dom1->page_alloc_lock %s\n", action);
+    else if ( domain_list && lock == &test_dummy_domain2.page_alloc_lock )
+        printf("dom2->page_alloc_lock %s\n", action);
+    else
+        printf("unknown lock %p %s\n", (void *)lock, action);
+}
+
+/*
+ * If testcase_assert_verbose_assertions is enabled, the spinlock
+ * functions print the spinlock being acquired or released along with
+ * the file and line number of the assertion that triggered it.
+ * This can be helpful for debugging test failures and understanding
+ * the sequence of events leading up to the failure.
+ */
+#define spin_lock(l) \
+        (print_spinlock("acquired", l, __FILE__, __LINE__, __func__), (void)(l))
+#define spin_unlock(l) \
+        (print_spinlock("released", l, __FILE__, __LINE__, __func__), (void)(l))
+#define spin_lock_cb(l, cb, data) spin_lock(l)
+#define spin_lock_kick()          ((void)0)
+#define nrspin_lock(l)            spin_lock(l)
+#define nrspin_unlock(l)          spin_unlock(l)
+#define rspin_lock(l)             spin_lock(l)
+#define rspin_unlock(l)           spin_unlock(l)
+#define DEFINE_SPINLOCK(l)        spinlock_t l
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
+#define spin_is_locked(l)         true
+#define rspin_is_locked(l)        true
+
+/* memflags: */
+#define _MEMF_no_refcount         0
+#define MEMF_no_refcount          (1U << _MEMF_no_refcount)
+#define _MEMF_populate_on_demand  1
+#define MEMF_populate_on_demand   (1U << _MEMF_populate_on_demand)
+#define _MEMF_keep_scrub          2
+#define MEMF_keep_scrub           (1U << _MEMF_keep_scrub)
+#define _MEMF_no_dma              3
+#define MEMF_no_dma               (1U << _MEMF_no_dma)
+#define _MEMF_exact_node          4
+#define MEMF_exact_node           (1U << _MEMF_exact_node)
+#define _MEMF_no_owner            5
+#define MEMF_no_owner             (1U << _MEMF_no_owner)
+#define _MEMF_no_tlbflush         6
+#define MEMF_no_tlbflush          (1U << _MEMF_no_tlbflush)
+#define _MEMF_no_icache_flush     7
+#define MEMF_no_icache_flush      (1U << _MEMF_no_icache_flush)
+#define _MEMF_no_scrub            8
+#define MEMF_no_scrub             (1U << _MEMF_no_scrub)
+#define _MEMF_node                16
+#define MEMF_node_mask            ((1U << (8 * sizeof(nodeid_t))) - 1)
+#define MEMF_node(n)              ((((n) + 1)&MEMF_node_mask) << _MEMF_node)
+#define MEMF_get_node(f)          ((((f) >> _MEMF_node) - 1)&MEMF_node_mask)
+#define _MEMF_bits                24
+#define MEMF_bits(n)              ((n) << _MEMF_bits)
+
+#define string_param(name, var)
+#define custom_param(name, fn)
+#define size_param(name, var)
+#define boolean_param(name, func)
+#define integer_param(name, var)
+#define ACCESS_ONCE(x) (x)
+#define cmpxchg(ptr, oldv, newv) \
+        ({                       \
+             *(ptr) = (newv);    \
+             (oldv);             \
+         })
+
+#define is_xen_heap_page(pg)          false
+#define page_to_virt(pg)              ((void *)(pg))
+#define virt_to_page(v)               ((struct page_info *)(v))
+#define mfn_to_virt(mfn)              ((void *)&test_dummy_storage)
+#define __mfn_to_virt(mfn)            mfn_to_virt(mfn)
+#define _mfn(x)                       ((mfn_t)(x))
+#define mfn_x(x)                      ((unsigned long)(x))
+#define mfn_add(mfn, nr)              ((mfn) + (nr))
+#define mfn_min(a, b)                 ((a) < (b) ? (a) : (b))
+
+/*
+ * NUMA stubs for unit testing NUMA-aware page allocator logic.
+ *
+ * nodemask_test() and node_set() implement real bit operations so that
+ * domain_install_claim_set() can correctly detect duplicate node entries
+ * in a claim set. mfn_to_pdx() is defined before xen/numa.h is included.
+ */
+
+static nodemask_t node_online_map = ~0UL;
+#define num_online_nodes()            MAX_NUMNODES
+#define node_online(node)             ((node) < MAX_NUMNODES)
+#define nodes_intersects(a, b)        ((a) & (b))
+#define nodes_and(dst, a, b)          ((dst) = (a) & (b))
+#define nodes_andnot(dst, a, b)       ((dst) = (a) & ~(b))
+#define nodes_clear(dst)              ((dst) = 0)
+#define nodemask_test(node, mask)     ((*(mask) >> (node)) & 1UL)
+#define node_set(node, mask)          ((mask) |= (1UL << (node)))
+#define node_clear(node, mask)        ((void)(mask))
+#define node_test_and_set(node, mask) false
+#define first_node(mask)              0U
+#define next_node(node, mask)         MAX_NUMNODES
+#define cycle_node(node, mask)        0U
+
+#ifdef CONFIG_NUMA
+#define __node_distance(a, b) 0
+nodeid_t cpu_to_node[NR_CPUS];
+cpumask_t node_to_cpumask[MAX_NUMNODES];
+struct node_data node_data[MAX_NUMNODES];
+unsigned int memnode_shift;
+
+static typeof(*memnodemap) _memnodemap[64];
+nodeid_t *memnodemap = _memnodemap;
+unsigned long memnodemapsize = sizeof(_memnodemap);
+#endif /* CONFIG_NUMA */
+
+/*
+ * Stub definitions for Xen functions and macros used by page_alloc.c,
+ * sufficient to support the test scenarios in tools/tests/alloc.
+ *
+ * These are not intended to be complete or accurate for general use
+ * in other test contexts or as a general-purpose shim for page_alloc.c.
+ */
+#define rcu_lock_domain(id)               (&test_dummy_domain1)
+#define rcu_lock_domain_by_any_id(id)     (&test_dummy_domain1)
+#define NOW()                             0LL
+#define SYS_STATE_active                  1
+#define system_state                      0
+#define cpu_online(cpu)                   ((cpu) == 0)
+#define smp_processor_id()                0U
+#define smp_wmb()                         ((void)0)
+#define cpumask_empty(mask)               true
+#define cpumask_clear(mask)               ((void)(mask))
+#define cpumask_and(dst, a, b)            ((void)(dst), (void)(a), (void)(b))
+#define cpumask_or(dst, a, b)             ((void)(dst), (void)(a), (void)(b))
+#define cpumask_copy(dst, src)            ((void)(dst), (void)(src))
+#define cpumask_first(mask)               0U
+#define cpumask_intersects(a, b)          false
+#define cpumask_weight(mask)              1
+#define __cpumask_set_cpu(cpu, mask)      ((void)(cpu), (void)(mask))
+#define page_get_owner(pg)                ((pg)->owner)
+#define page_set_owner(pg, d)             ((pg)->owner = (d))
+#define page_get_owner_and_reference(pg)  ((pg)->owner)
+#define page_set_tlbflush_timestamp(pg)   ((pg)->tlbflush_timestamp = 0)
+#define set_gpfn_from_mfn(mfn, gpfn)      ((void)0)
+#define page_is_offlinable(mfn)           true
+#define is_xen_fixed_mfn(mfn)             false
+#define filtered_flush_tlb_mask(ts)       ((void)(ts))
+#define accumulate_tlbflush(need, pg, ts) ((void)(need), (void)(pg), (void)(ts))
+#define flush_page_to_ram(mfn, icache)    ((void)(mfn), (void)(icache))
+#define scrub_page_hot(ptr)               clear_page_hot(ptr)
+#define scrub_page_cold(ptr)              clear_page_cold(ptr)
+#define send_global_virq(virq)            ((void)(virq))
+#define softirq_pending(cpu)              false
+#define process_pending_softirqs()        ((void)0)
+#define on_selected_cpus(msk, f, data, w) ((void)0)
+#define cpu_relax()                       ((void)0)
+#define xmalloc(type)                     calloc(1, sizeof(type))
+#define xmalloc_array(type, nr)           calloc((nr), sizeof(type))
+#define xvzalloc_array(type, nr)          calloc((nr), sizeof(type))
+#define xvmalloc_array(type, nr)          calloc((nr), sizeof(type))
+#define get_order_from_pages(nr)          0U
+#define get_order_from_bytes(bytes)       0U
+#define arch_mfns_in_directmap(mfn, nr)   true
+#define maddr_to_mfn(pa)                  ((mfn_t)paddr_to_pfn(pa))
+
+#define ASSERT_ALLOC_CONTEXT()              ((void)0)
+#define arch_free_heap_page(d, pg)          ((void)(d), (void)(pg))
+#define get_knownalive_domain(d)            ((void)(d))
+#define domain_clamp_alloc_bitsize(d, bits) (bits)
+#define mem_paging_enabled(d)               false
+#define put_domain(d)                       ((void)(d))
+#define clear_page_hot(ptr)                 memset((ptr), 0, PAGE_SIZE)
+#define clear_page_cold(ptr)                memset((ptr), 0, PAGE_SIZE)
+#define unmap_domain_page(ptr)              ((void)(ptr))
+#define put_page(pg)                        ((void)(pg))
+
+void *alloc_xenheap_pages(unsigned int order, unsigned int memflags);
+void  init_domheap_pages(paddr_t ps, paddr_t pe);
+struct page_info *alloc_domheap_pages(struct domain *d, unsigned int order,
+                                      unsigned int memflags);
+
+/* Additional stubs for test support */
+
+unsigned int arch_get_dma_bitsize(void)
+{
+    return 32U;
+}
+
+/* Return number of pages currently posessed by the domain */
+static unsigned int domain_tot_pages(const struct domain *d)
+{
+    assert(d->extra_pages <= d->tot_pages);
+    return d->tot_pages - d->extra_pages;
+}
+
+/* LLC (Last Level Cache) coloring support stubs */
+#define llc_coloring_enabled false
+unsigned int get_max_nr_llc_colors(void)
+{
+    return 1U;
+}
+unsigned int page_to_llc_color(const struct page_info *pg)
+{
+    (void)pg;
+    return 0U;
+}
+
+#define parse_bool(s, e) (-1) /* Not parsed, use the default */
+
+void __init register_keyhandler(unsigned char key, keyhandler_fn_t *fn,
+                                const char *desc, bool diagnostic)
+{
+    (void)key;
+    (void)fn;
+    (void)desc;
+    (void)diagnostic;
+}
+
+unsigned long simple_strtoul(const char *cp, const char **endp,
+                             unsigned int base)
+{
+    return strtoul(cp, (char **)endp, base);
+}
+#endif
+#endif
diff --git a/tools/tests/alloc/page-alloc-wrapper.h b/tools/tests/alloc/page-alloc-wrapper.h
new file mode 100644
index 000000000000..5f595656f099
--- /dev/null
+++ b/tools/tests/alloc/page-alloc-wrapper.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Wrapper around xen/common/page_alloc.c for the allocator test framework.
+ *
+ * The test framework includes the real page_alloc.c directly in its
+ * translation unit, together with mocks for the Xen types and functions it
+ * uses and helper code for NUMA heap initialisation and heap-state checks.
+ *
+ * This file provides the definitions needed for that setup. It also wraps
+ * selected page_alloc.c entry points, such as mark_page_offline() and
+ * offline_page(), so test scenarios can log allocator actions and resulting
+ * state during execution.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef TOOLS_TESTS_ALLOC_PAGE_ALLOC_WRAPPER_H
+#define TOOLS_TESTS_ALLOC_PAGE_ALLOC_WRAPPER_H
+
+#define TEST_USES_PAGE_ALLOC_SHIM
+#include "page-alloc-shim.h"
+
+/* Include the real page_alloc.c for testing */
+
+#pragma GCC diagnostic push
+/* TODO: We should fix the remaining sign-compare warnings in page_alloc.c */
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
+/* Allow the logging spinlock mocks to identify the allocator heap lock. */
+static spinlock_t *heap_lock_ptr = &heap_lock;
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
+struct page_info frame_table[MAX_PAGES];
+
+/* Convenience pointer used by test scenarios. */
+static struct page_info *test_pages = frame_table;
+
+#define TOTAL_CLAIMS ((unsigned long)outstanding_claims)
+#define FREE_PAGES \
+        avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1)
+
+#define DOM_GLOBAL_CLAIMS(d)  ((d)->global_claims)
+#define DOM_NODE_CLAIMS(d, n) ((d)->claims[n])
+#endif
-- 
2.39.5


