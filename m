Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E383A8645
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142264.262565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBnV-0001Sl-6r; Tue, 15 Jun 2021 16:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142264.262565; Tue, 15 Jun 2021 16:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBnV-0001Mt-1H; Tue, 15 Jun 2021 16:20:17 +0000
Received: by outflank-mailman (input) for mailman id 142264;
 Tue, 15 Jun 2021 16:20:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltBnU-0001I3-1Q
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:20:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97388bdc-2743-4f93-8aaa-34c51520979e;
 Tue, 15 Jun 2021 16:20:15 +0000 (UTC)
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
X-Inumbo-ID: 97388bdc-2743-4f93-8aaa-34c51520979e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623774014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AvUFbf3FSMcV+rluVuwGLyq8UftlOj+vpVc2Zx0Ih3c=;
  b=fG/JNQxiBlnVHxBaYAr10OFENtr0/fogTkbQuzalC5rVQJPHpVa7Til5
   7DmA/ZIHaP4GqSsDqtLNyillujqrxkiLEMBluGJSo4fcMWk0WmXzPxgAy
   T2eW66uZfRRLdFPJYdVtRhumPqNblyDwpDUmYWXrNInnnWzY4aISAZi5j
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: q5xrZZJri4rT2UW6TqANu9YkT7bgIzgR/i3TaOP9zZjx4NWlRnzChVlUfTvKm18qpmxKXuooe9
 +COybCnVGTXoJL/QcxIOY7AN6QPxVjw5iFOAXei2Cqg7M6h0HRQ79oaHDGmrAv9jPLcDsEGYSS
 w/X3PjGkvaSWGCZQLhg84drRu7NWNfsQ+NHy/xP5gcpORzEFS1t4+yMq12azvg8kaB5DIiwIqd
 zLguIR0wfOUZuxoxLPdE36gHfAgJ0z5IJ64BJ8+633Kr3OzGoW6J561QIeU6DpuTx3bpK5FE75
 K0Y=
X-SBRS: 5.1
X-MesageID: 46185793
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0lTbQq31AEh6IFNLlqwSTAqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46185793"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 5/5] tests/xenstore: Rework Makefile
Date: Tue, 15 Jun 2021 17:19:05 +0100
Message-ID: <20210615161905.9831-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210615161905.9831-1-andrew.cooper3@citrix.com>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, fill in the install/uninstall rules so this test can be
packaged to be automated sensibly.

Rename xs-test to test-xenstore to be consistent with other tests.  Honour
APPEND_FLAGS too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 .gitignore                                         |  1 -
 tools/tests/xenstore/.gitignore                    |  1 +
 tools/tests/xenstore/Makefile                      | 31 +++++++++++++++-------
 .../tests/xenstore/{xs-test.c => test-xenstore.c}  |  0
 4 files changed, 23 insertions(+), 10 deletions(-)
 create mode 100644 tools/tests/xenstore/.gitignore
 rename tools/tests/xenstore/{xs-test.c => test-xenstore.c} (100%)

diff --git a/.gitignore b/.gitignore
index d4b90303b2..8ebb51b6c5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -275,7 +275,6 @@ tools/tests/x86_emulator/*sse*.[ch]
 tools/tests/x86_emulator/test_x86_emulator
 tools/tests/x86_emulator/x86_emulate
 tools/tests/x86_emulator/xop*.[ch]
-tools/tests/xenstore/xs-test
 tools/tests/vpci/list.h
 tools/tests/vpci/vpci.[hc]
 tools/tests/vpci/test_vpci
diff --git a/tools/tests/xenstore/.gitignore b/tools/tests/xenstore/.gitignore
new file mode 100644
index 0000000000..4b44f5dd60
--- /dev/null
+++ b/tools/tests/xenstore/.gitignore
@@ -0,0 +1 @@
+test-xenstore
diff --git a/tools/tests/xenstore/Makefile b/tools/tests/xenstore/Makefile
index a367d88803..3c7b7073fd 100644
--- a/tools/tests/xenstore/Makefile
+++ b/tools/tests/xenstore/Makefile
@@ -1,11 +1,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += -Werror
-
-CFLAGS += $(CFLAGS_libxenstore)
-
-TARGETS-y := xs-test
+TARGETS-y := test-xenstore
 TARGETS := $(TARGETS-y)
 
 .PHONY: all
@@ -16,14 +12,31 @@ build: $(TARGETS)
 
 .PHONY: clean
 clean:
-	$(RM) *.o $(TARGETS) *~ $(DEPS_RM)
+	$(RM) -f -- *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
+	$(RM) -f -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -f -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
+
+CFLAGS += -Werror
+CFLAGS += $(CFLAGS_libxenstore)
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(LDLIBS_libxenstore)
+LDFLAGS += $(APPEND_LDFLAGS)
 
-xs-test: xs-test.o Makefile
-	$(CC) -o $@ $< $(LDFLAGS) $(LDLIBS_libxenstore)
+%.o: Makefile
 
-install uninstall:
+test-xenstore: test-xenstore.o
+	$(CC) -o $@ $< $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/tests/xenstore/xs-test.c b/tools/tests/xenstore/test-xenstore.c
similarity index 100%
rename from tools/tests/xenstore/xs-test.c
rename to tools/tests/xenstore/test-xenstore.c
-- 
2.11.0


