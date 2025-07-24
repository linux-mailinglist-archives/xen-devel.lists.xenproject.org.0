Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE63BB10885
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055723.1424072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl7-0001wf-AZ; Thu, 24 Jul 2025 11:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055723.1424072; Thu, 24 Jul 2025 11:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl7-0001ss-5o; Thu, 24 Jul 2025 11:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1055723;
 Thu, 24 Jul 2025 11:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetl5-0000v1-8c
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e8b7023-687e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 13:05:06 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4563bc166a5so5387315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:06 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcb8aa6sm1846237f8f.67.2025.07.24.04.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:05:05 -0700 (PDT)
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
X-Inumbo-ID: 0e8b7023-687e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355106; x=1753959906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfMGn8u0wtzpSEZPvLvEyIwXmFi4IRmv1Yr6i8nv/Po=;
        b=OabB9AGNkOCCkCSZ1+/ib7AW5gqZp3Jo06AZhls/GuWpElEro1GhLg/XUsnYiXHi8M
         mEsnvcKre2B32RA5yp6PUAqCD8hrYFtJ/Hg6vBa/HjJheR0vupgvMiR5W8IyhVIQqyuj
         463UPTXXRzK3Ok44/ucUfAfT5XnRmZJDpP1Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355106; x=1753959906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfMGn8u0wtzpSEZPvLvEyIwXmFi4IRmv1Yr6i8nv/Po=;
        b=cYXC2aamYimAcYTDhBB5pK1SG9sYcUy1t+4eUV8GyifjEGDNUtvmdeaMW80lFzIn6o
         tIPoU9bXi/M2cedjyzh4/1IJMvL92HskbTv3oLuBtqiT1TbulPp/3twpcZ5/cZCt3Onj
         crcVwuYCRNa20CwgW/vX46kJelMUas7/97MM3fjgjAkOUEIBC4slQHcjZZoWlK7g7T+h
         8gPwPZTP5qJ0D6YOE4ER1LWtGuT82Eo6RTHXaEB7w+A78BoiUOAJULTj1B4KtX5/nhsK
         kISfLtxtQkHCUkSHaxnmHEgGh0PifBh9cdbjmccYJ1uUOMBKfOi1d8xtcbazZbKtbtUq
         4l2g==
X-Gm-Message-State: AOJu0Ywb6ac1f3oBnSMYmyFfyB0B8Hzt75BgkF/gGUtl/Z9PF5pn4SWo
	x7+5k2bG22+LuOsgKK+MI7sWN2ofEyikfEoN8/TyxO3n+ZXdP6za8l50qzfM6Bs58+sikB6r6RS
	Dx4Ue
X-Gm-Gg: ASbGncsgNz1zwHH0UH3Y0IWe62+mpdOm2Zr9HOfPGR4l70hhgfG6fDKRgI/W/Sy+vky
	i2NESMzZf88cwthEeYD05NHavOHzVnF5VajM84M/dAcJrEjFEyuC1K3sAFyCXFGPXUckC9WkaDe
	mtV50UFAgDldYFjhZ1uEYF3wHB9vbNHXYjzikQsMQaEeJij7LXbznmC4/agTOJ8c1J9603odNpp
	bApUId8ObDIaKu3O7bw5Inhd/ATrYnoy5zoZm1y4DI3pEsDuSTLMkZmyRtKNvFrxYkoX6zQQP0s
	QGgsKugtt8rjbo3M8URK4lTmMRtEPvQYe/YdA0dWlwUGFVi4DNEnd+iD9DiQdLDavKUQEO23z0n
	XnaHisoPmdZrFWLypZz3NY1SWXNPyk8xUSkLsvDtPsAuXEDPynkI0f+lABEO/94kyUg==
X-Google-Smtp-Source: AGHT+IFotDbUgLRpQ8cDPvOXhY+CINzju0YAwor2Y8HXe+klATwB5Vt4WOT6gsalQlsRhn6GK5ftpA==
X-Received: by 2002:a05:600c:4f06:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-45870973ccbmr11959465e9.0.1753355105710;
        Thu, 24 Jul 2025 04:05:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/8] test/pdx: add PDX compression unit tests
Date: Thu, 24 Jul 2025 13:04:13 +0200
Message-ID: <20250724110416.2081-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
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
 tools/tests/pdx/harness.h  |  89 +++++++++++++
 tools/tests/pdx/test-pdx.c | 267 +++++++++++++++++++++++++++++++++++++
 xen/common/pdx.c           |   4 +
 6 files changed, 412 insertions(+)
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
index 000000000000..891b4de0bbb7
--- /dev/null
+++ b/tools/tests/pdx/harness.h
@@ -0,0 +1,89 @@
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
+#define BITS_PER_LONG (sizeof(unsigned long) * 8)
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
+#define pdx_to_pfn pdx_to_pfn_xlate
+#define pfn_to_pdx pfn_to_pdx_xlate
+#define maddr_to_directmapoff maddr_to_directmapoff_xlate
+#define directmapoff_to_maddr directmapoff_to_maddr_xlate
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
index f4ee2198841d..e58002e59db4 100644
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


