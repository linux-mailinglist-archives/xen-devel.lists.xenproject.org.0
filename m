Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A84A75C0B0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567396.886379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMl5e-00006v-75; Fri, 21 Jul 2023 08:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567396.886379; Fri, 21 Jul 2023 08:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMl5e-0008W7-4L; Fri, 21 Jul 2023 08:02:18 +0000
Received: by outflank-mailman (input) for mailman id 567396;
 Fri, 21 Jul 2023 08:02:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1qMl5c-0008W1-Ba
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 08:02:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e76a6f5a-279c-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 10:02:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D4402F4;
 Fri, 21 Jul 2023 01:02:57 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35CBA3F67D;
 Fri, 21 Jul 2023 01:02:13 -0700 (PDT)
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
X-Inumbo-ID: e76a6f5a-279c-11ee-b23a-6b7b168915f2
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Date: Fri, 21 Jul 2023 10:02:04 +0200
Message-Id: <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework TEE mediators to put them under a submenu in Kconfig.
The submenu is only visible if UNSUPPORTED is activated as all currently
existing mediators are UNSUPPORTED.

While there rework a bit the configuration so that OP-TEE and FF-A
mediators are selecting the generic TEE interface instead of depending
on it.
Make the TEE option hidden as it is of no interest for anyone to select
it without one of the mediators so having them select it instead should
be enough.
Rework makefile inclusion and selection so that generic TEE is included
only when selected and include the tee Makefile all the time making the
directory tee self contained.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/Kconfig      |  7 -------
 xen/arch/arm/Makefile     |  2 +-
 xen/arch/arm/tee/Kconfig  | 18 ++++++++++++++++--
 xen/arch/arm/tee/Makefile |  2 +-
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 439cc94f3344..fd57a82dd284 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -175,13 +175,6 @@ config ARM64_BTI
 	  Branch Target Identification support.
 	  This feature is not supported in Xen.
 
-config TEE
-	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
-	default n
-	help
-	  This option enables generic TEE mediators support. It allows guests
-	  to access real TEE via one of TEE mediators implemented in XEN.
-
 source "arch/arm/tee/Kconfig"
 
 config STATIC_SHM
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7bf07e992046..d47d5c20aa73 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
-obj-$(CONFIG_TEE) += tee/
+obj-y += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
 obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
index 923f08ba8cb7..cecbf7e12b43 100644
--- a/xen/arch/arm/tee/Kconfig
+++ b/xen/arch/arm/tee/Kconfig
@@ -1,7 +1,17 @@
+menu "TEE mediators"
+	visible if UNSUPPORTED
+
+config TEE
+	bool
+	default n
+	help
+	  This option enables generic TEE mediators support. It allows guests
+	  to access real TEE via one of TEE mediators implemented in XEN.
+
 config OPTEE
-	bool "Enable OP-TEE mediator"
+	bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
 	default n
-	depends on TEE
+	select TEE
 	help
 	  Enable the OP-TEE mediator. It allows guests to access
 	  OP-TEE running on your platform. This requires
@@ -13,9 +23,13 @@ config FFA
 	bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
 	default n
 	depends on ARM_64
+	select TEE
 	help
 	  This option enables a minimal FF-A mediator. The mediator is
 	  generic as it follows the FF-A specification [1], but it only
 	  implements a small subset of the specification.
 
 	  [1] https://developer.arm.com/documentation/den0077/latest
+
+endmenu
+
diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
index 58a1015e40e0..1ef49a271fdb 100644
--- a/xen/arch/arm/tee/Makefile
+++ b/xen/arch/arm/tee/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_FFA) += ffa.o
-obj-y += tee.o
+obj-$(CONFIG_TEE) += tee.o
 obj-$(CONFIG_OPTEE) += optee.o
-- 
2.39.2 (Apple Git-143)


