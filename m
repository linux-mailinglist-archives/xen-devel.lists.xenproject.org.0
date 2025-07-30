Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A565B165A9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 19:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064317.1430021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhAnc-0007UD-OF; Wed, 30 Jul 2025 17:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064317.1430021; Wed, 30 Jul 2025 17:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhAnc-0007RR-Kn; Wed, 30 Jul 2025 17:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1064317;
 Wed, 30 Jul 2025 17:41:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhAna-00076c-BD
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 17:41:06 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0da714-6d6c-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 19:41:05 +0200 (CEST)
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
X-Inumbo-ID: 5e0da714-6d6c-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753897263; x=1754156463;
	bh=lpJc4gic0ghzKZPEoCaNvipF3P9S33+QEIexX7Dzotc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AM6E+dF7Qn9Dz73Jrk4hQlPhH0tkqsHoeRoAYTghcRdgK3WUZBSHCB3KYolM51YTz
	 D7nDP4yxl2wW8L9x7+i2Nz5X5IQM2z+xdf4kIUNn9zWw0AZcNP2r8OMMHkRGdYjg83
	 jc2WuAUPCOKrwGRwZf+/VzsgPoMk+aeW0UqSNJ0CZh1An5VMXKiMKLbLcBVi9lauGL
	 5EyRMiVJ5LEIo49Cer6Ycfy+yn0r6w+KUXwHHq+9TyUmJaGoDP3wdvY0klQxSzVB7m
	 1PqrMMmERD/s90R8e+XWkTrfU5aLgfdteUsnC1LT+x16B9xRg4oiWgyiqqZSX8sFAy
	 SIEOsPwlxXZIg==
Date: Wed, 30 Jul 2025 17:41:00 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v13 2/3] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <20250730174042.1632011-3-dmukhin@ford.com>
In-Reply-To: <20250730174042.1632011-1-dmukhin@ford.com>
References: <20250730174042.1632011-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c98280da7433993f217e93f9b5ccb327aee63ba8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Introduce some basic infrastructure for doing domain ID allocation unit tes=
ts,
and add a few tests that ensure correctness of the domain ID allocator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v12:
- fixed Makefile
- dropped unused symbols/includes from the test harness header
- s/printk/printf/g in the test code
---
 tools/tests/Makefile                   |   2 +-
 tools/tests/domid/.gitignore           |   2 +
 tools/tests/domid/Makefile             |  48 ++++++++++
 tools/tests/domid/include/xen/domain.h | 126 +++++++++++++++++++++++++
 tools/tests/domid/test-domid.c         |  78 +++++++++++++++
 5 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 tools/tests/domid/.gitignore
 create mode 100644 tools/tests/domid/Makefile
 create mode 100644 tools/tests/domid/include/xen/domain.h
 create mode 100644 tools/tests/domid/test-domid.c

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
index 000000000000..08fbad096aec
--- /dev/null
+++ b/tools/tests/domid/Makefile
@@ -0,0 +1,48 @@
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
+CFLAGS +=3D $(APPEND_CFLAGS)
+CFLAGS +=3D $(CFLAGS_xeninclude)
+CFLAGS +=3D -I./include/
+
+LDFLAGS +=3D $(APPEND_LDFLAGS)
+
+test-domid: domid.o test-domid.o
+=09$(CC) $^ -o $@ $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/domid/include/xen/domain.h b/tools/tests/domid/inc=
lude/xen/domain.h
new file mode 100644
index 000000000000..e5db0235445e
--- /dev/null
+++ b/tools/tests/domid/include/xen/domain.h
@@ -0,0 +1,126 @@
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
+
+#define BUG_ON(x)               assert(!(x))
+#define ASSERT(x)               assert(x)
+
+#define DOMID_FIRST_RESERVED    (10)
+#define DOMID_INVALID           (11)
+
+#define DEFINE_SPINLOCK(x)      unsigned long *(x)
+#define spin_lock(x)            ((*(x))++)
+#define spin_unlock(x)          ((*(x))--)
+
+#define printk printf
+
+#define BITS_PER_LONG           sizeof(unsigned long)
+#define BITS_PER_WORD           (8U * BITS_PER_LONG)
+#define BITS_TO_LONGS(bits) \
+    (((bits) + BITS_PER_LONG - 1) / BITS_PER_LONG)
+#define DECLARE_BITMAP(name, bits) \
+    unsigned long name[BITS_TO_LONGS(bits)]
+
+static inline int __test_and_set_bit(unsigned int nr, unsigned long *addr)
+{
+    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
+    unsigned long *p =3D addr + (nr / BITS_PER_WORD);
+    int old =3D (*p & mask) !=3D 0;
+
+    *p |=3D mask;
+
+    return old;
+}
+
+static inline int __test_and_clear_bit(unsigned int nr, unsigned long *add=
r)
+{
+    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
+    unsigned long *p =3D addr + (nr / BITS_PER_WORD);
+    int old =3D (*p & mask) !=3D 0;
+
+    *p &=3D ~mask;
+
+    return old;
+}
+
+static inline void __set_bit(unsigned int nr, volatile unsigned long *addr=
)
+{
+    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
+    unsigned long *p =3D (unsigned long *)addr + (nr / BITS_PER_WORD);
+
+    *p |=3D mask;
+}
+
+static inline void __clear_bit(unsigned int nr, volatile unsigned long *ad=
dr)
+{
+    unsigned long mask =3D 1UL << (nr % BITS_PER_WORD);
+    unsigned long *p =3D (unsigned long *)addr + (nr / BITS_PER_WORD);
+
+    *p &=3D ~mask;
+}
+
+static inline unsigned long find_next_zero_bit(const unsigned long *addr,
+                                               unsigned long size,
+                                               unsigned long offset)
+{
+    unsigned long idx =3D offset / BITS_PER_WORD;
+    unsigned long bit =3D offset % BITS_PER_WORD;
+
+    if (offset >=3D size)
+        return size;
+
+    while (offset < size)
+    {
+        unsigned long val =3D addr[idx] | (~0UL >> (BITS_PER_WORD - bit));
+
+        if (~val)
+        {
+            unsigned long pos =3D __builtin_ffsl(~val);
+
+            if (pos > 0)
+            {
+                unsigned long rc =3D idx * BITS_PER_WORD + (pos - 1);
+
+                if (rc < size)
+                    return rc;
+            }
+        }
+
+        offset =3D (idx + 1) * BITS_PER_WORD;
+        idx++;
+        bit =3D 0;
+    }
+
+    return size;
+}
+
+typedef bool spinlock_t;
+typedef uint16_t domid_t;
+
+/* See include/xen/domain.h */
+extern domid_t domid_alloc(domid_t domid);
+extern void domid_free(domid_t domid);
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
index 000000000000..d52eaf5f1f55
--- /dev/null
+++ b/tools/tests/domid/test-domid.c
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for domain ID allocator.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+/* Local test include replicating hypervisor includes. */
+#include <xen/domain.h>
+
+int main(int argc, char **argv)
+{
+    domid_t expected, allocated;
+
+    printf("DOMID_FIRST_RESERVED=3D%u DOMID_INVALID=3D%u\n",
+            DOMID_FIRST_RESERVED, DOMID_INVALID);
+
+    /* Test ID#0 cannot be allocated twice. */
+    allocated =3D domid_alloc(0);
+    printf("TEST 1: expected %u allocated %u\n", 0, allocated);
+    ASSERT(allocated =3D=3D 0);
+    allocated =3D domid_alloc(0);
+    printf("TEST 1: expected %u allocated %u\n", DOMID_INVALID, allocated)=
;
+    ASSERT(allocated =3D=3D DOMID_INVALID);
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
+        printf("TEST 2: expected %u allocated %u\n", expected, allocated);
+        ASSERT(allocated =3D=3D expected);
+    }
+    for ( expected =3D 1; expected < DOMID_FIRST_RESERVED; expected++ )
+    {
+        allocated =3D domid_alloc(DOMID_INVALID);
+        printf("TEST 3: expected %u allocated %u\n", DOMID_INVALID, alloca=
ted);
+        ASSERT(allocated =3D=3D DOMID_INVALID);
+    }
+
+    /* Re-allocate first ID from [1..DOMID_FIRST_RESERVED - 1]. */
+    expected =3D 1;
+    domid_free(1);
+    allocated =3D domid_alloc(DOMID_INVALID);
+    printf("TEST 4: expected %u allocated %u\n", expected, allocated);
+    ASSERT(allocated =3D=3D expected);
+
+    /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
+    expected =3D DOMID_FIRST_RESERVED - 1;
+    domid_free(DOMID_FIRST_RESERVED - 1);
+    allocated =3D domid_alloc(DOMID_INVALID);
+    printf("TEST 5: expected %u allocated %u\n", expected, allocated);
+    ASSERT(allocated =3D=3D expected);
+
+    /* Allocate an invalid ID. */
+    expected =3D DOMID_INVALID;
+    allocated =3D domid_alloc(DOMID_FIRST_RESERVED);
+    printf("TEST 6: expected %u allocated %u\n", expected, allocated);
+    ASSERT(allocated =3D=3D expected);
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
--=20
2.34.1



