Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9FB963F77
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 11:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785564.1195055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjb6a-0003G6-GP; Thu, 29 Aug 2024 09:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785564.1195055; Thu, 29 Aug 2024 09:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjb6a-0003CJ-Cj; Thu, 29 Aug 2024 09:06:12 +0000
Received: by outflank-mailman (input) for mailman id 785564;
 Thu, 29 Aug 2024 09:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ns9Z=P4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sjb6Z-000382-3L
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 09:06:11 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb073ea2-65e5-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 11:06:04 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 5F6811F58A;
 Thu, 29 Aug 2024 05:06:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 5719A1F589;
 Thu, 29 Aug 2024 05:06:03 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 2E19C1F588;
 Thu, 29 Aug 2024 05:06:02 -0400 (EDT)
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
X-Inumbo-ID: eb073ea2-65e5-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=CbF2V9zLGMAUTXE/8jLkeb4ABf4w1O6sneUcUiJN5wE=; b=IMgt
	0U8Q11eyITYaYY7XFNhc40YURxUhrR9KoHRoahrcRSHWtelbXtsjSDoJR+6F7S5u
	HYOwTu+RI5Ix+PqViO6/PEmQG8DyTvx5OQ30SCA0GuS9y7mNyJqqUrqQNWA4VMe3
	QxB48EBGgnQzaFsQVaI5345i5ATZXyVolPd3Y6A=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3] x86/intel: optional build of PSR support
Date: Thu, 29 Aug 2024 12:05:59 +0300
Message-Id: <20240829090559.149249-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 EA264036-65E5-11EF-9CA1-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Platform Shared Resource feature is available for certain Intel's CPUs on=
ly,
hence can be put under CONFIG_INTEL build option.

When !INTEL then PSR-related sysctls XEN_SYSCTL_psr_cmt_op &
XEN_SYSCTL_psr_alloc are off as well.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
v2 patch here:
https://lore.kernel.org/xen-devel/20240801084453.1163506-1-Sergiy_Kibrik@=
epam.com/

changes in v3:
 - drop stubs for psr_domain_{init,free} & psr_ctxt_switch_to() and guard=
 these
   routines at call sites
 - add stub for psr_cmt_enabled()
 - drop some of #ifdef-s from arch_do_{domctl,sysctl}
changes in v2:
 - split outer switch cases for {XEN_SYSCTL,XEN_DOMCTL}_psr_cmt_op and
   {XEN_SYSCTL,XEN_DOMCTL}_psr_alloc so that return codes in default swit=
ch
   cases are not mangled (as Jan suggested)
---
 xen/arch/x86/Makefile          |  2 +-
 xen/arch/x86/domain.c          | 12 ++++++++----
 xen/arch/x86/domctl.c          |  3 +++
 xen/arch/x86/include/asm/psr.h |  7 +++++++
 xen/arch/x86/sysctl.c          |  4 +++-
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 286c003ec3..4d1ba2a3a1 100644
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
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 89aad7e897..ebe648ef80 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -861,7 +861,8 @@ int arch_domain_create(struct domain *d,
     if ( (rc =3D iommu_domain_init(d, config->iommu_opts)) !=3D 0 )
         goto fail;
=20
-    psr_domain_init(d);
+    if ( IS_ENABLED(CONFIG_INTEL) )
+        psr_domain_init(d);
=20
     if ( is_hvm_domain(d) )
     {
@@ -902,7 +903,8 @@ int arch_domain_create(struct domain *d,
=20
  fail:
     d->is_dying =3D DOMDYING_dead;
-    psr_domain_free(d);
+    if ( IS_ENABLED(CONFIG_INTEL) )
+        psr_domain_free(d);
     iommu_domain_destroy(d);
     cleanup_domain_irq_mapping(d);
     free_xenheap_page(d->shared_info);
@@ -940,7 +942,8 @@ void arch_domain_destroy(struct domain *d)
     free_xenheap_page(d->shared_info);
     cleanup_domain_irq_mapping(d);
=20
-    psr_domain_free(d);
+    if ( IS_ENABLED(CONFIG_INTEL) )
+        psr_domain_free(d);
 }
=20
 void arch_domain_shutdown(struct domain *d)
@@ -2024,7 +2027,8 @@ static void __context_switch(void)
         nd->arch.ctxt_switch->to(n);
     }
=20
-    psr_ctxt_switch_to(nd);
+    if ( IS_ENABLED(CONFIG_INTEL) )
+        psr_ctxt_switch_to(nd);
=20
     if ( need_full_gdt(nd) )
         update_xen_slot_in_full_gdt(n, cpu);
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 68b5b46d1a..bd8baaae20 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1195,6 +1195,7 @@ long arch_do_domctl(
     case XEN_DOMCTL_psr_alloc:
         switch ( domctl->u.psr_alloc.cmd )
         {
+#ifdef CONFIG_INTEL
         case XEN_DOMCTL_PSR_SET_L3_CBM:
             ret =3D psr_set_val(d, domctl->u.psr_alloc.target,
                               domctl->u.psr_alloc.data,
@@ -1257,6 +1258,8 @@ long arch_do_domctl(
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
index 51df78794c..d42c7f1580 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -67,10 +67,17 @@ enum psr_type {
=20
 extern struct psr_cmt *psr_cmt;
=20
+#ifdef CONFIG_INTEL
 static inline bool psr_cmt_enabled(void)
 {
     return !!psr_cmt;
 }
+#else
+static inline bool psr_cmt_enabled(void)
+{
+    return false;
+}
+#endif /* CONFIG_INTEL */
=20
 int psr_alloc_rmid(struct domain *d);
 void psr_free_rmid(struct domain *d);
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d40d82c5a..8b0d1f1e32 100644
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
+#ifdef CONFIG_INTEL
         case XEN_SYSCTL_PSR_get_l3_info:
             ret =3D psr_get_info(sysctl->u.psr_alloc.target,
                                PSR_TYPE_L3_CBM, data, ARRAY_SIZE(data));
@@ -279,6 +280,7 @@ long arch_do_sysctl(
             if ( __copy_field_to_guest(u_sysctl, sysctl, u.psr_alloc) )
                 ret =3D -EFAULT;
             break;
+#endif /* CONFIG_INTEL */
=20
         default:
             ret =3D -EOPNOTSUPP;
--=20
2.25.1


