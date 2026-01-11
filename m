Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688FBD0E100
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jan 2026 05:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199667.1515893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo5-0004iS-KB; Sun, 11 Jan 2026 04:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199667.1515893; Sun, 11 Jan 2026 04:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo5-0004gS-Gx; Sun, 11 Jan 2026 04:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1199667;
 Sun, 11 Jan 2026 04:12:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vemo4-0004US-7N
 for xen-devel@lists.xenproject.org; Sun, 11 Jan 2026 04:12:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo3-001xp0-1P;
 Sun, 11 Jan 2026 04:11:59 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo3-000Y66-1a;
 Sun, 11 Jan 2026 04:11:59 +0000
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
	bh=Z0BRzvSQDE7UJZD2daLQhudqHPC6UC9KqBQjEA1pAzs=; b=mgyg3C6YsbCXZFaBrHz+riy+N+
	HfIJurtobX+6Bmy5GAepH2bL2pzL1w43IVmaRJjdhkZd5qykQt2+JKl++bgtD8ZoGC+1S/prDcxfV
	zNLa+VTOJEGIRwNCDR+u2EYptnEb1m7ivYyyD/rRCrEtVRpDm2Ye21+SK6MRx0/AmA/0=;
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
Subject: [PATCH v2 2/4] tests: introduce common fragment for unit tests
Date: Sat, 10 Jan 2026 20:11:43 -0800
Message-ID: <20260111041145.553673-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111041145.553673-1-dmukhin@ford.com>
References: <20260111041145.553673-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Move test harness generation into a new shared make fragment so that
it can be reused by other unit tests.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes from v1:
- moved fragment to tools/tests/
---
 tools/tests/Rules.mk       | 91 ++++++++++++++++++++++++++++++++++++++
 tools/tests/domid/Makefile | 85 +----------------------------------
 2 files changed, 92 insertions(+), 84 deletions(-)
 create mode 100644 tools/tests/Rules.mk

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
new file mode 100644
index 000000000000..daa9e69301e4
--- /dev/null
+++ b/tools/tests/Rules.mk
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Common unit test fragment.
+#
+# Copyright 2025 Ford Motor Company
+
+include $(XEN_ROOT)/tools/Rules.mk
+
+define list-c-headers
+$(shell sed -n \
+    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
+endef
+
+# Generate mock environment by replicating header file hierarchy;
+# each header file will point to a harness header.
+#
+# $1 target
+# $2 list of test harnesses
+define emit-harness-nested-rule
+$(1): $(2)
+	set -e; \
+	mkdir -p $$(@D); \
+	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
+
+endef
+
+# Helper function to emit mocked hypervisor code dependencies.
+#
+# $1 Harness file name.
+# $2 Mocked hypervisor file name.
+# $3 List of dependencies to mock.
+define emit-harness-rules
+$(foreach x,$(3),$(call emit-harness-nested-rule,\
+                        $(CURDIR)/generated/$(x),\
+                        $(addprefix $(CURDIR)/,$(1))))
+$(2:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
+endef
+
+define emit-harness-deps
+$(if $(strip $(3)),$(call emit-harness-rules,$1,$2,$3),)
+endef
+
+# Emit dependencies for mocked hypervisor code.
+#
+# $1 Hypervisor file name.
+# $2 Hypervisor source path.
+# $3 Harness header file name (optional).
+define vpath-with-harness-deps
+vpath $(1) $(2)
+$(call emit-harness-deps,$(or $(strip $(3)),harness.h),\
+                         $(1),\
+                         $(call list-c-headers,$(2)$(1)))
+endef
+
+.PHONY: all
+all: $(TESTS)
+
+.PHONY: run
+run: $(TESTS)
+ifeq ($(CC),$(HOSTCC))
+	set -e; $(foreach t,$(TESTS),./$(t);)
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -r generated
+	$(RM) -- *.o $(TESTS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
+
+.PHONY: uninstall
+uninstall:
+	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
+
+CFLAGS += -D__XEN_TOOLS__
+# Honor mocked hypervisor header over tools/include/xen symlinks
+CFLAGS += -I$(CURDIR)/generated/
+CFLAGS += $(CFLAGS_xeninclude)
+
+ifeq ($(filter clean distclean,$(MAKECMDGOALS)),)
+-include $(DEPS_INCLUDE)
+endif
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index dd22a25b038a..2f8cc5380462 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -7,84 +7,7 @@
 TESTS := test-domid
 
 XEN_ROOT = $(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-define list-c-headers
-$(shell sed -n \
-    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
-endef
-
-# Generate mock environment by replicating header file hierarchy;
-# each header file will point to a harness header.
-#
-# $1 target
-# $2 list of test harnesses
-define emit-harness-nested-rule
-$(1): $(2)
-	set -e; \
-	mkdir -p $$(@D); \
-	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
-
-endef
-
-# Helper function to emit mocked hypervisor code dependencies.
-#
-# $1 Harness file name.
-# $2 Mocked hypervisor file name.
-# $3 List of dependencies to mock.
-define emit-harness-rules
-$(foreach x,$(3),$(call emit-harness-nested-rule,\
-                        $(CURDIR)/generated/$(x),\
-                        $(addprefix $(CURDIR)/,$(1))))
-$(2:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
-endef
-
-define emit-harness-deps
-$(if $(strip $(3)),$(call emit-harness-rules,$1,$2,$3),)
-endef
-
-# Emit dependencies for mocked hypervisor code.
-#
-# $1 Hypervisor file name.
-# $2 Hypervisor source path.
-# $3 Harness header file name (optional).
-define vpath-with-harness-deps
-vpath $(1) $(2)
-$(call emit-harness-deps,$(or $(strip $(3)),harness.h),\
-                         $(1),\
-                         $(call list-c-headers,$(2)$(1)))
-endef
-
-.PHONY: all
-all: $(TESTS)
-
-.PHONY: run
-run: $(TESTS)
-ifeq ($(CC),$(HOSTCC))
-	set -e; $(foreach t,$(TESTS),./$(t);)
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
-
-.PHONY: clean
-clean:
-	$(RM) -r generated
-	$(RM) -- *.o $(TESTS) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
-
-.PHONY: uninstall
-uninstall:
-	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
-
-CFLAGS += -D__XEN_TOOLS__
+include $(XEN_ROOT)/tools/tests/Rules.mk
 
 # find-next-bit.c
 CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
@@ -96,10 +19,6 @@ CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
 
 find-next-bit.o: CFLAGS += $(CFLAGS-find-next-bit.c)
 
-# Honor mocked hypervisor header over tools/include/xen symlinks
-CFLAGS += -I$(CURDIR)/generated/
-CFLAGS += $(CFLAGS_xeninclude)
-
 vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 
 # Point to the hypervisor code and generate test harness dependencies
@@ -109,5 +28,3 @@ $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
 
 test-domid: domid.o find-next-bit.o test-domid.o
 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
-
--include $(DEPS_INCLUDE)
-- 
2.52.0


