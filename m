Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A858C4D97
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721217.1124445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nMo-00049r-9Y; Tue, 14 May 2024 08:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721217.1124445; Tue, 14 May 2024 08:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nMo-00048B-5v; Tue, 14 May 2024 08:18:34 +0000
Received: by outflank-mailman (input) for mailman id 721217;
 Tue, 14 May 2024 08:18:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XrDB=MR=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s6nMm-000483-9G
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:18:32 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89b10015-11ca-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 10:18:28 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id B6DF02C401;
 Tue, 14 May 2024 04:18:27 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id AC85F2C3FE;
 Tue, 14 May 2024 04:18:27 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id E52922C3FD;
 Tue, 14 May 2024 04:18:26 -0400 (EDT)
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
X-Inumbo-ID: 89b10015-11ca-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=6W+coo3XknLwYEm/aCICEBr73
	mGn+RWQy4lYwn4OC8E=; b=kHbgHxQQKm/+QulFNZUHDx2aMocV6pEtUBc8WTbcO
	PGsoC2uOt32ES60IWdGfwKfuej/4+E0X3nMOA+AN9GgBR73g63MDrc9TKkVirt6u
	Y0gkNk7bHOXW7E4Y7DPx93xZYmqa0k1uWQdwmv/d5ZlGZ2naHvw+TfKyh8UboaPR
	dk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v3 1/6] x86/vpmu: separate amd/intel vPMU code
Date: Tue, 14 May 2024 11:18:25 +0300
Message-Id: <1deef9f4c7b362d8a0a33d0908293735953a066f.1715673586.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 8A16083A-11CA-11EF-A903-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Build AMD vPMU when CONFIG_AMD is on, and Intel vPMU when CONFIG_INTEL
is on respectively, allowing for a plaftorm-specific build.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>

---
changes in v3:
 - neither of the blank lines dropped
changes in v2:
 - drop static inline stubs, use #idef/#endif in vpmu_init)()
changes in v1:
 - switch to CONFIG_{AMD,INTEL} instead of CONFIG_{SVM,VMX}
---
 xen/arch/x86/cpu/Makefile | 4 +++-
 xen/arch/x86/cpu/vpmu.c   | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 35561fe51d..eafce5f204 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -10,4 +10,6 @@ obj-y +=3D intel.o
 obj-y +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
 obj-y +=3D shanghai.o
-obj-y +=3D vpmu.o vpmu_amd.o vpmu_intel.o
+obj-y +=3D vpmu.o
+obj-$(CONFIG_AMD) +=3D vpmu_amd.o
+obj-$(CONFIG_INTEL) +=3D vpmu_intel.o
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b2e9881e06..a7bc0cd1fc 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -827,6 +827,7 @@ static int __init cf_check vpmu_init(void)
=20
     switch ( vendor )
     {
+#ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
         ops =3D amd_vpmu_init();
         break;
@@ -834,10 +835,13 @@ static int __init cf_check vpmu_init(void)
     case X86_VENDOR_HYGON:
         ops =3D hygon_vpmu_init();
         break;
+#endif
=20
+#ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
         ops =3D core2_vpmu_init();
         break;
+#endif
=20
     default:
         printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %d. "
--=20
2.25.1


