Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF770B1B17B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070227.1433908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMB-00031G-Ec; Tue, 05 Aug 2025 09:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070227.1433908; Tue, 05 Aug 2025 09:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMB-0002zG-Ax; Tue, 05 Aug 2025 09:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1070227;
 Tue, 05 Aug 2025 09:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEM9-0001yh-Bl
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 028c75f3-71e2-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:53:16 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso17623665e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:16 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3ac115sm18611197f8f.12.2025.08.05.02.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:15 -0700 (PDT)
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
X-Inumbo-ID: 028c75f3-71e2-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387596; x=1754992396; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhNVb0ZBMkEpsnDvzYh3YmEGHHdUK0KvBkXDeBZiN3g=;
        b=akO85gkBD+r0K5/Y7o4s68DoH8pGUy5Tze4ruo/N6qqTfZhD+f7BjUpNpQhZ56Y05V
         ZJxUwTp7Bq4NsYjiQN12GmXFL99TajTUEcNzzOKJ3pgxU9huIers7PzzMAkVO3WGBrOW
         W/r4vADg35aUrjZYBBiAtqhiIc2wgecAckStY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387596; x=1754992396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhNVb0ZBMkEpsnDvzYh3YmEGHHdUK0KvBkXDeBZiN3g=;
        b=EGfW684fxW0M5OpvKlH3l+yzZK51BCkD+b9iUl55qvu10e1Yfhf3Ndv/VOlXXyQAj1
         nLoaqhrJh49qe4GV9khvG6JzDKo+FC+seHz7gshZ9vNjg1ET0zQvUB8y59cASjSWJLM8
         x/QCVVNA21f7yos3ntPr88LxYIHsY6eT7KKHCPQtfNjjanMvJbzA+n8lUEJvtHgW3W2t
         3k3Xh7vWjq/myEqIoecw8XhUFev9IijmfNGeZWmmK/UFyOnO0UlWwqUmR0y8XNtwWL7o
         d9OWCiD6O7Kkgy6OlvypXnsTN7jLPDWE2K8iDyoYoKmbX0oUaaZT8W6Y0r+tRv7JNHsO
         OKFQ==
X-Gm-Message-State: AOJu0YxJ+r+/+AQhRTN7b3ngXZ175xiSSSIUh90y+PRq4+CW2bq7d4Kg
	YqpNQSc/ZdO1gR+2ij/Hgp0xAMeAxEbisY5p8G35QLqavXjAJz4mQ3ai5fhv7MiCikmR05ugfdy
	Ou91M
X-Gm-Gg: ASbGncsd7g8Sj61aEk9+o5PiqRI7aoiW2znZGTjpS1GA6qaTQGT7/xSYMVxrHsM8WrR
	oh3lamArNWax1+8TTlxPdLkvBSG41x0v8qQX0Iff6+Qo9e1BZOW8fl+W+i7ymI5S0eEiR3pu5wW
	Net4dMJZkxVrd0m/7S7Ct5NRE+HYnDmQZqTZBPzSJBumcvk7OvJzUaZ1qu7/npfgFHzlVsMb+WM
	d0vXcHSzcoSv/l09RbtYp2gv6n8UHmMGlEknFibJwzOMCXdZig8+eVKDnlH7iORTjPBHc/gJbQ7
	8ygFeZ4V02RsYLx2DXyH1w/sATmpx7S8E84rHVYPOuMT64WKSRHIedIiS2NNAJvjximoKdsMCKb
	oGHV0RNHtikr7uLR2ljX8h5UG80YM5NnIzb1poKylVHNZOFjbgU+d6ko/Txu1GMDjXA==
X-Google-Smtp-Source: AGHT+IF8Hlz1NANF27jwxjR7WhHDaJIu9qeg8DsnUouM8UGa3gJLwXNf3/SypT85GbgbUedpf/x+lw==
X-Received: by 2002:a05:600c:4752:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-458b69e3710mr115207405e9.14.1754387595822;
        Tue, 05 Aug 2025 02:53:15 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 5/8] test/pdx: add PDX compression unit tests
Date: Tue,  5 Aug 2025 11:52:54 +0200
Message-ID: <20250805095257.74975-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a set of unit tests for PDX compression.  The unit tests contains
both real and crafted memory maps that are then compressed using the
selected PDX algorithm.  Note the build system for the unit tests has been
done in a way to support adding new compression algorithms easily.  That
requires generating a new test-pdx-<compress> executable that's build with
the selected PDX compression enabled.

Currently the only generated executable is test-pdx-mask that tests PDX
mask compression.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use set -e when running the tests.
 - Drop stray removal of pdx.c.
 - Use * instead of ? for header blank space capture.
 - Add some more memory maps.

Changes since v1:
 - New in this version (partially pulled out from a different patch).
---
 tools/tests/Makefile       |   1 +
 tools/tests/pdx/.gitignore |   2 +
 tools/tests/pdx/Makefile   |  49 +++++++
 tools/tests/pdx/harness.h  |  84 ++++++++++++
 tools/tests/pdx/test-pdx.c | 267 +++++++++++++++++++++++++++++++++++++
 xen/common/pdx.c           |   4 +
 6 files changed, 407 insertions(+)
 create mode 100644 tools/tests/pdx/.gitignore
 create mode 100644 tools/tests/pdx/Makefile
 create mode 100644 tools/tests/pdx/harness.h
 create mode 100644 tools/tests/pdx/test-pdx.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 36928676a666..97ba2a13894d 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -9,6 +9,7 @@ ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
 SUBDIRS-y += xenstore
+SUBDIRS-y += pdx
 SUBDIRS-y += rangeset
 SUBDIRS-y += vpci
 SUBDIRS-y += paging-mempool
diff --git a/tools/tests/pdx/.gitignore b/tools/tests/pdx/.gitignore
new file mode 100644
index 000000000000..a32c7db4de79
--- /dev/null
+++ b/tools/tests/pdx/.gitignore
@@ -0,0 +1,2 @@
+/pdx.h
+/test-pdx-mask
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
new file mode 100644
index 000000000000..b3734afde686
--- /dev/null
+++ b/tools/tests/pdx/Makefile
@@ -0,0 +1,49 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGETS := test-pdx-mask
+
+.PHONY: all
+all: $(TARGETS)
+
+.PHONY: run
+run: $(TARGETS)
+ifeq ($(CC),$(HOSTCC))
+	set -e;             \
+	for test in $? ; do \
+		./$$test ;  \
+	done
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.h
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
+pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
+	sed -E -e '/^#[[:space:]]*include/d' <$< >$@
+
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += $(CFLAGS_xeninclude)
+
+test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
+
+test-pdx-%: test-pdx.c pdx.h
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
new file mode 100644
index 000000000000..5bef7df650d2
--- /dev/null
+++ b/tools/tests/pdx/harness.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for PDX compression.
+ *
+ * Copyright (C) 2025 Cloud Software Group
+ */
+
+#ifndef _TEST_HARNESS_
+#define _TEST_HARNESS_
+
+#include <assert.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xen-tools/common-macros.h>
+
+#define __init
+#define __initdata
+#define __ro_after_init
+#define cf_check
+
+#define printk printf
+#define XENLOG_INFO
+#define XENLOG_DEBUG
+#define XENLOG_WARNING
+#define KERN_INFO
+
+#define BITS_PER_LONG (unsigned int)(sizeof(unsigned long) * 8)
+
+#define PAGE_SHIFT    12
+/* Some libcs define PAGE_SIZE in limits.h. */
+#undef  PAGE_SIZE
+#define PAGE_SIZE     (1 << PAGE_SHIFT)
+#define MAX_ORDER     18 /* 2 * PAGETABLE_ORDER (9) */
+
+#define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
+#define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
+
+#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+
+#define MAX_RANGES 16
+#define MAX_PFN_RANGES MAX_RANGES
+
+#define ASSERT assert
+
+#define CONFIG_DEBUG
+
+static inline unsigned int find_next(
+    const unsigned long *addr, unsigned int size, unsigned int off, bool value)
+{
+    unsigned int i;
+
+    ASSERT(size <= BITS_PER_LONG);
+
+    for ( i = off; i < size; i++ )
+        if ( !!(*addr & (1UL << i)) == value )
+            return i;
+
+    return size;
+}
+
+#define find_next_zero_bit(a, s, o) find_next(a, s, o, false)
+#define find_next_bit(a, s, o)      find_next(a, s, o, true)
+
+#define boolean_param(name, func)
+
+typedef uint64_t paddr_t;
+
+#include "pdx.h"
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
new file mode 100644
index 000000000000..0798ccee359b
--- /dev/null
+++ b/tools/tests/pdx/test-pdx.c
@@ -0,0 +1,267 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for PDX compression.
+ *
+ * Copyright (C) 2025 Cloud Software Group
+ */
+
+#include "harness.h"
+
+#include "../../xen/common/pdx.c"
+
+struct range {
+    /* Ranges are defined as [start, end). */
+    unsigned long start, end;
+};
+
+static void print_ranges(const struct range *r)
+{
+    unsigned int i;
+
+    printf("Ranges:\n");
+
+    for ( i = 0; i < MAX_RANGES; i++ )
+    {
+        if ( !r[i].start && !r[i].end )
+            break;
+
+        printf(" %013lx-%013lx\n", r[i].start, r[i].end);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    static const struct {
+        struct range ranges[MAX_RANGES];
+        bool compress;
+    } tests[] = {
+#ifdef __LP64__
+        /*
+         * Only for targets where unsigned long is 64bits, otherwise compiler
+         * will complain about truncation from 'long long' -> 'long' conversion.
+         *
+         * Real memory map from a 4s Intel GNR.  Not compressible using PDX
+         * mask compression.
+         */
+        {
+            .ranges = {
+                { .start =           0,   .end =     0x80000UL },
+                { .start =   0x0100000UL, .end =   0x8080000UL },
+                { .start =  0x63e80000UL, .end =  0x6be80000UL },
+                { .start =  0xc7e80000UL, .end =  0xcfe80000UL },
+                { .start = 0x12be80000UL, .end = 0x133e80000UL },
+            },
+            .compress = false,
+        },
+        /* Simple hole. */
+        {
+            .ranges = {
+                { .start =                                                 0,
+                  .end   =                            (1UL << MAX_ORDER) * 1 },
+                { .start = (1UL << (MAX_ORDER * 2)) |                      0,
+                  .end   = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 1 },
+            },
+            .compress = true,
+        },
+        /* Simple hole, unsorted ranges. */
+        {
+            .ranges = {
+                { .start = (1UL << (MAX_ORDER * 2)) |                      0,
+                  .end   = (1UL << (MAX_ORDER * 2)) | (1UL << MAX_ORDER) * 1 },
+                { .start =                                                 0,
+                  .end   =                            (1UL << MAX_ORDER) * 1 },
+            },
+            .compress = true,
+        },
+        /* PDX compression, 2 ranges covered by the lower mask. */
+        {
+            .ranges = {
+                { .start =                    0,
+                  .end   = (1 << MAX_ORDER) * 1 },
+                { .start = (1 << MAX_ORDER) * 2,
+                  .end   = (1 << MAX_ORDER) * 3 },
+                { .start = (1 << MAX_ORDER) * 20,
+                  .end   = (1 << MAX_ORDER) * 22 },
+            },
+            .compress = true,
+        },
+        /* Single range not starting at 0. */
+        {
+            .ranges = {
+                { .start = (1 << MAX_ORDER) * 10,
+                  .end   = (1 << MAX_ORDER) * 11 },
+            },
+            .compress = true,
+        },
+        /* Resulting PDX region size leads to no compression. */
+        {
+            .ranges = {
+                { .start =                    0,
+                  .end   = (1 << MAX_ORDER) * 1 },
+                { .start = (1 << MAX_ORDER) * 2,
+                  .end   = (1 << MAX_ORDER) * 3 },
+                { .start = (1 << MAX_ORDER) * 4,
+                  .end   = (1 << MAX_ORDER) * 7 },
+                { .start = (1 << MAX_ORDER) * 8,
+                  .end   = (1 << MAX_ORDER) * 12 },
+            },
+            .compress = false,
+        },
+        /* AMD Versal Gen 2 ARM board. */
+        {
+            .ranges = {
+                { .start =          0,   .end =    0x80000UL },
+                { .start =   0x800000UL, .end =   0x880000UL },
+                { .start = 0x50000000UL, .end = 0x50080000UL },
+                { .start = 0x60000000UL, .end = 0x60080000UL },
+                { .start = 0x70000000UL, .end = 0x70080000UL },
+            },
+            .compress = true,
+        },
+        /* Unsorted ranges, lower one not starting at 0. */
+        {
+        .ranges = {
+                { .start = (1UL << (35 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 2,
+                  .end =   (1UL << (35 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 3 },
+                { .start = (1 << MAX_ORDER) * 2,
+                  .end =   (1 << MAX_ORDER) * 3 },
+            },
+            .compress = true,
+        },
+        /* Two ranges with the same high bit set. */
+        {
+        .ranges = {
+                { .start = (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 0,
+                  .end =   (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 1 },
+                { .start = (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 3,
+                  .end =   (1UL << (51 - PAGE_SHIFT)) + (1 << MAX_ORDER) * 4 },
+            },
+            .compress = true,
+        },
+#endif
+        /* AMD Naples Epyc 7281 2 sockets, 8 NUMA nodes. */
+        {
+            .ranges = {
+                { .start =         0,   .end =      0xa0UL },
+                { .start =     0x100UL, .end =   0xb0000UL },
+                { .start =  0x100000UL, .end =  0x430000UL },
+                { .start =  0x430000UL, .end =  0x830000UL },
+                { .start =  0x830000UL, .end =  0xc30000UL },
+                { .start =  0xc30000UL, .end = 0x1030000UL },
+                { .start = 0x1030000UL, .end = 0x1430000UL },
+                { .start = 0x1430000UL, .end = 0x1830000UL },
+                { .start = 0x1830000UL, .end = 0x1c30000UL },
+                { .start = 0x1c30000UL, .end = 0x2030000UL },
+            },
+            .compress = false,
+        },
+        /* 2-node 2GB per-node QEMU layout. */
+        {
+            .ranges = {
+                { .start =        0,   .end =  0x80000UL },
+                { .start = 0x100000UL, .end = 0x180000UL },
+            },
+            .compress = true,
+        },
+        /* Not compressible, smaller than MAX_ORDER. */
+        {
+            .ranges = {
+                { .start =     0,   .end =     1   },
+                { .start = 0x100UL, .end = 0x101UL },
+            },
+            .compress = false,
+        },
+        /* Compressible, requires adjusting size to (1 << MAX_ORDER). */
+        {
+            .ranges = {
+                { .start =        0,   .end =        1   },
+                { .start = 0x100000UL, .end = 0x100001UL },
+            },
+            .compress = true,
+        },
+        /* 2s Intel CLX with contiguous ranges, no compression. */
+        {
+            .ranges = {
+                { .start =        0  , .end =  0x180000UL },
+                { .start = 0x180000UL, .end = 0x3040000UL },
+            },
+            .compress = false,
+        },
+    };
+    int ret_code = EXIT_SUCCESS;
+
+    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
+    {
+        unsigned int j;
+
+        pfn_pdx_compression_reset();
+
+        for ( j = 0; j < ARRAY_SIZE(tests[i].ranges); j++ )
+        {
+            unsigned long size = tests[i].ranges[j].end -
+                                 tests[i].ranges[j].start;
+
+            if ( !tests[i].ranges[j].start && !tests[i].ranges[j].end )
+                break;
+
+            pfn_pdx_add_region(tests[i].ranges[j].start << PAGE_SHIFT,
+                               size << PAGE_SHIFT);
+        }
+
+        if ( pfn_pdx_compression_setup(0) != tests[i].compress )
+        {
+            printf("PFN compression diverge, expected %scompressible\n",
+                   tests[i].compress ? "" : "un");
+            print_ranges(tests[i].ranges);
+
+            ret_code = EXIT_FAILURE;
+            continue;
+        }
+
+        if ( !tests[i].compress )
+            continue;
+
+        for ( j = 0; j < ARRAY_SIZE(tests[i].ranges); j++ )
+        {
+            unsigned long start = tests[i].ranges[j].start;
+            unsigned long end = tests[i].ranges[j].end;
+
+            if ( !start && !end )
+                break;
+
+            if ( !pdx_is_region_compressible(start << PAGE_SHIFT, 1) ||
+                 !pdx_is_region_compressible((end - 1) << PAGE_SHIFT, 1) )
+            {
+                printf(
+    "PFN compression invalid, pages %#lx and %#lx should be compressible\n",
+                       start, end - 1);
+                print_ranges(tests[i].ranges);
+                ret_code = EXIT_FAILURE;
+            }
+
+            if ( start != pdx_to_pfn(pfn_to_pdx(start)) ||
+                 end - 1 != pdx_to_pfn(pfn_to_pdx(end - 1)) )
+            {
+                printf("Compression is not bi-directional:\n");
+                printf(" PFN %#lx -> PDX %#lx -> PFN %#lx\n",
+                       start, pfn_to_pdx(start), pdx_to_pfn(pfn_to_pdx(start)));
+                printf(" PFN %#lx -> PDX %#lx -> PFN %#lx\n",
+                       end - 1, pfn_to_pdx(end - 1),
+                       pdx_to_pfn(pfn_to_pdx(end - 1)));
+                print_ranges(tests[i].ranges);
+                ret_code = EXIT_FAILURE;
+            }
+        }
+    }
+
+    return ret_code;
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
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index c9ec86729151..cd8a9e75a836 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -15,6 +15,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+/* Trim content when built for the test harness. */
+#ifdef __XEN__
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/bitops.h>
@@ -57,6 +59,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+#endif /* __XEN__ */
+
 #ifndef CONFIG_PDX_NONE
 
 #ifdef CONFIG_X86
-- 
2.49.0


