Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232F94BA88
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 12:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773858.1184297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc06w-0002WM-So; Thu, 08 Aug 2024 10:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773858.1184297; Thu, 08 Aug 2024 10:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc06w-0002TJ-P5; Thu, 08 Aug 2024 10:11:10 +0000
Received: by outflank-mailman (input) for mailman id 773858;
 Thu, 08 Aug 2024 10:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkzM=PH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sc06v-0002TB-U0
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 10:11:09 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84df10d6-556e-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 12:11:05 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 2B10B31D10;
 Thu,  8 Aug 2024 06:11:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 242D931D0F;
 Thu,  8 Aug 2024 06:11:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id EDA2D31D0C;
 Thu,  8 Aug 2024 06:10:58 -0400 (EDT)
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
X-Inumbo-ID: 84df10d6-556e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=jkj3n75J3Xa5OS3eW3QITrbx8
	NB9ZCV+n3azsRyLMWo=; b=ZrnBXFqfjRdTXCMRKFiLpgwQVGpjlRg1lpgpcToF0
	oJUWy8oVvGDhvNpfToPLtn47rcdWdms1xgW3MxKj107NbeaUNzzh6854/pqJdIhF
	uFD4AQklESB+fC8gcJBi0UbWByxn+Ld3edNX0S1DiPb5kCaSjps/1r67mZ26aIWi
	yA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v6 2/3] ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX configurations
Date: Thu,  8 Aug 2024 13:10:54 +0300
Message-Id: <04e5397ecfcdb4d5680c7d36f71c4b471004ccd0.1723110344.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
References: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 8223E5EC-556E-11EF-8DA7-E92ED1CD468F-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

VIO_realmode_completion is specific to vmx realmode and thus the function
arch_vcpu_ioreq_completion() has actual handling work only in VMX-enabled=
 build,
as for the rest x86 and ARM build configurations it is basically a stub.

Here a separate configuration option ARCH_IOREQ_COMPLETION introduced tha=
t tells
whether the platform we're building for requires any specific ioreq compl=
etion
handling. As of now only VMX has such requirement, so the option is selec=
ted
by INTEL_VMX, for other configurations a generic default stub is provided
(it is ARM's version of arch_vcpu_ioreq_completion() moved to common head=
er).

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v6:
 - rename option ARCH_IOREQ_COMPLETION -> ARCH_VCPU_IOREQ_COMPLETION
 - put a comment with brief option's description
changes in v5:
 - introduce ARCH_IOREQ_COMPLETION option & put arch_vcpu_ioreq_completio=
n() under it
 - description changed
changes in v4:
 - move whole arch_vcpu_ioreq_completion() under CONFIG_VMX and remove
   ARM's variant of this handler, as Julien suggested
---
 xen/Kconfig              |  6 ++++++
 xen/arch/arm/ioreq.c     |  6 ------
 xen/arch/x86/Kconfig     |  1 +
 xen/arch/x86/hvm/ioreq.c |  2 ++
 xen/include/xen/ioreq.h  | 10 ++++++++++
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index e459cdac0c..b8d08af374 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -95,4 +95,10 @@ config LTO
 config ARCH_SUPPORTS_INT128
 	bool
=20
+#
+# For platforms that require specific handling of ioreq completion event=
s
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


