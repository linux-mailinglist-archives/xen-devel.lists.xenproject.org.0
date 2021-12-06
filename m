Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7246A249
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239474.415184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSj-0000qc-3a; Mon, 06 Dec 2021 17:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239474.415184; Mon, 06 Dec 2021 17:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSi-0000nJ-Sd; Mon, 06 Dec 2021 17:07:36 +0000
Received: by outflank-mailman (input) for mailman id 239474;
 Mon, 06 Dec 2021 17:07:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPj-0005ti-Pj
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93194e60-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:30 +0100 (CET)
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
X-Inumbo-ID: 93194e60-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p5aAroINdY0XxstjIhOll7B4+KbnIHxusYrnLiZlbAY=;
  b=Pqr2cvAxtlIySiaJWHrtWXJOLgJFVDinliXRFLIJczfsqZLSMQKJ7jn+
   F5Ocly2PXPSP2GrJs/D0c7olTh/NAcxf5hLlMUFFAlsbXmLb9v6GB3h0r
   gsSveEpt6fjzwhFNllFgO0XayXI5+ZHwaY98Pb84AMuRCfRg0/Gy+GROs
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HBQFEQ+Y1u8kQ2/rCy/yYli3LDSL6ypUwUk7RO+01grHlWf6UQ/ZmXkXODPK73GhJsz/hPT65x
 lszt5Za7VFGBZ9rQR6qQYRCE2QQ6pKwZslXlC3CzIG3PGTqE8itXD1jyuUNTbxNjnJT6OdHDXT
 AwepTnXXDdrBelbcIKrytpl2sDp7GqQ1jiXL+WyWNMPH5QBL7mb4j+UjhfA67AtgVelfHLzfkp
 ZJu2UsIqVMstvwjSo46qF92JYoGVUr8f8g9ioEE6rgGij8jXxmhV2ByvFsSVqluDfid5P1NAKz
 7srUcgCrRnB+lvJuNloc51IC
X-SBRS: 5.1
X-MesageID: 59324146
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZiC+katT2BP3OfOz8s5ve02bpefnVKdZMUV32f8akzHdYApBsoF/q
 tZmKW/SMviDYDP1LYwjO4+woUpUup6HmN9jQAM6+S8zEy4S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cy2YbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplurXpbQoQHZT2qronekIIIzkvB/F50eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 pFDNWMzMnwsZTVhIF0NGct9t920h2XfUHp9kH67r60etj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMVLtuE0hKe72mhwOTImEvTWZ0QPK218OZwh1+ezXBVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhcaR9pXFfx88AyXw7DYywmcD2kACDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8ohrrHSUsDlY4V3E+ZFBV08Gymt0Mp0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9XwsQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJqm3FF52LJ9k4DNRCyKFBaJxsldjBO
 hC7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHcrH40NBPKhT6ywCDAdJ3T3
 7/BK65A6l5AVsxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcEkgei3iOedl3RAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:kNp2CaxHh+WItbtFnv2GKrPwAr1zdoMgy1knxilNoERuA6ilfr
 OV7ZMmPH7P+U0ssR4b+exoVJPsfZqYz+8R3WBzB8bZYOCFghrKEGgK1+KLqFfd8m/Fh4xgPM
 xbHJSWfeeQMbEMt6jHCWeDf+rJHLG8gd2VbKzlvhFQpElRGthdBilCe36mLnE=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59324146"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 47/57] libs/stat: Fix and rework python-bindings build
Date: Mon, 6 Dec 2021 17:02:30 +0000
Message-ID: <20211206170241.13165-48-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix the dependency on the library, $(SHLIB) variable doesn't exist
anymore.

Rework dependency on the include file, we can let `swig` generate the
dependency for us with the use of "-M*" flags.

The xenstat.h file has moved so we need to fix the include location.

Rather than relaying on the VCS to create an empty directory for us,
we can create one before generating the *.c file for the bindings.

Make use of generic variable names to build a shared library from a
source file: CFLAGS, LDFLAGS, and LDLIBS.

Fix python's specific *flags by using python-config, and add them to
generic flags variables: CFLAGS, LDLIBS.

To build a shared library, we need to build the source file with
"-fPIC", which was drop by 6d0ec05390 (tools: split libxenstat into
new tools/libs/stat directory).

The source file generated by swig seems to be missing a prototype for
the "init" function, so we need "-Wno-missing-prototypes" in order to
build it.

Add some targets to .PHONY.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/stat/Makefile                    | 27 +++++++++++++++------
 tools/libs/stat/bindings/swig/python/.empty |  1 -
 2 files changed, 19 insertions(+), 9 deletions(-)
 delete mode 100644 tools/libs/stat/bindings/swig/python/.empty

diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index e39fe29bd1..d5d9cb3659 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -49,23 +49,34 @@ install-bindings: install-perl-bindings install-python-bindings
 .PHONY: uninstall-bindings
 uninstall-bindings: uninstall-perl-bindings uninstall-python-bindings
 
-$(BINDINGS): $(SHLIB) $(SHLIB_LINKS) include/xenstat.h
+$(BINDINGS): libxenstat.so
 
-SWIG_FLAGS=-module xenstat -Iinclude -I.
+SWIG_FLAGS = -module xenstat -I$(XEN_INCLUDE)
+SWIG_FLAGS += -MMD -MP -MF .$(if $(filter-out .,$(@D)),$(subst /,@,$(@D))@)$(@F).d
 
 # Python bindings
-PYTHON_VERSION=$(PYTHON:python%=%)
-PYTHON_FLAGS=-I/usr/include/python$(PYTHON_VERSION) -lpython$(PYTHON_VERSION)
 $(PYMOD): $(PYSRC)
 $(PYSRC): bindings/swig/xenstat.i
-	swig -python $(SWIG_FLAGS) -outdir $(@D) -o $(PYSRC) $<
-
+	mkdir -p $(@D)
+	swig -python $(SWIG_FLAGS) -outdir $(@D) -o $@ $<
+
+$(PYLIB): CFLAGS += $(shell $(PYTHON)-config --includes)
+$(PYLIB): CFLAGS += -fPIC
+$(PYLIB): CFLAGS += -Wno-missing-prototypes
+$(PYLIB): LDFLAGS += $(SHLIB_LDFLAGS)
+$(PYLIB): LDLIBS := $(shell $(PYTHON)-config --libs)
+$(PYLIB): LDLIBS += $(LDLIBS_libxenstat)
 $(PYLIB): $(PYSRC)
-	$(CC) $(CFLAGS) $(LDFLAGS) $(PYTHON_FLAGS) $(SHLIB_LDFLAGS) -lxenstat -o $@ $< $(APPEND_LDFLAGS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
 
+.PHONY: python-bindings
 python-bindings: $(PYLIB) $(PYMOD)
 
-pythonlibdir=$(prefix)/lib/python$(PYTHON_VERSION)/site-packages
+pythonlibdir = $(shell $(PYTHON) -c \
+	       'import distutils.sysconfig as cfg; \
+	        print(cfg.get_python_lib(False, False, prefix="$(prefix)"))')
+
+.PHONY: install-python-bindings
 install-python-bindings: $(PYLIB) $(PYMOD)
 	$(INSTALL_PROG) $(PYLIB) $(DESTDIR)$(pythonlibdir)/_xenstat.so
 	$(INSTALL_PROG) $(PYMOD) $(DESTDIR)$(pythonlibdir)/xenstat.py
diff --git a/tools/libs/stat/bindings/swig/python/.empty b/tools/libs/stat/bindings/swig/python/.empty
deleted file mode 100644
index 2a8dd4274d..0000000000
--- a/tools/libs/stat/bindings/swig/python/.empty
+++ /dev/null
@@ -1 +0,0 @@
-This directory is empty; this file is included to prevent version control systems from removing the directory.
-- 
Anthony PERARD


