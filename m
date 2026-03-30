Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJUeKDyiymmx+gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:18:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6935E9C1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267861.1557356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJD-0001uJ-JM; Mon, 30 Mar 2026 16:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267861.1557356; Mon, 30 Mar 2026 16:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJD-0001qx-Fu; Mon, 30 Mar 2026 16:17:47 +0000
Received: by outflank-mailman (input) for mailman id 1267861;
 Mon, 30 Mar 2026 16:17:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7FJC-0001qM-MM
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:17:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FJC-00Ey33-2S
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:17:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa20a-e002-0a2a0a5209dd-0a2a4506932c-46
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:45 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa229-3034-0a2a45060019-a0658308c6cc-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:45 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 48A5541B6C97;
 Mon, 30 Mar 2026 12:17:09 -0400 (EDT)
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
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/5] tools/test: introduce a 'make check' rule
Date: Mon, 30 Mar 2026 17:17:26 +0100
Message-ID: <aa855bc8e8721bd799c7699525b68d67430eb9cb.1774886602.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774886602.git.edwin.torok@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774887465-83B9E1C2-3787F03A/0/0
X-purgate-type: clean
X-purgate-size: 2779
X-Spamd-Result: default: False [3.23 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid]
X-Rspamd-Queue-Id: 48C6935E9C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It runs all unit tests (those that do not require xenctrl) in parallel.
The for loop fragment from tools/Rules.mk is not used, because that
serializes make invocations in subdirectories (tested by inserting a
'sleep 5' into the 'run' rules).

There might be dependencies between directories in tools/,
but all tests are independent and can be built and run in parallel.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 Makefile             |  4 ++++
 tools/Makefile       |  4 ++++
 tools/Rules.mk       |  2 +-
 tools/tests/Makefile | 20 +++++++++++++++++++-
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 67b71ac3d4..ca7ec58c99 100644
--- a/Makefile
+++ b/Makefile
@@ -50,6 +50,10 @@ install: $(TARGS_INSTALL)
 .PHONY: build
 build: $(TARGS_BUILD)
 
+.PHONY: check
+check:
+	$(MAKE) -C tools check
+
 .PHONY: build-xen
 build-xen:
 	$(MAKE) -C xen build
diff --git a/tools/Makefile b/tools/Makefile
index 6ecf7c0da8..7f6c29965d 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -55,6 +55,10 @@ endif
 .PHONY: build all
 build all: subdirs-all
 
+.PHONY: check
+check:
+	$(MAKE) -C tests check
+
 .PHONY: install
 install:
 	$(INSTALL_DIR) -m 700 $(DESTDIR)$(XEN_DUMP_DIR)
diff --git a/tools/Rules.mk b/tools/Rules.mk
index d9b9c740e9..abb1cbd783 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -194,7 +194,7 @@ subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-uninstall: .
 		$(MAKE) subdir-$(patsubst subdirs-%,%,$@)-$$subdir; \
 	done
 
-subdir-all-% subdir-clean-% subdir-install-% subdir-uninstall-%: .phony
+subdir-all-% subdir-clean-% subdir-install-% subdir-uninstall-% subdir-run-%: .phony
 	$(MAKE) -C $* $(patsubst subdir-%-$*,%,$@)
 
 subdir-distclean-%: .phony
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 6477a4386d..d73a6d7cfb 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -17,5 +17,23 @@ ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
 
-.PHONY: all clean install distclean uninstall
+.PHONY: all clean install distclean uninstall check
 all clean distclean install uninstall: %: subdirs-%
+
+# Subset of SUBDIRS that do not depend on xenctrl
+# Thus these tests can be run in the CI directly,
+# or on the developer's machine.
+
+SUBDIRS_CHECK-y :=
+SUBDIRS_CHECK-y += domid
+SUBDIRS_CHECK-y += pdx
+SUBDIRS_CHECK-y += rangeset
+SUBDIRS_CHECK-y += vpci
+
+SUBDIRS_CHECK-$(CONFIG_X86) += cpu-policy
+ifneq ($(clang),y)
+SUBDIRS_CHECK-$(CONFIG_X86) += x86_emulator
+endif
+
+# Ensure tests can run in parallel, the for loop in ../Rules.mk would serialize them
+check: $(foreach subdir,$(SUBDIRS_CHECK-y),subdir-run-$(subdir))
-- 
2.47.3


