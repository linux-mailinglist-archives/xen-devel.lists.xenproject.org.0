Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78B761D93
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 17:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569798.890888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKC6-0003wm-8V; Tue, 25 Jul 2023 15:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569798.890888; Tue, 25 Jul 2023 15:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKC6-0003uM-5O; Tue, 25 Jul 2023 15:43:26 +0000
Received: by outflank-mailman (input) for mailman id 569798;
 Tue, 25 Jul 2023 15:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5PA=DL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1qOKC4-0003uG-Uo
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 15:43:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fc85dcc6-2b01-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 17:43:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D6915DB;
 Tue, 25 Jul 2023 08:44:05 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (C3HXLD123V.cambridge.arm.com
 [10.1.38.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CD6F3F6C4;
 Tue, 25 Jul 2023 08:43:21 -0700 (PDT)
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
X-Inumbo-ID: fc85dcc6-2b01-11ee-b23f-6b7b168915f2
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: Move TEE mediators in a kconfig submenu
Date: Tue, 25 Jul 2023 16:42:37 +0100
Message-Id: <5f10382a15ca7b221a052915347e4e59f66b001f.1690297570.git.bertrand.marquis@arm.com>
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

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
- automatically compile in tee instead of using CONFIG_TEE for it
  (Makefile is only included if CONFIG_TEE is selected)
- remove commit message paragraph on Makefile inclusion which was not
  true anymore
Changes in v2:
- only included tee subdirectory in makefile if CONFIG_TEE is selected
  (reverts to state before patch)
- remove help in hidden TEE config
- rebase on top of staging
---
 xen/arch/arm/Kconfig     |  7 -------
 xen/arch/arm/tee/Kconfig | 17 ++++++++++++++---
 2 files changed, 14 insertions(+), 10 deletions(-)

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
diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
index db3ea78faaaa..c5b0f88d7522 100644
--- a/xen/arch/arm/tee/Kconfig
+++ b/xen/arch/arm/tee/Kconfig
@@ -1,7 +1,14 @@
+menu "TEE mediators"
+	visible if UNSUPPORTED
+
+config TEE
+	bool
+	default n
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
@@ -12,10 +19,14 @@ config OPTEE
 config FFA
 	bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
 	default n
-	depends on ARM_64 && TEE
+	depends on ARM_64
+	select TEE
 	help
 	  This option enables a minimal FF-A mediator. The mediator is
 	  generic as it follows the FF-A specification [1], but it only
 	  implements a small subset of the specification.
 
 	  [1] https://developer.arm.com/documentation/den0077/latest
+
+endmenu
+
-- 
2.39.2 (Apple Git-143)


