Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E84B3ABF99
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144250.265567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1Xz-0007Td-SZ; Thu, 17 Jun 2021 23:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144250.265567; Thu, 17 Jun 2021 23:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1Xz-0007Rn-Op; Thu, 17 Jun 2021 23:35:43 +0000
Received: by outflank-mailman (input) for mailman id 144250;
 Thu, 17 Jun 2021 23:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1Xy-0007Re-2F
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:35:42 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96190fc1-2305-488a-a97f-897775c10852;
 Thu, 17 Jun 2021 23:35:38 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623972581937325.8350726165488;
 Thu, 17 Jun 2021 16:29:41 -0700 (PDT)
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
X-Inumbo-ID: 96190fc1-2305-488a-a97f-897775c10852
ARC-Seal: i=1; a=rsa-sha256; t=1623972583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gwGd/SJGF+vjh/MKS4pCKD08SH1QXWzt3Ra7lskWXhk41FhKSGGlO2WwlO6nW7XixMbDIRDxOhE9zsIRL3rj3HHEr+nPOzoN8hiBRPcyoCZtTu/T6V/MtrDWvy65YONJ4EWK7Jd0fmNZRZU6yTHNvJYCvWZ5MZlzR9wp9nqZyNQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623972583; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=NN+fLziBRzBtkvPvDF6TDsmdflwA5o0WlqND7Rn5lLE=; 
	b=YbyWxcfgydQ/fARBxlYK+NN2A7RKd6HNhHmNM3JSfMtfQhgFcBsjdTpyLnJFaM4dSpktg5VmWgsMC3reUUXUIiEllH8nSHrPX0G/LRlX9bcc6gmzILZmKNrYbex0pcWBX/Q6bYUQGeR9aoy8ff4t3nHOXGtnTSKPvliW4SrQ4j4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623972583;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NN+fLziBRzBtkvPvDF6TDsmdflwA5o0WlqND7Rn5lLE=;
	b=qilEQ+rOIUXXV1erY0KUuwX1qYsRoKC3PgH69GxjXli7bk0cg3uTWqC4xhqxe1XU
	ScRBzVQBpiFYfFPu0mgKQjTwA4pnE013ejJlNX166DVuHhxqv704R1vmNVlED2Bugbn
	RJLfzLx6IhHw0cgSxaArGLhm8OpTjerxu7FDvVF4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	persaur@gmail.com,
	christopher.w.clark@gmail.com,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [PATCH 4/6] xsm: remove xen_defualt_t from hook definitions
Date: Thu, 17 Jun 2021 19:39:16 -0400
Message-Id: <20210617233918.10095-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617233918.10095-1-dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With the conversion of making XSM always enabled even the dummy XSM module is
being invoked through the xsm_ops dispatch which does not use passing of the
default privilege. This commit removes the xen_default_t parameter from the hook
definitions and all the respective call sites.

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
 xen/arch/x86/irq.c                    |   5 +-
 xen/arch/x86/mm.c                     |  20 +--
 xen/arch/x86/mm/mem_paging.c          |   2 +-
 xen/arch/x86/mm/mem_sharing.c         |   9 +-
 xen/arch/x86/mm/p2m.c                 |   2 +-
 xen/arch/x86/mm/paging.c              |   4 +-
 xen/arch/x86/mm/shadow/set.c          |   2 +-
 xen/arch/x86/msi.c                    |   3 +-
 xen/arch/x86/pci.c                    |   2 +-
 xen/arch/x86/physdev.c                |  17 ++-
 xen/arch/x86/platform_hypercall.c     |  10 +-
 xen/arch/x86/pv/emul-priv-op.c        |   2 +-
 xen/arch/x86/sysctl.c                 |   4 +-
 xen/common/domain.c                   |   4 +-
 xen/common/domctl.c                   |  12 +-
 xen/common/event_channel.c            |  12 +-
 xen/common/grant_table.c              |  16 +--
 xen/common/hypfs.c                    |   2 +-
 xen/common/kernel.c                   |   2 +-
 xen/common/kexec.c                    |   2 +-
 xen/common/mem_access.c               |   2 +-
 xen/common/memory.c                   |  16 +--
 xen/common/monitor.c                  |   2 +-
 xen/common/sched/core.c               |   6 +-
 xen/common/sysctl.c                   |   8 +-
 xen/common/vm_event.c                 |   2 +-
 xen/common/xenoprof.c                 |   2 +-
 xen/drivers/char/console.c            |   2 +-
 xen/drivers/passthrough/device_tree.c |   4 +-
 xen/drivers/passthrough/pci.c         |  12 +-
 xen/include/xsm/xsm.h                 | 172 +++++++++++++-------------
 41 files changed, 197 insertions(+), 203 deletions(-)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 1b3fd6bc7d..c8b89c8f47 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -45,7 +45,7 @@ int dm_op(const struct dmop_args *op_args)
     if ( rc )
         return rc;
 
-    rc = xsm_dm_op(XSM_DM_PRIV, d);
+    rc = xsm_dm_op(d);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index b7d27f37df..e7202703ee 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -95,11 +95,11 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
          * done by the 2 hypercalls for consistency with other
          * architectures.
          */
-        rc = xsm_map_domain_irq(XSM_HOOK, d, irq, NULL);
+        rc = xsm_map_domain_irq(d, irq, NULL);
         if ( rc )
             return rc;
 
-        rc = xsm_bind_pt_irq(XSM_HOOK, d, bind);
+        rc = xsm_bind_pt_irq(d, bind);
         if ( rc )
             return rc;
 
@@ -130,7 +130,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( irq != virq )
             return -EINVAL;
 
-        rc = xsm_unbind_pt_irq(XSM_HOOK, d, bind);
+        rc = xsm_unbind_pt_irq(d, bind);
         if ( rc )
             return rc;
 
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 8951b34086..cf4bd9ae09 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -101,7 +101,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_hvm_param(XSM_TARGET, d, op);
+        rc = xsm_hvm_param(d, op);
         if ( rc )
             goto param_fail;
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0e07335291..a256c89b62 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1446,7 +1446,7 @@ int xenmem_add_to_physmap_one(
             return -EINVAL;
         }
 
-        rc = xsm_map_gmfn_foreign(XSM_TARGET, d, od);
+        rc = xsm_map_gmfn_foreign(d, od);
         if ( rc )
         {
             put_pg_owner(od);
diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 8efac7ee60..52985f8a51 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -33,7 +33,7 @@ long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_platform_op(XSM_PRIV, op->cmd);
+    ret = xsm_platform_op(op->cmd);
     if ( ret )
         return ret;
 
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 7f433343bc..58beb96663 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1376,7 +1376,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
     struct xen_mc_msrinject *mc_msrinject;
     struct xen_mc_mceinject *mc_mceinject;
 
-    ret = xsm_do_mca(XSM_PRIV);
+    ret = xsm_do_mca();
     if ( ret )
         return x86_mcerr("", ret);
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 16e91a3694..34b536417b 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -706,7 +706,7 @@ long do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
     if ( !opt_vpmu_enabled || has_vlapic(current->domain) )
         return -EOPNOTSUPP;
 
-    ret = xsm_pmu_op(XSM_OTHER, current->domain, op);
+    ret = xsm_pmu_op(current->domain, op);
     if ( ret )
         return ret;
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 26a76d2be9..8343c59e83 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -234,7 +234,7 @@ long arch_do_domctl(
         if ( (fp + np) <= fp || (fp + np) > MAX_IOPORTS )
             ret = -EINVAL;
         else if ( !ioports_access_permitted(currd, fp, fp + np - 1) ||
-                  xsm_ioport_permission(XSM_HOOK, d, fp, fp + np - 1, allow) )
+                  xsm_ioport_permission(d, fp, fp + np - 1, allow) )
             ret = -EPERM;
         else if ( allow )
             ret = ioports_permit_access(d, fp, fp + np - 1);
@@ -534,7 +534,7 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
 
-        ret = xsm_bind_pt_irq(XSM_HOOK, d, bind);
+        ret = xsm_bind_pt_irq(d, bind);
         if ( ret )
             break;
 
@@ -569,7 +569,7 @@ long arch_do_domctl(
         if ( irq <= 0 || !irq_access_permitted(currd, irq) )
             break;
 
-        ret = xsm_unbind_pt_irq(XSM_HOOK, d, bind);
+        ret = xsm_unbind_pt_irq(d, bind);
         if ( ret )
             break;
 
@@ -616,7 +616,7 @@ long arch_do_domctl(
         if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
             break;
 
-        ret = xsm_ioport_mapping(XSM_HOOK, d, fmp, fmp + np - 1, add);
+        ret = xsm_ioport_mapping(d, fmp, fmp + np - 1, add);
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index b60b9f3364..6f996371b9 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -370,7 +370,7 @@ int dm_op(const struct dmop_args *op_args)
     if ( !is_hvm_domain(d) )
         goto out;
 
-    rc = xsm_dm_op(XSM_DM_PRIV, d);
+    rc = xsm_dm_op(d);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5086773e5c..c1b0d6fca8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4080,7 +4080,7 @@ static int hvm_allow_set_param(struct domain *d,
     uint64_t value;
     int rc;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_set_param);
+    rc = xsm_hvm_param(d, HVMOP_set_param);
     if ( rc )
         return rc;
 
@@ -4227,7 +4227,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
         rc = pmtimer_change_ioport(d, value);
         break;
     case HVM_PARAM_ALTP2M:
-        rc = xsm_hvm_param_altp2mhvm(XSM_PRIV, d);
+        rc = xsm_hvm_param_altp2mhvm(d);
         if ( rc )
             break;
         if ( (value > XEN_ALTP2M_limited) ||
@@ -4356,7 +4356,7 @@ static int hvm_allow_get_param(struct domain *d,
 {
     int rc;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_get_param);
+    rc = xsm_hvm_param(d, HVMOP_get_param);
     if ( rc )
         return rc;
 
@@ -4566,7 +4566,7 @@ static int do_altp2m_op(
         goto out;
     }
 
-    if ( (rc = xsm_hvm_altp2mhvm_op(XSM_OTHER, d, mode, a.cmd)) )
+    if ( (rc = xsm_hvm_altp2mhvm_op(d, mode, a.cmd)) )
         goto out;
 
     switch ( a.cmd )
@@ -4947,7 +4947,7 @@ static int hvmop_get_mem_type(
     if ( d == NULL )
         return -ESRCH;
 
-    rc = xsm_hvm_param(XSM_TARGET, d, HVMOP_get_mem_type);
+    rc = xsm_hvm_param(d, HVMOP_get_mem_type);
     if ( rc )
         goto out;
 
@@ -5040,7 +5040,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( unlikely(d != current->domain) )
             rc = -EOPNOTSUPP;
         else if ( is_hvm_domain(d) && paging_mode_shadow(d) )
-            rc = xsm_hvm_param(XSM_TARGET, d, op);
+            rc = xsm_hvm_param(d, op);
         if ( !rc )
             pagetable_dying(a.gpa);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a1693f92dd..9f79ec1b86 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2122,7 +2122,7 @@ int map_domain_pirq(
         return 0;
     }
 
-    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, data);
+    ret = xsm_map_domain_irq(d, irq, data);
     if ( ret )
     {
         dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
@@ -2342,8 +2342,7 @@ int unmap_domain_pirq(struct domain *d, int pirq)
         nr = msi_desc->msi.nvec;
     }
 
-    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                               msi_desc ? msi_desc->dev : NULL);
+    ret = xsm_unmap_domain_irq(d, irq, msi_desc ? msi_desc->dev : NULL);
     if ( ret )
         goto done;
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4d799032dc..33d0aa8d4b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -977,7 +977,7 @@ get_page_from_l1e(
          * minor hack can go away.
          */
         if ( (real_pg_owner == NULL) || (pg_owner == l1e_owner) ||
-             xsm_priv_mapping(XSM_TARGET, pg_owner, real_pg_owner) )
+             xsm_priv_mapping(pg_owner, real_pg_owner) )
         {
             gdprintk(XENLOG_WARNING,
                      "pg_owner d%d l1e_owner d%d, but real_pg_owner d%d\n",
@@ -3407,7 +3407,7 @@ long do_mmuext_op(
         return -EINVAL;
     }
 
-    rc = xsm_mmuext_op(XSM_TARGET, currd, pg_owner);
+    rc = xsm_mmuext_op(currd, pg_owner);
     if ( rc )
     {
         put_pg_owner(pg_owner);
@@ -3497,7 +3497,7 @@ long do_mmuext_op(
                 break;
             }
 
-            rc = xsm_memory_pin_page(XSM_HOOK, currd, pg_owner, page);
+            rc = xsm_memory_pin_page(currd, pg_owner, page);
             if ( !rc && unlikely(test_and_set_bit(_PGT_pinned,
                                                   &page->u.inuse.type_info)) )
             {
@@ -4006,7 +4006,7 @@ long do_mmu_update(
             }
             if ( xsm_needed != xsm_checked )
             {
-                rc = xsm_mmu_update(XSM_TARGET, d, pt_owner, pg_owner, xsm_needed);
+                rc = xsm_mmu_update(d, pt_owner, pg_owner, xsm_needed);
                 if ( rc )
                     break;
                 xsm_checked = xsm_needed;
@@ -4142,7 +4142,7 @@ long do_mmu_update(
             xsm_needed |= XSM_MMU_MACHPHYS_UPDATE;
             if ( xsm_needed != xsm_checked )
             {
-                rc = xsm_mmu_update(XSM_TARGET, d, NULL, pg_owner, xsm_needed);
+                rc = xsm_mmu_update(d, NULL, pg_owner, xsm_needed);
                 if ( rc )
                     break;
                 xsm_checked = xsm_needed;
@@ -4391,7 +4391,7 @@ static int __do_update_va_mapping(
 
     perfc_incr(calls_to_update_va);
 
-    rc = xsm_update_va_mapping(XSM_TARGET, d, pg_owner, val);
+    rc = xsm_update_va_mapping(d, pg_owner, val);
     if ( rc )
         return rc;
 
@@ -4630,7 +4630,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_domain_memory_map(XSM_TARGET, d);
+        rc = xsm_domain_memory_map(d);
         if ( rc )
         {
             rcu_unlock_domain(d);
@@ -4697,7 +4697,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         unsigned int i;
         bool store;
 
-        rc = xsm_machine_memory_map(XSM_PRIV);
+        rc = xsm_machine_memory_map();
         if ( rc )
             return rc;
 
@@ -4787,9 +4787,9 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ESRCH;
 
         if ( cmd == XENMEM_set_pod_target )
-            rc = xsm_set_pod_target(XSM_PRIV, d);
+            rc = xsm_set_pod_target(d);
         else
-            rc = xsm_get_pod_target(XSM_PRIV, d);
+            rc = xsm_get_pod_target(d);
 
         if ( rc != 0 )
             goto pod_target_out_unlock;
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786e..073edb9499 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -452,7 +452,7 @@ int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg)
     if ( rc )
         return rc;
 
-    rc = xsm_mem_paging(XSM_DM_PRIV, d);
+    rc = xsm_mem_paging(d);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 98b14f7b0a..db5f5ce8b5 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1883,7 +1883,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     if ( rc )
         return rc;
 
-    rc = xsm_mem_sharing(XSM_DM_PRIV, d);
+    rc = xsm_mem_sharing(d);
     if ( rc )
         goto out;
 
@@ -1928,7 +1928,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( rc )
             goto out;
 
-        rc = xsm_mem_sharing_op(XSM_DM_PRIV, d, cd, mso.op);
+        rc = xsm_mem_sharing_op(d, cd, mso.op);
         if ( rc )
         {
             rcu_unlock_domain(cd);
@@ -1994,7 +1994,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( rc )
             goto out;
 
-        rc = xsm_mem_sharing_op(XSM_DM_PRIV, d, cd, mso.op);
+        rc = xsm_mem_sharing_op(d, cd, mso.op);
         if ( rc )
         {
             rcu_unlock_domain(cd);
@@ -2056,8 +2056,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
          * We reuse XENMEM_sharing_op_share XSM check here as this is
          * essentially the same concept repeated over multiple pages.
          */
-        rc = xsm_mem_sharing_op(XSM_DM_PRIV, d, cd,
-                                XENMEM_sharing_op_share);
+        rc = xsm_mem_sharing_op(d, cd, XENMEM_sharing_op_share);
         if ( rc )
         {
             rcu_unlock_domain(cd);
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index dbb1cbeb59..5cee9f5a1d 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2637,7 +2637,7 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
             goto out;
     }
 
-    rc = xsm_map_gmfn_foreign(XSM_TARGET, tdom, fdom);
+    rc = xsm_map_gmfn_foreign(tdom, fdom);
     if ( rc )
         goto out;
 
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index c304c24526..86a1ec5b80 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -714,7 +714,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return -EBUSY;
     }
 
-    rc = xsm_shadow_control(XSM_HOOK, d, sc->op);
+    rc = xsm_shadow_control(d, sc->op);
     if ( rc )
         return rc;
 
@@ -771,7 +771,7 @@ long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_domctl(XSM_OTHER, d, op.cmd);
+    ret = xsm_domctl(d, op.cmd);
     if ( !ret )
     {
         if ( domctl_lock_acquire() )
diff --git a/xen/arch/x86/mm/shadow/set.c b/xen/arch/x86/mm/shadow/set.c
index 87e9c6eeb2..e7433ac81b 100644
--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -117,7 +117,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl1e, struct domain *d, p2m_type_t type)
      * not own, we let it succeed anyway.
      */
     if ( owner && (d != owner) &&
-         !(res = xsm_priv_mapping(XSM_TARGET, d, owner)) )
+         !(res = xsm_priv_mapping(d, owner)) )
     {
         res = get_page_from_l1e(sl1e, d, owner);
         SHADOW_PRINTK("privileged %pd installs map of %pd's mfn %"PRI_mfn": %s\n",
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5febc0ea4b..f821d145e5 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1310,8 +1310,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     if ( !use_msi )
         return -EOPNOTSUPP;
 
-    ret = xsm_resource_setup_pci(XSM_PRIV,
-                                (pdev->seg << 16) | (pdev->bus << 8) |
+    ret = xsm_resource_setup_pci((pdev->seg << 16) | (pdev->bus << 8) |
                                 pdev->devfn);
     if ( ret )
         return ret;
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index a9decd4f33..d5886c59e6 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -74,7 +74,7 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                              uint32_t *data)
 {
     struct pci_dev *pdev;
-    int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, bdf,
+    int rc = xsm_pci_config_permission(current->domain, bdf,
                                        reg, reg + size - 1, 1);
 
     if ( rc < 0 )
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 23465bcd00..3f2a2035c5 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -110,7 +110,7 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
+    ret = xsm_map_domain_pirq(d);
     if ( ret )
         goto free_domain;
 
@@ -148,7 +148,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
         return -ESRCH;
 
     if ( domid != DOMID_SELF || !is_hvm_domain(d) || !has_pirq(d) )
-        ret = xsm_unmap_domain_pirq(XSM_DM_PRIV, d);
+        ret = xsm_unmap_domain_pirq(d);
     if ( ret )
         goto free_domain;
 
@@ -355,7 +355,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         ret = -EFAULT;
         if ( copy_from_guest(&apic, arg, 1) != 0 )
             break;
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(currd, cmd);
         if ( ret )
             break;
         ret = ioapic_guest_read(apic.apic_physbase, apic.reg, &apic.value);
@@ -369,7 +369,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         ret = -EFAULT;
         if ( copy_from_guest(&apic, arg, 1) != 0 )
             break;
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(currd, cmd);
         if ( ret )
             break;
         ret = ioapic_guest_write(apic.apic_physbase, apic.reg, apic.value);
@@ -385,7 +385,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         /* Use the APIC check since this dummy hypercall should still only
          * be called by the domain with access to program the ioapic */
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(currd, cmd);
         if ( ret )
             break;
 
@@ -535,8 +535,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&dev, arg, 1) )
             ret = -EFAULT;
         else
-            ret = xsm_resource_setup_pci(XSM_PRIV,
-                                         (dev.seg << 16) | (dev.bus << 8) |
+            ret = xsm_resource_setup_pci((dev.seg << 16) | (dev.bus << 8) |
                                          dev.devfn) ?:
                   pci_prepare_msix(dev.seg, dev.bus, dev.devfn,
                                    cmd != PHYSDEVOP_prepare_msix);
@@ -546,7 +545,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved: {
         struct physdev_pci_mmcfg_reserved info;
 
-        ret = xsm_resource_setup_misc(XSM_PRIV);
+        ret = xsm_resource_setup_misc();
         if ( ret )
             break;
 
@@ -611,7 +610,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( setup_gsi.gsi < 0 || setup_gsi.gsi >= nr_irqs_gsi )
             break;
 
-        ret = xsm_resource_setup_gsi(XSM_PRIV, setup_gsi.gsi);
+        ret = xsm_resource_setup_gsi(setup_gsi.gsi);
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 23fadbc782..afa97f74fd 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -196,7 +196,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     if ( op->interface_version != XENPF_INTERFACE_VERSION )
         return -EACCES;
 
-    ret = xsm_platform_op(XSM_PRIV, op->cmd);
+    ret = xsm_platform_op(op->cmd);
     if ( ret )
         return ret;
 
@@ -614,7 +614,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     {
         int cpu = op->u.cpu_ol.cpuid;
 
-        ret = xsm_resource_plug_core(XSM_HOOK);
+        ret = xsm_resource_plug_core();
         if ( ret )
             break;
 
@@ -640,7 +640,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     {
         int cpu = op->u.cpu_ol.cpuid;
 
-        ret = xsm_resource_unplug_core(XSM_HOOK);
+        ret = xsm_resource_unplug_core();
         if ( ret )
             break;
 
@@ -669,7 +669,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     break;
 
     case XENPF_cpu_hotadd:
-        ret = xsm_resource_plug_core(XSM_HOOK);
+        ret = xsm_resource_plug_core();
         if ( ret )
             break;
 
@@ -679,7 +679,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     break;
 
     case XENPF_mem_hotadd:
-        ret = xsm_resource_plug_core(XSM_HOOK);
+        ret = xsm_resource_plug_core();
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 8889509d2a..d833b8e2e6 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -250,7 +250,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     }
 
     return !write ?
-           xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
+           xsm_pci_config_permission(currd, machine_bdf,
                                      start, start + size - 1, 0) == 0 :
            pci_conf_write_intercept(0, machine_bdf, start, size, write) >= 0;
 }
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a13f3..975672360b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -190,8 +190,8 @@ long arch_do_sysctl(
         }
 
         if ( !ret )
-            ret = plug ? xsm_resource_plug_core(XSM_HOOK)
-                       : xsm_resource_unplug_core(XSM_HOOK);
+            ret = plug ? xsm_resource_plug_core()
+                       : xsm_resource_unplug_core();
 
         if ( !ret )
             ret = continue_hypercall_on_cpu(0, fn, hcpu);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b71c6d6a9..392865f0f1 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -311,7 +311,7 @@ static int late_hwdom_init(struct domain *d)
     if ( d != hardware_domain || d->domain_id == 0 )
         return 0;
 
-    rv = xsm_init_hardware_domain(XSM_HOOK, d);
+    rv = xsm_init_hardware_domain(d);
     if ( rv )
         return rv;
 
@@ -649,7 +649,7 @@ struct domain *domain_create(domid_t domid,
         if ( !d->iomem_caps || !d->irq_caps )
             goto fail;
 
-        if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
+        if ( (err = xsm_domain_create(d, config->ssidref)) != 0 )
             goto fail;
 
         d->controller_pause_count = 1;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index ef202c2b8c..de258ab7f7 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -314,7 +314,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             return -ESRCH;
     }
 
-    ret = xsm_domctl(XSM_OTHER, d, op->cmd);
+    ret = xsm_domctl(d, op->cmd);
     if ( ret )
         goto domctl_out_unlock_domonly;
 
@@ -553,7 +553,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( d == NULL )
             goto getdomaininfo_out;
 
-        ret = xsm_getdomaininfo(XSM_HOOK, d);
+        ret = xsm_getdomaininfo(d);
         if ( ret )
             goto getdomaininfo_out;
 
@@ -688,7 +688,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             break;
         }
         irq = pirq_access_permitted(current->domain, pirq);
-        if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
+        if ( !irq || xsm_irq_permission(d, irq, allow) )
             ret = -EPERM;
         else if ( allow )
             ret = irq_permit_access(d, irq);
@@ -709,7 +709,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
         if ( !iomem_access_permitted(current->domain,
                                      mfn, mfn + nr_mfns - 1) ||
-             xsm_iomem_permission(XSM_HOOK, d, mfn, mfn + nr_mfns - 1, allow) )
+             xsm_iomem_permission(d, mfn, mfn + nr_mfns - 1, allow) )
             ret = -EPERM;
         else if ( allow )
             ret = iomem_permit_access(d, mfn, mfn + nr_mfns - 1);
@@ -746,7 +746,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
              !iomem_access_permitted(d, mfn, mfn_end) )
             break;
 
-        ret = xsm_iomem_mapping(XSM_HOOK, d, mfn, mfn_end, add);
+        ret = xsm_iomem_mapping(d, mfn, mfn_end, add);
         if ( ret )
             break;
 
@@ -804,7 +804,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
         ret = -EOPNOTSUPP;
         if ( is_hvm_domain(e) )
-            ret = xsm_set_target(XSM_HOOK, d, e);
+            ret = xsm_set_target(d, e);
         if ( ret )
         {
             put_domain(e);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 5479315aae..21e7b496ef 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -296,7 +296,7 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
         ERROR_EXIT_DOM(port, d);
     chn = evtchn_from_port(d, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
+    rc = xsm_evtchn_unbound(d, chn, alloc->remote_dom);
     if ( rc )
         goto out;
 
@@ -372,7 +372,7 @@ static long evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
          (rchn->u.unbound.remote_domid != ld->domain_id) )
         ERROR_EXIT_DOM(-EINVAL, rd);
 
-    rc = xsm_evtchn_interdomain(XSM_HOOK, ld, lchn, rd, rchn);
+    rc = xsm_evtchn_interdomain(ld, lchn, rd, rchn);
     if ( rc )
         goto out;
 
@@ -760,7 +760,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
         goto out;
     }
 
-    ret = xsm_evtchn_send(XSM_HOOK, ld, lchn);
+    ret = xsm_evtchn_send(ld, lchn);
     if ( ret )
         goto out;
 
@@ -985,7 +985,7 @@ int evtchn_status(evtchn_status_t *status)
         goto out;
     }
 
-    rc = xsm_evtchn_status(XSM_TARGET, d, chn);
+    rc = xsm_evtchn_status(d, chn);
     if ( rc )
         goto out;
 
@@ -1310,7 +1310,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_evtchn_reset(XSM_TARGET, current->domain, d);
+        rc = xsm_evtchn_reset(current->domain, d);
         if ( !rc )
             rc = evtchn_reset(d, cmd == EVTCHNOP_reset_cont);
 
@@ -1371,7 +1371,7 @@ int alloc_unbound_xen_event_channel(
         goto out;
     chn = evtchn_from_port(ld, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, ld, chn, remote_domid);
+    rc = xsm_evtchn_unbound(ld, chn, remote_domid);
     if ( rc )
         goto out;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab30e2e8cf..df516f6340 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1063,7 +1063,7 @@ map_grant_ref(
         return;
     }
 
-    rc = xsm_grant_mapref(XSM_HOOK, ld, rd, op->flags);
+    rc = xsm_grant_mapref(ld, rd, op->flags);
     if ( rc )
     {
         rcu_unlock_domain(rd);
@@ -1403,7 +1403,7 @@ unmap_common(
         return;
     }
 
-    rc = xsm_grant_unmapref(XSM_HOOK, ld, rd);
+    rc = xsm_grant_unmapref(ld, rd);
     if ( rc )
     {
         rcu_unlock_domain(rd);
@@ -2021,7 +2021,7 @@ gnttab_setup_table(
         goto out;
     }
 
-    if ( xsm_grant_setup(XSM_TARGET, curr->domain, d) )
+    if ( xsm_grant_setup(curr->domain, d) )
     {
         op.status = GNTST_permission_denied;
         goto out;
@@ -2103,7 +2103,7 @@ gnttab_query_size(
         goto out;
     }
 
-    if ( xsm_grant_query_size(XSM_TARGET, current->domain, d) )
+    if ( xsm_grant_query_size(current->domain, d) )
     {
         op.status = GNTST_permission_denied;
         goto out;
@@ -2274,7 +2274,7 @@ gnttab_transfer(
             goto put_gfn_and_copyback;
         }
 
-        if ( xsm_grant_transfer(XSM_HOOK, d, e) )
+        if ( xsm_grant_transfer(d, e) )
         {
             gop.status = GNTST_permission_denied;
         unlock_and_copyback:
@@ -2812,7 +2812,7 @@ static int gnttab_copy_lock_domains(const struct gnttab_copy *op,
     if ( rc < 0 )
         goto error;
 
-    rc = xsm_grant_copy(XSM_HOOK, src->domain, dest->domain);
+    rc = xsm_grant_copy(src->domain, dest->domain);
     if ( rc < 0 )
     {
         rc = GNTST_permission_denied;
@@ -3231,7 +3231,7 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
         op.status = GNTST_bad_domain;
         goto out1;
     }
-    rc = xsm_grant_setup(XSM_TARGET, current->domain, d);
+    rc = xsm_grant_setup(current->domain, d);
     if ( rc )
     {
         op.status = GNTST_permission_denied;
@@ -3295,7 +3295,7 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
     if ( d == NULL )
         return -ESRCH;
 
-    rc = xsm_grant_query_size(XSM_TARGET, current->domain, d);
+    rc = xsm_grant_query_size(current->domain, d);
     if ( rc )
     {
         rcu_unlock_domain(d);
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index e71f7df479..052f3d472a 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -679,7 +679,7 @@ long do_hypfs_op(unsigned int cmd,
     struct hypfs_entry *entry;
     static char path[XEN_HYPFS_MAX_PATHLEN];
 
-    if ( xsm_hypfs_op(XSM_PRIV) )
+    if ( xsm_hypfs_op() )
         return -EPERM;
 
     if ( cmd == XEN_HYPFS_OP_get_version )
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d77756a81e..89e01e908c 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -459,7 +459,7 @@ __initcall(param_init);
 
 DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
+    bool_t deny = !!xsm_xen_version(cmd);
 
     switch ( cmd )
     {
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index ebeee6405a..a0d2858cd8 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1219,7 +1219,7 @@ static int do_kexec_op_internal(unsigned long op,
 {
     int ret = -EINVAL;
 
-    ret = xsm_kexec(XSM_PRIV);
+    ret = xsm_kexec();
     if ( ret )
         return ret;
 
diff --git a/xen/common/mem_access.c b/xen/common/mem_access.c
index 010e6f8dbf..2066510d3b 100644
--- a/xen/common/mem_access.c
+++ b/xen/common/mem_access.c
@@ -47,7 +47,7 @@ int mem_access_memop(unsigned long cmd,
     if ( !p2m_mem_access_sanity_check(d) )
         goto out;
 
-    rc = xsm_mem_access(XSM_DM_PRIV, d);
+    rc = xsm_mem_access(d);
     if ( rc )
         goto out;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 72a6b70cb5..d2621bbb47 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -609,7 +609,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         goto fail_early;
     }
 
-    rc = xsm_memory_exchange(XSM_TARGET, d);
+    rc = xsm_memory_exchange(d);
     if ( rc )
     {
         rcu_unlock_domain(d);
@@ -1072,7 +1072,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
          (!is_hardware_domain(d) || (d != current->domain)) )
         return -EACCES;
 
-    return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
+    return xsm_add_to_physmap(current->domain, d);
 }
 
 unsigned int ioreq_server_max_frames(const struct domain *d)
@@ -1232,7 +1232,7 @@ static int acquire_resource(
     if ( rc )
         return rc;
 
-    rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
+    rc = xsm_domain_resource_map(d);
     if ( rc )
         goto out;
 
@@ -1388,7 +1388,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
              && (reservation.mem_flags & XENMEMF_populate_on_demand) )
             args.memflags |= MEMF_populate_on_demand;
 
-        if ( xsm_memory_adjust_reservation(XSM_TARGET, curr_d, d) )
+        if ( xsm_memory_adjust_reservation(curr_d, d) )
         {
             rcu_unlock_domain(d);
             return start_extent;
@@ -1462,7 +1462,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -ESRCH;
 
-        rc = xsm_memory_stat_reservation(XSM_TARGET, curr_d, d);
+        rc = xsm_memory_stat_reservation(curr_d, d);
         if ( rc )
         {
             rcu_unlock_domain(d);
@@ -1584,7 +1584,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ESRCH;
 
         rc = paging_mode_translate(d)
-             ? xsm_remove_from_physmap(XSM_TARGET, curr_d, d)
+             ? xsm_remove_from_physmap(curr_d, d)
              : -EACCES;
         if ( rc )
         {
@@ -1631,7 +1631,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             return -EINVAL;
 
-        rc = xsm_claim_pages(XSM_PRIV, d);
+        rc = xsm_claim_pages(d);
 
         if ( !rc )
             rc = domain_set_outstanding_pages(d, reservation.nr_extents);
@@ -1662,7 +1662,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( (d = rcu_lock_domain_by_any_id(topology.domid)) == NULL )
             return -ESRCH;
 
-        rc = xsm_get_vnumainfo(XSM_TARGET, d);
+        rc = xsm_get_vnumainfo(d);
         if ( rc )
         {
             rcu_unlock_domain(d);
diff --git a/xen/common/monitor.c b/xen/common/monitor.c
index d5c9ff1cbf..ff17bad733 100644
--- a/xen/common/monitor.c
+++ b/xen/common/monitor.c
@@ -36,7 +36,7 @@ int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop)
     if ( unlikely(current->domain == d) ) /* no domain_pause() */
         return -EPERM;
 
-    rc = xsm_vm_event_control(XSM_PRIV, d, mop->op, mop->event);
+    rc = xsm_vm_event_control(d, mop->op, mop->event);
     if ( unlikely(rc) )
         return rc;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 6d34764d38..e5c154fe9d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1944,7 +1944,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( d == NULL )
             break;
 
-        ret = xsm_schedop_shutdown(XSM_DM_PRIV, current->domain, d);
+        ret = xsm_schedop_shutdown(current->domain, d);
         if ( likely(!ret) )
             domain_shutdown(d, sched_remote_shutdown.reason);
 
@@ -2046,7 +2046,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
 {
     long ret;
 
-    ret = xsm_domctl_scheduler_op(XSM_HOOK, d, op->cmd);
+    ret = xsm_domctl_scheduler_op(d, op->cmd);
     if ( ret )
         return ret;
 
@@ -2081,7 +2081,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
     struct cpupool *pool;
     int rc;
 
-    rc = xsm_sysctl_scheduler_op(XSM_HOOK, op->cmd);
+    rc = xsm_sysctl_scheduler_op(op->cmd);
     if ( rc )
         return rc;
 
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 3558641cd9..4e25c0e499 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -41,7 +41,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     if ( op->interface_version != XEN_SYSCTL_INTERFACE_VERSION )
         return -EACCES;
 
-    ret = xsm_sysctl(XSM_PRIV, op->cmd);
+    ret = xsm_sysctl(op->cmd);
     if ( ret )
         return ret;
 
@@ -58,7 +58,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     switch ( op->cmd )
     {
     case XEN_SYSCTL_readconsole:
-        ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
+        ret = xsm_readconsole(op->u.readconsole.clear);
         if ( ret )
             break;
 
@@ -88,7 +88,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             if ( num_domains == op->u.getdomaininfolist.max_domains )
                 break;
 
-            ret = xsm_getdomaininfo(XSM_HOOK, d);
+            ret = xsm_getdomaininfo(d);
             if ( ret )
                 continue;
 
@@ -191,7 +191,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         if ( op->u.page_offline.end < op->u.page_offline.start )
             break;
 
-        ret = xsm_page_offline(XSM_HOOK, op->u.page_offline.cmd);
+        ret = xsm_page_offline(op->u.page_offline.cmd);
         if ( ret )
             break;
 
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 70ab3ba406..307f99fcf0 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -584,7 +584,7 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
         return 0;
     }
 
-    rc = xsm_vm_event_control(XSM_PRIV, d, vec->mode, vec->op);
+    rc = xsm_vm_event_control(d, vec->mode, vec->op);
     if ( rc )
         return rc;
 
diff --git a/xen/common/xenoprof.c b/xen/common/xenoprof.c
index 1926a92fe4..76d8b1f807 100644
--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -737,7 +737,7 @@ ret_t do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
         return -EPERM;
     }
 
-    ret = xsm_profile(XSM_HOOK, current->domain, op);
+    ret = xsm_profile(current->domain, op);
     if ( ret )
         return ret;
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7d0a603d03..b5d62ea4ee 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -681,7 +681,7 @@ long do_console_io(unsigned int cmd, unsigned int count,
     long rc;
     unsigned int idx, len;
 
-    rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
+    rc = xsm_console_io(current->domain, cmd);
     if ( rc )
         return rc;
 
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831d90..67b03fd2a9 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -230,7 +230,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( ret )
             break;
 
-        ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+        ret = xsm_assign_dtdevice(d, dt_node_full_name(dev));
         if ( ret )
             break;
 
@@ -284,7 +284,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
         if ( ret )
             break;
 
-        ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+        ret = xsm_deassign_dtdevice(d, dt_node_full_name(dev));
 
         if ( d == dom_io )
             return -EINVAL;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 199ce08612..1363ef8121 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -704,7 +704,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         pdev_type = "device";
 
-    ret = xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_plug_pci((seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
@@ -814,7 +814,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     struct pci_dev *pdev;
     int ret;
 
-    ret = xsm_resource_unplug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_unplug_pci((seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
@@ -1477,7 +1477,7 @@ static int iommu_get_device_group(
              ((pdev->bus == bus) && (pdev->devfn == devfn)) )
             continue;
 
-        if ( xsm_get_device_group(XSM_HOOK, (seg << 16) | (pdev->bus << 8) | pdev->devfn) )
+        if ( xsm_get_device_group((seg << 16) | (pdev->bus << 8) | pdev->devfn) )
             continue;
 
         sdev_id = ops->get_device_group_id(seg, pdev->bus, pdev->devfn);
@@ -1545,7 +1545,7 @@ int iommu_do_pci_domctl(
         u32 max_sdevs;
         XEN_GUEST_HANDLE_64(uint32) sdevs;
 
-        ret = xsm_get_device_group(XSM_HOOK, domctl->u.get_device_group.machine_sbdf);
+        ret = xsm_get_device_group(domctl->u.get_device_group.machine_sbdf);
         if ( ret )
             break;
 
@@ -1596,7 +1596,7 @@ int iommu_do_pci_domctl(
 
         machine_sbdf = domctl->u.assign_device.u.pci.machine_sbdf;
 
-        ret = xsm_assign_device(XSM_HOOK, d, machine_sbdf);
+        ret = xsm_assign_device(d, machine_sbdf);
         if ( ret )
             break;
 
@@ -1641,7 +1641,7 @@ int iommu_do_pci_domctl(
 
         machine_sbdf = domctl->u.assign_device.u.pci.machine_sbdf;
 
-        ret = xsm_deassign_device(XSM_HOOK, d, machine_sbdf);
+        ret = xsm_deassign_device(d, machine_sbdf);
         if ( ret )
             break;
 
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 69f68300e2..1d25954731 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -30,53 +30,53 @@ static inline void xsm_security_domaininfo (struct domain *d,
     alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
-static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
+static inline int xsm_domain_create (struct domain *d, u32 ssidref)
 {
     return alternative_call(xsm_ops.domain_create, d, ssidref);
 }
 
-static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
+static inline int xsm_getdomaininfo (struct domain *d)
 {
     return alternative_call(xsm_ops.getdomaininfo, d);
 }
 
-static inline int xsm_domctl_scheduler_op (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl_scheduler_op (struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
-static inline int xsm_sysctl_scheduler_op (xsm_default_t def, int cmd)
+static inline int xsm_sysctl_scheduler_op (int cmd)
 {
     return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
 }
 
-static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
+static inline int xsm_set_target (struct domain *d, struct domain *e)
 {
     return alternative_call(xsm_ops.set_target, d, e);
 }
 
-static inline int xsm_domctl (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl (struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.domctl, d, cmd);
 }
 
-static inline int xsm_sysctl (xsm_default_t def, int cmd)
+static inline int xsm_sysctl (int cmd)
 {
     return alternative_call(xsm_ops.sysctl, cmd);
 }
 
-static inline int xsm_readconsole (xsm_default_t def, uint32_t clear)
+static inline int xsm_readconsole (uint32_t clear)
 {
     return alternative_call(xsm_ops.readconsole, clear);
 }
 
-static inline int xsm_evtchn_unbound (xsm_default_t def, struct domain *d1, struct evtchn *chn,
+static inline int xsm_evtchn_unbound (struct domain *d1, struct evtchn *chn,
                                                                     domid_t id2)
 {
     return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
 }
 
-static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
+static inline int xsm_evtchn_interdomain (struct domain *d1,
                 struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
 {
     return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
@@ -87,48 +87,48 @@ static inline void xsm_evtchn_close_post (struct evtchn *chn)
     alternative_vcall(xsm_ops.evtchn_close_post, chn);
 }
 
-static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_send (struct domain *d, struct evtchn *chn)
 {
     return alternative_call(xsm_ops.evtchn_send, d, chn);
 }
 
-static inline int xsm_evtchn_status (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_status (struct domain *d, struct evtchn *chn)
 {
     return alternative_call(xsm_ops.evtchn_status, d, chn);
 }
 
-static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_evtchn_reset (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.evtchn_reset, d1, d2);
 }
 
-static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
+static inline int xsm_grant_mapref (struct domain *d1, struct domain *d2,
                                                                 uint32_t flags)
 {
     return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
 }
 
-static inline int xsm_grant_unmapref (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_unmapref (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.grant_unmapref, d1, d2);
 }
 
-static inline int xsm_grant_setup (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_setup (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.grant_setup, d1, d2);
 }
 
-static inline int xsm_grant_transfer (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_transfer (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.grant_transfer, d1, d2);
 }
 
-static inline int xsm_grant_copy (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_copy (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.grant_copy, d1, d2);
 }
 
-static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_query_size (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.grant_query_size, d1, d2);
 }
@@ -160,80 +160,80 @@ static inline char *xsm_show_security_evtchn (struct domain *d, const struct evt
     return alternative_call(xsm_ops.show_security_evtchn, d, chn);
 }
 
-static inline int xsm_init_hardware_domain (xsm_default_t def, struct domain *d)
+static inline int xsm_init_hardware_domain (struct domain *d)
 {
     return alternative_call(xsm_ops.init_hardware_domain, d);
 }
 
-static inline int xsm_get_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_get_pod_target (struct domain *d)
 {
     return alternative_call(xsm_ops.get_pod_target, d);
 }
 
-static inline int xsm_set_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_set_pod_target (struct domain *d)
 {
     return alternative_call(xsm_ops.set_pod_target, d);
 }
 
-static inline int xsm_memory_exchange (xsm_default_t def, struct domain *d)
+static inline int xsm_memory_exchange (struct domain *d)
 {
     return alternative_call(xsm_ops.memory_exchange, d);
 }
 
-static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
+static inline int xsm_memory_adjust_reservation (struct domain *d1, struct
                                                                     domain *d2)
 {
     return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
 }
 
-static inline int xsm_memory_stat_reservation (xsm_default_t def, struct domain *d1,
+static inline int xsm_memory_stat_reservation (struct domain *d1,
                                                             struct domain *d2)
 {
     return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
 }
 
-static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
+static inline int xsm_memory_pin_page(struct domain *d1, struct domain *d2,
                                       struct page_info *page)
 {
     return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
 }
 
-static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_add_to_physmap(struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.add_to_physmap, d1, d2);
 }
 
-static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_remove_from_physmap(struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
 }
 
-static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_map_gmfn_foreign (struct domain *d, struct domain *t)
 {
     return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
 }
 
-static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
+static inline int xsm_claim_pages(struct domain *d)
 {
     return alternative_call(xsm_ops.claim_pages, d);
 }
 
-static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_console_io (struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.console_io, d, cmd);
 }
 
-static inline int xsm_profile (xsm_default_t def, struct domain *d, int op)
+static inline int xsm_profile (struct domain *d, int op)
 {
     return alternative_call(xsm_ops.profile, d, op);
 }
 
-static inline int xsm_kexec (xsm_default_t def)
+static inline int xsm_kexec (void)
 {
     return alternative_call(xsm_ops.kexec);
 }
 
-static inline int xsm_schedop_shutdown (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_schedop_shutdown (struct domain *d1, struct domain *d2)
 {
     return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
 }
@@ -243,131 +243,129 @@ static inline char *xsm_show_irq_sid (int irq)
     return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
-static inline int xsm_map_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_map_domain_pirq (struct domain *d)
 {
     return alternative_call(xsm_ops.map_domain_pirq, d);
 }
 
-static inline int xsm_map_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_map_domain_irq (struct domain *d, int irq, void *data)
 {
     return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
 }
 
-static inline int xsm_unmap_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_unmap_domain_pirq (struct domain *d)
 {
     return alternative_call(xsm_ops.unmap_domain_pirq, d);
 }
 
-static inline int xsm_unmap_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_unmap_domain_irq (struct domain *d, int irq, void *data)
 {
     return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
 }
 
-static inline int xsm_bind_pt_irq(xsm_default_t def, struct domain *d,
+static inline int xsm_bind_pt_irq(struct domain *d,
                                   struct xen_domctl_bind_pt_irq *bind)
 {
     return alternative_call(xsm_ops.bind_pt_irq, d, bind);
 }
 
-static inline int xsm_unbind_pt_irq(xsm_default_t def, struct domain *d,
+static inline int xsm_unbind_pt_irq(struct domain *d,
                                     struct xen_domctl_bind_pt_irq *bind)
 {
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
-static inline int xsm_irq_permission (xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
+static inline int xsm_irq_permission (struct domain *d, int pirq, uint8_t allow)
 {
     return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
 }
 
-static inline int xsm_iomem_permission (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_permission (struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
 
-static inline int xsm_iomem_mapping (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_mapping (struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
 }
 
-static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
+static inline int xsm_pci_config_permission (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
 {
     return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_get_device_group(uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.get_device_group, machine_bdf);
 }
 
-static inline int xsm_assign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_assign_device(struct domain *d, uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.assign_device, d, machine_bdf);
 }
 
-static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_deassign_device(struct domain *d, uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
-                                      const char *dtpath)
+static inline int xsm_assign_dtdevice(struct domain *d, const char *dtpath)
 {
     return alternative_call(xsm_ops.assign_dtdevice, d, dtpath);
 }
 
-static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
-                                        const char *dtpath)
+static inline int xsm_deassign_dtdevice(struct domain *d, const char *dtpath)
 {
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_plug_pci (uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
 }
 
-static inline int xsm_resource_unplug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_unplug_pci (uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
 }
 
-static inline int xsm_resource_plug_core (xsm_default_t def)
+static inline int xsm_resource_plug_core (void)
 {
     return alternative_call(xsm_ops.resource_plug_core);
 }
 
-static inline int xsm_resource_unplug_core (xsm_default_t def)
+static inline int xsm_resource_unplug_core (void)
 {
     return alternative_call(xsm_ops.resource_unplug_core);
 }
 
-static inline int xsm_resource_setup_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_setup_pci (uint32_t machine_bdf)
 {
     return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
 }
 
-static inline int xsm_resource_setup_gsi (xsm_default_t def, int gsi)
+static inline int xsm_resource_setup_gsi (int gsi)
 {
     return alternative_call(xsm_ops.resource_setup_gsi, gsi);
 }
 
-static inline int xsm_resource_setup_misc (xsm_default_t def)
+static inline int xsm_resource_setup_misc (void)
 {
     return alternative_call(xsm_ops.resource_setup_misc);
 }
 
-static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
+static inline int xsm_page_offline(uint32_t cmd)
 {
     return alternative_call(xsm_ops.page_offline, cmd);
 }
 
-static inline int xsm_hypfs_op(xsm_default_t def)
+static inline int xsm_hypfs_op(void)
 {
     return alternative_call(xsm_ops.hypfs_op);
 }
@@ -386,149 +384,149 @@ static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 }
 #endif
 
-static inline int xsm_hvm_param (xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_param (struct domain *d, unsigned long op)
 {
     return alternative_call(xsm_ops.hvm_param, d, op);
 }
 
-static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_control(struct domain *d, unsigned long op)
 {
     return alternative_call(xsm_ops.hvm_control, d, op);
 }
 
-static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
+static inline int xsm_hvm_param_altp2mhvm (struct domain *d)
 {
     return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
 }
 
-static inline int xsm_hvm_altp2mhvm_op (xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
+static inline int xsm_hvm_altp2mhvm_op (struct domain *d, uint64_t mode, uint32_t op)
 {
     return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
 }
 
-static inline int xsm_get_vnumainfo (xsm_default_t def, struct domain *d)
+static inline int xsm_get_vnumainfo (struct domain *d)
 {
     return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
-static inline int xsm_vm_event_control (xsm_default_t def, struct domain *d, int mode, int op)
+static inline int xsm_vm_event_control (struct domain *d, int mode, int op)
 {
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static inline int xsm_mem_access (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_access (struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_paging (struct domain *d)
 {
     return alternative_call(xsm_ops.mem_paging, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static inline int xsm_mem_sharing (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_sharing (struct domain *d)
 {
     return alternative_call(xsm_ops.mem_sharing, d);
 }
 #endif
 
-static inline int xsm_platform_op (xsm_default_t def, uint32_t op)
+static inline int xsm_platform_op (uint32_t op)
 {
     return alternative_call(xsm_ops.platform_op, op);
 }
 
 #ifdef CONFIG_X86
-static inline int xsm_do_mca(xsm_default_t def)
+static inline int xsm_do_mca(void)
 {
     return alternative_call(xsm_ops.do_mca);
 }
 
-static inline int xsm_shadow_control (xsm_default_t def, struct domain *d, uint32_t op)
+static inline int xsm_shadow_control (struct domain *d, uint32_t op)
 {
     return alternative_call(xsm_ops.shadow_control, d, op);
 }
 
-static inline int xsm_mem_sharing_op (xsm_default_t def, struct domain *d, struct domain *cd, int op)
+static inline int xsm_mem_sharing_op (struct domain *d, struct domain *cd, int op)
 {
     return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
 }
 
-static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_apic (struct domain *d, int cmd)
 {
     return alternative_call(xsm_ops.apic, d, cmd);
 }
 
-static inline int xsm_memtype (xsm_default_t def, uint32_t access)
+static inline int xsm_memtype (uint32_t access)
 {
     return alternative_call(xsm_ops.memtype, access);
 }
 
-static inline int xsm_machine_memory_map(xsm_default_t def)
+static inline int xsm_machine_memory_map(void)
 {
     return alternative_call(xsm_ops.machine_memory_map);
 }
 
-static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_memory_map(struct domain *d)
 {
     return alternative_call(xsm_ops.domain_memory_map, d);
 }
 
-static inline int xsm_mmu_update (xsm_default_t def, struct domain *d, struct domain *t,
+static inline int xsm_mmu_update (struct domain *d, struct domain *t,
                                   struct domain *f, uint32_t flags)
 {
     return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
 }
 
-static inline int xsm_mmuext_op (xsm_default_t def, struct domain *d, struct domain *f)
+static inline int xsm_mmuext_op (struct domain *d, struct domain *f)
 {
     return alternative_call(xsm_ops.mmuext_op, d, f);
 }
 
-static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d, struct domain *f,
+static inline int xsm_update_va_mapping(struct domain *d, struct domain *f,
                                                             l1_pgentry_t pte)
 {
     /* pte(struct) is being passed by value, alternative_call does not support */
     return xsm_ops.update_va_mapping(d, f, pte);
 }
 
-static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_priv_mapping(struct domain *d, struct domain *t)
 {
     return alternative_call(xsm_ops.priv_mapping, d, t);
 }
 
-static inline int xsm_ioport_permission (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_permission (struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
 }
 
-static inline int xsm_ioport_mapping (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_mapping (struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
 }
 
-static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
+static inline int xsm_pmu_op (struct domain *d, unsigned int op)
 {
     return alternative_call(xsm_ops.pmu_op, d, op);
 }
 
 #endif /* CONFIG_X86 */
 
-static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
+static inline int xsm_dm_op(struct domain *d)
 {
     return alternative_call(xsm_ops.dm_op, d);
 }
 
-static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
+static inline int xsm_xen_version (uint32_t op)
 {
     return alternative_call(xsm_ops.xen_version, op);
 }
 
-static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_resource_map(struct domain *d)
 {
     return alternative_call(xsm_ops.domain_resource_map, d);
 }
-- 
2.20.1


