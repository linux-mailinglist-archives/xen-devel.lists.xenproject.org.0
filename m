Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20DFB23BE8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 00:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079226.1440228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxWD-0004dg-8x; Tue, 12 Aug 2025 22:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079226.1440228; Tue, 12 Aug 2025 22:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulxWD-0004Xe-40; Tue, 12 Aug 2025 22:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1079226;
 Tue, 12 Aug 2025 22:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Th/E=2Y=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulxWB-0004TJ-HQ
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 22:30:55 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0275461e-77cc-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 00:30:54 +0200 (CEST)
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
X-Inumbo-ID: 0275461e-77cc-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=drlnfcq6ibai7j3scksxxx3k4u.protonmail; t=1755037853; x=1755297053;
	bh=XixfifFOrDZoa6xOSIH77VDx3GwR4fb7LvpluvJ+FYg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CzzqokghsJ3fplhix4wp7CjkN4QKyU6vpbPlqZIBHmrCGGDk1supy/UgGmEOI8jV6
	 U8JsU/lhFhE6zHWtlqNxQtYZ5U1GFbfVeBR+KM706+MNpVC6aV6AD52U8ig2zCwCgx
	 TBUrccpbSd+49LWGP6AzXZVfvpft0RJeICMKAr3SO7DBrjlu8VhezKwxkX40JZ0cju
	 ssttd3NBeWdX4f1b002peyFispSbMhBdI4iXjq6pLwFc4TMZghIKOM/4pz2GBRVT/a
	 ZrJU+CPNOt+gGxBeLyKjATMANi0lZ2t+taGLLw6PxEJhQYFnG8vEdYLcPRL1H2LqLE
	 WrytDsnDqO3AA==
Date: Tue, 12 Aug 2025 22:30:50 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v16 3/4] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <20250812223024.2364749-4-dmukhin@ford.com>
In-Reply-To: <20250812223024.2364749-1-dmukhin@ford.com>
References: <20250812223024.2364749-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 11ec6321e7ada1efd5d07ffd845679c38bf3708e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Introduce some basic infrastructure for doing domain ID allocation unit tes=
ts,
and add a few tests that ensure correctness of the domain ID allocator.

Use <xen-tools/bitops.h> and xen/lib/find-next-bit.c in test hardness code.

Adjust find-next-bit.c to be compiled with __XEN_TOOLS__.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes since v15:
- fixed generating harness dependencies on the fly during the test build
- kept Julien's R-b
---
 tools/include/xen-tools/bitops.h | 10 ++++
 tools/tests/Makefile             |  1 +
 tools/tests/domid/.gitignore     |  3 ++
 tools/tests/domid/Makefile       | 84 +++++++++++++++++++++++++++++
 tools/tests/domid/harness.h      | 54 +++++++++++++++++++
 tools/tests/domid/test-domid.c   | 93 ++++++++++++++++++++++++++++++++
 xen/lib/find-next-bit.c          |  5 ++
 7 files changed, 250 insertions(+)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/harness.h
 create mode 100644 tools/tests/domid/test-domid.c

diff --git a/tools/include/xen-tools/bitops.h b/tools/include/xen-tools/bit=
ops.h
index 681482f6759f..3b98fba6d74c 100644
--- a/tools/include/xen-tools/bitops.h
+++ b/tools/include/xen-tools/bitops.h
@@ -12,6 +12,16 @@
 #define BITS_PER_LONG 32
 #endif
=20
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
=20
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 97ba2a13894d..ac5737364623 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -2,6 +2,7 @@ XEN_ROOT =3D $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
=20
 SUBDIRS-y :=3D
+SUBDIRS-y +=3D domid
 SUBDIRS-y +=3D resource
 SUBDIRS-$(CONFIG_X86) +=3D cpu-policy
 SUBDIRS-$(CONFIG_X86) +=3D tsx
diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignore
new file mode 100644
index 000000000000..0e02715159c2
--- /dev/null
+++ b/tools/tests/domid/.gitignore
@@ -0,0 +1,3 @@
+*.o
+generated
+test-domid
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
new file mode 100644
index 000000000000..0a124a8bfc76
--- /dev/null
+++ b/tools/tests/domid/Makefile
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit tests for domain ID allocator.
+#
+# Copyright 2025 Ford Motor Company
+
+XEN_ROOT=3D$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TESTS :=3D test-domid
+
+strip-list =3D $(sort $(strip $(foreach x,$(1),$(strip $(x)))))
+
+define list-c-headers
+$(shell sed -n -r \
+    's/^[ \t]*# *include[ \t]*[<"]([^">]+)[">].*/\1/p' $(1) 2>/dev/null)
+endef
+
+define emit-harness-nested-rule
+$(1): $(CURDIR)/harness.h
+=09mkdir -p $$(dir $$@)
+=09ln -sf $$^ $$@
+endef
+
+define emit-harness-rules
+ifneq ($(strip $(3)),)
+$(foreach h,$(3),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(h))=
)
+vpath $(1) $(2)
+$(1:.c=3D.o): $(addprefix $(CURDIR)/generated/,$(3))
+endif
+endef
+
+define vpath-with-harness-deps
+$(call emit-harness-rules,$(1),$(2),\
+    $(call strip-list,$(call list-c-headers,$(2)$(1))))
+endef
+
+.PHONY: all
+all: $(TESTS)
+
+.PHONY: run
+run: $(TESTS)
+=09$(foreach t,$(TESTS),./$(t);)
+
+.PHONY: clean
+clean:
+=09$(RM) -rf $(CURDIR)/generated
+=09$(RM) -- *.o $(TESTS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+=09$(RM) -- *~
+
+.PHONY: install
+install: all
+=09$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+=09$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+=09$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
+
+CFLAGS +=3D -D__XEN_TOOLS__
+# find-next-bit.c
+CFLAGS +=3D '-DEXPORT_SYMBOL(x)=3D' \
+          -Dfind_first_bit \
+          -Dfind_first_zero_bit \
+          -Dfind_next_bit \
+          -Dfind_next_bit_le \
+          -Dfind_next_zero_bit_le
+CFLAGS +=3D $(APPEND_CFLAGS)
+CFLAGS +=3D $(CFLAGS_xeninclude)
+CFLAGS +=3D -I./generated/
+
+LDFLAGS +=3D $(APPEND_LDFLAGS)
+
+vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
+# Ubuntu {16,18}.04 need single eval at the call site.
+$(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
+
+test-domid: domid.o find-next-bit.o test-domid.o
+=09$(CC) $^ -o $@ $(LDFLAGS)
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
+#define spin_lock(l)                    (assert(!*(l)), *(l) =3D true)
+#define spin_unlock(l)                  (assert(*(l)), *(l) =3D false)
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
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.=
c
new file mode 100644
index 000000000000..51a88a6a9550
--- /dev/null
+++ b/tools/tests/domid/test-domid.c
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for domain ID allocator.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#include "harness.h"
+
+#define verify(exp, fmt, args...) do { \
+    if ( !(exp) ) \
+        printf(fmt, ## args); \
+    assert(exp); \
+} while (0);
+
+/*
+ * Fail on the first error, since tests are dependent on each other.
+ */
+int main(int argc, char **argv)
+{
+    domid_t expected, allocated;
+
+    /* Test ID cannot be allocated twice. */
+    for ( expected =3D 0; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated =3D domid_alloc(expected);
+        verify(allocated =3D=3D expected,
+               "TEST 1: expected %u allocated %u\n", expected, allocated);
+    }
+    for ( expected =3D 0; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated =3D domid_alloc(expected);
+        verify(allocated =3D=3D DOMID_INVALID,
+               "TEST 2: expected %u allocated %u\n", DOMID_INVALID, alloca=
ted);
+    }
+
+    /* Ensure all IDs, including ID#0 are not allocated. */
+    for ( expected =3D 0; expected < DOMID_FIRST_RESERVED; expected++ )
+        domid_free(expected);
+
+    /*
+     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * will never return the same ID.
+     * NB: ID#0 is reserved and shall not be allocated by
+     * domid_alloc(DOMID_INVALID).
+     */
+    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated =3D domid_alloc(DOMID_INVALID);
+        verify(allocated =3D=3D expected,
+               "TEST 3: expected %u allocated %u\n", expected, allocated);
+    }
+    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated =3D domid_alloc(DOMID_INVALID);
+        verify(allocated =3D=3D DOMID_INVALID,
+               "TEST 4: expected %u allocated %u\n", DOMID_INVALID, alloca=
ted);
+    }
+
+    /* Re-allocate first ID from [1..DOMID_FIRST_RESERVED/2]. */
+    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED / 2; expected++ =
)
+        domid_free(expected);
+    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED / 2; expected++ =
)
+    {
+        allocated =3D domid_alloc(DOMID_INVALID);
+        verify(allocated =3D=3D expected,
+               "TEST 5: expected %u allocated %u\n", expected, allocated);
+    }
+
+    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
+    expected =3D DOMID_FIRST_RESERVED - 1;
+    domid_free(DOMID_FIRST_RESERVED - 1);
+    allocated =3D domid_alloc(DOMID_INVALID);
+    verify(allocated =3D=3D expected,
+           "TEST 6: expected %u allocated %u\n", expected, allocated);
+
+    /* Allocate an invalid ID. */
+    expected =3D DOMID_INVALID;
+    allocated =3D domid_alloc(DOMID_FIRST_RESERVED);
+    verify(allocated =3D=3D expected,
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
=20
 #define __ffs(x) (ffsl(x) - 1)
 #define ffz(x) __ffs(~(x))
--=20
2.34.1



