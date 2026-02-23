Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMjjBYoonGl1AAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6BE174A9D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238756.1540303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxL-0003Vm-3s; Mon, 23 Feb 2026 10:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238756.1540303; Mon, 23 Feb 2026 10:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxK-0003Rm-T7; Mon, 23 Feb 2026 10:14:22 +0000
Received: by outflank-mailman (input) for mailman id 1238756;
 Mon, 23 Feb 2026 10:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxJ-0003AC-JP
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:21 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a958069-10a0-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:14:20 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 7ECE04122496;
 Mon, 23 Feb 2026 05:14:00 -0500 (EST)
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
X-Inumbo-ID: 6a958069-10a0-11f1-b164-2bf370ae4941
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH 4/7] tools/tests: factor out common helpers
Date: Mon, 23 Feb 2026 10:14:08 +0000
Message-ID: <1fc62b8c258f9113c8bfd6401b71c411707fc3f7.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.35 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: AA6BE174A9D
X-Rspamd-Action: no action

Share fail/verify macros, and the handling or nr_failures.
The tests will no longer have a `main` function, but instead have a
`test_main`. This ensures that `nr_failures` is handled consistently.

This'll make it easier to write new tests that are consistent with the
existing ones, without having to copy/paste.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/Rules.mk                           |  3 +++
 tools/tests/common/tests.c                     | 15 +++++++++++++++
 tools/tests/common/tests.h                     | 18 ++++++++++++++++++
 tools/tests/cpu-policy/test-cpu-policy.c       |  7 +------
 tools/tests/domid/test-domid.c                 | 11 ++---------
 tools/tests/mem-claim/test-mem-claim.c         |  9 ++-------
 .../tests/paging-mempool/test-paging-mempool.c |  9 ++-------
 tools/tests/pdx/test-pdx.c                     |  3 ++-
 tools/tests/rangeset/test-rangeset.c           |  3 ++-
 tools/tests/resource/test-resource.c           |  9 ++-------
 tools/tests/tsx/test-tsx.c                     | 10 ++--------
 tools/tests/vpci/main.c                        |  4 ++--
 tools/tests/xenstore/test-xenstore.c           |  4 +++-
 13 files changed, 56 insertions(+), 49 deletions(-)
 create mode 100644 tools/tests/common/tests.c
 create mode 100644 tools/tests/common/tests.h

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
index 2de9e94546..9e03e1e0b8 100644
--- a/tools/tests/Rules.mk
+++ b/tools/tests/Rules.mk
@@ -47,11 +47,14 @@ uninstall:
 
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += -I../common/
 
 %.o: Makefile
 
 $(TARGET): $(TARGET).o
 	$(CC) $^ -o $@ $(LDFLAGS) $(APPEND_LDFLAGS)
 
+$(TARGETS): $(XEN_ROOT)/tools/tests/common/tests.o
+
 -include $(DEPS_INCLUDE)
 
diff --git a/tools/tests/common/tests.c b/tools/tests/common/tests.c
new file mode 100644
index 0000000000..43d9ea5442
--- /dev/null
+++ b/tools/tests/common/tests.c
@@ -0,0 +1,15 @@
+#include "tests.h"
+
+unsigned int nr_failures;
+
+int main(int argc, char *argv[argc+1])
+{
+    int rc = test_main(argc, argv);
+
+    if ( nr_failures )
+        printf("Done: %u failures\n", nr_failures);
+    else
+        printf("Done: all ok\n");
+
+    return rc ? rc : !!nr_failures;
+}
diff --git a/tools/tests/common/tests.h b/tools/tests/common/tests.h
new file mode 100644
index 0000000000..f0df616e3e
--- /dev/null
+++ b/tools/tests/common/tests.h
@@ -0,0 +1,18 @@
+#include <stdio.h>
+#include <sysexits.h>
+
+extern unsigned int nr_failures;
+
+#define fail(fmt, ...)                          \
+({                                              \
+    nr_failures++;                              \
+    (void)printf(fmt, ##__VA_ARGS__);           \
+})
+
+#define verify(exp, fmt, args...) \
+while (!(exp)) { \
+    printf(fmt, ## args); \
+    exit(EX_SOFTWARE); \
+}
+
+extern int test_main(int argc, char *argv[argc+1]);
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c002..67a36c80d5 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -650,7 +650,7 @@ static void test_is_compatible_failure(void)
     }
 }
 
-int main(int argc, char **argv)
+int test_main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
 
@@ -667,10 +667,5 @@ int main(int argc, char **argv)
     test_is_compatible_success();
     test_is_compatible_failure();
 
-    if ( nr_failures )
-        printf("Done: %u failures\n", nr_failures);
-    else
-        printf("Done: all ok\n");
-
     return !!nr_failures;
 }
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
index 5915c4699a..de39bae8b0 100644
--- a/tools/tests/domid/test-domid.c
+++ b/tools/tests/domid/test-domid.c
@@ -5,20 +5,13 @@
  * Copyright 2025 Ford Motor Company
  */
 
-#include <sysexits.h>
-
+#include "tests.h"
 #include "harness.h"
 
-#define verify(exp, fmt, args...) \
-while (!(exp)) { \
-    printf(fmt, ## args); \
-    exit(EX_SOFTWARE); \
-}
-
 /*
  * Fail on the first error, since tests are dependent on each other.
  */
-int main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     domid_t expected, allocated;
 
diff --git a/tools/tests/mem-claim/test-mem-claim.c b/tools/tests/mem-claim/test-mem-claim.c
index ad038e45d1..1f3c70aace 100644
--- a/tools/tests/mem-claim/test-mem-claim.c
+++ b/tools/tests/mem-claim/test-mem-claim.c
@@ -11,12 +11,7 @@
 #include <xengnttab.h>
 #include <xen-tools/common-macros.h>
 
-static unsigned int nr_failures;
-#define fail(fmt, ...)                          \
-({                                              \
-    nr_failures++;                              \
-    (void)printf(fmt, ##__VA_ARGS__);           \
-})
+#include "tests.h"
 
 #define MB_PAGES(x) (MB(x) / XC_PAGE_SIZE)
 
@@ -158,7 +153,7 @@ static void run_tests(void)
                     physinfo.outstanding_pages);
 }
 
-int main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     int rc;
 
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455a..27fd109031 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -10,12 +10,7 @@
 #include <xengnttab.h>
 #include <xen-tools/common-macros.h>
 
-static unsigned int nr_failures;
-#define fail(fmt, ...)                          \
-({                                              \
-    nr_failures++;                              \
-    (void)printf(fmt, ##__VA_ARGS__);           \
-})
+#include "tests.h"
 
 static xc_interface *xch;
 static uint32_t domid;
@@ -136,7 +131,7 @@ static void run_tests(void)
                     64 << 20, size_bytes);
 }
 
-int main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     int rc;
 
diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index eefd54c768..d2d143ec76 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Cloud Software Group
  */
 
+#include "tests.h"
 #include "harness.h"
 
 #include "../../xen/common/pdx.c"
@@ -29,7 +30,7 @@ static void print_ranges(const struct range *r)
     }
 }
 
-int main(int argc, char **argv)
+int main(int argc, char *argv[argc+1])
 {
     static const struct {
         struct range ranges[MAX_RANGES];
diff --git a/tools/tests/rangeset/test-rangeset.c b/tools/tests/rangeset/test-rangeset.c
index c14a908b4f..3f8ac95097 100644
--- a/tools/tests/rangeset/test-rangeset.c
+++ b/tools/tests/rangeset/test-rangeset.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Cloud Software Group
  */
 
+#include "tests.h"
 #include "harness.h"
 
 struct range {
@@ -140,7 +141,7 @@ static void print_both(struct rangeset *r, const struct range *expected,
         printf("[%ld, %ld]\n", expected[i].start, expected[i].end);
 }
 
-int main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     struct rangeset *r = rangeset_new(NULL, NULL, 0);
     unsigned int i;
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index a7f2d04643..4155b62507 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -9,12 +9,7 @@
 #include <xengnttab.h>
 #include <xen-tools/common-macros.h>
 
-static unsigned int nr_failures;
-#define fail(fmt, ...)                          \
-({                                              \
-    nr_failures++;                              \
-    (void)printf(fmt, ##__VA_ARGS__);           \
-})
+#include "tests.h"
 
 static xc_interface *xch;
 static xenforeignmemory_handle *fh;
@@ -255,7 +250,7 @@ static void test_domain_configurations(void)
     }
 }
 
-int main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     int rc;
 
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index 5af04953f3..ab099e9038 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -30,6 +30,7 @@
 #include <xenguest.h>
 #include <xen-tools/common-macros.h>
 
+#include "tests.h"
 #include "xg_private.h"
 
 enum {
@@ -44,13 +45,6 @@ enum {
 #define MSR_TSX_CTRL                        0x00000122
 #define MSR_MCU_OPT_CTRL                    0x00000123
 
-static unsigned int nr_failures;
-#define fail(fmt, ...)                          \
-({                                              \
-    nr_failures++;                              \
-    (void)printf(fmt, ##__VA_ARGS__);           \
-})
-
 static xc_interface *xch;
 
 /*
@@ -540,7 +534,7 @@ static void test_tsx(void)
     test_guests();
 }
 
-int main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     printf("TSX tests\n");
 
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 3753417e86..0e4f24aace 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -16,6 +16,7 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "tests.h"
 #include "emul.h"
 
 /* Single vcpu (current), and single domain with a single PCI device. */
@@ -175,8 +176,7 @@ void multiwrite4_check(unsigned int reg)
     multiread4_check(reg, val);
 }
 
-int
-main(int argc, char **argv)
+int test_main(int argc, char *argv[argc+1])
 {
     /* Index storage by offset. */
     uint32_t r0 = 0xdeadbeef;
diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index 7a9bd9afb3..470cbeed30 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -33,6 +33,8 @@
 
 #include <xen-tools/common-macros.h>
 
+#include "tests.h"
+
 #define TEST_PATH "xenstore-test"
 #define WRITE_BUFFERS_N    10
 #define WRITE_BUFFERS_SIZE 4000
@@ -445,7 +447,7 @@ static void cleanup(void)
     }
 }
 
-int main(int argc, char *argv[])
+int test_main(int argc, char *argv[argc+1])
 {
     int opt, t, iters = 1, ret = 0, randtime = 0;
     char *test = NULL;
-- 
2.47.3


