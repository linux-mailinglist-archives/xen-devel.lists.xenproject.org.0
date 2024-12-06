Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AF9E667F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849577.1264237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJH-0001Mf-E9; Fri, 06 Dec 2024 04:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849577.1264237; Fri, 06 Dec 2024 04:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJH-0001Jb-B8; Fri, 06 Dec 2024 04:51:23 +0000
Received: by outflank-mailman (input) for mailman id 849577;
 Fri, 06 Dec 2024 04:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA9-0004Kb-0W
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 644269c0-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 960CC5C732D;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35F63C4CEDE;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2C274E77173;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 644269c0-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=3rV9SQVk/30C/uR+xCoEerXgtGQ+GY3Qffyqy2vy1lU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k64HvH+qF2M9KGqEwnq44eOJ05uQEed2KEIqeWYUDnIzhT6RGz0czXFjlzNDO+VAZ
	 2KCrkwM762rqoIHcLKWZe9gcDm7751+ICxtL7b321CluCXK2EGsJXADEhQ+bUNZuQB
	 9ElKBIDS71X3NjP0UEtIWWaMHcR50mMLJkEQNAJA/Jrlgc51W4+CN/1DrWxo/E8/VF
	 S6BHFzIiHxRupv3chXQ/ByJEtfrM/YejfB43HundwFN9HJqklvtErhA+4bK28DkaDx
	 MzN/ENlfTD6af7HLWj/plxliEtPAzkLiuk5tVL7f9RYQGWfAlizuZpgqlhQctB30fW
	 j/Tq701j5qasw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:59 -0800
Subject: [PATCH v2 29/35] x86/hvm: add HVM-specific Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-29-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=5119;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=xth/C4RssnpHF5d1BFSmQSRG1c+DKNwkoUPEyi1j9F4=;
 b=Vf271mgRaklsri59ELziwyPLixUZV+ZRBALCEceomO950VfpmFBMRC/F1MZNNjtkP1V+Xe9Qe
 TZw4tEu3tp+D99eMcCUirUGz0xbPwVr/dkhKp/It6nMJui7zC8PG38U
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



