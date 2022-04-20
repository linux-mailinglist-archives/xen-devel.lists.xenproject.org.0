Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53854508DE8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 19:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309508.525821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhDj9-0001HQ-MQ; Wed, 20 Apr 2022 17:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309508.525821; Wed, 20 Apr 2022 17:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhDj9-0001FP-Ie; Wed, 20 Apr 2022 17:02:51 +0000
Received: by outflank-mailman (input) for mailman id 309508;
 Wed, 20 Apr 2022 17:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhDj8-0000xW-BO
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 17:02:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b46a4f18-c0cb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 19:02:49 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650474158293185.54717793821146;
 Wed, 20 Apr 2022 10:02:38 -0700 (PDT)
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
X-Inumbo-ID: b46a4f18-c0cb-11ec-8fbf-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650474162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cp8o60aNK+qXKZNp6V3qPn+ET9lHf/J6rPUtLwd+WQXDlbX2lGYcKpD7GGCi4Vj4mRR6KgzgQN8p3oTpeaU5jGe0QHt2npXjNQ3noO3EMIP0zAdRR+dRk5i+Sm77cngzqvmrnNOS1JLvi6nFl2WQzEnPYMi9OeBhPtlttMu6jgM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650474162; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Y5VK/nn1NuDaRru49lx3xM09xnkVW4XL3YTrgNudhT0=; 
	b=fgMERb0mNbEE4pPJewta3ZKnDsoOY+Omf7GrYwjjEX8J37XLorqczWJW8cmHOLsBFkMyC7IAi4P2f8bwZENhvsybp3h/Sn1z1sdHHDv4xoSZwtR7U2ZwppJAilgQBFtclzTD3bNeNwC1+pf63DlckKWpaTgi2XKQYz2hnRG8SkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650474162;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Y5VK/nn1NuDaRru49lx3xM09xnkVW4XL3YTrgNudhT0=;
	b=ZXVpO3VTCyG3as2hfQhB324EdOezED4HtRzBuFlXa+zDdfZNlA8bSL+LBfT0EdLN
	6Js82YMGpYebDiS8KEA8SvhkctGDkN4l94taUGx55WCi73zgdJKvDA5wWyTMoO97QXK
	CWN7z0YLRHNxxaDFNtNMrvWDAVKWYQy9DPuagBOk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH 1/2] xsm: create idle domain privieged and demote after setup
Date: Wed, 20 Apr 2022 17:04:06 -0400
Message-Id: <20220420210407.18060-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220420210407.18060-1-dpsmith@apertussolutions.com>
References: <20220420210407.18060-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

There are now instances where internal hypervisor logic needs to make resource
allocation calls that are protectd by XSM checks. The internal hypervisor logic
is represented a number of system domains which by designed are represented by
non-privileged struct domain instances. To enable these logic blocks to
function correctly but in a controlled manner, this commit changes the idle
domain to be created as a privileged domain under the default policy, which is
inherited by the SILO policy, and demoted before transitioning to running. A
new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
type to demote the idle domain appropriately for that policy type.

For flask a stub is added to ensure that flask policy system will function
correctly with this patch until flask is extended with support for starting the
idle domain privileged and properly demoting it on the call to
xsm_transtion_running.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/setup.c    |  6 ++++++
 xen/arch/x86/setup.c    |  6 ++++++
 xen/common/sched/core.c |  7 ++++++-
 xen/include/xsm/dummy.h | 12 ++++++++++++
 xen/include/xsm/xsm.h   |  6 ++++++
 xen/xsm/dummy.c         |  1 +
 xen/xsm/flask/hooks.c   | 15 +++++++++++++++
 7 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..763835aeb5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1048,6 +1048,12 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
+    xsm_transition_running();
+
+    /* Ensure idle domain was not left privileged */
+    if ( current->domain->is_privileged )
+        panic("idle domain did not properly transition from setup privilege\n");
+
     system_state = SYS_STATE_active;
 
     for_each_domain( d )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f20e17892..72695dcb07 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -621,6 +621,12 @@ static void noreturn init_done(void)
     void *va;
     unsigned long start, end;
 
+    xsm_transition_running();
+
+    /* Ensure idle domain was not left privileged */
+    if ( current->domain->is_privileged )
+        panic("idle domain did not properly transition from setup privilege\n");
+
     system_state = SYS_STATE_active;
 
     domain_unpause_by_systemcontroller(dom0);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab678181..22a619e260 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
         sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
     }
 
-    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
+    /*
+     * idle dom is created privileged to ensure unrestricted access during
+     * setup and will be demoted by xsm_transition_running when setup is
+     * complete
+     */
+    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
     BUG_ON(IS_ERR(idle_domain));
     BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
     idle_domain->vcpu = idle_vcpu;
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 58afc1d589..b33f0ec672 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -101,6 +101,18 @@ static always_inline int xsm_default_action(
     }
 }
 
+static XSM_INLINE void cf_check xsm_transition_running(void)
+{
+    struct domain *d = current->domain;
+
+    if ( d->domain_id != DOMID_IDLE )
+        panic("xsm_transition_running should only be called by idle domain\n");
+
+    d->is_privileged = false;
+
+    return;
+}
+
 static XSM_INLINE void cf_check xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 3e2b7fe3db..a5c06804ab 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -52,6 +52,7 @@ typedef enum xsm_default xsm_default_t;
  * !!! WARNING !!!
  */
 struct xsm_ops {
+    void (*transition_running)(void);
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
@@ -208,6 +209,11 @@ extern struct xsm_ops xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
+static inline void xsm_transition_running(void)
+{
+    alternative_vcall(xsm_ops.transition_running);
+}
+
 static inline void xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 8c044ef615..66f26c6909 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -14,6 +14,7 @@
 #include <xsm/dummy.h>
 
 static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
+    .transition_running            = xsm_transition_running,
     .security_domaininfo           = xsm_security_domaininfo,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 0bf63ffa84..51c896d9f7 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -186,6 +186,20 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     return 0;
 }
 
+static void cf_check flask_domain_runtime_security(void)
+{
+    struct domain *d = current->domain;
+
+    if ( d->domain_id != DOMID_IDLE )
+        panic("xsm_transition_running should only be called by idle domain\n");
+
+    /*
+     * While is_privileged has no significant meaning under flask,
+     * set to false for the consistency check(s) in the setup code.
+     */
+    d->is_privileged = false;
+}
+
 static void cf_check flask_domain_free_security(struct domain *d)
 {
     struct domain_security_struct *dsec = d->ssid;
@@ -1766,6 +1780,7 @@ static int cf_check flask_argo_send(
 #endif
 
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
+    .transition_running = flask_domain_runtime_security,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-- 
2.20.1


