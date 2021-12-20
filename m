Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C047A9AC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 13:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249782.430190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHkF-0004YD-6f; Mon, 20 Dec 2021 12:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249782.430190; Mon, 20 Dec 2021 12:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHkF-0004WA-2h; Mon, 20 Dec 2021 12:26:23 +0000
Received: by outflank-mailman (input) for mailman id 249782;
 Mon, 20 Dec 2021 12:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mzHkD-0004W4-5u
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 12:26:21 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 084a1642-6190-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 13:26:19 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1640003174372547.9730149426596;
 Mon, 20 Dec 2021 04:26:14 -0800 (PST)
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
X-Inumbo-ID: 084a1642-6190-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1640003175; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h5QG/f6FdbGkDmCKZ9cgDGepgdD0ozJW+DayZ87UUIQkOSPdJlE/iFSue0lWcW7i833xY2mJ0Yk07AoeUy+H7GNzcGRJH8qsIYHagFyMG8NK11jA0qPdKdIOm94Hz62llKzhyJhRHVgmXbnR7GROEtBnFa2JWR1gfsL2lpdoeGE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1640003175; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=wfNf9AYcu5cI6Pjc5sAav3xuf03fkML/AM4sJnjWfjw=; 
	b=h2U3T+c73OdaoinCFA912h8jiTE6DY7zX504FmMVT5ACrWWwu5csohZHTnK4s/JsG8iATMr8+9VxccdXRHPkJg1p5SgDmld8WVt3AZHRXrxnpz5WRRi/2+/wyqvt7NQUZMeriR+/C6w2YHupeqHmgK/c1u6WAbbhwZXlb4U4EXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1640003175;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=wfNf9AYcu5cI6Pjc5sAav3xuf03fkML/AM4sJnjWfjw=;
	b=jJwIHg71GPmaPho4yfVmktUy4rEW1FWzbhRo1NRdKNPyR1x6w8gLx7u+mYW+LMIS
	z1D4BFZA0sYHP4Y2nXaDvLVR9Cp53ha9EBJGZAoFO1Z6QUrEhdds8SUBQc0PQuKwf4M
	PY3z67QtuDFCG7irCwaYj2d6VUgfT7RLFnlje+Ts=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] is_system_domain: replace open-coded instances
Date: Mon, 20 Dec 2021 11:28:53 -0500
Message-Id: <20211220162853.10603-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Christopher Clark <christopher.w.clark@gmail.com>

This is a split out of the hyperlaunch dom0 series.

There were several instances of open-coded domid range checking. This commit
replaces those with the is_system_domain or is_system_domid inline function.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Dario Faggioli <dfaggioli@suse.com>
---
 xen/arch/x86/cpu/mcheck/mce.c | 2 +-
 xen/arch/x86/cpu/vpmu.c       | 2 +-
 xen/common/domain.c           | 2 +-
 xen/common/domctl.c           | 4 ++--
 xen/common/sched/core.c       | 4 ++--
 xen/include/xen/sched.h       | 7 ++++++-
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 7f433343bc..5c1df39075 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1518,7 +1518,7 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
             d = rcu_lock_domain_by_any_id(mc_msrinject->mcinj_domid);
             if ( d == NULL )
             {
-                if ( mc_msrinject->mcinj_domid >= DOMID_FIRST_RESERVED )
+                if ( is_system_domid(mc_msrinject->mcinj_domid) )
                     return x86_mcerr("do_mca inject: incompatible flag "
                                      "MC_MSRINJ_F_GPADDR with domain %d",
                                      -EINVAL, domid);
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 8ec4547bed..c6bfa5a00e 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -188,7 +188,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
      * in XENPMU_MODE_ALL, for everyone.
      */
     if ( (vpmu_mode & XENPMU_MODE_ALL) ||
-         (sampled->domain->domain_id >= DOMID_FIRST_RESERVED) )
+         is_system_domain(sampled->domain) )
     {
         sampling = choose_hwdom_vcpu();
         if ( !sampling )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 093bb4403f..347cc073aa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -583,7 +583,7 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_hardware_domain(). */
     if ( domid == 0 || domid == hardware_domid )
     {
-        if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
+        if ( hardware_domid < 0 || is_system_domid(hardware_domid) )
             panic("The value of hardware_dom must be a valid domain ID\n");
 
         old_hwdom = hardware_domain;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 879a2adcbe..a3ad1f62b6 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -52,7 +52,7 @@ static inline int is_free_domid(domid_t dom)
 {
     struct domain *d;
 
-    if ( dom >= DOMID_FIRST_RESERVED )
+    if ( is_system_domid(dom) )
         return 0;
 
     if ( (d = rcu_lock_domain_by_id(dom)) == NULL )
@@ -536,7 +536,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( !d )
         {
             ret = -EINVAL;
-            if ( op->domain >= DOMID_FIRST_RESERVED )
+            if ( is_system_domid(op->domain) )
                 break;
 
             rcu_read_lock(&domlist_read_lock);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..6ea8bcf62f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -821,7 +821,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
     int ret;
 
     ASSERT(d->cpupool == NULL);
-    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
+    ASSERT(!is_system_domain(d));
 
     if ( (ret = cpupool_add_domain(d, poolid)) )
         return ret;
@@ -845,7 +845,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
 
 void sched_destroy_domain(struct domain *d)
 {
-    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
+    ASSERT(!is_system_domain(d));
 
     if ( d->cpupool )
     {
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404..0df72baf2e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -613,9 +613,14 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
 #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
 #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
 
+static inline bool is_system_domid(domid_t id)
+{
+    return (id >= DOMID_FIRST_RESERVED);
+}
+
 static inline bool is_system_domain(const struct domain *d)
 {
-    return d->domain_id >= DOMID_FIRST_RESERVED;
+    return is_system_domid(d->domain_id);
 }
 
 #define DOMAIN_DESTROYED (1u << 31) /* assumes atomic_t is >= 32 bits */
-- 
2.20.1


