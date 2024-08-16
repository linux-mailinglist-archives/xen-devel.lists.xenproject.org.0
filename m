Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97B954798
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778530.1188594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seur5-0006dI-4c; Fri, 16 Aug 2024 11:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778530.1188594; Fri, 16 Aug 2024 11:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seur5-0006bK-1g; Fri, 16 Aug 2024 11:10:51 +0000
Received: by outflank-mailman (input) for mailman id 778530;
 Fri, 16 Aug 2024 11:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eKx=PP=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1seur3-0006aw-KN
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:10:49 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f9b20fb-5bc0-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:10:47 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 10C581AD20;
 Fri, 16 Aug 2024 07:10:45 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 092211AD1F;
 Fri, 16 Aug 2024 07:10:45 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 9F7F61AD1E;
 Fri, 16 Aug 2024 07:10:41 -0400 (EDT)
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
X-Inumbo-ID: 2f9b20fb-5bc0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=jlgPaY/GIjAxFDl/srIa2LTto
	2punK5EfkiByCImD2s=; b=qW7qseu1JtMjy76Gb8GMh6hfOPq6GzFCzEpW1kdSx
	OmnuYkkYYOYtyy0Yox8ubVan40i537yAmDQrcgDup06oRL37yaXVxcdtyED1PacF
	tB/O3HUSmTxlHP5W9zMDGDihZu8wF3hBZOTdWp3MCkWomw4b9b9rJZUtvjU9txbk
	XE=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 1/5] x86/Kconfig: introduce CENTAUR, HYGON & SHANGHAI config options
Date: Fri, 16 Aug 2024 14:10:37 +0300
Message-Id: <2a217c9602e92f92050cb4894bb9a42ee99a84ea.1723806405.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 2CE33EEA-5BC0-11EF-A193-E92ED1CD468F-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

These options aim to represent what's currently supported by Xen, and lat=
er
to allow tuning for specific platform(s) only.

HYGON and SHANGHAI options depend on AMD and INTEL as there're build
dependencies on support code for AMD and Intel CPUs respectively.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Kconfig.cpu  | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/cpu/Makefile |  6 +++---
 xen/arch/x86/cpu/common.c |  6 ++++++
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
index 5fb18db1aa..ac8f41d464 100644
--- a/xen/arch/x86/Kconfig.cpu
+++ b/xen/arch/x86/Kconfig.cpu
@@ -10,6 +10,25 @@ config AMD
 	  May be turned off in builds targetting other vendors.  Otherwise,
 	  must be enabled for Xen to work suitably on AMD platforms.
=20
+config CENTAUR
+	bool "Support Centaur CPUs"
+	default y
+	help
+	  Detection, tunings and quirks for VIA platforms.
+
+	  May be turned off in builds targeting other vendors. Otherwise, must
+          be enabled for Xen to work suitably on VIA platforms.
+
+config HYGON
+	bool "Support Hygon CPUs"
+	depends on AMD
+	default y
+	help
+	  Detection, tunings and quirks for Hygon platforms.
+
+	  May be turned off in builds targeting other vendors. Otherwise, must
+          be enabled for Xen to work suitably on Hygon platforms.
+
 config INTEL
 	bool "Support Intel CPUs"
 	default y
@@ -19,4 +38,14 @@ config INTEL
 	  May be turned off in builds targetting other vendors.  Otherwise,
 	  must be enabled for Xen to work suitably on Intel platforms.
=20
+config SHANGHAI
+	bool "Support Shanghai CPUs"
+	depends on INTEL
+	default y
+	help
+	  Detection, tunings and quirks for Zhaoxin platforms.
+
+	  May be turned off in builds targeting other vendors. Otherwise, must
+          be enabled for Xen to work suitably on Zhaoxin platforms.
+
 endmenu
diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index eafce5f204..80739d0256 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -3,13 +3,13 @@ obj-y +=3D microcode/
 obj-y +=3D mtrr/
=20
 obj-y +=3D amd.o
-obj-y +=3D centaur.o
+obj-$(CONFIG_CENTAUR) +=3D centaur.o
 obj-y +=3D common.o
-obj-y +=3D hygon.o
+obj-$(CONFIG_HYGON) +=3D hygon.o
 obj-y +=3D intel.o
 obj-y +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
-obj-y +=3D shanghai.o
+obj-$(CONFIG_SHANGHAI) +=3D shanghai.o
 obj-y +=3D vpmu.o
 obj-$(CONFIG_AMD) +=3D vpmu_amd.o
 obj-$(CONFIG_INTEL) +=3D vpmu_intel.o
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ff4cd22897..dcc2753212 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -339,9 +339,15 @@ void __init early_cpu_init(bool verbose)
 	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
 				  actual_cpu =3D intel_cpu_dev;    break;
 	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
+#ifdef CONFIG_CENTAUR
 	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
+#endif
+#ifdef CONFIG_SHANGHAI
 	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
+#endif
+#ifdef CONFIG_HYGON
 	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
+#endif
 	default:
 		actual_cpu =3D default_cpu;
 		if (!verbose)
--=20
2.25.1


