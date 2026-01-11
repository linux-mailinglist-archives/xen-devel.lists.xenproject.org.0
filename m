Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536BAD0E106
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jan 2026 05:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199668.1515900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo5-0004nw-Vb; Sun, 11 Jan 2026 04:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199668.1515900; Sun, 11 Jan 2026 04:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo5-0004jX-Ou; Sun, 11 Jan 2026 04:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1199668;
 Sun, 11 Jan 2026 04:12:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vemo4-0004c9-U8
 for xen-devel@lists.xenproject.org; Sun, 11 Jan 2026 04:12:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo2-001xog-19;
 Sun, 11 Jan 2026 04:11:58 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo2-000Y62-1F;
 Sun, 11 Jan 2026 04:11:58 +0000
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
	bh=/m1LF2NtAIDgbIpy2Al8n60LY4uT2dvKj7zYoQhSDbo=; b=CUAl6W3UatzdFdEXzrnO6uITi1
	5AaHssv4pclOCF7xrV739auHVlzo7QXZP3AkfWJe3PQGhlAo3Zwf6WwumunB3OH8Xwi9QyUR3t/ik
	nxBAHU9gzsS34J+fbJigMuALA9Mf9MgLuYxPyCXCXoIG7xq60dr7IlVhCSf+WJYXmZXQ=;
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
Subject: [PATCH v2 1/4] tests: fixup domid make fragment
Date: Sat, 10 Jan 2026 20:11:42 -0800
Message-ID: <20260111041145.553673-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111041145.553673-1-dmukhin@ford.com>
References: <20260111041145.553673-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

There can be multiple test harnesses per one test target (e.g. harness.h
and harness2.h). Account for that by further parametrizing existing
emit-harness-nested-rule().

Add guard against HOSTCC != CC (similarly to how its done in PDX unit test).

Account for multiple test targets in install and uninstall make targets.

Introduce CFLAGS dedicated for find-next-bit.c only to avoid contaminating
global CFLAGS.

Honor mocked hypervisor header over tools/include/xen symlinks.

Finally, add some clarifications for the functions.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- updated commentaries
- added ability to select the harness header filename
- fixup for picking up mocked header files
---
 tools/tests/domid/Makefile | 63 ++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 19 deletions(-)

diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 753129029ed9..dd22a25b038a 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -4,36 +4,55 @@
 #
 # Copyright 2025 Ford Motor Company
 
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
-
 TESTS := test-domid
 
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
 define list-c-headers
 $(shell sed -n \
     's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
 endef
 
-# NB: $1 cannot be a list
+# Generate mock environment by replicating header file hierarchy;
+# each header file will point to a harness header.
+#
+# $1 target
+# $2 list of test harnesses
 define emit-harness-nested-rule
-$(1): $(CURDIR)/harness.h
-	mkdir -p $$(@D);
-	ln -sf $$< $$@;
+$(1): $(2)
+	set -e; \
+	mkdir -p $$(@D); \
+	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
 
 endef
 
+# Helper function to emit mocked hypervisor code dependencies.
+#
+# $1 Harness file name.
+# $2 Mocked hypervisor file name.
+# $3 List of dependencies to mock.
 define emit-harness-rules
-$(foreach x,$(2),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(x)))
-$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
+$(foreach x,$(3),$(call emit-harness-nested-rule,\
+                        $(CURDIR)/generated/$(x),\
+                        $(addprefix $(CURDIR)/,$(1))))
+$(2:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
 endef
 
 define emit-harness-deps
-$(if $(strip $(2)),$(call emit-harness-rules,$1,$2),)
+$(if $(strip $(3)),$(call emit-harness-rules,$1,$2,$3),)
 endef
 
+# Emit dependencies for mocked hypervisor code.
+#
+# $1 Hypervisor file name.
+# $2 Hypervisor source path.
+# $3 Harness header file name (optional).
 define vpath-with-harness-deps
 vpath $(1) $(2)
-$(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
+$(call emit-harness-deps,$(or $(strip $(3)),harness.h),\
+                         $(1),\
+                         $(call list-c-headers,$(2)$(1)))
 endef
 
 .PHONY: all
@@ -41,7 +60,11 @@ all: $(TESTS)
 
 .PHONY: run
 run: $(TESTS)
+ifeq ($(CC),$(HOSTCC))
 	set -e; $(foreach t,$(TESTS),./$(t);)
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
 
 .PHONY: clean
 clean:
@@ -55,25 +78,27 @@ distclean: clean
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
+	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
 
 .PHONY: uninstall
 uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
+	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
 
 CFLAGS += -D__XEN_TOOLS__
+
 # find-next-bit.c
-CFLAGS += '-DEXPORT_SYMBOL(x)=' \
+CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
           -Dfind_first_bit \
           -Dfind_first_zero_bit \
           -Dfind_next_bit \
           -Dfind_next_bit_le \
           -Dfind_next_zero_bit_le
-CFLAGS += $(APPEND_CFLAGS)
-CFLAGS += $(CFLAGS_xeninclude)
-CFLAGS += -I./generated/
 
-LDFLAGS += $(APPEND_LDFLAGS)
+find-next-bit.o: CFLAGS += $(CFLAGS-find-next-bit.c)
+
+# Honor mocked hypervisor header over tools/include/xen symlinks
+CFLAGS += -I$(CURDIR)/generated/
+CFLAGS += $(CFLAGS_xeninclude)
 
 vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 
@@ -83,6 +108,6 @@ vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
 
 test-domid: domid.o find-next-bit.o test-domid.o
-	$(CC) $^ -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
 
 -include $(DEPS_INCLUDE)
-- 
2.52.0


