Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375876BE6B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574497.899828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvrM-00009f-5K; Tue, 01 Aug 2023 20:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574497.899828; Tue, 01 Aug 2023 20:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvrM-00007P-1T; Tue, 01 Aug 2023 20:20:48 +0000
Received: by outflank-mailman (input) for mailman id 574497;
 Tue, 01 Aug 2023 20:20:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvrK-0007tB-NS
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:20:46 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e42cb24b-30a8-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 22:20:44 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690921220423235.25435125968477;
 Tue, 1 Aug 2023 13:20:20 -0700 (PDT)
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
X-Inumbo-ID: e42cb24b-30a8-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690921222; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DCsyMRf8xAaiW6V1MikN6A+7KB+qawGSQaoE+fU00o0RtbQCtfU4We3Qv4qG5GmZF57GQJbbB7Bl8ecL62/ZddTQxc0eLGPJfii7l+TG+WwQ76H9Qfxn1qZ2GNbZKXCURhg40/bf6gUloroHct+k1G9hIF1dsHzfW2OD5pb9pqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921222; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=deDaH1mtD3wmtBLBicRQEslJzzR5NTIhnW//O7OUueo=; 
	b=adqNUS2vwkEOP74LrJxnjLB3DpNLDejgALxzqz1qHmAPf/TPzdSdRnOT9UtoXLhhOwJc/xbXtDj7hClTyKSS8GYl0hZ+eUShT5EbYzV0GSKQT6XVNI0dSiuX0R5cNOh4C1CqCEtcNKyaIqYcKmTtJzku2ibzwsuB5MaHxRdIQjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921222;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=deDaH1mtD3wmtBLBicRQEslJzzR5NTIhnW//O7OUueo=;
	b=Nq/4qPInj010nlvQY8Aj5jx/3/svbtKYrChM01e+EM79DiY7ZY4YWw7EznUDp+Da
	G5DETugcWT93dlg6z9pbgUdppwpBS0v/sRj9eMBw1oS321J39Bb9zFnuHU4AUlMQVOe
	SIEZN4U1zv5X5EKi85IC9W7t3DLeguLr5isP2feg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 2/6] roles: provide abstraction for the possible domain roles
Date: Tue,  1 Aug 2023 16:20:02 -0400
Message-Id: <20230801202006.20322-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230801202006.20322-1-dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The existing concepts such as unbounded domain, ie. all powerful, control
domain and hardware domain are, effectively, roles the domains provide for the
system. Currently, these are represented with booleans within `struct domain`
or global domid variables that are compared against. This patch begins to
formalize these roles by replacing the `is_control` and `is_console`, along
with expanding the check against the global `hardware_domain` with a single
encapsulating role attribute in `struct domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/domain_build.c |  2 ++
 xen/arch/x86/setup.c        |  2 ++
 xen/common/domain.c         | 14 +++++++++++++-
 xen/include/xen/sched.h     | 16 +++++++++-------
 xen/include/xsm/dummy.h     |  4 ++--
 xen/xsm/flask/hooks.c       | 12 ++++++------
 6 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 39b4ee03a5..51b4daefe1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -4201,6 +4201,8 @@ void __init create_dom0(void)
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
 
+    dom0->role |= ROLE_UNBOUNDED_DOMAIN;
+
     if ( alloc_dom0_vcpu0(dom0) == NULL )
         panic("Error creating domain 0 vcpu0\n");
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2dbe9857aa..4e20edc3bf 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -905,6 +905,8 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
 
+    d->role |= ROLE_UNBOUNDED_DOMAIN;
+
     init_dom0_cpuid_policy(d);
 
     if ( alloc_dom0_vcpu0(d) == NULL )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8fb3c052f5..0ff1d52e3d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
     setup_io_bitmap(dom0);
 #endif
 
+    /*
+     * "dom0" may have been created under the unbounded role, demote it from
+     * that role, reducing it to the control domain role and any other roles it
+     * may have been given.
+     */
+    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);
+    dom0->role |= ROLE_CONTROL_DOMAIN;
+
     rcu_unlock_domain(dom0);
 
     iommu_hwdom_init(d);
@@ -609,7 +617,10 @@ struct domain *domain_create(domid_t domid,
     }
 
     /* Sort out our idea of is_control_domain(). */
-    d->is_privileged = flags & CDF_privileged;
+    if ( flags & CDF_privileged )
+        d->role |= ROLE_CONTROL_DOMAIN;
+    else
+        d->role &= ~ROLE_CONTROL_DOMAIN; /*ensure not set */
 
     /* Sort out our idea of is_hardware_domain(). */
     if ( is_initial_domain(d) || domid == hardware_domid )
@@ -619,6 +630,7 @@ struct domain *domain_create(domid_t domid,
 
         old_hwdom = hardware_domain;
         hardware_domain = d;
+        d->role |= ROLE_HARDWARE_DOMAIN;
     }
 
     TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a9276a7bed..695f240326 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -467,8 +467,10 @@ struct domain
 #endif
     /* is node-affinity automatically computed? */
     bool             auto_node_affinity;
-    /* Is this guest fully privileged (aka dom0)? */
-    bool             is_privileged;
+#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
+#define ROLE_CONTROL_DOMAIN    (1U<<1)
+#define ROLE_HARDWARE_DOMAIN   (1U<<2)
+    uint8_t          role;
     /* Can this guest access the Xen console? */
     bool             is_console;
     /* Is this guest being debugged by dom0? */
@@ -1060,9 +1062,7 @@ void watchdog_domain_destroy(struct domain *d);
 
 static always_inline bool is_initial_domain(const struct domain *d)
 {
-    static int init_domain_id = 0;
-
-    return d->domain_id == init_domain_id;
+    return d->role & ROLE_UNBOUNDED_DOMAIN;
 }
 
 /*
@@ -1076,7 +1076,8 @@ static always_inline bool is_hardware_domain(const struct domain *d)
     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
         return false;
 
-    return evaluate_nospec(d == hardware_domain);
+    return evaluate_nospec(((d->role & ROLE_HARDWARE_DOMAIN) ||
+        is_initial_domain(d)) && (d == hardware_domain));
 }
 
 /* This check is for functionality specific to a control domain */
@@ -1085,7 +1086,8 @@ static always_inline bool is_control_domain(const struct domain *d)
     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
         return false;
 
-    return evaluate_nospec(d->is_privileged);
+    return evaluate_nospec((d->role & ROLE_CONTROL_DOMAIN) ||
+        is_initial_domain(d));
 }
 
 #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 8671af1ba4..18f1ddd127 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -108,7 +108,7 @@ static XSM_INLINE int cf_check xsm_set_system_active(void)
 {
     struct domain *d = current->domain;
 
-    ASSERT(d->is_privileged);
+    ASSERT(d->role & ROLE_CONTROL_DOMAIN);
 
     if ( d->domain_id != DOMID_IDLE )
     {
@@ -116,7 +116,7 @@ static XSM_INLINE int cf_check xsm_set_system_active(void)
         return -EPERM;
     }
 
-    d->is_privileged = false;
+    d->role &= ~ROLE_CONTROL_DOMAIN;
 
     return 0;
 }
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 78225f68c1..0a31719f43 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -193,7 +193,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     default:
         if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
         {
-            if ( d->is_privileged )
+            if ( d->role & ROLE_CONTROL_DOMAIN )
                 dsec->sid = SECINITSID_DOM0;
             else if ( pv_shim )
                 dsec->sid = SECINITSID_DOMU;
@@ -213,7 +213,7 @@ static int cf_check flask_set_system_active(void)
 
     dsec = d->ssid;
 
-    ASSERT(d->is_privileged);
+    ASSERT(d->role & ROLE_CONTROL_DOMAIN);
     ASSERT(dsec->sid == SECINITSID_XENBOOT);
     ASSERT(dsec->self_sid == SECINITSID_XENBOOT);
 
@@ -224,11 +224,11 @@ static int cf_check flask_set_system_active(void)
     }
 
     /*
-     * While is_privileged has no significant meaning under flask, set to false
-     * as is_privileged is not only used for a privilege check but also as a
-     * type of domain check, specifically if the domain is the control domain.
+     * While domain roles have no significant meaning under flask, mask out
+     * control domain role as it is not only used for a privilege check but
+     * also as a type of domain check.
      */
-    d->is_privileged = false;
+    d->role &= ~ROLE_CONTROL_DOMAIN;
 
     dsec->self_sid = dsec->sid = SECINITSID_XEN;
 
-- 
2.20.1


