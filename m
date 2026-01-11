Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34ED0E109
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jan 2026 05:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199669.1515907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo6-0004vZ-8N; Sun, 11 Jan 2026 04:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199669.1515907; Sun, 11 Jan 2026 04:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo6-0004ny-3V; Sun, 11 Jan 2026 04:12:02 +0000
Received: by outflank-mailman (input) for mailman id 1199669;
 Sun, 11 Jan 2026 04:12:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vemo5-0004eg-53
 for xen-devel@lists.xenproject.org; Sun, 11 Jan 2026 04:12:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo4-001xp8-1k;
 Sun, 11 Jan 2026 04:12:00 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo4-000Y6C-1v;
 Sun, 11 Jan 2026 04:12:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=I1QkihUJOTF7JtgRUB5yX7oCjGpry5xRBIdICxe+gYk=; b=MxyA8O4DxFbU3PEJIfevcftBz+
	Rzphjx6t27+g4MdrzScdGOpFv+c3gLxD9h/a2cZUjSFv+qvYVfLkd0+1LqtkJO0DGhOI0AVVjFYFV
	NAI2/NpQk2PfSOuT104fQRvc5YqiSmChOylympOMKQoQGCUippF+bDSQwudQqkCqiAdI=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v2 3/4] tests: use unit test fragment in PDX test
Date: Sat, 10 Jan 2026 20:11:44 -0800
Message-ID: <20260111041145.553673-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111041145.553673-1-dmukhin@ford.com>
References: <20260111041145.553673-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Use the new make fragment to generate test harness code for the PDX unit test.

Move <xen/bitops.h> earlier in xen/common/pdx.c to ensure harness.h is
included before triggering the #ifndef MAX_PFN_RANGES check when building a
unit test.

Additionally, use real <xen/pdx.h> in harness.h instead of a locally
copied version.

Update .gitignore to exclude generated test build-time dependencies.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 tools/tests/pdx/.gitignore |  2 +-
 tools/tests/pdx/Makefile   | 55 +++++++++-----------------------------
 tools/tests/pdx/harness.h  |  2 +-
 tools/tests/pdx/test-pdx.c |  2 --
 xen/common/pdx.c           |  3 ++-
 5 files changed, 16 insertions(+), 48 deletions(-)

diff --git a/tools/tests/pdx/.gitignore b/tools/tests/pdx/.gitignore
index 1202a531a7fd..1bf9c05985c4 100644
--- a/tools/tests/pdx/.gitignore
+++ b/tools/tests/pdx/.gitignore
@@ -1,3 +1,3 @@
-/pdx.h
+/generated
 /test-pdx-mask
 /test-pdx-offset
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
index 3c431d7c7822..178b451cb611 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -1,50 +1,19 @@
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit tests for PDX (Page inDeX).
+#
 
-TARGETS := test-pdx-mask test-pdx-offset
+TESTS := test-pdx-mask test-pdx-offset
 
-.PHONY: all
-all: $(TARGETS)
+XEN_ROOT = $(CURDIR)/../../..
 
-.PHONY: run
-run: $(TARGETS)
-ifeq ($(CC),$(HOSTCC))
-	set -e;             \
-	for test in $? ; do \
-		./$$test ;  \
-	done
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
 
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.h
+include $(XEN_ROOT)/tools/tests/Rules.mk
 
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
+CFLAGS += -I $(XEN_ROOT)/xen/include/
 
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
+$(eval $(call vpath-with-harness-deps,pdx.c,$(XEN_ROOT)/xen/common/))
 
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
-
-pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
-	sed -e '/^#[[:space:]]*include/d' <$< >$@
-
-CFLAGS += -D__XEN_TOOLS__
-CFLAGS += $(APPEND_CFLAGS)
-CFLAGS += $(CFLAGS_xeninclude)
-
-test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
-test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
-
-test-pdx-%: test-pdx.c pdx.h
-	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
-
--include $(DEPS_INCLUDE)
+test-pdx-%: test-pdx.o pdx.o
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
index e49d6bcf92c2..4cdda931feb2 100644
--- a/tools/tests/pdx/harness.h
+++ b/tools/tests/pdx/harness.h
@@ -84,7 +84,7 @@ typedef uint64_t paddr_t;
     qsort(elem, nr, size, cmp);                                         \
 })
 
-#include "pdx.h"
+#include <xen/pdx.h>
 
 #endif
 
diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index eefd54c76815..3633c231abaa 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -7,8 +7,6 @@
 
 #include "harness.h"
 
-#include "../../xen/common/pdx.c"
-
 struct range {
     /* Ranges are defined as [start, end). */
     unsigned long start, end;
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 7e070ff962e8..068a2098b41b 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -15,11 +15,12 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/bitops.h>
+
 /* Trim content when built for the test harness. */
 #ifdef __XEN__
 #include <xen/init.h>
 #include <xen/mm.h>
-#include <xen/bitops.h>
 #include <xen/nospec.h>
 #include <xen/param.h>
 #include <xen/pfn.h>
-- 
2.52.0


