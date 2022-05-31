Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A187D539372
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339716.564615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3KW-0007yl-UM; Tue, 31 May 2022 14:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339716.564615; Tue, 31 May 2022 14:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3KW-0007wR-R3; Tue, 31 May 2022 14:58:44 +0000
Received: by outflank-mailman (input) for mailman id 339716;
 Tue, 31 May 2022 14:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw3KV-0007f3-3N
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:58:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286a185d-e0f2-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 16:58:42 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654009111682798.9130906503007;
 Tue, 31 May 2022 07:58:31 -0700 (PDT)
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
X-Inumbo-ID: 286a185d-e0f2-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654009113; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YUq6ctigvBfOFQocfDkaVCXnaCsiLGi1NtAIc08oHwJZN5sSNK/nW2q6IgijaY47jP2wnfFdGVuKkzcouR3XsR1D/qOvDNJ134RRsb8AgeCJL9dl/0eGuZnlRzLbPO6K8Fv5FFI9ic9hxNjr0uXinnOW4ysvMdCIqMo7WK1PV/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654009113; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ks2c7JaIJxWCU/pu9Stk/4/VXT5nNoOMHKXZhTnoHIc=; 
	b=g4sug2uJ6cswralN2qgQpUzHr9VauB/nfv77m+ZscOsg3n9ZL0x/GIAMxsRX4TLX4Ley6hmOdaU3dlILoVjGXdzUFgbwk9OvzpnLZbRmci17+AEMCMuHdVAam1P++tp6MBHPlH3SClkf/Dpi7UQo1nlC4CwU1iyRA4MuY4Ioc1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654009113;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=Ks2c7JaIJxWCU/pu9Stk/4/VXT5nNoOMHKXZhTnoHIc=;
	b=orLya5kkb1Ph0mqzCb0XVuJbq6h8GBoIGkiJq4t2MSrqZzRGbgOtSJm4fCymaYDA
	3/9+ScLKRyi6deScCHPdvQ5bMvRa6wbMRYdlEa8CpM1T0zyMlLROqOJhIgvR71d6vJr
	UFfHhPGow4KCuhh1/W8YXIUZtFDf8e2WqlczYJ8w=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v8 1/2] xsm: create idle domain privileged and demote after setup
Date: Tue, 31 May 2022 10:56:45 -0400
Message-Id: <20220531145646.10062-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531145646.10062-1-dpsmith@apertussolutions.com>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
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
index d5d0792ed4..6b88320588 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
+    if ( (rc = xsm_set_system_active()) != 0 )
+        panic("xsm: unable to switch to SYSTEM_ACTIVE privilege: %d\n", rc);
+
     system_state = SYS_STATE_active;
 
     for_each_domain( d )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6f20e17892..962da03f80 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -620,6 +620,10 @@ static void noreturn init_done(void)
 {
     void *va;
     unsigned long start, end;
+    int err;
+
+    if ( (err = xsm_set_system_active()) != 0 )
+        panic("xsm: unable to switch to SYSTEM_ACTIVE privilege: %d\n", err);
 
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
index 0bf63ffa84..06ca4e7a91 100644
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
@@ -1766,6 +1788,7 @@ static int cf_check flask_argo_send(
 #endif
 
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
+    .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
-- 
2.20.1


