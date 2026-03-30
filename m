Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKamLA/hymnEAwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 22:46:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A403611D8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 22:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268103.1557487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7JUW-0003bn-9u; Mon, 30 Mar 2026 20:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268103.1557487; Mon, 30 Mar 2026 20:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7JUW-0003Yb-5d; Mon, 30 Mar 2026 20:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1268103;
 Mon, 30 Mar 2026 20:45:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7JUU-0003Vn-Ig
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 20:45:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7JUT-00FXeb-SJ
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 22:45:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cae0e8-2eae-0a2a0a5409dd-0a2a4502a576-12
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 22:45:41 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cae0f4-63bb-0a2a45020019-a0658309ba84-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 22:45:41 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 1B952816F7A6;
 Mon, 30 Mar 2026 16:44:54 -0400 (EDT)
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
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marcus.granado@citrix.com,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 1/2] tools/tests/migration: introduce migration functional and performance tests
Date: Mon, 30 Mar 2026 21:45:31 +0100
Message-ID: <a098c74f0ff51e55ca57d10a68b141107928e04d.1774903347.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774903347.git.edwin.torok@citrix.com>
References: <cover.1774903347.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774903541-BDA9CDB8-473B162D/0/0
X-purgate-type: clean
X-purgate-size: 41210
X-Spamd-Result: default: False [3.14 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marcus.granado@citrix.com,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 52A403611D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create a minimal guest that is localhost-migratable via
xc_domain_save/xc_domain_restore.
This only exercises the basics of a migration (no device emulators, no
page dirtying), but has already been useful at detecting bugs in an
upcoming migration improvement patches.

Fill the memory with a deterministic pattern (either the page's own
address, or a random value constructed from a fixed seed).
Regenerate the same pattern after migration (one page at a time),
and check whether it matches the expected pattern.

On a mismatch it prints a hexdump, and this can be useful to identify
whether the entire memory is corrupted, or whether the data is present,
but at a constant offset, and whether the entire memory is corrupted, or
just some particular pages.

To construct a somewhat more realistic scenario it also:
* inserts a gap of some non-streamable pages, by marking them as MMIO
* tests explicitly aligned userspace buffers
* tests explicitly unaligned userspace buffers (at a constant offset
  from an aligned one)

Each of these scenarios has been useful in finding and fixing bugs in
prototype optimization patches.

To distinguish bugs in memory mapping/copying from bugs in the migration
streaming code, it contains a separate test for foreign mapping, using
the same patterns test.
The code is generic, to allow introducing other forms of mapping/copying
in the future (e.g. foreign copy)

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/Makefile                   |   1 +
 tools/tests/common/guests.c            |   1 +
 tools/tests/migration/.gitignore       |   1 +
 tools/tests/migration/Makefile         |  70 +++
 tools/tests/migration/memory.c         |   6 +
 tools/tests/migration/memory.h         |  92 ++++
 tools/tests/migration/patterns.c       |  76 +++
 tools/tests/migration/patterns.h       |  22 +
 tools/tests/migration/test-migration.c | 713 +++++++++++++++++++++++++
 tools/tests/migration/xen_patterns.c   |  92 ++++
 tools/tests/migration/xen_patterns.h   |  14 +
 11 files changed, 1088 insertions(+)
 create mode 100644 tools/tests/migration/.gitignore
 create mode 100644 tools/tests/migration/Makefile
 create mode 100644 tools/tests/migration/memory.c
 create mode 100644 tools/tests/migration/memory.h
 create mode 100644 tools/tests/migration/patterns.c
 create mode 100644 tools/tests/migration/patterns.h
 create mode 100644 tools/tests/migration/test-migration.c
 create mode 100644 tools/tests/migration/xen_patterns.c
 create mode 100644 tools/tests/migration/xen_patterns.h

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 6477a4386d..d67b4e415f 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS-y :=
 SUBDIRS-y += domid
 SUBDIRS-y += mem-claim
+SUBDIRS-y += migration
 SUBDIRS-y += paging-mempool
 SUBDIRS-y += pdx
 SUBDIRS-y += rangeset
diff --git a/tools/tests/common/guests.c b/tools/tests/common/guests.c
index a46ff2f68d..20acd9129e 100644
--- a/tools/tests/common/guests.c
+++ b/tools/tests/common/guests.c
@@ -53,6 +53,7 @@ void test_guest(struct xen_domctl_createdomain *c)
 
 void test_guests(void)
 {
+    xen_has_pv = 0;
     if ( xen_has_pv )
     {
         struct xen_domctl_createdomain c = {
diff --git a/tools/tests/migration/.gitignore b/tools/tests/migration/.gitignore
new file mode 100644
index 0000000000..619b2b4578
--- /dev/null
+++ b/tools/tests/migration/.gitignore
@@ -0,0 +1 @@
+test-migration
diff --git a/tools/tests/migration/Makefile b/tools/tests/migration/Makefile
new file mode 100644
index 0000000000..04f32a3b7b
--- /dev/null
+++ b/tools/tests/migration/Makefile
@@ -0,0 +1,70 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-migration
+TARGETS := $(TARGET)
+
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += -Og -g -pthread
+
+LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(LDLIBS_libxenguest)
+LDFLAGS += $(LDLIBS_libxentoollog)
+LDFLAGS += $(LDLIBS_libxenforeignmemory)
+LDFLAGS += $(LDLIBS_libxendevicemodel)
+LDFLAGS += -pthread -lrt
+
+$(TARGET): ../common/guests.o patterns.o xen_patterns.o memory.o
+
+# The fragment below can be eventually replaced with a shared rule:
+# include $(XEN_ROOT)/tools/tests/Rules.mk
+
+ifndef XEN_ROOT
+$(error XEN_ROOT is not defined)
+endif
+
+.PHONY: all
+all: $(TARGETS)
+.DEFAULT_GOAL: all
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
+clean::
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
+
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += -I../common/
+
+%.o: Makefile
+
+$(TARGET): $(TARGET).o
+	$(CC) $^ -o $@ $(LDFLAGS) $(APPEND_LDFLAGS)
+
+$(TARGETS): $(XEN_ROOT)/tools/tests/common/tests.o
+
+-include $(DEPS_INCLUDE)
+
diff --git a/tools/tests/migration/memory.c b/tools/tests/migration/memory.c
new file mode 100644
index 0000000000..e29a32af5d
--- /dev/null
+++ b/tools/tests/migration/memory.c
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "memory.h"
+
+#include <stddef.h>
+#include <stdint.h>
+
diff --git a/tools/tests/migration/memory.h b/tools/tests/migration/memory.h
new file mode 100644
index 0000000000..04ff88bf4d
--- /dev/null
+++ b/tools/tests/migration/memory.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <assert.h>
+#include <errno.h>
+#include <stddef.h>
+#include <stdlib.h>
+
+#include <xen-tools/common-macros.h>
+#include <xenctrl.h>
+
+/* A variable with the register qualifier cannot have its address taken,
+ * and is therefore cannot alias any pointer.
+ * The variable may or may not get stored in a register.
+ * */
+#define noalias register
+
+/** a writable region of memory, together with its size
+ *
+ * Invariant: buf[i] is valid, for all 0 <= i < n
+ * */
+struct wbuffer {
+  size_t n;
+  void *buf;
+  void *allocated;
+};
+
+/** a readable region of memory */
+struct rbuffer {
+  const size_t n;
+  const void *const buf;
+};
+
+/** A writable region of memory out of an array.
+ * This could be stack allocated, or not, but it needs to have a lifetime
+ * at least as long as the returned struct wbuffer.
+ *
+ * @parm A the array
+ */
+#define WBUFFER_OF_ARRAY(A)                                                    \
+  ((struct wbuffer){.n = ARRAY_SIZE(A), .buf = (A), .allocated = NULL})
+
+/** Allocates an aligned region of memory
+ *
+ * @parm alignment the desired alignment of the memory region
+ * @parm n the size in bytes of the memory region
+ * @return a struct wbuffer of n bytes, and alignment. On failure buf is NULL
+ * and errno is set.
+ */
+static inline struct wbuffer wbuffer_aligned_alloc(size_t alignment, size_t n) {
+  struct wbuffer b = {.allocated = NULL, .n = n};
+  errno = posix_memalign(&b.allocated, alignment, n);
+  b.buf = b.allocated;
+  return b;
+}
+
+/** A page from a buffer
+ *
+ * @parm b a struct wbuffer, holding at least a page
+ * @parm page_index which page to return
+ * @return a wbuffer refering to the requested page
+ * */
+static inline struct wbuffer wbuffer_sub(const struct wbuffer b[1],
+                                         size_t page_index) {
+  assert(page_index <= (b->n >> XC_PAGE_SHIFT));
+  return (struct wbuffer){.n = XC_PAGE_SIZE,
+                          .buf = b->buf + (page_index << XC_PAGE_SHIFT),
+                          .allocated = NULL};
+}
+
+/** Frees the wbuffer if it was allocated.
+ *
+ * It is safe to call this even when WBUFFER_OF_ARRAY was used to construct it.
+ * It only frees memory allocated by wbuffer_aligned_alloc.
+ *
+ * @parm struct wbuffer to free
+ * */
+static inline void wbuffer_free(struct wbuffer b[1]) {
+  b->n = 0;
+  b->buf = NULL;
+  free(b->allocated);
+}
+
+/** A readable region of memory out of an array.
+ * This could be stack allocated, or not, but it needs to have a lifetime
+ * at least as long as the returned struct rbuffer.
+ *
+ * @parm A the array
+ */
+#define RBUFFER_OF_ARRAY(A) ((struct rbuffer){.n = ARRAY_SIZE(A), .buf = (A)})
+
+static inline struct rbuffer rbuffer_of_wbuffer(const struct wbuffer b[1]) {
+  return (struct rbuffer){.n = b->n, .buf = b->buf};
+}
diff --git a/tools/tests/migration/patterns.c b/tools/tests/migration/patterns.c
new file mode 100644
index 0000000000..6ea6d5e1f9
--- /dev/null
+++ b/tools/tests/migration/patterns.c
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "patterns.h"
+
+#include <assert.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <string.h>
+
+void pattern_fill(size_t n, char dest[n], enum pattern_kind kind, uint64_t seed)
+{
+    switch ( kind )
+    {
+    case PATTERN_RANDOM:
+        /* not thread safe */
+        srandom(seed);
+        long l;
+        assert(sizeof(l) <= n);
+        memcpy(dest, &seed, sizeof(seed));
+        for ( size_t i = sizeof(seed); i < n; i += sizeof(l) )
+        {
+            l = random();
+            memcpy(&dest[i], &l, sizeof(l));
+        }
+        return;
+    case PATTERN_ADDR:
+        assert(sizeof(seed) <= n);
+        for ( size_t i = 0; i < n; i += sizeof(seed), seed += sizeof(seed) )
+            memcpy(&dest[i], &seed, sizeof(seed));
+        return;
+    }
+}
+
+void pattern_dirty(size_t n, char dest[n], size_t iteration)
+{
+    if ( n > 2 * sizeof(iteration) )
+        memcpy(&dest[sizeof(iteration)], &iteration, sizeof(iteration));
+}
+
+int pattern_cmp(size_t n, const char src[n], char tmp[n],
+                enum pattern_kind kind, uint64_t seed, size_t iteration)
+{
+    pattern_fill(n, tmp, kind, seed);
+    if ( iteration )
+        pattern_dirty(n, tmp, iteration);
+    return memcmp(src, tmp, n);
+}
+
+void pattern_hexdump(size_t n, const char src[n], FILE *out)
+{
+    for ( size_t i = 0; i < n; i++ )
+        fprintf(out, " %02x", (uint8_t)src[i]);
+}
+
+#define HEXDUMP_LINE 8
+
+void pattern_hexdump_diff(size_t n, const char a[n], const char b[n], FILE *out)
+{
+    fprintf(out, "0x%lx bytes\n", n);
+    fprintf(out, " off:%*s | %*s\n", HEXDUMP_LINE * 3, "expected",
+            HEXDUMP_LINE * 3, "actual");
+    for ( size_t i = 0; i < n; i += HEXDUMP_LINE )
+    {
+        size_t remaining = n - i;
+        size_t len = remaining < HEXDUMP_LINE ? remaining : HEXDUMP_LINE;
+        if ( !memcmp(&a[i], &b[i], len) )
+            continue;
+        /* show expected | actual side-by-side,
+         * but only when they are actually different */
+        fprintf(out, "\n %03zx:", i);
+        pattern_hexdump(len, &a[i], out);
+        fprintf(out, " | ");
+        pattern_hexdump(len, &b[i], out);
+        fprintf(out, "\n");
+    }
+    fprintf(out,"\n");
+}
diff --git a/tools/tests/migration/patterns.h b/tools/tests/migration/patterns.h
new file mode 100644
index 0000000000..e7187c3775
--- /dev/null
+++ b/tools/tests/migration/patterns.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+
+enum pattern_kind {
+    PATTERN_ADDR,
+    PATTERN_RANDOM
+};
+
+void pattern_fill(size_t n, char dest[n], enum pattern_kind kind,
+                  uint64_t seed);
+
+void pattern_dirty(size_t n, char dest[n], size_t iteration);
+
+int pattern_cmp(size_t n, const char src[n], char tmp[n],
+                enum pattern_kind kind, uint64_t seed, size_t iteration);
+
+void pattern_hexdump(size_t n, const char src[n], FILE *out);
+
+void pattern_hexdump_diff(size_t n, const char a[n], const char b[n],
+                          FILE *out);
diff --git a/tools/tests/migration/test-migration.c b/tools/tests/migration/test-migration.c
new file mode 100644
index 0000000000..b4dc87168f
--- /dev/null
+++ b/tools/tests/migration/test-migration.c
@@ -0,0 +1,713 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <err.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/socket.h>
+#include <time.h>
+
+#include <assert.h>
+#include <xen-tools/common-macros.h>
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xengnttab.h>
+#include <xenguest.h>
+#include <xendevicemodel.h>
+
+#include "guests.h"
+#include "tests.h"
+#include "xen_patterns.h"
+
+/* a prime number, to ensure it is not aligned */
+#define UNALIGNED_OFFSET 1367
+#define SKIP_UNALIGNED 7
+
+static enum pattern_kind patterns[] = { PATTERN_ADDR, PATTERN_RANDOM };
+
+/** Map pages i, where
+ * 0 <= i < contigous_pages
+ * || contiguous_pages + skip_pages <= i < 2*contiguous_pages + skip_pages
+ * ||...
+ * For a total number of mapped pages total_pages.
+ *
+ * Invariants:
+ *  contiguous_pages + skip_pages <= total_pages
+ *  contiguous_pages > 0
+ *  total_pages % (contiguous_pages + skip_pages) == 0
+ *  offset < alignment
+ */
+static struct batching_scenario {
+    size_t contiguous_pages;
+    size_t skip_pages;
+    size_t total_pages;
+    size_t alignment; /* userspace buffer alignment in bytes */
+    size_t offset;    /* userspace buffer offset in bytes */
+} batching_scenarios[] = {
+    { 1,    0,              1,    XC_PAGE_SIZE, 0                }
+    /* basic scenario: single page, full alignment */
+    ,
+    { 1,    0,              1,    XC_PAGE_SIZE, UNALIGNED_OFFSET }
+    /* basic scenario: single page, unaligned (prime number offset) */
+    ,
+    { 2,    0,              2,    XC_PAGE_SIZE, 0                }
+    /* basic scenario: batch of 2 pages, aligned */
+    ,
+    { 2,    0,              2,    XC_PAGE_SIZE, UNALIGNED_OFFSET }
+    /* basic scenario: batch of 2 pages, unaligned */
+    ,
+    { 1,    1,              4,    XC_PAGE_SIZE, 0                }
+    /* basic scenario: batch of 4 pages, with gaps, aligned */
+    ,
+    { 1,    1,              4,    XC_PAGE_SIZE, UNALIGNED_OFFSET }
+    /* basic scenario: batch of 4 pages, with gaps, unaligned */
+    ,
+    { 1024, 0,              1024, XC_PAGE_SIZE, 0                }
+    /* typical migration batch */
+    ,
+    { 2,    SKIP_UNALIGNED, 1017, XC_PAGE_SIZE, 0                }
+    /* migration batch with gaps */
+};
+
+static void print_batching_scenario(const struct batching_scenario s[1])
+{
+    printf(
+        "%zu pages = (%zu + %zu /* skip */) + ... /* %zu times */, align %zu " "+ %zu\n",
+        s->total_pages, s->contiguous_pages, s->skip_pages,
+        s->total_pages / (s->contiguous_pages + s->skip_pages), s->alignment,
+        s->offset);
+    assert(s->contiguous_pages + s->skip_pages <= s->total_pages);
+    assert(!(s->total_pages % (s->contiguous_pages + s->skip_pages)));
+    assert(s->offset < s->alignment);
+    assert(s->contiguous_pages > 0);
+}
+
+/** Writes pages with a given write scenario, and reads/verifies them with a
+ * read scenario. The pages in the read scenario must be a subset of the pages
+ * in the write scenario.
+ */
+struct scenario {
+    struct batching_scenario write_scenario;
+    struct batching_scenario read_verify_scenario;
+};
+
+static void print_scenario(const struct scenario s[1])
+{
+    printf("Write scenario:");
+    print_batching_scenario(&s->write_scenario);
+    printf("Read/verify scenario:");
+    print_batching_scenario(&s->read_verify_scenario);
+    assert(s->read_verify_scenario.total_pages <=
+           s->write_scenario.total_pages);
+}
+
+#define TEST_PFN 0xde
+static size_t pfns_of_scenario(xen_pfn_t pfn_start, xen_pfn_t pfn_end, size_t n,
+                               xen_pfn_t pfns[n],
+                               const struct batching_scenario s[1])
+{
+    xen_pfn_t pfn = pfn_start;
+    size_t i;
+    for ( i = 0; i < n && pfn < pfn_end; )
+    {
+        assert(s->contiguous_pages > 0);
+        for ( size_t j = 0; j < s->contiguous_pages && pfn < pfn_end; j++ )
+        {
+            assert(i < n);
+            xen_pfn_t p = pfn++;
+            if (p != TEST_PFN)
+            pfns[i++] = p;
+        }
+        pfn += s->skip_pages;
+    }
+    return i;
+}
+
+struct buffer {
+    size_t n;
+    void *buf;
+    void *allocated;
+};
+
+typedef void (*scenario_callback)(struct buffer b[1], domid_t domid, size_t n,
+                                  xen_pfn_t pfns[n],
+                                  const struct batching_scenario s[1]);
+
+#define MAX_BATCH_SIZE 1024
+
+static void run_scenarios(scenario_callback write_begin,
+                          scenario_callback write_end,
+                          scenario_callback read_begin,
+                          scenario_callback read_end, domid_t domid,
+                          xen_pfn_t pfn_start, size_t nr_pages,
+                          size_t iterations)
+{
+    struct scenario s;
+    for ( size_t i = 0; i < 2 * ARRAY_SIZE(batching_scenarios) + 1; i++ )
+    {
+        if ( i < ARRAY_SIZE(batching_scenarios) )
+        {
+            s.write_scenario = batching_scenarios[i];
+        }
+        else
+        {
+            /* full memory */
+            s.write_scenario = (struct batching_scenario){
+                .contiguous_pages = nr_pages,
+                .skip_pages = 0,
+                .total_pages = nr_pages,
+                .alignment = XC_PAGE_SIZE * (XC_PAGE_SIZE / sizeof(void *)),
+                .offset = 0
+            };
+        }
+
+        if ( i < 2 * ARRAY_SIZE(batching_scenarios) )
+        {
+            s.read_verify_scenario =
+                batching_scenarios[i % ARRAY_SIZE(batching_scenarios)];
+        }
+        else
+        {
+            /* full memory */
+            s.read_verify_scenario = s.write_scenario;
+        }
+
+        print_scenario(&s);
+
+        xen_pfn_t wpfn = pfn_start, rpfn = pfn_start;
+        xen_pfn_t wpfn_end = pfn_start +
+                             MIN(nr_pages, s.write_scenario.total_pages);
+        xen_pfn_t rpfn_end = pfn_start +
+                             MIN(nr_pages, s.read_verify_scenario.total_pages);
+        xen_pfn_t wpfns[MAX_BATCH_SIZE], rpfns[MAX_BATCH_SIZE];
+
+        while ( wpfn < wpfn_end || rpfn < rpfn_end )
+        {
+            size_t wbatch = min(ARRAY_SIZE(wpfns), wpfn_end - wpfn);
+            if ( wbatch > 0 )
+                wbatch = pfns_of_scenario(wpfn, wpfn + wbatch, wbatch, wpfns,
+                                          &s.write_scenario);
+            if ( wbatch > 0 )
+                wpfn = wpfns[wbatch - 1] + s.write_scenario.skip_pages + 1;
+            size_t rbatch = min(ARRAY_SIZE(rpfns), rpfn_end - rpfn);
+            if ( rbatch > 0 )
+                rbatch = pfns_of_scenario(rpfn, rpfn + rbatch, rbatch, rpfns,
+                                          &s.read_verify_scenario);
+            if ( rbatch > 0 )
+                rpfn = rpfns[rbatch - 1] + s.read_verify_scenario.skip_pages +
+                       1;
+
+            for ( size_t i = 0; i < ARRAY_SIZE(patterns); i++ )
+            {
+                /* dirty won't work with copy! we don't have the old buffer */
+                for ( size_t iteration = 0; iteration < 1; iteration++ )
+                {
+                    const enum pattern_kind kind = patterns[i];
+                    if ( wbatch > 0 )
+                    {
+                        struct buffer wb = { .n = 0, .buf = NULL };
+                        // printf("write_begin()\n");
+                        write_begin(&wb, domid, wbatch, wpfns,
+                                    &s.write_scenario);
+                        if ( iteration )
+                            xen_dirty_pages(wb.n, wb.buf, iteration);
+                        else
+                        {
+                            xen_pattern_fill(wb.n, wb.buf, kind, domid, wbatch,
+                                             wpfns);
+                        }
+                        // printf("write_end()\n");
+                        write_end(&wb, domid, wbatch, wpfns, &s.write_scenario);
+                        assert(!wb.buf);
+                    }
+
+                    if ( rbatch > 0 )
+                    {
+                        struct buffer rb = { .n = 0, .buf = NULL };
+                        // printf("read_begin()\n");
+                        read_begin(&rb, domid, rbatch, rpfns,
+                                   &s.read_verify_scenario);
+                        xen_pattern_check(rb.n, rb.buf, kind, domid, rbatch,
+                                          rpfns, iteration);
+                        // printf("read_end()\n");
+                        read_end(&rb, domid, rbatch, rpfns,
+                                 &s.read_verify_scenario);
+                        assert(!rb.buf);
+                    }
+                }
+            }
+        }
+    }
+}
+
+static xenforeignmemory_handle *fmem;
+struct xendevicemodel_handle *xdm;
+
+
+static void xfm_map_prot(int prot, struct buffer b[1], domid_t domid, size_t n,
+                         xen_pfn_t pfns[n])
+{
+    int *errs = malloc(n * sizeof(*errs));
+    assert(errs);
+
+    assert(fmem);
+    b->n = n * XC_PAGE_SIZE;
+    b->buf = xenforeignmemory_map(fmem, domid, prot, n, pfns, errs);
+    if ( !b->buf )
+        err(1, "xenforeignmemory_map(domid:%u, pages: %zu) failed: %d - %s",
+            domid, n, errno, strerror(errno));
+    for ( size_t i = 0; i < n; i++ )
+        if ( errs[i] )
+            err(1, "xenforeignmemory_map(%u).err[%zu]: %d - %s", domid, i,
+                -errs[i], strerror(-errs[i]));
+    free(errs);
+}
+
+static void xfm_map_write(struct buffer b[1], domid_t domid, size_t n,
+                          xen_pfn_t pfns[n],
+                          const struct batching_scenario s[1])
+{
+    xfm_map_prot(PROT_WRITE, b, domid, n, pfns);
+}
+
+static void xfm_map_read(struct buffer b[1], domid_t domid, size_t n,
+                         xen_pfn_t pfns[n], const struct batching_scenario s[1])
+{
+    xfm_map_prot(PROT_READ, b, domid, n, pfns);
+}
+
+static void xfm_unmap(struct buffer b[1], domid_t domid, size_t n,
+                      xen_pfn_t pfns[n], const struct batching_scenario s[1])
+{
+    assert(b->buf);
+    assert(fmem);
+    if ( xenforeignmemory_unmap(fmem, b->buf, b->n / XC_PAGE_SIZE) )
+        err(1, "xenforeignmemory_unmap(%u, %p): %d - %s", domid, b->buf, errno,
+            strerror(errno));
+    b->buf = NULL;
+}
+
+static void test_foreign_map_unmap(domid_t domid, xen_pfn_t pfn, uint8_t fill)
+{
+    char page[XC_PAGE_SIZE];
+    void *mapping = xenforeignmemory_map(fmem, domid, PROT_WRITE, 1, &pfn,
+                                         NULL);
+    // printf("%p = xenforeignmemory_map(%u, PROT_WRITE, PFN %zu)\n", mapping,
+    //        domid, pfn);
+    if ( !mapping )
+        err(1,
+            "xenforeignmemory_map(domid:%u, PROT_WRITE, %zu) failed: %d - %s",
+            domid, pfn, errno, strerror(errno));
+    memset(mapping, fill, XC_PAGE_SIZE);
+    memset(page, fill, sizeof(page));
+    // printf("memset(%p, 0x%02x, %zu)\n", page, fill, sizeof(page));
+    xenforeignmemory_unmap(fmem, mapping, 1);
+
+    mapping = xenforeignmemory_map(fmem, domid, PROT_READ, 1, &pfn, NULL);
+    // printf("%p = xenforeignmemory_map(%u, PROT_READ, PFN %zu)\n", mapping,
+    //        domid, pfn);
+    if ( !mapping )
+        err(1, "xenforeignmemory_map(domid:%u, READ, %zu) failed: %d - %s",
+            domid, pfn, errno, strerror(errno));
+    if ( memcmp(mapping, page, sizeof(page)) )
+    {
+        pattern_hexdump_diff(sizeof(page), page, mapping, stdout);
+        fail("write/read mismatch");
+    }
+    xenforeignmemory_unmap(fmem, mapping, 1);
+}
+
+struct test_migration {
+    pthread_t sender;
+    pthread_t receiver;
+    domid_t orig;
+    int fds[2];
+};
+
+#define TEST_ORDER 17
+#define TEST_SMALL_ORDER 11
+static xen_pfn_t wrpfns[1 << TEST_ORDER];
+
+static void test_migration_fill(domid_t domid, enum pattern_kind kind)
+{
+    struct buffer rb = { .n = 0, .buf = NULL };
+    struct batching_scenario scenario = { ARRAY_SIZE(wrpfns), 0,
+                                          ARRAY_SIZE(wrpfns), XC_PAGE_SIZE, 0 };
+    pfns_of_scenario(0, ARRAY_SIZE(wrpfns), ARRAY_SIZE(wrpfns), wrpfns,
+                     &scenario);
+
+    xfm_map_prot(PROT_WRITE, &rb, domid, ARRAY_SIZE(wrpfns), wrpfns);
+    xen_pattern_fill(rb.n, rb.buf, kind, domid, ARRAY_SIZE(wrpfns), wrpfns);
+    xfm_unmap(&rb, domid, ARRAY_SIZE(wrpfns), wrpfns, &scenario);
+}
+
+static void test_migration_check(domid_t domid, domid_t domid_check,
+                                 enum pattern_kind kind)
+{
+    struct buffer rb = { .n = 0, .buf = NULL };
+    struct batching_scenario scenario = { ARRAY_SIZE(wrpfns), 0,
+                                          ARRAY_SIZE(wrpfns), XC_PAGE_SIZE, 0 };
+    pfns_of_scenario(0, ARRAY_SIZE(wrpfns), ARRAY_SIZE(wrpfns), wrpfns,
+                     &scenario);
+
+    xfm_map_prot(PROT_READ, &rb, domid, ARRAY_SIZE(wrpfns), wrpfns);
+    xen_pattern_check(rb.n, rb.buf, kind, domid_check, ARRAY_SIZE(wrpfns),
+                      wrpfns, 0);
+    xfm_unmap(&rb, domid, ARRAY_SIZE(wrpfns), wrpfns, batching_scenarios);
+}
+
+static int test_migration_suspend(void *data)
+{
+    struct test_migration *m = data;
+    assert(m);
+    if ( xc_domain_shutdown(xch, m->orig, SHUTDOWN_suspend) )
+    {
+        fail("xc_domain_shutdown failed: %d - %s", errno, strerror(errno));
+        return 0;
+    }
+    struct xen_domctl_getdomaininfo info;
+    do
+    {
+        if ( xc_domain_getinfo_single(xch, m->orig, &info) )
+        {
+            fail("xc_domain_getinfo_single failed: %d - %s", errno,
+                 strerror(errno));
+            return 0;
+        }
+        if ( info.flags & XEN_DOMINF_shutdown )
+            break;
+        usleep(4000);
+    } while ( 1 );
+
+    /* create some non-migratable pages, but this confuses the rest of the tests */
+    if (xendevicemodel_set_mem_type(xdm, m->orig, HVMMEM_mmio_dm, TEST_PFN, 1))
+        fail("xendevicemodel_set_mem_type: %d - %s", errno, strerror(errno));
+
+    return 1;
+}
+
+static int test_migration_postcopy(void *data)
+{
+    return 0;
+}
+
+static int test_migration_checkpoint(void *data)
+{
+    return 0;
+}
+
+static int test_migration_wait_checkpoint(void *data)
+{
+    return 0;
+}
+
+static int test_switch_qemu_logdirty(uint32_t domid, unsigned enable,
+                                     void *data)
+{
+    return 0;
+}
+
+static int test_migration_restore_static_data_done(unsigned int missing,
+                                                   void *data)
+{
+    return 0;
+}
+
+static void test_migration_restore_results(xen_pfn_t store_gfn,
+                                           xen_pfn_t console_gfn, void *data)
+{}
+
+static struct timespec save_start, save_end, restore_end;
+
+static void print_diff(const char name[static 1], const struct timespec start[1], const struct timespec stop[1])
+{
+    double dt = (stop->tv_sec - start->tv_sec) + (stop->tv_nsec - start->tv_nsec) * 1e-9;
+    printf("Performance of '%s': %.9fs\n", name, dt);
+}
+
+static void *test_migration_receiver(void *arg)
+{
+    struct test_migration *m = arg;
+    assert(m);
+
+    struct restore_callbacks restore_callbacks = {
+        .static_data_done = test_migration_restore_static_data_done,
+        .suspend = test_migration_suspend,
+        .postcopy = test_migration_postcopy,
+        .checkpoint = test_migration_checkpoint,
+        .wait_checkpoint = test_migration_wait_checkpoint,
+        .restore_results = test_migration_restore_results,
+        .data = m
+    };
+
+    uint32_t domid = -1;
+    struct xen_domctl_createdomain c = {
+            .flags = XEN_DOMCTL_CDF_hvm,
+            .max_vcpus = 1,
+            .max_grant_frames = 1,
+            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+            .arch = {
+#ifdef __x86_64__
+                .emulation_flags = XEN_X86_EMU_LAPIC,
+#endif
+            },
+        };
+    if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
+        c.flags |= XEN_DOMCTL_CDF_hap;
+    int rc = xc_domain_create(xch, &domid, &c);
+    if ( rc )
+        err(1, "xc_domain_create");
+    rc = xc_domain_max_vcpus(xch, domid, 1);
+    if ( rc )
+        fail("xc_domain_max_vcpus(%d, 1) failed: %d - %s", domid, errno,
+             strerror(errno));
+    rc = xc_domain_setmaxmem(xch, domid, -1);
+    if ( rc )
+        err(1, "  Failed to set maxmem: %d - %s\n", errno, strerror(errno));
+
+    unsigned long store_mfn, console_mfn;
+    printf("xc_domain_restore(fd:%d, domid:%d)\n", m->fds[1], domid);
+    if ( xc_domain_restore(xch, m->fds[1], domid, 0, &store_mfn, 0, 1,
+                           &console_mfn, 0, XC_STREAM_PLAIN, &restore_callbacks,
+                           -1, 0) &&
+         errno != ENODEV )
+    {
+        fail("xc_domain_restore(domid: %d, fd: %d) failed: %d - %s", m->orig,
+             m->fds[1], errno, strerror(errno));
+    }
+    if ( clock_gettime(CLOCK_MONOTONIC, &restore_end) )
+    {
+        fail("clock_gettime failed: %d - %s", errno, strerror(errno));
+    }
+
+    test_migration_check(domid, m->orig, PATTERN_ADDR);
+
+    int fd = m->fds[1];
+    m->fds[1] = -1;
+    if ( close(fd) )
+        err(1, "close(%d)", fd);
+    rc = xc_domain_destroy(xch, domid);
+    if ( rc )
+        err(1, "xc_domain_destroy");
+    return NULL;
+}
+
+
+static void *test_migration_sender(void *arg)
+{
+    struct test_migration *m = arg;
+    assert(m);
+
+
+    struct save_callbacks save_callbacks = {
+        .suspend = test_migration_suspend,
+        .precopy_policy = XGS_POLICY_CONTINUE_PRECOPY,
+        .postcopy = test_migration_postcopy,
+        .checkpoint = test_migration_checkpoint,
+        .wait_checkpoint = test_migration_wait_checkpoint,
+        .switch_qemu_logdirty = test_switch_qemu_logdirty,
+        .data = m
+    };
+    printf("xc_domain_save(fd:%d, domid:%d)\n", m->fds[0], m->orig);
+
+    test_migration_fill(m->orig, PATTERN_ADDR);
+    test_migration_check(m->orig, m->orig, PATTERN_ADDR);
+
+    if ( clock_gettime(CLOCK_MONOTONIC, &save_start) )
+    {
+        fail("clock_gettime failed: %d - %s", errno, strerror(errno));
+    }
+
+    if ( xc_domain_save(xch, m->fds[0], m->orig, XCFLAGS_LIVE | XCFLAGS_DEBUG,
+                        &save_callbacks, XC_STREAM_PLAIN, -1) )
+    {
+        fail("xc_domain_save(domid: %d, fd: %d) failed: %d - %s", m->orig,
+             m->fds[0], errno, strerror(errno));
+    }
+    if ( clock_gettime(CLOCK_MONOTONIC, &save_end) )
+    {
+        fail("clock_gettime failed: %d - %s", errno, strerror(errno));
+    }
+    int fd = m->fds[0];
+    m->fds[0] = -1;
+    if ( close(fd) )
+        err(1, "close(%d)", fd);
+
+    /* we don't expect the migration to actually succeed, so resume original,
+     * so we can try again */
+    if ( xc_domain_resume(xch, m->orig, 0) )
+    {
+        fail("xc_domain_resume(domid: %d) failed: %d - %s", m->orig, errno,
+             strerror(errno));
+    }
+
+    return NULL;
+}
+
+void test_guest_domid(domid_t domid)
+{
+    int rc;
+
+    rc = xc_domain_max_vcpus(xch, domid, 1);
+    if ( rc )
+        return fail("xc_domain_max_vcpus(%d, 1) failed: %d - %s", domid, errno,
+                    strerror(errno));
+
+    rc = xc_domain_setmaxmem(xch, domid, -1);
+    if ( rc )
+        return fail("  Failed to set maxmem: %d - %s\n", errno,
+                    strerror(errno));
+
+    xen_pfn_t ram[] = { 0 };
+    unsigned extent_order = TEST_ORDER;
+    rc = xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(ram),
+                                          extent_order, 0, ram);
+    if ( rc )
+        return fail("  Failed to populate physmap domain: %d - %s\n", errno,
+                    strerror(errno));
+
+    printf("Allocated PFN: %lx\n", ram[0]);
+
+    fmem = xenforeignmemory_open(NULL, 0);
+    if ( !fmem )
+        return fail("xenforeignmemory_open: %d - %s", errno, strerror(errno));
+
+    xdm = xendevicemodel_open(NULL, 0);
+    if (!xdm)
+        return fail("xendevicemodel_open: %d - %s", errno, strerror(errno));
+
+    printf("\nbasic 1 page test:\n");
+    test_foreign_map_unmap(domid, ram[0], 0xc1);
+    test_foreign_map_unmap(domid, ram[0], domid);
+
+    printf("\nxenforeignmemory_map:\n");
+    run_scenarios(xfm_map_write, xfm_unmap, xfm_map_read, xfm_unmap, domid,
+                  ram[0], 1 << TEST_SMALL_ORDER, 2);
+
+    const char *repeat_str = getenv("REPEAT");
+    unsigned repeat = repeat_str ? atoi(repeat_str) : 1;
+
+    for (unsigned r = 0; r < repeat; r++) {
+        struct test_migration m;
+        if ( socketpair(AF_UNIX, SOCK_STREAM, 0, m.fds) < 0 )
+            err(1, "socketpair");
+
+        m.orig = domid;
+        rc = pthread_create(&m.sender, NULL, test_migration_sender, &m);
+        if ( rc )
+        {
+            errno = rc;
+            err(1, "pthread_create(%d) failed", 0);
+        }
+        rc = pthread_create(&m.receiver, NULL, test_migration_receiver, &m);
+        if ( rc )
+        {
+            errno = rc;
+            err(1, "pthread_create(%d) failed", 0);
+        }
+        rc = pthread_join(m.sender, NULL);
+        if ( rc )
+        {
+            errno = rc;
+            err(1, "pthread_join(%d) failed", 0);
+        }
+        rc = pthread_join(m.receiver, NULL);
+        if ( rc )
+        {
+            errno = rc;
+            err(1, "pthread_join(%d) failed", 0);
+        }
+        for ( size_t i = 0; i < 2; i++ )
+        {
+            const int fd = m.fds[i];
+            m.fds[i] = -1;
+            if ( fd >= 0 && close(fd) )
+                err(1, "close(%d)", fd);
+        }
+
+        printf("Migration complete: %u pages\n", 1 << TEST_ORDER);
+        print_diff("xc_domain_save", &save_start, &save_end);
+        print_diff("xc_domain_restore", &save_start, &restore_end);
+    }
+}
+
+int test_main(int argc, char *argv[argc + 1])
+{
+    printf("Migration tests\n");
+
+    fmem = xenforeignmemory_open(NULL, 0);
+    if ( !fmem )
+        fail("xenforeignmemory_open: %d - %s", errno, strerror(errno));
+    test_guest_init();
+    test_guests();
+
+    int domains = argc - 1;
+    if ( domains > 0 )
+    {
+        struct test_migration *migrations = calloc(domains,
+                                                   sizeof(*migrations));
+        if ( !migrations )
+            err(1, "calloc(%d)", domains);
+
+        for ( int j = 0; j < argc - 1; j++ )
+        {
+            struct test_migration *m = &migrations[j];
+            m->orig = atoi(argv[j + 1]);
+            if ( socketpair(AF_UNIX, SOCK_STREAM, 0, m->fds) < 0 )
+                err(1, "socketpair");
+            int rc = pthread_create(&m->sender, NULL, test_migration_sender, m);
+            if ( rc )
+            {
+                errno = rc;
+                err(1, "pthread_create(%d) failed", j);
+            }
+            rc = pthread_create(&m->receiver, NULL, test_migration_receiver, m);
+            if ( rc )
+            {
+                errno = rc;
+                err(1, "pthread_create(%d) failed", j);
+            }
+        }
+
+        for ( int j = 0; j < argc - 1; j++ )
+        {
+            struct test_migration *m = &migrations[j];
+            int rc = pthread_join(m->sender, NULL);
+            if ( rc )
+            {
+                errno = rc;
+                err(1, "pthread_join(%d) failed", j);
+            }
+            rc = pthread_join(m->receiver, NULL);
+            if ( rc )
+            {
+                errno = rc;
+                err(1, "pthread_join(%d) failed", j);
+            }
+            for ( size_t i = 0; i < 2; i++ )
+            {
+                const int fd = m->fds[i];
+                m->fds[i] = -1;
+                if ( fd >= 0 && close(fd) )
+                    err(1, "close(%d)", fd);
+            }
+        }
+    }
+    xenforeignmemory_close(fmem);
+    fmem = NULL;
+
+    return !!nr_failures;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/migration/xen_patterns.c b/tools/tests/migration/xen_patterns.c
new file mode 100644
index 0000000000..6f7835cb1c
--- /dev/null
+++ b/tools/tests/migration/xen_patterns.c
@@ -0,0 +1,92 @@
+#include "xen_patterns.h"
+#include "tests.h"
+
+#include <assert.h>
+#include <stdbool.h>
+#include <string.h>
+
+struct iter {
+    size_t nr_pages;
+    const xen_pfn_t *pfns;
+    size_t i;
+    size_t offset;
+    uint64_t seed;
+    domid_t domid;
+};
+
+static inline void iter_init(struct iter it[1], size_t n, domid_t domid,
+                             size_t nr_pages, const xen_pfn_t pfns[nr_pages])
+{
+    assert(!(n % XC_PAGE_SIZE));
+    assert(n >> XC_PAGE_SHIFT >= nr_pages);
+
+    memset(it, 0xcc, sizeof(*it));
+
+    it->nr_pages = nr_pages;
+    it->pfns = pfns;
+    it->offset = it->i = 0;
+    it->domid = domid;
+    it->seed = (((uint64_t)it->domid) << 48) | it->pfns[0];
+}
+
+static bool iter_done(const struct iter it[1])
+{
+    return it->i >= it->nr_pages;
+}
+
+static inline void iter_next(struct iter it[1])
+{
+    assert(!iter_done(it));
+    it->seed = (((uint64_t)it->domid) << 48) | it->pfns[++it->i];
+    it->offset += XC_PAGE_SIZE;
+}
+
+void xen_pattern_fill(size_t n, char dest[n], enum pattern_kind kind,
+                      domid_t domid, size_t nr_pages,
+                      const xen_pfn_t pfns[nr_pages])
+{
+    assert(dest);
+    assert(pfns);
+    struct iter it;
+    for ( iter_init(&it, n, domid, nr_pages, pfns); !iter_done(&it);
+          iter_next(&it) )
+    {
+        assert(it.offset < n);
+        assert(it.offset + XC_PAGE_SIZE <= n);
+        pattern_fill(XC_PAGE_SIZE, &dest[it.offset], kind, it.seed);
+    }
+}
+
+void xen_dirty_pages(size_t n, char dest[n], size_t iteration)
+{
+    assert(!(n % XC_PAGE_SIZE));
+    for ( size_t i = 0; i < n; i += XC_PAGE_SIZE )
+        pattern_dirty(n - i, &dest[i], iteration);
+}
+
+void xen_pattern_check(size_t n, const char src[n], enum pattern_kind kind,
+                       domid_t domid, size_t nr_pages,
+                       const xen_pfn_t pfns[nr_pages], size_t iteration)
+{
+    assert(src);
+    assert(pfns);
+    struct iter it;
+    char page[XC_PAGE_SIZE];
+    size_t failures = 0;
+
+    for ( iter_init(&it, n, domid, nr_pages, pfns); !iter_done(&it);
+          iter_next(&it) )
+    {
+        const char *s = &src[it.offset];
+        if ( !pattern_cmp(sizeof(page), s, page, kind, it.seed, iteration) )
+            continue;
+        if ( failures++ < 5 ) /* don't flood the output */ {
+            pattern_hexdump_diff(sizeof(page), page, s, stdout);
+            printf("PFN: 0x%lx\n", it.pfns[it.i]);
+        }
+    }
+
+    if ( failures > 0 )
+        fail("Corrupted %zu/%zu pages at iteration %zu, pattern %u\n", failures,
+             nr_pages, iteration, kind);
+}
diff --git a/tools/tests/migration/xen_patterns.h b/tools/tests/migration/xen_patterns.h
new file mode 100644
index 0000000000..1470235f07
--- /dev/null
+++ b/tools/tests/migration/xen_patterns.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "patterns.h"
+
+#include <xenctrl.h>
+
+void xen_pattern_fill(size_t n, char dest[n], enum pattern_kind kind,
+                      domid_t domid, size_t nr_pages,
+                      const xen_pfn_t pfns[nr_pages]);
+
+void xen_pattern_check(size_t n, const char src[n], enum pattern_kind kind,
+                       domid_t domid, size_t nr_pages,
+                       const xen_pfn_t pfns[nr_pages], size_t iteration);
+
+void xen_dirty_pages(size_t n, char dest[n], size_t iteration);
-- 
2.47.3


