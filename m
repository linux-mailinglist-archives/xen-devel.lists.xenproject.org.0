Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF36B3C58F
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 01:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102359.1455006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pe-0008MN-Qw; Fri, 29 Aug 2025 23:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102359.1455006; Fri, 29 Aug 2025 23:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pe-0008Jf-NN; Fri, 29 Aug 2025 23:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1102359;
 Fri, 29 Aug 2025 23:21:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1us8Pc-00083c-TD
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 23:21:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pc-00CpQg-0v;
 Fri, 29 Aug 2025 23:21:40 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pc-008JlR-0u;
 Fri, 29 Aug 2025 23:21:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=KyIZ62nEfvpAXg3s9P0rgyEI55mSOfVO5MC+DjzKkY8=; b=XYqt/vUepmINDP/mklyjXx5Us5
	nbsRowy4cPJNYvWSbppnXAtiGRM4uVWugQtMMsc2AhMwsg2BM5YVxk8HzO+3wsG2trJGN6jYx5Ri2
	kIEKx60yovmeUKd0Z0mHdQl35kH0cxRVvQXv/T6uJJwzJuoyD84uP3qbO2dnBlbxL2v0=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v17 3/4] tools/tests: introduce unit tests for domain ID allocator
Date: Fri, 29 Aug 2025 16:21:31 -0700
Message-ID: <20250829232132.3460081-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
References: <20250829232132.3460081-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Introduce some basic infrastructure for doing domain ID allocation unit tests,
and add a few tests that ensure correctness of the domain ID allocator.

Use <xen-tools/bitops.h> and xen/lib/find-next-bit.c in test hardness code.

Adjust find-next-bit.c to be compiled with __XEN_TOOLS__.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v16:
- used exit() in the test suite's verify()
- various fixes in the test Makefile
---
 tools/include/xen-tools/bitops.h | 10 ++++
 tools/tests/Makefile             |  1 +
 tools/tests/domid/.gitignore     |  2 +
 tools/tests/domid/Makefile       | 88 +++++++++++++++++++++++++++++
 tools/tests/domid/harness.h      | 54 ++++++++++++++++++
 tools/tests/domid/test-domid.c   | 95 ++++++++++++++++++++++++++++++++
 xen/lib/find-next-bit.c          |  5 ++
 7 files changed, 255 insertions(+)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/harness.h
 create mode 100644 tools/tests/domid/test-domid.c

diff --git a/tools/include/xen-tools/bitops.h b/tools/include/xen-tools/bitops.h
index 681482f6759f..3b98fba6d74c 100644
--- a/tools/include/xen-tools/bitops.h
+++ b/tools/include/xen-tools/bitops.h
@@ -12,6 +12,16 @@
 #define BITS_PER_LONG 32
 #endif
 
+#define ffsl(x)       __builtin_ffsl(x)
+
+#define BIT_WORD(nr)  ((nr) / BITS_PER_LONG)
+
+#define BITS_TO_LONGS(bits) \
+    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
+
+#define DECLARE_BITMAP(name, bits) \
+    unsigned long name[BITS_TO_LONGS(bits)]
+
 #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
 #define BITMAP_SHIFT(_nr) ((_nr) % 8)
 
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 97ba2a13894d..ac5737364623 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS-y :=
+SUBDIRS-y += domid
 SUBDIRS-y += resource
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += tsx
diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignore
new file mode 100644
index 000000000000..37d773103be4
--- /dev/null
+++ b/tools/tests/domid/.gitignore
@@ -0,0 +1,2 @@
+generated
+test-domid
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
new file mode 100644
index 000000000000..22f1f15d11db
--- /dev/null
+++ b/tools/tests/domid/Makefile
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit tests for domain ID allocator.
+#
+# Copyright 2025 Ford Motor Company
+
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TESTS := test-domid
+
+define list-c-headers
+$(shell sed -n -E \
+    's/^[ \t]*# *include[ \t]*[<"]([^">]+)[">].*/\1/p' $(1) 2>/dev/null)
+endef
+
+# NB: $1 cannot be a list
+define emit-harness-nested-rule
+$(1): $(CURDIR)/harness.h
+	mkdir -p $$(@D);
+	ln -sf $$< $$@;
+
+endef
+
+define emit-harness-rules
+$(foreach x,$(2),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(x)))
+$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
+endef
+
+define emit-harness-deps
+$(if $(strip $(2)),$(call emit-harness-rules,$1,$2),)
+endef
+
+define vpath-with-harness-deps
+vpath $(1) $(2)
+$(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
+endef
+
+.PHONY: all
+all: $(TESTS)
+
+.PHONY: run
+run: $(TESTS)
+	set -e; $(foreach t,$(TESTS),./$(t);)
+
+.PHONY: clean
+clean:
+	$(RM) -r generated
+	$(RM) -- *.o $(TESTS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
+
+CFLAGS += -D__XEN_TOOLS__
+# find-next-bit.c
+CFLAGS += '-DEXPORT_SYMBOL(x)=' \
+          -Dfind_first_bit \
+          -Dfind_first_zero_bit \
+          -Dfind_next_bit \
+          -Dfind_next_bit_le \
+          -Dfind_next_zero_bit_le
+CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += -I./generated/
+
+LDFLAGS += $(APPEND_LDFLAGS)
+
+vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
+
+# Point to the hypervisor code and generate test harness dependencies
+# on the fly, making it possible to compile parts of the hypervisor
+# within a mocked environment.
+$(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
+
+test-domid: domid.o find-next-bit.o test-domid.o
+	$(CC) $^ -o $@ $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
new file mode 100644
index 000000000000..17eb22a9a854
--- /dev/null
+++ b/tools/tests/domid/harness.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit test harness for domain ID allocator.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#ifndef _TEST_HARNESS_
+#define _TEST_HARNESS_
+
+#include <assert.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+
+#include <xen-tools/common-macros.h>
+#include <xen-tools/bitops.h>
+
+typedef bool spinlock_t;
+typedef uint16_t domid_t;
+
+extern domid_t domid_alloc(domid_t domid);
+extern void domid_free(domid_t domid);
+
+extern unsigned long find_next_zero_bit(const unsigned long *addr,
+                                        unsigned long size,
+                                        unsigned long offset);
+
+#define __test_and_set_bit(nr, addr)    test_and_set_bit(nr, addr)
+#define __test_and_clear_bit(nr, addr)  test_and_clear_bit(nr, addr)
+#define __set_bit(nr, addr)             set_bit(nr, addr)
+
+#define BUG_ON(x)                       assert(!(x))
+#define ASSERT(x)                       assert(x)
+
+#define DEFINE_SPINLOCK(l)              spinlock_t l
+#define spin_lock(l)                    (assert(!*(l)), *(l) = true)
+#define spin_unlock(l)                  (assert(*(l)), *(l) = false)
+
+#define printk                          printf
+
+#define DOMID_FIRST_RESERVED            (100)
+#define DOMID_INVALID                   (101)
+
+#endif /* _TEST_HARNESS_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
new file mode 100644
index 000000000000..5915c4699a5c
--- /dev/null
+++ b/tools/tests/domid/test-domid.c
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for domain ID allocator.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#include <sysexits.h>
+
+#include "harness.h"
+
+#define verify(exp, fmt, args...) \
+while (!(exp)) { \
+    printf(fmt, ## args); \
+    exit(EX_SOFTWARE); \
+}
+
+/*
+ * Fail on the first error, since tests are dependent on each other.
+ */
+int main(int argc, char **argv)
+{
+    domid_t expected, allocated;
+
+    /* Test ID cannot be allocated twice. */
+    for ( expected = 0; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated = domid_alloc(expected);
+        verify(allocated == expected,
+               "TEST 1: expected %u allocated %u\n", expected, allocated);
+    }
+    for ( expected = 0; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated = domid_alloc(expected);
+        verify(allocated == DOMID_INVALID,
+               "TEST 2: expected %u allocated %u\n", DOMID_INVALID, allocated);
+    }
+
+    /* Ensure all IDs, including ID#0 are not allocated. */
+    for ( expected = 0; expected < DOMID_FIRST_RESERVED; expected++ )
+        domid_free(expected);
+
+    /*
+     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * will never return the same ID.
+     * NB: ID#0 is reserved and shall not be allocated by
+     * domid_alloc(DOMID_INVALID).
+     */
+    for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated = domid_alloc(DOMID_INVALID);
+        verify(allocated == expected,
+               "TEST 3: expected %u allocated %u\n", expected, allocated);
+    }
+    for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated = domid_alloc(DOMID_INVALID);
+        verify(allocated == DOMID_INVALID,
+               "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
+    }
+
+    /* Re-allocate first ID from [1..DOMID_FIRST_RESERVED/2]. */
+    for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
+        domid_free(expected);
+    for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
+    {
+        allocated = domid_alloc(DOMID_INVALID);
+        verify(allocated == expected,
+               "TEST 5: expected %u allocated %u\n", expected, allocated);
+    }
+
+    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
+    expected = DOMID_FIRST_RESERVED - 1;
+    domid_free(DOMID_FIRST_RESERVED - 1);
+    allocated = domid_alloc(DOMID_INVALID);
+    verify(allocated == expected,
+           "TEST 6: expected %u allocated %u\n", expected, allocated);
+
+    /* Allocate an invalid ID. */
+    expected = DOMID_INVALID;
+    allocated = domid_alloc(DOMID_FIRST_RESERVED);
+    verify(allocated == expected,
+           "TEST 7: expected %u allocated %u\n", expected, allocated);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/lib/find-next-bit.c b/xen/lib/find-next-bit.c
index 9b8d7814f20c..539c7f2022b0 100644
--- a/xen/lib/find-next-bit.c
+++ b/xen/lib/find-next-bit.c
@@ -8,8 +8,13 @@
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  */
+
+#ifdef __XEN_TOOLS__
+#include <xen-tools/bitops.h>
+#else
 #include <xen/bitops.h>
 #include <xen/byteorder.h>
+#endif
 
 #define __ffs(x) (ffsl(x) - 1)
 #define ffz(x) __ffs(~(x))
-- 
2.51.0


