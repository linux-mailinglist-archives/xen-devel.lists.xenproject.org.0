Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161247BF40
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 13:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250357.431236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdqN-00079t-E5; Tue, 21 Dec 2021 12:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250357.431236; Tue, 21 Dec 2021 12:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdqN-00076k-AN; Tue, 21 Dec 2021 12:02:11 +0000
Received: by outflank-mailman (input) for mailman id 250357;
 Tue, 21 Dec 2021 12:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mzdqL-0006Z5-Ns
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 12:02:09 +0000
Received: from sender3-of-o52.zoho.com (sender3-of-o52.zoho.com
 [136.143.184.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d19ab600-6255-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 13:02:08 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1640088122395554.9994111950763;
 Tue, 21 Dec 2021 04:02:02 -0800 (PST)
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
X-Inumbo-ID: d19ab600-6255-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1640088125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bVQHV84+eEbxqyAIAi5E57ct7F3UVov5ISNnKujLkWO/EqTZg/6uPhYFvyYIiirH6thLIPmT1JFTc/g0SisjnR59u8Rh7LIykYGTMEJLa36TwBdyRK5AFZFJMlSwtFYkKQnypc/+u5ZDoisisXJEovKXybGSgIMJQ0vZXhOeA+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1640088125; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=fi3gGm7Y+029vmS8qO8YIbyW9eyKb6e7iEZI773KNyA=; 
	b=dbvGVXsXEZkA25Nom95g+WqnbZ4VT4KFZpNc+o92W+sVJJu7m8kz4ZbkIuckqi+QA+BDxba74EGcFe/qVNGZACwjQ/XigrgV4g71Omk+b5/yUHFGII8XWx1Jjc9wFzNk/zigT9qhno0QunmF3xK//pXsgMbGMuooZlRfGmpeFD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1640088125;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=fi3gGm7Y+029vmS8qO8YIbyW9eyKb6e7iEZI773KNyA=;
	b=FBMIhF0lb+76Zt5HHkT6nBKo66GD6g7uXCxOed6Uv117XxNpNNboY88i1wVHVGsM
	Qn2nslNm80dFmgyXq1+axZ9NZEDfuuiSDP2DZUV4NMaeWMpoQlb0AQvkrtb+8Y80ZCi
	dXpM1I17xEwNeQY9RlUR4YuChmwIO3EpeKOvZ3lw=
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
Subject: [PATCH v4] is_system_domain: replace open-coded instances
Date: Tue, 21 Dec 2021 11:04:44 -0500
Message-Id: <20211221160444.30890-1-dpsmith@apertussolutions.com>
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
index 28146ee404..cd575d01cf 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -613,9 +613,14 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
 #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
 #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
 
+static inline bool is_system_domid(domid_t id)
+{
+    return id >= DOMID_FIRST_RESERVED;
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


