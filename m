Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5185A855ED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 09:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946729.1344531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39EO-0001QV-M2; Fri, 11 Apr 2025 07:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946729.1344531; Fri, 11 Apr 2025 07:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39EO-0001Nz-Hr; Fri, 11 Apr 2025 07:55:20 +0000
Received: by outflank-mailman (input) for mailman id 946729;
 Fri, 11 Apr 2025 07:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u39EM-00011Z-LO
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:55:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f30c7cf-16aa-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 09:55:17 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso11569715e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:55:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f20a9f14csm48344365e9.1.2025.04.11.00.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 00:55:16 -0700 (PDT)
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
X-Inumbo-ID: 4f30c7cf-16aa-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744358117; x=1744962917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLeBGRbpR+Ugz3QX+1XDVxNxvcj3Y6YlL0h+g0Lm8lo=;
        b=jxuewF/5MbacNom56ggBB0lYXM1qMoR9JINwhO2aAbnA8SRgdatJ5P1u4cc+oNqu3r
         pWFHDTjgtbDKRq2O64Mvvfg5RAT3QJUYeArc6Pu8i7c5ZgfHKC4GYG6zeaj0AacQU9kX
         DS3ekqOB7clYC6ckNijhFNSZozIoJaAHTXem4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358117; x=1744962917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLeBGRbpR+Ugz3QX+1XDVxNxvcj3Y6YlL0h+g0Lm8lo=;
        b=Yqwj7zmIvyRevTIysJeMUfJjVO3ilczDLIaJUyESNSqdODyp6hVwPI3blb7U8I/ytQ
         WSAdF8K1NzYDClhvZHHK2XGebkxt9du7Op10tMVJSpai+mNO6jXGVjz0aWlmCHymYIRO
         6EClkmOcVWQWOVw+B354qU0aZr5i7CdQRuAMs1QayRq5ARFK4pfMIISF2jMLSVVmX/Ow
         meYB2UeGUpu+J2+EtdfNxU0Zm+PHAn2MGENK7uR7ZmYPtx8mc9Ve6UkNo/4XYyATyve4
         r5HPsGlcQ63eUn6QY1llTFHXmhzDK6F6HmIG+LYnPv+Yh10+MBL3IVSdFKuim97Fn0Ys
         cS6w==
X-Gm-Message-State: AOJu0YytFtsQavvheldKV6HVtA2QqqVUomZYas1mSA38rN+vQ72A2535
	NFfpiGAT54czqfEi9eJ2K6GAjsNNqpXqjF5NRYom8SE6aZ0A12Xr+MBaYlGMNfCI6TgZ9q/6Yro
	X
X-Gm-Gg: ASbGncuNIbhQ3KmQYMkRVCqic53nAPaQbuaRyNjKUNoebAWAfdlJbOt3dcNZjQBLFcU
	lroQVW5jAlvu6avlFtOPCm4khzYpIWv9zQH0qi5zpStopmDgJDo8xn7BCPxX/NcEf+A7Wtxttx4
	EXmjSP0Xo8pxA4H0UZlSZ1wygEeGtvi/TC1pUX1e6+ZZVV/UXzsTRqTAcgjOyO6ZrGXcW8TJcUM
	JvJotlad8XzdHFqCQJBaVYdlo8BvyGlwDZZqtAmq7jd5rL9dECt5acJkOwdShrxI9/rZL4tHzHO
	BN2wpVgRqlPz7kFwj5YIfYZ36ZyiIClwxWG+4z5md+6bDQ==
X-Google-Smtp-Source: AGHT+IGTfA53GKCinZww3+bx9Jg5VRFQcHOrdt46mfg4+BbZDjySAq8hi2RFPtvJVENwix4kBbIvpA==
X-Received: by 2002:a05:600c:4e47:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43f3a9276a6mr14450305e9.3.1744358116924;
        Fri, 11 Apr 2025 00:55:16 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/2] tootls/tests: introduce unit tests for rangesets
Date: Fri, 11 Apr 2025 09:55:02 +0200
Message-ID: <20250411075502.19926-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411075502.19926-1-roger.pau@citrix.com>
References: <20250411075502.19926-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce some basic infrastructure for doing rangeset unit tests, and add
a few tests that ensure correctness of rangeset subtraction.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/Makefile                 |   1 +
 tools/tests/rangeset/Makefile        |  45 ++++++
 tools/tests/rangeset/harness.h       |  71 +++++++++
 tools/tests/rangeset/test-rangeset.c | 228 +++++++++++++++++++++++++++
 4 files changed, 345 insertions(+)
 create mode 100644 tools/tests/rangeset/Makefile
 create mode 100644 tools/tests/rangeset/harness.h
 create mode 100644 tools/tests/rangeset/test-rangeset.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 1319c3a9d88c..3e60ab6b268d 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -10,6 +10,7 @@ SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
 SUBDIRS-y += xenstore
 SUBDIRS-y += depriv
+SUBDIRS-y += rangeset
 SUBDIRS-y += vpci
 SUBDIRS-y += paging-mempool
 
diff --git a/tools/tests/rangeset/Makefile b/tools/tests/rangeset/Makefile
new file mode 100644
index 000000000000..451f67e1920f
--- /dev/null
+++ b/tools/tests/rangeset/Makefile
@@ -0,0 +1,45 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-rangeset
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: run
+run: $(TARGET)
+	./$<
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGET) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET))
+
+list.h: $(XEN_ROOT)/xen/include/xen/list.h
+rangeset.h: $(XEN_ROOT)/xen/include/xen/rangeset.h
+list.h rangeset.h:
+	sed -e '/#include/d' <$< >$@
+
+rangeset.c: $(XEN_ROOT)/xen/common/rangeset.c list.h rangeset.h
+	# Remove includes and add the test harness header
+	sed -e '/#include/d' -e '1s/^/#include "harness.h"/' <$< >$@
+
+CFLAGS  += -D__XEN_TOOLS__
+CFLAGS  += $(APPEND_CFLAGS)
+CFLAGS += $(CFLAGS_xeninclude)
+LDFLAGS += $(APPEND_LDFLAGS)
+
+test-rangeset: rangeset.o test-rangeset.o
+	$(CC) $^ -o $@ $(LDFLAGS)
diff --git a/tools/tests/rangeset/harness.h b/tools/tests/rangeset/harness.h
new file mode 100644
index 000000000000..a60ebff72d0f
--- /dev/null
+++ b/tools/tests/rangeset/harness.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for rangesets.
+ *
+ * Copyright (C) 2025 Cloud Software Group
+ */
+
+#ifndef _TEST_HARNESS_
+#define _TEST_HARNESS_
+
+#include <assert.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xen-tools/common-macros.h>
+
+#define smp_wmb()
+#define __must_check __attribute__((__warn_unused_result__))
+#define cf_check
+
+#define BUG_ON(x) assert(!(x))
+#define ASSERT(x) assert(x)
+
+#include "list.h"
+#include "rangeset.h"
+
+typedef bool rwlock_t;
+typedef bool spinlock_t;
+
+struct domain {
+    unsigned int     domain_id;
+    struct list_head rangesets;
+    spinlock_t       rangesets_lock;
+};
+
+/* For rangeset_domain_{initialize,printk}() */
+#define spin_lock_init(l) (*(l) = false)
+#define spin_lock(l)      (*(l) = true)
+#define spin_unlock(l)    (*(l) = false)
+
+/* For rangeset->lock */
+#define rwlock_init(l)    (*(l) = false)
+#define read_lock(l)      (*(l) = true)
+#define read_unlock(l)    (*(l) = false)
+#define write_lock(l)     (*(l) = true)
+#define write_unlock(l)   (*(l) = false)
+
+#define xmalloc(type) ((type *)malloc(sizeof(type)))
+#define xfree free
+
+#define unlikely
+
+#define safe_strcpy strcpy
+
+#define printk printf
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
diff --git a/tools/tests/rangeset/test-rangeset.c b/tools/tests/rangeset/test-rangeset.c
new file mode 100644
index 000000000000..b44cd217a050
--- /dev/null
+++ b/tools/tests/rangeset/test-rangeset.c
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for rangesets.
+ *
+ * Copyright (C) 2025 Cloud Software Group
+ */
+
+#include "harness.h"
+
+struct range {
+    unsigned long start, end;
+};
+
+struct action {
+    enum {
+        ADD,
+        REMOVE,
+    } action;
+    struct range r;
+};
+
+#define DECLARE_ACTIONS(nr) static const struct action actions ## nr []
+#define DECLARE_RESULTS(nr) static const struct range results ## nr []
+
+/*
+ * Subtract range with tail overlap on existing range:
+ *
+ * { 0, 1, 4, 5 } - { 3, 4 } = { 0, 1, 5, 5 }
+ */
+DECLARE_ACTIONS(0) = {
+    { ADD,    { 0, 1 } },
+    { ADD,    { 4, 5 } },
+    { REMOVE, { 3, 4 } },
+};
+DECLARE_RESULTS(0) = {
+    { 0, 1 }, { 5, 5 },
+};
+
+/*
+ * Subtract range with complete and tail overlap on existing ranges:
+ *
+ * { 0, 1, 4, 5, 7, 8 } - { 3, 4, 5, 6, 7 } = { 0, 1, 8 }
+ */
+DECLARE_ACTIONS(1) = {
+    { ADD,    { 0, 1 } },
+    { ADD,    { 4, 5 } },
+    { ADD,    { 7, 8 } },
+    { REMOVE, { 3, 7 } },
+};
+DECLARE_RESULTS(1) = {
+    { 0, 1 }, { 8, 8 },
+};
+
+/*
+ * Subtract range with no overlap:
+ *
+ * { 0, 1, 4, 5 } - { 2, 3 } = { 0, 1, 4, 5 }
+ */
+DECLARE_ACTIONS(2) = {
+    { ADD,    { 0, 1 } },
+    { ADD,    { 4, 5 } },
+    { REMOVE, { 2, 3 } },
+};
+DECLARE_RESULTS(2) = {
+    { 0, 1 }, { 4, 5 },
+};
+
+/*
+ * Subtract range with partial overlap on two existing ranges:
+ *
+ * { 0, 1, 4, 5 } - { 1, 4 } = { 0, 5 }
+ */
+DECLARE_ACTIONS(3) = {
+    { ADD,    { 0, 1 } },
+    { ADD,    { 4, 5 } },
+    { REMOVE, { 1, 4 } },
+};
+DECLARE_RESULTS(3) = {
+    { 0, 0 }, { 5, 5 },
+};
+
+static const struct test {
+    unsigned int nr_actions, nr_results;
+    const struct action *actions;
+    const struct range *result;
+} tests[] = {
+#define DECLARE_TEST(nr)                                \
+    {                                                   \
+        .actions = actions ## nr,                       \
+        .nr_actions = ARRAY_SIZE(actions ## nr),        \
+        .result  = results ## nr,                       \
+        .nr_results = ARRAY_SIZE(results ## nr),        \
+    }
+
+    DECLARE_TEST(0),
+    DECLARE_TEST(1),
+    DECLARE_TEST(2),
+    DECLARE_TEST(3),
+
+#undef DECLARE_TEST
+};
+
+static int print_range(unsigned long s, unsigned long e, void *data)
+{
+    printf("[%ld, %ld]\n", s, e);
+
+    return 0;
+}
+
+static int count_ranges(unsigned long s, unsigned long e, void *data)
+{
+    unsigned int *nr = data;
+
+    ++*nr;
+    return 0;
+}
+
+const struct range *expected;
+static int check_ranges(unsigned long s, unsigned long e, void *data)
+{
+    unsigned int *nr = data;
+    int rc = 0;
+
+    if ( s != expected[*nr].start || e != expected[*nr].end )
+        rc = -EINVAL;
+
+    ++*nr;
+    return rc;
+}
+
+static void print_both(struct rangeset *r, const struct range *expected,
+                       unsigned int nr_expected)
+{
+    unsigned int i;
+
+    printf("Result:\n");
+    rangeset_report_ranges(r, 0, ~0UL, print_range, NULL);
+    printf("Expected:\n");
+    for ( i = 0; i < nr_expected; i++ )
+        printf("[%ld, %ld]\n", expected[i].start, expected[i].end);
+}
+
+int main(int argc, char **argv)
+{
+    struct rangeset *r = rangeset_new(NULL, NULL, 0);
+    unsigned int i;
+    int ret_code = 0;
+
+    ASSERT(r);
+
+    for ( i = 0 ; i < ARRAY_SIZE(tests); i++ )
+    {
+        unsigned int j, nr = 0;
+        int rc = 0;
+
+        rangeset_purge(r);
+        for ( j = 0; j < tests[i].nr_actions; j++ )
+        {
+            const struct action *a = &tests[i].actions[j];
+
+            switch ( a->action )
+            {
+            case ADD:
+                rc = rangeset_add_range(r, a->r.start, a->r.end);
+                break;
+
+            case REMOVE:
+                rc = rangeset_remove_range(r, a->r.start, a->r.end);
+                break;
+            }
+
+            if ( rc )
+            {
+                printf("Test %u failed to %s range [%ld, %ld]\n",
+                       i, a->action == ADD ? "add" : "remove",
+                       a->r.start, a->r.end);
+                rangeset_report_ranges(r, 0, ~0UL, print_range, NULL);
+                break;
+            }
+        }
+
+        if ( rc )
+        {
+            /* Action failed, skip this test and set exit code to failure. */
+            ret_code = EXIT_FAILURE;
+            continue;
+        }
+
+        rc = rangeset_report_ranges(r, 0, ~0UL, count_ranges, &nr);
+        if ( rc )
+        {
+            printf("Test %u unable to count number of result ranges\n", i);
+            rangeset_report_ranges(r, 0, ~0UL, print_range, NULL);
+            ret_code = EXIT_FAILURE;
+            continue;
+        }
+        if ( nr != tests[i].nr_results )
+        {
+            printf("Test %u unexpected number of result ranges, expected: %u got: %u\n",
+                   i, tests[i].nr_results, nr);
+            print_both(r, tests[i].result, tests[i].nr_results);
+            ret_code = EXIT_FAILURE;
+            continue;
+        }
+
+        nr = 0;
+        expected = tests[i].result;
+        rc = rangeset_report_ranges(r, 0, ~0UL, check_ranges, &nr);
+        if ( rc )
+        {
+            printf("Test %u range checking failed\n", i);
+            print_both(r, tests[i].result, tests[i].nr_results);
+            ret_code = EXIT_FAILURE;
+            continue;
+        }
+    }
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
-- 
2.48.1


