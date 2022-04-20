Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC8F5092D2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 00:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309629.526016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhIoj-0004Qz-JB; Wed, 20 Apr 2022 22:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309629.526016; Wed, 20 Apr 2022 22:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhIoj-0004Oz-FU; Wed, 20 Apr 2022 22:28:57 +0000
Received: by outflank-mailman (input) for mailman id 309629;
 Wed, 20 Apr 2022 22:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhIoi-00048L-Du
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 22:28:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b9e4f9-c0f9-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 00:28:55 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650493727255817.7561172280812;
 Wed, 20 Apr 2022 15:28:47 -0700 (PDT)
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
X-Inumbo-ID: 42b9e4f9-c0f9-11ec-8fbf-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650493728; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EFEPSu5yJSYhRf8ENJBUS8f5prO7/JETT4r+LoFYW8WccbaIxd7DJvXhK1YlIczlyL0m5Yet9hnwvg/Vrdi8AMIa8FBfoC2n7DaVnukArja/C/vLL7v55NGx2Sxvrzt6XBQLxCG4bDqOEGGeKq4uM5MQ4OLP30gR2Vunuvjd9cY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650493728; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TRSJFXRMakYmWB2kJyW8tPNfqEyszLPKpOq9/CBWGkU=; 
	b=WhANJIJdQwNjMjbGCa+if9sMxUNqTg5KFUpqYrxMNZyqEAZMS0BbaOzavr481OVVAkGsXYl2GSFnh4WqGCDro07uSrnoUi0/JWWGOheIlt63qQlU8QR17v8KxuSDmfQVCszpAVi84T3edAP6u7rnRjFy/0Dn7J7WVIy+rMnA1kc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650493728;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TRSJFXRMakYmWB2kJyW8tPNfqEyszLPKpOq9/CBWGkU=;
	b=CUNip+k1w4bg7wufpzBWHcLNqDqUL+XptA2Oe56QXy2J2CFRZhOPSckTBE9XPM/6
	sQfI+mYbQllWmdf2j7vgct8oFITpbkXnO8XqIqPz4asUUcOgC2dFlaYiH1YjAPFpPCP
	vEc8OoYL/uqBKhOy+eaR8f4XSj0fpHrv6y92te1U=
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
Subject: [PATCH v2 1/2] xsm: create idle domain privieged and demote after setup
Date: Wed, 20 Apr 2022 18:28:33 -0400
Message-Id: <20220420222834.5478-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220420222834.5478-1-dpsmith@apertussolutions.com>
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
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
index 0bf63ffa84..decebc8231 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -186,6 +186,20 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
     return 0;
 }
 
+static void cf_check flask_transition_running(void)
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
+    .transition_running = flask_transition_running,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-- 
2.20.1


