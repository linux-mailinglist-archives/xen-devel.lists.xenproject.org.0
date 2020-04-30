Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C11BF859
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8Xd-0001sH-RB; Thu, 30 Apr 2020 12:43:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jU8Xb-0001s2-Ry
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:43:47 +0000
X-Inumbo-ID: 3bcc51ea-8ae0-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bcc51ea-8ae0-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B5YPe1nFqxyWzM16OSEtEbJ+OP5IgkIlMTCrJ2yOq/8=; b=auDwSJj7RviXmcyqNdaBpVCNoO
 /QBRkkkdjPE5HkebLJgyBmv45eEbeSzxRiOtu9If62MOLn+vHKqAJgk7aqj8YN/Lx+vDq64PILpav
 8plEZi2xGGdL4qXwkMx6kcn14CxLcp7eZTKoJ78kI859TQ5hL56CgueL6gSv31OkZj/0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jU8Xa-0002qH-HS; Thu, 30 Apr 2020 12:43:46 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jU8Xa-0001dc-8S; Thu, 30 Apr 2020 12:43:46 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] xen/Kconfig: define EXPERT a bool rather than a string
Date: Thu, 30 Apr 2020 13:43:42 +0100
Message-Id: <20200430124343.29886-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430124343.29886-1-julien@xen.org>
References: <20200430124343.29886-1-julien@xen.org>
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
Cc: Julien Grall <jgrall@amazon.com>, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Since commit f80fe2b34f08 "xen: Update Kconfig to Linux v5.4" EXPERT
can only have two values (enabled or disabled). So switch from a string
to a bool.

Take the opportunity to replace all "EXPERT = y" to "EXPERT".

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/Kconfig                     |  3 +--
 xen/Kconfig.debug               |  2 +-
 xen/arch/arm/Kconfig            | 10 +++++-----
 xen/arch/x86/Kconfig            |  6 +++---
 xen/common/Kconfig              | 14 +++++++-------
 xen/common/sched/Kconfig        |  2 +-
 xen/drivers/passthrough/Kconfig |  2 +-
 7 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 073042f46730..120b5f412993 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -35,8 +35,7 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 
 config EXPERT
-	string
-	default y if "$(XEN_CONFIG_EXPERT)" = "y"
+	def_bool y if "$(XEN_CONFIG_EXPERT)" = "y"
 
 config LTO
 	bool "Link Time Optimisation"
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index ee6ee33b69be..fad3050d4f7b 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -11,7 +11,7 @@ config DEBUG
 
 	  You probably want to say 'N' here.
 
-if DEBUG || EXPERT = "y"
+if DEBUG || EXPERT
 
 config CRASH_DEBUG
 	bool "Crash Debugging Support"
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index d51f66072e2e..6a43576dac5e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -33,7 +33,7 @@ source "arch/Kconfig"
 
 config ACPI
 	bool
-	prompt "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT = "y"
+	prompt "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
 	depends on ARM_64
 	---help---
 
@@ -51,7 +51,7 @@ config GICV3
 
 config HAS_ITS
         bool
-        prompt "GICv3 ITS MSI controller support" if EXPERT = "y"
+        prompt "GICv3 ITS MSI controller support" if EXPERT
         depends on GICV3 && !NEW_VGIC
 
 config HVM
@@ -81,7 +81,7 @@ config SBSA_VUART_CONSOLE
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
 
 config ARM_SSBD
-	bool "Speculative Store Bypass Disable" if EXPERT = "y"
+	bool "Speculative Store Bypass Disable" if EXPERT
 	depends on HAS_ALTERNATIVE
 	default y
 	help
@@ -91,7 +91,7 @@ config ARM_SSBD
 	  If unsure, say Y.
 
 config HARDEN_BRANCH_PREDICTOR
-	bool "Harden the branch predictor against aliasing attacks" if EXPERT = "y"
+	bool "Harden the branch predictor against aliasing attacks" if EXPERT
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
@@ -108,7 +108,7 @@ config HARDEN_BRANCH_PREDICTOR
 	  If unsure, say Y.
 
 config TEE
-	bool "Enable TEE mediators support" if EXPERT = "y"
+	bool "Enable TEE mediators support" if EXPERT
 	default n
 	help
 	  This option enables generic TEE mediators support. It allows guests
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a69be983d6f3..3237cb2f31f4 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -112,7 +112,7 @@ config BIGMEM
 	  If unsure, say N.
 
 config HVM_FEP
-	bool "HVM Forced Emulation Prefix support" if EXPERT = "y"
+	bool "HVM Forced Emulation Prefix support" if EXPERT
 	default DEBUG
 	depends on HVM
 	---help---
@@ -132,7 +132,7 @@ config HVM_FEP
 
 config TBOOT
 	def_bool y
-	prompt "Xen tboot support" if EXPERT = "y"
+	prompt "Xen tboot support" if EXPERT
 	select CRYPTO
 	---help---
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -217,7 +217,7 @@ config HYPERV_GUEST
 endif
 
 config MEM_SHARING
-	bool "Xen memory sharing support" if EXPERT = "y"
+	bool "Xen memory sharing support" if EXPERT
 	depends on HVM
 
 endmenu
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6914fcae98b..fe9b41f72128 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,7 +12,7 @@ config CORE_PARKING
 	bool
 
 config GRANT_TABLE
-	bool "Grant table support" if EXPERT = "y"
+	bool "Grant table support" if EXPERT
 	default y
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
@@ -128,7 +128,7 @@ config KEXEC
 	  If unsure, say Y.
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
-    bool "EFI: call SetVirtualAddressMap()" if EXPERT = "y"
+    bool "EFI: call SetVirtualAddressMap()" if EXPERT
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
@@ -139,7 +139,7 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
 
 config XENOPROF
 	def_bool y
-	prompt "Xen Oprofile Support" if EXPERT = "y"
+	prompt "Xen Oprofile Support" if EXPERT
 	depends on X86
 	---help---
 	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
@@ -176,7 +176,7 @@ config XSM_FLASK
 
 config XSM_FLASK_AVC_STATS
 	def_bool y
-	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT = "y"
+	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
 	depends on XSM_FLASK
 	---help---
 	  Maintain counters on the access vector cache that can be viewed using
@@ -249,7 +249,7 @@ config LATE_HWDOM
 	  If unsure, say N.
 
 config ARGO
-	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT = "y"
+	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
 	---help---
 	  Enables a hypercall for domains to ask the hypervisor to perform
 	  data transfer of messages between domains.
@@ -321,7 +321,7 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
 	  build becoming overly verbose.
 
 config CMDLINE
-	string "Built-in hypervisor command string" if EXPERT = "y"
+	string "Built-in hypervisor command string" if EXPERT
 	default ""
 	---help---
 	  Enter arguments here that should be compiled into the hypervisor
@@ -354,7 +354,7 @@ config DOM0_MEM
 	  Leave empty if you are not sure what to specify.
 
 config TRACEBUFFER
-	bool "Enable tracing infrastructure" if EXPERT = "y"
+	bool "Enable tracing infrastructure" if EXPERT
 	default y
 	---help---
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 883ac87cab65..61231aacaa1c 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -1,5 +1,5 @@
 menu "Schedulers"
-	visible if EXPERT = "y"
+	visible if EXPERT
 
 config SCHED_CREDIT
 	bool "Credit scheduler support"
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index e7e62ccd63c3..73f4ad89ecbc 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -14,7 +14,7 @@ config ARM_SMMU
 	  ARM SMMU architecture.
 
 config IPMMU_VMSA
-	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs" if EXPERT = "y"
+	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs" if EXPERT
 	depends on ARM_64
 	---help---
 	  Support for implementations of the Renesas IPMMU-VMSA found
-- 
2.17.1


