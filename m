Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE02899AE8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 12:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701196.1095443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsgqE-0006n1-7Q; Fri, 05 Apr 2024 10:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701196.1095443; Fri, 05 Apr 2024 10:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsgqE-0006lF-4o; Fri, 05 Apr 2024 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 701196;
 Fri, 05 Apr 2024 10:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPJ4=LK=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rsgqC-0006l8-1w
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 10:30:36 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87cc3e3f-f337-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 12:30:33 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 9CCA41CCE07;
 Fri,  5 Apr 2024 06:30:31 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 937001CCE05;
 Fri,  5 Apr 2024 06:30:31 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id DA4DF1CCE04;
 Fri,  5 Apr 2024 06:30:30 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 87cc3e3f-f337-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=x4+s/HQp9NtJcuBNkyS5ldGfx3iN+MBSSDHfpBpZDd4=; b=qqs2
	R5VMOE/HVjcNM9mjlPln0ncoOAFRPWZwfiaGto7nB3FcfkNcDstMcGGfB2BT1ZRx
	1w6Xmtq+X+CfcmkOaOScuWS9cDXmfDV5yaFH+JRxF8jQ+zgdOZsgL6yGRjTkzAgS
	qNNUH/GS2wh+GOhGmttn3Xkd0hvPSEiazMshfko=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH V1] x86/ucode: optional amd/intel ucode build & load
Date: Fri,  5 Apr 2024 13:30:27 +0300
Message-Id: <20240405103027.2704728-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 8705E20C-F337-11EE-A79C-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Introduce configuration variables to make it possible to selectively turn
on/off CPU microcode management code in the build for AMD and Intel CPUs.

This is to allow build configuration for a specific CPU, not compile and
load what will not be used anyway.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig                | 12 ++++++++++++
 xen/arch/x86/cpu/microcode/Makefile |  4 ++--
 xen/arch/x86/cpu/microcode/core.c   |  5 ++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index d6f3128588..1ee5ae793d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -350,6 +350,18 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
=20
+config MICROCODE_INTEL
+	bool "Build with Intel CPU ucode support" if EXPERT
+        default y
+	help
+	  Support microcode management for Intel processors. If unsure, say Y.
+
+config MICROCODE_AMD
+	bool "Build with AMD CPU ucode support" if EXPERT
+        default y
+	help
+	  Support microcode management for AMD K10 family of processors
+	  and later. If unsure, say Y.
 endmenu
=20
 source "common/Kconfig"
diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/micro=
code/Makefile
index aae235245b..abd0afe8c5 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,3 +1,3 @@
-obj-y +=3D amd.o
 obj-y +=3D core.o
-obj-y +=3D intel.o
+obj-$(CONFIG_MICROCODE_AMD) +=3D amd.o
+obj-$(CONFIG_MICROCODE_INTEL) +=3D intel.o
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microco=
de/core.c
index 1c9f66ea8a..b7c108f68b 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -865,6 +865,7 @@ int __init early_microcode_init(unsigned long *module=
_map,
=20
     switch ( c->x86_vendor )
     {
+#ifdef CONFIG_MICROCODE_AMD
     case X86_VENDOR_AMD:
         if ( c->x86 >=3D 0x10 )
         {
@@ -872,11 +873,13 @@ int __init early_microcode_init(unsigned long *modu=
le_map,
             can_load =3D true;
         }
         break;
-
+#endif
+#ifdef CONFIG_MICROCODE_INTEL
     case X86_VENDOR_INTEL:
         ucode_ops =3D intel_ucode_ops;
         can_load =3D intel_can_load_microcode();
         break;
+#endif
     }
=20
     if ( !ucode_ops.apply_microcode )
--=20
2.25.1


