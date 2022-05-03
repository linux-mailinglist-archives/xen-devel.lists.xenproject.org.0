Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58241518325
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 13:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319484.539744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqXx-00083N-6m; Tue, 03 May 2022 11:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319484.539744; Tue, 03 May 2022 11:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqXx-00081L-3g; Tue, 03 May 2022 11:18:25 +0000
Received: by outflank-mailman (input) for mailman id 319484;
 Tue, 03 May 2022 11:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7qc=VL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nlqXv-0007fC-UW
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 11:18:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd882290-cad2-11ec-a406-831a346695d4;
 Tue, 03 May 2022 13:18:22 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1651576666625684.9544369515083;
 Tue, 3 May 2022 04:17:46 -0700 (PDT)
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
X-Inumbo-ID: bd882290-cad2-11ec-a406-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1651576668; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OraSR3qfSrtz+7/ja+AJ3u2ZEF2YOjanOlU+YmeYxS2OoWTCw9/Y894YGeG36LQncZy+h3p1mwHkS+TXUT6d6RMz2VJsxvXkSjj+6MlgynOZYGDN0GmyjsDLaO/N9dB+sFapSYW67d+PKk46Hj8L+lfrZ3MdC8Xf8UhLw+IDmaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651576668; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+BUcWaa4jX05BxfmuF7X73mpsOynlVPuun3vh8wQPWc=; 
	b=L6GDhTRc5QYyPSm2alZ4s0mTDaWf7dJb7uFvy8JX6vnreeSqECmWux0JKBJjOPkuy9j7zfiMJ8l5/hk9yvfgVzjnm/lzvhmB0mGE/y9UFWmooqU8tzO/IFyJFbz2TbfYBN8FvJrm6LAGIqA0i8SLUMX6XwO+PGjjR/RrNAb3IZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651576668;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+BUcWaa4jX05BxfmuF7X73mpsOynlVPuun3vh8wQPWc=;
	b=FXiAr3X3yy3yFkOj1ohaIwJe5eyKt9HT0WvNictncrS/NuLwW/q/M4jcwWYXPZEK
	hRwY3oWuwm3E7t0VBn770hO1DpZOWI6Y3CzbMvnoLC4Snldf8vOshN/tB6AdOJgeng0
	1ALNaMmGHnedcAu1Bt16B53rglNfqSIGZZtOBjAM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v6 1/2] xsm: create idle domain privileged and demote after setup
Date: Tue,  3 May 2022 07:17:30 -0400
Message-Id: <20220503111731.12642-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220503111731.12642-1-dpsmith@apertussolutions.com>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

There are new capabilities, dom0less and hyperlaunch, that introduce internal
hypervisor logic which needs to make resource allocation calls that are
protected by XSM access checks. This creates an issue as a subset of the
hypervisor code is executed under a system domain, the idle domain, that is
represented by a per-CPU non-privileged struct domain. To enable these new
capabilities to function correctly but in a controlled manner, this commit
changes the idle system domain to be created as a privileged domain under the
default policy and demoted before transitioning to running. A new XSM hook,
xsm_set_system_active(), is introduced to allow each XSM policy type to demote
the idle domain appropriately for that policy type. In the case of SILO, it
inherits the default policy's hook for xsm_set_system_active().

For flask a stub is added to ensure that flask policy system will function
correctly with this patch until flask is extended with support for starting the
idle domain privileged and properly demoting it on the call to
xsm_set_system_active().

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/arm/setup.c    |  4 ++++
 xen/arch/x86/setup.c    |  5 +++++
 xen/common/sched/core.c |  7 ++++++-
 xen/include/xsm/dummy.h | 17 +++++++++++++++++
 xen/include/xsm/xsm.h   |  6 ++++++
 xen/xsm/dummy.c         |  1 +
 xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
 7 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..39a654926d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1048,6 +1048,10 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
+    if ( (rc = xsm_set_system_active()) != 0 )
+        panic("xsm(err=%d): "
+              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", rc);
+
     system_state = SYS_STATE_active;
 
     for_each_domain( d )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f20e17892..36a60ce884 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -620,6 +620,11 @@ static void noreturn init_done(void)
 {
     void *va;
     unsigned long start, end;
+    int err;
+
+    if ( (err = xsm_set_system_active()) != 0 )
+        panic("xsm(err=%d): "
+              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);
 
     system_state = SYS_STATE_active;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab678181..7b1c03a0e1 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
         sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
     }
 
-    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
+    /*
+     * The idle dom is created privileged to ensure unrestricted access during
+     * setup and will be demoted by xsm_set_system_active() when setup is
+     * complete.
+     */
+    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
     BUG_ON(IS_ERR(idle_domain));
     BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
     idle_domain->vcpu = idle_vcpu;
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 58afc1d589..3291fb5396 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -101,6 +101,23 @@ static always_inline int xsm_default_action(
     }
 }
 
+static XSM_INLINE int cf_check xsm_set_system_active(void)
+{
+    struct domain *d = current->domain;
+
+    ASSERT(d->is_privileged);
+
+    if ( d->domain_id != DOMID_IDLE )
+    {
+        printk("xsm_set_system_active: should only be called by idle domain\n");
+        return -EPERM;
+    }
+
+    d->is_privileged = false;
+
+    return 0;
+}
+
 static XSM_INLINE void cf_check xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 3e2b7fe3db..8dad03fd3d 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -52,6 +52,7 @@ typedef enum xsm_default xsm_default_t;
  * !!! WARNING !!!
  */
 struct xsm_ops {
+    int (*set_system_active)(void);
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
@@ -208,6 +209,11 @@ extern struct xsm_ops xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
+static inline int xsm_set_system_active(void)
+{
+    return alternative_call(xsm_ops.set_system_active);
+}
+
 static inline void xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8c044ef615..e6ffa948f7 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -14,6 +14,7 @@
 #include <xsm/dummy.h>
 
 static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
+    .set_system_active             = xsm_set_system_active,
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 0bf63ffa84..b93101191e 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -186,6 +186,28 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     return 0;
 }
 
+static int cf_check flask_set_system_active(void)
+{
+    struct domain *d = current->domain;
+
+    ASSERT(d->is_privileged);
+
+    if ( d->domain_id != DOMID_IDLE )
+    {
+        printk("xsm_set_system_active should only be called by idle domain\n");
+        return -EPERM;
+    }
+
+    /*
+     * While is_privileged has no significant meaning under flask, set to false
+     * as is_privileged is not only used for a privilege check but also as a type
+     * of domain check, specifically if the domain is the control domain.
+     */
+    d->is_privileged = false;
+
+    return 0;
+}
+
 static void cf_check flask_domain_free_security(struct domain *d)
 {
     struct domain_security_struct *dsec = d->ssid;
@@ -1766,6 +1788,7 @@ static int cf_check flask_argo_send(
 #endif
 
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
+    .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-- 
2.20.1


