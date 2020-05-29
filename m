Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C001E8259
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:44:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehBC-0000Sk-SF; Fri, 29 May 2020 15:44:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wp2E=7L=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jehBB-0000SB-25
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:44:17 +0000
X-Inumbo-ID: 40391566-a1c3-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40391566-a1c3-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 15:44:16 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ONeqteup3dw6Lh+z7jrKEbgJlIGDTIAlGo2dQNpr7TcYtTUojg5zTrQwssXp7yTfM4ySGg2kHA
 mQgz2TfSfCiwoyClkyLr+re1BT+Nh4KUpGErp6z3FA2eOgGuQn4Ax1HjzILlfKuNsVi97p7S+D
 9bE5ffjwgsHfXnFdbtnJJ5gVSi8Ldcfo4oaVKY9YlAjZvvUK8/io0jYhZ3zCS9J4JD2CZopgBl
 MbZiWfLrLafq1rm23E+/5gvbnGZX0xk85wRr47uHOv6Vj+gGc9qoWmTVwZZ1AsIZl5yt08ewB4
 +dA=
X-SBRS: 2.7
X-MesageID: 19024984
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19024984"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH] xen/build: introduce CLANG_FLAGS for testing other CFLAGS
Date: Fri, 29 May 2020 16:43:43 +0100
Message-ID: <20200529154343.1616925-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 534519f0514f ("xen: Have Kconfig check $(CC)'s version")
introduced the use of CLANG_FLAGS in Kconfig which is used when
testing for other CFLAGS via $(cc-option ...) but CLANG_FLAGS doesn't
exist in the Xen build system. (It's a Linux/Kbuild variable that
haven't been added yet.)

The missing CLANG_FLAGS isn't an issue for $(cc-option ..) but it
would be when $(as-instr ..) gets imported from Kbuild to tests
assembly instruction. We need to know if we are going to use clang's
assembler or not.

CLANG_FLAGS needs to be calculated before we call Kconfig.

So, this patch adds CLANG_FLAGS which may contain two flags which are
needed for further testing of $(CC)'s capabilities:
  -no-integrated-as
    This flags isn't new, but simply tested earlier so that it can be
    used in Kconfig. The flags is only added for x86 builds like
    before.
  -Werror=unknown-warning-option
    The one is new and is to make sure that the warning is enabled,
    even though it is by default but could be disabled in a particular
    build of clang, see Linux's commit e8de12fb7cde ("kbuild: Check
    for unknown options with cc-option usage in Kconfig and clang")

    It is present in clang 3.0.0, according Linux's commit
    589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
    CLANG_FLAGS").

(The "note" that say that the flags was only added once wasn't true
when tested on CentOS 6, so the patch uses $(or) and the flag will only
be added once.)

Fixes: 534519f0514f ("xen: Have Kconfig check $(CC)'s version")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile         | 31 +++++++++++++++++++++++++++++--
 xen/arch/x86/arch.mk | 24 ------------------------
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 30c3568a4791..2e897f222cc9 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -48,6 +48,7 @@ default: build
 .PHONY: dist
 dist: install
 
+include scripts/Kbuild.include
 
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
@@ -124,11 +125,37 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
     config-build := y
 endif
 
+# CLANG_FLAGS needs to be calculated before calling Kconfig
+ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
+CLANG_FLAGS :=
+
+ifeq ($(TARGET_ARCH),x86)
+# The tests to select whether the integrated assembler is usable need to happen
+# before testing any assembler features, or else the result of the tests would
+# be stale if the integrated assembler is not used.
+
+# Older clang's built-in assembler doesn't understand .skip with labels:
+# https://bugs.llvm.org/show_bug.cgi?id=27369
+t1 = $(call as-insn,$(CC),".L0: .L1: .skip (.L1 - .L0)",,-no-integrated-as)
+
+# Check whether clang asm()-s support .include.
+t2 = $(call as-insn,$(CC) -I$(BASEDIR)/include,".include \"asm-x86/indirect_thunk_asm.h\"",,-no-integrated-as)
+
+# Check whether clang keeps .macro-s between asm()-s:
+# https://bugs.llvm.org/show_bug.cgi?id=36110
+t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
+
+CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
+endif
+
+CLANG_FLAGS += -Werror=unknown-warning-option
+CFLAGS += $(CLANG_FLAGS)
+export CLANG_FLAGS
+endif
+
 export root-make-done := y
 endif # root-make-done
 
-include scripts/Kbuild.include
-
 # Shorthand for kconfig
 kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 62b7c9700776..1f7211623399 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -11,30 +11,6 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
 
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-# Note: Any test which adds -no-integrated-as will cause subsequent tests to
-# succeed, and not trigger further additions.
-#
-# The tests to select whether the integrated assembler is usable need to happen
-# before testing any assembler features, or else the result of the tests would
-# be stale if the integrated assembler is not used.
-
-# Older clang's built-in assembler doesn't understand .skip with labels:
-# https://bugs.llvm.org/show_bug.cgi?id=27369
-$(call as-option-add,CFLAGS,CC,".L0: .L1: .skip (.L1 - .L0)",,\
-                     -no-integrated-as)
-
-# Check whether clang asm()-s support .include.
-$(call as-option-add,CFLAGS,CC,".include \"asm-x86/indirect_thunk_asm.h\"",,\
-                     -no-integrated-as)
-
-# Check whether clang keeps .macro-s between asm()-s:
-# https://bugs.llvm.org/show_bug.cgi?id=36110
-$(call as-option-add,CFLAGS,CC,\
-                     ".macro FOO;.endm"$$(close); asm volatile $$(open)".macro FOO;.endm",\
-                     -no-integrated-as)
-endif
-
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
-- 
Anthony PERARD


