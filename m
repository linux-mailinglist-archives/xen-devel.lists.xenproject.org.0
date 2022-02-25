Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653894C4885
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279282.476991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKr-0001fh-La; Fri, 25 Feb 2022 15:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279282.476991; Fri, 25 Feb 2022 15:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKr-0001cA-5q; Fri, 25 Feb 2022 15:16:45 +0000
Received: by outflank-mailman (input) for mailman id 279282;
 Fri, 25 Feb 2022 15:16:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIP-0006fy-R5
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95676d2b-964d-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:14:11 +0100 (CET)
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
X-Inumbo-ID: 95676d2b-964d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lstnw/Cy7kkWvWE8Q3+svCB9Cq3t+tCtdqmShje5Wb4=;
  b=iCo1ZrnSy60EYtvdgjJU+nbJliVULEDnAgYxBv1dyaWTbEWtGMvTDrgY
   +VO52MMv5C5bnCm12+9EH9HspnMIan27OtMi/ZQp/1M37G5/6sUFr3/Ra
   HoVjFvGXocHKxhJHKMXCcgAcu2FTKVb8CZyv9HukXnF+msuxAqGaX0BhJ
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67264776
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CLdS6ameic96krdP7A9bnRfo5gz7JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfXWGDMqneN2WgL4wiYImx9RhTu8DXnINmSFdq/nw9ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYTgEOI47epskmUD5gMnFTOoFE4aPACC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNmAxMEufPXWjPH8lWIB5hcOWmULEfj5mr3+7te0d+ELMmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHN6Q0z2e6Vq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU97iaQ6bjqzj2aIVAlHhNGRN4/qMgfEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSKhRqjBNzAJrVkg
 JTis5LPhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bptbJWa1P
 ReL4Vs5CHpv0J2CN/4fj2WZUZlC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtZCfQhXdiFgXfgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:2FKlp6qBOvzFfhuOvMkasUcaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67264776"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 21/29] libs/stat: Fix and rework python-bindings build
Date: Fri, 25 Feb 2022 15:13:13 +0000
Message-ID: <20220225151321.44126-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
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
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - reviewed

 tools/libs/stat/Makefile                    | 27 +++++++++++++++------
 tools/libs/stat/bindings/swig/python/.empty |  1 -
 2 files changed, 19 insertions(+), 9 deletions(-)
 delete mode 100644 tools/libs/stat/bindings/swig/python/.empty

diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 998435d494..b8d75810fc 100644
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


