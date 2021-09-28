Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C427E41AAC4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197816.351073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8g5-0005gd-Ha; Tue, 28 Sep 2021 08:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197816.351073; Tue, 28 Sep 2021 08:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8g5-0005eF-EL; Tue, 28 Sep 2021 08:41:29 +0000
Received: by outflank-mailman (input) for mailman id 197816;
 Tue, 28 Sep 2021 08:41:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYy3=OS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mV8g4-0005e9-IJ
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:41:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc305a6c-cbd2-44fa-aa61-5865c96f6667;
 Tue, 28 Sep 2021 08:41:26 +0000 (UTC)
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
X-Inumbo-ID: dc305a6c-cbd2-44fa-aa61-5865c96f6667
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632818486;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uhD1dDEr+NgpbOz1ALc8V4poGGrcepyylD1B5aZfytU=;
  b=agEyC1jtfqjjzy9kniYbilHRhcH+2vnxSlRsRA8FHLVYXltWiU7CBJgW
   PIMtpJukX7bNMgeMwduC4xq8otzTddJUtu3G6mNhhC0Ztq4HPO5xpOTUa
   PF2KDgNTH9XjmVDXXB+s3zWq0bL89bA2VbuWjkwX8u64tu9vopEBrnISv
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Pkx9B9BcgzkNmzknTCEOGIWQAQrI8nRjgMpxwumPRInNtYhAI99cg+nMMZ3NoVdkd26G68kXlq
 56NoarFJKAJFVr3yvzWPYrHTRxrIs4rBbTbbi91OuwJaHNodDqAZuvVjOzwydtpdDGbN02gpfm
 JDVk7+0xJ2zQshXbiWRj31BXev1XNxMLflk24oLDMrpIBS1GkpuFyPVFCrEH2phKkwQNdABLYy
 ClXxiJ4SR+Hy76DrrzQi7CZ0jD2nNR4KmANlqpKME77MnkDenD1e6XPJig0eQCZOEHLDtb8rwL
 wwUWAJoY5hFOTb5NUCfh2nch
X-SBRS: 5.1
X-MesageID: 53783735
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1ZBAQKIgimdQVTzkFE+RU5IlxSXFcZb7ZxGr2PjKsXjdYENS0GYHz
 mRMUTvVa/jfYzamfIolPo+z/RtS6JXXnddmSFNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5y7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Mk4lA4
 /MO5Ka3Cik5Y/PIyf8dcwFhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpr2ZAVQq2DD
 yYfQRpGUhuRRiFfAFwKU7EDwsC6wXb7MDIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQoWGGlg4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqYCNdfCAjoIjZp8Idnk+RSod4EI6tt4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvFuOATP8hu9tTMv1P9X3tQizAeNodt7xc7WXg
 JQTdyFyBsggCouR3AiEXekABr2g4/vt3Nb02gU0R8hJG9hA4ReekWFsDNNWeBsB3iUsI2aBj
 KrvVeV5v8Q70JyCN/MfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ3y/5ha
 c3CK5r1Vh727JiLKhLtHI/xNpdxmkgDKZ77H8inn3xLL5LEDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3CoXDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg5M+6wAcYj8yhrVcHuVH7xs0UejU+UxP93X/MKkXMPq4SPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:9nYjK6HWcmhPo9GspLqFW5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhcYtKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAudD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dl8awTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontRrcZrau5h+7f63+40owwbX+0KVjUNaKvq/VQUO0aOSAZAR4Z
 /xSlkbTp1OAjjqDxyISFPWqnXdOXAVmjHfIBaj8AXeScCVfkNEN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amCa/hGrDv8nZMZq59as5Wfa/pqVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV/Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r8NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC7q
 gpkGkowlLaXniee/Fm8Kc7giwlcV/NKQgFkPsulqSRkoeMN4bWDQ==
X-IronPort-AV: E=Sophos;i="5.85,329,1624334400"; 
   d="scan'208";a="53783735"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v4] xen: rework `checkpolicy` detection when using "randconfig"
Date: Tue, 28 Sep 2021 09:39:43 +0100
Message-ID: <20210928083944.780398-1-anthony.perard@citrix.com>
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

Remove '= y' in Kconfig as it isn't needed, only a value "y" is true,
anything else is considered false.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
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
 Config.mk          |  6 ------
 xen/Makefile       | 20 +++++++++++++++++---
 xen/common/Kconfig |  2 +-
 3 files changed, 18 insertions(+), 10 deletions(-)

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
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785e7..eb6c2edb7bfe 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -251,7 +251,7 @@ config XSM_FLASK_AVC_STATS
 
 config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
-	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
+	default y if "$(XEN_HAS_CHECKPOLICY)"
 	depends on XSM_FLASK
 	---help---
 	  This includes a default XSM policy in the hypervisor so that the
-- 
Anthony PERARD


