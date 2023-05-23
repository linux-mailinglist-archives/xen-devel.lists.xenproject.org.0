Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44270E1FA
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538572.838687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2L-0002hj-Oz; Tue, 23 May 2023 16:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538572.838687; Tue, 23 May 2023 16:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2L-0002Y8-Hz; Tue, 23 May 2023 16:39:01 +0000
Received: by outflank-mailman (input) for mailman id 538572;
 Tue, 23 May 2023 16:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2J-0006Dr-UY
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f8cbac7-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:57 +0200 (CEST)
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
X-Inumbo-ID: 4f8cbac7-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/u1bPN10AWgMTCILIOBzV6UQMmmPOJyKlHt8eO7R7EE=;
  b=P7sTDJPWEL+hYfGJusW8tGz0ldynvxlDXQZXe+F0bgr3t+tLmJJlvOT4
   5E1MRDAPGijuYt/Z4y5XbLtkCzHf+lrikQ47Zq9Gp/T4b1bwZEXQDrt2J
   6gnamkmMExxLH1e7DilYYS7m5DgoZ/AAoAKsCjbs//ykeQsiwuv4n6vYE
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112568347
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:A5SOsqiH3MG+/aaBIWpKvC/WX161UxAKZh0ujC45NGQN5FlHY01je
 htvW2jUPPiNNGvwLt5ybYW+9UID7ZPcytU1TAA6q3w1Qysb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQWEx8mPzC9gNmPyYigEPlPo+Ukd9D0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 ziboTSiXk5y2Nq3ziKGsW2FoL/z2jrHXrgvJbPh1fQ3jwjGroAUIEJPDgbqyRWjsWa8RtZeJ
 ko86ico668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1V78rBn9hqbOdTc83B6NTkGAzwQifZHwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiONrKigbArLmdrGR2CgmbOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNFcykn0z7iuvHPCL9pVI53LymN7pR0U95iF+Nr
 4Y32zWikH2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/S9Nv1jFOQTl7Y9eImONJRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVg4MOm+Askn/SNnVcHuVH7xs0UejU+UxP93X/MKkXMProSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:OhteVq0nZ2XJDKANE2fIDAqjBNEkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN98YhsdcLO7WZVoP0myyXcd2+B4AV7IZmXbUQWTQr1f0Q==
X-Talos-CUID: 9a23:H1KEWW/5dh3YhMKwz02Vv0AvNet0UkPa907ZGVTiGUVMabrOUEDFrQ==
X-Talos-MUID: 9a23:dsWiigkPbcARgL6gz/LjdnplLMQr/I2IWHxKiKkAgfS1O3VTMWqS2WE=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="112568347"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 14/15] Config.mk: move $(cc-option, ) to config/compiler-testing.mk
Date: Tue, 23 May 2023 17:38:10 +0100
Message-ID: <20230523163811.30792-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In xen/, it isn't necessary to include Config.mk in every Makefile in
subdirectories as nearly all necessary variables should be calculated
in xen/Makefile. But some Makefile make use of the macro $(cc-option,)
that is only available in Config.mk.

Extract $(cc-option,) from Config.mk so we can use it without
including Config.mk and thus without having to recalculate some CFLAGS
which would be ignored.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk                  | 27 +--------------------------
 config/compiler-testing.mk | 25 +++++++++++++++++++++++++
 xen/Rules.mk               |  1 +
 3 files changed, 27 insertions(+), 26 deletions(-)
 create mode 100644 config/compiler-testing.mk

diff --git a/Config.mk b/Config.mk
index 27f48f654a..ebc8d0dfdd 100644
--- a/Config.mk
+++ b/Config.mk
@@ -18,6 +18,7 @@ realpath = $(wildcard $(foreach file,$(1),$(shell cd -P $(dir $(file)) && echo "
 or       = $(if $(strip $(1)),$(1),$(if $(strip $(2)),$(2),$(if $(strip $(3)),$(3),$(if $(strip $(4)),$(4)))))
 
 -include $(XEN_ROOT)/.config
+include $(XEN_ROOT)/config/compiler-testing.mk
 
 XEN_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
                          -e s/i86pc/x86_32/ -e s/amd64/x86_64/ \
@@ -79,32 +80,6 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)"
 # to permit the user to set PYTHON_PREFIX_ARG to '' to workaround this bug:
 #  https://bugs.launchpad.net/ubuntu/+bug/362570
 
-# cc-option: Check if compiler supports first option, else fall back to second.
-#
-# This is complicated by the fact that unrecognised -Wno-* options:
-#   (a) are ignored unless the compilation emits a warning; and
-#   (b) even then produce a warning rather than an error
-# To handle this we do a test compile, passing the option-under-test, on a code
-# fragment that will always produce a warning (integer assigned to pointer).
-# We then grep for the option-under-test in the compiler's output, the presence
-# of which would indicate an "unrecognized command-line option" warning/error.
-#
-# Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
-              then echo "$(2)"; else echo "$(3)"; fi ;)
-
-# cc-option-add: Add an option to compilation flags, but only if supported.
-# Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
-cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
-define cc-option-add-closure
-    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
-        $(1) += $(3)
-    endif
-endef
-
-cc-options-add = $(foreach o,$(3),$(call cc-option-add,$(1),$(2),$(o)))
-
 # cc-ver: Check compiler against the version requirement. Return boolean 'y'/'n'.
 # Usage: ifeq ($(call cc-ver,$(CC),ge,0x030400),y)
 cc-ver = $(shell if [ $$((`$(1) -dumpversion | awk -F. \
diff --git a/config/compiler-testing.mk b/config/compiler-testing.mk
new file mode 100644
index 0000000000..9677f91abe
--- /dev/null
+++ b/config/compiler-testing.mk
@@ -0,0 +1,25 @@
+# cc-option: Check if compiler supports first option, else fall back to second.
+#
+# This is complicated by the fact that unrecognised -Wno-* options:
+#   (a) are ignored unless the compilation emits a warning; and
+#   (b) even then produce a warning rather than an error
+# To handle this we do a test compile, passing the option-under-test, on a code
+# fragment that will always produce a warning (integer assigned to pointer).
+# We then grep for the option-under-test in the compiler's output, the presence
+# of which would indicate an "unrecognized command-line option" warning/error.
+#
+# Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
+cc-option = $(shell if test -z "`echo 'void*p=1;' | \
+              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
+              then echo "$(2)"; else echo "$(3)"; fi ;)
+
+# cc-option-add: Add an option to compilation flags, but only if supported.
+# Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
+cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
+define cc-option-add-closure
+    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
+        $(1) += $(3)
+    endif
+endef
+
+cc-options-add = $(foreach o,$(3),$(call cc-option-add,$(1),$(2),$(o)))
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 68b10ca5ef..8177d405c3 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -19,6 +19,7 @@ __build:
 
 include $(XEN_ROOT)/Config.mk
 include $(srctree)/scripts/Kbuild.include
+include $(XEN_ROOT)/config/compiler-testing.mk
 
 # Initialise some variables
 obj-y :=
-- 
Anthony PERARD


