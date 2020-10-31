Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A230C2A11E7
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 01:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16717.41516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYegk-0000Ix-Pm; Sat, 31 Oct 2020 00:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16717.41516; Sat, 31 Oct 2020 00:24:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYegk-0000IZ-MB; Sat, 31 Oct 2020 00:24:10 +0000
Received: by outflank-mailman (input) for mailman id 16717;
 Sat, 31 Oct 2020 00:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIuu=EG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYegj-0000IU-4s
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 00:24:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d7922a4-6dc5-4d6b-a134-186ea18f9170;
 Sat, 31 Oct 2020 00:24:08 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CED9E206E5;
 Sat, 31 Oct 2020 00:24:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YIuu=EG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYegj-0000IU-4s
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 00:24:09 +0000
X-Inumbo-ID: 4d7922a4-6dc5-4d6b-a134-186ea18f9170
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4d7922a4-6dc5-4d6b-a134-186ea18f9170;
	Sat, 31 Oct 2020 00:24:08 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CED9E206E5;
	Sat, 31 Oct 2020 00:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604103847;
	bh=kOMKGMEqKOWTR2tX5PKtfxx/R7DyiG1cHABWKb9Usyc=;
	h=From:To:Cc:Subject:Date:From;
	b=cadDWJDumStYMN8G1tGMxBd5anO5yPbE3GpezViiyjxvZvmPV+HQ2I9A9/4yw9P3Q
	 5F5Tw5QniU67DFA2HXww1L3Tqd/kDJPM6al8MuNkI4BC7ZQbwiLjVPO3QmvVL/H5c6
	 DkpWJHu0bLsN9tsAxYSDoiNOiBLj94jn/Meyba34=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org
Subject: [RFC PATCH] xen: EXPERT clean-up
Date: Fri, 30 Oct 2020 17:24:05 -0700
Message-Id: <20201031002405.4545-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

A recent thread [1] has exposed a couple of issues with our current way
of handling EXPERT.

1) It is not obvious that "Configure standard Xen features (expert
users)" is actually the famous EXPERT we keep talking about on xen-devel

2) It is not obvious when we need to enable EXPERT to get a specific
feature

In particular if you want to enable ACPI support so that you can boot
Xen on an ACPI platform, you have to enable EXPERT first. But searching
through the kconfig menu it is really not clear (type '/' and "ACPI"):
nothing in the description tells you that you need to enable EXPERT to
get the option.

So this patch makes things easier by doing two things:

- rename the EXPERT description to clarify the option and make sure to
include the word "EXPERT" in the oneliner

- instead of using "if EXPERT" add EXPERT as a dependency so that when
searching for a feature on the menu you are told that you need to enable
EXPERT to get the option

[1] https://marc.info/?l=xen-devel&m=160333101228981

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: george.dunlap@citrix.com
CC: iwj@xenproject.org
CC: jbeulich@suse.com
CC: julien@xen.org
CC: wl@xen.org
---
 xen/Kconfig              | 13 ++++++-------
 xen/arch/arm/Kconfig     | 18 ++++++++++--------
 xen/arch/x86/Kconfig     | 11 ++++++-----
 xen/common/Kconfig       | 21 ++++++++++++++-------
 xen/common/sched/Kconfig |  2 +-
 5 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 34c318bfa2..5fa2716e2d 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -35,14 +35,13 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 
 config EXPERT
-	bool "Configure standard Xen features (expert users)"
+	bool "Configure EXPERT features"
 	help
-	  This option allows certain base Xen options and settings
-	  to be disabled or tweaked. This is for specialized environments
-	  which can tolerate a "non-standard" Xen.
-	  Only use this if you really know what you are doing.
-	  Xen binaries built with this option enabled are not security
-	  supported.
+	  This option allows certain experimental (see SUPPORT.md) Xen
+	  options and settings to be enabled/disabled. This is for
+	  specialized environments which can tolerate a "non-standard" Xen.
+	  Only use this if you really know what you are doing.  Xen binaries
+	  built with this option enabled are not security supported.
 	default n
 
 config LTO
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388265..0223cf11c6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -32,8 +32,8 @@ menu "Architecture Features"
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
-	depends on ARM_64
+	bool "ACPI (Advanced Configuration and Power Interface) Support"
+	depends on ARM_64 && EXPERT
 	---help---
 
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
@@ -49,8 +49,8 @@ config GICV3
 	  If unsure, say Y
 
 config HAS_ITS
-        bool "GICv3 ITS MSI controller support" if EXPERT
-        depends on GICV3 && !NEW_VGIC
+        bool "GICv3 ITS MSI controller support"
+        depends on GICV3 && !NEW_VGICi && EXPERT
 
 config HVM
         def_bool y
@@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
 
 config ARM_SSBD
-	bool "Speculative Store Bypass Disable" if EXPERT
-	depends on HAS_ALTERNATIVE
+	bool "Speculative Store Bypass Disable"
+	depends on HAS_ALTERNATIVE && EXPERT
 	default y
 	help
 	  This enables mitigation of bypassing of previous stores by speculative
@@ -89,7 +89,8 @@ config ARM_SSBD
 	  If unsure, say Y.
 
 config HARDEN_BRANCH_PREDICTOR
-	bool "Harden the branch predictor against aliasing attacks" if EXPERT
+	bool "Harden the branch predictor against aliasing attacks"
+	depends on EXPERT
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
@@ -106,7 +107,8 @@ config HARDEN_BRANCH_PREDICTOR
 	  If unsure, say Y.
 
 config TEE
-	bool "Enable TEE mediators support" if EXPERT
+	bool "Enable TEE mediators support"
+	depends on EXPERT
 	default n
 	help
 	  This option enables generic TEE mediators support. It allows guests
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 24868aa6ad..071bfbbc40 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -146,9 +146,9 @@ config BIGMEM
 	  If unsure, say N.
 
 config HVM_FEP
-	bool "HVM Forced Emulation Prefix support" if EXPERT
+	bool "HVM Forced Emulation Prefix support"
 	default DEBUG
-	depends on HVM
+	depends on HVM && EXPERT
 	---help---
 
 	  Compiles in a feature that allows HVM guest to arbitrarily
@@ -165,8 +165,9 @@ config HVM_FEP
 	  If unsure, say N.
 
 config TBOOT
-	bool "Xen tboot support" if EXPERT
+	bool "Xen tboot support"
 	default y if !PV_SHIM_EXCLUSIVE
+	depends on EXPERT
 	select CRYPTO
 	---help---
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -251,8 +252,8 @@ config HYPERV_GUEST
 endif
 
 config MEM_SHARING
-	bool "Xen memory sharing support" if EXPERT
-	depends on HVM
+	bool "Xen memory sharing support"
+	depends on HVM && EXPERT
 
 endmenu
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3e2cf25088..7a8c54e66c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,7 +12,8 @@ config CORE_PARKING
 	bool
 
 config GRANT_TABLE
-	bool "Grant table support" if EXPERT
+	bool "Grant table support"
+	depends on EXPERT
 	default y
 	---help---
 	  Grant table provides a generic mechanism to memory sharing
@@ -151,7 +152,8 @@ config KEXEC
 	  If unsure, say Y.
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
-    bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    bool "EFI: call SetVirtualAddressMap()"
+    depends on EXPERT
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
@@ -162,7 +164,8 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
 
 config XENOPROF
 	def_bool y
-	prompt "Xen Oprofile Support" if EXPERT
+	prompt "Xen Oprofile Support"
+	depends on EXPERT
 	depends on X86
 	---help---
 	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
@@ -199,7 +202,8 @@ config XSM_FLASK
 
 config XSM_FLASK_AVC_STATS
 	def_bool y
-	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
+	prompt "Maintain statistics on the FLASK access vector cache"
+	depends on EXPERT
 	depends on XSM_FLASK
 	---help---
 	  Maintain counters on the access vector cache that can be viewed using
@@ -272,7 +276,8 @@ config LATE_HWDOM
 	  If unsure, say N.
 
 config ARGO
-	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
+	bool "Argo: hypervisor-mediated interdomain communication"
+	depends on EXPERT
 	---help---
 	  Enables a hypercall for domains to ask the hypervisor to perform
 	  data transfer of messages between domains.
@@ -344,7 +349,8 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
 	  build becoming overly verbose.
 
 config CMDLINE
-	string "Built-in hypervisor command string" if EXPERT
+	string "Built-in hypervisor command string"
+	depends on EXPERT
 	default ""
 	---help---
 	  Enter arguments here that should be compiled into the hypervisor
@@ -377,7 +383,8 @@ config DOM0_MEM
 	  Leave empty if you are not sure what to specify.
 
 config TRACEBUFFER
-	bool "Enable tracing infrastructure" if EXPERT
+	bool "Enable tracing infrastructure"
+	depends on EXPERT
 	default y
 	---help---
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 61231aacaa..ec0385cd07 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -1,5 +1,5 @@
 menu "Schedulers"
-	visible if EXPERT
+	depends on EXPERT
 
 config SCHED_CREDIT
 	bool "Credit scheduler support"
-- 
2.17.1


