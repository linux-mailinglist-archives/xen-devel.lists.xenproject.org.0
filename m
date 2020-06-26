Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529320B682
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 19:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joriy-0006aB-4a; Fri, 26 Jun 2020 17:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3dG=AH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1joriw-0006a6-T8
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 17:01:10 +0000
X-Inumbo-ID: 9ff9bac0-b7ce-11ea-82ea-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ff9bac0-b7ce-11ea-82ea-12813bfff9fa;
 Fri, 26 Jun 2020 17:01:07 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ufexKxUoVzvf+iyp1rZjws5MHRIic1rcqUOdYgK0oKna6f6Lu7L94d9dRxKlNeKNrpjFlNt7iM
 udE3nwUWDd5g9ttBJpXWiY4ZnJW0HxMKqlVEYqKBQRakMl6g77wGHxkZxXCffTBqDVaPAqhqbG
 7OMKXitkjm7iD2mxc3xTgF/FtGo+qbh+rKWyhq8UavQWV/RAB5BCaTWjadNUkX1kZDwZICL+VR
 SurNmuXTcCH7rEqt6XB6m4j3kcI0DLm2MdeeKTyRBVGNufF4iTFRxsJpApcgOoTgzEk8mUG/5X
 APs=
X-SBRS: 2.7
X-MesageID: 21848203
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21848203"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] tools/configure: drop BASH configure variable
Date: Fri, 26 Jun 2020 18:00:38 +0100
Message-ID: <20200626170038.27650-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a weird variable to have in the first place.  The only user of it is
XSM's CONFIG_SHELL, which opencodes a fallback to sh, and the only two scripts
run with this are shebang sh anyway, so don't need bash in the first place.

Make the mkflask.sh and mkaccess_vector.sh scripts executable, drop the
CONFIG_SHELL, and drop the $BASH variable to prevent further use.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Paul Durrant <paul@xen.org>

./autogen.sh needs rerunning on commit.

RFC for 4.14.  This is a cleanup to the build system.

There is a separate check for [BASH] in the configure script, which is
checking the requirement for the Linux hotplug scripts.  Really, that is a
runtime requirement not a build time requirement, and it is rude to require
bash in a build environment on this basis.  IMO, that check wants dropping as
well.
---
 config/Tools.mk.in                      | 1 -
 tools/configure.ac                      | 1 -
 xen/xsm/flask/Makefile                  | 8 ++------
 xen/xsm/flask/policy/mkaccess_vector.sh | 0
 xen/xsm/flask/policy/mkflask.sh         | 0
 5 files changed, 2 insertions(+), 8 deletions(-)
 mode change 100644 => 100755 xen/xsm/flask/policy/mkaccess_vector.sh
 mode change 100644 => 100755 xen/xsm/flask/policy/mkflask.sh

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 23df47af8d..48bd9ab731 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -12,7 +12,6 @@ PYTHON              := @PYTHON@
 PYTHON_PATH         := @PYTHONPATH@
 PY_NOOPT_CFLAGS     := @PY_NOOPT_CFLAGS@
 PERL                := @PERL@
-BASH                := @BASH@
 XGETTTEXT           := @XGETTEXT@
 AS86                := @AS86@
 LD86                := @LD86@
diff --git a/tools/configure.ac b/tools/configure.ac
index 9d126b7a14..6614a4f130 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -297,7 +297,6 @@ AC_ARG_VAR([PYTHON], [Path to the Python parser])
 AC_ARG_VAR([PERL], [Path to Perl parser])
 AC_ARG_VAR([BISON], [Path to Bison parser generator])
 AC_ARG_VAR([FLEX], [Path to Flex lexical analyser generator])
-AC_ARG_VAR([BASH], [Path to bash shell])
 AC_ARG_VAR([XGETTEXT], [Path to xgetttext tool])
 AC_ARG_VAR([AS86], [Path to as86 tool])
 AC_ARG_VAR([LD86], [Path to ld86 tool])
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 07f36d075d..ba8f31a02c 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -8,10 +8,6 @@ CFLAGS-y += -I./include
 
 AWK = awk
 
-CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-          else if [ -x /bin/bash ]; then echo /bin/bash; \
-          else echo sh; fi ; fi)
-
 FLASK_H_DEPEND = policy/security_classes policy/initial_sids
 AV_H_DEPEND = policy/access_vectors
 
@@ -24,14 +20,14 @@ extra-y += $(ALL_H_FILES)
 
 mkflask := policy/mkflask.sh
 quiet_cmd_mkflask = MKFLASK $@
-cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
+cmd_mkflask = $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
 
 $(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
 mkaccess := policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
-cmd_mkaccess = $(CONFIG_SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
+cmd_mkaccess = $(mkaccess) $(AWK) $(AV_H_DEPEND)
 
 $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 	$(call if_changed,mkaccess)
diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
old mode 100644
new mode 100755
diff --git a/xen/xsm/flask/policy/mkflask.sh b/xen/xsm/flask/policy/mkflask.sh
old mode 100644
new mode 100755
-- 
2.11.0


