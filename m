Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E69D9FAD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844262.1259865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG52l-0007gK-Gl; Tue, 26 Nov 2024 23:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844262.1259865; Tue, 26 Nov 2024 23:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG52l-0007dl-CI; Tue, 26 Nov 2024 23:32:31 +0000
Received: by outflank-mailman (input) for mailman id 844262;
 Tue, 26 Nov 2024 23:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sp-0000Ao-NJ
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f8d82d9-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77C2A5C5D98;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A456AC4CEDC;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 99391D66B94;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3f8d82d9-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNmOGQ4MmQ5LWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzI2LjI2NzQzMSwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=3rV9SQVk/30C/uR+xCoEerXgtGQ+GY3Qffyqy2vy1lU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SGwS+nVz3R6LTSZsbbawwgPSwG4FaUqt9ctb2YeNyoXD85n0MiuI42uEE5b5dVvSf
	 k14PHNnarznICc31SNfnu1/ana8c+YOCI3ioBTsoOn7EQ2PMwUTqE5ofrq3KAflVK+
	 ltoaNe9+TZth6HkLEnL7A9aMsz69Cp6/UJgIMJc4ugya+bnQssgYtNA9vHg69fdKU1
	 pXxzMWSAq8XhUw6nivMr5iJYAFZoF5DnPvgYqrex4jZsanPoBzBCmSulixr3U+9DTo
	 qfQkjPs8HxlTaDGSUtvD3OoyVQw45FCwx1pl6hLlmOne6RZfaPJiayazr5ZCYihI54
	 ZGcrL2wHwi+3Q==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:21 -0800
Subject: [PATCH 31/36] x86/hvm: add HVM-specific Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-31-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=5119;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=xth/C4RssnpHF5d1BFSmQSRG1c+DKNwkoUPEyi1j9F4=;
 b=SOUETyT5mODqIQZsTEddy3lHiDVCjngDNDkNnn32sXy/ZccYCCpVCwy+fm7nrRFJ0PM9nFBaT
 yp2ZeAxEGFSCAl6mI+CVbAxa55bdaoZsW+pk5yz0S5PBRuTMQtP31rr
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add separate menu for configuring HVM build-time settings.
That will help organizing HVM-specific options under a separate menu.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/Kconfig     | 66 +++---------------------------------------------
 xen/arch/x86/hvm/Kconfig | 63 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa1916c7edd8fdf7d606858c73ce88..5afee9a9f9bafa3c760b06b8601fad4cad3b7191 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -107,42 +107,9 @@ config PV_LINEAR_PT
 
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
+menu "HVM Support"
+source "arch/x86/hvm/Kconfig"
+endmenu
 
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
@@ -201,25 +168,6 @@ config BIGMEM
 
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
@@ -348,14 +296,6 @@ config HYPERV_GUEST
 
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
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..361bb6572e633f3cf0fc972a3b391e8341c33361
--- /dev/null
+++ b/xen/arch/x86/hvm/Kconfig
@@ -0,0 +1,63 @@
+config HVM
+	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
+	default !PV_SHIM
+	select COMPAT
+	select IOREQ_SERVER
+	select MEM_ACCESS_ALWAYS_ON
+	help
+	  Interfaces to support HVM domains.  HVM domains require hardware
+	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
+	  guests which have no specific Xen knowledge.
+
+	  This option is needed if you want to run HVM or PVH domains.
+
+	  If unsure, say Y.
+
+config AMD_SVM
+	bool "AMD-V" if EXPERT
+	depends on HVM
+	default y
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  AMD Virtualization Technology (AMD-V).
+	  If your system includes a processor with AMD-V support, say Y.
+	  If in doubt, say Y.
+
+config INTEL_VMX
+	bool "Intel VT-x" if EXPERT
+	depends on HVM
+	default y
+	select ARCH_VCPU_IOREQ_COMPLETION
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  Intel Virtualization Technology (Intel VT-x).
+	  If your system includes a processor with Intel VT-x support, say Y.
+	  If in doubt, say Y.
+
+config MEM_PAGING
+	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HVM
+
+config MEM_SHARING
+	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HVM
+
+config HVM_FEP
+	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
+	default DEBUG
+	depends on HVM
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

-- 
2.34.1



