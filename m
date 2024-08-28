Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E89962576
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784709.1194091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGUl-00070T-0F; Wed, 28 Aug 2024 11:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784709.1194091; Wed, 28 Aug 2024 11:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGUk-0006yw-TX; Wed, 28 Aug 2024 11:05:46 +0000
Received: by outflank-mailman (input) for mailman id 784709;
 Wed, 28 Aug 2024 11:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=933A=P3=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sjGUj-0006yl-PY
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:05:45 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 779dc1ec-652d-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:05:43 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 4689C3DDE4;
 Wed, 28 Aug 2024 07:05:42 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 3A16A3DDE3;
 Wed, 28 Aug 2024 07:05:42 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.119.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 3289F3DDE0;
 Wed, 28 Aug 2024 07:05:37 -0400 (EDT)
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
X-Inumbo-ID: 779dc1ec-652d-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=6fC74O0gmkPt/XZJaNayOLv0S
	GsSK/V8Gt9hWnpnSqs=; b=Fq640KPOPDSdRu1mvA5jJGuaCP+JBmyYKQuAdpJ8+
	2+r2wwkxIIVGx6/xDwG6OrK4SisdUrOdJfnBeT3aarDfvwfr/Ul7gblyioq2cnbw
	ucF1LqzU67kRKGwVIiSIroIeoaQ0vOFQJun9d4sdOePzzJmhWihwa+UCkyZ5kIlQ
	TU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v7 1/2] ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX configurations
Date: Wed, 28 Aug 2024 14:05:34 +0300
Message-Id: <2e71667a06ece7f0d045c309d69bb73b99d6caa5.1724842645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1724842645.git.Sergiy_Kibrik@epam.com>
References: <cover.1724842645.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 7461714E-652D-11EF-88F4-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

VIO_realmode_completion is specific to vmx realmode and thus the function
arch_vcpu_ioreq_completion() has actual handling work only in VMX-enabled=
 build,
as for the rest x86 and ARM build configurations it is basically a stub.

Here a separate configuration option ARCH_VCPU_IOREQ_COMPLETION introduce=
d that
tells whether the platform we're building for requires any specific ioreq
completion handling. As of now only VMX has such requirement, so the opti=
on is
selected by INTEL_VMX, for other configurations a generic default stub is
provided (it is ARM's version of arch_vcpu_ioreq_completion() moved to co=
mmon
header).

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
---
changes in v7:
 - comment in Kconfig adjusted
 - fixed patch description
 - updated tags
changes in v6:
 - rename option ARCH_IOREQ_COMPLETION -> ARCH_VCPU_IOREQ_COMPLETION
 - put a comment with brief option's description
changes in v5:
 - introduce ARCH_IOREQ_COMPLETION option & put arch_vcpu_ioreq_completio=
n() under it
 - description changed
---
 xen/Kconfig              |  7 +++++++
 xen/arch/arm/ioreq.c     |  6 ------
 xen/arch/x86/Kconfig     |  1 +
 xen/arch/x86/hvm/ioreq.c |  2 ++
 xen/include/xen/ioreq.h  | 10 ++++++++++
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index e459cdac0c..72fdb83760 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -95,4 +95,11 @@ config LTO
 config ARCH_SUPPORTS_INT128
 	bool
=20
+#
+# For platforms that require specific handling of per-vCPU ioreq complet=
ion
+# events
+#
+config ARCH_VCPU_IOREQ_COMPLETION
+	bool
+
 source "Kconfig.debug"
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 5df755b48b..2e829d2e7f 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -135,12 +135,6 @@ bool arch_ioreq_complete_mmio(void)
     return false;
 }
=20
-bool arch_vcpu_ioreq_completion(enum vio_completion completion)
-{
-    ASSERT_UNREACHABLE();
-    return true;
-}
-
 /*
  * The "legacy" mechanism of mapping magic pages for the IOREQ servers
  * is x86 specific, so the following hooks don't need to be implemented =
on Arm:
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7ef5c8bc48..74e081c7bd 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -127,6 +127,7 @@ config AMD_SVM
=20
 config INTEL_VMX
 	def_bool HVM
+	select ARCH_VCPU_IOREQ_COMPLETION
=20
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 4eb7a70182..5c3d0c69aa 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -29,6 +29,7 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
=20
+#ifdef CONFIG_VCPU_ARCH_IOREQ_COMPLETION
 bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 {
     switch ( completion )
@@ -51,6 +52,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion com=
pletion)
=20
     return true;
 }
+#endif
=20
 static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
 {
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index cd399adf17..29a17e8ff5 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -111,7 +111,17 @@ void ioreq_domain_init(struct domain *d);
 int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *con=
st_op);
=20
 bool arch_ioreq_complete_mmio(void);
+
+#ifdef CONFIG_VCPU_ARCH_IOREQ_COMPLETION
 bool arch_vcpu_ioreq_completion(enum vio_completion completion);
+#else
+static inline bool arch_vcpu_ioreq_completion(enum vio_completion comple=
tion)
+{
+    ASSERT_UNREACHABLE();
+    return true;
+}
+#endif
+
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
 void arch_ioreq_server_enable(struct ioreq_server *s);
--=20
2.25.1


