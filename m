Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E2A011A5
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864720.1276073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQx-0000KT-Rt; Sat, 04 Jan 2025 01:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864720.1276073; Sat, 04 Jan 2025 01:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQw-0008TL-FT; Sat, 04 Jan 2025 01:58:34 +0000
Received: by outflank-mailman (input) for mailman id 864720;
 Sat, 04 Jan 2025 01:58:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQo-0005Ax-RK
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eac8ac3-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAA915C639F;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C8BC4CEE1;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D810FE77188;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5eac8ac3-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=nSRwKS/LlYYRVpg8RD3W+jOmXH2WKIn1w6/k5ce46cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q0oJSytHpCJ18yKH3eU+0eiIoBhxu4aXsWcv+wQbyrAfsK0SblMhDqc8Fj1GH3zu2
	 nAf5Z5qhTjoWRdPUfQc/qQQ5l931UhCoSjHGrXHEdRLLq6OHFrVaFRrIa2ieieLdRx
	 w3vsgK6F+lM3H9NanKEtv0Z8M+iF3kdHTChk+kfR5Qcg9EZJiCHfQoq5RiT1DvTUxY
	 ALoMaAw8vW3JS7Q/43Ub3x0BASTI5iYMsJB7zLWmvipHHzhBcOm9XsVC7/1u9ZHpM/
	 SaVL8zlWrj76w0m4PS/A+WFPodEyvhNvou0kMp53iI2ODr5Nig3LNNaWhM+FLWL5ce
	 OYi7DEg46BXug==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:26 -0800
Subject: [PATCH v3 20/24] x86/hvm: add HVM-specific Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-20-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=5996;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=ZuTYcfV9biFH1je7dgKxHOvxFrMn/uUk/GeyiLFF3sY=;
 b=Ku3PacZpewsitaaL+kvBF+lfGyiiPlFVCVhhsjjgR1C+JMZqsYY5+po+CuFLwLCorvFrQSYaU
 tUP9VKEu1XVD7+pNk0pEDd3kjb5KXYHvZukXa/aIu2dExvh5lytJzrv
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add separate menu for configuring HVM build-time settings to help organizing
HVM-specific options.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/Kconfig     | 76 +-----------------------------------------------
 xen/arch/x86/hvm/Kconfig | 74 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa1916c7edd8fdf7d606858c73ce88..37362c205dc664a1e809322c2cfe9f45394e30df 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -30,7 +30,6 @@ config X86
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VMAP
-	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
 
 config ARCH_DEFCONFIG
@@ -107,42 +106,7 @@ config PV_LINEAR_PT
 
          If unsure, say Y.
 
-config HVM
-	bool "HVM support"
-	depends on !PV_SHIM_EXCLUSIVE
-	default !PV_SHIM
-	select COMPAT
-	select IOREQ_SERVER
-	select MEM_ACCESS_ALWAYS_ON
-	help
-	  Interfaces to support HVM domains.  HVM domains require hardware
-	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
-	  guests which have no specific Xen knowledge.
-
-	  This option is needed if you want to run HVM or PVH domains.
-
-	  If unsure, say Y.
-
-config AMD_SVM
-	bool "AMD-V" if EXPERT
-	depends on HVM
-	default y
-	help
-	  Enables virtual machine extensions on platforms that implement the
-	  AMD Virtualization Technology (AMD-V).
-	  If your system includes a processor with AMD-V support, say Y.
-	  If in doubt, say Y.
-
-config INTEL_VMX
-	bool "Intel VT-x" if EXPERT
-	depends on HVM
-	default y
-	select ARCH_VCPU_IOREQ_COMPLETION
-	help
-	  Enables virtual machine extensions on platforms that implement the
-	  Intel Virtualization Technology (Intel VT-x).
-	  If your system includes a processor with Intel VT-x support, say Y.
-	  If in doubt, say Y.
+source "arch/x86/hvm/Kconfig"
 
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
@@ -201,25 +165,6 @@ config BIGMEM
 
 	  If unsure, say N.
 
-config HVM_FEP
-	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
-	default DEBUG
-	depends on HVM
-	help
-
-	  Compiles in a feature that allows HVM guest to arbitrarily
-	  exercise the instruction emulator.
-
-	  This feature can only be enabled during boot time with
-	  appropriate hypervisor command line option. Please read
-	  hypervisor command line documentation before trying to use
-	  this feature.
-
-	  This is strictly for testing purposes, and not appropriate
-	  for use in production.
-
-	  If unsure, say N.
-
 config TBOOT
 	bool "Xen tboot support (UNSUPPORTED)"
 	depends on INTEL && UNSUPPORTED
@@ -348,14 +293,6 @@ config HYPERV_GUEST
 
 endif
 
-config MEM_PAGING
-	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
-	depends on HVM
-
-config MEM_SHARING
-	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
-	depends on HVM
-
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
 	help
@@ -372,17 +309,6 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
 
-config ALTP2M
-	bool "Alternate P2M support" if EXPERT
-	depends on INTEL_VMX
-	default y
-	help
-	  Alternate-p2m allows a guest to manage multiple p2m guest physical
-	  "memory views" (as opposed to a single p2m).
-	  Useful for memory introspection.
-
-	  If unsure, stay with defaults.
-
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..fdfa9f80d30347ac9c34e52f5ba829bc11916dc0
--- /dev/null
+++ b/xen/arch/x86/hvm/Kconfig
@@ -0,0 +1,74 @@
+menuconfig HVM
+	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
+	default !PV_SHIM
+	select COMPAT
+	select IOREQ_SERVER
+	select MEM_ACCESS_ALWAYS_ON
+	select HAS_VPCI
+	help
+	  Interfaces to support HVM domains.  HVM domains require hardware
+	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
+	  guests which have no specific Xen knowledge.
+
+	  This option is needed if you want to run HVM or PVH domains.
+
+	  If unsure, say Y.
+
+if HVM
+
+config AMD_SVM
+	bool "AMD-V" if EXPERT
+	default y
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  AMD Virtualization Technology (AMD-V).
+	  If your system includes a processor with AMD-V support, say Y.
+	  If in doubt, say Y.
+
+config INTEL_VMX
+	bool "Intel VT-x" if EXPERT
+	default y
+	select ARCH_VCPU_IOREQ_COMPLETION
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  Intel Virtualization Technology (Intel VT-x).
+	  If your system includes a processor with Intel VT-x support, say Y.
+	  If in doubt, say Y.
+
+config ALTP2M
+	bool "Alternate P2M support" if EXPERT
+	depends on INTEL_VMX
+	default y
+	help
+	  Alternate-p2m allows a guest to manage multiple p2m guest physical
+	  "memory views" (as opposed to a single p2m).
+	  Useful for memory introspection.
+
+	  If unsure, stay with defaults.
+
+config MEM_PAGING
+	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
+
+config MEM_SHARING
+	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
+
+config HVM_FEP
+	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
+	default DEBUG
+	help
+
+	  Compiles in a feature that allows HVM guest to arbitrarily
+	  exercise the instruction emulator.
+
+	  This feature can only be enabled during boot time with
+	  appropriate hypervisor command line option. Please read
+	  hypervisor command line documentation before trying to use
+	  this feature.
+
+	  This is strictly for testing purposes, and not appropriate
+	  for use in production.
+
+	  If unsure, say N.
+
+endif

-- 
2.34.1



