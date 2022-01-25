Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537849B2A8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260106.449331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfv-0000r5-5n; Tue, 25 Jan 2022 11:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260106.449331; Tue, 25 Jan 2022 11:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJft-0000ZJ-KF; Tue, 25 Jan 2022 11:07:45 +0000
Received: by outflank-mailman (input) for mailman id 260106;
 Tue, 25 Jan 2022 11:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaj-0006Mn-J5
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45dd9e5b-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:02:24 +0100 (CET)
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
X-Inumbo-ID: 45dd9e5b-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Qro/yaNm//kAbsXtl6h430tMQIH8P57DTIHDTlToVE=;
  b=Ov5l6Uu0ihTQBSevPbYWBzZQMW9UyWDP6dm1vGBW43L/cA4eFq4n3BCn
   SFccgZih2i1liNOSd7XjXwJOvP7sB6DpV3M+sqsABHV1AS2ThwP2lcuZn
   A8B4uEd81WBlC46Dq/s4UVEMrOBJ5lsqJJPUMWFJWjbQjuHm9Fe2uQoyz
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GfGsplmdULk3yuLHXRLvR/WC56go2Hm23nz1NA5CSJxTBKxyfx+P74uZPkisnyUb1uO7eOQs9c
 Ha/8jKd5eJZqnwc5x+uhGnk2C/Zl1eeVV3fmFMXBRNAdFMy/4vY1ye3VI+gLkk2BnA8YwZ8av4
 By+DdncgLeeoZvjJy/Lw1/9d/GVIHWZSMzuInzipr+tQdl1iYPsjpNU9WSDMef9xh2GJtlmIWA
 o1Uw3/8TVlszzjV2tALXRH4vxff+E31wpnzIPrd1f2RhQib5EGo6ygG4mYNfO4vWzsErwKcyzg
 B+XJzFWg4aSdHPUVnRzvr33I
X-SBRS: 5.2
X-MesageID: 62699926
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BeBE0KxaGDo4JBzFvi16t+fLwSrEfRIJ4+MujC+fZmUNrF6WrkVRm
 DQeDT/TPPaLM2Gje99+bIS/oRgCvsDUmt9gTgtorCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRk2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9FS0
 Yl2ibKqcAQKMorNwPoabjsGDT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JoQTKePP
 ZRxhTxHXBfLWy9MBmcsE7k1ubyXpXulbS96twfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoQCbm5+/hCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHsZ6MFUmh2K2trhC+HilNM2g/R3EaUl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHVb5Iei8BxklfC9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyPNoYfPccvJV7flM2LWaJ29zqx+KTLufpnU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313DbOiCgGKr997BQ1afBATWMGtw+QKJ7HrH+aTMDx7YxMn6el/K9UNcmU8vrqgw
 0xRrWcBmAOg3iWWcFvTAp2hAZu2NatCQbsAFXREFT6VN7ILPu5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:Xjk10q9B3A4rROifnqtuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699926"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 29/30] build: shuffle main Makefile
Date: Tue, 25 Jan 2022 11:01:02 +0000
Message-ID: <20220125110103.3527686-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Reorganize a bit the Makefile ahead of patch
"build: adding out-of-tree support to the xen build"

We are going to want to calculate all the $(*srctree) and $(*objtree)
once, when we can calculate them. This can happen within the
"$(root-make-done)" guard, in an out-of-tree build scenario, so move
those variable there.

$(XEN_ROOT) is going to depends on the value of $(abs_srctree) so
needs to move as well. "Kbuild.include" also depends on $(srctree).

Next, "Config.mk" depends on $(XEN_ROOT) and $(TARGET_*ARCH) depends
on "Config.mk" so those needs to move as well.

This should only be code movement without functional changes.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - add some explanation in the commit message about why the code movement
      is needed.
    
    v8:
    - new patch

 xen/Makefile | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index c39c1699966f..08114b3fef1e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -19,17 +19,6 @@ export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
 
-export XEN_ROOT := $(CURDIR)/..
-
-abs_objtree := $(CURDIR)
-abs_srctree := $(CURDIR)
-
-export abs_srctree abs_objtree
-
-srctree := .
-objtree := .
-export srctree objtree
-
 # Do not use make's built-in rules and variables
 MAKEFLAGS += -rR
 
@@ -41,16 +30,6 @@ SRCARCH=$(shell echo $(ARCH) | \
               -e s'/riscv.*/riscv/g')
 export ARCH SRCARCH
 
-# Don't break if the build process wasn't called from the top level
-# we need XEN_TARGET_ARCH to generate the proper config
-include $(XEN_ROOT)/Config.mk
-
-# Set ARCH/SUBARCH appropriately.
-export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
-export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
-                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-                                -e s'/riscv.*/riscv/g')
-
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
@@ -64,8 +43,6 @@ default: build
 .PHONY: dist
 dist: install
 
-include scripts/Kbuild.include
-
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
 
@@ -141,6 +118,17 @@ endif
 
 export quiet Q KBUILD_VERBOSE
 
+abs_objtree := $(CURDIR)
+abs_srctree := $(CURDIR)
+
+export abs_srctree abs_objtree
+
+srctree := .
+objtree := .
+export srctree objtree
+
+export XEN_ROOT := $(CURDIR)/..
+
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to tools/kconfig/Makefile
 
@@ -163,6 +151,18 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
     config-build := y
 endif
 
+include scripts/Kbuild.include
+
+# Don't break if the build process wasn't called from the top level
+# we need XEN_TARGET_ARCH to generate the proper config
+include $(XEN_ROOT)/Config.mk
+
+# Set ARCH/SUBARCH appropriately.
+export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
+export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
+                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+                                -e s'/riscv.*/riscv/g')
+
 export CONFIG_SHELL := $(SHELL)
 export YACC = $(if $(BISON),$(BISON),bison)
 export LEX = $(if $(FLEX),$(FLEX),flex)
-- 
Anthony PERARD


