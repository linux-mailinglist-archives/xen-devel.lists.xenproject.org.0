Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDd7MoconGm7AAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7496174A87
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238757.1540307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxL-0003aE-D6; Mon, 23 Feb 2026 10:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238757.1540307; Mon, 23 Feb 2026 10:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSxL-0003V4-6M; Mon, 23 Feb 2026 10:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1238757;
 Mon, 23 Feb 2026 10:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwo=A3=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vuSxJ-0002wR-Ps
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:14:21 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a1d5841-10a0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 11:14:19 +0100 (CET)
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id A3B9C4122490;
 Mon, 23 Feb 2026 05:13:59 -0500 (EST)
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
X-Inumbo-ID: 6a1d5841-10a0-11f1-9ccf-f158ae23cfc8
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH 3/7] tools/tests/*/Makefile: factor out build rules
Date: Mon, 23 Feb 2026 10:14:07 +0000
Message-ID: <57d93b2a6e9f3cdc70e4446c469226dc015a1944.1771840831.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.28 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
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
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: A7496174A87
X-Rspamd-Action: no action

Also makes CFLAGS consistent across all tests, e.g. test_vpci would now
fail to build with an unused variable error if it hadn't been fixed in a
previous commit.

Introduce a symlink test_vpci.c -> main.c, since this is the only test
using a different .c file name from the main executable
(could also rename the file instead).

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 tools/tests/Rules.mk                |  9 +++++++++
 tools/tests/cpu-policy/Makefile     | 15 ++++-----------
 tools/tests/domid/Makefile          | 11 +++--------
 tools/tests/mem-claim/Makefile      |  8 --------
 tools/tests/paging-mempool/Makefile |  8 --------
 tools/tests/pdx/Makefile            |  4 ----
 tools/tests/rangeset/Makefile       |  9 +--------
 tools/tests/resource/Makefile       |  8 --------
 tools/tests/tsx/Makefile            |  8 --------
 tools/tests/vpci/.gitignore         |  1 +
 tools/tests/vpci/Makefile           | 10 +++++++---
 tools/tests/xenstore/Makefile       |  8 +-------
 12 files changed, 26 insertions(+), 73 deletions(-)
 create mode 100644 tools/tests/vpci/.gitignore

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
index f7ef76bf4f..2de9e94546 100644
--- a/tools/tests/Rules.mk
+++ b/tools/tests/Rules.mk
@@ -45,4 +45,13 @@ install: all
 uninstall:
 	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC)/tests/,$(TARGETS))
 
+CFLAGS += -D__XEN_TOOLS__
+CFLAGS += $(CFLAGS_xeninclude)
+
+%.o: Makefile
+
+$(TARGET): $(TARGET).o
+	$(CC) $^ -o $@ $(LDFLAGS) $(APPEND_LDFLAGS)
+
 -include $(DEPS_INCLUDE)
+
diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 700e325215..4ab3baf1fb 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -3,26 +3,19 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 TARGETS :=
 
+TARGET := test-cpu-policy
+
 # For brevity, these tests make extensive use of designated initialisers in
 # anonymous unions, but GCCs older than 4.6 can't cope.  Ignore the test in
 # this case.
 ifneq ($(gcc)$(call cc-ver,$(CC),lt,0x040600),yy)
-TARGETS += test-cpu-policy
+TARGETS += $(TARGET)
 else
 $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)))
 endif
 
-CFLAGS += -D__XEN_TOOLS__
-CFLAGS += $(CFLAGS_xeninclude)
-CFLAGS += $(APPEND_CFLAGS)
-
-LDFLAGS += $(APPEND_LDFLAGS)
-
 vpath %.c ../../../xen/lib/x86
 
-%.o: Makefile
-
-test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
-	$(CC) $^ -o $@ $(LDFLAGS)
+$(TARGET): msr.o cpuid.o policy.o
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 92f11777f2..89e4333bfb 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -7,7 +7,8 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGETS += test-domid
+TARGET := test-domid
+TARGETS += $(TARGET)
 
 define list-c-headers
 $(shell sed -n \
@@ -39,7 +40,6 @@ endef
 clean::
 	$(RM) -r generated
 
-CFLAGS += -D__XEN_TOOLS__
 # find-next-bit.c
 CFLAGS += '-DEXPORT_SYMBOL(x)=' \
           -Dfind_first_bit \
@@ -47,12 +47,8 @@ CFLAGS += '-DEXPORT_SYMBOL(x)=' \
           -Dfind_next_bit \
           -Dfind_next_bit_le \
           -Dfind_next_zero_bit_le
-CFLAGS += $(APPEND_CFLAGS)
-CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += -I./generated/
 
-LDFLAGS += $(APPEND_LDFLAGS)
-
 vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 
 # Point to the hypervisor code and generate test harness dependencies
@@ -60,7 +56,6 @@ vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 # within a mocked environment.
 $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
 
-test-domid: domid.o find-next-bit.o test-domid.o
-	$(CC) $^ -o $@ $(LDFLAGS)
+$(TARGET): domid.o find-next-bit.o
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/mem-claim/Makefile b/tools/tests/mem-claim/Makefile
index 6790e48417..eeae1eb5d2 100644
--- a/tools/tests/mem-claim/Makefile
+++ b/tools/tests/mem-claim/Makefile
@@ -4,16 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
 TARGET := test-mem-claim
 TARGETS := $(TARGET)
 
-CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
-LDFLAGS += $(APPEND_LDFLAGS)
-
-%.o: Makefile
-
-$(TARGET): test-mem-claim.o
-	$(CC) -o $@ $< $(LDFLAGS)
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/paging-mempool/Makefile b/tools/tests/paging-mempool/Makefile
index 9ebeb24ab6..ad4b7fc65f 100644
--- a/tools/tests/paging-mempool/Makefile
+++ b/tools/tests/paging-mempool/Makefile
@@ -4,16 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
 TARGET := test-paging-mempool
 TARGETS := $(TARGET)
 
-CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
-LDFLAGS += $(APPEND_LDFLAGS)
-
-%.o: Makefile
-
-$(TARGET): test-paging-mempool.o
-	$(CC) -o $@ $< $(LDFLAGS)
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
index a5129a8282..bc19a217a5 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -8,10 +8,6 @@ DEPS_RM += pdx.h
 pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
 	sed -e '/^#[[:space:]]*include/d' <$< >$@
 
-CFLAGS += -D__XEN_TOOLS__
-CFLAGS += $(APPEND_CFLAGS)
-CFLAGS += $(CFLAGS_xeninclude)
-
 test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
 test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
 
diff --git a/tools/tests/rangeset/Makefile b/tools/tests/rangeset/Makefile
index c76746ce7a..843b2129a9 100644
--- a/tools/tests/rangeset/Makefile
+++ b/tools/tests/rangeset/Makefile
@@ -15,15 +15,8 @@ rangeset.c: $(XEN_ROOT)/xen/common/rangeset.c
 	# Remove includes and add the test harness header
 	sed -e '/#include/d' -e '1s/^/#include "harness.h"/' <$< >$@
 
-CFLAGS += -D__XEN_TOOLS__
-CFLAGS += $(APPEND_CFLAGS)
-CFLAGS += $(CFLAGS_xeninclude)
-
-LDFLAGS += $(APPEND_LDFLAGS)
-
 test-rangeset.o rangeset.o: list.h rangeset.h
 
-test-rangeset: rangeset.o test-rangeset.o
-	$(CC) $^ -o $@ $(LDFLAGS)
+$(TARGET): rangeset.o
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 764e34f3fa..11ce782b29 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -4,20 +4,12 @@ include $(XEN_ROOT)/tools/Rules.mk
 TARGET := test-resource
 TARGETS := $(TARGET)
 
-CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenforeginmemory)
 CFLAGS += $(CFLAGS_libxengnttab)
-CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenforeignmemory)
 LDFLAGS += $(LDLIBS_libxengnttab)
-LDFLAGS += $(APPEND_LDFLAGS)
-
-%.o: Makefile
-
-$(TARGET): test-resource.o
-	$(CC) -o $@ $< $(LDFLAGS)
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/tsx/Makefile b/tools/tests/tsx/Makefile
index 817a63b085..54852b0327 100644
--- a/tools/tests/tsx/Makefile
+++ b/tools/tests/tsx/Makefile
@@ -5,18 +5,10 @@ TARGET := test-tsx
 TARGETS := $(TARGET)
 
 CFLAGS += -I$(XEN_ROOT)/tools/libs/ctrl -I$(XEN_ROOT)/tools/libs/guest
-CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenguest)
-CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenctrl)
 LDFLAGS += $(LDLIBS_libxenguest)
-LDFLAGS += $(APPEND_LDFLAGS)
-
-%.o: Makefile
-
-$(TARGET): test-tsx.o
-	$(CC) -o $@ $< $(LDFLAGS)
 
 include $(XEN_ROOT)/tools/tests/Rules.mk
diff --git a/tools/tests/vpci/.gitignore b/tools/tests/vpci/.gitignore
new file mode 100644
index 0000000000..8be877b29a
--- /dev/null
+++ b/tools/tests/vpci/.gitignore
@@ -0,0 +1 @@
+test_vpci.c
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 597303e31d..41ff867cdd 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -4,10 +4,14 @@ include $(XEN_ROOT)/tools/Rules.mk
 TARGET := test_vpci
 TARGETS := $(TARGET)
 
-$(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+$(TARGET).c: main.c
+	ln -sf $< $@
 
-DEPS_RM += vpci.h vpci.c list.h
+vpci.o: vpci.h
+$(TARGET).o: vpci.h emul.h list.h
+$(TARGET): vpci.o
+
+DEPS_RM += vpci.h vpci.c list.h $(TARGET).c
 
 vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
 	# Remove includes and add the test harness header
diff --git a/tools/tests/xenstore/Makefile b/tools/tests/xenstore/Makefile
index 56cfe07f25..e1a0c086a9 100644
--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -5,17 +5,11 @@ TARGET := test-xenstore
 TARGETS := $(TARGET)
 
 CFLAGS += $(CFLAGS_libxenstore)
-CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(LDLIBS_libxenstore)
-LDFLAGS += $(APPEND_LDFLAGS)
+
 ifeq ($(CONFIG_Linux),y)
 LDFLAGS += -Wl,--as-needed -lc -lrt
 endif
 
-%.o: Makefile
-
-test-xenstore: test-xenstore.o
-	$(CC) -o $@ $< $(LDFLAGS)
-
 include $(XEN_ROOT)/tools/tests/Rules.mk
-- 
2.47.3


