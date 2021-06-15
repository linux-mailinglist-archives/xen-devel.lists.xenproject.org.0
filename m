Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A43A865A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142282.262582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBr7-0002kq-LI; Tue, 15 Jun 2021 16:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142282.262582; Tue, 15 Jun 2021 16:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBr7-0002ix-HY; Tue, 15 Jun 2021 16:24:01 +0000
Received: by outflank-mailman (input) for mailman id 142282;
 Tue, 15 Jun 2021 16:23:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltBr5-0002ir-Nd
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:23:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f270937-ec10-4169-a767-df2b5c9094d9;
 Tue, 15 Jun 2021 16:23:58 +0000 (UTC)
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
X-Inumbo-ID: 7f270937-ec10-4169-a767-df2b5c9094d9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623774238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6YdOaL5KylmZkNkd/LcAJqbWCEoLcUzkQwf5yIAr7AQ=;
  b=JklyLH2WiZDBboUO3a2gOOBLg261dxVE/IV8anYccAqfE8d3RJyVvfV4
   ymrsSHBsCJVRNSXUlL22/cT/ktjjhVmQL+d1qereFXktZoaYhctYFtZUE
   pzhXw74Bh/5hUpXXObdqBdB3oQrubnY3dGLq/VA4+tY5peV8VMv+zcvyR
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gs87eUqGl0M/9UU75WbIMd38VSiTKcLnG/iMD30RY2ShXsd7o3Dl2ddIIudeT3xO9Yd8P3ak5c
 0f9eWO9D2KSl7C21WfQPpAmaODsJvSa8FAcPC91FuVvJObpoCf0KxA3uo8R90/fdz+PsuqgC9J
 YiQMN2Jjc8Rn4ugcoafVL3ovBSX1c9ZRrJsTAAGBUZQAprbV4W6JWYgnfw0yzUulD4zR+htd+M
 kucDi99EPNGOKApW3Ou0naDCaoEjBe9b8R2qNP68fQhLzol+Uss73ZyP0VBsCh3wg5u6vhNE1f
 qYs=
X-SBRS: 5.1
X-MesageID: 46186151
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:w6P3k6yQrTL3u2mWTtreKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46186151"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 4/5] tests/cpu-policy: Rework Makefile
Date: Tue, 15 Jun 2021 17:19:04 +0100
Message-ID: <20210615161905.9831-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210615161905.9831-1-andrew.cooper3@citrix.com>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, fill in the install/uninstall rules so this test can be
packaged to be automated sensibly.

Rework TARGET-y to be TARGETS, drop the unconditional -O3 and use the default
instead, and drop CFLAGS from the link line but honour APPEND_LDFLAGS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/tests/cpu-policy/Makefile | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tools/tests/cpu-policy/Makefile b/tools/tests/cpu-policy/Makefile
index 53b4f28b2a..ab3e0ffde3 100644
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -1,25 +1,23 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGET-y := test-cpu-policy
+TARGETS :=
 
 # For brevity, these tests make extensive use of designated initialisers in
 # anonymous unions, but GCCs older than 4.6 can't cope.  Ignore the test in
 # this case.
-ifneq ($(clang),y)
-TARGET-$(call cc-ver,$(CC),lt,0x040600) :=
-endif
-
-ifeq ($(TARGET-y),)
+ifneq ($(gcc)$(call cc-ver,$(CC),lt,0x040600),yy)
+TARGETS += test-cpu-policy
+else
 $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)))
 endif
 
 .PHONY: all
-all: $(TARGET-y)
+all: $(TARGETS)
 
 .PHONY: clean
 clean:
-	$(RM) -f -- *.o .*.d .*.d2 test-cpu-policy
+	$(RM) -f -- *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
@@ -27,15 +25,24 @@ distclean: clean
 
 .PHONY: install
 install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
 
 .PHONY: uninstall
+uninstall:
+	$(RM) -f -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
 
-CFLAGS += -Werror $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -O3
+CFLAGS += -Werror -D__XEN_TOOLS__
+CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(APPEND_CFLAGS)
 
-vpath %.c ../../../xen/lib/x86
+LDFLAGS += $(APPEND_LDFLAGS)
+
+vpath %.c $(XEN_ROOT)/xen/lib/x86
+
+*.o: Makefile
 
 test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
-	$(CC) $(CFLAGS) $^ -o $@
+	$(CC) $^ -o $@ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
-- 
2.11.0


