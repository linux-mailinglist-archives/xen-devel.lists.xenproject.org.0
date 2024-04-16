Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3BA8A6401
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706634.1103907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcPw-0006BX-UV; Tue, 16 Apr 2024 06:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706634.1103907; Tue, 16 Apr 2024 06:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcPw-00068z-Ra; Tue, 16 Apr 2024 06:35:44 +0000
Received: by outflank-mailman (input) for mailman id 706634;
 Tue, 16 Apr 2024 06:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcPv-00068Z-VX
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:35:44 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b22676d-fbbb-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:35:41 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 5BEE33657E;
 Tue, 16 Apr 2024 02:35:40 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 54E1B3657D;
 Tue, 16 Apr 2024 02:35:40 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 6FC1B3657C;
 Tue, 16 Apr 2024 02:35:37 -0400 (EDT)
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
X-Inumbo-ID: 8b22676d-fbbb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=yt1e5CeIcMi14aJOR2Hc7CK1KtViZUVJ3OEeqEmOCWU=; b=AcXW
	tLKha4lIWA5TSibeADqaOn4NyJjQvzDX52EYV/CQewYewjBs8jbiGC9UiTmndK3I
	bJI7mrG3I9b12k6nEoxQ8+11RoOaEki+hT2Y4zI9BEQFUntShtwUhmw9Dv6P5Shh
	/pN6qL5mTX5V7pZ2xvZY9zHH9DQsbFVttPkfG4E=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 08/15] x86/vpmu: separate amd/intel vPMU code
Date: Tue, 16 Apr 2024 09:35:34 +0300
Message-Id: <20240416063534.3469482-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 89392214-FBBB-11EE-9506-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Build AMD vPMU when CONFIG_SVM is on, and Intel vPMU when CONFIG_VMX is o=
n
respectively, allowing for a plaftorm-specific build. Also separate
arch_vpmu_ops initializers using these options and static inline stubs.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/Makefile       |  4 +++-
 xen/arch/x86/include/asm/vpmu.h | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 35561fe51d..d3d7b8fb2e 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -10,4 +10,6 @@ obj-y +=3D intel.o
 obj-y +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
 obj-y +=3D shanghai.o
-obj-y +=3D vpmu.o vpmu_amd.o vpmu_intel.o
+obj-y +=3D vpmu.o
+obj-$(CONFIG_SVM) +=3D vpmu_amd.o
+obj-$(CONFIG_VMX) +=3D vpmu_intel.o
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/v=
pmu.h
index dae9b43dac..da86f2e420 100644
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
+#ifdef CONFIG_VMX
 const struct arch_vpmu_ops *core2_vpmu_init(void);
+#else
+static inline const struct arch_vpmu_ops* core2_vpmu_init(void)
+{
+    return ERR_PTR(-ENODEV);
+}
+#endif
+#ifdef CONFIG_SVM
 const struct arch_vpmu_ops *amd_vpmu_init(void);
 const struct arch_vpmu_ops *hygon_vpmu_init(void);
+#else
+static inline const struct arch_vpmu_ops* amd_vpmu_init(void)
+{
+    return ERR_PTR(-ENODEV);
+}
+static inline const struct arch_vpmu_ops* hygon_vpmu_init(void)
+{
+    return ERR_PTR(-ENODEV);
+}
+#endif
=20
 struct vpmu_struct {
     u32 flags;
--=20
2.25.1


