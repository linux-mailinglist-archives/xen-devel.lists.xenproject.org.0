Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31822977F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 13:33:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyCzy-0000ud-QA; Wed, 22 Jul 2020 11:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyCzx-0000uK-Ci
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 11:33:21 +0000
X-Inumbo-ID: 2360078a-cc0f-11ea-a195-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2360078a-cc0f-11ea-a195-12813bfff9fa;
 Wed, 22 Jul 2020 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595417598;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=A9t0+R7n35AICnXzvZVgQOgQ4H3rGcr7mFvRi2qJNRU=;
 b=CK7g5yxAQSS0kmap45lwMmDeHycSv7Pwhsu5fBkS6LiD0LSXhO+gULLo
 s8pZOqJ3SS93R/9gv3qrWbGtwm9S7GFhkgXw/Y6yTbjy7mupht6bHEFe9
 Zom9oLvdNXSfAMKWZEYXsHmJLlQO4ZBu0ykh7HNHRuuwpqUXqeqNYr7D8 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: azuF+de7qNehpaOspaS+gw8SmO/Ig6kDLeW4xXeiUzrg23CW/kZfXjPXcQET2A1JZXOyJoCaZX
 KEPxajkUJZnjFmGIxjCB2ZoxacrWusdz6sz3pKzzcFQO6AK5OWYYWNZJeYFkmPKzb1miQqSSRX
 V8Mpd76qPru5UdSw4uHtZ5T5t0Hs09yHOF1wja8SYg0HLAA6f9AzGz0VNyiLBMNjwiPprzGUf8
 8EvPk33XrNeLjbWpscs5px0Lclq4vo3/X+uaIfkC59LeFzCbOUzw29rVyjTuf6wp5hWaAJU8gz
 Ipo=
X-SBRS: 2.7
X-MesageID: 23787972
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23787972"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] tools/configure: drop BASH configure variable
Date: Wed, 22 Jul 2020 12:32:58 +0100
Message-ID: <20200722113258.3673-1-andrew.cooper3@citrix.com>
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
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
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

./autogen.sh needs rerunning on commit.

v2:
 * Use $(SHELL)

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
index 07f36d075d..50bec20a1e 100644
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
+cmd_mkflask = $(SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
 
 $(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
 mkaccess := policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
-cmd_mkaccess = $(CONFIG_SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
+cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
 
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


