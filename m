Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A7AE19B3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020851.1397032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZes-0006x5-9A; Fri, 20 Jun 2025 11:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020851.1397032; Fri, 20 Jun 2025 11:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZes-0006uZ-3Y; Fri, 20 Jun 2025 11:11:46 +0000
Received: by outflank-mailman (input) for mailman id 1020851;
 Fri, 20 Jun 2025 11:11:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZeq-0005XV-Am
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:44 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5845fd68-4dc7-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 13:11:42 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso14038345e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:42 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453646cb672sm22375835e9.6.2025.06.20.04.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:40 -0700 (PDT)
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
X-Inumbo-ID: 5845fd68-4dc7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417901; x=1751022701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsCxSro0G0kDL5DT8H/ufk+WFItshO7wcFGLxBzt6rg=;
        b=WslG60dSTAlpK/m9Gfqx+bNg7qSCGbMcECr955Ie1K7wsrghP4WypS/DHH3bPuG2OO
         e9jfSjBg+EEQ3Uacnx0JRu0OMfqqHb6Xen/tJExruFzmuhC4IfTkyE3KwSdYv5nkb9S1
         LSlFwoPBfEBAGLd0GBc/TCh4qW7YXsXuOGI9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417901; x=1751022701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsCxSro0G0kDL5DT8H/ufk+WFItshO7wcFGLxBzt6rg=;
        b=UcMOsb1kKyyUHax7hmNHM2zeLu+v/4NELclmYTCk4Zm4duyXMadxxcnefNuKBnOr1f
         SMD5IsxsNng2QB8VTi2VbBq2hZpaciw5sEgKI1isJZqql7XXqrVpzMpVrFw1ZLKI3dj1
         AnctFyKoYIFXXgxuZsQn0PVozLBntUoPvbRjOr9dbKrG7bFeZC/WFQhgTOxs4hPea01a
         jnuLW8AkbGAYBbsVDCFm3SjCbd9VDGjW8zKkkJkcNm7qRKQDqiwrMxK82ugS9Sddcu3W
         q8iFp5OJbIhSOlfmauExtiEq1Hllyho1DzddBlOyGya8rIJ5/GvecbmlJIfbMqmK2d/N
         LLig==
X-Gm-Message-State: AOJu0YyvPtE3eK+LN1Ab7+q2TWnRONicQvxqxrA0fWuoofr53mhmQXn7
	somxHL1GlnZiWwQGA2clu3930YDDJL8JH13GVi5Nim5KCcsqbdM2TGhycvu4woAGMP3vOKVK8W2
	ItAH9
X-Gm-Gg: ASbGncs0XGwI6afLLoVSsq0PfwdL/8K6gGqJMcrgpDbRYkZY6fr5L4tQSSQUTrx4Pn4
	g/ZAFwrbWd4KcevKHCVUo7e4/kU77oQDo+Vh9PaRYgOTucYHvXtOl5Acr9hNSt81hjV448TR79W
	j2fJPvOTEnJWc/w9w4l6lzo6PW/xn96SQ2z2jeaDheOSJgvCA+vBCqTyHKLHZUmPx0WIL5YHnov
	b7HRDkijCzS9D1ic1GwIFYYg4h1Ur6Jkh6Mio+xA65iy1GpKxvYej9SE0eq/ru/AmVEU4quSDkB
	OLwX4lQvJ/oSDN9Go/z+1VNDORstox/KvdS1AtAD6zO3t9HN6KQMIrpGuUUru+C2dZVXmcsd8Es
	nCYik+gmlEy6vhKpkTxh2L++6NhdISg==
X-Google-Smtp-Source: AGHT+IF6i1WhfFMFyhSmrPUes6Q3jZ77HAhhSPCYQfxYrKJeXFhYKfQou/CrlO18cgXG6ohBKLxNiA==
X-Received: by 2002:a5d:64cc:0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3a6d12eb3dfmr1939933f8f.47.1750417901384;
        Fri, 20 Jun 2025 04:11:41 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/8] test/pdx: add PDX compression unit tests
Date: Fri, 20 Jun 2025 13:11:28 +0200
Message-ID: <20250620111130.29057-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
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
Changes since v1:
 - New in this version (partially pulled out from a different patch).
---
 tools/tests/Makefile       |   1 +
 tools/tests/pdx/.gitignore |   2 +
 tools/tests/pdx/Makefile   |  48 ++++++++
 tools/tests/pdx/harness.h  |  89 +++++++++++++++
 tools/tests/pdx/test-pdx.c | 220 +++++++++++++++++++++++++++++++++++++
 xen/common/pdx.c           |   4 +
 6 files changed, 364 insertions(+)
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
index 000000000000..99867b71c438
--- /dev/null
+++ b/tools/tests/pdx/Makefile
@@ -0,0 +1,48 @@
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
+	for test in $? ; do \
+		./$$test ;  \
+	done
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.c pdx.h
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
+	sed -E -e '/^#[[:space:]]?include/d' <$< >$@
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
index 000000000000..64ec09f5e281
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
+#define MAX_RANGES 8
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
index 000000000000..b717cae00711
--- /dev/null
+++ b/tools/tests/pdx/test-pdx.c
@@ -0,0 +1,220 @@
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
+#endif
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
index 86e2dc7c6bb6..5cfec591f993 100644
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


