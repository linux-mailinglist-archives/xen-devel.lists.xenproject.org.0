Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A3304767
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 20:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75440.135859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Tcj-0004pE-3t; Tue, 26 Jan 2021 19:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75440.135859; Tue, 26 Jan 2021 19:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Tci-0004o3-T0; Tue, 26 Jan 2021 19:03:32 +0000
Received: by outflank-mailman (input) for mailman id 75440;
 Tue, 26 Jan 2021 19:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4Tch-0004m8-Re
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 19:03:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6821c3c4-c8fd-498a-b837-3d016e3ec41b;
 Tue, 26 Jan 2021 19:03:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05D84206CC;
 Tue, 26 Jan 2021 19:03:28 +0000 (UTC)
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
X-Inumbo-ID: 6821c3c4-c8fd-498a-b837-3d016e3ec41b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611687809;
	bh=pXGVoUrbLMWKnQZdf4MGm9t6buSHMvzEiBn/WpMXRgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RwKqzJqDNdt4gt4nfcEn4eK0U+C11NpIk0gsCCQlV3FDXippf/nFNbbWQXBu4f/SO
	 3TjElyhZ5OfOd3WM3J2y0U/T77h0/8I1ZSsRnGuKGdtyElTAQ46SWCsZKwHHNThCXc
	 PzYGt64i3rfl5J3bMp5KQnLANsps/2YdgGVjwfAwBJ7qAvC21Ua8eHzqclH8DfaQLp
	 kmC8Y5q7e9+hqbFPpyRDo9Oh+zrvQA0S4RARfd4SfTklU+dhXmVycPiwON1/vIm0U8
	 tYpxgNOIMNKYcVZchucHSDleZcWYbrzg+QWFPmVxcMzjK6vfUJkdS8LuhN9BQ8QiHD
	 32cBXV90UBMdw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Date: Tue, 26 Jan 2021 11:03:27 -0800
Message-Id: <20210126190328.2461-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101261042030.20638@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261042030.20638@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

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
Reviewed-by: Jan Beulich <jbeulich@suse.com> [x86,common]
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
CC: andrew.cooper3@citrix.com
CC: george.dunlap@citrix.com
CC: iwj@xenproject.org
CC: jbeulich@suse.com
CC: julien@xen.org
CC: wl@xen.org

---
Changes in v5:
- add reviwed-by
- remove changes to ARM_SSBD and HARDEN_BRANCH_PREDICTOR

Changes in v4:
- clarify support statement of UNSUPPORTED
- move UNSUPPORTED past EXPERT
- add default EXPERT to UNSUPPORTED

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
 xen/Kconfig              | 11 ++++++++++-
 xen/arch/arm/Kconfig     |  6 +++---
 xen/arch/x86/Kconfig     |  6 +++---
 xen/common/Kconfig       |  2 +-
 xen/common/sched/Kconfig |  6 +++---
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 34c318bfa2..bcbd2758e5 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -35,7 +35,7 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 
 config EXPERT
-	bool "Configure standard Xen features (expert users)"
+	bool "Configure EXPERT features"
 	help
 	  This option allows certain base Xen options and settings
 	  to be disabled or tweaked. This is for specialized environments
@@ -45,6 +45,15 @@ config EXPERT
 	  supported.
 	default n
 
+config UNSUPPORTED
+	bool "Configure UNSUPPORTED features"
+	default EXPERT
+	help
+	  This option allows certain unsupported Xen options to be changed,
+	  which includes non-security-supported, experimental, and tech
+	  preview features as defined by SUPPORT.md. (Note that if an option
+	  doesn't depend on UNSUPPORTED it doesn't imply that is supported.)
+
 config LTO
 	bool "Link Time Optimisation"
 	depends on BROKEN
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c3eb13ea73..330bbf6232 100644
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


