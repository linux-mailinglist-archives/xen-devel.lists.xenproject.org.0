Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKkoAT/P32m4ZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:47:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492AD406E56
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282720.1565228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Kp-0001Uj-N3; Wed, 15 Apr 2026 17:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282720.1565228; Wed, 15 Apr 2026 17:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Kp-0001TD-J5; Wed, 15 Apr 2026 17:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1282720;
 Wed, 15 Apr 2026 17:47:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wD4Ko-0001Ns-4b
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:47:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4Kn-00DXB0-Hb
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:47:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcf20-e002-0a2a0a5209dd-0a2a4506aab4-18
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:47:29 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcf30-0df0-0a2a45060019-a0658309e5ce-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:47:29 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 80CA481C0DDB;
 Wed, 15 Apr 2026 13:46:34 -0400 (EDT)
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
Subject: [PATCH 1/4] tools/tests/alloc: Unit and Integration Test Framework for page_alloc.c
Date: Wed, 15 Apr 2026 18:34:56 +0100
Message-Id: <bbd242400a624465bebae0fa2b7591acd37c7236.1776273656.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776273656.git.bernhard.kaindl@citrix.com>
References: <cover.1776273656.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776275249-5E530078-FE305C64/0/0
X-purgate-type: clean
X-purgate-size: 91660
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.878];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 492AD406E56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a test framefork for unit and integration test suites testing
the Xen page allocator module xen/common/page_alloc.c in isolation.

It enables test suites to verify the behaviour of the page allocator
in situations that are easier to create and validate in isolation,
with full control over a synthetic Xen heap state and visibility
into the allocator and domain state.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/Makefile                   |   1 +
 tools/tests/alloc/.gitignore           |   6 +
 tools/tests/alloc/Makefile             | 141 ++++++++
 tools/tests/alloc/README.rst           |  31 ++
 tools/tests/alloc/check-asserts.h      | 347 ++++++++++++++++++
 tools/tests/alloc/harness.h            |  69 ++++
 tools/tests/alloc/hypervisor-macros.h  | 101 ++++++
 tools/tests/alloc/libtest-page_alloc.h | 356 +++++++++++++++++++
 tools/tests/alloc/mock-page_list.h     | 307 ++++++++++++++++
 tools/tests/alloc/page_alloc-wrapper.h | 465 +++++++++++++++++++++++++
 tools/tests/alloc/page_alloc_shim.h    | 433 +++++++++++++++++++++++
 11 files changed, 2257 insertions(+)
 create mode 100644 tools/tests/alloc/.gitignore
 create mode 100644 tools/tests/alloc/Makefile
 create mode 100644 tools/tests/alloc/README.rst
 create mode 100644 tools/tests/alloc/check-asserts.h
 create mode 100644 tools/tests/alloc/harness.h
 create mode 100644 tools/tests/alloc/hypervisor-macros.h
 create mode 100644 tools/tests/alloc/libtest-page_alloc.h
 create mode 100644 tools/tests/alloc/mock-page_list.h
 create mode 100644 tools/tests/alloc/page_alloc-wrapper.h
 create mode 100644 tools/tests/alloc/page_alloc_shim.h

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
index 000000000000..9f77c5879772
--- /dev/null
+++ b/tools/tests/alloc/.gitignore
@@ -0,0 +1,6 @@
+/test-claims_basic
+/test-claims_numa_install
+/test-claims_numa_redeem
+/test-online_page
+/test-offlining-claims
+/test-reserve_offline_page
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
index 000000000000..3ed362598bb3
--- /dev/null
+++ b/tools/tests/alloc/README.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Unit and Integration test suite for the page allocator
+======================================================
+
+The tests in ``tools/tests/alloc`` contain unit tests for the
+Xen page allocator in ``xen/common/page_alloc.c`` and are
+built as standalone executables.
+
+They are not intended to be run in a Xen environment, but rather to test
+the allocator logic in isolation and can be run on any compatible host
+system at build time and do not use any installed libraries or require
+any special setup or dependencies beyond the standard C library.
+
+The tests use a shim as a substitute for Xen hypervisor code that would
+conflict with running the page allocator as a host executable, and they
+use helper functions to initialize and assert the status of the data
+structures of the allocator such as the page lists and zones.
+
+The tests can be run with the ``run`` target of the ``Makefile``, which
+will execute all the test executables and report their results unless
+you override the TARGETS variable to run a specific test:
+
+.. code:: shell
+
+    make -C tools/tests/alloc clean all run \
+            TARGETS=test-reserve_offline_page-uma
+
+To add a new test, simply create a new C file with a name starting with
+``test-``, implement the test logic, and it will be automatically included
+in the build and run targets by default.
diff --git a/tools/tests/alloc/check-asserts.h b/tools/tests/alloc/check-asserts.h
new file mode 100644
index 000000000000..04a254c0999d
--- /dev/null
+++ b/tools/tests/alloc/check-asserts.h
@@ -0,0 +1,347 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Header-only library for check assertions in unit tests.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef _CHECK_ASSERTS_H_
+#define _CHECK_ASSERTS_H_
+
+#include <assert.h>
+#include <execinfo.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/utsname.h>
+
+#ifndef CONFIG_NUMA
+#define CONFIG_NUMA 0
+#endif
+#define __used __attribute__((__used__))
+
+/** ## Global state for the test framework and assertions */
+
+/** Set when assertions are expected to fail */
+static bool testcase_assert_expected_to_fail = false;
+/** Set when verbose assertions are enabled */
+static bool testcase_assert_verbose_assertions = true;
+/**
+ * The current function for verbose assertions, used to avoid repeating the
+ * function name in the logs for multiple assertions within the same function.
+ */
+static const char *testcase_assert_current_func = NULL;
+/** The current indentation level for verbose assertions */
+static int testcase_assert_verbose_indent_level = 0;
+/** Failed checks since the last call call to EXPECTED_TO_FAIL_BEGIN() */
+static int testcase_assert_expected_failures = 0;
+/** Failed checks within EXPECTED_TO_FAIL_BEGIN()/END() in this test case */
+static int testcase_assert_expected_failures_total = 0;
+/** Successful assertions in this test case */
+static int testcase_assert_successful_assert_total = 0;
+#define assert_failed_str "Assertion failed: "
+
+/** ## Assertion macros and helpers */
+
+/** Check a condition and log the result with context. */
+#define CHECK(condition, fmt, ...)                                    \
+        testcase_assert(condition, __FILE__, __LINE__, __func__, fmt, \
+                        ##__VA_ARGS__)
+
+/** If the condition is false, treat it as a test assertion failure */
+#define ASSERT(x) \
+        testcase_assert(x, __FILE__, __LINE__, __func__, assert_failed_str #x)
+
+/** If the condition is true, treat it as a bug, used in Xen hypervisor code */
+#define BUG_ON(x) \
+        testcase_assert(!(x), __FILE__, __LINE__, __func__, "BUG_ON: " #x)
+
+/** Assert that the code is unreachable */
+#define ASSERT_UNREACHABLE() assert(false)
+
+/** ## Helpers for expected assertion failures */
+
+/** Marks the beginning of a block where assertions are expected to fail */
+#define EXPECTED_TO_FAIL_BEGIN() (testcase_assert_expected_to_fail = true)
+/** Marks the end of a block where assertions are expected to fail */
+#define EXPECTED_TO_FAIL_END(c) testcase_assert_check_expected_failures(c)
+
+/** Checks the number of expected failures against the actual count */
+static void __used testcase_assert_check_expected_failures(int expected)
+{
+    if ( testcase_assert_expected_failures != expected )
+    {
+        fprintf(stderr, "Test assertion expected %d failures, but got %d\n",
+                expected, testcase_assert_expected_failures);
+        abort();
+    }
+    testcase_assert_expected_to_fail = false;
+    testcase_assert_expected_failures = 0;
+    testcase_assert_expected_failures_total += expected;
+}
+
+/** ## Test case management and reporting */
+
+/** Function pointer used for initializing a test case */
+static void (*testcase_init_func)(const char *, int);
+
+/** Set up the function pointer for initializing a test case */
+static void __used setup_testcase_init_func(void (*init_fn)(const char *, int))
+{
+    testcase_init_func = init_fn;
+}
+
+/**
+ * Assert a condition within a test case
+ *
+ * This function is the core of the assertion mechanism for test cases.
+ * It checks a given condition and handles both expected and unexpected
+ * assertion failures.
+ *
+ * If the assertion is expected to fail, it logs the failure and increments
+ * the expected failure count.  If the assertion is not expected to fail but
+ * does, it logs the failure and aborts the test.  If the assertion passes,
+ * it increments the successful assertion count and optionally logs the
+ * successful assertion if verbose assertions are enabled.
+ *
+ * Args:
+ *  condition (bool):    The condition to check.  If false, the assertion fails.
+ *  file (const char *): The file where the assertion is located, for logging.
+ *  line (int):          The source line of the assertion, for logging.
+ *  func (const char *): The function name where the assertion is located.
+ *  fmt (const char *):  A printf format string with context for the assertion.
+ *  ...:                 Additional arguments for the format string.
+ */
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
+                condition ? "unexpectedly passed" : "expectedly failed",
+                relpath, line);
+        vfprintf(stderr, fmt, ap);
+        va_end(ap);
+        fprintf(stderr, "\n");
+
+        if ( condition )
+            abort(); /* Unexpected pass, treat as test failure */
+        else
+            testcase_assert_expected_failures++; /* update for the report */
+        return;
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
+        /* As the assertion didn't actually fail, remove the prefix */
+        if ( strncmp(fmt, assert_failed_str, strlen(assert_failed_str)) == 0 )
+            fmt += strlen(assert_failed_str);
+
+        if ( strcmp(fmt, "ret == 0") == 0 )
+            return;
+
+        for ( int i = 0; i < testcase_assert_verbose_indent_level; i++ )
+            printf("  ");
+
+        printf("%s:%d: ", relpath, line);
+
+        /*
+         * Skip logging the passed function if it was already logged for the
+         * current function, or the source or the function starts with test.
+         */
+        if ( (testcase_assert_current_func == NULL ||
+              strcmp(testcase_assert_current_func, func)) &&
+             (strncmp(relpath, "test-", strlen("test-")) &&
+              strncmp(func, "test_", strlen("test_"))) )
+            printf("%s(): ", func);
+
+        if ( strncmp(fmt, "BUG_ON:", strlen("BUG_ON:")) )
+            printf("ASSERT(");
+
+        vprintf(fmt, ap);
+        va_end(ap);
+
+        if ( strncmp(fmt, "BUG_ON:", strlen("BUG_ON:")) )
+            printf(")");
+
+        printf("\n");
+    }
+}
+
+/** Structure to represent a test case and its results for reporting */
+struct testcase {
+    /** Human-readable name of the test case */
+    const char *name;
+    /** Test ID */
+    const char *tid;
+    /** Integer argument for the test case */
+    int         intarg;
+    /** Function pointer to the test case function */
+    void        (*func)(int);
+    /** Number of assertions passed */
+    int         passed_asserts;
+    /** Number of expected failures occurred */
+    int         expected_failures;
+} testcases[40];
+/** Pointer to the current test case being executed, for tracking results */
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
+/**
+ * Execute the given test function and record the number of assertions
+ * passed and expected failures for the test report.  The test function
+ * is expected to use the CHECK, ASSERT, and BUG_ON macros for assertions,
+ * and can use EXPECTED_TO_FAIL_BEGIN and EXPECTED_TO_FAIL_END to mark
+ * assertions that are expected to fail for testing negative scenarios.
+ *
+ * The test function is also passed an integer argument that can be used
+ * to specify different scenarios or parameters for the test.
+ *
+ * The test report will include the name of the test case, the integer
+ * argument, the number of assertions passed, and the number of expected
+ * failures.  The test report is printed after the test function completes,
+ * and a summary report is printed after all test cases have been executed.
+ *
+ * The test function can also use the verbose assertion mode to print
+ * additional context for each assertion, which can be helpful for debugging
+ * test failures and understanding the test flow.
+ *
+ * Args:
+ *   case_func (void (*)(int)):
+ *                  The test function to execute, which takes an int argument.
+ *   int_arg (int): An argument to pass to the test function, which can be used
+ *                  to specify different scenarios or parameters for the test.
+ *   tid (const char *):
+ *                  A test id; string identifier for the test case.
+ *   case_name (const char *):
+ *                  A human-readable name for the test case, used for reporting.
+ */
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
+    /*
+     * Call the testcase initialization function if it is set, which can be
+     * used to reset global state or set up specific scenarios for the test.
+     *
+     * For example, the page allocator tests use this to reset the state of the
+     * synthetic page structures and the heap before each test case.
+     */
+    if ( testcase_init_func && int_arg >= 0 )
+        testcase_init_func(case_name, int_arg);
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
+/**
+ * Provide a report of all test cases executed and their results,
+ * including the total number of assertions passed and expected failures.
+ */
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
+
+#endif /* _CHECK_ASSERTS_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/alloc/harness.h b/tools/tests/alloc/harness.h
new file mode 100644
index 000000000000..946c796c5475
--- /dev/null
+++ b/tools/tests/alloc/harness.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Common test harness for page allocation unit tests.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef _TEST_HARNESS_
+#define _TEST_HARNESS_
+
+#include <assert.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdint.h>
+#include <stdio.h>
+
+/* Enable debug mode to enable additional checks */
+#define CONFIG_DEBUG
+
+/* Define common macros which are compatible with the test context */
+#include "hypervisor-macros.h"
+
+/* Provide the common check_asserts library for test assertions */
+#include "check-asserts.h"
+
+/* Common Xen types for the test context */
+typedef uint8_t u8;
+typedef uint64_t paddr_t;
+typedef unsigned long cpumask_t;
+typedef long long s_time_t;
+typedef bool spinlock_t;
+
+/*
+ * The original implementation of reserve_offlined_page() causes the GCC
+ * and clang AddressSanitizer (ASAN) to report stack-buffer-overflow
+ * when the test_merge_tail_pair test case is run with ASAN enabled,
+ * when test verifies the state of the free lists in the heap.
+ *
+ * It finds several list pointer errors in the heap state and one of the
+ * appears to trigger ASAN's stack-buffer-overflow detection on x86_64.
+ *
+ * To temporarily work around this issue, we detect if ASAN is enabled
+ * and in order to be able skip the ASSERT_LIST_EQUAL verification step
+ * in the test case that triggers the ASAN error, while still allowing
+ * the rest of the test case to run and verify all execution with ASAN.
+ */
+/* clang-format off */
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
+/* clang-format on */
+#endif /* _TEST_HARNESS_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/alloc/hypervisor-macros.h b/tools/tests/alloc/hypervisor-macros.h
new file mode 100644
index 000000000000..0d35bd9a806c
--- /dev/null
+++ b/tools/tests/alloc/hypervisor-macros.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Common macros and definitions for building host-side unit tests
+ * the Xen hypervisor.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifndef _TEST_ALLOC_XEN_MACROS_
+#define _TEST_ALLOC_XEN_MACROS_
+
+/*
+ * In Xen, STATIC_IF(x) and config_enabled(x) are defined in kconfig.h
+ * which we cannot include, so we need to define the necessary macros.
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
+ * We include common-macros.h to reuse the Xen-tools macros, which are
+ * not necessarily the same as the Xen hypervisor macros, but are close
+ * enough for the test context.
+ */
+#include <xen-tools/common-macros.h>
+
+/*
+ * Define the header guards of the Xen headers that the Xen hypervisor
+ * variants of the definitions in common-macros.h and bitops.h to prevent
+ * conflicting definitions from those headers that prevent clean compilation.
+ */
+#define __XEN_CONST_H__
+#define __MACROS_H__
+
+/*
+ * We also define the Xen hypervisor macros that are used by page_alloc.c
+ * but not defined by common-macros.h, but needed to build hypervisor code
+ * in the test context, such as IS_ALIGNED() and the ffsl/flsl macros.
+ */
+#define IS_ALIGNED(x, a) (!((x) & ((a) - 1)))
+
+/*
+ * Inclde the Xen-tools bitops.h to reuse the bitops from the tools side.
+ * They are not necessarily the same as the Xen hypervisor bitops, but are
+ * close enough for the test context.
+ */
+#include <xen-tools/bitops.h>
+/*
+ * Afer including the Xen-tools bitops.h, we need to redefine the ffsl and flsl
+ * macros to match the behavior of the Xen hypervisor's ffsl and flsl, which
+ * return unsigned int and are relevant for signed/unsigned conversion checking
+ * and type hints in the test context.
+ * And we need to undefine conflicting macros defined by xen-tools headers.
+ */
+#undef BITS_PER_LONG
+#undef __LITTLE_ENDIAN
+#undef __BIG_ENDIAN
+/* Xen ffsl returns 1-based position of lowest set bit as unsigned int */
+#undef ffsl /* tools/include/xen-tools/bitops.h returns signed int */
+#define ffsl(x) ((unsigned int)__builtin_ffsl(x))
+/* Xen flsl returns 1-based position of highest set bit as unsigned int */
+#define flsl(x) ((unsigned int)((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0))
+
+/* Common assertion and logging macros */
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
+
+/* Support including xen/sections.h and other function attributes */
+#define __initdata
+#define __init        __used
+#define __initcall(f) static int __used (*f##_ptr)(void) = (f)
+
+#endif /* _TEST_ALLOC_XEN_MACROS_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/alloc/libtest-page_alloc.h b/tools/tests/alloc/libtest-page_alloc.h
new file mode 100644
index 000000000000..5654152cd48a
--- /dev/null
+++ b/tools/tests/alloc/libtest-page_alloc.h
@@ -0,0 +1,356 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test framework for testing the memory-allocation functionality
+ * of xen/common/page_alloc.c, consisting of:
+ *
+ * 1. A header-only shim for page_alloc.c to provide the necessary
+ *    definitions and helpers to allow the test framework to include
+ *    the real page_alloc.c directly into its translation unit.
+ *
+ * 2. A set of mocks for the Xen types and functions used by page_alloc.c,
+ *    sufficient to support the test scenarios in tools/tests/alloc.
+ *
+ *    This includes mocks for NUMA topology, designed to allow the test
+ *    scenarios to manipulate the state of the allocator and verify its
+ *    behavior in a way that is consistent with how page_alloc.c acts when
+ *    used by the running Xen hypervisor, while being self-contained and
+ *    suitable for unit and integration testing.
+ *
+ * 3. A tiny wrapper which includes the real page_alloc.c for testing.
+ *
+ *    It disables a few of the -Wextra warnings enabled by the test
+ *    framework that are not yet fixed in page_alloc.c, such as some
+ *    sign-compare warnings and unused parameter warnings in its code.
+ *
+ * 4. A library for NUMA heap initialisation, and asserting the heap status.
+ *
+ *    This library provides functions to prepare the state of the memory
+ *    allocator for the test scenarios, such as:
+ *
+ *    a. Initializing the heap before each test case, creating NUMA nodes,
+ *       and adding pages to the heap in specific states, such as free,
+ *       allocated, marked to be offlined or already offlined.
+ *
+ *    b. Verifying the state of the heap and the page_info structures after
+ *       test actions, such as checking that pages are allocated or freed
+ *       as expected, that the state of the page_info structures is consistent
+ *       with the expected state.
+ *
+ * 5. Test case lifecycle management, such as initializing the test context
+ *    before each test case, printing the outcome of each test case,
+ *    tracking the number of assertions, logging assertions with file
+ *    and line information, and printing a summary report at the end.
+ *
+ * 6. A Makefile for discovering, compiling, running the test cases,
+ *    and reporting results which test cases were run.
+ *
+ *    The Makefile is designed to allow running individual test cases
+ *    or the entire test suite for all supported CPU architectures, if
+ *    so desired.
+ *
+ *    It is also responsible for compiling the tests with address sanitizer
+ *    (ASAN) enabled to catch memory errors in the page allocator code
+ *    and the test code, especially when manipulating the state of the
+ *    page_info structures inside the test scenarios.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#include <stdarg.h>
+#include <execinfo.h>
+#include <string.h>
+
+/* Enable -Wextra warnings as errors to catch e.g. sign-compare issues */
+#pragma GCC diagnostic error "-Wextra"
+
+/* Support for printing the status of pages for debugging */
+struct page_info;
+static void print_page_info(struct page_info *pos);
+static void print_page_count_info(unsigned long count_info);
+
+#define TEST_USES_PAGE_ALLOC_SHIM
+#include "page_alloc_shim.h"
+
+/* Include the real page_alloc.c for testing */
+
+#include "page_alloc-wrapper.h"
+
+static const unsigned int node = 0;
+static const unsigned int node0 = 0;
+static const unsigned int node1 = 1;
+static const unsigned int order0 = 0;
+static const unsigned int order1 = 1;
+static const unsigned int order2 = 2;
+static const unsigned int order3 = 3;
+
+/**
+ * Functions for setting up test scenarios with a clean allocator state,
+ * and for building synthetic buddy trees with the expected page_info state.
+ */
+
+/* Set up a bare minimum NUMA node topology. */
+static void init_numa_node_data(unsigned int start_mfn)
+{
+    (void)start_mfn;
+#ifdef CONFIG_NUMA
+    /*
+     * For simplicity, we assign each CPU to its own node, and set each
+     * node's cpumask to contain just that CPU.
+     *
+     * If needed, we could easily modify this setup to have multiple CPUs
+     * per node by adjusting the cpu_to_node assignments and node_to_cpumask
+     * values accordingly.
+     *
+     * The test scenarios in this suite do not currently require multiple
+     * CPUs per node, but we could extend them to do so if desired.
+     *
+     * This is just a default setup that the test scenarios can rely on,
+     * and they are free to modify the cpu_to_node and node_to_cpumask
+     * values as needed for their specific test cases.
+     */
+    for ( unsigned int i = 0; i < NR_CPUS; i++ )
+        cpu_to_node[i] = i;
+
+    /* Each node has a single CPU in its cpumask for simplicity */
+    for ( unsigned int i = 0; i < MAX_NUMNODES; i++ )
+        node_to_cpumask[i] = (1UL << i);
+
+    /* Initialize node data structures */
+    for ( unsigned int i = 0; i < MAX_NUMNODES; i++ )
+    {
+        /* Each node has 8 pages for testing for now */
+        node_data[i].node_start_pfn = start_mfn + (i * 8);
+        node_data[i].node_present_pages = 8UL;
+        node_data[i].node_spanned_pages = 8UL;
+    }
+
+    /*
+     * Set up memnodemap so that mfn_to_nid() correctly resolves MFN
+     * ranges to NUMA nodes: with memnode_shift=3 each memnodemap entry
+     * covers 8 MFNs (2^3), matching the 8-page-per-node layout above.
+     * Entry i maps MFNs [i*8 .. (i+1)*8 - 1] to node i.
+     */
+    memnode_shift = 3;
+    for ( unsigned int i = 0; i < 64; i++ )
+        memnodemap[i] = (nodeid_t)i;
+#endif /* CONFIG_NUMA */
+}
+
+static void init_dummy_domains(void);
+/**
+ * Reset all page_alloc translation-unit globals that these tests observe.
+ *
+ * The test program includes xen/common/page_alloc.c directly, so its
+ * file-scope variables become global variables of this translation unit.
+ *
+ * Each test must start from a clean page allocator state, with a clean heap,
+ * clean availability counters, and empty offlined and broken lists.
+ */
+static void reset_page_alloc_state(const char *caller_func, int start_mfn)
+{
+    unsigned int zone;
+    unsigned int order;
+
+    printf("\n%s: start_mfn = %u\n", caller_func, start_mfn);
+
+    /* Clear the test page table used for synthetic page_info objects. */
+    memset(frame_table, 0, sizeof(frame_table));
+
+    /* Clear the backing storage used by the imported allocator globals. */
+    memset(test_heap_storage, 0, sizeof(test_heap_storage));
+    memset(test_avail_storage, 0, sizeof(test_avail_storage));
+
+    /* Clear the shim-owned singleton objects used by helper macros. */
+    memset(&test_dummy_domain1, 0, sizeof(test_dummy_domain1));
+    memset(&test_dummy_domain2, 0, sizeof(test_dummy_domain2));
+    memset(&test_current_vcpu, 0, sizeof(test_current_vcpu));
+
+    /* Reinitialise the global page lists manipulated by the allocator. */
+    INIT_PAGE_LIST_HEAD(&page_offlined_list);
+    INIT_PAGE_LIST_HEAD(&page_broken_list);
+    INIT_PAGE_LIST_HEAD(&test_page_list);
+
+    init_numa_node_data(start_mfn); /* Only used for NUMA-enabled builds */
+
+    /* Reinitialise every per-zone, per-order free-list bucket. */
+    for ( nodeid_t node = 0; node < MAX_NUMNODES; node++ )
+    {
+        _heap[node] = &test_heap_storage[node];
+        avail[node] = test_avail_storage[node];
+        node_avail_pages[node] = 0;
+        for ( zone = 0; zone < NR_ZONES; zone++ )
+            for ( order = 0; order <= MAX_ORDER; order++ )
+                INIT_PAGE_LIST_HEAD(&heap(node, zone, order));
+    }
+
+    total_avail_pages = 0;
+    outstanding_claims = 0;
+    /*
+     * The valid MFN range for the test context is configured to cover only
+     * the test frame table, so that any attempts by page_alloc.c to prevent
+     * functions in page_alloc.c is only manipulating the intended test
+     * state and not accessing uninitialized memory or going out of bounds.
+     *
+     * Set up the initial range of valid pages for mfn_valid() used by
+     * free_heap_pages() as condition if there are successors/predecessors
+     * to merge pages with. Unless successors/predecessors are initialized
+     * to be free, it should forgoe merging and just add the provided page
+     * as-is to the heap, but to prevent it looking up uninitialised memory,
+     * we set the valid MFN range to cover the frame_table only.
+     */
+    first_valid_mfn = start_mfn;
+    max_page = sizeof(frame_table) / sizeof(frame_table[0]);
+    assert(first_valid_mfn < max_page);
+
+    init_dummy_domains();
+}
+
+static void init_dummy_domains(void)
+{
+    nodemask_t dom_node_affinity;
+    struct domain *dom;
+    int dom_id = 1;            /* Start domain IDs from 1 for clarity in logs */
+
+    /* Provide a current vcpu/domain pair for code paths that inspect it. */
+    test_current_vcpu.domain = &test_dummy_domain1;
+
+    /* Provide the dummy domains for tests that need some domains */
+    domain_list = &test_dummy_domain1;
+    test_dummy_domain1.next_in_list = &test_dummy_domain2;
+
+    nodes_clear(dom_node_affinity);
+    node_set(node0, dom_node_affinity);
+    node_set(node1, dom_node_affinity);
+
+    for_each_domain ( dom )
+    {
+        dom->node_affinity = dom_node_affinity;
+        dom->max_pages = MAX_PAGES;
+        dom->domain_id = dom_id++;
+    }
+}
+
+/* Initialize the page allocator tests */
+static void __used init_page_alloc_tests(void)
+{
+    /* Define the function above as the testcase initialization function */
+    setup_testcase_init_func(reset_page_alloc_state);
+}
+
+/**
+ * Populate a page descriptor with the minimal state needed by
+ * reserve_offlined_page().
+ *
+ * Tests build synthetic buddy trees by placing a small set of
+ * page_info objects into allocator free lists. This helper
+ * keeps that setup consistent across scenarios.
+ *
+ * Args:
+ *  page (struct page_info *): Pointer to the page_info to be initialised.
+ *  order (unsigned int):      The order to set in the page_info's order field
+ *  state (unsigned long):     The state bits to set in the page's count_info
+ *                             field, e.g. PGC_state_inuse for pages to be
+ *                             added to the heap, or PGC_state_offlined for
+ *                             pages to be added to the offlined list.
+ */
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
+    CHECK(mfn_valid(mfn), "mfn %lu valid: %lu-%lu", mfn, first_valid_mfn,
+          max_page);
+
+    memset(page, 0, sizeof(*page));
+
+    /* Model the page as a free buddy head of the requested order. */
+    page->v.free.order = order;
+
+    /* Default to no tracked dirty subrange and no active scrubbing. */
+    page->u.free.first_dirty = INVALID_DIRTY_IDX;
+    page->u.free.scrub_state = BUDDY_NOT_SCRUBBING;
+
+    /* Install the requested allocator state bits for this synthetic page. */
+    page->count_info = state;
+}
+
+/**
+ * Initialize the given pages as a buddy of the requested order,
+ * with the first page as the buddy head and the rest as subpages
+ * of it, and add the intialised buddy to the heap.
+ *
+ * This helper is intended to be used by test scenarios to set up
+ * the heap with buddies of the expected order and state for testing
+ * operations that manipulate the heap, such as reserve_offlined_page()
+ * and free_heap_pages(), and to ensure that the heap state is consistent
+ * with the page_info state after those operations.
+ *
+ * The buddy is added to the heap using free_heap_pages() which
+ * models the expected usage of the heap and ensures that the
+ * heap structures are updated correctly according to the logic
+ * of the allocator, which may change over time.
+ *
+ * For example, if the logic for merging buddies or tracking claims changes,
+ * using free_heap_pages() ensures that the test setup will be correct even
+ * after such changes, and that the test scenarios will be testing the real
+ * behaviour of the allocator rather than an idealised version of it.
+ *
+ * Args:
+ *  pages (struct page_info *): Pointer to the first page_info in an array.
+ *  order (unsigned int):       The order of the buddy to be created.
+ *  caller (const char *):      The name of the calling function for context.
+ * Returns:
+ *  The zone of the added buddy, which can be useful for test scenarios that
+ *  need to know the zone of the buddy for further operations or assertions.
+ */
+static zone_t __used page_list_add_buddy(struct page_info *pages,
+                                         unsigned int order, const char *caller)
+{
+    size_t i, num_pages = 1U << order;
+    bool verbose_asserts_save = testcase_assert_verbose_assertions;
+
+    /* Avoid logging spinlocks and verbose assertions during initialization */
+    testcase_assert_verbose_assertions = false;
+
+    /*
+     * Initialize the first page as the head of the buddy with the given order.
+     * All pages are initialized as in-use as this is the API expected by
+     * free_heap_pages() when it adds a buddy to the heap(). This model is
+     * consistent with the way the boot allocator and online_page() handle
+     * page initialization as well as the normal way for used pages to be freed.
+     */
+    init_test_page(&pages[0], order, PGC_state_inuse);
+
+    /* Add the subpages of the buddy as order-0 buddies to the heap */
+    for ( i = 1; i < num_pages; i++ )
+        init_test_page(&pages[i], order0, PGC_state_inuse);
+
+    /*
+     * Add the created buddy to the heap. This uses the same code path as
+     * freeing used pages and is consistent with the way the boot allocator
+     * and online_page() handle page initialization. Using free_heap_pages()
+     * has the additional benefit of ensuring that the heap structures are
+     * consistent even if the internal logic of the heap management changes.
+     *
+     * For example, implementing NUMA claims adds new per-node claims counters
+     * and logic to free_heap_pages(), so using it here ensures that the test
+     * setup will be correct even after such changes.
+     */
+    printf("%s: Adding buddy of order %u at MFN %lu to the heap.\n", caller,
+           order, page_to_mfn(&pages[0]));
+
+    testcase_assert_verbose_assertions = false;
+
+    free_heap_pages(&pages[0], order, false);
+
+    testcase_assert_verbose_assertions = verbose_asserts_save;
+    return page_to_zone(&pages[0]);
+}
+
+#define test_page_list_add_buddy(pages, order) \
+        page_list_add_buddy(pages, order, __func__)
diff --git a/tools/tests/alloc/mock-page_list.h b/tools/tests/alloc/mock-page_list.h
new file mode 100644
index 000000000000..92a0f7c53042
--- /dev/null
+++ b/tools/tests/alloc/mock-page_list.h
@@ -0,0 +1,307 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Mock page list implementation for testing page allocator functions.
+ *
+ * This mock implementation provides a simplified version of the page list
+ * structures and functions used by the page allocator, allowing unit tests
+ * to be written without relying on the full Xen environment.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef _MOCK_PAGE_LIST_H_
+#define _MOCK_PAGE_LIST_H_
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#include "harness.h" /* Provides the generic Xen defintitions needed */
+
+/*
+ * Wrapper around xen/config.h for common Xen definitions for the test context
+ */
+#define __XEN_KCONFIG_H
+#undef __nonnull
+#undef offsetof
+#include <xen/config.h>
+/* Xen code adds cf_check as an attribute macro to functions we don't call */
+#undef cf_check
+#define cf_check __used
+
+#define MAX_ORDER 20
+
+/*
+ * The page_info structures in the frame table are manipulated directly
+ * by page_alloc.c, so they must be defined in a way that is consistent
+ * with how page_alloc.c uses them, while being self-contained and suitable
+ * for unit testing.
+ *
+ * The test scenarios can then manipulate the state of these page_info
+ * structures to set up test conditions and verify the behavior of the
+ * allocator in a way that is consistent with how it acts when used by
+ * the running hypervisor.
+ */
+struct page_info {
+    unsigned long count_info; /* PGC_state_inuse and other flags/counters */
+    union {
+        /* When the page is in use, u.inuse.type_info is used for status */
+        struct {
+            unsigned long type_info;
+        } inuse;
+        /*
+         * When the page is free, u.free is used for buddy management.
+         *
+         * Using BUILD_BUG_ON(sizeof(var->u) != sizeof(long)), page_alloc
+         * enforces that the u.free struct is exactly the size of a long.
+         * 32-bit architectures need to use bitfields to fit the fields
+         * in a long, while 64-bit architectures can use normal fields.
+         */
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
+#define PAGE_LIST_HEAD(name) struct page_list_head name = {NULL, NULL, 0}
+
+static inline void test_page_list_init(struct page_list_head *list)
+{
+    list->head = NULL;
+    list->tail = NULL;
+    list->count = 0;
+}
+#define INIT_PAGE_LIST_HEAD(l) test_page_list_init(l)
+
+/* Used by page_alloc.c */
+#define page_list_for_each_safe(pos, tmp, list)        \
+        for ( (pos) = page_list_first(list),           \
+              (tmp) = (pos) ? (pos)->list_next : NULL; \
+              (pos) != NULL;                           \
+              (pos) = (tmp), (tmp) = (pos) ? (pos)->list_next : NULL )
+
+typedef unsigned long mfn_t;
+static struct page_list_head test_page_list;
+
+#define page_to_list(d, pg)          (&test_page_list)
+#define page_list_add(pg, list)      test_page_list_add((pg), (list))
+#define page_list_add_tail(pg, list) test_page_list_add_tail((pg), (list))
+#define page_list_del(pg, list)      test_page_list_del((pg), (list))
+#define page_list_empty(list)        ((list)->head == NULL)
+#define page_list_first(list)        ((list)->head)
+#define page_list_last(list)         ((list)->tail)
+#define page_list_remove_head(list)  test_page_list_remove_head((list))
+
+static inline void test_page_list_add_common(struct page_info *pg,
+                                             struct page_list_head *list,
+                                             bool at_tail)
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
+
+    list->count++;
+}
+
+#define test_page_list_add(pg, list) test_page_list_add_common(pg, list, false)
+#define test_page_list_add_tail(pg, list) \
+        test_page_list_add_common(pg, list, true)
+
+static inline void test_page_list_del(struct page_info *pg,
+                                      struct page_list_head *list)
+{
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
+}
+
+static inline struct page_info *
+test_page_list_remove_head(struct page_list_head *list)
+{
+    struct page_info *pg = list->head;
+
+    if ( pg )
+        test_page_list_del(pg, list);
+
+    return pg;
+}
+
+/*
+ * The frame table is the foundation for the buddy allocator algorithm
+ * implemented by page_alloc.c, and the test scenarios manipulate the
+ * state of the page_info structures in the frame table to set up test
+ * conditions and verify the behavior of the allocator.
+ *
+ * The frame table is indexed by MFN as required by the buddy allocator
+ * algorithm in page_alloc.c, so the translation functions between page_info
+ * pointers and MFNs are defined to allow page_alloc.c to manipulate the
+ * page_info structures in the test frame table using MFN-based translations.
+ */
+extern struct page_info frame_table[];
+#define page_to_mfn(pg)   ((mfn_t)((pg) - &frame_table[0]))
+#define mfn_to_page(mfn)  (&frame_table[(mfn)])
+#define mfn_valid(mfn)    (mfn >= first_valid_mfn && mfn < max_page)
+#define maddr_to_page(pa) (CHECK(false, "Not implemented"))
+
+/*
+ * Helper functions to print the state of the heap and offlined pages
+ * for reference while asserting consistency of the heap and offlined
+ * page state.
+ *
+ * These functions are called at various points in the test scenarios
+ * to validate that the internal state of the allocator is consistent
+ * with expectations.
+ */
+
+/* Architecture-specific page state defines */
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
+
+struct PGC_flag_names {
+    unsigned long flag;
+    const char   *name;
+} PGC_flag_names[] = {
+    {.flag = PGC_need_scrub, "PGC_need_scrub"},
+    {.flag = PGC_extra,      "PGC_extra"     },
+    {.flag = PGC_broken,     "PGC_broken"    },
+    {.flag = PGC_xen_heap,   "PGC_xen_heap"  },
+};
+
+static const char *pgc_state_name(unsigned long count_info)
+{
+    switch ( count_info & PGC_state )
+    {
+    case PGC_state_inuse:
+        return "PGC_state_inuse";
+    case PGC_state_offlining:
+        return "PGC_state_offlining";
+    case PGC_state_offlined:
+        return "PGC_state_offlined";
+    case PGC_state_free:
+        return "PGC_state_free";
+    default:
+        assert("Invalid page state" && false);
+    }
+}
+
+/* Print the count_info flags of a page_info for reference */
+static void print_page_count_info(unsigned long count_info)
+{
+    printf("        flags: %s", pgc_state_name(count_info));
+    for ( size_t i = 0; i < ARRAY_SIZE(PGC_flag_names); i++ )
+        if ( count_info & PGC_flag_names[i].flag )
+            printf(" %s", PGC_flag_names[i].name);
+    puts("");
+}
+
+/* Print the state of a single page for reference */
+static void print_page_info(struct page_info *pos)
+{
+    printf("      mfn %lu: order %u, first_dirty %x\n", page_to_mfn(pos),
+           PFN_ORDER(pos), pos->u.free.first_dirty);
+    print_page_count_info(pos->count_info);
+}
+
+/* Print and assert the state of an offlined page.*/
+static void print_and_assert_offlined_page(struct page_info *pos)
+{
+    print_page_info(pos);
+    /*
+     * The order of offlined pages must always be 0 because pages are only
+     * offlined as standalone pages.  Higher-order pages on the offline lists
+     * are not supported by reserve_offlined_page() and online_page().
+     */
+    CHECK(PFN_ORDER(pos) == 0, "All offlined pages must have order 0");
+
+    /*
+     * Check the first_dirty index of offlined pages: Current code does
+     * not use first_dirty for offlined pages as it only points to the
+     * first dirty subpage within a buddy on the heap, and offlined pages
+     * are not on the heap. As it is not used, current code sets it to
+     * INVALID_DIRTY_IDX when offlining a page, so just confirm that.
+     *
+     * PS: Their scrubbing state is tracked by count_info & PG_need_scrub.
+     * In case an offlined page is onlined, the onlining code will be
+     * responsible to set first_dirty based on the scrubbing state.
+     */
+    if ( pos->u.free.first_dirty != INVALID_DIRTY_IDX )
+    {
+        printf("WARNING: offlined page at MFN %lu has first_dirty %x but "
+               "expected INVALID_DIRTY_IDX\n",
+               page_to_mfn(pos), pos->u.free.first_dirty);
+        ASSERT(pos->u.free.first_dirty == INVALID_DIRTY_IDX);
+    }
+}
+
+#endif /* _MOCK_PAGE_LIST_H_ */
\ No newline at end of file
diff --git a/tools/tests/alloc/page_alloc-wrapper.h b/tools/tests/alloc/page_alloc-wrapper.h
new file mode 100644
index 000000000000..ce1889e3aa37
--- /dev/null
+++ b/tools/tests/alloc/page_alloc-wrapper.h
@@ -0,0 +1,465 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test framework for testing Xen's memory-allocation functionality.
+ *
+ * This file wraps xen/common/page_alloc.c for the test framework.
+ *
+ * Context:
+ *
+ * The test framework includes the real page_alloc.c directly into its
+ * translation unit, along with mocks for the Xen types and functions
+ * used by page_alloc.c, and a library for NUMA heap initialisation
+ * and asserting the heap status.
+ *
+ * This file serves as the wrapper around page_alloc.c, providing the
+ * necessary definitions and helpers to allow the test framework to
+ * include the real page_alloc.c directly into its translation unit.
+ *
+ * It also provides wrapper functions for key page_alloc.c functions like
+ * mark_page_offline() and offline_page() to allow the test scenarios to
+ * log the actions being taken and the outcomes observed when these functions
+ * are called, which is important for understanding the behavior of the
+ * allocator during the test scenarios and for debugging any issues that arise.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#include <stdarg.h>
+#include <string.h>
+
+#define TEST_USES_PAGE_ALLOC_SHIM
+#include "page_alloc_shim.h"
+
+/* Include the real page_alloc.c for testing */
+
+#pragma GCC diagnostic push
+/* TODO: We should fix the remaining sign-compare warnings in page_alloc.c */
+#pragma GCC diagnostic ignored "-Wsign-compare"
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#include "../../xen/common/page_alloc.c"
+#pragma GCC diagnostic pop
+
+/* Allows the logging spinlock/unlock mocks to identify the heap lock */
+static spinlock_t *heap_lock_ptr = &heap_lock;
+
+/*
+ * Global state for the test page allocator shim and helpers.
+ *
+ * This includes the heap storage and availability counters that the test
+ * scenarios manipulate, as well as the domain list and a bug counter for
+ * the test program to track any unexpected conditions encountered in the
+ * test helpers.
+ */
+#ifndef PAGES_PER_ZONE
+#define PAGES_PER_ZONE 8
+#endif
+
+#ifndef MAX_PAGES
+#define MAX_PAGES (MAX_NUMNODES * NR_ZONES * PAGES_PER_ZONE)
+#endif
+
+/*
+ * The test frame table serves as the backing storage for the page_info
+ * structures used in the test scenarios, and the page_info structures
+ * are indexed by MFN for easy translation between page_info pointers and
+ * MFNs in the test helpers and assertions.
+ *
+ * The frame table is the foundation for the buddy allocator algorithm
+ * implemented by page_alloc.c, and the test scenarios manipulate the
+ * state of the page_info structures in the frame table to set up test
+ * conditions and verify the behavior of the allocator.
+ */
+struct page_info frame_table[MAX_PAGES];
+
+/* Provide a test pages pointer for the test scenarios */
+static struct page_info *test_pages = frame_table;
+
+/*
+ * Global state for the test page allocator shim and helpers.
+ *
+ * This includes the heap storage and availability counters that the test
+ * scenarios manipulate, as well as the domain list and a bug counter for
+ * the test program to track any unexpected conditions encountered in the
+ * test helpers.
+ */
+static heap_by_zone_and_order_t test_heap_storage[MAX_NUMNODES];
+static unsigned long test_avail_storage[MAX_NUMNODES][NR_ZONES];
+struct domain *domain_list;
+typedef size_t zone_t;
+
+static int __used test_domain_install_claim_set(struct domain *d,
+                                                unsigned int nr_claims,
+                                                memory_claim_t *claim_set)
+{
+    bool save_verbose_asserts = testcase_assert_verbose_assertions;
+    char target_str[16];
+
+    /* Avoid logging verbose logging while marking a page offline */
+    testcase_assert_verbose_assertions = false;
+
+    printf("%s => Installing claim set for domain %u:\n", __func__,
+           d->domain_id);
+    for ( unsigned int i = 0; i < nr_claims; i++ )
+    {
+        switch ( claim_set[i].target )
+        {
+        case XEN_DOMCTL_CLAIM_MEMORY_GLOBAL:
+            snprintf(target_str, sizeof(target_str), "GLOBAL");
+            break;
+        case XEN_DOMCTL_CLAIM_MEMORY_LEGACY:
+            snprintf(target_str, sizeof(target_str), "LEGACY");
+            break;
+        default:
+            snprintf(target_str, sizeof(target_str), "NODE %u",
+                     claim_set[i].target);
+            break;
+        }
+        printf("  Claim %u: pages=%lu, target=%s\n", i, claim_set[i].pages,
+               target_str);
+    }
+
+    int ret = domain_install_claim_set(d, nr_claims, claim_set);
+    printf("%s <= domain_install_claim_set() returned %d\n", __func__, ret);
+    testcase_assert_verbose_assertions = save_verbose_asserts;
+    return ret;
+}
+#define domain_install_claim_set(d, nr_claims, claim_set) \
+        test_domain_install_claim_set(d, nr_claims, claim_set)
+
+static unsigned long __used test_mark_page_offline(struct page_info *page,
+                                                   int flag,
+                                                   const char *caller_func)
+{
+    bool save_verbose_asserts = testcase_assert_verbose_assertions;
+
+    /* Avoid logging verbose logging while marking a page offline */
+    testcase_assert_verbose_assertions = false;
+
+    printf("%s => Marking page at MFN %lu as %s.\n", caller_func,
+           page_to_mfn(page), flag ? "broken" : "offlined");
+
+    mark_page_offline(page, flag);
+
+    testcase_assert_verbose_assertions = save_verbose_asserts;
+    return 0;
+}
+#define mark_page_offline(pg, flag) test_mark_page_offline(pg, flag, __func__)
+
+static const char *offline_state_name(uint32_t offline_status)
+{
+    switch ( offline_status )
+    {
+    case PG_OFFLINE_FAILED:
+        return "PG_OFFLINE_FAILED";
+    case PG_OFFLINE_PENDING:
+        return "PG_OFFLINE_PENDING";
+    case PG_OFFLINE_OFFLINED:
+        return "PG_OFFLINE_OFFLINED";
+    case PG_OFFLINE_AGAIN:
+        return "PG_OFFLINE_AGAIN";
+    default:
+        return "PG_OFFLINE_UNKNOWN_STATUS";
+    }
+}
+
+static int __used test_offline_page(mfn_t mfn, int broken, uint32_t *status)
+{
+    bool save_verbose_asserts = testcase_assert_verbose_assertions;
+
+    testcase_assert_verbose_assertions = false;
+    printf("%s => Offlining page at MFN %lu with broken=%d\n", __func__, mfn,
+           broken);
+
+    int ret = offline_page(mfn, broken, status);
+
+    printf("%s <= offline_page() returned %d, status=0x%x (%s)\n", __func__,
+           ret, *status, offline_state_name(*status));
+    testcase_assert_verbose_assertions = save_verbose_asserts;
+    return 0;
+}
+#define offline_page(mfn, broken, status) test_offline_page(mfn, broken, status)
+
+static int __used test_set_outstanding_pages(struct domain *dom,
+                                             unsigned long pages,
+                                             const char *caller_func)
+{
+    bool save_verbose_asserts = testcase_assert_verbose_assertions;
+
+    /* Avoid logging verbose logging while setting outstanding claims */
+    testcase_assert_verbose_assertions = false;
+    printf("%s => domain_set_outstanding_pages(dom=%u, pages=%lu)\n",
+           caller_func, dom->domain_id, pages);
+
+    int ret = domain_set_outstanding_pages(dom, pages);
+
+    printf("%s <= domain_set_outstanding_pages() = %d\n", caller_func, ret);
+    testcase_assert_current_func = NULL;
+    testcase_assert_verbose_assertions = save_verbose_asserts;
+    return ret;
+}
+#define domain_set_outstanding_pages(dom, pages) \
+        test_set_outstanding_pages(dom, pages, __func__)
+
+static struct page_info *__used test_alloc_domheap(struct domain *dom,
+                                                   unsigned int order,
+                                                   unsigned int memflags,
+                                                   const char *caller_func)
+{
+    bool save_verbose_asserts = testcase_assert_verbose_assertions;
+
+    /* Avoid logging verbose logging while allocating domheap pages */
+    testcase_assert_verbose_assertions = false;
+    printf("%s => alloc_domheap_pages(dom=%u, order=%u, memflags=%x)\n",
+           caller_func, dom->domain_id, order, memflags);
+    testcase_assert_current_func = "alloc_domheap_pages";
+    testcase_assert_verbose_indent_level++;
+    struct page_info *pg = alloc_domheap_pages(dom, order, memflags);
+    testcase_assert_verbose_indent_level--;
+    testcase_assert_current_func = NULL;
+
+    testcase_assert_verbose_assertions = save_verbose_asserts;
+    return pg;
+}
+#define alloc_domheap_pages(dom, order, memflags) \
+        test_alloc_domheap(dom, order, memflags, __func__)
+
+#ifdef CONFIG_SYSCTL
+/* Helper for just getting the number of free pages for ASSERTs */
+static uint64_t __used free_pages(void)
+{
+    uint64_t free_pages, total_claims;
+    bool verbose_asserts_save = testcase_assert_verbose_assertions;
+
+    /* Avoid logging spinlock actions while getting the free page count */
+    testcase_assert_verbose_assertions = false;
+    get_outstanding_claims(&free_pages, &total_claims);
+    testcase_assert_verbose_assertions = verbose_asserts_save;
+    return free_pages;
+}
+#define FREE_PAGES free_pages()
+
+/* Helper for just getting the total number of claimed pages for ASSERTs */
+static uint64_t __used total_claims(void)
+{
+    uint64_t free_pages, total_claims;
+    bool verbose_asserts_save = testcase_assert_verbose_assertions;
+
+    /* Avoid logging spinlock actions while getting the total claims */
+    testcase_assert_verbose_assertions = false;
+    get_outstanding_claims(&free_pages, &total_claims);
+    testcase_assert_verbose_assertions = verbose_asserts_save;
+    return total_claims;
+}
+#define TOTAL_CLAIMS total_claims()
+
+#define DOM_GLOBAL_CLAIMS(d)  ((d)->global_claims)
+#define DOM_NODE_CLAIMS(d, n) ((d)->claims[n])
+
+#endif /* CONFIG_SYSCTL */
+
+static void print_order_list(nodeid_t node, zone_t zone, size_t order)
+{
+    struct page_info *pos = page_list_first(&heap(node, zone, order));
+
+    if ( pos )
+        printf("    Heap for zone %zu, order %zu:\n", zone, order);
+
+    while ( pos )
+    {
+        size_t page_order = PFN_ORDER(pos);
+
+        print_page_info(pos);
+        /* Print the subpages of the buddy head */
+        for ( size_t sub_pg = 1; sub_pg < (1U << page_order); sub_pg++ )
+        {
+            struct page_info *sub_pos = pos + sub_pg;
+
+            printf("  ");
+            print_page_info(sub_pos);
+            /* Assert the subpages of a buddy to have order-0. */
+            ASSERT(PFN_ORDER(sub_pos) == 0);
+        }
+        /* Assert that the page_order matches the heap order. */
+        if ( page_order != order )
+        {
+            printf("ERROR:mfn %lu has order %zu but expected %zu "
+                   "based on heap position\n",
+                   page_to_mfn(pos), page_order, order);
+            ASSERT(page_order == order);
+        }
+        pos = pos->list_next;
+    }
+}
+
+#define CHECK_BUDDY(pages, fmt, ...) \
+        check_buddy(pages, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
+
+/* Function to print the order and first_dirty of each page for debugging. */
+static void check_buddy(struct page_info *pages, const char *file, int line,
+                        const char *fmt, ...)
+{
+    size_t size = 1U << PFN_ORDER(pages);
+    bool verbose_asserts_save = testcase_assert_verbose_assertions;
+    va_list args;
+
+    if ( fmt ) /* Print the given message for context in the logs.*/
+    {
+        va_start(args, fmt);
+        printf("  %s:%d: ", file, line);
+        vprintf(fmt, args);
+        puts(":");
+        va_end(args);
+    }
+    else
+        printf("  %s:%d: %s():\n", file, line, __func__);
+
+    /* Avoid logging internal assertions while logging the free list status */
+    testcase_assert_verbose_assertions = false;
+
+    /*
+     * Inside pages, first_dirty must (if not INVALID_DIRTY_IDX) index the
+     * (first) page itself or a subpage within the page's range (<= 2^order).
+     */
+    for ( size_t i = 0; i < size; i++ )
+    {
+        unsigned long first_dirty = pages[i].u.free.first_dirty;
+        unsigned int tail_offset = (1U << PFN_ORDER(&pages[i])) - 1;
+
+        if ( first_dirty != INVALID_DIRTY_IDX && first_dirty > tail_offset )
+        {
+            printf("page at index %zu has first_dirty %lx but expected <= %u "
+                   "based on its order\n",
+                   i, first_dirty, tail_offset);
+            ASSERT(pages[i].u.free.first_dirty == tail_offset);
+        }
+    }
+
+    /* Traverse the offlined list, print and assert errors in it. */
+    struct page_info *pos = page_list_first(&page_offlined_list);
+    if ( pos )
+        puts("    Offlined list:");
+    while ( pos )
+    {
+        print_and_assert_offlined_page(pos);
+        pos = pos->list_next;
+    }
+
+    /* Traverse the broken list, print and assert errors in it. */
+    pos = page_list_first(&page_broken_list);
+    if ( pos )
+        puts("    Broken list:");
+    while ( pos )
+    {
+        print_and_assert_offlined_page(pos);
+        pos = pos->list_next;
+    }
+
+    /*
+     * Traverse the _heap[node] for each order and zone and print and assert
+     * the order and first_dirty of each page for each heap for debugging.
+     *
+     * This is to help verify that the heap structure is consistent with the
+     * page_info order fields after operations that manipulate both, such as
+     * reserve_offlined_page().
+     */
+    for ( nodeid_t node = 0; node < MAX_NUMNODES; node++ )
+        for ( size_t order = 0; order <= MAX_ORDER; order++ )
+            for ( size_t zone = 0; zone < NR_ZONES; zone++ )
+                print_order_list(node, zone, order);
+    testcase_assert_verbose_assertions = verbose_asserts_save;
+}
+
+/*
+ * Failure reporting helper that prints the provided message, the test
+ * caller context and a native backtrace before aborting.
+ */
+static void fail_with_ctx(const char *caller_file, const char *caller_func,
+                          int caller_line, const char *fmt, ...)
+{
+    va_list ap;
+
+    fprintf(stderr, "\n- %s: Assertion failed: ", caller_func);
+    va_start(ap, fmt);
+    testcase_assert(false, caller_file, caller_line, caller_func, fmt, ap);
+    vfprintf(stderr, fmt, ap);
+    va_end(ap);
+}
+
+/*
+ * Assert that a page_list matches the provided sequence of page pointers.
+ *
+ * The public helper below is a macro so call sites can provide a simple list
+ * of page pointers while the implementation works over an ordinary array.
+ */
+static void __used assert_list_eq_array(struct page_list_head *list,
+                                        struct page_info *const expected[],
+                                        unsigned int nr_expected,
+                                        const char *call_file,
+                                        const char *caller_func,
+                                        int caller_line)
+{
+    struct page_info *pos;
+    int fails_before = testcase_assert_expected_failures;
+    unsigned int index = 0;
+
+    if ( list->count != nr_expected )
+        fail_with_ctx(call_file, caller_func, caller_line,
+                      "list count mismatch: expected %u, got %u", nr_expected,
+                      list->count);
+
+    if ( nr_expected == 0 )
+    {
+        if ( page_list_first(list) != NULL )
+            fail_with_ctx(call_file, caller_func, caller_line,
+                          "expected empty list but head != NULL");
+        else
+            testcase_assert_successful_assert_total++;
+        return;
+    }
+
+    if ( page_list_first(list) != expected[0] )
+        fail_with_ctx(call_file, caller_func, caller_line,
+                      "list head mismatch: expected %p, got %p", expected[0],
+                      page_list_first(list));
+
+    for ( pos = page_list_first(list); pos; pos = pos->list_next, index++ )
+    {
+        if ( index >= nr_expected )
+            fail_with_ctx(call_file, caller_func, caller_line,
+                          "list contains more elements than expected");
+
+        if ( pos != expected[index] )
+            fail_with_ctx(call_file, caller_func, caller_line,
+                          "element %u mismatch: expected %p, got %p", index,
+                          expected[index], pos);
+
+        if ( pos->list_prev != (index ? expected[index - 1] : NULL) )
+            fail_with_ctx(call_file, caller_func, caller_line,
+                          "list_prev mismatch at index %u", index);
+
+        if ( pos->list_next !=
+             (index + 1 < nr_expected ? expected[index + 1] : NULL) )
+            fail_with_ctx(call_file, caller_func, caller_line,
+                          "list_next mismatch at index %u", index);
+    }
+
+    if ( index != nr_expected )
+        fail_with_ctx(
+            call_file, caller_func, caller_line,
+            "list element count consumed mismatch: expected %u, got %u",
+            nr_expected, index);
+
+    if ( testcase_assert_expected_failures == fails_before )
+        testcase_assert_successful_assert_total++;
+}
+
+/** Assert that a page_list matches the provided sequence of page pointers. */
+#define ASSERT_LIST_EQUAL(list, ...)                                     \
+        do                                                               \
+        {                                                                \
+            struct page_info *const expected[] = {__VA_ARGS__};          \
+            assert_list_eq_array((list), expected, ARRAY_SIZE(expected), \
+                                 __FILE__,                               \
+                                 __func__, __LINE__);                    \
+        } while ( 0 )
+/** Assert that a page_list is empty. */
+#define ASSERT_LIST_EMPTY(list) ASSERT(page_list_empty(list))
diff --git a/tools/tests/alloc/page_alloc_shim.h b/tools/tests/alloc/page_alloc_shim.h
new file mode 100644
index 000000000000..74459b6dda61
--- /dev/null
+++ b/tools/tests/alloc/page_alloc_shim.h
@@ -0,0 +1,433 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Header-only shim for unit testing functions in xen/common/page_alloc.c.
+ *
+ * This header provides the necessary definitions and helpers to allow:
+ *
+ * 1) the test program to include the real page_alloc.c directly into its
+ *    translation unit, and
+ *
+ * 2) the test scenarios to manipulate the allocator state and verify its
+ *    behavior in a way that is consistent with the real page_alloc.c, while
+ *    being self-contained and suitable for unit testing.
+ *
+ * The test page allocator shim provides the necessary definitions for the
+ * page_info structure and the translation functions between page_info
+ * pointers and MFNs, so that page_alloc.c can manipulate the page_info
+ * structures in the test frame table and verify its behavior in a way
+ * that is consistent with how page_alloc.c acts when used by the running
+ * hypervisor, while being self-contained and suitable for unit testing.
+ *
+ * Shim definitions for Xen types and functions used by page_alloc.c.
+ *
+ * This shim is intended to be included directly in the test program
+ * or header-only library for testing a specific scenario, included
+ * by the test program, for unit testing functions in common/page_alloc.c.
+ *
+ * It provides stubs (minimal definitions for Xen types and functions)
+ * used by page_alloc.c, sufficient to support the test scenarios in
+ * tools/tests/alloc.
+ *
+ * It is not intended to be complete or accurate for general use in
+ * other test contexts or as a general-purpose shim for page_alloc.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#ifndef _TEST_ALLOC_PAGE_ALLOC_SHIM_
+#define _TEST_ALLOC_PAGE_ALLOC_SHIM_
+
+/*.
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
+#include "mock-page_list.h"
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
+ * Provide two domains for the test context, so that test helpers can
+ * call allocator functions that require domain context and verify behavior
+ * that depends on domain state, such as claims accounting and page allocation
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
+static inline unsigned int domain_tot_pages(const struct domain *d)
+{
+    assert(d->extra_pages <= d->tot_pages);
+    return d->tot_pages - d->extra_pages;
+}
+
+/* LLC (Last Level Cache) coloring support stubs */
+#define llc_coloring_enabled                false
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
+
+#endif /* TEST_USES_PAGE_ALLOC_SHIM */
+#endif /* _TEST_ALLOC_PAGE_ALLOC_SHIM_ */
-- 
2.39.5


