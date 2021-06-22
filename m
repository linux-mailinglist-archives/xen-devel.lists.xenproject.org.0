Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F03B0CC7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146027.268650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1z-0004Ox-SV; Tue, 22 Jun 2021 18:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146027.268650; Tue, 22 Jun 2021 18:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl1z-0004Mv-P2; Tue, 22 Jun 2021 18:21:51 +0000
Received: by outflank-mailman (input) for mailman id 146027;
 Tue, 22 Jun 2021 18:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl1z-0002zl-2W
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:21:51 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96f7003a-5612-49b9-808a-f7dedefdfffc;
 Tue, 22 Jun 2021 18:21:36 +0000 (UTC)
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
X-Inumbo-ID: 96f7003a-5612-49b9-808a-f7dedefdfffc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5PxTKbRVgESGjhDeGvA5yScbwAfUHH/0kZsWSvQHRtg=;
  b=PX+ADeaTNspKM4iPe94x6j52yqj2NjNwVGH07aWQ+EOVeqp5FozrUc2u
   KQkzQM83Y9CN3j9oJ5bKzcb7gmikicaEUBq9f17gZBY9U9cnFLUFmjZIy
   SYh+gMXvbSmkTL9PqSpB551bbIiqh5TekclEmApOqDBsskl6d+5MYgKEy
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nNBSgmEc2l3uPwrXLlSutjFcrc/TtqFKiKywnwAIDNwZx4wjNqh+Dtk4VAYdwfHtX706zFsS/Y
 rE9NIpz+4BegSTjK6W5Eb7FU3eARVzY632hfWOfQiIeUIYT6WmvBGoSW8nyk8wFuBysEv23rnb
 p1JMXNzKSoHYJakbEiYpqU3z8eiUfzTvnFDfp234VfcxsZ+itkW8W+5Vh3nVAzfUL9cDMtepNm
 nAOSYtGHilnVwgiocSmtazJ6vtIYcUaZLFL0AQvt3ammidaun4Rv/VZKMAyXY+D9Bv/OV9sx5b
 WJU=
X-SBRS: 5.1
X-MesageID: 48311393
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0/v5M6kV6wZ7xVp3rYI/eMDVqtLpDfIW3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE8Ar5OUtQ4OxoV5PwIk80maQb3WBVB8bHYOCEghrPEGgB1/qB/9SIIUSXnYQxuZ
 uIMZIOb+EYZWIK9voSizPZLz9P+re6GdiT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="48311393"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH 4/4] tests/xenstore: Rework Makefile
Date: Tue, 22 Jun 2021 19:21:24 +0100
Message-ID: <20210622182124.11571-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622182124.11571-1-andrew.cooper3@citrix.com>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, fill in the install/uninstall rules so this test can be
packaged to be automated sensibly.

This causes the code to be noticed by CI, which objects as follows:

  test-xenstore.c: In function 'main':
  test-xenstore.c:486:5: error: ignoring return value of 'asprintf', declared
  with attribute warn_unused_result [-Werror=unused-result]
       asprintf(&path, "%s/%u", TEST_PATH, getpid());
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Address the CI failure by checking the asprintf() return value and exiting.

Rename xs-test to test-xenstore to be consistent with other tests.  Honour
APPEND_FLAGS too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>

v2:
 * Drop -f's
 * Fix CI breakage, now that CI can build the test.
---
 .gitignore                                         |  1 -
 tools/tests/xenstore/.gitignore                    |  1 +
 tools/tests/xenstore/Makefile                      | 31 +++++++++++++++-------
 .../tests/xenstore/{xs-test.c => test-xenstore.c}  |  8 ++++--
 4 files changed, 29 insertions(+), 12 deletions(-)
 create mode 100644 tools/tests/xenstore/.gitignore
 rename tools/tests/xenstore/{xs-test.c => test-xenstore.c} (98%)

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
index a367d88803..b9969dd090 100644
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
+	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
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
similarity index 98%
rename from tools/tests/xenstore/xs-test.c
rename to tools/tests/xenstore/test-xenstore.c
index c4c99c0661..d3574b3fa2 100644
--- a/tools/tests/xenstore/xs-test.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -20,6 +20,7 @@
  */
 
 #define _GNU_SOURCE
+#include <err.h>
 #include <getopt.h>
 #include <inttypes.h>
 #include <stdbool.h>
@@ -483,11 +484,14 @@ int main(int argc, char *argv[])
         return 0;
     }
 
-    asprintf(&path, "%s/%u", TEST_PATH, getpid());
+    if ( asprintf(&path, "%s/%u", TEST_PATH, getpid()) < 0 )
+        err(2, "asprintf() malloc failure\n");
+
     for ( t = 0; t < WRITE_BUFFERS_N; t++ )
     {
         memset(write_buffers[t], 'a' + t, WRITE_BUFFERS_SIZE);
-        asprintf(&paths[t], "%s/%c", path, 'a' + t);
+        if ( asprintf(&paths[t], "%s/%c", path, 'a' + t) < 0 )
+            err(2, "asprintf() malloc failure\n");
     }
 
     xsh = xs_open(0);
-- 
2.11.0


