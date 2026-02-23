Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAQ/HIYonGl1AAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E4174A6A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238754.1540286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxJ-0003Cc-HG; Mon, 23 Feb 2026 10:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238754.1540286; Mon, 23 Feb 2026 10:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxJ-0003AB-DH; Mon, 23 Feb 2026 10:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1238754;
 Mon, 23 Feb 2026 10:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxH-0002wR-UG
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:20 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 692e4533-10a0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:14:17 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 01342412248C;
 Mon, 23 Feb 2026 05:13:57 -0500 (EST)
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
X-Inumbo-ID: 692e4533-10a0-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY rules into Rules.mk
Date: Mon, 23 Feb 2026 10:14:05 +0000
Message-ID: <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.14 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: F30E4174A6A
X-Rspamd-Action: no action

Introduce a new tools/tests/Rules.mk that must be included *last* in a
Makefile, after TARGETS is defined.
This reduces the boilerplate that must be copy pasted when new tests are
written.

Renamed TESTS to TARGETS in tools/tests/domid/Makefile
Extend DEPS_RM, so that most tests don't need custom clean rules,
except in tools/tests/domid which needs to remove a directory too.

Make the run rules consistent: do not attempt to run the tests if HOSTCC != CC.

The common rules use the rule forms which allow multiple TARGETS.

tools/tests/x86_emulator/Makefile is unchanged, since this has a lot of
conditional rules that are very different from the other tests.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/Rules.mk                | 48 +++++++++++++++++++++++++++++
 tools/tests/cpu-policy/Makefile     | 26 +---------------
 tools/tests/domid/Makefile          | 28 ++---------------
 tools/tests/mem-claim/Makefile      | 23 ++------------
 tools/tests/paging-mempool/Makefile | 23 ++------------
 tools/tests/pdx/Makefile            | 33 ++------------------
 tools/tests/rangeset/Makefile       | 27 ++--------------
 tools/tests/resource/Makefile       | 27 ++--------------
 tools/tests/tsx/Makefile            | 26 ++--------------
 tools/tests/vpci/Makefile           | 30 +++---------------
 tools/tests/xenstore/Makefile       | 29 ++---------------
 11 files changed, 72 insertions(+), 248 deletions(-)
 create mode 100644 tools/tests/Rules.mk

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
new file mode 100644
index 0000000000..f7ef76bf4f
--- /dev/null
+++ b/tools/tests/Rules.mk
@@ -0,0 +1,48 @@
+# Usage: include this last in your Makefile.
+#
+# For example:
+#
+# XEN_ROOT = $(CURDIR)/../../..
+# include $(XEN_ROOT)/tools/Rules.mk
+#
+# TARGETS := ...
+# ...
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
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 24f87e2eca..700e325215 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -12,30 +12,6 @@ else
 $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)))
 endif
 
-.PHONY: all
-all: $(TARGETS)
-
-.PHONY: run
-run: $(TARGETS)
-	./$<
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests)
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
-
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(APPEND_CFLAGS)
@@ -49,4 +25,4 @@ vpath %.c ../../../xen/lib/x86
 test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
 	$(CC) $^ -o $@ $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 753129029e..92f11777f2 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -7,7 +7,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TESTS := test-domid
+TARGETS += test-domid
 
 define list-c-headers
 $(shell sed -n \
@@ -36,30 +36,8 @@ vpath $(1) $(2)
 $(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
 endef
 
-.PHONY: all
-all: $(TESTS)
-
-.PHONY: run
-run: $(TESTS)
-	set -e; $(foreach t,$(TESTS),./$(t);)
-
-.PHONY: clean
-clean:
+clean::
 	$(RM) -r generated
-	$(RM) -- *.o $(TESTS) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) test-domid $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/test-domid
 
 CFLAGS += -D__XEN_TOOLS__
 # find-next-bit.c
@@ -85,4 +63,4 @@ $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
 test-domid: domid.o find-next-bit.o test-domid.o
 	$(CC) $^ -o $@ $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
index 76ba3e3c8b..6790e48417 100644
--- a/tools/tests/mem-claim/Makefile
+++ b/tools/tests/mem-claim/Makefile
@@ -2,26 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 TARGET := test-mem-claim
-
-.PHONY: all
-all: $(TARGET)
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGET) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+TARGETS := $(TARGET)
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
@@ -35,4 +16,4 @@ LDFLAGS += $(APPEND_LDFLAGS)
 $(TARGET): test-mem-claim.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/paging-mempool/Makefile b/tools/tests/paging-mempool/Makefile
index a1e12584ce..9ebeb24ab6 100644
--- a/tools/tests/paging-mempool/Makefile
+++ b/tools/tests/paging-mempool/Makefile
@@ -2,26 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 TARGET := test-paging-mempool
-
-.PHONY: all
-all: $(TARGET)
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGET) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+TARGETS := $(TARGET)
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
@@ -35,4 +16,4 @@ LDFLAGS += $(APPEND_LDFLAGS)
 $(TARGET): test-paging-mempool.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
index 3c431d7c78..a5129a8282 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -3,36 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 TARGETS := test-pdx-mask test-pdx-offset
 
-.PHONY: all
-all: $(TARGETS)
-
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
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.h
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
+DEPS_RM += pdx.h
 
 pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
 	sed -e '/^#[[:space:]]*include/d' <$< >$@
@@ -47,4 +18,4 @@ test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
 test-pdx-%: test-pdx.c pdx.h
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/rangeset/Makefile b/tools/tests/rangeset/Makefile
index e3bfce471c..c76746ce7a 100644
--- a/tools/tests/rangeset/Makefile
+++ b/tools/tests/rangeset/Makefile
@@ -2,30 +2,9 @@ XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 TARGET := test-rangeset
+TARGETS := $(TARGET)
 
-.PHONY: all
-all: $(TARGET)
-
-.PHONY: run
-run: $(TARGET)
-	./$<
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGET) $(DEPS_RM) list.h rangeset.h rangeset.c
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGET))
+DEPS_RM += list.h rangeset.h rangeset.c
 
 list.h: $(XEN_ROOT)/xen/include/xen/list.h
 rangeset.h: $(XEN_ROOT)/xen/include/xen/rangeset.h
@@ -47,4 +26,4 @@ test-rangeset.o rangeset.o: list.h rangeset.h
 test-rangeset: rangeset.o test-rangeset.o
 	$(CC) $^ -o $@ $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 09d678fffe..764e34f3fa 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -2,30 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 TARGET := test-resource
-
-.PHONY: all
-all: $(TARGET)
-
-.PHONY: run
-run: $(TARGET)
-	./$(TARGET)
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGET) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+TARGETS := $(TARGET)
 
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
@@ -43,4 +20,4 @@ LDFLAGS += $(APPEND_LDFLAGS)
 $(TARGET): test-resource.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index 0bb7e70103..817a63b085 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -2,29 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 TARGET := test-tsx
-
-.PHONY: all
-all: $(TARGET)
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGET) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
-
-.PHONY: uninstall
-uninstall:
+TARGETS := $(TARGET)
 
 CFLAGS += -I$(XEN_ROOT)/tools/libs/ctrl -I$(XEN_ROOT)/tools/libs/guest
 CFLAGS += $(CFLAGS_xeninclude)
@@ -41,4 +19,4 @@ LDFLAGS += $(APPEND_LDFLAGS)
 $(TARGET): test-tsx.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 97359ff67f..597303e31d 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -2,36 +2,12 @@ XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 TARGET := test_vpci
-
-.PHONY: all
-all: $(TARGET)
-
-.PHONY: run
-run: $(TARGET)
-ifeq ($(CC),$(HOSTCC))
-	./$(TARGET)
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+TARGETS := $(TARGET)
 
 $(TARGET): vpci.c vpci.h list.h main.c emul.h
 	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
 
-.PHONY: clean
-clean:
-	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
-
-.PHONY: distclean
-distclean: clean
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
+DEPS_RM += vpci.h vpci.c list.h
 
 vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
 	# Remove includes and add the test harness header
@@ -41,3 +17,5 @@ list.h: $(XEN_ROOT)/xen/include/xen/list.h
 vpci.h: $(XEN_ROOT)/xen/include/xen/vpci.h
 list.h vpci.h:
 	sed -e '/#include/d' <$< >$@
+
+include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/xenstore/Makefile b/tools/tests/xenstore/Makefile
index 2ee4a1327e..56cfe07f25 100644
--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -1,31 +1,8 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGETS-y := test-xenstore
-TARGETS := $(TARGETS-y)
-
-.PHONY: all
-all: build
-
-.PHONY: build
-build: $(TARGETS)
-
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests)
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
+TARGET := test-xenstore
+TARGETS := $(TARGET)
 
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += $(APPEND_CFLAGS)
@@ -41,4 +18,4 @@ endif
 test-xenstore: test-xenstore.o
 	$(CC) -o $@ $< $(LDFLAGS)
 
--include $(DEPS_INCLUDE)
+include $(XEN_ROOT)/tools/tests/Rules.mk
-- 
2.47.3


