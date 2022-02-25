Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A04C4881
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279248.476925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKT-00077c-WE; Fri, 25 Feb 2022 15:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279248.476925; Fri, 25 Feb 2022 15:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKT-00074r-Q9; Fri, 25 Feb 2022 15:16:21 +0000
Received: by outflank-mailman (input) for mailman id 279248;
 Fri, 25 Feb 2022 15:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcII-0007Bf-QD
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9233d2c5-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:05 +0100 (CET)
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
X-Inumbo-ID: 9233d2c5-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ucmQHqhfA/0/4TjBEifr4fx+A1LGfu70XMt0V9W8px4=;
  b=XjNQ8kTxd1DYdklKUzRPdh0s4EdJDjQ75IjyFTmG00shNupOPGmg3q1H
   Wx4e62okaiccej9Ico6hky1VNSJAWtBKSzJbVPkuFvHWql7uPd/NmBsfj
   PDUEZQAGeb6dKvOvOtLmgSGaQPNmdZRFfzk6dfsOnH6EZRokC51sa21UD
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64433048
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:chIKra+G99YQrBgf6eO+DrUDhX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WMWCDjXPKqMajb0c49+aI7i8xhVuMDRzNFiG1Y5qyw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw24LkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaWOaA0zP6jRpPRDCgZ9Mzs9H61Nx7CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZZFMmE3MESojxtnEHk3MaIjk+mUnmT7Ug9c9BWclYs6yj2GpOB2+Oe0a4eEEjCQfu1XkVyfv
 Xnu5HniD1cRM9n34SWB2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4KtMb4huMz7fo81jAGU0kVH1jaNcZu5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uDA3Dt4ade51q2VtW
 lBeyqByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs0bZpdJWKxO
 BeL0e+02HO1FCH7BUOQS9jsY/nGMIC6TYi1PhwqRoAmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKPoN5LcAtTdiBT6FKfg5U/S9Nv6zFOQAkJY8I9C5t7I+SJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:1SBHSKyZzm3UNs6jJ+gNKrPwJr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZEmPH7P+VEssR4b+OxoVJPsfZq+z+8W3WByB9eftWDd0QPCRr2KhbGSpwEIcBeRygcy78
 tdmtBFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64433048"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v2 16/29] libs,tools/include: Clean "clean" targets
Date: Fri, 25 Feb 2022 15:13:08 +0000
Message-ID: <20220225151321.44126-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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

libs/stat:
  - don't remove $(DEPS_RM) from here as it is already done in
    "libs.mk".

libs/util:
  - fix clean of version-script file.

include/xen-foreign:
  - remove __pycache__

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - stop removing $(DEPS_RM) from libs/stat/Makefile.

 tools/include/Makefile             |  1 +
 tools/include/xen-foreign/Makefile |  1 +
 tools/libs/ctrl/Makefile           |  5 +----
 tools/libs/guest/Makefile          |  3 +--
 tools/libs/light/Makefile          | 19 ++++++++-----------
 tools/libs/stat/Makefile           |  8 ++------
 tools/libs/util/Makefile           |  7 ++-----
 tools/libs/vchan/Makefile          |  5 +----
 tools/libs/libs.mk                 |  4 ++--
 9 files changed, 19 insertions(+), 34 deletions(-)

diff --git a/tools/include/Makefile b/tools/include/Makefile
index d965987f55..3a03a0b0fa 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -82,6 +82,7 @@ uninstall:
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
index ef7362327f..f58c4ef1aa 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -54,8 +54,5 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f libxenctrl.map
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 2005d8a67d..56483c545f 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -104,6 +104,5 @@ include $(XEN_ROOT)/tools/libs/libs.mk
 
 libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
 
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f libxenguest.map
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 769e2a83e2..0c04a5b5cb 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -246,15 +246,12 @@ install:: $(LIBHEADERS) libxl-save-helper
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
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 1aef25a9bb..39a671d7ed 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -115,9 +115,5 @@ install:: install-perl-bindings
 uninstall:: uninstall-perl-bindings
 endif
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
-	rm -f $(BINDINGS) $(BINDINGSRC) $(DEPS_RM)
-	rm -f libxenstat.map
+clean::
+	$(RM) libxenstat.map $(BINDINGS) $(BINDINGSRC)
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 72fecb4c49..7a658e9446 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -49,8 +49,5 @@ $(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS)
 	@rm -f $*.[ch]
 	$(FLEX) --header-file=$*.h --outfile=$*.c $<
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
-	$(RM) -f libxlutil.map
+clean::
+	$(RM) libxenutil.map
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index 83a45d2817..4ccb4dd1f6 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -12,8 +12,5 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-clean: cleanlocal
-
-.PHONY: cleanlocal
-cleanlocal:
+clean::
 	rm -f libxenvchan.map
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index a173f59a8b..c2eaefc928 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -124,8 +124,8 @@ TAGS:
 	etags -t *.c *.h
 
 .PHONY: clean
-clean:
-	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
+clean::
+	rm -rf $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
-- 
Anthony PERARD


