Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51CD45DB84
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231281.400233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF65-0004PX-KP; Thu, 25 Nov 2021 13:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231281.400233; Thu, 25 Nov 2021 13:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF65-0004Gn-C7; Thu, 25 Nov 2021 13:47:33 +0000
Received: by outflank-mailman (input) for mailman id 231281;
 Thu, 25 Nov 2021 13:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0U-00076i-Mx
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d6c76ec-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:45 +0100 (CET)
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
X-Inumbo-ID: 6d6c76ec-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o+kA5ufKOUX7cHgHO/shUnoM69Ej2+dSlJV54ErUF+0=;
  b=G9n+AX1UQo80TDZ+ZBfFvgc1hGpTGfV+/VcF9dm1nH68jxeH6zn3DNr+
   B8QLqZpG21IQUvggwNW4EbjRRVEyHNPT/pV14vuKU3Q75GO5RwIeuuLTZ
   pIOTz3nPPyH4IzRqz3wCgCR4sv4kiQAT6Qm/EflbMe6ytbGjBPzBxZm+G
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: veMVtzRDvR9Az3eriOtzviuZLksqoVwo3rOzhYcgu6t6xGyCcgZrDIDyy+ZnUL2sruI+A3V+Hi
 VKoXybqlNMx+/nPfv0vefj0KYz6EMPWptHIRPUqgKYrqM64fk1aGBfK5SfFmIm3bhyO3BsHuaT
 5DkotiS1PoF8RqfA3zgv7LQpawWMKyvU58JA/sQwWIZuxBgB/LMYfXzmQcIkHhg6XXrrH1gyJT
 7WN5N+hRqzutex27WOpW2K03rbx1OtFOLeoOxmYwAdfJsP6efK4E1wHPoBBbt6y5Ani0mfiZUS
 9Scp08EX+5DfzFkihekXMevw
X-SBRS: 5.1
X-MesageID: 58135484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rOEXRKB7lf11hRVW/9Tkw5YqxClBgxIJ4kV8jS/XYbTApG4n0DUAm
 2oWWWuHbPveYGD2L94nb4q/p0JQ7JKBnIM3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/0AysmMpjx
 4t2soGJVCIbN4KXhMkhTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjG5r25weQZ4yY
 eIwNj5FbT/vOSFMFXVPU5Mgh7aRpVvWJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoNEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdxynolaUsxgEQd1SHuYmrgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBTQ7QCgeXwRb2N7+mZwWvBvgFcpOLLHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4ZdN7BJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdwPiN2dDB0wWirhRdMOS
 BWO0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZp34xOh/AjzG3zhlEfUQD1
 XCzK5jEMJrnIf4/kGreqxk1jdfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgo
 ivgBxQGkQWn3hUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:4cltCq/L8WX0tfj/CiNuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135484"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 32/47] build: shuffle main Makefile
Date: Thu, 25 Nov 2021 13:39:51 +0000
Message-ID: <20211125134006.1076646-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Reorganize a bit the Makefile ahead of patch
"build: adding out-of-tree support to the xen build"

This should only be code movement without functional changes.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - new patch

 xen/Makefile | 58 ++++++++++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 318320e79c7d..bfc96562c5ec 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -19,38 +19,11 @@ export PYTHON		?= $(PYTHON_INTERPRETER)
 
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
 
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
-ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | \
-          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-              -e s'/riscv.*/riscv/g')
-export ARCH SRCARCH
-
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
 
@@ -64,8 +37,6 @@ default: build
 .PHONY: dist
 dist: install
 
-include scripts/Kbuild.include
-
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
 
@@ -141,6 +112,17 @@ endif
 
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
 
@@ -163,6 +145,24 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
     config-build := y
 endif
 
+include scripts/Kbuild.include
+
+ARCH=$(XEN_TARGET_ARCH)
+SRCARCH=$(shell echo $(ARCH) | \
+          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+              -e s'/riscv.*/riscv/g')
+export ARCH SRCARCH
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


