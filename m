Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960D969550
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788690.1198140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNvj-0002Pr-Ac; Tue, 03 Sep 2024 07:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788690.1198140; Tue, 03 Sep 2024 07:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNvj-0002Ns-7k; Tue, 03 Sep 2024 07:26:23 +0000
Received: by outflank-mailman (input) for mailman id 788690;
 Tue, 03 Sep 2024 07:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0nne=QB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1slNvi-0002Nh-2l
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:26:22 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfad377f-69c5-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 09:26:20 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 1BFD53099A;
 Tue,  3 Sep 2024 03:26:18 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 1436630999;
 Tue,  3 Sep 2024 03:26:18 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id D4F9830998;
 Tue,  3 Sep 2024 03:26:16 -0400 (EDT)
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
X-Inumbo-ID: cfad377f-69c5-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=h5N0iXa3hJfHnwvrylkrQh0a0aEXV3QI2OpAYy71Hs0=; b=JOMs
	H75W+XlXtvZ5OqtNhIqNUpf57gso+6nw0FkwcI9JPouuavC1OOYQD99npi+WbNW0
	J/slrd4cFVHVQZHrLMCxEk3Y8bD+Qn+zNUm4A4rKEJAt/9trPRlZKWiCSiexeIf7
	lfrdo7qYVu6JWjqr6CZiiCtDqatXGYeMJp8JiJo=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v4] x86/intel: optional build of PSR support
Date: Tue,  3 Sep 2024 10:26:14 +0300
Message-Id: <20240903072614.291048-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CEAFD4E6-69C5-11EF-8B18-9B0F950A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Platform Shared Resource feature is available for certain Intel's CPUs on=
ly,

Xen's implementation of PSR only supports Intel CPUs right now, hence it =
can be
made dependant on CONFIG_INTEL build option.
Since platform implementation is not limited to single vendor, intermedia=
te
option CONFIG_PSR introduced, which selected by CONFIG_INTEL.

When !PSR then PSR-related sysctls XEN_SYSCTL_psr_cmt_op &
XEN_SYSCTL_psr_alloc are off as well.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3 patch here:
https://lore.kernel.org/xen-devel/20240829090559.149249-1-Sergiy_Kibrik@e=
pam.com/

changes in v4:
 - introduced CONFIG_PSR
 - changed description
 - changes to psr stubs
changes in v3:
 - drop stubs for psr_domain_{init,free} & psr_ctxt_switch_to() and guard=
 these
   routines at call sites
 - add stub for psr_cmt_enabled()
 - drop some of #ifdef-s from arch_do_{domctl,sysctl}
---
 xen/arch/x86/Kconfig           |  3 +++
 xen/arch/x86/Kconfig.cpu       |  1 +
 xen/arch/x86/Makefile          |  2 +-
 xen/arch/x86/domctl.c          |  3 +++
 xen/arch/x86/include/asm/psr.h | 10 ++++++++--
 xen/arch/x86/sysctl.c          |  4 +++-
 6 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 7ef5c8bc48..1fcb7b3a26 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -284,6 +284,9 @@ endchoice
 config GUEST
 	bool
=20
+config PSR
+	bool
+
 config XEN_GUEST
 	bool "Xen Guest"
 	select GUEST
diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
index 5fb18db1aa..7c649a478b 100644
--- a/xen/arch/x86/Kconfig.cpu
+++ b/xen/arch/x86/Kconfig.cpu
@@ -13,6 +13,7 @@ config AMD
 config INTEL
 	bool "Support Intel CPUs"
 	default y
+	select PSR
 	help
 	  Detection, tunings and quirks for Intel platforms.
=20
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 286c003ec3..4db3c214b0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -57,7 +57,7 @@ obj-y +=3D pci.o
 obj-y +=3D percpu.o
 obj-y +=3D physdev.o
 obj-$(CONFIG_COMPAT) +=3D x86_64/physdev.o
-obj-y +=3D psr.o
+obj-$(CONFIG_PSR) +=3D psr.o
 obj-y +=3D setup.o
 obj-y +=3D shutdown.o
 obj-y +=3D smp.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a..182f5fb11b 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1195,6 +1195,7 @@ long arch_do_domctl(
     case XEN_DOMCTL_psr_alloc:
         switch ( domctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_PSR
         case XEN_DOMCTL_PSR_SET_L3_CBM:
             ret =3D psr_set_val(d, domctl->u.psr_alloc.target,
                               domctl->u.psr_alloc.data,
@@ -1257,6 +1258,8 @@ long arch_do_domctl(
=20
 #undef domctl_psr_get_val
=20
+#endif /* CONFIG_PSR */
+
         default:
             ret =3D -EOPNOTSUPP;
             break;
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/ps=
r.h
index 51df78794c..7fa51f0cb3 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -69,12 +69,11 @@ extern struct psr_cmt *psr_cmt;
=20
 static inline bool psr_cmt_enabled(void)
 {
-    return !!psr_cmt;
+    return IS_ENABLED(CONFIG_PSR) ? !!psr_cmt : false;
 }
=20
 int psr_alloc_rmid(struct domain *d);
 void psr_free_rmid(struct domain *d);
-void psr_ctxt_switch_to(struct domain *d);
=20
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len);
@@ -83,8 +82,15 @@ int psr_get_val(struct domain *d, unsigned int socket,
 int psr_set_val(struct domain *d, unsigned int socket,
                 uint64_t new_val, enum psr_type type);
=20
+#ifdef CONFIG_PSR
+void psr_ctxt_switch_to(struct domain *d);
 void psr_domain_init(struct domain *d);
 void psr_domain_free(struct domain *d);
+#else
+static inline void psr_ctxt_switch_to(struct domain *d) {}
+static inline void psr_domain_init(struct domain *d) {}
+static inline void psr_domain_free(struct domain *d) {}
+#endif
=20
 #endif /* __ASM_PSR_H__ */
=20
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5a..fedb533ce5 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -225,10 +225,11 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_psr_alloc:
     {
-        uint32_t data[PSR_INFO_ARRAY_SIZE] =3D { };
+        uint32_t __maybe_unused data[PSR_INFO_ARRAY_SIZE] =3D { };
=20
         switch ( sysctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_PSR
         case XEN_SYSCTL_PSR_get_l3_info:
             ret =3D psr_get_info(sysctl->u.psr_alloc.target,
                                PSR_TYPE_L3_CBM, data, ARRAY_SIZE(data));
@@ -279,6 +280,7 @@ long arch_do_sysctl(
             if ( __copy_field_to_guest(u_sysctl, sysctl, u.psr_alloc) )
                 ret =3D -EFAULT;
             break;
+#endif /* CONFIG_PSR */
=20
         default:
             ret =3D -EOPNOTSUPP;
--=20
2.25.1


