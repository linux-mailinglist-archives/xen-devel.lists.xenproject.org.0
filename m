Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853532F4B54
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 13:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66440.117989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN1-0004jL-Lu; Wed, 13 Jan 2021 12:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66440.117989; Wed, 13 Jan 2021 12:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN1-0004iv-IW; Wed, 13 Jan 2021 12:35:27 +0000
Received: by outflank-mailman (input) for mailman id 66440;
 Wed, 13 Jan 2021 12:35:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzfN0-0004iq-LI
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:35:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed3a4b0d-5b3d-4d2f-9a45-b2b777bc1edc;
 Wed, 13 Jan 2021 12:35:24 +0000 (UTC)
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
X-Inumbo-ID: ed3a4b0d-5b3d-4d2f-9a45-b2b777bc1edc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610541324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=DTUD++QGe7nakZ4ytV0Xii6kTZ6n3vsIQbEGDrgmcfE=;
  b=QsrROuGIuziBMqXV/+21ztQ2FlaqBnSVhv3k4pL8yKXIcHTGyDsBPqR2
   PcIRkvw7yUpcUMMrrR/AUE3Sz5BMYGiMycZMsQxGccx+4qkkDvDT+X2OU
   sUILFoh7hfjY55805Za4DErp0UHPCMWsgwT8EOY+WkJNcxiX948+4SqyO
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CtF8XTmjcyKpBXN9qF6FeyrGmQtl98TDnPAKcBnp0AW65LX47EWS3KBisFkZECo35lkHR5exBm
 /UwE3NbiLqXVNpdEcs8BLosb7n4XIP6SIKD5IPhUdSQXcjA6rErNwLkqXK8NSvwIHYTzZr5TiZ
 VQNwnzaiccXYXH8RSJoWOv2d8FWFgQd0lPR7GqlzFHGMcFr5jVrmaOEvNmBlbujogHd5+H/tbc
 dmU2FThh+GlWqji5n424nMbrilBjn51ZHZSNL68VgAahTdTFvDbSsLaD40DgX+b5oH5q0LUAPn
 86U=
X-SBRS: 5.2
X-MesageID: 36282265
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="36282265"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <amc96@cam.ac.uk>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 3/3] tools: Move memshrtool from tests/ to misc/
Date: Wed, 13 Jan 2021 12:34:55 +0000
Message-ID: <20210113123455.23209-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210113123455.23209-1-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

memshrtool is a tool for a human to use, rather than a test.  Move it into
misc/ as a more appropriate location to live.  Also rename it to
xen-memshare-tool

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>

I'm debating dropping the tool suffix, because I don't think that's much help
either.
---
 .gitignore                                         |  1 -
 tools/misc/.gitignore                              |  1 +
 tools/misc/Makefile                                |  4 +++
 .../memshrtool.c => misc/xen-memshare-tool.c}      |  0
 tools/tests/Makefile                               |  1 -
 tools/tests/mem-sharing/Makefile                   | 31 ----------------------
 6 files changed, 5 insertions(+), 33 deletions(-)
 rename tools/{tests/mem-sharing/memshrtool.c => misc/xen-memshare-tool.c} (100%)
 delete mode 100644 tools/tests/mem-sharing/Makefile

diff --git a/.gitignore b/.gitignore
index 630bdf5b99..35957cc21f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -273,7 +273,6 @@ tools/tests/x86_emulator/test_x86_emulator
 tools/tests/x86_emulator/x86_emulate
 tools/tests/x86_emulator/xop*.[ch]
 tools/tests/xenstore/xs-test
-tools/tests/mem-sharing/memshrtool
 tools/tests/mce-test/tools/xen-mceinj
 tools/tests/vpci/list.h
 tools/tests/vpci/vpci.[hc]
diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index e332ed4ec7..a01bc5b5b5 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1,2 +1,3 @@
 xen-access
+xen-memshare-tool
 xen-ucode
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 612b7002e5..fbe010a55a 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -32,6 +32,7 @@ INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
 INSTALL_SBIN                   += xen-access
 INSTALL_SBIN                   += xen-livepatch
+INSTALL_SBIN                   += xen-memshare-tool
 INSTALL_SBIN                   += xen-diag
 INSTALL_SBIN += $(INSTALL_SBIN-y)
 
@@ -86,6 +87,9 @@ xen-hvmctx: xen-hvmctx.o
 xen-hvmcrash: xen-hvmcrash.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-memshare-tool: xen-memshare-tool.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 xenperf: xenperf.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
diff --git a/tools/tests/mem-sharing/memshrtool.c b/tools/misc/xen-memshare-tool.c
similarity index 100%
rename from tools/tests/mem-sharing/memshrtool.c
rename to tools/misc/xen-memshare-tool.c
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 771715be0f..fc9b715951 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS-y :=
 SUBDIRS-$(CONFIG_X86) += cpu-policy
 SUBDIRS-$(CONFIG_X86) += mce-test
-SUBDIRS-y += mem-sharing
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
diff --git a/tools/tests/mem-sharing/Makefile b/tools/tests/mem-sharing/Makefile
deleted file mode 100644
index 5cd96e4cc9..0000000000
--- a/tools/tests/mem-sharing/Makefile
+++ /dev/null
@@ -1,31 +0,0 @@
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += -Werror
-
-CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_xeninclude)
-
-TARGETS-y := 
-TARGETS-$(CONFIG_X86) += memshrtool
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
-	$(RM) *.o $(TARGETS) *~ $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-
-memshrtool: memshrtool.o
-	$(CC) -o $@ $< $(LDFLAGS) $(LDLIBS_libxenctrl)
-
--include $(DEPS_INCLUDE)
-
-install uninstall:
-- 
2.11.0


