Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40E92AFCE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755809.1164291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR42W-0008Px-GM; Tue, 09 Jul 2024 06:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755809.1164291; Tue, 09 Jul 2024 06:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR42W-0008Nc-DZ; Tue, 09 Jul 2024 06:09:24 +0000
Received: by outflank-mailman (input) for mailman id 755809;
 Tue, 09 Jul 2024 06:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR42V-0008NW-1A
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:09:23 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7fd9d1c-3db9-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:09:21 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 33CD127200;
 Tue,  9 Jul 2024 02:09:20 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 2AABD271FF;
 Tue,  9 Jul 2024 02:09:20 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 3E872271FC;
 Tue,  9 Jul 2024 02:09:18 -0400 (EDT)
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
X-Inumbo-ID: c7fd9d1c-3db9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=WAtXH3fP6tKdqS2avDvIWj8s3
	ooKivAC2EaiAkYKfEA=; b=OWWU9QInf4b8Kqejm9TFMCexdIqGNT969Y5KQ1m76
	dkw+ma1Z1W27lerK4aM75tnyr7ETC2MeQ029RDldUFk5LwOVAUhLTwmqa2Ond4lb
	cRWXA1fpymF53jzL00UQD7wLLfAlbMBrhWxh8bEymDzQXpsUrMhYvoVu1Zs6jkHx
	JU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v4 12/14] x86/ioreq: guard VIO_realmode_completion with CONFIG_VMX
Date: Tue,  9 Jul 2024 09:09:16 +0300
Message-Id: <e6e0f30ea69ecfed4d8de531fc42162162b3f6e5.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C73E9324-3DB9-11EF-A124-965B910A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

VIO_realmode_completion is specific to vmx realmode and thus the function
arch_vcpu_ioreq_completion() has actual handling code only in VMX-enabled=
 build,
as for the rest x86 and ARM build configurations it is basically a stub.
So these stubs can be avoided by moving VIO_realmode_completion handler's=
 code
under CONFIG_VMX and then ARM stub can be removed completely.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - move whole arch_vcpu_ioreq_completion() under CONFIG_VMX and remove
   ARM's variant of this handler, as Julien suggested
changes in v1:
 - put VIO_realmode_completion enum under #ifdef CONFIG_VMX
---
 xen/arch/arm/ioreq.c                 | 6 ------
 xen/arch/x86/hvm/ioreq.c             | 2 ++
 xen/arch/x86/include/asm/hvm/ioreq.h | 5 +++++
 xen/common/ioreq.c                   | 5 ++++-
 xen/include/xen/ioreq.h              | 1 -
 5 files changed, 11 insertions(+), 8 deletions(-)

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
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 4eb7a70182..0406630dc8 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -29,6 +29,7 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
=20
+#ifdef CONFIG_VMX
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
diff --git a/xen/arch/x86/include/asm/hvm/ioreq.h b/xen/arch/x86/include/=
asm/hvm/ioreq.h
index 84be14fd08..c5f16a1e4a 100644
--- a/xen/arch/x86/include/asm/hvm/ioreq.h
+++ b/xen/arch/x86/include/asm/hvm/ioreq.h
@@ -13,6 +13,11 @@
 #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
 #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
=20
+#ifdef CONFIG_VMX
+bool arch_vcpu_ioreq_completion(enum vio_completion completion);
+#define arch_vcpu_ioreq_completion
+#endif
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
=20
 /*
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 1257a3d972..10fe932a7e 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -242,9 +242,12 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
         res =3D handle_pio(vio->req.addr, vio->req.size,
                          vio->req.dir);
         break;
-
     default:
+#ifdef arch_vcpu_ioreq_completion
         res =3D arch_vcpu_ioreq_completion(completion);
+#else
+        ASSERT_UNREACHABLE();
+#endif
         break;
     }
=20
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index cd399adf17..22fb9ba7b0 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -111,7 +111,6 @@ void ioreq_domain_init(struct domain *d);
 int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *con=
st_op);
=20
 bool arch_ioreq_complete_mmio(void);
-bool arch_vcpu_ioreq_completion(enum vio_completion completion);
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
 void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
 void arch_ioreq_server_enable(struct ioreq_server *s);
--=20
2.25.1


