Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942C327A534
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 03:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMhwM-0001wr-MI; Mon, 28 Sep 2020 01:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kMhwK-0001wm-KC
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 01:26:52 +0000
X-Inumbo-ID: 47c241d1-e027-4090-86d8-604d61227d03
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47c241d1-e027-4090-86d8-604d61227d03;
 Mon, 28 Sep 2020 01:26:51 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08S1QfK6078840
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 27 Sep 2020 21:26:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08S1QfZx078839;
 Sun, 27 Sep 2020 18:26:41 -0700 (PDT) (envelope-from ehem)
Date: Sun, 27 Sep 2020 18:26:41 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Marek =?unknown-8bit?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [RESEND] [PATCH] tools/python: Pass linker to Python build process
Message-ID: <20200928012641.GA78738@mattapan.m5p.com>
References: <202009120304.08C34lXv057827@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009120304.08C34lXv057827@m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Unexpectedly the environment variable which needs to be passed is
$LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
of the host `ld`.

Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
it can load at runtime, not executables.

This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
to $LDFLAGS which breaks many linkers.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Simply resending this.

Having looked around a bit, I believe this is a Python 2/3 compatibility
issue.  "distutils" for Python 2 likely lacked a separate $LDSHARED or
$LD variable, whereas Python 3 does have this.  Alas this is pointless
due to the above (unless you can cause distutils.py to do the final link
step separately).
---
 tools/pygrub/Makefile | 9 +++++----
 tools/python/Makefile | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
index 3063c4998f..37b2146214 100644
--- a/tools/pygrub/Makefile
+++ b/tools/pygrub/Makefile
@@ -3,20 +3,21 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
-PY_LDFLAGS = $(LDFLAGS) $(APPEND_LDFLAGS)
+PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
 .PHONY: all
 all: build
 .PHONY: build
 build:
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
 
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
-		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
+		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
+		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
 		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
diff --git a/tools/python/Makefile b/tools/python/Makefile
index 8d22c03676..b675f5b4de 100644
--- a/tools/python/Makefile
+++ b/tools/python/Makefile
@@ -5,19 +5,20 @@ include $(XEN_ROOT)/tools/Rules.mk
 all: build
 
 PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
-PY_LDFLAGS = $(LDFLAGS) $(APPEND_LDFLAGS)
+PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
 .PHONY: build
 build:
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
 
 .PHONY: install
 install:
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
-		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
+		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
+		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
 		--root="$(DESTDIR)" --force
 
 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
-- 
2.20.1


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



