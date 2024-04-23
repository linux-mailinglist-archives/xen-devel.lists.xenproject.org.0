Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263ED8AE034
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710428.1109651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBp1-0001uX-Rg; Tue, 23 Apr 2024 08:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710428.1109651; Tue, 23 Apr 2024 08:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBp1-0001ry-OK; Tue, 23 Apr 2024 08:48:15 +0000
Received: by outflank-mailman (input) for mailman id 710428;
 Tue, 23 Apr 2024 08:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBp0-0001rq-E9
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:48:14 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368071bd-014e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 10:48:12 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 343F52F507;
 Tue, 23 Apr 2024 04:48:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 2CACE2F506;
 Tue, 23 Apr 2024 04:48:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 816562F505;
 Tue, 23 Apr 2024 04:48:06 -0400 (EDT)
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
X-Inumbo-ID: 368071bd-014e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=tBZw+tTNRdaf6qGurFVkABj1A
	orbI3wQr6+AHMyDkRk=; b=vPB+e6UJ4L4kKdEv5sFHA4N/zd8WEk9dIy53m6zGk
	TEfftH13Tik//ZTlNZGbM47qd4/pdaEYvdH/p8hxyGzbdP8O1ytT88JXWgWW60KC
	GWwlt7u3pX+PVjyQNZ9KEoq5OOEsROptDU6Til96dbcI7wa5exL5iaPI1HIQjGHD
	Pg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 1/7] x86/vpmu: separate amd/intel vPMU code
Date: Tue, 23 Apr 2024 11:48:03 +0300
Message-Id: <a708db7fe06d131256ed2c75f518efce3d078fbb.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3421AB46-014E-11EF-8BF4-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Build AMD vPMU when CONFIG_AMD is on, and Intel vPMU when CONFIG_INTEL
is on respectively, allowing for a plaftorm-specific build. Also separate
arch_vpmu_ops initializers using these options and static inline stubs.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>

---
changes in v1:
 - switch to CONFIG_{AMD,INTEL} instead of CONFIG_{SVM,VMX}


 xen/arch/x86/cpu/Makefile       |  4 +++-
 xen/arch/x86/include/asm/vpmu.h | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

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
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/v=
pmu.h
index dae9b43dac..e7a8f211f8 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -11,6 +11,7 @@
 #define __ASM_X86_HVM_VPMU_H_
=20
 #include <public/pmu.h>
+#include <xen/err.h>
=20
 #define vcpu_vpmu(vcpu)   (&(vcpu)->arch.vpmu)
 #define vpmu_vcpu(vpmu)   container_of((vpmu), struct vcpu, arch.vpmu)
@@ -42,9 +43,27 @@ struct arch_vpmu_ops {
 #endif
 };
=20
+#ifdef CONFIG_INTEL
 const struct arch_vpmu_ops *core2_vpmu_init(void);
+#else
+static inline const struct arch_vpmu_ops *core2_vpmu_init(void)
+{
+    return ERR_PTR(-ENODEV);
+}
+#endif
+#ifdef CONFIG_AMD
 const struct arch_vpmu_ops *amd_vpmu_init(void);
 const struct arch_vpmu_ops *hygon_vpmu_init(void);
+#else
+static inline const struct arch_vpmu_ops *amd_vpmu_init(void)
+{
+    return ERR_PTR(-ENODEV);
+}
+static inline const struct arch_vpmu_ops *hygon_vpmu_init(void)
+{
+    return ERR_PTR(-ENODEV);
+}
+#endif
=20
 struct vpmu_struct {
     u32 flags;
--=20
2.25.1


