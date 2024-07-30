Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37716940F8F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767535.1178204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkES-0001mT-Rh; Tue, 30 Jul 2024 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767535.1178204; Tue, 30 Jul 2024 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkES-0001kO-Ov; Tue, 30 Jul 2024 10:37:28 +0000
Received: by outflank-mailman (input) for mailman id 767535;
 Tue, 30 Jul 2024 10:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYkER-0001hd-6X
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:37:27 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4a03df4-4e5f-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:37:25 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 9254A355CF;
 Tue, 30 Jul 2024 06:37:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 8AB63355CE;
 Tue, 30 Jul 2024 06:37:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 3A267355CD;
 Tue, 30 Jul 2024 06:37:19 -0400 (EDT)
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
X-Inumbo-ID: b4a03df4-4e5f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=3xlIyZGRQapil037Ov1OT3TEI
	+COLOquSIjJIH8xBF4=; b=byHdmW0ngI3bjiwI/c1qEunsswo/6aJtuSpeloZb6
	pvnxfOodCAdze0+VWf+iYpQqLa01us/8TPpk6yqygySVhBh7jviDE6Gn//b+9z1p
	ynRu8jUQQhlSgAkJrM/fAxVTQPeorqQMOBCUg2kKSoiJ5C6pgJ/LkbfoCVVQdj2v
	68=
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
Subject: [XEN PATCH v5 11/13] ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX configurations
Date: Tue, 30 Jul 2024 13:37:16 +0300
Message-Id: <67f143c15bece937d7b5c0739b14cc53b0c8c13d.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 B254EDE4-4E5F-11EF-901C-92D9AF168FA5-90055647!pb-smtp20.pobox.com
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
changes in v5:
 - introduce ARCH_IOREQ_COMPLETION option & put arch_vcpu_ioreq_completio=
n() under it
 - description changed
changes in v4:
 - move whole arch_vcpu_ioreq_completion() under CONFIG_VMX and remove
   ARM's variant of this handler, as Julien suggested
changes in v1:
 - put VIO_realmode_completion enum under #ifdef CONFIG_VMX
---
 xen/Kconfig              |  3 +++
 xen/arch/arm/ioreq.c     |  6 ------
 xen/arch/x86/Kconfig     |  1 +
 xen/arch/x86/hvm/ioreq.c |  2 ++
 xen/include/xen/ioreq.h  | 10 ++++++++++
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index e459cdac0c..4f477fa39b 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -95,4 +95,7 @@ config LTO
 config ARCH_SUPPORTS_INT128
 	bool
=20
+config ARCH_IOREQ_COMPLETION
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
index cd81fd1675..eff9eedc19 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -127,6 +127,7 @@ config AMD_SVM
=20
 config INTEL_VMX
 	def_bool HVM
+	select ARCH_IOREQ_COMPLETION
=20
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 4eb7a70182..0153ac4195 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -29,6 +29,7 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
=20
+#ifdef CONFIG_ARCH_IOREQ_COMPLETION
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
index cd399adf17..31d88eb2fe 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -111,7 +111,17 @@ void ioreq_domain_init(struct domain *d);
 int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *con=
st_op);
=20
 bool arch_ioreq_complete_mmio(void);
+
+#ifdef CONFIG_ARCH_IOREQ_COMPLETION
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


