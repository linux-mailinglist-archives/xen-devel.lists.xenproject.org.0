Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2C58708C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 20:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379030.612304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIaUF-0001Ze-Pf; Mon, 01 Aug 2022 18:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379030.612304; Mon, 01 Aug 2022 18:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIaUF-0001Xc-Ka; Mon, 01 Aug 2022 18:49:55 +0000
Received: by outflank-mailman (input) for mailman id 379030;
 Mon, 01 Aug 2022 18:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvEX=YF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oIaUD-0001HC-T9
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 18:49:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b993c8fe-11ca-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 20:49:52 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1659379780263279.82479886226827;
 Mon, 1 Aug 2022 11:49:40 -0700 (PDT)
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
X-Inumbo-ID: b993c8fe-11ca-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1659379785; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mie+QNw3tw5TnxhdWrG/p2uk5jrUanzZ0YMZc/paAI9lkcZoWcVzikjAGNUTWouz50TDZS78X9Xphmj2XIGYv3VYcb2nA+p5cEX5j/TLCDlPTrVWfczcBhpObHRd4xl4N3QK+jbyeerOksc0CdMrPM9ZSl8L+ZX5USEv2e1o0DU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659379785; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5Ty85HsajPA+R434u8DJBEiLXdypLYNOpYAB9hFvXvo=; 
	b=RiaRXRKY8UMOzxSEA8cn+rw9GI7wK3AiuEWnarPN2hgjDoUiRlgzz1WC5BKE0u5WMhWfRhPIJHvCf/orqHPda1N8BOMr52k9b8s5fPi5tiCqiLrw3k3Qc5fC1FaiIsYaTNIs8jJ+DDR6MpfOtqckC5pbXzSopvGYJ401fFkD/vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659379785;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=5Ty85HsajPA+R434u8DJBEiLXdypLYNOpYAB9hFvXvo=;
	b=riFy6BHh/ho68y/c4Z43+ypH9qLotM5U3DE3iiriae4NT3lIGxt90jTOZSkewZYz
	oHMPnzY7+Ec8BhHWYgYwYekMLsIIEIBhSN5dxCsPl9bPlDLZ1i41Mu8NU5TifxoCEUL
	qzdq6xTzwE6oEBD+iTLJY9bPkv4inw6wLe7FoddA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com,
	Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>,
	Rahul Singh <rahul.singh@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v10 1/3] xsm: create idle domain privileged and demote after setup
Date: Mon,  1 Aug 2022 14:49:26 -0400
Message-Id: <20220801184928.28522-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220801184928.28522-1-dpsmith@apertussolutions.com>
References: <20220801184928.28522-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

There are new capabilities, dom0less and hyperlaunch, that introduce internal
hypervisor logic, which needs to make resource allocation calls that are
protected by XSM access checks. The need for these resource allocations are
necessary for dom0less and hyperlaunch when they are constructing the initial
domain(s).  This creates an issue as a subset of the hypervisor code is
executed under a system domain, the idle domain, that is represented by a
per-CPU non-privileged struct domain. To enable these new capabilities to
function correctly but in a controlled manner, this commit changes the idle
system domain to be created as a privileged domain under the default policy and
demoted before transitioning to running. A new XSM hook,
xsm_set_system_active(), is introduced to allow each XSM policy type to demote
the idle domain appropriately for that policy type. In the case of SILO, it
inherits the default policy's hook for xsm_set_system_active().

For flask, a stub is added to ensure that flask policy system will function
correctly with this patch until flask is extended with support for starting the
idle domain privileged and properly demoting it on the call to
xsm_set_system_active().

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com> # arm
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/setup.c    |  3 +++
 xen/arch/x86/setup.c    |  4 ++++
 xen/common/sched/core.c |  7 ++++++-
 xen/include/xsm/dummy.h | 17 +++++++++++++++++
 xen/include/xsm/xsm.h   |  6 ++++++
 xen/xsm/dummy.c         |  1 +
 xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
 7 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 577c54e6fb..85ff956ec2 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1063,6 +1063,9 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
+    if ( (rc = xsm_set_system_active()) != 0 )
+        panic("xsm: unable to switch to SYSTEM_ACTIVE privilege: %d\n", rc);
+
     system_state = SYS_STATE_active;
 
     for_each_domain( d )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 53a73010e0..f08b07b8de 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -619,6 +619,10 @@ static void noreturn init_done(void)
 {
     void *va;
     unsigned long start, end;
+    int err;
+
+    if ( (err = xsm_set_system_active()) != 0 )
+        panic("xsm: unable to switch to SYSTEM_ACTIVE privilege: %d\n", err);
 
     system_state = SYS_STATE_active;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8c73489654..250207038e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3033,7 +3033,12 @@ void __init scheduler_init(void)
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
index 58afc1d589..77f27e7163 100644
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
+        printk("%s: should only be called by idle domain\n", __func__);
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
index 6ffafc2f44..c97c44f803 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -191,6 +191,28 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
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
+        printk("%s: should only be called by idle domain\n", __func__);
+        return -EPERM;
+    }
+
+    /*
+     * While is_privileged has no significant meaning under flask, set to false
+     * as is_privileged is not only used for a privilege check but also as a
+     * type of domain check, specifically if the domain is the control domain.
+     */
+    d->is_privileged = false;
+
+    return 0;
+}
+
 static void cf_check flask_domain_free_security(struct domain *d)
 {
     struct domain_security_struct *dsec = d->ssid;
@@ -1774,6 +1796,7 @@ static int cf_check flask_argo_send(
 #endif
 
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
+    .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-- 
2.20.1


