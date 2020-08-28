Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F159255331
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 05:05:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBUgz-0004gF-2U; Fri, 28 Aug 2020 03:04:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cd5S=CG=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kBUgx-0004g8-Qa
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 03:04:39 +0000
X-Inumbo-ID: 5c2d0a05-b622-48ad-b3c0-11e2c7173913
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c2d0a05-b622-48ad-b3c0-11e2c7173913;
 Fri, 28 Aug 2020 03:04:38 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07S34Rlc025371
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 27 Aug 2020 23:04:33 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07S34RXG025370;
 Thu, 27 Aug 2020 20:04:27 -0700 (PDT) (envelope-from ehem)
Date: Thu, 27 Aug 2020 20:04:27 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] xen/arm: Add Kconfig option for CONFIG_EARLY_PRINTK
Message-ID: <20200828030427.GC25246@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Support for a very early console has existed for ARM for quite some
time.  Previously EARLY_PRINTK had to be passed in as a Make variable,
instead of as a configuration option.  Create the option to allow
selecting via .config.

Signed-off-by: Elliott Mitchell <ehem+xen@drgnwing.com>

---
This is mostly RFC due to insufficient testing.  I am hopeful this
successfully changes things to have the Kconfig CONFIG_EARLY_PRINTK
option replace the environment/Make variable EARLY_PRINTK.

---
 xen/arch/arm/Kconfig        | 12 ++++++++++++
 xen/arch/arm/Makefile       |  2 +-
 xen/arch/arm/Rules.mk       | 34 +++++++++++++++-------------------
 xen/arch/arm/arm32/Makefile |  2 +-
 xen/arch/arm/arm64/Makefile |  2 +-
 5 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 0ef8a99ad9..a176d42a0c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -241,3 +241,15 @@ source "arch/arm/platforms/Kconfig"
 source "common/Kconfig"
 
 source "drivers/Kconfig"
+
+if DEBUG || EXPERT
+
+config EARLY_PRINTK
+	string "Enable early hard-coded console for printk"
+	help
+          Setup a serial device early during boot for logging message.  Used
+	  for very early bring-up.
+
+	  See docs/misc/arm/early-printk.txt
+
+endif
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 70f532e42a..0bf975b44d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -16,7 +16,7 @@ obj-y += device.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
-obj-$(EARLY_PRINTK) += early_printk.o
+obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index 3d9a0ed357..4aef62cc9c 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -22,12 +22,15 @@ ifneq ($(call cc-option,$(CC),-fvisibility=hidden,n),n)
 CFLAGS += -DGCC_HAS_VISIBILITY_ATTRIBUTE
 endif
 
-EARLY_PRINTK := n
-
-ifeq ($(CONFIG_DEBUG),y)
+ifneq ($(CONFIG_EARLY_PRINTK),)
 
 # See docs/misc/arm/early-printk.txt for syntax
 
+ifneq ($(CONFIG_DEBUG),y)
+# Early printk is dependant on a debug build.
+$(error CONFIG_EARLY_PRINTK enabled for non-debug build)
+endif
+
 EARLY_PRINTK_brcm           := 8250,0xF040AB00,2
 EARLY_PRINTK_dra7           := 8250,0x4806A000,2
 EARLY_PRINTK_fastmodel      := pl011,0x1c090000,115200
@@ -54,6 +57,10 @@ else
 EARLY_PRINTK_CFG := $(subst $(comma), ,$(CONFIG_EARLY_PRINTK))
 endif
 
+ifeq ($(EARLY_PRINTK_CFG),)
+$(error Unknown CONFIG_EARLY_PRINTK setting)
+endif
+
 # Extract configuration from string
 EARLY_PRINTK_INC := $(word 1,$(EARLY_PRINTK_CFG))
 EARLY_UART_BASE_ADDRESS := $(word 2,$(EARLY_PRINTK_CFG))
@@ -76,22 +83,11 @@ CFLAGS-y += -DEARLY_PRINTK_VERSION_NONE
 endif
 endif
 
-ifneq ($(EARLY_PRINTK_INC),)
-EARLY_PRINTK := y
-endif
-
-CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_PRINTK
+CFLAGS-y += -DCONFIG_EARLY_PRINTK
 CFLAGS-$(EARLY_PRINTK_INIT_UART) += -DEARLY_PRINTK_INIT_UART
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_PRINTK_INC=\"debug-$(EARLY_PRINTK_INC).inc\"
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_PRINTK_BAUD=$(EARLY_PRINTK_BAUD)
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_UART_BASE_ADDRESS=$(EARLY_UART_BASE_ADDRESS)
-CFLAGS-$(EARLY_PRINTK) += -DEARLY_UART_REG_SHIFT=$(EARLY_UART_REG_SHIFT)
-
-else # !CONFIG_DEBUG
-
-ifneq ($(CONFIG_EARLY_PRINTK),)
-# Early printk is dependant on a debug build.
-$(error CONFIG_EARLY_PRINTK enabled for non-debug build)
-endif
+CFLAGS-y += -DEARLY_PRINTK_INC=\"debug-$(EARLY_PRINTK_INC).inc\"
+CFLAGS-y += -DEARLY_PRINTK_BAUD=$(EARLY_PRINTK_BAUD)
+CFLAGS-y += -DEARLY_UART_BASE_ADDRESS=$(EARLY_UART_BASE_ADDRESS)
+CFLAGS-y += -DEARLY_UART_REG_SHIFT=$(EARLY_UART_REG_SHIFT)
 
 endif
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 0ac254f347..13eeefae13 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,6 +1,6 @@
 subdir-y += lib
 
-obj-$(EARLY_PRINTK) += debug.o
+obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index c4f3a28a0d..86572014d0 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -2,7 +2,7 @@ subdir-y += lib
 
 obj-y += cache.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
-obj-$(EARLY_PRINTK) += debug.o
+obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
-- 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



