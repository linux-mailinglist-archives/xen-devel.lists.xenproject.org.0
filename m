Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E33811FF
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127536.239718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhekp-0000uR-Fc; Fri, 14 May 2021 20:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127536.239718; Fri, 14 May 2021 20:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhekp-0000r3-BV; Fri, 14 May 2021 20:49:51 +0000
Received: by outflank-mailman (input) for mailman id 127536;
 Fri, 14 May 2021 20:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lheko-0000qv-Ft
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:49:50 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a330b98-4568-4f8a-990d-244c0f4f2527;
 Fri, 14 May 2021 20:49:49 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025166577979.807324518762;
 Fri, 14 May 2021 13:46:06 -0700 (PDT)
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
X-Inumbo-ID: 7a330b98-4568-4f8a-990d-244c0f4f2527
ARC-Seal: i=1; a=rsa-sha256; t=1621025168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DqquiB0vcshufhX81dYR856SpqjmGXYTkT5hRNpUvFQ3pA/2BrgcXVR9JRXUIDwAwapBXIaV4wxym6Fflcy8XdCLw3QOpS7rL+KllWFEYFVcCDz7vnEC13Nt2f6nVTbVzYYprsA1MSlMOUBjxHDrSZk/2h++HtU1mUWTGam30yQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025168; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+YSQvju142df7o/Gs9B5LinHIqbuYDA8GAjRaF5brhs=; 
	b=nKD/UcxBpJFTnyjN/pvu106KfhlXt60tTJG+wWGFjAdi/RYsZxD6TRNzC9YkCcyHQkVAgwRM5HRoAGwkRgMMVEPgTOX75Y35hao8cnh0qWQFb4avnkr05Jj/j9gjhLEXQVaRjmYrZ7dN4xIakaM4Lez0RmfYWZmfvDBrzSx0z2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025168;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+YSQvju142df7o/Gs9B5LinHIqbuYDA8GAjRaF5brhs=;
	b=ILb0cWCBrYqzAtyEV8JbEC6XUl5hDbSuLB4rAWlO7S3V7lyEAfWTFPcTJHlO2rbc
	GfKZyoG3Xl9oTrdsUy9b4OeIM2WMhJKJd1O+ujM0Jp/Ibjx00GRMGf2oAe9jcVDGxQj
	9Zs7rb5AuurdXSWQU7ZPlimXFpMSWejDKGVxmL1Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 04/10] xsm: convert rewrite privilege check function
Date: Fri, 14 May 2021 16:54:31 -0400
Message-Id: <20210514205437.13661-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This converts the previous XSM hook dummy checks over to using equivalent domain role privileges.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/dm.c                     |   2 +-
 xen/arch/arm/domctl.c                 |   6 +-
 xen/arch/arm/hvm.c                    |   2 +-
 xen/arch/arm/mm.c                     |   2 +-
 xen/arch/arm/platform_hypercall.c     |   2 +-
 xen/arch/x86/cpu/mcheck/mce.c         |   2 +-
 xen/arch/x86/cpu/vpmu.c               |   2 +-
 xen/arch/x86/domctl.c                 |   8 +-
 xen/arch/x86/hvm/dm.c                 |   2 +-
 xen/arch/x86/hvm/hvm.c                |  12 +-
 xen/arch/x86/irq.c                    |   4 +-
 xen/arch/x86/mm.c                     |  20 +-
 xen/arch/x86/mm/mem_paging.c          |   2 +-
 xen/arch/x86/mm/mem_sharing.c         |   8 +-
 xen/arch/x86/mm/p2m.c                 |   2 +-
 xen/arch/x86/mm/paging.c              |   4 +-
 xen/arch/x86/mm/shadow/set.c          |   2 +-
 xen/arch/x86/msi.c                    |   2 +-
 xen/arch/x86/pci.c                    |   2 +-
 xen/arch/x86/physdev.c                |  16 +-
 xen/arch/x86/platform_hypercall.c     |  10 +-
 xen/arch/x86/pv/emul-priv-op.c        |   2 +-
 xen/arch/x86/sysctl.c                 |   4 +-
 xen/common/domain.c                   |   4 +-
 xen/common/domctl.c                   |  12 +-
 xen/common/event_channel.c            |  12 +-
 xen/common/grant_table.c              |  16 +-
 xen/common/hypfs.c                    |   2 +-
 xen/common/kernel.c                   |   2 +-
 xen/common/kexec.c                    |   2 +-
 xen/common/mem_access.c               |   2 +-
 xen/common/memory.c                   |  16 +-
 xen/common/monitor.c                  |   2 +-
 xen/common/sched/core.c               |   6 +-
 xen/common/sysctl.c                   |   8 +-
 xen/common/vm_event.c                 |   2 +-
 xen/common/xenoprof.c                 |   2 +-
 xen/drivers/char/console.c            |   2 +-
 xen/drivers/passthrough/device_tree.c |   4 +-
 xen/drivers/passthrough/pci.c         |  12 +-
 xen/include/xen/sched.h               |   6 +
 xen/include/xsm/dummy.h               | 256 ++++++++++++++------------
 xen/include/xsm/xsm.h                 |  13 +-
 43 files changed, 253 insertions(+), 246 deletions(-)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 1b3fd6bc7d..7bc2ec42f6 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -45,7 +45,7 @@ int dm_op(const struct dmop_args *op_args)
     if ( rc )
         return rc;
 
-    rc = xsm_dm_op(XSM_DM_PRIV, d);
+    rc = xsm_dm_op(DEV_EMU_PRIVS, d);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index b7d27f37df..fff8829b9b 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -95,11 +95,11 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
          * done by the 2 hypercalls for consistency with other
          * architectures.
          */
-        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL);
+        rc = xsm_map_domain_irq(XSM_NONE, d, irq, NULL);
         if ( rc )
             return rc;
 
-        rc = xsm_bind_pt_irq(XSM_HOOK, d, bind);
+        rc = xsm_bind_pt_irq(XSM_NONE, d, bind);
         if ( rc )
             return rc;
 
@@ -130,7 +130,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( irq != virq )
             return -EINVAL;
 
-        rc = xsm_unbind_pt_irq(XSM_HOOK, d, bind);
+        rc = xsm_unbind_pt_irq(XSM_NONE, d, bind);
         if ( rc )
             return rc;
 
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 8951b34086..ec84077988 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -101,7 +101,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_hvm_param(XSM_TARGET, d, op);
+        rc = xsm_hvm_param(TARGET_PRIVS, d, op);
         if ( rc )
             goto param_fail;
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 59f8a3f15f..7e88d9b1c7 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1446,7 +1446,7 @@ int xenmem_add_to_physmap_one(
             return -EINVAL;
         }
 
-        rc = xsm_map_gmfn_foreign(XSM_TARGET, d, od);
+        rc = xsm_map_gmfn_foreign(TARGET_PRIVS, d, od);
         if ( rc )
         {
             put_pg_owner(od);
diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 8efac7ee60..4913f65e13 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -33,7 +33,7 @@ long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_platform_op(XSM_PRIV, op->cmd);
+    ret = xsm_platform_op(XSM_PLAT_CTRL, op->cmd);
     if ( ret )
         return ret;
 
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 7f433343bc..f6ce05cba9 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1376,7 +1376,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
     struct xen_mc_msrinject *mc_msrinject;
     struct xen_mc_mceinject *mc_mceinject;
 
-    ret = xsm_do_mca(XSM_PRIV);
+    ret = xsm_do_mca(XSM_PLAT_CTRL);
     if ( ret )
         return x86_mcerr("", ret);
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index d8659c63f8..612b87526b 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -706,7 +706,7 @@ long do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
     if ( !opt_vpmu_enabled || has_vlapic(current->domain) )
         return -EOPNOTSUPP;
 
-    ret = xsm_pmu_op(XSM_OTHER, current->domain, op);
+    ret = xsm_pmu_op(XSM_NONE | XSM_DOM_SUPER, current->domain, op);
     if ( ret )
         return ret;
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index e440bd021e..5cbe55a700 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -234,7 +234,7 @@ long arch_do_domctl(
         if ( (fp + np) <= fp || (fp + np) > MAX_IOPORTS )
             ret = -EINVAL;
         else if ( !ioports_access_permitted(currd, fp, fp + np - 1) ||
-                  xsm_ioport_permission(XSM_HOOK, d, fp, fp + np - 1, allow) )
+                  xsm_ioport_permission(XSM_NONE, d, fp, fp + np - 1, allow) )
             ret = -EPERM;
         else if ( allow )
             ret = ioports_permit_access(d, fp, fp + np - 1);
@@ -534,7 +534,7 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
 
-        ret = xsm_bind_pt_irq(XSM_HOOK, d, bind);
+        ret = xsm_bind_pt_irq(XSM_NONE, d, bind);
         if ( ret )
             break;
 
@@ -569,7 +569,7 @@ long arch_do_domctl(
         if ( irq <= 0 || !irq_access_permitted(currd, irq) )
             break;
 
-        ret = xsm_unbind_pt_irq(XSM_HOOK, d, bind);
+        ret = xsm_unbind_pt_irq(XSM_NONE, d, bind);
         if ( ret )
             break;
 
@@ -616,7 +616,7 @@ long arch_do_domctl(
         if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
             break;
 
-        ret = xsm_ioport_mapping(XSM_HOOK, d, fmp, fmp + np - 1, add);
+        ret = xsm_ioport_mapping(XSM_NONE, d, fmp, fmp + np - 1, add);
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index b60b9f3364..bc452b551e 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -370,7 +370,7 @@ int dm_op(const struct dmop_args *op_args)
     if ( !is_hvm_domain(d) )
         goto out;
 
-    rc = xsm_dm_op(XSM_DM_PRIV, d);
+    rc = xsm_dm_op(DEV_EMU_PRIVS, d);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ae37bc434a..7e9c624037 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4064,7 +4064,7 @@ static int hvm_allow_set_param(struct domain *d,
     uint64_t value;
     int rc;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_set_param);
+    rc = xsm_hvm_param(TARGET_PRIVS, d, HVMOP_set_param);
     if ( rc )
         return rc;
 
@@ -4211,7 +4211,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
         rc = pmtimer_change_ioport(d, value);
         break;
     case HVM_PARAM_ALTP2M:
-        rc = xsm_hvm_param_altp2mhvm(XSM_PRIV, d);
+        rc = xsm_hvm_param_altp2mhvm(XSM_DOM_SUPER, d);
         if ( rc )
             break;
         if ( (value > XEN_ALTP2M_limited) ||
@@ -4340,7 +4340,7 @@ static int hvm_allow_get_param(struct domain *d,
 {
     int rc;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_get_param);
+    rc = xsm_hvm_param(TARGET_PRIVS, d, HVMOP_get_param);
     if ( rc )
         return rc;
 
@@ -4550,7 +4550,7 @@ static int do_altp2m_op(
         goto out;
     }
 
-    if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
+    if ( (rc = xsm_hvm_altp2mhvm_op(TARGET_PRIVS | DEV_EMU_PRIVS, d, mode, a.cmd)) )
         goto out;
 
     switch ( a.cmd )
@@ -4931,7 +4931,7 @@ static int hvmop_get_mem_type(
     if ( d == NULL )
         return -ESRCH;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_get_mem_type);
+    rc = xsm_hvm_param(TARGET_PRIVS, d, HVMOP_get_mem_type);
     if ( rc )
         goto out;
 
@@ -5024,7 +5024,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( unlikely(d != current->domain) )
             rc = -EOPNOTSUPP;
         else if ( is_hvm_domain(d) && paging_mode_shadow(d) )
-            rc = xsm_hvm_param(XSM_TARGET, d, op);
+            rc = xsm_hvm_param(TARGET_PRIVS, d, op);
         if ( !rc )
             pagetable_dying(a.gpa);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a1693f92dd..cff7cb11cd 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2122,7 +2122,7 @@ int map_domain_pirq(
         return 0;
     }
 
-    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, data);
+    ret = xsm_map_domain_irq(XSM_NONE, d, irq, data);
     if ( ret )
     {
         dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
@@ -2342,7 +2342,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
         nr = msi_desc->msi.nvec;
     }
 
-    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
+    ret = xsm_unmap_domain_irq(XSM_NONE, d, irq,
                                msi_desc ? msi_desc->dev : NULL);
     if ( ret )
         goto done;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b7a10bbdd4..8ecb982a84 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -977,7 +977,7 @@ get_page_from_l1e(
          * minor hack can go away.
          */
         if ( (real_pg_owner == NULL) || (pg_owner == l1e_owner) ||
-             xsm_priv_mapping(XSM_TARGET, pg_owner, real_pg_owner) )
+             xsm_priv_mapping(TARGET_PRIVS, pg_owner, real_pg_owner) )
         {
             gdprintk(XENLOG_WARNING,
                      "pg_owner d%d l1e_owner d%d, but real_pg_owner d%d\n",
@@ -3407,7 +3407,7 @@ long do_mmuext_op(
         return -EINVAL;
     }
 
-    rc = xsm_mmuext_op(XSM_TARGET, currd, pg_owner);
+    rc = xsm_mmuext_op(TARGET_PRIVS, currd, pg_owner);
     if ( rc )
     {
         put_pg_owner(pg_owner);
@@ -3497,7 +3497,7 @@ long do_mmuext_op(
                 break;
             }
 
-            rc = xsm_memory_pin_page(XSM_HOOK, currd, pg_owner, page);
+            rc = xsm_memory_pin_page(XSM_NONE, currd, pg_owner, page);
             if ( !rc && unlikely(test_and_set_bit(_PGT_pinned,
                                                   &page->u.inuse.type_info)) )
             {
@@ -4005,7 +4005,7 @@ long do_mmu_update(
             }
             if ( xsm_needed != xsm_checked )
             {
-                rc = xsm_mmu_update(XSM_TARGET, d, pt_owner, pg_owner, xsm_needed);
+                rc = xsm_mmu_update(TARGET_PRIVS, d, pt_owner, pg_owner, xsm_needed);
                 if ( rc )
                     break;
                 xsm_checked = xsm_needed;
@@ -4148,7 +4148,7 @@ long do_mmu_update(
             xsm_needed |= XSM_MMU_MACHPHYS_UPDATE;
             if ( xsm_needed != xsm_checked )
             {
-                rc = xsm_mmu_update(XSM_TARGET, d, NULL, pg_owner, xsm_needed);
+                rc = xsm_mmu_update(TARGET_PRIVS, d, NULL, pg_owner, xsm_needed);
                 if ( rc )
                     break;
                 xsm_checked = xsm_needed;
@@ -4393,7 +4393,7 @@ static int __do_update_va_mapping(
 
     perfc_incr(calls_to_update_va);
 
-    rc = xsm_update_va_mapping(XSM_TARGET, d, pg_owner, val);
+    rc = xsm_update_va_mapping(TARGET_PRIVS, d, pg_owner, val);
     if ( rc )
         return rc;
 
@@ -4632,7 +4632,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_domain_memory_map(XSM_TARGET, d);
+        rc = xsm_domain_memory_map(TARGET_PRIVS, d);
         if ( rc )
         {
             rcu_unlock_domain(d);
@@ -4699,7 +4699,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         unsigned int i;
         bool store;
 
-        rc = xsm_machine_memory_map(XSM_PRIV);
+        rc = xsm_machine_memory_map(XSM_PLAT_CTRL);
         if ( rc )
             return rc;
 
@@ -4789,9 +4789,9 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ESRCH;
 
         if ( cmd == XENMEM_set_pod_target )
-            rc = xsm_set_pod_target(XSM_PRIV, d);
+            rc = xsm_set_pod_target(XSM_DOM_SUPER, d);
         else
-            rc = xsm_get_pod_target(XSM_PRIV, d);
+            rc = xsm_get_pod_target(XSM_DOM_SUPER, d);
 
         if ( rc != 0 )
             goto pod_target_out_unlock;
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786e..6f8420f988 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -452,7 +452,7 @@ int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg)
     if ( rc )
         return rc;
 
-    rc = xsm_mem_paging(XSM_DM_PRIV, d);
+    rc = xsm_mem_paging(DEV_EMU_PRIVS, d);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 98b14f7b0a..ba7a479de0 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1883,7 +1883,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     if ( rc )
         return rc;
 
-    rc = xsm_mem_sharing(XSM_DM_PRIV, d);
+    rc = xsm_mem_sharing(DEV_EMU_PRIVS, d);
     if ( rc )
         goto out;
 
@@ -1928,7 +1928,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( rc )
             goto out;
 
-        rc = xsm_mem_sharing_op(XSM_DM_PRIV, d, cd, mso.op);
+        rc = xsm_mem_sharing_op(DEV_EMU_PRIVS, d, cd, mso.op);
         if ( rc )
         {
             rcu_unlock_domain(cd);
@@ -1994,7 +1994,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( rc )
             goto out;
 
-        rc = xsm_mem_sharing_op(XSM_DM_PRIV, d, cd, mso.op);
+        rc = xsm_mem_sharing_op(DEV_EMU_PRIVS, d, cd, mso.op);
         if ( rc )
         {
             rcu_unlock_domain(cd);
@@ -2056,7 +2056,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
          * We reuse XENMEM_sharing_op_share XSM check here as this is
          * essentially the same concept repeated over multiple pages.
          */
-        rc = xsm_mem_sharing_op(XSM_DM_PRIV, d, cd,
+        rc = xsm_mem_sharing_op(DEV_EMU_PRIVS, d, cd,
                                 XENMEM_sharing_op_share);
         if ( rc )
         {
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 3840f167b0..5dc0aafd51 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2611,7 +2611,7 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
             goto out;
     }
 
-    rc = xsm_map_gmfn_foreign(XSM_TARGET, tdom, fdom);
+    rc = xsm_map_gmfn_foreign(TARGET_PRIVS, tdom, fdom);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 8bc14df943..6db47c7101 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -712,7 +712,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return -EBUSY;
     }
 
-    rc = xsm_shadow_control(XSM_HOOK, d, sc->op);
+    rc = xsm_shadow_control(XSM_NONE, d, sc->op);
     if ( rc )
         return rc;
 
@@ -769,7 +769,7 @@ long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_domctl(XSM_OTHER, d, op.cmd);
+    ret = xsm_domctl(DEV_EMU_PRIVS | XENSTORE_PRIVS | XSM_DOM_SUPER, d, op.cmd);
     if ( !ret )
     {
         if ( domctl_lock_acquire() )
diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
index fff4d1633c..066865e1a6 100644
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -106,7 +106,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl1e, struct domain *d, p2m_type_t type)
          (owner = page_get_owner(mfn_to_page(mfn))) &&
          (d != owner) )
     {
-        res = xsm_priv_mapping(XSM_TARGET, d, owner);
+        res = xsm_priv_mapping(TARGET_PRIVS, d, owner);
         if ( !res )
         {
             res = get_page_from_l1e(sl1e, d, owner);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5febc0ea4b..6d4a873130 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1310,7 +1310,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     if ( !use_msi )
         return -EOPNOTSUPP;
 
-    ret = xsm_resource_setup_pci(XSM_PRIV,
+    ret = xsm_resource_setup_pci(XSM_HW_CTRL,
                                 (pdev->seg << 16) | (pdev->bus << 8) |
                                 pdev->devfn);
     if ( ret )
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index a9decd4f33..7ca9fc68f2 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -74,7 +74,7 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                              uint32_t *data)
 {
     struct pci_dev *pdev;
-    int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, bdf,
+    int rc = xsm_pci_config_permission(XSM_NONE, current->domain, bdf,
                                        reg, reg + size - 1, 1);
 
     if ( rc < 0 )
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 23465bcd00..73e5757faf 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -110,7 +110,7 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
+    ret = xsm_map_domain_pirq(DEV_EMU_PRIVS, d);
     if ( ret )
         goto free_domain;
 
@@ -148,7 +148,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
         return -ESRCH;
 
     if ( domid != DOMID_SELF || !is_hvm_domain(d) || !has_pirq(d) )
-        ret = xsm_unmap_domain_pirq(XSM_DM_PRIV, d);
+        ret = xsm_unmap_domain_pirq(DEV_EMU_PRIVS, d);
     if ( ret )
         goto free_domain;
 
@@ -355,7 +355,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         ret = -EFAULT;
         if ( copy_from_guest(&apic, arg, 1) != 0 )
             break;
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(XSM_HW_CTRL, currd, cmd);
         if ( ret )
             break;
         ret = ioapic_guest_read(apic.apic_physbase, apic.reg, &apic.value);
@@ -369,7 +369,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         ret = -EFAULT;
         if ( copy_from_guest(&apic, arg, 1) != 0 )
             break;
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(XSM_HW_CTRL, currd, cmd);
         if ( ret )
             break;
         ret = ioapic_guest_write(apic.apic_physbase, apic.reg, apic.value);
@@ -385,7 +385,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         /* Use the APIC check since this dummy hypercall should still only
          * be called by the domain with access to program the ioapic */
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(XSM_HW_CTRL, currd, cmd);
         if ( ret )
             break;
 
@@ -535,7 +535,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&dev, arg, 1) )
             ret = -EFAULT;
         else
-            ret = xsm_resource_setup_pci(XSM_PRIV,
+            ret = xsm_resource_setup_pci(XSM_HW_CTRL,
                                          (dev.seg << 16) | (dev.bus << 8) |
                                          dev.devfn) ?:
                   pci_prepare_msix(dev.seg, dev.bus, dev.devfn,
@@ -546,7 +546,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved: {
         struct physdev_pci_mmcfg_reserved info;
 
-        ret = xsm_resource_setup_misc(XSM_PRIV);
+        ret = xsm_resource_setup_misc(XSM_HW_CTRL);
         if ( ret )
             break;
 
@@ -611,7 +611,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( setup_gsi.gsi < 0 || setup_gsi.gsi >= nr_irqs_gsi )
             break;
 
-        ret = xsm_resource_setup_gsi(XSM_PRIV, setup_gsi.gsi);
+        ret = xsm_resource_setup_gsi(XSM_HW_CTRL, setup_gsi.gsi);
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 23fadbc782..a3e4db9f02 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -196,7 +196,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     if ( op->interface_version != XENPF_INTERFACE_VERSION )
         return -EACCES;
 
-    ret = xsm_platform_op(XSM_PRIV, op->cmd);
+    ret = xsm_platform_op(XSM_PLAT_CTRL, op->cmd);
     if ( ret )
         return ret;
 
@@ -614,7 +614,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     {
         int cpu = op->u.cpu_ol.cpuid;
 
-        ret = xsm_resource_plug_core(XSM_HOOK);
+        ret = xsm_resource_plug_core(XSM_NONE);
         if ( ret )
             break;
 
@@ -640,7 +640,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     {
         int cpu = op->u.cpu_ol.cpuid;
 
-        ret = xsm_resource_unplug_core(XSM_HOOK);
+        ret = xsm_resource_unplug_core(XSM_NONE);
         if ( ret )
             break;
 
@@ -669,7 +669,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     break;
 
     case XENPF_cpu_hotadd:
-        ret = xsm_resource_plug_core(XSM_HOOK);
+        ret = xsm_resource_plug_core(XSM_NONE);
         if ( ret )
             break;
 
@@ -679,7 +679,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     break;
 
     case XENPF_mem_hotadd:
-        ret = xsm_resource_plug_core(XSM_HOOK);
+        ret = xsm_resource_plug_core(XSM_NONE);
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 8889509d2a..b3f7896271 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -250,7 +250,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     }
 
     return !write ?
-           xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
+           xsm_pci_config_permission(XSM_NONE, currd, machine_bdf,
                                      start, start + size - 1, 0) == 0 :
            pci_conf_write_intercept(0, machine_bdf, start, size, write) >= 0;
 }
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a13f3..a843d5aac5 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -190,8 +190,8 @@ long arch_do_sysctl(
         }
 
         if ( !ret )
-            ret = plug ? xsm_resource_plug_core(XSM_HOOK)
-                       : xsm_resource_unplug_core(XSM_HOOK);
+            ret = plug ? xsm_resource_plug_core(XSM_NONE)
+                       : xsm_resource_unplug_core(XSM_NONE);
 
         if ( !ret )
             ret = continue_hypercall_on_cpu(0, fn, hcpu);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 1f2c569e5d..b3a3864421 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -311,7 +311,7 @@ static int late_hwdom_init(struct domain *d)
     if ( d != hardware_domain || d->domain_id == 0 )
         return 0;
 
-    rv = xsm_init_hardware_domain(XSM_HOOK, d);
+    rv = xsm_init_hardware_domain(XSM_NONE, d);
     if ( rv )
         return rv;
 
@@ -655,7 +655,7 @@ struct domain *domain_create(domid_t domid,
         if ( !d->iomem_caps || !d->irq_caps )
             goto fail;
 
-        if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
+        if ( (err = xsm_domain_create(XSM_NONE, d, config->ssidref)) != 0 )
             goto fail;
 
         d->controller_pause_count = 1;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index af044e2eda..be7533caf9 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -314,7 +314,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             return -ESRCH;
     }
 
-    ret = xsm_domctl(XSM_OTHER, d, op->cmd);
+    ret = xsm_domctl(DEV_EMU_PRIVS | XENSTORE_PRIVS | XSM_DOM_SUPER, d, op->cmd);
     if ( ret )
         goto domctl_out_unlock_domonly;
 
@@ -553,7 +553,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( d == NULL )
             goto getdomaininfo_out;
 
-        ret = xsm_getdomaininfo(XSM_HOOK, d);
+        ret = xsm_getdomaininfo(XSM_NONE, d);
         if ( ret )
             goto getdomaininfo_out;
 
@@ -688,7 +688,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             break;
         }
         irq = pirq_access_permitted(current->domain, pirq);
-        if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
+        if ( !irq || xsm_irq_permission(XSM_NONE, d, irq, allow) )
             ret = -EPERM;
         else if ( allow )
             ret = irq_permit_access(d, irq);
@@ -709,7 +709,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
         if ( !iomem_access_permitted(current->domain,
                                      mfn, mfn + nr_mfns - 1) ||
-             xsm_iomem_permission(XSM_HOOK, d, mfn, mfn + nr_mfns - 1, allow) )
+             xsm_iomem_permission(XSM_NONE, d, mfn, mfn + nr_mfns - 1, allow) )
             ret = -EPERM;
         else if ( allow )
             ret = iomem_permit_access(d, mfn, mfn + nr_mfns - 1);
@@ -746,7 +746,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
              !iomem_access_permitted(d, mfn, mfn_end) )
             break;
 
-        ret = xsm_iomem_mapping(XSM_HOOK, d, mfn, mfn_end, add);
+        ret = xsm_iomem_mapping(XSM_NONE, d, mfn, mfn_end, add);
         if ( ret )
             break;
 
@@ -801,7 +801,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
         ret = -EOPNOTSUPP;
         if ( is_hvm_domain(e) )
-            ret = xsm_set_target(XSM_HOOK, d, e);
+            ret = xsm_set_target(XSM_NONE, d, e);
         if ( ret )
         {
             put_domain(e);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 5479315aae..5c987096d9 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -296,7 +296,7 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
         ERROR_EXIT_DOM(port, d);
     chn = evtchn_from_port(d, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
+    rc = xsm_evtchn_unbound(TARGET_PRIVS, d, chn, alloc->remote_dom);
     if ( rc )
         goto out;
 
@@ -372,7 +372,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
          (rchn->u.unbound.remote_domid != ld->domain_id) )
         ERROR_EXIT_DOM(-EINVAL, rd);
 
-    rc = xsm_evtchn_interdomain(XSM_HOOK, ld, lchn, rd, rchn);
+    rc = xsm_evtchn_interdomain(XSM_NONE, ld, lchn, rd, rchn);
     if ( rc )
         goto out;
 
@@ -760,7 +760,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
         goto out;
     }
 
-    ret = xsm_evtchn_send(XSM_HOOK, ld, lchn);
+    ret = xsm_evtchn_send(XSM_NONE, ld, lchn);
     if ( ret )
         goto out;
 
@@ -985,7 +985,7 @@ int evtchn_status(evtchn_status_t *status)
         goto out;
     }
 
-    rc = xsm_evtchn_status(XSM_TARGET, d, chn);
+    rc = xsm_evtchn_status(TARGET_PRIVS, d, chn);
     if ( rc )
         goto out;
 
@@ -1310,7 +1310,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_evtchn_reset(XSM_TARGET, current->domain, d);
+        rc = xsm_evtchn_reset(TARGET_PRIVS, current->domain, d);
         if ( !rc )
             rc = evtchn_reset(d, cmd == EVTCHNOP_reset_cont);
 
@@ -1371,7 +1371,7 @@ int alloc_unbound_xen_event_channel(
         goto out;
     chn = evtchn_from_port(ld, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, ld, chn, remote_domid);
+    rc = xsm_evtchn_unbound(TARGET_PRIVS, ld, chn, remote_domid);
     if ( rc )
         goto out;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab30e2e8cf..27e4eb1d65 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1063,7 +1063,7 @@ map_grant_ref(
         return;
     }
 
-    rc = xsm_grant_mapref(XSM_HOOK, ld, rd, op->flags);
+    rc = xsm_grant_mapref(XSM_NONE, ld, rd, op->flags);
     if ( rc )
     {
         rcu_unlock_domain(rd);
@@ -1403,7 +1403,7 @@ unmap_common(
         return;
     }
 
-    rc = xsm_grant_unmapref(XSM_HOOK, ld, rd);
+    rc = xsm_grant_unmapref(XSM_NONE, ld, rd);
     if ( rc )
     {
         rcu_unlock_domain(rd);
@@ -2021,7 +2021,7 @@ gnttab_setup_table(
         goto out;
     }
 
-    if ( xsm_grant_setup(XSM_TARGET, curr->domain, d) )
+    if ( xsm_grant_setup(TARGET_PRIVS, curr->domain, d) )
     {
         op.status = GNTST_permission_denied;
         goto out;
@@ -2103,7 +2103,7 @@ gnttab_query_size(
         goto out;
     }
 
-    if ( xsm_grant_query_size(XSM_TARGET, current->domain, d) )
+    if ( xsm_grant_query_size(TARGET_PRIVS, current->domain, d) )
     {
         op.status = GNTST_permission_denied;
         goto out;
@@ -2274,7 +2274,7 @@ gnttab_transfer(
             goto put_gfn_and_copyback;
         }
 
-        if ( xsm_grant_transfer(XSM_HOOK, d, e) )
+        if ( xsm_grant_transfer(XSM_NONE, d, e) )
         {
             gop.status = GNTST_permission_denied;
         unlock_and_copyback:
@@ -2812,7 +2812,7 @@ static int gnttab_copy_lock_domains(const struct gnttab_copy *op,
     if ( rc < 0 )
         goto error;
 
-    rc = xsm_grant_copy(XSM_HOOK, src->domain, dest->domain);
+    rc = xsm_grant_copy(XSM_NONE, src->domain, dest->domain);
     if ( rc < 0 )
     {
         rc = GNTST_permission_denied;
@@ -3231,7 +3231,7 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
         op.status = GNTST_bad_domain;
         goto out1;
     }
-    rc = xsm_grant_setup(XSM_TARGET, current->domain, d);
+    rc = xsm_grant_setup(TARGET_PRIVS, current->domain, d);
     if ( rc )
     {
         op.status = GNTST_permission_denied;
@@ -3295,7 +3295,7 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
     if ( d == NULL )
         return -ESRCH;
 
-    rc = xsm_grant_query_size(XSM_TARGET, current->domain, d);
+    rc = xsm_grant_query_size(TARGET_PRIVS, current->domain, d);
     if ( rc )
     {
         rcu_unlock_domain(d);
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index e71f7df479..207556896d 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -679,7 +679,7 @@ long do_hypfs_op(unsigned int cmd,
     struct hypfs_entry *entry;
     static char path[XEN_HYPFS_MAX_PATHLEN];
 
-    if ( xsm_hypfs_op(XSM_PRIV) )
+    if ( xsm_hypfs_op(XSM_PLAT_CTRL) )
         return -EPERM;
 
     if ( cmd == XEN_HYPFS_OP_get_version )
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d77756a81e..5c065e403f 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -459,7 +459,7 @@ __initcall(param_init);
 
 DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
+    bool_t deny = !!xsm_xen_version(XSM_NONE | XSM_PLAT_CTRL, cmd);
 
     switch ( cmd )
     {
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index ebeee6405a..2d1d1ce205 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1219,7 +1219,7 @@ static int do_kexec_op_internal(unsigned long op,
 {
     int ret = -EINVAL;
 
-    ret = xsm_kexec(XSM_PRIV);
+    ret = xsm_kexec(XSM_PLAT_CTRL);
     if ( ret )
         return ret;
 
diff --git a/xen/common/mem_access.c b/xen/common/mem_access.c
index 010e6f8dbf..6cbe12994d 100644
--- a/xen/common/mem_access.c
+++ b/xen/common/mem_access.c
@@ -47,7 +47,7 @@ int mem_access_memop(unsigned long cmd,
     if ( !p2m_mem_access_sanity_check(d) )
         goto out;
 
-    rc = xsm_mem_access(XSM_DM_PRIV, d);
+    rc = xsm_mem_access(DEV_EMU_PRIVS, d);
     if ( rc )
         goto out;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 76b9f58478..f51a9cea73 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -603,7 +603,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         goto fail_early;
     }
 
-    rc = xsm_memory_exchange(XSM_TARGET, d);
+    rc = xsm_memory_exchange(TARGET_PRIVS, d);
     if ( rc )
     {
         rcu_unlock_domain(d);
@@ -1062,7 +1062,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
          (!is_hardware_domain(d) || (d != current->domain)) )
         return -EACCES;
 
-    return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
+    return xsm_add_to_physmap(TARGET_PRIVS, current->domain, d);
 }
 
 unsigned int ioreq_server_max_frames(const struct domain *d)
@@ -1222,7 +1222,7 @@ static int acquire_resource(
     if ( rc )
         return rc;
 
-    rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
+    rc = xsm_domain_resource_map(DEV_EMU_PRIVS, d);
     if ( rc )
         goto out;
 
@@ -1378,7 +1378,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
              && (reservation.mem_flags & XENMEMF_populate_on_demand) )
             args.memflags |= MEMF_populate_on_demand;
 
-        if ( xsm_memory_adjust_reservation(XSM_TARGET, curr_d, d) )
+        if ( xsm_memory_adjust_reservation(TARGET_PRIVS, curr_d, d) )
         {
             rcu_unlock_domain(d);
             return start_extent;
@@ -1452,7 +1452,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_memory_stat_reservation(XSM_TARGET, curr_d, d);
+        rc = xsm_memory_stat_reservation(TARGET_PRIVS, curr_d, d);
         if ( rc )
         {
             rcu_unlock_domain(d);
@@ -1574,7 +1574,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ESRCH;
 
         rc = paging_mode_translate(d)
-             ? xsm_remove_from_physmap(XSM_TARGET, curr_d, d)
+             ? xsm_remove_from_physmap(TARGET_PRIVS, curr_d, d)
              : -EACCES;
         if ( rc )
         {
@@ -1621,7 +1621,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -EINVAL;
 
-        rc = xsm_claim_pages(XSM_PRIV, d);
+        rc = xsm_claim_pages(XSM_DOM_SUPER, d);
 
         if ( !rc )
             rc = domain_set_outstanding_pages(d, reservation.nr_extents);
@@ -1652,7 +1652,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( (d = rcu_lock_domain_by_any_id(topology.domid)) == NULL )
             return -ESRCH;
 
-        rc = xsm_get_vnumainfo(XSM_TARGET, d);
+        rc = xsm_get_vnumainfo(TARGET_PRIVS, d);
         if ( rc )
         {
             rcu_unlock_domain(d);
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf..5649097ad5 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -36,7 +36,7 @@ int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop)
     if ( unlikely(current->domain == d) ) /* no domain_pause() */
         return -EPERM;
 
-    rc = xsm_vm_event_control(XSM_PRIV, d, mop->op, mop->event);
+    rc = xsm_vm_event_control(XSM_DOM_SUPER, d, mop->op, mop->event);
     if ( unlikely(rc) )
         return rc;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 6d34764d38..ff397d6971 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1944,7 +1944,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             break;
 
-        ret = xsm_schedop_shutdown(XSM_DM_PRIV, current->domain, d);
+        ret = xsm_schedop_shutdown(DEV_EMU_PRIVS, current->domain, d);
         if ( likely(!ret) )
             domain_shutdown(d, sched_remote_shutdown.reason);
 
@@ -2046,7 +2046,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
 {
     long ret;
 
-    ret = xsm_domctl_scheduler_op(XSM_HOOK, d, op->cmd);
+    ret = xsm_domctl_scheduler_op(XSM_NONE, d, op->cmd);
     if ( ret )
         return ret;
 
@@ -2081,7 +2081,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
     struct cpupool *pool;
     int rc;
 
-    rc = xsm_sysctl_scheduler_op(XSM_HOOK, op->cmd);
+    rc = xsm_sysctl_scheduler_op(XSM_NONE, op->cmd);
     if ( rc )
         return rc;
 
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 3558641cd9..172f9b528d 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -41,7 +41,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     if ( op->interface_version != XEN_SYSCTL_INTERFACE_VERSION )
         return -EACCES;
 
-    ret = xsm_sysctl(XSM_PRIV, op->cmd);
+    ret = xsm_sysctl(XSM_PLAT_CTRL, op->cmd);
     if ( ret )
         return ret;
 
@@ -58,7 +58,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     switch ( op->cmd )
     {
     case XEN_SYSCTL_readconsole:
-        ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
+        ret = xsm_readconsole(XSM_NONE, op->u.readconsole.clear);
         if ( ret )
             break;
 
@@ -88,7 +88,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             if ( num_domains == op->u.getdomaininfolist.max_domains )
                 break;
 
-            ret = xsm_getdomaininfo(XSM_HOOK, d);
+            ret = xsm_getdomaininfo(XSM_NONE, d);
             if ( ret )
                 continue;
 
@@ -191,7 +191,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         if ( op->u.page_offline.end < op->u.page_offline.start )
             break;
 
-        ret = xsm_page_offline(XSM_HOOK, op->u.page_offline.cmd);
+        ret = xsm_page_offline(XSM_NONE, op->u.page_offline.cmd);
         if ( ret )
             break;
 
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 44d542f23e..103d0a207f 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -584,7 +584,7 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
         return 0;
     }
 
-    rc = xsm_vm_event_control(XSM_PRIV, d, vec->mode, vec->op);
+    rc = xsm_vm_event_control(XSM_DOM_SUPER, d, vec->mode, vec->op);
     if ( rc )
         return rc;
 
diff --git a/xen/common/xenoprof.c b/xen/common/xenoprof.c
index 1926a92fe4..4268c12e5d 100644
--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -737,7 +737,7 @@ ret_t do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
         return -EPERM;
     }
 
-    ret = xsm_profile(XSM_HOOK, current->domain, op);
+    ret = xsm_profile(XSM_NONE, current->domain, op);
     if ( ret )
         return ret;
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2358375170..93d51d6420 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -680,7 +680,7 @@ long do_console_io(unsigned int cmd, unsigned int count,
     long rc;
     unsigned int idx, len;
 
-    rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
+    rc = xsm_console_io(XSM_NONE|XSM_DOM_SUPER, current->domain, cmd);
     if ( rc )
         return rc;
 
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831d90..a51bdd51d6 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -230,7 +230,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( ret )
             break;
 
-        ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+        ret = xsm_assign_dtdevice(XSM_NONE, d, dt_node_full_name(dev));
         if ( ret )
             break;
 
@@ -284,7 +284,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( ret )
             break;
 
-        ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+        ret = xsm_deassign_dtdevice(XSM_NONE, d, dt_node_full_name(dev));
 
         if ( d == dom_io )
             return -EINVAL;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 705137f8be..f9669c6afa 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -704,7 +704,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         pdev_type = "device";
 
-    ret = xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_plug_pci(XSM_HW_CTRL, (seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
@@ -814,7 +814,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     struct pci_dev *pdev;
     int ret;
 
-    ret = xsm_resource_unplug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_unplug_pci(XSM_HW_CTRL, (seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
@@ -1484,7 +1484,7 @@ static int iommu_get_device_group(
              ((pdev->bus == bus) && (pdev->devfn == devfn)) )
             continue;
 
-        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (pdev->bus << 8) | pdev->devfn) )
+        if ( xsm_get_device_group(XSM_NONE, (seg << 16) | (pdev->bus << 8) | pdev->devfn) )
             continue;
 
         sdev_id = ops->get_device_group_id(seg, pdev->bus, pdev->devfn);
@@ -1552,7 +1552,7 @@ int iommu_do_pci_domctl(
         u32 max_sdevs;
         XEN_GUEST_HANDLE_64(uint32) sdevs;
 
-        ret = xsm_get_device_group(XSM_HOOK, domctl->u.get_device_group.machine_sbdf);
+        ret = xsm_get_device_group(XSM_NONE, domctl->u.get_device_group.machine_sbdf);
         if ( ret )
             break;
 
@@ -1603,7 +1603,7 @@ int iommu_do_pci_domctl(
 
         machine_sbdf = domctl->u.assign_device.u.pci.machine_sbdf;
 
-        ret = xsm_assign_device(XSM_HOOK, d, machine_sbdf);
+        ret = xsm_assign_device(XSM_NONE, d, machine_sbdf);
         if ( ret )
             break;
 
@@ -1648,7 +1648,7 @@ int iommu_do_pci_domctl(
 
         machine_sbdf = domctl->u.assign_device.u.pci.machine_sbdf;
 
-        ret = xsm_deassign_device(XSM_HOOK, d, machine_sbdf);
+        ret = xsm_deassign_device(XSM_NONE, d, machine_sbdf);
         if ( ret )
             break;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9a88e5b00f..39681a5dff 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -475,6 +475,12 @@ struct domain
 #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
 #define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
 		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
+/* Any access for which XSM_DEV_EMUL is the restriction, XSM_DOM_SUPER is an override */
+#define DEV_EMU_PRIVS (XSM_DOM_SUPER | XSM_DEV_EMUL)
+/* Anytime there is an XSM_TARGET check, XSM_SELF also applies, and XSM_DOM_SUPER is an override */
+#define TARGET_PRIVS (XSM_TARGET | XSM_SELF | XSM_DOM_SUPER)
+/* Anytime there is an XSM_XENSTORE check, XSM_DOM_SUPER is an override */
+#define XENSTORE_PRIVS (XSM_XENSTORE | XSM_DOM_SUPER)
     uint32_t         xsm_roles;
 
     /* Which guest this guest has privileges on */
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a6dab0c809..35c9a4f2d4 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -65,37 +65,48 @@ void __xsm_action_mismatch_detected(void);
 #define XSM_INLINE always_inline
 #define XSM_DEFAULT_ARG xsm_default_t action,
 #define XSM_DEFAULT_VOID xsm_default_t action
-#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
+#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON((def) != action)
 
 #endif /* CONFIG_XSM */
 
 static always_inline int xsm_default_action(
     xsm_default_t action, struct domain *src, struct domain *target)
 {
-    switch ( action ) {
-    case XSM_HOOK:
+    /* TODO: these three if's could be squashed into one, decreasing
+     *       the readability/logical reason-ability but may decrease the
+     *       number of spectre gadgets
+     */
+    if ( action & XSM_NONE )
         return 0;
-    case XSM_TARGET:
-        if ( evaluate_nospec(src == target) )
-        {
-            return 0;
-    case XSM_XS_PRIV:
-            if ( evaluate_nospec(is_xenstore_domain(src)) )
-                return 0;
-        }
-        /* fall through */
-    case XSM_DM_PRIV:
-        if ( target && evaluate_nospec(src->target == target) )
-            return 0;
-        /* fall through */
-    case XSM_PRIV:
-        if ( is_control_domain(src) )
-            return 0;
-        return -EPERM;
-    default:
-        LINKER_BUG_ON(1);
-        return -EPERM;
-    }
+
+    if ( (action & XSM_SELF) && ((!target) || (src == target)) )
+        return 0;
+
+    if ( (action & XSM_TARGET) && ((target) && (src->target == target)) )
+        return 0;
+
+    /* XSM_DEV_EMUL is the only domain role with a condition, i.e. the
+     * role only applies to a domain's target.
+     */
+    if ( (action & XSM_DEV_EMUL) && (src->xsm_roles & XSM_DEV_EMUL)
+        && (target) && (src->target == target) )
+        return 0;
+
+    /* Mask out SELF, TARGET, and DEV_EMUL as they have been handled */
+    action &= ~(XSM_SELF & XSM_TARGET & XSM_DEV_EMUL);
+
+    /* Checks if the domain has one of the remaining roles set on it:
+     *      XSM_PLAT_CTRL
+     *      XSM_DOM_BUILD
+     *      XSM_DOM_SUPER
+     *      XSM_HW_CTRL
+     *      XSM_HW_SUPER
+     *      XSM_XENSTORE
+     */
+    if (src->xsm_roles & action)
+        return 0;
+
+    return -EPERM;
 }
 
 static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
@@ -106,60 +117,60 @@ static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
 
 static XSM_INLINE int xsm_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_domctl_scheduler_op(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_set_target(XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS | XENSTORE_PRIVS | XSM_DOM_SUPER);
     switch ( cmd )
     {
     case XEN_DOMCTL_ioport_mapping:
     case XEN_DOMCTL_memory_mapping:
     case XEN_DOMCTL_bind_pt_irq:
     case XEN_DOMCTL_unbind_pt_irq:
-        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+        return xsm_default_action(DEV_EMU_PRIVS, current->domain, d);
     case XEN_DOMCTL_getdomaininfo:
-        return xsm_default_action(XSM_XS_PRIV, current->domain, d);
+        return xsm_default_action(XENSTORE_PRIVS, current->domain, d);
     default:
-        return xsm_default_action(XSM_PRIV, current->domain, d);
+        return xsm_default_action(XSM_DOM_SUPER, current->domain, d);
     }
 }
 
 static XSM_INLINE int xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_PLAT_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
@@ -176,113 +187,113 @@ static XSM_INLINE void xsm_free_security_domain(struct domain *d)
 static XSM_INLINE int xsm_grant_mapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
                                                                 uint32_t flags)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_grant_unmapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_grant_setup(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_grant_transfer(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_grant_copy(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_grant_query_size(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_memory_adjust_reservation(XSM_DEFAULT_ARG struct domain *d1,
                                                             struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_memory_stat_reservation(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
+    XSM_ASSERT_ACTION(XSM_NONE|XSM_DOM_SUPER);
     if ( d->is_console )
-        return xsm_default_action(XSM_HOOK, d, NULL);
+        return xsm_default_action(XSM_NONE, d, NULL);
 #ifdef CONFIG_VERBOSE_DEBUG
     if ( cmd == CONSOLEIO_write )
-        return xsm_default_action(XSM_HOOK, d, NULL);
+        return xsm_default_action(XSM_NONE, d, NULL);
 #endif
-    return xsm_default_action(XSM_PRIV, d, NULL);
+    return xsm_default_action(XSM_DOM_SUPER, d, NULL);
 }
 
 static XSM_INLINE int xsm_profile(XSM_DEFAULT_ARG struct domain *d, int op)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d, NULL);
 }
 
 static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_PLAT_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_schedop_shutdown(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_memory_pin_page(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
                                           struct page_info *page)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_DOM_SUPER);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
                                          domid_t id2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_evtchn_interdomain(XSM_DEFAULT_ARG struct domain *d1, struct evtchn
                                 *chan1, struct domain *d2, struct evtchn *chan2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d1, d2);
 }
 
@@ -293,19 +304,19 @@ static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
 
 static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, d, NULL);
 }
 
 static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
@@ -328,44 +339,44 @@ static XSM_INLINE char *xsm_show_security_evtchn(struct domain *d, const struct
 
 static XSM_INLINE int xsm_init_hardware_domain(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_get_pod_target(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_DOM_SUPER);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_set_pod_target(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_DOM_SUPER);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static XSM_INLINE int xsm_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_assign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
@@ -375,14 +386,14 @@ static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint
 static XSM_INLINE int xsm_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
                                           const char *dtpath)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
                                             const char *dtpath)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
@@ -390,55 +401,55 @@ static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
 
 static XSM_INLINE int xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_resource_unplug_core(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_resource_plug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_resource_unplug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_resource_setup_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_resource_setup_misc(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_PLAT_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
@@ -461,57 +472,57 @@ static XSM_INLINE char *xsm_show_irq_sid(int irq)
 
 static XSM_INLINE int xsm_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_map_domain_irq(XSM_DEFAULT_ARG struct domain *d,
                                          int irq, const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_bind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_unbind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_unmap_domain_irq(XSM_DEFAULT_ARG struct domain *d,
                                            int irq, const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_irq_permission(XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_iomem_permission(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_iomem_mapping(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
@@ -519,60 +530,61 @@ static XSM_INLINE int xsm_pci_config_permission(XSM_DEFAULT_ARG struct domain *d
                                         uint16_t start, uint16_t end,
                                         uint8_t access)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_add_to_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_remove_from_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_map_gmfn_foreign(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d, t);
 }
 
 static XSM_INLINE int xsm_hvm_param(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
+/* This check is no longer being called */
 static XSM_INLINE int xsm_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_DOM_SUPER);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
+    XSM_ASSERT_ACTION(TARGET_PRIVS | DEV_EMU_PRIVS);
 
     switch ( mode )
     {
     case XEN_ALTP2M_mixed:
-        return xsm_default_action(XSM_TARGET, current->domain, d);
+        return xsm_default_action(TARGET_PRIVS, current->domain, d);
     case XEN_ALTP2M_external:
-        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+        return xsm_default_action(DEV_EMU_PRIVS, current->domain, d);
     case XEN_ALTP2M_limited:
         if ( HVMOP_altp2m_vcpu_enable_notify == op )
-            return xsm_default_action(XSM_TARGET, current->domain, d);
-        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+            return xsm_default_action(TARGET_PRIVS, current->domain, d);
+        return xsm_default_action(DEV_EMU_PRIVS, current->domain, d);
     default:
         return -EPERM;
     }
@@ -580,14 +592,14 @@ static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uin
 
 static XSM_INLINE int xsm_vm_event_control(XSM_DEFAULT_ARG struct domain *d, int mode, int op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_DOM_SUPER);
     return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
@@ -595,7 +607,7 @@ static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 #ifdef CONFIG_HAS_MEM_PAGING
 static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
@@ -603,51 +615,51 @@ static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 #ifdef CONFIG_MEM_SHARING
 static XSM_INLINE int xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
 
 static XSM_INLINE int xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_PLAT_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
 static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_PLAT_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_shadow_control(XSM_DEFAULT_ARG struct domain *d, uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_mem_sharing_op(XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, cd);
 }
 
 static XSM_INLINE int xsm_apic(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_CTRL);
     return xsm_default_action(action, d, NULL);
 }
 
 static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_PLAT_CTRL);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
@@ -655,7 +667,7 @@ static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct do
                                      struct domain *f, uint32_t flags)
 {
     int rc = 0;
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     if ( f != dom_io )
         rc = xsm_default_action(action, d, f);
     if ( evaluate_nospec(t) && !rc )
@@ -665,47 +677,47 @@ static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct do
 
 static XSM_INLINE int xsm_mmuext_op(XSM_DEFAULT_ARG struct domain *d, struct domain *f)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d, f);
 }
 
 static XSM_INLINE int xsm_update_va_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *f, 
                                                             l1_pgentry_t pte)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d, f);
 }
 
 static XSM_INLINE int xsm_priv_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(TARGET_PRIVS);
     return xsm_default_action(action, d, t);
 }
 
 static XSM_INLINE int xsm_ioport_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_ioport_mapping(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
+    XSM_ASSERT_ACTION(XSM_NONE);
     return xsm_default_action(action, current->domain, d);
 }
 
 static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
+    XSM_ASSERT_ACTION(XSM_NONE | XSM_DOM_SUPER);
     switch ( op )
     {
     case XENPMU_init:
     case XENPMU_finish:
     case XENPMU_lvtpc_set:
     case XENPMU_flush:
-        return xsm_default_action(XSM_HOOK, d, current->domain);
+        return xsm_default_action(XSM_NONE, d, current->domain);
     default:
-        return xsm_default_action(XSM_PRIV, d, current->domain);
+        return xsm_default_action(XSM_DOM_SUPER, d, current->domain);
     }
 }
 
@@ -713,7 +725,7 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
 
 static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
 
@@ -745,7 +757,7 @@ static XSM_INLINE int xsm_argo_send(const struct domain *d,
 #include <public/version.h>
 static XSM_INLINE int xsm_xen_version (XSM_DEFAULT_ARG uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
+    XSM_ASSERT_ACTION(XSM_NONE | XSM_PLAT_CTRL);
     switch ( op )
     {
     case XENVER_version:
@@ -761,14 +773,14 @@ static XSM_INLINE int xsm_xen_version (XSM_DEFAULT_ARG uint32_t op)
     case XENVER_pagesize:
     case XENVER_guest_handle:
         /* These MUST always be accessible to any guest by default. */
-        return xsm_default_action(XSM_HOOK, current->domain, NULL);
+        return xsm_default_action(XSM_NONE, current->domain, NULL);
     default:
-        return xsm_default_action(XSM_PRIV, current->domain, NULL);
+        return xsm_default_action(XSM_PLAT_CTRL, current->domain, NULL);
     }
 }
 
 static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    XSM_ASSERT_ACTION(DEV_EMU_PRIVS);
     return xsm_default_action(action, current->domain, d);
 }
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 7bdd254420..b50d8a711f 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -30,18 +30,7 @@ typedef u32 xsm_magic_t;
 #define XSM_MAGIC 0x0
 #endif
 
-/* These annotations are used by callers and in dummy.h to document the
- * default actions of XSM hooks. They should be compiled out otherwise.
- */
-enum xsm_default {
-    XSM_HOOK,     /* Guests can normally access the hypercall */
-    XSM_DM_PRIV,  /* Device model can perform on its target domain */
-    XSM_TARGET,   /* Can perform on self or your target domain */
-    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
-    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
-    XSM_OTHER     /* Something more complex */
-};
-typedef enum xsm_default xsm_default_t;
+typedef uint32_t xsm_default_t;
 
 struct xsm_operations {
     void (*security_domaininfo) (struct domain *d,
-- 
2.20.1


