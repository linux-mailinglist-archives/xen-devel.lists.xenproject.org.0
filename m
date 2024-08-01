Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7D9446EA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 10:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769459.1180363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZRQu-0003zD-6U; Thu, 01 Aug 2024 08:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769459.1180363; Thu, 01 Aug 2024 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZRQu-0003x7-2Q; Thu, 01 Aug 2024 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 769459;
 Thu, 01 Aug 2024 08:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TSRy=PA=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sZRQs-0003x1-Bk
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 08:45:10 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e7f6bf-4fe2-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 10:45:04 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id CD72124E3D;
 Thu,  1 Aug 2024 04:45:01 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id C5BB424E3C;
 Thu,  1 Aug 2024 04:45:01 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id B277F24E39;
 Thu,  1 Aug 2024 04:44:57 -0400 (EDT)
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
X-Inumbo-ID: 57e7f6bf-4fe2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=bMdXEGT4h8JNUNXs31Rh14RXwymMIlKEwtSqxFCgeJk=; b=nUqr
	M9UY96JxXP3lE7kF9DsUM3gUfM5D6vLU3B158cEn/tOtvhEvdoc5ddN4gzozzsxr
	LvdCkW1BBxkAoiWuYZK5XYe5us8szMO9DRzirXitJhh90LSDRyd82L6ZNbyua58B
	cYUNYlSfO9sQWsBM0h8P6rZdmxnC+v4rLzVQCvA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2] x86/intel: optional build of PSR support
Date: Thu,  1 Aug 2024 11:44:53 +0300
Message-Id: <20240801084453.1163506-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 54E823C2-4FE2-11EF-9A39-92D9AF168FA5-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Platform Shared Resource feature is available for certain Intel's CPUs on=
ly,
hence can be put under CONFIG_INTEL build option.

When !INTEL then PSR-related sysctls XEN_SYSCTL_psr_cmt_op &
XEN_SYSCTL_psr_alloc are off as well.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
v1 patch here:
https://lore.kernel.org/xen-devel/20240606083908.2510396-1-Sergiy_Kibrik@=
epam.com/

changes in v2:
 - split outer switch cases for {XEN_SYSCTL,XEN_DOMCTL}_psr_cmt_op and
   {XEN_SYSCTL,XEN_DOMCTL}_psr_alloc so that return codes in default swit=
ch
   cases are not mangled (as Jan suggested)
---
 xen/arch/x86/Makefile          |  2 +-
 xen/arch/x86/domctl.c          |  8 ++++++++
 xen/arch/x86/include/asm/psr.h |  9 +++++++++
 xen/arch/x86/sysctl.c          | 12 +++++++++++-
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d902fb7acc..02218d32c5 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -57,7 +57,7 @@ obj-y +=3D pci.o
 obj-y +=3D percpu.o
 obj-y +=3D physdev.o
 obj-$(CONFIG_COMPAT) +=3D x86_64/physdev.o
-obj-y +=3D psr.o
+obj-$(CONFIG_INTEL) +=3D psr.o
 obj-y +=3D setup.o
 obj-y +=3D shutdown.o
 obj-y +=3D smp.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a..bccd3852a7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1162,6 +1162,7 @@ long arch_do_domctl(
     }
=20
     case XEN_DOMCTL_psr_cmt_op:
+#ifdef CONFIG_INTEL
         if ( !psr_cmt_enabled() )
         {
             ret =3D -ENODEV;
@@ -1190,11 +1191,16 @@ long arch_do_domctl(
             ret =3D -ENOSYS;
             break;
         }
+
+#else /* CONFIG_INTEL */
+        ret =3D -ENOSYS;
+#endif
         break;
=20
     case XEN_DOMCTL_psr_alloc:
         switch ( domctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_INTEL
         case XEN_DOMCTL_PSR_SET_L3_CBM:
             ret =3D psr_set_val(d, domctl->u.psr_alloc.target,
                               domctl->u.psr_alloc.data,
@@ -1257,6 +1263,8 @@ long arch_do_domctl(
=20
 #undef domctl_psr_get_val
=20
+#endif /* CONFIG_INTEL */
+
         default:
             ret =3D -EOPNOTSUPP;
             break;
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/ps=
r.h
index 51df78794c..8a8c2b13d0 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -72,6 +72,8 @@ static inline bool psr_cmt_enabled(void)
     return !!psr_cmt;
 }
=20
+#ifdef CONFIG_INTEL
+
 int psr_alloc_rmid(struct domain *d);
 void psr_free_rmid(struct domain *d);
 void psr_ctxt_switch_to(struct domain *d);
@@ -86,6 +88,13 @@ int psr_set_val(struct domain *d, unsigned int socket,
 void psr_domain_init(struct domain *d);
 void psr_domain_free(struct domain *d);
=20
+#else
+
+static inline void psr_ctxt_switch_to(struct domain *d) {}
+static inline void psr_domain_init(struct domain *d) {}
+static inline void psr_domain_free(struct domain *d) {}
+#endif /* CONFIG_INTEL */
+
 #endif /* __ASM_PSR_H__ */
=20
 /*
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5a..b39b7f68de 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -32,6 +32,7 @@
 #include <asm/psr.h>
 #include <asm/cpu-policy.h>
=20
+#ifdef CONFIG_INTEL
 struct l3_cache_info {
     int ret;
     unsigned long size;
@@ -46,6 +47,7 @@ static void cf_check l3_cache_get(void *arg)
     if ( !l3_info->ret )
         l3_info->size =3D info.size / 1024; /* in KB unit */
 }
+#endif
=20
 static long cf_check smt_up_down_helper(void *data)
 {
@@ -170,6 +172,7 @@ long arch_do_sysctl(
     break;
=20
     case XEN_SYSCTL_psr_cmt_op:
+#ifdef CONFIG_INTEL
         if ( !psr_cmt_enabled() )
             return -ENODEV;
=20
@@ -218,6 +221,11 @@ long arch_do_sysctl(
             break;
         }
=20
+#else /* CONFIG_INTEL*/
+        sysctl->u.psr_cmt_op.u.data =3D 0;
+        ret =3D -ENOSYS;
+#endif
+
         if ( __copy_to_guest(u_sysctl, sysctl, 1) )
             ret =3D -EFAULT;
=20
@@ -225,10 +233,11 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_psr_alloc:
     {
-        uint32_t data[PSR_INFO_ARRAY_SIZE] =3D { };
+        uint32_t __maybe_unused data[PSR_INFO_ARRAY_SIZE] =3D { };
=20
         switch ( sysctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_INTEL
         case XEN_SYSCTL_PSR_get_l3_info:
             ret =3D psr_get_info(sysctl->u.psr_alloc.target,
                                PSR_TYPE_L3_CBM, data, ARRAY_SIZE(data));
@@ -279,6 +288,7 @@ long arch_do_sysctl(
             if ( __copy_field_to_guest(u_sysctl, sysctl, u.psr_alloc) )
                 ret =3D -EFAULT;
             break;
+#endif /* CONFIG_INTEL */
=20
         default:
             ret =3D -EOPNOTSUPP;
--=20
2.25.1


