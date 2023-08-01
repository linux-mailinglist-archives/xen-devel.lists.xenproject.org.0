Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5276BE69
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574496.899818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvr6-0008AF-SM; Tue, 01 Aug 2023 20:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574496.899818; Tue, 01 Aug 2023 20:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvr6-00088U-PH; Tue, 01 Aug 2023 20:20:32 +0000
Received: by outflank-mailman (input) for mailman id 574496;
 Tue, 01 Aug 2023 20:20:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvr5-0007tB-6f
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:20:31 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db082af5-30a8-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 22:20:29 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690921219023154.7244666059837;
 Tue, 1 Aug 2023 13:20:19 -0700 (PDT)
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
X-Inumbo-ID: db082af5-30a8-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690921221; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lNiYjknsKhksJuvxpu+1YL5h1k8mUf7MfDMTehx9xU9qY5ePFGqwxPnrerUsLBUENjnbLVykTx6E+3375JIzcLHVjrH1owt/cSAJx4+MsyWXAOYsyQ8QyOhYARJSdBcWS7hfpcs2IHDbWgZ0pPzTKoy12sj88af3NZYp1j/eQc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921221; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QxHgg6odiTfgWhhWOuj3R7wSlDiixIdY8mSDQ2Z3eHA=; 
	b=QxaM6Mozt3aw6tfNbgM0mdmi6SZMN2qq8JWlFgWqRoVslhpfCKnpUG/ju1IJ8IHddkjWz3pKHO9jlZ6yqU6s/BvvLgeOITobNtuGmvPmm+JYx7JaL4W1axtMW4kQXTeMnhZ6yUSd74Cmq86A25KWy88w6SpnkfXs7KLG9/tpICQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921221;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=QxHgg6odiTfgWhhWOuj3R7wSlDiixIdY8mSDQ2Z3eHA=;
	b=JENP3hnykOC520uj6z57yLCmOzl6QU/5aI46l4vND4WKa2l/AGeUazOqIK8Vtu6y
	MapOgQvnxH7eaGAvDTmUhJDP+KGAsizdabjmyucONUw15X0hwzYwxdOfkJHLBZsU9aj
	hpPLkJScrv/frwb24yryVd6pgxcf0S297t3YL7CE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	xen-devel@dornerworks.com
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC 1/6] dom0: replace explict zero checks
Date: Tue,  1 Aug 2023 16:20:01 -0400
Message-Id: <20230801202006.20322-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230801202006.20322-1-dpsmith@apertussolutions.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A legacy concept is that the initial domain will have a domain id of zero. As a
result there are places where a check that a domain is the inital domain is
determined by an explicit check that the domid is zero.

This commit seeks to abstract this check into a function call and replace all
check locations with the function call.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/domain.c         | 4 ++--
 xen/common/sched/arinc653.c | 2 +-
 xen/common/sched/core.c     | 4 ++--
 xen/include/xen/sched.h     | 7 +++++++
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 304aa04fa6..8fb3c052f5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -309,7 +309,7 @@ static int late_hwdom_init(struct domain *d)
     struct domain *dom0;
     int rv;
 
-    if ( d != hardware_domain || d->domain_id == 0 )
+    if ( d != hardware_domain || is_initial_domain(d) )
         return 0;
 
     rv = xsm_init_hardware_domain(XSM_HOOK, d);
@@ -612,7 +612,7 @@ struct domain *domain_create(domid_t domid,
     d->is_privileged = flags & CDF_privileged;
 
     /* Sort out our idea of is_hardware_domain(). */
-    if ( domid == 0 || domid == hardware_domid )
+    if ( is_initial_domain(d) || domid == hardware_domid )
     {
         if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
             panic("The value of hardware_dom must be a valid domain ID\n");
diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index a82c0d7314..31e8270af3 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -404,7 +404,7 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
      * Add every one of dom0's units to the schedule, as long as there are
      * slots available.
      */
-    if ( unit->domain->domain_id == 0 )
+    if ( is_initial_domain(unit->domain) )
     {
         entry = sched_priv->num_schedule_entries;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 022f548652..210ad30f94 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -585,7 +585,7 @@ int sched_init_vcpu(struct vcpu *v)
          */
         sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
     }
-    else if ( d->domain_id == 0 && opt_dom0_vcpus_pin )
+    else if ( is_initial_domain(d) && opt_dom0_vcpus_pin )
     {
         /*
          * If dom0_vcpus_pin is specified, dom0 vCPUs are pinned 1:1 to
@@ -594,7 +594,7 @@ int sched_init_vcpu(struct vcpu *v)
         sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
     }
 #ifdef CONFIG_X86
-    else if ( d->domain_id == 0 )
+    else if ( is_initial_domain(d) )
     {
         /*
          * In absence of dom0_vcpus_pin instead, the hard and soft affinity of
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 854f3e32c0..a9276a7bed 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1058,6 +1058,13 @@ void scheduler_disable(void);
 void watchdog_domain_init(struct domain *d);
 void watchdog_domain_destroy(struct domain *d);
 
+static always_inline bool is_initial_domain(const struct domain *d)
+{
+    static int init_domain_id = 0;
+
+    return d->domain_id == init_domain_id;
+}
+
 /*
  * Use this check when the following are both true:
  *  - Using this feature or interface requires full access to the hardware
-- 
2.20.1


