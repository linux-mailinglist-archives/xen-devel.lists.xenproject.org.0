Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC1255330
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 05:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBUdu-0004Wn-Iw; Fri, 28 Aug 2020 03:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cd5S=CG=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kBUdt-0004Wi-A0
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 03:01:29 +0000
X-Inumbo-ID: 0cbe79d2-6662-4d8b-bd6e-be44190189b1
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cbe79d2-6662-4d8b-bd6e-be44190189b1;
 Fri, 28 Aug 2020 03:01:28 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07S31Cj6025334
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 27 Aug 2020 23:01:18 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07S31CWV025333;
 Thu, 27 Aug 2020 20:01:12 -0700 (PDT) (envelope-from ehem)
Date: Thu, 27 Aug 2020 20:01:12 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?unknown-8bit?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: [RFC PATCH] xen/Kconfig: Turn CONFIG_EXPERT into normal configuration
Message-ID: <20200828030112.GB25246@mattapan.m5p.com>
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

There is little reason to specially require CONFIG_EXPERT to come from
the environment.  Worse, this makes replicating configurations much more
difficult.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
This is mostly RFC due to insufficient testing.  I am hopeful this
successfully changes things to have the Kconfig CONFIG_EXPERT option
replace the environment/Make variable EXPERT.

---
 xen/Kconfig                     |  8 ++++++--
 xen/Kconfig.debug               |  2 +-
 xen/Makefile                    |  1 -
 xen/arch/arm/Kconfig            | 10 +++++-----
 xen/arch/x86/Kconfig            |  6 +++---
 xen/common/Kconfig              | 16 ++++++++--------
 xen/drivers/passthrough/Kconfig |  2 +-
 7 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 4a207e4553..7de44a6f4a 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -27,8 +27,12 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 
 config EXPERT
-	string
-	option env="XEN_CONFIG_EXPERT"
+	bool "Enable expert configuration options"
+	---help---
+          This enables expert configuration options.  These allow extra
+	  control, but can cause unexpected behavior.
+
+          You probably want to say 'N' here.
 
 config LTO
 	bool "Link Time Optimisation"
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 0f8ddf8be3..772736db48 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -11,7 +11,7 @@ config DEBUG
 
 	  You probably want to say 'N' here.
 
-if DEBUG || EXPERT = "y"
+if DEBUG || EXPERT
 
 config CRASH_DEBUG
 	bool "Crash Debugging Support"
diff --git a/xen/Makefile b/xen/Makefile
index afbf25c968..33bad53b4c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -11,7 +11,6 @@ export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) |
 export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
 export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
 export XEN_BUILD_HOST	?= $(shell hostname)
-export XEN_CONFIG_EXPERT ?= n
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python` if `which` is nowhere to be found.
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a51aa7bfa8..0ef8a99ad9 100644
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
index 28b3b4692a..a0822f4fd2 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -110,7 +110,7 @@ config BIGMEM
 	  If unsure, say N.
 
 config HVM_FEP
-	bool "HVM Forced Emulation Prefix support" if EXPERT = "y"
+	bool "HVM Forced Emulation Prefix support" if EXPERT
 	default DEBUG
 	depends on HVM
 	---help---
@@ -130,7 +130,7 @@ config HVM_FEP
 
 config TBOOT
 	def_bool y
-	prompt "Xen tboot support" if EXPERT = "y"
+	prompt "Xen tboot support" if EXPERT
 	select CRYPTO
 	---help---
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -201,7 +201,7 @@ config PV_SHIM_EXCLUSIVE
 	  If unsure, say N.
 
 config MEM_SHARING
-	bool "Xen memory sharing support" if EXPERT = "y"
+	bool "Xen memory sharing support" if EXPERT
 	depends on HVM
 
 endmenu
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2f516da101..5147252c88 100644
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
@@ -139,7 +139,7 @@ config KEXEC
 	  If unsure, say Y.
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
-    bool "EFI: call SetVirtualAddressMap()" if EXPERT = "y"
+    bool "EFI: call SetVirtualAddressMap()" if EXPERT
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
@@ -150,7 +150,7 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
 
 config XENOPROF
 	def_bool y
-	prompt "Xen Oprofile Support" if EXPERT = "y"
+	prompt "Xen Oprofile Support" if EXPERT
 	depends on X86
 	---help---
 	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
@@ -187,7 +187,7 @@ config XSM_FLASK
 
 config XSM_FLASK_AVC_STATS
 	def_bool y
-	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT = "y"
+	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
 	depends on XSM_FLASK
 	---help---
 	  Maintain counters on the access vector cache that can be viewed using
@@ -260,7 +260,7 @@ config LATE_HWDOM
 	  If unsure, say N.
 
 config ARGO
-	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT = "y"
+	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
 	---help---
 	  Enables a hypercall for domains to ask the hypervisor to perform
 	  data transfer of messages between domains.
@@ -279,7 +279,7 @@ config ARGO
 	  If unsure, say N.
 
 menu "Schedulers"
-	visible if EXPERT = "y"
+	visible if EXPERT
 
 config SCHED_CREDIT
 	bool "Credit scheduler support"
@@ -396,7 +396,7 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
 	  build becoming overly verbose.
 
 config CMDLINE
-	string "Built-in hypervisor command string" if EXPERT = "y"
+	string "Built-in hypervisor command string" if EXPERT
 	default ""
 	---help---
 	  Enter arguments here that should be compiled into the hypervisor
@@ -429,7 +429,7 @@ config DOM0_MEM
 	  Leave empty if you are not sure what to specify.
 
 config TRACEBUFFER
-	bool "Enable tracing infrastructure" if EXPERT = "y"
+	bool "Enable tracing infrastructure" if EXPERT
 	default y
 	---help---
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index e7e62ccd63..73f4ad89ec 100644
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
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



