Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D125C46A265
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239519.415409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTg-0003P3-Bd; Mon, 06 Dec 2021 17:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239519.415409; Mon, 06 Dec 2021 17:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTf-0003G4-N8; Mon, 06 Dec 2021 17:08:35 +0000
Received: by outflank-mailman (input) for mailman id 239519;
 Mon, 06 Dec 2021 17:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPY-0005ti-9l
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cc123d2-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:19 +0100 (CET)
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
X-Inumbo-ID: 8cc123d2-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EhMsevpH10Vo5lsrbd8HMBQJe8BAiJGveppQnUZtweM=;
  b=UNPc3qf38AS57BFuoVBeIesUcO+Zzxks1p7BRXLgdFPVYgYrbvXo/YFN
   OWypbqTe7GEIEKsPIN063ZM0Ex1tblutWOD0rBQ97lwWpz4p4GvV0oHmi
   kmCmwdyqg6HQl6vHbM8aUcFdcf5eV2SoY6NeKuozks2Mj2zDmTNRJrovv
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7gHSWxTipzDruyc8beHxu7ykn5ZO6eho71NfjYqJhR0Qa/VqvEOx22soiCv84a1Lzp4qzcGyOJ
 RAas3Csww+eNvMMFRJ0OFmJzaJ2XBIJg56HZ98wieLzFzc7Rvox93g0jcX624oISXrzPis8Cel
 OsNkyCf3Avkvo4qi4IDuHzOu7vNp8dk3nkvfjPtDcAnkDatqjKmiTYZZvkk2cfrVJiZVhmj/DG
 tLIz+SecDJdjvEgEw94UVtG17zHBRfQS8xSGaL3+k8tF2nl6Bw7+39cp3VsvO3UQCIT/+W1sTB
 XgCSUaFMUNB4GlFWTPvnSsun
X-SBRS: 5.1
X-MesageID: 59370712
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sEBDdqDtauODgxVW/9jkw5YqxClBgxIJ4kV8jS/XYbTApGwi1DcAz
 zdOCD/XOayLZjf0e4h/Ot+xoEtTvMPWz9cxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/k2XQnvF/0
 vZxmJWBZzUoZZ2RpckdTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjWxv3p8XR54yY
 eI6MiVySy7LfidRYH0MVNUPmOqNmT7wJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSXv
 GXd5EziHwoXcteYzFKt822urv/CmzvhX4AfH6H+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtD7Qx2/pm/CphMGUsBcO+I/4QCJjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHqO3MSFOT7JSogDqDFxoUdl9fWAIEUl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjv9tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWS0bb1HRcBJG9GRF5iLJ9o4DNZWfhgBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66PPoUUM8UrLlHYrEmCgHJ8OUi3yiDAdollZ
 v+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwJzLqVp
 S/kBRcDoLc97FWeQTi3hrlYQOuHdf5CQbgTZkTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:+KPxQa5VGOIhYMCVpwPXwMLXdLJyesId70hD6qhwISY7TiX+rb
 HKoB17726StN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxelZnO/fKlbbdREWmNQw6U
 4ZSdkcNOHN
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370712"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 42/57] libs,tools/include: Clean "clean" targets
Date: Mon, 6 Dec 2021 17:02:25 +0000
Message-ID: <20211206170241.13165-43-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need for an extra "cleanlocal" target, we can use
double-colon rules instead.

Generated headers are now in tools/include/, so remove those file
there.

Remove -f flag as it's already in $(RM).

libs.mk:
  - don't try to remove "*.rpm" anymore.

libs/light:
  - "_paths.*.tmp" isn't created anymore.
  - clean "libxenlight_test.so" and "libxl_test_*.opic".

libs/util:
  - fix clean of version-script file.

include/xen-foreign:
  - remove __pycache__

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk                 |  4 ++--
 tools/include/Makefile             |  1 +
 tools/include/xen-foreign/Makefile |  1 +
 tools/libs/ctrl/Makefile           |  5 +----
 tools/libs/guest/Makefile          |  3 +--
 tools/libs/light/Makefile          | 19 ++++++++-----------
 tools/libs/stat/Makefile           |  5 +----
 tools/libs/util/Makefile           |  7 ++-----
 tools/libs/vchan/Makefile          |  5 +----
 9 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 7f2c676be4..3078e45cf4 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -121,8 +121,8 @@ TAGS:
 	etags -t *.c *.h
 
 .PHONY: clean
-clean:
-	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
+clean::
+	rm -rf $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
diff --git a/tools/include/Makefile b/tools/include/Makefile
index 42605d46b9..a9c11d06c8 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -80,6 +80,7 @@ uninstall:
 clean:
 	rm -rf xen xen-xsm acpi
 	$(MAKE) -C xen-foreign clean
+	rm -f _*.h
 
 .PHONY: dist
 dist: install
diff --git a/tools/include/xen-foreign/Makefile b/tools/include/xen-foreign/Makefile
index 6ce51daf5e..b538d0ea94 100644
--- a/tools/include/xen-foreign/Makefile
+++ b/tools/include/xen-foreign/Makefile
@@ -13,6 +13,7 @@ clean:
 	rm -f $(headers)
 	rm -f checker checker.c
 	rm -f *.pyc *.o *~
+	rm -rf __pycache__
 
 distclean: clean
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 5d866b8d04..a46e30a168 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -56,8 +56,5 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 
 -include $(DEPS_INCLUDE)
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f libxenctrl.map
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 636b4ea5cb..67837c4e73 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -106,6 +106,5 @@ libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
 
 -include $(DEPS_INCLUDE)
 
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f libxenguest.map
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 5e52db9b30..719630eda2 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -250,17 +250,14 @@ install:: $(LIBHEADERS) libxl-save-helper
 uninstall::
 	rm -f $(DESTDIR)$(LIBEXEC_BIN)/libxl-save-helper
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
-	$(RM) -f _*.h *.o $(CLIENTS)
-	$(RM) -f _*.c *.pyc _paths.*.tmp _*.api-for-check
-	$(RM) -f testidl.c.new testidl.c *.api-ok
-	$(RM) -f $(TEST_PROGS)
-	$(RM) -rf __pycache__
-	$(RM) -f libxenlight.map
-	$(RM) -f $(AUTOSRCS) $(AUTOINCS)
+clean::
+	$(RM) _*.h *.o $(CLIENTS)
+	$(RM) _*.c *.pyc _*.api-for-check
+	$(RM) testidl.c.new testidl.c *.api-ok
+	$(RM) $(TEST_PROGS) libxenlight_test.so libxl_test_*.opic
+	$(RM) -r __pycache__
+	$(RM) libxenlight.map
+	$(RM) $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index c8c81048c0..24b5949b3e 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -115,10 +115,7 @@ install: install-perl-bindings
 uninstall: uninstall-perl-bindings
 endif
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f $(BINDINGS) $(BINDINGSRC) $(DEPS_RM)
 	rm -f libxenstat.map
 
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 87425d862a..4e41bc9ff0 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -51,8 +51,5 @@ $(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS)
 
 -include $(DEPS_INCLUDE)
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
-	$(RM) -f libxlutil.map
+clean::
+	$(RM) libxenutil.map
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index df112f1b88..f6f1002800 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -13,8 +13,5 @@ NO_HEADERS_CHK := y
 include $(XEN_ROOT)/tools/libs/libs.mk
 -include $(DEPS_INCLUDE)
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f libxenvchan.map
-- 
Anthony PERARD


