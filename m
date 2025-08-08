Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A8B1E097
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 04:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073906.1436696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiM-0006xQ-Jy; Fri, 08 Aug 2025 02:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073906.1436696; Fri, 08 Aug 2025 02:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukCiM-0006vQ-GU; Fri, 08 Aug 2025 02:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1073906;
 Fri, 08 Aug 2025 02:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukCiK-0005lR-Im
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 02:20:12 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3571a221-73fe-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 04:20:10 +0200 (CEST)
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
X-Inumbo-ID: 3571a221-73fe-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754619609; x=1754878809;
	bh=MfcqJMCGLvKKLORmQsBuD+qKANuEjczqzM62iWDooNI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q9peYj4Uj9X9daoxPvLFV/DjSYouKvbC0xB412ZwnX6tt8qhIqsLZ+Tb5+72YxH67
	 /d/kzVZ+LB2Gspj6DZXrkD9c8goiKU/G3XGJb0bjHTwMwTrzm/fLdHN9pNmwHM6cia
	 icJ8pIDPz4w+XdKef952fxASiZZV7V3V2kNNubsAwdONq+PL3ABz0N3QO8Wy0B2RWQ
	 uzjYrIYuW1SOK4d47JyXZsac1Qw5ZMghTh6J6egRKc4NVulIua3EWb5qdPJlQlFsUl
	 RRegUSXr9sQho2xvxIKOzyYyyzKP6LwmyP8JZaFD6L7T7b7CFbI/UT/vgh/93Glu/c
	 ROC68ocuwTHdg==
Date: Fri, 08 Aug 2025 02:20:06 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v14 3/4] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <20250808021938.669855-4-dmukhin@ford.com>
In-Reply-To: <20250808021938.669855-1-dmukhin@ford.com>
References: <20250808021938.669855-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ebb21ab60ce31068396a36c70917b3b4aae55742
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
---
Changes since v13:
- reworked bitops integration
- hooked xen/lib/find-next-bit.c
- cleaned up harness.h code
- made test to use more IDs
---
 tools/include/xen-tools/bitops.h       | 10 +++
 tools/tests/Makefile                   |  2 +-
 tools/tests/domid/.gitignore           |  2 +
 tools/tests/domid/Makefile             | 56 +++++++++++++++++
 tools/tests/domid/harness.h            | 54 ++++++++++++++++
 tools/tests/domid/include/xen/domain.h |  1 +
 tools/tests/domid/test-domid.c         | 86 ++++++++++++++++++++++++++
 xen/lib/find-next-bit.c                |  5 ++
 8 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/harness.h
 create mode 120000 tools/tests/domid/include/xen/domain.h
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
index 36928676a666..ff1666425436 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT =3D $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
=20
-SUBDIRS-y :=3D
+SUBDIRS-y :=3D domid
 SUBDIRS-y +=3D resource
 SUBDIRS-$(CONFIG_X86) +=3D cpu-policy
 SUBDIRS-$(CONFIG_X86) +=3D tsx
diff --git a/tools/tests/domid/.gitignore b/tools/tests/domid/.gitignore
new file mode 100644
index 000000000000..70e306b3c074
--- /dev/null
+++ b/tools/tests/domid/.gitignore
@@ -0,0 +1,2 @@
+*.o
+test-domid
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
new file mode 100644
index 000000000000..d96ceca6d954
--- /dev/null
+++ b/tools/tests/domid/Makefile
@@ -0,0 +1,56 @@
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
+vpath domid.c $(XEN_ROOT)/xen/common/
+vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
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
+CFLAGS +=3D -I./include/
+
+LDFLAGS +=3D $(APPEND_LDFLAGS)
+
+test-domid: domid.o find-next-bit.o test-domid.o
+=09$(CC) $^ -o $@ $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
new file mode 100644
index 000000000000..b043519dcb35
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
+#define spin_lock(l)                    (*(l) =3D true)
+#define spin_unlock(l)                  (*(l) =3D false)
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
diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid/inc=
lude/xen/domain.h
new file mode 120000
index 000000000000..2eda9aed088e
--- /dev/null
+++ b/tools/tests/domid/include/xen/domain.h
@@ -0,0 +1 @@
+../../harness.h
\ No newline at end of file
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.=
c
new file mode 100644
index 000000000000..7b6fb5ee2a7b
--- /dev/null
+++ b/tools/tests/domid/test-domid.c
@@ -0,0 +1,86 @@
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
+    /* Test ID#0 cannot be allocated twice. */
+    allocated =3D domid_alloc(0);
+    verify(allocated =3D=3D 0,
+           "TEST 1: expected %u allocated %u\n", 0, allocated);
+    allocated =3D domid_alloc(0);
+    verify(allocated =3D=3D DOMID_INVALID,
+           "TEST 1: expected %u allocated %u\n", DOMID_INVALID, allocated)=
;
+
+    /* Ensure ID is not allocated. */
+    domid_free(0);
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
+               "TEST 2: expected %u allocated %u\n", expected, allocated);
+    }
+    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated =3D domid_alloc(DOMID_INVALID);
+        verify(allocated =3D=3D DOMID_INVALID,
+               "TEST 3: expected %u allocated %u\n", DOMID_INVALID, alloca=
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
+               "TEST 4: expected %u allocated %u\n", expected, allocated);
+    }
+
+    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
+    expected =3D DOMID_FIRST_RESERVED - 1;
+    domid_free(DOMID_FIRST_RESERVED - 1);
+    allocated =3D domid_alloc(DOMID_INVALID);
+    verify(allocated =3D=3D expected,
+           "TEST 5: expected %u allocated %u\n", expected, allocated);
+
+    /* Allocate an invalid ID. */
+    expected =3D DOMID_INVALID;
+    allocated =3D domid_alloc(DOMID_FIRST_RESERVED);
+    verify(allocated =3D=3D expected,
+           "TEST 6: expected %u allocated %u\n", expected, allocated);
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



