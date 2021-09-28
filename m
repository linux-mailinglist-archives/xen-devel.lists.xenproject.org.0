Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B341B29F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 17:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198057.351363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEft-0000JR-Ax; Tue, 28 Sep 2021 15:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198057.351363; Tue, 28 Sep 2021 15:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVEft-0000H0-7x; Tue, 28 Sep 2021 15:05:41 +0000
Received: by outflank-mailman (input) for mailman id 198057;
 Tue, 28 Sep 2021 15:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYy3=OS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVEfs-0000Gu-00
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:05:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e96eb628-464f-45af-a228-1fa21c972f1d;
 Tue, 28 Sep 2021 15:05:37 +0000 (UTC)
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
X-Inumbo-ID: e96eb628-464f-45af-a228-1fa21c972f1d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632841537;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t4N6GveHunfJ9nebUVgW4voK28bT2ubxAXBe44+qI+s=;
  b=CnjOOVLleaq2chW+Ti9L5xnMgOBzTwhozQ8dkoIwx/jTHjU/4HCjzzcD
   +02fx4MArchM38ORD4aeNPtj98BPl0wjy2hPqtdryU2TerTfXDKtC3WVc
   dboi3ec2zKhmC3vzcLRPIo6+VHE4qo4l6E6RC1V/2aL7NSijyZd5+mNAE
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WhM88Z2Tkik1qIBPkoytTeI0aWddivQWo+FuOjB4cCBlXcaJ6AWn+5/EEcBEeW60HoocPJj2tl
 aADFTszH42lQOEK3zJmNpPVa/7nlvW21Ro8HONt6qqGFV80+R1I/V/4sXNKBKSHvvadZZQoXgj
 wC6O9IcfKlO+DK6j9ZMDVXbQMp8IMpTmcXfgQauO9Mt36R01/b6KGosdIeDjYcf6dL9X7CxL0S
 UQAB04ZIIjuau6NHv5VpD4nxTXMfYbE/u+b3zphOhywrs4MAvaC3Wuol9zvPETh+DOga2KyWaH
 c5Z7pORopxbYRPa4VY9X90dW
X-SBRS: 5.1
X-MesageID: 53808741
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9LvhfKL7kOvM2sG0FE+RU5IlxSXFcZb7ZxGr2PjKsXjdYENS3zAHn
 2seCm3UbP+CNDDwfdBxaN+08x8E6J/Qz99lSARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5y7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB23pIxb1
 tpKuKbuTDhyY7/RlMstDBthRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpr1pgeQqqHD
 yYfQTxNMgvkWkZtBk8OIcwOl/65qSDUKSIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQoWGGlg4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqWxRYZxUK5NTZ/oQM1U/dU9pMIPG3t4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvFuOATP8hu9tTMv1P9X3tQizAeNodt7xc7WXg
 JQTdyFyBsggCouR3AiEXekABr2g4/vt3Nb02gU0R8hJG9hA4ReekWFsDNNWeBsB3iUsI2aBj
 KrvVeV5v8Q70JyCN/MfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ3y/5ha
 c3CK5r1Vh727JiLKhLtHI/xNpdxmkgDKZ77H8inn3xLL5LEDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3CoXDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg5M+6wAcYj8yhrVcHuVH7xs0UejU+UxP93X/MKkXMPrYSPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:2envy693Ua6gtQr6yl1uk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,329,1624334400"; 
   d="scan'208";a="53808741"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v5] xen: rework `checkpolicy` detection when using "randconfig"
Date: Tue, 28 Sep 2021 16:04:51 +0100
Message-ID: <20210928150451.786582-1-anthony.perard@citrix.com>
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

We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
via .gitignore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
v5:
- remove changes to common/Kconfig in order to avoid change in
  behavior for "default y if m" in future Kconfig update as the current
  behavior doesn't seems to be explicitly documented.

v4:
- keep XEN_ prefix for HAS_CHECKPOLICY
- rework .allconfig.tmp file generation, so it is easier to read.
- remove .allconfig.tmp on clean, .*.tmp files aren't all cleaned yet,
  maybe for another time.
- add information about file name choice and Kconfig change in patch
  description.

v3:
- use KCONFIG_ALLCONFIG
- don't override XSM_FLASK_POLICY value unless we do randconfig.
- no more changes to the current behavior of kconfig, only to
  randconfig.

v2 was "[XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy binary is available"
---
 Config.mk    |  6 ------
 xen/Makefile | 20 +++++++++++++++++---
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/Config.mk b/Config.mk
index e85bf186547f..d5490e35d03d 100644
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
index f47423dacd9a..7c2ffce0fc77 100644
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
 
+export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
+
 export root-make-done := y
 endif # root-make-done
 
@@ -189,14 +193,24 @@ ifeq ($(config-build),y)
 # *config targets only - make sure prerequisites are updated, and descend
 # in tools/kconfig to make the *config target
 
+# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
+# This will be use by kconfig targets allyesconfig/allmodconfig/allnoconfig/randconfig
+filechk_kconfig_allconfig = \
+    $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_POLICY=n';) \
+    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
+    :
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
 
@@ -368,7 +382,7 @@ _clean: delete-unfresh-files
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s include/asm-*/asm-offsets.h
-	rm -f .banner
+	rm -f .banner .allconfig.tmp
 
 .PHONY: _distclean
 _distclean: clean
-- 
Anthony PERARD


