Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87F4E3D7C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293381.498444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbP-0003ts-BI; Tue, 22 Mar 2022 11:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293381.498444; Tue, 22 Mar 2022 11:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbP-0003oC-5C; Tue, 22 Mar 2022 11:23:03 +0000
Received: by outflank-mailman (input) for mailman id 293381;
 Tue, 22 Mar 2022 11:23:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcbM-0001pm-FX
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:23:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd33d40-a9d2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 12:22:59 +0100 (CET)
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
X-Inumbo-ID: 6cd33d40-a9d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmhrQkgIv1T+ZSzGTSleStlqC/GW0kKEBuZmpFtrCLE=;
  b=ej+KmAEynk6+nDQdeTEDJcDGq1Qw71mRAq6ORUCYmqKupx8G3YnwIDI9
   Ph6/QGRZKsvPAebkk4YrV5f0DT5MSgYLKweNdah6ykqdOLZ4DjQ+wbiPs
   WoQqgjwy9PKcw4w2aA891QFj1+uKr5+kgnOy2dWm+h+TFbr29+pUQTDXC
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66766639
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PWe3MqkCYIVnJ1guWqpXd43o5gysJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXmvVaPeMYmb8LYxyPt6x9EsDuJTXmoVmTgdk/H0xFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWVnV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYey0WAZTCsu4mYgh7LDFhO/0Z/vjWPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHN2UxMkqbMnWjPH8UGpMEvaD4mEWlfjobuAyyp64ssmzMmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTz/cJIfEvu/7PECqF+Owm0eDjUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+mhwyNACY/J1QzdAw7XRQDs4bl55As20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsBJG9eFoSfLkWVsDNdWfhwB3iEsI2OBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtK1/Xo3wxNBTOgggBdXTAd4llZ
 f93lu72UB4n5VlPlmLqF4/xL5d1rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnmAx4GkgWj3SObQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:MtDF9qk6WroXsGCSFTKQVgiSHd3pDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="66766639"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v10 6/7] build: shuffle main Makefile
Date: Tue, 22 Mar 2022 11:22:37 +0000
Message-ID: <20220322112238.1117737-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322112238.1117737-1-anthony.perard@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v10:
    - acked
    
    v9:
    - add some explanation in the commit message about why the code movement
      is needed.
    
    v8:
    - new patch

 xen/Makefile | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index b89db5e8ab37..889d91c68a42 100644
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


