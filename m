Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDFF8FE132
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 10:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736030.1142167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF8eW-00064S-Jt; Thu, 06 Jun 2024 08:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736030.1142167; Thu, 06 Jun 2024 08:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF8eW-00062E-Gd; Thu, 06 Jun 2024 08:39:20 +0000
Received: by outflank-mailman (input) for mailman id 736030;
 Thu, 06 Jun 2024 08:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dWw=NI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sF8eV-000628-S7
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 08:39:19 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42654c64-23e0-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 10:39:18 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id E126920F91;
 Thu,  6 Jun 2024 04:39:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id D949320F90;
 Thu,  6 Jun 2024 04:39:15 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 5727920F8F;
 Thu,  6 Jun 2024 04:39:12 -0400 (EDT)
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
X-Inumbo-ID: 42654c64-23e0-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=fqBvSAEw8XtwtZ3SAZ6vOTdrFxbzk12l4TwoY0xOxOM=; b=FxlF
	uaY3zTutb/V1OGR2JSDGrs4syzjvq/YlZWWmf4ssrwfiD50WKcIL2V0sX+jjVepS
	TN7yavkR9i9gKZ82RPpaWNjZ05JnapQOngiRQa9dDDwfNEaCNNO4qMMqvA2HIbQh
	fLisDcAoqzRf0bWOP0jU/6BYQo08PDLbHS6mtHI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1] x86/intel: optional build of PSR support
Date: Thu,  6 Jun 2024 11:39:08 +0300
Message-Id: <20240606083908.2510396-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3FEA45F0-23E0-11EF-BBD9-ACC938F0AE34-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Platform Shared Resource feature is available for certain Intel's CPUs on=
ly,
hence can be put under CONFIG_INTEL build option.

When !INTEL then PSR-related sysctls XEN_SYSCTL_psr_cmt_op &
XEN_SYSCTL_psr_alloc are off as well.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Makefile          |  2 +-
 xen/arch/x86/domctl.c          |  2 ++
 xen/arch/x86/include/asm/psr.h | 15 +++++++++++++++
 xen/arch/x86/sysctl.c          |  4 ++++
 4 files changed, 22 insertions(+), 1 deletion(-)

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
index 9a72d57333..cccf71f745 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1160,6 +1160,7 @@ long arch_do_domctl(
         break;
     }
=20
+#ifdef CONFIG_INTEL
     case XEN_DOMCTL_psr_cmt_op:
         if ( !psr_cmt_enabled() )
         {
@@ -1262,6 +1263,7 @@ long arch_do_domctl(
         }
=20
         break;
+#endif
=20
     case XEN_DOMCTL_get_cpu_policy:
         /* Process the CPUID leaves. */
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/ps=
r.h
index 51df78794c..14d5d33970 100644
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
@@ -86,6 +88,19 @@ int psr_set_val(struct domain *d, unsigned int socket,
 void psr_domain_init(struct domain *d);
 void psr_domain_free(struct domain *d);
=20
+#else
+
+static inline void psr_ctxt_switch_to(struct domain *d)
+{
+}
+static inline void psr_domain_init(struct domain *d)
+{
+}
+static inline void psr_domain_free(struct domain *d)
+{
+}
+#endif /* CONFIG_INTEL */
+
 #endif /* __ASM_PSR_H__ */
=20
 /*
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5a..947c954b42 100644
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
@@ -169,6 +171,7 @@ long arch_do_sysctl(
     }
     break;
=20
+#ifdef CONFIG_INTEL
     case XEN_SYSCTL_psr_cmt_op:
         if ( !psr_cmt_enabled() )
             return -ENODEV;
@@ -286,6 +289,7 @@ long arch_do_sysctl(
         }
         break;
     }
+#endif
=20
     case XEN_SYSCTL_get_cpu_levelling_caps:
         sysctl->u.cpu_levelling_caps.caps =3D levelling_caps;
--=20
2.25.1


