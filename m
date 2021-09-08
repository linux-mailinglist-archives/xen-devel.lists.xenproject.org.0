Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E840389A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 13:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181784.329088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvaP-0005Fh-28; Wed, 08 Sep 2021 11:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181784.329088; Wed, 08 Sep 2021 11:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvaO-0005Dr-Uc; Wed, 08 Sep 2021 11:17:48 +0000
Received: by outflank-mailman (input) for mailman id 181784;
 Wed, 08 Sep 2021 11:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUO+=N6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNvaN-0005Dk-Dm
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:17:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e15f394f-9ca9-4501-8de3-bfa322d43296;
 Wed, 08 Sep 2021 11:17:46 +0000 (UTC)
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
X-Inumbo-ID: e15f394f-9ca9-4501-8de3-bfa322d43296
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631099866;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yFoFUnDtDv1Bx6JlM1glTN7fv8M7gM83RxpG34T+cRY=;
  b=ZbaEUlHZTA0s9AMBBVmOnBzNbWxZMAa6Uri1khm+QVM3NdTEX4mAuarx
   rYQc5n1pqBJUcb+xm3cAw9I4+0Su94Ug2IiN0/91IYDczmHek5GdrxL4q
   qbhJ+zzaBdH2WtEts/ZY+QaWDjfbaV1+ndCgwNSM3/LBZEpNkRjOFDIEH
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eJup9ZqHw10h4D/ZS5pZyXcOzlKqTsplKgaSzOy3lgSUgNnC0xL2D1DEtmDOsi+MyZy5D3z7iu
 EJo4Te53bMEeEYuZE1XZOyXMdxozW+HGQS+ymxbmOHjjgcFC+hVXiIVFpeL+GpuuTW9fjU8IID
 cvjRSX5Kb00xT3kDIiH8rYtZMCNKl1axeZiAeW/Yu2Beqz06s/IFEZ3ijsVxvMUU62aNOfmUxC
 rvKgSOaPvFGeg14yGV0msqMqFRPFkdfvew6uj6C7/lvOdsnu3q9ZozPPKTElLAWZLneRp/i3p3
 xCY2pPOryyrlwzmj5kVEnd6T
X-SBRS: 5.1
X-MesageID: 53998744
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Z2m7M6wW8HYwdS+Q8kRnKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZAmPH7P+VAssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyGJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="53998744"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v3] xen: rework `checkpolicy` detection when using "randconfig"
Date: Wed, 8 Sep 2021 12:17:27 +0100
Message-ID: <20210908111727.440265-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will help prevent the CI loop from having build failures when
`checkpolicy` isn't available when doing "randconfig" jobs.

To prevent "randconfig" from selecting XSM_FLASK_POLICY when
`checkpolicy` isn't available, we will actually override the config
output with the use of KCONFIG_ALLCONFIG.

Doing this way still allow a user/developer to set XSM_FLASK_POLICY
even when "checkpolicy" isn't available. It also prevent the build
system from reset the config when "checkpolicy" isn't available
anymore. And XSM_FLASK_POLICY is still selected automatically when
`checkpolicy` is available.
But this also work well for "randconfig", as it will not select
XSM_FLASK_POLICY when "checkpolicy" is missing.

This patch allows to easily add more override which depends on the
environment.

Also, move the check out of Config.mk and into xen/ build system.
Nothing in tools/ is using that information as it's done by
./configure.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
v3:
- use KCONFIG_ALLCONFIG
- don't override XSM_FLASK_POLICY value unless we do randconfig.
- no more changes to the current behavior of kconfig, only to
  randconfig.

v2 was "[XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy binary is available"
---
 Config.mk          |  6 ------
 xen/Makefile       | 18 ++++++++++++++++--
 xen/common/Kconfig |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/Config.mk b/Config.mk
index d0712724f8e4..144411133f38 100644
--- a/Config.mk
+++ b/Config.mk
@@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=y
 build_id_linker := --build-id=sha1
 endif
 
-ifndef XEN_HAS_CHECKPOLICY
-    CHECKPOLICY ?= checkpolicy
-    XEN_HAS_CHECKPOLICY := $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xen && echo y || echo n)
-    export XEN_HAS_CHECKPOLICY
-endif
-
 define buildmakevars2shellvars
     export PREFIX="$(prefix)";                                            \
     export XEN_SCRIPT_DIR="$(XEN_SCRIPT_DIR)";                            \
diff --git a/xen/Makefile b/xen/Makefile
index f47423dacd9a..89804aefe385 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?= $(shell hostname)
 PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
+export CHECKPOLICY	?= checkpolicy
+
 export BASEDIR := $(CURDIR)
 export XEN_ROOT := $(BASEDIR)/..
 
@@ -178,6 +180,8 @@ CFLAGS += $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+export HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
+
 export root-make-done := y
 endif # root-make-done
 
@@ -189,14 +193,24 @@ ifeq ($(config-build),y)
 # *config targets only - make sure prerequisites are updated, and descend
 # in tools/kconfig to make the *config target
 
+# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
+# This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
+filechk_kconfig_allconfig = \
+    $(if $(findstring n,$(HAS_CHECKPOLICY)),echo 'CONFIG_XSM_FLASK_POLICY=n';) \
+    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG), :)
+
+
+.allconfig.tmp: FORCE
+	set -e; { $(call filechk_kconfig_allconfig); } > $@
+
 config: FORCE
 	$(MAKE) $(kconfig) $@
 
 # Config.mk tries to include .config file, don't try to remake it
 %/.config: ;
 
-%config: FORCE
-	$(MAKE) $(kconfig) $@
+%config: .allconfig.tmp FORCE
+	$(MAKE) $(kconfig) KCONFIG_ALLCONFIG=$< $@
 
 else # !config-build
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11af3..73d8afb7bcbd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -235,7 +235,7 @@ config XSM_FLASK_AVC_STATS
 
 config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
-	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
+	default y if "$(HAS_CHECKPOLICY)"
 	depends on XSM_FLASK
 	---help---
 	  This includes a default XSM policy in the hypervisor so that the
-- 
Anthony PERARD


