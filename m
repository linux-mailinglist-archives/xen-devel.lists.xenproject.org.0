Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D736BA623ED
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915675.1321142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttGC0-0006Jd-9j; Sat, 15 Mar 2025 01:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915675.1321142; Sat, 15 Mar 2025 01:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttGC0-0006IB-79; Sat, 15 Mar 2025 01:20:00 +0000
Received: by outflank-mailman (input) for mailman id 915675;
 Sat, 15 Mar 2025 01:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttGBy-0006I5-1p
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:19:58 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b2b3e7a-013b-11f0-9ab9-95dc52dad729;
 Sat, 15 Mar 2025 02:19:56 +0100 (CET)
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
X-Inumbo-ID: 9b2b3e7a-013b-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742001595; x=1742260795;
	bh=pc23NTk5/ewe+F6KDRl7Ey05pFOa38NB6VbcqzfQMeo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RL5GYqQcYIwSoLuQzcrmZpIssMheLs23WyUwWOeTrVYZYgwQ69rSDWjy6MCuM6FYx
	 4oHPsSufTpfXiqEC4fZzOkRaHok63Lvw44rKXjBK2xWy8zRk9ubqkQrErMItS3bNbS
	 Jjk7Kef4cb7YsEPvR1kMVn3pl/RJg/8GojKKXwEYw2021YP+t2Lfg5GqJCBfb1zpH9
	 nkpTxmI/hPrY8Huj75RcA4GKVreqvCjIhNdHZXTx29NVaUICTB8jmKS/RZgY5R0CS0
	 DWCuV2r8A7y0ywV81UWf5YLJfEamOguRIt6cgzFsSydn74mXIGJzucV8PUeUknig89
	 PT+JL56QPMOhA==
Date: Sat, 15 Mar 2025 01:19:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3] x86/hvm: add HVM-specific Kconfig
Message-ID: <20250315011945.2927542-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 73b44169211124f2bb66d79362226426fc484003
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a separate menu for configuring HVM build-time settings to better
organize HVM-specific options.

HVM options will now appear in a dedicated sub-menu in the menuconfig
tool.

Also, make AMD_SVM config dependent on AMD config and INTEL_VMX on INTEL
respectively.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v2->v3:
- dropped menu around AMD_SVM and INTEL_VMX
- rebased, resolved merge conflict for MEM_PAGING - it depends on VM_EVENT
---
 xen/arch/x86/Kconfig     | 75 +---------------------------------------
 xen/arch/x86/hvm/Kconfig | 73 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 74 deletions(-)
 create mode 100644 xen/arch/x86/hvm/Kconfig

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index f086799594..18efdb2e31 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -107,42 +107,7 @@ config PV_LINEAR_PT
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
@@ -201,25 +166,6 @@ config BIGMEM
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
@@ -348,14 +294,6 @@ config HYPERV_GUEST
=20
 endif
=20
-config MEM_PAGING
-=09bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
-=09depends on HVM && VM_EVENT
-
-config MEM_SHARING
-=09bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
-=09depends on HVM
-
 config REQUIRE_NX
 =09bool "Require NX (No eXecute) support"
 =09help
@@ -372,17 +310,6 @@ config REQUIRE_NX
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
 config UCODE_SCAN_DEFAULT
 =09bool "Scan for microcode by default"
 =09help
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
new file mode 100644
index 0000000000..2def0f98e2
--- /dev/null
+++ b/xen/arch/x86/hvm/Kconfig
@@ -0,0 +1,73 @@
+menuconfig HVM
+=09bool "HVM support"
+=09depends on !PV_SHIM_EXCLUSIVE
+=09default !PV_SHIM
+=09select COMPAT
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
+=09bool "AMD-V" if AMD && EXPERT
+=09default y
+=09help
+=09  Enables virtual machine extensions on platforms that implement the
+=09  AMD Virtualization Technology (AMD-V).
+=09  If your system includes a processor with AMD-V support, say Y.
+=09  If in doubt, say Y.
+
+config INTEL_VMX
+=09bool "Intel VT-x" if INTEL && EXPERT
+=09default y
+=09select ARCH_VCPU_IOREQ_COMPLETION
+=09help
+=09  Enables virtual machine extensions on platforms that implement the
+=09  Intel Virtualization Technology (Intel VT-x).
+=09  If your system includes a processor with Intel VT-x support, say Y.
+=09  If in doubt, say Y.
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
+=09depends on VM_EVENT
+
+config MEM_SHARING
+=09bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
+
+endif
--=20
2.34.1



