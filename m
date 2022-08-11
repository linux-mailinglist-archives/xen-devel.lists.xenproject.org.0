Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91E590548
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384918.620520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXE-0008FW-1V; Thu, 11 Aug 2022 16:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384918.620520; Thu, 11 Aug 2022 16:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXD-00084e-CE; Thu, 11 Aug 2022 16:59:51 +0000
Received: by outflank-mailman (input) for mailman id 384918;
 Thu, 11 Aug 2022 16:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNX-0003Aq-8h
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99f14366-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:44 +0200 (CEST)
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
X-Inumbo-ID: 99f14366-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dR83eQZUkBseSL1TT8Ybm7GdBrsNbP3ypihJcI9wWTg=;
  b=DmIbQsltO6d5Z/VTjJl1iNzjANfDxTKMqOLJjKXxRt+kuvUWk9iT1Hye
   dxEc5jk7XA7MvS5qi3WBG/TykDA2fwGpwXiBkA/urKE/FMQaCGZpJm50U
   JubTmTkd6zu/MzykJkZPBdqBE79NAyciHchm6TR+I7iGvm9fqLQVUgfA2
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77898114
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AmwNJlaksXp4cVxN+3mINEIHo5mJPLRN1VbBN2?=
 =?us-ascii?q?KgaYm36RzIEGi7MwEco7ei7X2ZQdm8EpoD9Y5lHzFUYqI9Fpq5fek2hZyTH7?=
 =?us-ascii?q?r5JptRazAfTr1EELKXvfEPq+ByDfNM6uT8a7r7mlV34rBkx8fxw4femqX/7o?=
 =?us-ascii?q?TEE0KZYNXvbigSTbgqBRwQzatawkbXCYDgXt4hKiJs4a4X2fCynhMLz/j+R8?=
 =?us-ascii?q?qnyFWAsm95gDiNmmBPU9f+wTimASqHr8hgbDXXRxpqY1jmhC2QI2yMZP59li?=
 =?us-ascii?q?f0jE/3B4e6sAi98/ZuFI0LswhRV8b+rdY+olUwI7WvQUZAmjlPmsTb4rjaZO?=
 =?us-ascii?q?ALUixCA57q7QIZERdN6ZjtumhiRf96o1qhjw84k9EK9KLXjW6kM2xy75Yizu?=
 =?us-ascii?q?W8sAutRTELoVAuE/0+gOptPx87Z//Su9u0V6M/qaiBLwT10OIRsEyMPi9PcA?=
 =?us-ascii?q?sbLqWrGB2C5qCbqpw6E7z9QHCJukGdZfvGL3YplreaSYkJYnSqDG4GaP32/M?=
 =?us-ascii?q?aM17E0b2G++kA65sOF0M6Bqg8/acqDvpp5tKd8TWOhuw+Mb31P6EwbmcjNWd?=
 =?us-ascii?q?g5Oz1kXDeR+TGUrZ/uPEXk8FuxcuxsGaKupFZ+Q16hKbnvdFFXsuHIK8Cr1O?=
 =?us-ascii?q?avtN36CncY96XJcP8sjnoisdij9gCeX2F/X4u3UmDGvMHYZVa/oEOdcKoQ19?=
 =?us-ascii?q?ULvYryDL0Zt0xeLQ3SgRpYTLiagqJGEI3LzUpKSu3zAq2yOQprQtqSfecF0O?=
 =?us-ascii?q?Vvebb46dNo5F//eqEm7FWNGYD4xzUXYhlu5UVx4IZnM+PRWJcKknV+d8hUsK?=
 =?us-ascii?q?OZ3DVzk4uJtrHwcfE4Ao1iIS9D5EojqOUgVjB/m0wUum/TFhqjypzDtTbZjm?=
 =?us-ascii?q?RbZIjnH0M9lEPB97Z6lWiPSemuv8VQhrfk7go817eECKCohgWD/3o1Zjo1Ph?=
 =?us-ascii?q?UOOC3uxYMMuiJ5wR+Mto0w+2WvMa7wTda8ncmh3cvn/R1xcggL4ioEK7BR4q?=
 =?us-ascii?q?oifHDqN24U7/PPEcrwmXQ8Fc3BR3CYIfjDiC5BZ8AFAW7zYyspFK2e6P22k6?=
 =?us-ascii?q?vLCrlvFKx4d0sHmAWTRtKclcgpWkhGrDPXi18rbQ1ED63XPd4Qqq/utw2VAa?=
 =?us-ascii?q?xiT8A+YFT+RMBxoXfiOojPb5c+FidIT7+PnqxT7GEGbJdH8w+Hp/jfZxEJdr?=
 =?us-ascii?q?EjZ49KPb1OTIr71Bo4YBoEgJis/8ZxO0/5vYG1b5mN9pqxRlFBmCEfDJWJzg?=
 =?us-ascii?q?+tJmJXml8G7mp3MJBauaqwaQuW5e9tAxzVRYnlAuKXBwewMcVXBX5nc6aFFI?=
 =?us-ascii?q?9F1PfWqUr+zD+db13hHTG3TrMuaevucN27mkGI4DDfAoR5ryW0YkvCRGeHKt?=
 =?us-ascii?q?93rmHeNmAZer7ocQMcyr+JQirdt500AnzktSV3nLaBls913VGcck1TNVmUEX?=
 =?us-ascii?q?rk0sZfXRhFTRAqP1nGarCxj3Cx2TSjhJ+Q2tmH/cea0Cuy5/wgVkd7y3dDBb?=
 =?us-ascii?q?hM9JhLcN/hlG5fcTgXdYggdh55egTjx55nS3zm+/4Fb+CfX9ay401u6Kdr8I?=
 =?us-ascii?q?56mK9HxA/UV5yd+TtUKpXvCbxKxDw42H/dxYQWpUFQd/TrjHjrrkPRDjoVBw?=
 =?us-ascii?q?XFPoDW6Uhq2nG+87UepzItGabj0R/5ZFSeeIGg0OK4VXwEWh8ASSvF21l25k?=
 =?us-ascii?q?nGaVeG7FoVcBLsyOzLDrN9lbCFvK9gDSmXHQNXNLJv+c2qVRdLfUV9tktIyu?=
 =?us-ascii?q?BIFLoYvCouuSTE/jZbwP6lG7hwW7V0/IbmA6zddkeRajeLe708YVBRXFWUDL?=
 =?us-ascii?q?UHJMW1bH94V1n7x7WEpwLrJchXBfA8UJUfsHwIy12+I9JlJMaM/jqeR9uFNM?=
 =?us-ascii?q?Ozf3YmwJraO18PJhS7e6DZhsSXO5t7ghEJElI4SuiUlHS0r3gHQuDsWowW+u?=
 =?us-ascii?q?KLWWbo0HiURuKQujVNEnPvVcMk3gMWa4W06WWsJN43TvCmRnqNL2Xt7DECQl?=
 =?us-ascii?q?kWXJAcy1/uYGBjG2Qx1Z4zPo6pTL8o+sZBoZxiipyRdsb0EBO3Vh92y3J8UP?=
 =?us-ascii?q?8X5MlTLeKrSzYojq6+GpogIumnMsHARZrpPWO2ZCAKCh0ygONT0XcRQobXxu?=
 =?us-ascii?q?CfkzFZMcmZayxwPKZAJEz192TjcNSYMBlaL6VJUVMkTMzQ1FtB07cl6IOyuE?=
 =?us-ascii?q?lLnriWiOp3jU4Ex6EsbJnFuFVrPWGDr4hr/0iJNhTxwsSfwrNwJ5bflV8Fts?=
 =?us-ascii?q?Rrw7RlJ2a/BBF19Os7Gaif/GNmVbcIMpCgRwbibF/PAPGznwj/ctHob6SQ8a?=
 =?us-ascii?q?4Uw8L92VW0f+nj5Yg6kd7s226vfNJp5V1kvI8+/M6v4LRtl4u5kuIP9d4ooZ?=
 =?us-ascii?q?4CW1nMkLU0X+Q65GIQ1I5pW8xZin5wGUqYqzHLgIc6K1+6MUkcr2IAldlJ3I?=
 =?us-ascii?q?XeTMXHvW2/6TsNrrLT+9L5NLMsToJnqFdsU9fF6v9Yb7fqFuuq/yKp7sIEDR?=
 =?us-ascii?q?vc1kdh/arVtVSBQ/Mh3s2/Iby1ppzXHp6fW2lJ9lNBdlxlN12JgC6Pyuum+t?=
 =?us-ascii?q?Cp8ibYQvDTubIF6VyCbMIpyemqZBaeogCWkc8TUSkdvLgTYTQftOzCmSpTdg?=
 =?us-ascii?q?meyhkV/6XMI2E6i3dr5FpMODD0a7e8ffmq/ncBqqaOf0zj6jM2nyYgzWx3um?=
 =?us-ascii?q?yXT+s8VtFuW578LlT9jCkgm9LLcgqSqmNuIBnr8PvTMUoO6VEeedDdlecCP5?=
 =?us-ascii?q?9Y4lskr7oTV+BDqbqMnutW5+TCvxeyFQzi+FGf81iLlSHh88NYpPvc0ZO/ux?=
 =?us-ascii?q?Yf7dR4hQjC6PGo/YuXl8nxiFhobNrudK6vU5f0niDcnyiSTfV4sLuyLpJSGO?=
 =?us-ascii?q?s3OLJZcn++DK3oOZJTn1HFc/VMfasPbGYBLcczMVzhwQvlzig3p1wNdOA+tU?=
 =?us-ascii?q?OA2xFnwd7BVkA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77898114"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH v4 26/32] libs: Fix auto-generation of version-script for unstable libs
Date: Thu, 11 Aug 2022 17:48:39 +0100
Message-ID: <20220811164845.38083-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When there isn't a version-script for a shared library (like for
unstable libs), we create one based on the current Xen version. But
that version-script became out-of-date as soon as Xen's version
changes and make as no way to regenerate the version-script on
rebuild.

In order to allow regenerating the script, we'll have a different
filename. In order to check if the content is up-to-date, we'll always
generated it and compare.

But we also need to know if there's already an existing version script
or if we need to generate one, for that we introduce $(version-script)
to be used to point to the path of the existing script. (Guessing if a
version script exist for a stable library with for example $(wildcard)
won't work as a file will exist when building the library without this
patch.)

We don't need the version-script unless we are making the shared
library so it is removed from the "all" target.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Alternatively, we could remove the need for to generate a
version-script, but that would mean the exported symbols won't have a
version anymore (like before, a few versions of Xen ago). Or, we could
use --default-symver, but the symboled would be versionned with the
soname (e.g. "libxenctrl.so.4.16.0") instead of "VERS_4.16.0".
---

Notes:
    v4:
    - new patch

 tools/libs/call/Makefile          |  1 +
 tools/libs/ctrl/Makefile          |  3 ---
 tools/libs/devicemodel/Makefile   |  1 +
 tools/libs/evtchn/Makefile        |  1 +
 tools/libs/foreignmemory/Makefile |  1 +
 tools/libs/gnttab/Makefile        |  1 +
 tools/libs/guest/Makefile         |  3 ---
 tools/libs/hypfs/Makefile         |  1 +
 tools/libs/light/Makefile         |  1 -
 tools/libs/stat/Makefile          |  2 +-
 tools/libs/store/Makefile         |  1 +
 tools/libs/toolcore/Makefile      |  1 +
 tools/libs/toollog/Makefile       |  1 +
 tools/libs/util/Makefile          |  3 ---
 tools/libs/vchan/Makefile         |  3 ---
 tools/libs/libs.mk                | 19 +++++++++++++------
 .gitignore                        |  6 ------
 17 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 103f5ad360..56a964b517 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 3
+version-script := libxencall.map
 
 include Makefile.common
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 93442ab389..094e84b8d8 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -10,6 +10,3 @@ PKG_CONFIG_NAME := Xencontrol
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-clean::
-	rm -f libxenctrl.map
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index b70dd774e4..20d1d112e7 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 4
+version-script := libxendevicemodel.map
 
 include Makefile.common
 
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index 3dad3840c6..18cdaab89e 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
+version-script := libxenevtchn.map
 
 include Makefile.common
 
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index b70dd774e4..81398e88b1 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 4
+version-script := libxenforeignmemory.map
 
 include Makefile.common
 
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index 3dad3840c6..4528830bdc 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
+version-script := libxengnttab.map
 
 include Makefile.common
 
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 19d3ff2fdb..93338a9301 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -14,6 +14,3 @@ NO_HEADERS_CHK := y
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
-
-clean::
-	rm -f libxenguest.map
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 630e1e6f3e..7fae5c750d 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 0
+version-script := libxenhypfs.map
 
 LDLIBS += -lz
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 13545654c2..1d5716dbba 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -252,6 +252,5 @@ clean::
 	$(RM) testidl.c.new testidl.c *.api-ok
 	$(RM) $(TEST_PROGS) libxenlight_test.so libxl_test_*.opic
 	$(RM) -r __pycache__
-	$(RM) libxenlight.map
 	$(RM) $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 7eaf50e91e..ee5c42bf7b 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -134,4 +134,4 @@ uninstall:: uninstall-perl-bindings
 endif
 
 clean::
-	$(RM) libxenstat.map $(BINDINGS) $(BINDINGSRC)
+	$(RM) $(BINDINGS) $(BINDINGSRC)
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 2334c953bb..300c271eb0 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR = 4
 MINOR = 0
+version-script := libxenstore.map
 
 ifeq ($(CONFIG_Linux),y)
 LDLIBS += -ldl
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 0d92b68b3b..20671dadd0 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
+version-script := libxentoolcore.map
 
 LIBHEADER := xentoolcore.h
 
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index 2361b8cbf1..d612227c85 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
+version-script := libxentoollog.map
 
 include Makefile.common
 
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 493d2e00be..e016baf888 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -47,6 +47,3 @@ $(OBJS-y) $(PIC_OBJS): $(AUTOINCS)
 %.c %.h:: %.l
 	@rm -f $*.[ch]
 	$(FLEX) --header-file=$*.h --outfile=$*.c $<
-
-clean::
-	$(RM) libxenutil.map
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index ac2bff66f5..a1ef60ac8e 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -11,6 +11,3 @@ OBJS-y += io.o
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-clean::
-	rm -f libxenvchan.map
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 3eb91fc8f3..cab8e9704a 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -4,6 +4,8 @@
 #   PKG_CONFIG: name of pkg-config file (xen$(LIBNAME).pc if empty)
 #   MAJOR:   major version of lib (Xen version if empty)
 #   MINOR:   minor version of lib (0 if empty)
+#   version-script: Specify the name of a version script to the linker.
+#     (If empty, a temporary one for unstable library is created)
 
 LIBNAME := $(notdir $(CURDIR))
 
@@ -12,6 +14,10 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 endif
 MINOR ?= 0
 
+ifeq ($(origin version-script), undefined)
+version-script := libxen$(LIBNAME).map.tmp
+endif
+
 CFLAGS   += -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
@@ -53,7 +59,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: $(TARGETS) $(PKG_CONFIG_LOCAL) $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 all: headers.chk
@@ -71,8 +77,9 @@ headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
 
-libxen$(LIBNAME).map:
-	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
+libxen$(LIBNAME).map.tmp: FORCE
+	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >.$@.tmp
+	$(call move-if-changed,.$@.tmp,$@)
 
 lib$(LIB_FILE_NAME).a: $(OBJS-y)
 	$(AR) rc $@ $^
@@ -82,8 +89,8 @@ lib$(LIB_FILE_NAME).so: lib$(LIB_FILE_NAME).so.$(MAJOR)
 lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
-lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=libxen$(LIBNAME).map $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(version-script)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=$(version-script) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
@@ -122,7 +129,7 @@ TAGS:
 clean::
 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
-	rm -f headers.chk headers.lst
+	rm -f headers.chk headers.lst libxen*.map.tmp
 
 .PHONY: distclean
 distclean: clean
diff --git a/.gitignore b/.gitignore
index e3fe06cd13..1e415fbb99 100644
--- a/.gitignore
+++ b/.gitignore
@@ -106,8 +106,6 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/ctrl/libxenctrl.map
-tools/libs/guest/libxenguest.map
 tools/libs/guest/xc_bitops.h
 tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
@@ -117,7 +115,6 @@ tools/libs/light/_*.[ch]
 tools/libs/light/*.pyc
 tools/libs/light/_libxl.api-for-check
 tools/libs/light/*.api-ok
-tools/libs/light/libxenlight.map
 tools/libs/light/libxl-save-helper
 tools/libs/light/dsdt*
 tools/libs/light/mk_dsdt
@@ -127,13 +124,10 @@ tools/libs/light/testidl.c
 tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
-tools/libs/stat/libxenstat.map
 tools/libs/store/list.h
 tools/libs/store/utils.h
 tools/libs/store/xs_lib.c
 tools/libs/util/libxlu_cfg_y.output
-tools/libs/util/libxenutil.map
-tools/libs/vchan/libxenvchan.map
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
-- 
Anthony PERARD


