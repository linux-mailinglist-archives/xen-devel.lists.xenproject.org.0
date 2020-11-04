Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3EE2A66ED
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19335.44494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaKES-00078f-Ks; Wed, 04 Nov 2020 14:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19335.44494; Wed, 04 Nov 2020 14:57:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaKES-00078B-F6; Wed, 04 Nov 2020 14:57:52 +0000
Received: by outflank-mailman (input) for mailman id 19335;
 Wed, 04 Nov 2020 14:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaKER-000784-6I
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:57:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c70428e-56ad-41b3-8cd0-7f5b1accbc6d;
 Wed, 04 Nov 2020 14:57:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65796AC54;
 Wed,  4 Nov 2020 14:57:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaKER-000784-6I
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:57:51 +0000
X-Inumbo-ID: 9c70428e-56ad-41b3-8cd0-7f5b1accbc6d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9c70428e-56ad-41b3-8cd0-7f5b1accbc6d;
	Wed, 04 Nov 2020 14:57:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604501869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+X9gG1oEAo6Wk53sLH4eZIywq3UxBtoZ9RSq33l1T1c=;
	b=ghX/nGlbchMhuTt8Bdhh6ONd94n8e2xV4RuJpyulAVNCXSfcIGi0kOVYw0723jcs/4UnTm
	EX+TsxtXSUgxrd2Y8wOUILqMdITqAjqGHauU6SLPx0l7bWELL0HsCEW3ki8ygdsckz5Hu4
	EzUYTwRXvorIOhSZUzdR5AJsfOf291s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 65796AC54;
	Wed,  4 Nov 2020 14:57:49 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] tools/python: pass more -rpath-link options to ld
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>
Message-ID: <8cf8cfa9-2b0c-123a-2d23-8932e61085fa@suse.com>
Date: Wed, 4 Nov 2020 15:57:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With the split of libraries, I've observed a number of warnings from
(old?) ld.

Instead of duplicating the additions in two places, introduce a setup.py
make variable holding all the common parts of the invocations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Pass on and use SHLIB_libxen*.
---
It's unclear to me whether this is ld version dependent - the pattern
of where I've seen such warnings doesn't suggest a clear version
dependency.

Obviously (I think) the other similar variables (XEN_libxen*,
CFLAGS_libxen*, etc) would better also be made use of to eliminate at
least most of the PATH_* variables, but that's not the purpose of this
change.

--- a/tools/python/Makefile
+++ b/tools/python/Makefile
@@ -8,19 +8,21 @@ PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
 PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
+setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
+           SHLIB_libxenctrl="$(SHLIB_libxenctrl)" \
+           SHLIB_libxenguest="$(SHLIB_libxenguest)" \
+           SHLIB_libxenstore="$(SHLIB_libxenstore)" \
+           $(PYTHON) setup.py
+
 .PHONY: build
 build:
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
+	$(setup.py) build
 
 .PHONY: install
 install:
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
-		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
-		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
 		--root="$(DESTDIR)" --force
-
 	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
 
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -4,6 +4,10 @@ import os, sys
 
 XEN_ROOT = "../.."
 
+SHLIB_libxenctrl = os.environ['SHLIB_libxenctrl'].split()
+SHLIB_libxenguest = os.environ['SHLIB_libxenguest'].split()
+SHLIB_libxenstore = os.environ['SHLIB_libxenstore'].split()
+
 extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
 
 PATH_XEN      = XEN_ROOT + "/tools/include"
@@ -24,7 +28,7 @@ xc = Extension("xc",
                library_dirs       = [ PATH_LIBXENCTRL, PATH_LIBXENGUEST ],
                libraries          = [ "xenctrl", "xenguest" ],
                depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so", PATH_LIBXENGUEST + "/libxenguest.so" ],
-               extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
+               extra_link_args    = SHLIB_libxenctrl + SHLIB_libxenguest,
                sources            = [ "xen/lowlevel/xc/xc.c" ])
 
 xs = Extension("xs",
@@ -33,6 +37,7 @@ xs = Extension("xs",
                library_dirs       = [ PATH_XENSTORE ],
                libraries          = [ "xenstore" ],
                depends            = [ PATH_XENSTORE + "/libxenstore.so" ],
+               extra_link_args    = SHLIB_libxenstore,
                sources            = [ "xen/lowlevel/xs/xs.c" ])
 
 plat = os.uname()[0]

