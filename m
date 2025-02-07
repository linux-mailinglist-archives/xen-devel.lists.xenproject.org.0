Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF1A2D042
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884063.1293871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWRv-0005Sv-Hi; Fri, 07 Feb 2025 22:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884063.1293871; Fri, 07 Feb 2025 22:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWRv-0005QW-EF; Fri, 07 Feb 2025 22:03:47 +0000
Received: by outflank-mailman (input) for mailman id 884063;
 Fri, 07 Feb 2025 22:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vKp5=U6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tgWRs-0005QK-MC
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:03:45 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 642c1b26-e59f-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 23:03:41 +0100 (CET)
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
X-Inumbo-ID: 642c1b26-e59f-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ylfen2wamra23moezntanaucte.protonmail; t=1738965820; x=1739225020;
	bh=qLwORsXQ/fz16eGds0srU91tSd+MVBDLpltzvtPapis=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RjuBplT+SGoPnCdsivFi8iS/2JAV83J7rfvoUYdckZAZtgfshmonLlJGF90Tk++2Q
	 sM01bjE3zVOqvDJtxh69pGdRzk1q9/rAQr6NeQasmfCHI/UWrjmGn5Fev2cRKkOZNw
	 EgoPSlsAmqauSygbltm5vO9aL8J0+LIYTDzrtov63vwfzKWJqktpK/mdVk4XeYZolW
	 HMOBewEb6QfnIOBG0HDW9F3iZ7BmCmRGOIfeJNSsCTzd8vyMb8RpR2FryCcNsvXQm7
	 opS1EiU+l6xf0RDx1QXh0vcXC5poVCbVAHjnGGuFjHRlij2/xk5UKDM25EAIZWpMMF
	 c1Xda8Gnm8xeQ==
Date: Fri, 07 Feb 2025 22:03:35 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] x86/hvm: add HVM-specific Kconfig
Message-ID: <20250207220302.4190210-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f2fa37a8f5635486a761c1645273e1e5d4868cf8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add separate menu for configuring HVM build-time settings to help organizin=
g
HVM-specific options.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>

---
Link to the original patch:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-20-c5d36b31=
d66c@ford.com/
---
---
 xen/arch/x86/Kconfig     | 76 +---------------------------------------
 xen/arch/x86/hvm/Kconfig | 73 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 75 deletions(-)
 create mode 100644 xen/arch/x86/hvm/Kconfig

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721a..37362c205d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -30,7 +30,6 @@ config X86
 =09select HAS_SCHED_GRANULARITY
 =09select HAS_UBSAN
 =09select HAS_VMAP
-=09select HAS_VPCI if HVM
 =09select NEEDS_LIBELF
=20
 config ARCH_DEFCONFIG
@@ -107,42 +106,7 @@ config PV_LINEAR_PT
=20
          If unsure, say Y.
=20
-config HVM
-=09bool "HVM support"
-=09depends on !PV_SHIM_EXCLUSIVE
-=09default !PV_SHIM
-=09select COMPAT
-=09select IOREQ_SERVER
-=09select MEM_ACCESS_ALWAYS_ON
-=09help
-=09  Interfaces to support HVM domains.  HVM domains require hardware
-=09  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
-=09  guests which have no specific Xen knowledge.
-
-=09  This option is needed if you want to run HVM or PVH domains.
-
-=09  If unsure, say Y.
-
-config AMD_SVM
-=09bool "AMD-V" if EXPERT
-=09depends on HVM
-=09default y
-=09help
-=09  Enables virtual machine extensions on platforms that implement the
-=09  AMD Virtualization Technology (AMD-V).
-=09  If your system includes a processor with AMD-V support, say Y.
-=09  If in doubt, say Y.
-
-config INTEL_VMX
-=09bool "Intel VT-x" if EXPERT
-=09depends on HVM
-=09default y
-=09select ARCH_VCPU_IOREQ_COMPLETION
-=09help
-=09  Enables virtual machine extensions on platforms that implement the
-=09  Intel Virtualization Technology (Intel VT-x).
-=09  If your system includes a processor with Intel VT-x support, say Y.
-=09  If in doubt, say Y.
+source "arch/x86/hvm/Kconfig"
=20
 config XEN_SHSTK
 =09bool "Supervisor Shadow Stacks"
@@ -201,25 +165,6 @@ config BIGMEM
=20
 =09  If unsure, say N.
=20
-config HVM_FEP
-=09bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
-=09default DEBUG
-=09depends on HVM
-=09help
-
-=09  Compiles in a feature that allows HVM guest to arbitrarily
-=09  exercise the instruction emulator.
-
-=09  This feature can only be enabled during boot time with
-=09  appropriate hypervisor command line option. Please read
-=09  hypervisor command line documentation before trying to use
-=09  this feature.
-
-=09  This is strictly for testing purposes, and not appropriate
-=09  for use in production.
-
-=09  If unsure, say N.
-
 config TBOOT
 =09bool "Xen tboot support (UNSUPPORTED)"
 =09depends on INTEL && UNSUPPORTED
@@ -348,14 +293,6 @@ config HYPERV_GUEST
=20
 endif
=20
-config MEM_PAGING
-=09bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
-=09depends on HVM
-
-config MEM_SHARING
-=09bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
-=09depends on HVM
-
 config REQUIRE_NX
 =09bool "Require NX (No eXecute) support"
 =09help
@@ -372,17 +309,6 @@ config REQUIRE_NX
 =09  was unavailable. However, if enabled, Xen will no longer boot on
 =09  any CPU which is lacking NX support.
=20
-config ALTP2M
-=09bool "Alternate P2M support" if EXPERT
-=09depends on INTEL_VMX
-=09default y
-=09help
-=09  Alternate-p2m allows a guest to manage multiple p2m guest physical
-=09  "memory views" (as opposed to a single p2m).
-=09  Useful for memory introspection.
-
-=09  If unsure, stay with defaults.
-
 endmenu
=20
 source "common/Kconfig"
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
new file mode 100644
index 0000000000..cbfeb5e4f4
--- /dev/null
+++ b/xen/arch/x86/hvm/Kconfig
@@ -0,0 +1,73 @@
+menuconfig HVM
+=09bool "HVM support"
+=09depends on !PV_SHIM_EXCLUSIVE
+=09default !PV_SHIM
+=09select COMPAT
+=09select HAS_VPCI
+=09select IOREQ_SERVER
+=09select MEM_ACCESS_ALWAYS_ON
+=09help
+=09  Interfaces to support HVM domains.  HVM domains require hardware
+=09  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
+=09  guests which have no specific Xen knowledge.
+
+=09  This option is needed if you want to run HVM or PVH domains.
+
+=09  If unsure, say Y.
+
+if HVM
+
+config AMD_SVM
+=09bool "AMD-V" if EXPERT
+=09default y
+=09help
+=09  Enables virtual machine extensions on platforms that implement the
+=09  AMD Virtualization Technology (AMD-V).
+=09  If your system includes a processor with AMD-V support, say Y.
+=09  If in doubt, say Y.
+
+config INTEL_VMX
+=09bool "Intel VT-x" if EXPERT
+=09default y
+=09select ARCH_VCPU_IOREQ_COMPLETION
+=09help
+=09  Enables virtual machine extensions on platforms that implement the
+=09  Intel Virtualization Technology (Intel VT-x).
+=09  If your system includes a processor with Intel VT-x support, say Y.
+=09  If in doubt, say Y.
+
+config ALTP2M
+=09bool "Alternate P2M support" if EXPERT
+=09depends on INTEL_VMX
+=09default y
+=09help
+=09  Alternate-p2m allows a guest to manage multiple p2m guest physical
+=09  "memory views" (as opposed to a single p2m).
+=09  Useful for memory introspection.
+
+=09  If unsure, stay with defaults.
+
+config MEM_PAGING
+=09bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
+
+config MEM_SHARING
+=09bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
+
+config HVM_FEP
+=09bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
+=09default DEBUG
+=09help
+=09  Compiles in a feature that allows HVM guest to arbitrarily
+=09  exercise the instruction emulator.
+
+=09  This feature can only be enabled during boot time with
+=09  appropriate hypervisor command line option. Please read
+=09  hypervisor command line documentation before trying to use
+=09  this feature.
+
+=09  This is strictly for testing purposes, and not appropriate
+=09  for use in production.
+
+=09  If unsure, say N.
+
+endif
--=20
2.34.1



