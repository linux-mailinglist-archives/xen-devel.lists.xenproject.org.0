Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209492F4B52
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 13:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66442.118013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN7-0004o6-Am; Wed, 13 Jan 2021 12:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66442.118013; Wed, 13 Jan 2021 12:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfN7-0004nG-5O; Wed, 13 Jan 2021 12:35:33 +0000
Received: by outflank-mailman (input) for mailman id 66442;
 Wed, 13 Jan 2021 12:35:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzfN5-0004iq-HB
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 12:35:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb1ed4e5-be60-4132-869e-d0a7b25e0178;
 Wed, 13 Jan 2021 12:35:26 +0000 (UTC)
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
X-Inumbo-ID: cb1ed4e5-be60-4132-869e-d0a7b25e0178
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610541326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lsM6AU5fGR8kr33O3g2UUwUGjkJ+Kdkf/6p0p71hTWs=;
  b=Ivimne2d5h2UvfWYH0Ut6I6nF1p8RfvW7rcsPhpzNwEOkPpo8B6mLfJD
   DlO+TXtIHKWuw3mhspwrN+te4fgQ8kFI6fpOw/KuQ2OyF4q+d5bIMXu3c
   nNKe0iMUaLfWAam3MDn2p6oFLnrrXHoLi1x/W92aHmWmemso9wx+0NNQ7
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5DYE8eBCBtl8iIRnZ8GI0wOdAN7pkXjfL3FQX8lyNTQQtQEt06aUGcMz0Vc1fNYgSGAI1kwza9
 HzKHobaW/OFxSy9D/vSF7FsZOaKS438FxncFkWdRHV0q0qQ839z0fTmbnSl6od4KLzu863Vx3H
 adLD/Qk7b2Bp/9Xos18NoDIZZuj/WC5oNC5t/N6rpFGM9Q6a4X3YNfSFrW0rvVg+9BZ/5HIi3Y
 /nwdTY3qJb9E+EcK3dxzYX5geQcBH7ufUoQdVolr+FHzN6/QGwfSRhzjy5b65Ln2e/5Y2DXhKA
 2d4=
X-SBRS: 5.2
X-MesageID: 36282269
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="36282269"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <amc96@cam.ac.uk>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Tamas K
 Lengyel" <tamas@tklengyel.com>
Subject: [PATCH 2/3] tools: Move xen-access from tests/ to misc/
Date: Wed, 13 Jan 2021 12:34:54 +0000
Message-ID: <20210113123455.23209-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210113123455.23209-1-andrew.cooper3@citrix.com>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

xen-access is a tool for a human to use, rather than a test.  Move it
into misc/ as a more appropriate location to live.

Move the -DXC_WANT_COMPAT_DEVICEMODEL_API from CFLAGS into xen-access.c itself
to avoid adding Makefile complexity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 .gitignore                                    |  1 -
 tools/misc/.gitignore                         |  1 +
 tools/misc/Makefile                           |  4 ++++
 tools/{tests/xen-access => misc}/xen-access.c |  1 +
 tools/tests/Makefile                          |  1 -
 tools/tests/xen-access/Makefile               | 33 ---------------------------
 6 files changed, 6 insertions(+), 35 deletions(-)
 rename tools/{tests/xen-access => misc}/xen-access.c (99%)
 delete mode 100644 tools/tests/xen-access/Makefile

diff --git a/.gitignore b/.gitignore
index 1b54ea3111..630bdf5b99 100644
--- a/.gitignore
+++ b/.gitignore
@@ -272,7 +272,6 @@ tools/tests/x86_emulator/*sse*.[ch]
 tools/tests/x86_emulator/test_x86_emulator
 tools/tests/x86_emulator/x86_emulate
 tools/tests/x86_emulator/xop*.[ch]
-tools/tests/xen-access/xen-access
 tools/tests/xenstore/xs-test
 tools/tests/mem-sharing/memshrtool
 tools/tests/mce-test/tools/xen-mceinj
diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index c5fe2cfccd..e332ed4ec7 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1 +1,2 @@
+xen-access
 xen-ucode
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 7d37f297a9..612b7002e5 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -30,6 +30,7 @@ INSTALL_SBIN                   += xenlockprof
 INSTALL_SBIN                   += xenperf
 INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
+INSTALL_SBIN                   += xen-access
 INSTALL_SBIN                   += xen-livepatch
 INSTALL_SBIN                   += xen-diag
 INSTALL_SBIN += $(INSTALL_SBIN-y)
@@ -73,6 +74,9 @@ clean:
 .PHONY: distclean
 distclean: clean
 
+xen-access: xen-access.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenevtchn) $(APPEND_LDFLAGS)
+
 xen-cpuid: xen-cpuid.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
 
diff --git a/tools/tests/xen-access/xen-access.c b/tools/misc/xen-access.c
similarity index 99%
rename from tools/tests/xen-access/xen-access.c
rename to tools/misc/xen-access.c
index 1ab4f6705f..4bbef0bd2e 100644
--- a/tools/tests/xen-access/xen-access.c
+++ b/tools/misc/xen-access.c
@@ -38,6 +38,7 @@
 #include <sys/mman.h>
 #include <poll.h>
 
+#define XC_WANT_COMPAT_DEVICEMODEL_API
 #include <xenctrl.h>
 #include <xenevtchn.h>
 #include <xen/vm_event.h>
diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 9077fa14d3..771715be0f 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -8,7 +8,6 @@ SUBDIRS-y += mem-sharing
 ifneq ($(clang),y)
 SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
-SUBDIRS-y += xen-access
 SUBDIRS-y += xenstore
 SUBDIRS-y += depriv
 SUBDIRS-$(CONFIG_HAS_PCI) += vpci
diff --git a/tools/tests/xen-access/Makefile b/tools/tests/xen-access/Makefile
deleted file mode 100644
index 131c9f375d..0000000000
--- a/tools/tests/xen-access/Makefile
+++ /dev/null
@@ -1,33 +0,0 @@
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-CFLAGS += -Werror
-CFLAGS += -DXC_WANT_COMPAT_DEVICEMODEL_API
-
-CFLAGS += $(CFLAGS_libxenctrl)
-CFLAGS += $(CFLAGS_libxenguest)
-CFLAGS += $(CFLAGS_libxenevtchn)
-CFLAGS += $(CFLAGS_xeninclude)
-
-TARGETS-y := xen-access
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
-xen-access: xen-access.o Makefile
-	$(CC) -o $@ $< $(LDFLAGS) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenevtchn)
-
-install uninstall:
-
--include $(DEPS_INCLUDE)
-- 
2.11.0


