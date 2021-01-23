Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466B30123B
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 03:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73190.131978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l38Wr-00022l-LN; Sat, 23 Jan 2021 02:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73190.131978; Sat, 23 Jan 2021 02:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l38Wr-00022P-GI; Sat, 23 Jan 2021 02:19:57 +0000
Received: by outflank-mailman (input) for mailman id 73190;
 Sat, 23 Jan 2021 02:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmv8=G2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l38Wp-00022K-Hs
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 02:19:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12643925-4e27-4d29-8105-f753e243a12b;
 Sat, 23 Jan 2021 02:19:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F4D923B26;
 Sat, 23 Jan 2021 02:19:53 +0000 (UTC)
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
X-Inumbo-ID: 12643925-4e27-4d29-8105-f753e243a12b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611368394;
	bh=JO82ZvTFAwydQvzuNDU6QXl21mhdn4DPKTkjxw22bi0=;
	h=From:To:Cc:Subject:Date:From;
	b=Cu3I828LLR5Imj/XNVhCP1o4tmzT2CDaA37mBll9UcLVj7A70KF6QBvbgXfI2rmJJ
	 xQk1yxsIvQ4xomMAKQme39JLlbhBiiBiQ9fIx+avNkfZJ2FzCkAd9X5eQljpMwFQGM
	 VHRaawKXIs8RXEH8s+KEBJWY5PYX18+Xj8gjKQTAyYFnLB2fBNQoB2d065motVhlWp
	 HdG6JlSQxpRnuzSIFPScimubp0/Nlo+AQ4muOWEF/lPREzsrP3TcL0FSCq9ctvl8fq
	 ciEpMC2Gx+ySCqqL0Zv9LRdu2evvosPHU3TuFxwRA7lCMOpQt1Jiyj1co/4+J4KhWH
	 oCesVsJPNiIpg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com
Subject: [PATCH v3] xen: EXPERT clean-up and introduce UNSUPPORTED
Date: Fri, 22 Jan 2021 18:19:50 -0800
Message-Id: <20210123021950.1270-1-sstabellini@kernel.org>
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

- introduce a new kconfig option UNSUPPORTED which is clearly to enable
  UNSUPPORTED features as defined by SUPPORT.md

- change EXPERT options to UNSUPPORTED where it makes sense: keep
  depending on EXPERT for features made for experts

- tag unsupported features by adding (UNSUPPORTED) to the one-line
  description

- clarify the EXPERT one-line description

[1] https://marc.info/?l=xen-devel&m=160333101228981

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: george.dunlap@citrix.com
CC: iwj@xenproject.org
CC: jbeulich@suse.com
CC: julien@xen.org
CC: wl@xen.org
CC: Bertrand.Marquis@arm.com

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v3:
- improve UNSUPPORTED text description
- avoid changing XEN_SHSTK and EFI_SET_VIRTUAL_ADDRESS_MAP
- update HVM_FEP to be UNSUPPORTED

Changes in v2:
- introduce UNSUPPORTED
- don't switch all EXPERT options to UNSUPPORTED

See as reference the v2 thread here:
https://marc.info/?l=xen-devel&m=160566066013723
---
 xen/Kconfig              |  9 ++++++++-
 xen/arch/arm/Kconfig     | 10 +++++-----
 xen/arch/x86/Kconfig     |  6 +++---
 xen/common/Kconfig       |  2 +-
 xen/common/sched/Kconfig |  6 +++---
 5 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 34c318bfa2..4a3d988353 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -34,8 +34,15 @@ config DEFCONFIG_LIST
 	option defconfig_list
 	default ARCH_DEFCONFIG
 
+config UNSUPPORTED
+	bool "Configure UNSUPPORTED features"
+	help
+	  This option allows certain unsupported Xen options to be changed,
+	  which includes non-security-supported, experimental, and tech
+	  preview features as defined by SUPPORT.md.
+
 config EXPERT
-	bool "Configure standard Xen features (expert users)"
+	bool "Configure EXPERT features"
 	help
 	  This option allows certain base Xen options and settings
 	  to be disabled or tweaked. This is for specialized environments
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c3eb13ea73..cca76040e5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -32,7 +32,7 @@ menu "Architecture Features"
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
+	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64
 	---help---
 
@@ -49,7 +49,7 @@ config GICV3
 	  If unsure, say Y
 
 config HAS_ITS
-        bool "GICv3 ITS MSI controller support" if EXPERT
+        bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC
 
 config HVM
@@ -77,7 +77,7 @@ config SBSA_VUART_CONSOLE
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
 
 config ARM_SSBD
-	bool "Speculative Store Bypass Disable" if EXPERT
+	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
 	depends on HAS_ALTERNATIVE
 	default y
 	help
@@ -87,7 +87,7 @@ config ARM_SSBD
 	  If unsure, say Y.
 
 config HARDEN_BRANCH_PREDICTOR
-	bool "Harden the branch predictor against aliasing attacks" if EXPERT
+	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
@@ -104,7 +104,7 @@ config HARDEN_BRANCH_PREDICTOR
 	  If unsure, say Y.
 
 config TEE
-	bool "Enable TEE mediators support" if EXPERT
+	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
 	help
 	  This option enables generic TEE mediators support. It allows guests
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 78f351f94b..302334d3e4 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -147,7 +147,7 @@ config BIGMEM
 	  If unsure, say N.
 
 config HVM_FEP
-	bool "HVM Forced Emulation Prefix support" if EXPERT
+	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
 	default DEBUG
 	depends on HVM
 	---help---
@@ -166,7 +166,7 @@ config HVM_FEP
 	  If unsure, say N.
 
 config TBOOT
-	bool "Xen tboot support" if EXPERT
+	bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
 	default y if !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	---help---
@@ -252,7 +252,7 @@ config HYPERV_GUEST
 endif
 
 config MEM_SHARING
-	bool "Xen memory sharing support" if EXPERT
+	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
 endmenu
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index b5c91a1664..39451e8350 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -272,7 +272,7 @@ config LATE_HWDOM
 	  If unsure, say N.
 
 config ARGO
-	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
+	bool "Argo: hypervisor-mediated interdomain communication (UNSUPPORTED)" if UNSUPPORTED
 	---help---
 	  Enables a hypercall for domains to ask the hypervisor to perform
 	  data transfer of messages between domains.
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 61231aacaa..94c9e20139 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -15,7 +15,7 @@ config SCHED_CREDIT2
 	  optimized for lower latency and higher VM density.
 
 config SCHED_RTDS
-	bool "RTDS scheduler support (EXPERIMENTAL)"
+	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
 	default y
 	---help---
 	  The RTDS scheduler is a soft and firm real-time scheduler for
@@ -23,14 +23,14 @@ config SCHED_RTDS
 	  in the cloud, and general low-latency workloads.
 
 config SCHED_ARINC653
-	bool "ARINC653 scheduler support (EXPERIMENTAL)"
+	bool "ARINC653 scheduler support (UNSUPPORTED)" if UNSUPPORTED
 	default DEBUG
 	---help---
 	  The ARINC653 scheduler is a hard real-time scheduler for single
 	  cores, targeted for avionics, drones, and medical devices.
 
 config SCHED_NULL
-	bool "Null scheduler support (EXPERIMENTAL)"
+	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
 	default y
 	---help---
 	  The null scheduler is a static, zero overhead scheduler,
-- 
2.17.1


