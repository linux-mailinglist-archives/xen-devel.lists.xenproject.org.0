Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC90AD5D21
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011971.1390529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAC-0003tL-JL; Wed, 11 Jun 2025 17:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011971.1390529; Wed, 11 Jun 2025 17:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAC-0003q1-C9; Wed, 11 Jun 2025 17:23:00 +0000
Received: by outflank-mailman (input) for mailman id 1011971;
 Wed, 11 Jun 2025 17:22:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPAA-0002dK-NW
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b805d6f6-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:58 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so66455e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45325228c2esm27826355e9.37.2025.06.11.10.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:56 -0700 (PDT)
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
X-Inumbo-ID: b805d6f6-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662577; x=1750267377; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obTz8sNg81B0kZWShjd1UWWyGzjIKb4UunTkiMwCARY=;
        b=oXiDAi/31IbPs52B+ZJe6Pa/db+D4Mrq14kh3g9pI2mnY0f6mq6CoXm1yUpi+f6Jwa
         ZrnH44VRLBx1dNP/S63fIVa03EkGl+JEf1lnE9eF/jx5kDiGVPArkIkFxbkLAs7iKprJ
         6c7h/l1r++1i5UdB7wwq/PULluBo6/R1qOkUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662577; x=1750267377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obTz8sNg81B0kZWShjd1UWWyGzjIKb4UunTkiMwCARY=;
        b=MccZpVk+UrhxYAkoM3jZmcluvb162SF8CCACN2zchDNoUDnCwcITI835u4QjZQVEg5
         WQmo97gRd/JXCYwEbVF13G+7UVQmmtq0bSai1gP2IJRpNMocWYvpbHzxMKnCZhB8rlYM
         peJMZrAYR2KYHB4nscn85iH8VLmHxgvJW7MKdlFHpHOWIA7fufTcvqjlTxEup0BTvGy1
         4pYT3RKaPfRh/x1XRAO+8PAlogYja73n8wuYnmBblHYeXG6AEVHEu4ehIOUzC2ESOjFY
         O6fbzfsvxU+mpc9J8FSh7wcQsCUZEbFaVlhDQeJSplN8EX1eWzH+GuMsdl2uB/vgEjYE
         RniA==
X-Gm-Message-State: AOJu0Yxbe5DSkrOxx4E0EJ2YUpS/h99sG6pXNzPfejDknfBeXpvHrw8l
	kCtCZnkBTxCXpEKKW8JSGSOETWk4tve04eKHBmrWmQq6fDC/FFbktoqIuSE1U7DHf2OtJHy9tUL
	lHmff
X-Gm-Gg: ASbGncuI5bi+v7nx4JphK9qOD1/G4/5JVlNxgf3R/4Zct7+Xs7nyGczjphQcMg+FyJB
	89pYocAxJjNb8TICguclCKG79Jh1JOcs/TaQS0w7EqE1Z2XEVz/34a28/YNEZpJIIgA6kBoPdJ/
	zaGfgJwKIId+USBM8lHsQYugxb30CVXOqap+tm1vdq0fAzBeZn/pcLvlqsOCKTE28zGSVtUF3Lo
	qQ4WK8gUKWweRFYo5kxfd9RWtGVgCXx6YlfnRPVo7ODgd2RKKUEBrFGZRcAFw4KYuyW7w/fUo5r
	GdZr7Ue2WKwflrGI7hj2Lq2nko1Uj2w2/YtP3TJsNnskfVGewILY3w9nKFUhzUp8GTSf1/mEc2h
	UUDfK6LclV4lUoycx4IqHjY6CsCIjN7yD6vA8isDDz77OBw==
X-Google-Smtp-Source: AGHT+IEKUs16PXyfT6xB9xcCuFwTvKq0tDdieJnf5nDjt0WbGz7eLEcC6NTeRzeRL8WjKfPSmY7HqQ==
X-Received: by 2002:a05:600c:8418:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-4532b91ee36mr6380175e9.23.1749662577174;
        Wed, 11 Jun 2025 10:22:57 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/8] pdx: introduce a new compression algorithm based on offsets between regions
Date: Wed, 11 Jun 2025 19:16:34 +0200
Message-ID: <20250611171636.5674-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the appearance of Intel Sierra Forest and Granite Rapids it's not
possible to get a production x86 host wit the following memory map:

SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]

This is from a four socket system, with each node having 256GB of memory.
The total amount of RAM on the system is 1TB, but without enabling
CONFIG_BIGMEM the last range is not accessible, as it's above the 16TB
boundary covered by the frame table.

Note that while the memory map is very sparse, it won't be compressible
using the current algorithm that relies on all ranges having a shared
zeroed region of bits that can be removed.

The memory map presented above has the property of all regions being
similarly spaced between each other, and all having also a similar size.
This allows to compress them using the following formula:

 pdx = (pfn % offset) + ((pfn / offset) * size)

Where offset and size are two static coefficients calculated at
initialization.

Obtaining the optimum offset and size coefficients is the complicated part.
In this patch I introduce two different algorithms, a fast one that works
correctly when the offset and size between ranges is mostly equal.  If such
fast algorithm doesn't work, or the resulting compression is not enough to
avoid truncation of the maximum usable page, it's possible to attempt a
brute force approach for calculating the coefficients.  This is also
implemented in this patch as the slow variant.  I've attempted to restrict
the number of iterations in the slow approach so it can exit early if no
better coefficients can be found due to the input constrains (minimum
region size).

The patch here focuses on introducing the logic to calculate the
compression coefficients, plus adding a unit test to exercise the logic
easily from user-space in order to test different layouts and possibly
improve the generation of the coefficients.  The added unit tests only
covers the newly added compression, but could also be extended to cover the
existing PDX mask compression.

Note the translation functions (pfn to pdx, maddr to direct map offset),
are not implemented as part of this patch, an identity set of macros are
added to satisfy the build requirements.  The patch is already long enough
without those.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
We can discuss whether we want both the fast and the slow variants.  The
slow (brute force) was added as a result of me playing with weird region
layouts where the fast one didn't manage to compress, or the resulting
coefficients had a poor compression ratio.  However at this point the
slow variant has only proven helpful in synthetic cases, I haven't (yet?)
seen a real host memory layout that would benefit from it.
---
 tools/tests/Makefile              |   1 +
 tools/tests/pdx/.gitignore        |   3 +
 tools/tests/pdx/Makefile          |  54 ++++++
 tools/tests/pdx/harness.h         |  73 +++++++
 tools/tests/pdx/test-pdx-offset.c | 310 ++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c              |   2 +-
 xen/arch/x86/srat.c               |   2 +-
 xen/common/Kconfig                |   9 +-
 xen/common/pdx.c                  | 232 +++++++++++++++++++++-
 xen/include/xen/pdx.h             |  46 ++++-
 10 files changed, 724 insertions(+), 8 deletions(-)
 create mode 100644 tools/tests/pdx/.gitignore
 create mode 100644 tools/tests/pdx/Makefile
 create mode 100644 tools/tests/pdx/harness.h
 create mode 100644 tools/tests/pdx/test-pdx-offset.c

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
index 000000000000..21b60480415a
--- /dev/null
+++ b/tools/tests/pdx/.gitignore
@@ -0,0 +1,3 @@
+/pdx-offset.c
+/pdx.h
+/test-pdx-offset
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
new file mode 100644
index 000000000000..141ae6aab56f
--- /dev/null
+++ b/tools/tests/pdx/Makefile
@@ -0,0 +1,54 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-pdx-offset
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: run
+run: $(TARGET)
+ifeq ($(CC),$(HOSTCC))
+	./$<
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGET) $(DEPS_RM) pdx.c pdx.h
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+
+pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
+	sed -E -e '/^#[[:space:]]?include/d' <$< >$@
+
+pdx-offset.c: $(XEN_ROOT)/xen/common/pdx.c
+	# Remove includes/errors and add the test harness header
+	sed -E -e '/#[[:space:]]?include/d' -e '/^#[[:space:]]?error/d' \
+	       -e '1s/^/#include "harness.h"/' <$< >$@
+
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(APPEND_CFLAGS)
+CFLAGS += $(CFLAGS_xeninclude)
+
+LDFLAGS += $(APPEND_LDFLAGS)
+
+test-pdx-offset.o pdx-offset.o: pdx.h
+test-pdx-offset.o pdx-offset.o: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
+
+test-pdx-offset: pdx-offset.o test-pdx-offset.o
+	$(CC) $^ -o $@ $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
new file mode 100644
index 000000000000..3d31cf488daf
--- /dev/null
+++ b/tools/tests/pdx/harness.h
@@ -0,0 +1,73 @@
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
+#include <strings.h>
+
+#include <xen-tools/common-macros.h>
+
+void pdx_reset(void);
+
+#define __init
+#define __initdata
+#define __ro_after_init
+#define cf_check
+
+#define printk printf
+#define dprintk(lvl, ...) printf(__VA_ARGS__)
+#define XENLOG_INFO
+#define XENLOG_DEBUG
+#define XENLOG_WARNING
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
+#define MAX_RANGES 8
+#define MAX_PFN_RANGES MAX_RANGES
+
+#define ASSERT assert
+#define ASSERT_UNREACHABLE() assert(0);
+
+#define STATIC
+typedef uint64_t paddr_t;
+
+bool pfn_offset_calculate_fast(unsigned long base);
+bool pfn_offset_calculate_slow(unsigned long base);
+void pfn_offset_sanitize_ranges(void);
+
+#define sort(elem, nr, size, cmp, swp) {                                \
+    /* Consume swp() so compiler doesn't complain it's unused. */       \
+    swp(&elem[0], &elem[0], size);                                      \
+    qsort(elem, nr, size, cmp);                                         \
+}
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
diff --git a/tools/tests/pdx/test-pdx-offset.c b/tools/tests/pdx/test-pdx-offset.c
new file mode 100644
index 000000000000..0a561f02d197
--- /dev/null
+++ b/tools/tests/pdx/test-pdx-offset.c
@@ -0,0 +1,310 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for PDX offset compression.
+ *
+ * Copyright (C) 2025 Cloud Software Group
+ */
+
+#include "harness.h"
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
+        struct result {
+            bool compress;
+            unsigned long offset, size;
+        } results[2];
+#define FAST_IDX 0
+#define SLOW_IDX 1
+    } tests[] = {
+#ifdef __LP64__
+        /*
+         * Only for targets where unsigned long is 64bits, otherwise compiler
+         * will complain about truncation from 'long long' -> 'long' conversion.
+         *
+         * Real memory map from a 4s Intel GNR.
+         */
+        {
+            .ranges = {
+                { .start =           0,   .end =   0x8080000UL },
+                { .start =  0x63e80000UL, .end =  0x6be80000UL },
+                { .start =  0xc7e80000UL, .end =  0xcfe80000UL },
+                { .start = 0x12be80000UL, .end = 0x133e80000UL },
+            },
+            .results = {
+                /* Same result with both fast and slow algorithms. */
+                [FAST_IDX ... SLOW_IDX] = {
+                    .compress = true,
+                    .offset = 0x63e80000UL,
+                    .size = 0x8300000UL,
+                },
+            },
+        },
+#endif
+        /* 2-node 2GB per-node QEMU layout. */
+        {
+            .ranges = {
+                { .start =        0,   .end =  0x80000UL },
+                { .start = 0x100000UL, .end = 0x180000UL },
+            },
+            .results = {
+                /* Same result with both fast and slow algorithms. */
+                [FAST_IDX ... SLOW_IDX] = {
+                    .compress = true,
+                    .offset = 0x100000UL,
+                    .size = 0x80000UL,
+                },
+            },
+        },
+        /* Not compressible, offset < size. */
+        {
+            .ranges = {
+                { .start = 0, .end =    1   },
+                { .start = 1, .end = 0x10UL },
+            },
+            .results = {
+                /* Same result with both fast and slow algorithms. */
+                [FAST_IDX ... SLOW_IDX] = {
+                    .compress = false,
+                },
+            },
+        },
+        /* Not compressible, offset < (1 << MAX_ORDER). */
+        {
+            .ranges = {
+                { .start =     0,   .end =     1   },
+                { .start = 0x100UL, .end = 0x101UL },
+            },
+            .results = {
+                /* Same result with both fast and slow algorithms. */
+                [FAST_IDX ... SLOW_IDX] = {
+                    .compress = false,
+                },
+            },
+        },
+        /* Compressible, requires adjusting size to (1 << MAX_ORDER). */
+        {
+            .ranges = {
+                { .start =        0,   .end =        1   },
+                { .start = 0x100000UL, .end = 0x100001UL },
+            },
+            .results = {
+                /* Same result with both fast and slow algorithms. */
+                [FAST_IDX ... SLOW_IDX] = {
+                    .compress = true,
+                    .offset = 0x100000UL,
+                    .size = (1UL << MAX_ORDER),
+                },
+            },
+        },
+        /* 2s Intel CLX with contiguous ranges, no compression. */
+        {
+            .ranges = {
+                { .start =        0  , .end =  0x180000UL },
+                { .start = 0x180000UL, .end = 0x3040000UL },
+            },
+            .results = {
+                /* Same result with both fast and slow algorithms. */
+                [FAST_IDX ... SLOW_IDX] = {
+                    .compress = false,
+                },
+            },
+        },
+        /* Middle range is bigger than first and last */
+        {
+            .ranges = {
+                { .start =         0,   .end =         1   },
+                { .start =  0x100000UL, .end =  0x180000UL },
+                { .start = 0x1000000UL, .end = 0x1000001UL },
+            },
+            .results = {
+                [FAST_IDX] = {
+                    .compress = true,
+                    .offset = 0x100000UL,
+                    .size = 0x80000UL,
+                },
+                [SLOW_IDX] = {
+                    .compress = true,
+                    .offset = 0xf00000UL,
+                    .size = 0x180000UL,
+                },
+            },
+        },
+        /* Test divergence between fast and slow algorithms. */
+        {
+            .ranges = {
+                { .start =                    0,
+                  .end   = (1 << MAX_ORDER) * 1 },
+                { .start = (1 << MAX_ORDER) * 11,
+                  .end   = (1 << MAX_ORDER) * 12 },
+                { .start = (1 << MAX_ORDER) * 20,
+                  .end   = (1 << MAX_ORDER) * 21 },
+            },
+            .results = {
+                [FAST_IDX] = { /* 66% */
+                    .compress = true,
+                    .offset = (1 << MAX_ORDER) * 9,
+                    .size = (1 << MAX_ORDER) * 3,
+                },
+                [SLOW_IDX] = { /* 80% */
+                    .compress = true,
+                    .offset = (1 << MAX_ORDER) * 10,
+                    .size = (1 << MAX_ORDER) * 2,
+                },
+            },
+        },
+        /* Test divergence between fast and slow algorithms. */
+        {
+            .ranges = {
+                { .start =                    0,
+                  .end   = (1 << MAX_ORDER) * 1 },
+                { .start = (1 << MAX_ORDER) * 11,
+                  .end   = (1 << MAX_ORDER) * 12 },
+                { .start = (1 << MAX_ORDER) * 30,
+                  .end   = (1 << MAX_ORDER) * 31 },
+            },
+            .results = {
+                [FAST_IDX] = { /* 18% */
+                    .compress = true,
+                    .offset = (1 << MAX_ORDER) * 11,
+                    .size = (1 << MAX_ORDER) * 9,
+                },
+                [SLOW_IDX] = { /* 80% */
+                    .compress = true,
+                    .offset = (1 << MAX_ORDER) * 10,
+                    .size = (1 << MAX_ORDER) * 2,
+                },
+            },
+        },
+        /* Test incompressible using fast vs compressible using slow. */
+        {
+            .ranges = {
+                { .start =                    0,
+                  .end   = (1 << MAX_ORDER) * 1 },
+                { .start = (1 << MAX_ORDER) * 2,
+                  .end   = (1 << MAX_ORDER) * 3 },
+                { .start = (1 << MAX_ORDER) * 20,
+                  .end   = (1 << MAX_ORDER) * 22 },
+            },
+            .results = {
+                [FAST_IDX] = {
+                    .compress = false,
+                },
+                [SLOW_IDX] = {
+                    .compress = true,
+                    .offset = (1 << MAX_ORDER) * 18,
+                    .size = (1 << MAX_ORDER) * 4,
+                },
+            },
+        },
+    };
+    int ret_code = EXIT_SUCCESS;
+
+    for ( unsigned int i = 0 ; i < ARRAY_SIZE(tests); i++ )
+    {
+        for ( unsigned int use_slow = 0;
+              use_slow < ARRAY_SIZE(tests[i].results); use_slow++ )
+        {
+            const struct result *result = &tests[i].results[use_slow];
+            unsigned int j;
+
+            pfn_pdx_compression_reset();
+
+            for ( j = 0; j < ARRAY_SIZE(tests[i].ranges); j++ )
+            {
+                unsigned long size = tests[i].ranges[j].end -
+                                     tests[i].ranges[j].start;
+
+                if ( !tests[i].ranges[j].start && !tests[i].ranges[j].end )
+                    break;
+
+                pfn_pdx_add_region(tests[i].ranges[j].start << PAGE_SHIFT,
+                                   size << PAGE_SHIFT, j);
+            }
+
+            pfn_offset_sanitize_ranges();
+
+            if ( result->compress != (use_slow ? pfn_offset_calculate_slow(0)
+                                               : pfn_offset_calculate_fast(0)) )
+            {
+                printf("PFN %s compression diverge, expected %scompressible\n",
+                       use_slow ? "slow" : "fast",
+                       result->compress ? "" : "un");
+                print_ranges(tests[i].ranges);
+
+                ret_code = EXIT_FAILURE;
+                continue;
+            }
+
+            if ( !result->compress )
+                continue;
+
+            if ( result->offset != pdx_offset || result->size != pdx_size )
+            {
+                printf("PFN %s compression result diverge, expected:\n",
+                       use_slow ? "slow" : "fast");
+                printf(" offset %013lx size %013lx (%lu%%)\n",
+                       result->offset, result->size,
+                       ((result->offset - result->size) * 100) / result->offset);
+                printf("got:\n offset %013lx size %013lx (%lu%%)\n",
+                       pdx_offset, pdx_size,
+                       ((pdx_offset - pdx_size) * 100) / pdx_offset);
+                print_ranges(tests[i].ranges);
+
+                ret_code = EXIT_FAILURE;
+                continue;
+            }
+
+            for ( j = 0; j < ARRAY_SIZE(tests[i].ranges); j++ )
+            {
+                unsigned long start = tests[i].ranges[j].start;
+                unsigned long end = tests[i].ranges[j].end;
+
+                if ( !start && !end )
+                    break;
+
+                if ( !pdx_is_region_compressible(start << PAGE_SHIFT, 1) ||
+                     !pdx_is_region_compressible((end - 1) << PAGE_SHIFT, 1) )
+                {
+                    printf(
+    "PFN %s compression invalid, pages %#lx and %#lx should be compressible\n",
+                           use_slow ? "slow" : "fast", start, end - 1);
+                    print_ranges(tests[i].ranges);
+                    ret_code = EXIT_FAILURE;
+                }
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 93ebfc29635e..e71908b99c14 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -258,7 +258,7 @@ void __init init_pdx(void)
     unsigned int bank;
 
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
-        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
+        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size, bank);
 
     /*
      * Arm does not have any restrictions on the bits to compress. Pass 0 to
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 96a87bbce35b..dffe81e067e9 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -280,7 +280,7 @@ static int __init cf_check srat_parse_region(
 		printk(KERN_INFO "SRAT: %013"PRIx64"-%013"PRIx64"\n",
 		       ma->base_address, ma->base_address + ma->length - 1);
 
-	pfn_pdx_add_region(ma->base_address, ma->length);
+	pfn_pdx_add_region(ma->base_address, ma->length, ma->proximity_domain);
 
 	return 0;
 }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 7ffd9d7d9003..17afa9fe5f5c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -54,7 +54,8 @@ config EVTCHN_FIFO
 
 choice
 	prompt "PDX (Page inDeX) compression"
-	default PDX_MASK_COMPRESSION if !X86 && !RISCV
+	default PDX_OFFSET_COMPRESSION if X86
+	default PDX_MASK_COMPRESSION if !RISCV
 	default PDX_NONE
 	help
 	  PDX compression is a technique designed to reduce the memory
@@ -73,6 +74,12 @@ config PDX_MASK_COMPRESSION
 	help
 	  Compression relying on all RAM addresses sharing a zeroed bit region.
 
+config PDX_OFFSET_COMPRESSION
+	bool "Offset compression"
+	help
+	  Compression relying on size and distance between RAM regions being
+	  constant.
+
 config PDX_NONE
 	bool "None"
 	help
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 7d14100224fe..f2cf60bbc3f8 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -21,6 +21,15 @@
 #include <xen/nospec.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
+#include <xen/sort.h>
+
+#ifdef __XEN__ /* For building the file in user-space. */
+
+/*
+ * Use a define for the static keyword, we want to export some otherwise static
+ * functions for the unit tests.
+ */
+#define STATIC static
 
 /**
  * Maximum (non-inclusive) usable pdx. Must be
@@ -80,6 +89,7 @@ unsigned long get_max_pfn(unsigned long top_pfn)
 
     return pdx_to_pfn(pdx - 1) + 1;
 }
+#endif /* __XEN__ */
 
 #ifndef CONFIG_PDX_NONE
 
@@ -96,10 +106,11 @@ unsigned long get_max_pfn(unsigned long top_pfn)
 /* Generic PFN compression helpers. */
 static struct pfn_range {
     unsigned long base, size;
+    unsigned int id;
 } ranges[MAX_PFN_RANGES] __initdata;
 static unsigned int __initdata nr;
 
-void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
+void __init pfn_pdx_add_region(paddr_t base, paddr_t size, unsigned int id)
 {
     if ( nr >= ARRAY_SIZE(ranges) )
     {
@@ -108,6 +119,7 @@ void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
         return;
     }
 
+    ranges[nr].id = id;
     ranges[nr].base = PFN_DOWN(base);
     ranges[nr++].size = PFN_UP(base + size) - PFN_DOWN(base);
 }
@@ -297,7 +309,223 @@ void __init pfn_pdx_compression_reset(void)
     pfn_pdx_hole_shift = 0;
 }
 
-#endif /* CONFIG_PDX_COMPRESSION */
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
+
+unsigned long __ro_after_init pdx_offset = ~0UL;
+unsigned long __ro_after_init pdx_size = ~0UL;
+
+static unsigned long __initdata top_pfn;
+
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
+{
+    return !pdx_size ? true
+                     : (PFN_DOWN(base) % pdx_offset) + npages <= pdx_size;
+}
+
+STATIC bool __init pfn_offset_calculate_fast(unsigned long base)
+{
+    unsigned long size = max((1UL << MAX_ORDER), base);
+    unsigned long offset = ~0UL;
+    unsigned int i;
+
+    if ( nr <= 1 )
+        return false;
+
+    /* Calculate minimal offset between regions. */
+    for ( i = 1; i < nr; i++ )
+        offset = min(offset, ranges[i].base - ranges[i - 1].base);
+
+    /* Return early if offset is smaller than the minimum size. */
+    if ( size >= offset )
+        return false;
+
+    /* Calculate size so it covers all regions based on the minimal offset. */
+    for ( i = 0; i < nr; i++ )
+        size = max(size, ranges[i].base % offset + ranges[i].size);
+
+    if ( size >= offset )
+        return false;
+
+    pdx_offset = offset;
+    pdx_size = size;
+
+    return true;
+}
+
+STATIC bool __init pfn_offset_calculate_slow(unsigned long base)
+{
+    unsigned long min_size = max((1UL << MAX_ORDER), base);
+    unsigned long offset, max_offset = 0;
+    unsigned int i, best_ratio = 0;
+
+    if ( nr <= 1 )
+        return false;
+
+    for ( i = 0; i < nr; i++ )
+    {
+        /* Minimal size required to cover the bigger region in the set. */
+        min_size = max(min_size, ranges[i].size);
+        if ( !i )
+            continue;
+
+        max_offset = max(max_offset, ranges[i].base - ranges[i - 1].base);
+    }
+
+    if ( min_size >= max_offset )
+        return false;
+
+    for ( offset = max_offset; offset > min_size; offset-- )
+    {
+        unsigned long size = min_size;
+        unsigned int ratio;
+
+        /*
+         * Terminate loop if it's impossible to get a better ratio given the
+         * decreasing offset and the minimal required region size.
+         */
+        if ( best_ratio >= ((offset - size) * 100) / offset )
+            break;
+
+        for ( i = 0; i < nr; i++ )
+            size = max(size, (ranges[i].base % offset) + ranges[i].size);
+
+        if ( size >= offset )
+            continue;
+
+        ratio = ((offset - size) * 100) / offset;
+        if ( ratio > best_ratio )
+        {
+            best_ratio = ratio;
+            pdx_offset = offset;
+            pdx_size = size;
+        }
+    }
+
+    return best_ratio;
+}
+
+static int __init cf_check cmp_node(const void *a, const void *b)
+{
+    const struct pfn_range *l = a;
+    const struct pfn_range *r = b;
+
+    if ( l->base > r->base )
+        return 1;
+    if ( l->base < r->base )
+        return -1;
+
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+static void __init cf_check swp_node(void *a, void *b, size_t size)
+{
+    struct pfn_range *l = a;
+    struct pfn_range *r = b;
+    struct pfn_range tmp = *l;
+
+    *l = *r;
+    *r = tmp;
+}
+
+STATIC void __init pfn_offset_sanitize_ranges(void)
+{
+    unsigned int i = 0;
+
+    /* Sort nodes by start address. */
+    sort(ranges, nr, sizeof(struct pfn_range), cmp_node, swp_node);
+
+    /* Merge ranges if possible. */
+    while ( i + 1 < nr )
+    {
+        if ( ranges[i].id == ranges[i + 1].id )
+        {
+            /* Merge ranges with the same ID. */
+            ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
+                             ranges[i].base;
+        }
+        else if ( ranges[i].base + ranges[i].size == ranges[i + 1].base )
+        {
+            /* Merge ranges if contiguous. */
+            ranges[i].size += ranges[i + 1].size;
+        }
+        else
+        {
+            i++;
+            continue;
+        }
+
+        /* Merge ranges. */
+        memmove(&ranges[i + 1], &ranges[i + 2],
+                (nr - (i + 2)) * sizeof(ranges[0]));
+        nr--;
+    }
+}
+
+#ifdef __XEN__
+bool __init pfn_pdx_compression_setup(paddr_t base)
+{
+    bool use_slow = false;
+
+    if ( nr <= 1 )
+        return false;
+
+    if ( nr > ARRAY_SIZE(ranges) )
+    {
+        printk(XENLOG_WARNING
+               "Too many NUMA nodes (%u), not attempting PFN compression\n",
+               nr);
+        return false;
+    }
+
+    pfn_offset_sanitize_ranges();
+
+    if ( nr <= 1 )
+        return false;
+
+    top_pfn = ranges[nr - 1].base + ranges[nr - 1].size;
+
+    for ( ; ; use_slow = true )
+    {
+        if ( use_slow ? pfn_offset_calculate_slow(PFN_DOWN(base))
+                      : pfn_offset_calculate_fast(PFN_DOWN(base)) )
+        {
+            if ( top_pfn != get_max_pfn(top_pfn) )
+                dprintk(XENLOG_DEBUG,
+                        "PFN %s compression coefficients truncate address space\n",
+                        use_slow ? "slow" : "fast");
+            else
+                break;
+        }
+        else
+        {
+            dprintk(XENLOG_DEBUG,
+                    "Find PFN compression coefficients using %s algorithm failed\n",
+                    use_slow ? "slow" : "fast");
+            if ( use_slow )
+                return false;
+        }
+
+        if ( use_slow )
+            break;
+    }
+
+    printk(XENLOG_INFO "PFN compression using offset %#lx size %#lx (%lu%%)\n",
+           pdx_offset, pdx_size, ((pdx_offset - pdx_size) * 100) / pdx_offset);
+
+    return true;
+}
+#endif /* __XEN__ */
+
+void __init pfn_pdx_compression_reset(void)
+{
+    pdx_size = ~0UL;
+    pdx_offset = ~0UL;
+    nr = 0;
+    top_pfn = 0;
+}
+
+#endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 6cc0f54cff83..88f446f4ddd9 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -65,6 +65,31 @@
  * This scheme also holds for multiple regions, where HHHHHHH acts as
  * the region identifier and LLLLLL fully contains the span of every
  * region involved.
+ *
+ * ## PDX offset compression
+ *
+ * Alternative compression mechanism that relies on RAM ranges having a similar
+ * size and offset between them:
+ *
+ * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
+ * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
+ * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
+ * │<------>│          │
+ * │  size             │
+ * │<----------------->│
+ *         offset
+ *
+ * The compression removes the holes between RAM regions:
+ *
+ * ┌────────┬────────┐   ┌────────┐
+ * │ RAM 0  │ RAM 1  │...│ RAM N  │
+ * ├────────┼────────┘   └────────┘
+ * │<------>│
+ *    size
+ *
+ * The compressed index is calculated as:
+ *
+ * index = (pfn % offset) + ((pfn / offset) * size)
  */
 
 /* Macro defined per-arch to skip PDX logic when there's no compression. */
@@ -188,7 +213,20 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
                  offset);
 }
 
-#endif /* CONFIG_PDX_MASK_COMPRESSION */
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
+
+extern unsigned long pdx_offset;
+extern unsigned long pdx_size;
+
+/* pdx<->pfn == identity */
+#define pdx_to_pfn(x) (x)
+#define pfn_to_pdx(x) (x)
+
+/* directmap is indexed by maddr */
+#define maddr_to_directmapoff(x) (x)
+#define directmapoff_to_maddr(x) (x)
+
+#endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
 #ifdef CONFIG_PDX_NONE
 
@@ -208,7 +246,8 @@ static inline bool pdx_is_region_compressible(paddr_t base,
     return true;
 }
 
-static inline void pfn_pdx_add_region(paddr_t base, paddr_t size)
+static inline void pfn_pdx_add_region(paddr_t base, paddr_t size,
+                                      unsigned int id)
 {
 }
 
@@ -239,8 +278,9 @@ bool pdx_is_region_compressible(paddr_t base, unsigned long npages);
  *
  * @param base Start of the region in bytes.
  * @param size Length of the region in bytes.
+ * @param id Range group identifier (for example NUMA proximity domain ID).
  */
-void pfn_pdx_add_region(paddr_t base, paddr_t size);
+void pfn_pdx_add_region(paddr_t base, paddr_t size, unsigned int id);
 
 /**
  * Initializes global variables with information about the compressible
-- 
2.49.0


