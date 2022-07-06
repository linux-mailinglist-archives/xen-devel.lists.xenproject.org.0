Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906A569424
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362590.592721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPo-000535-6D; Wed, 06 Jul 2022 21:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362590.592721; Wed, 06 Jul 2022 21:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPo-0004yW-1a; Wed, 06 Jul 2022 21:18:32 +0000
Received: by outflank-mailman (input) for mailman id 362590;
 Wed, 06 Jul 2022 21:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CGG-0003HV-Co
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:08:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd49b360-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:08:38 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141524647778.2526648624945;
 Wed, 6 Jul 2022 14:05:24 -0700 (PDT)
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
X-Inumbo-ID: cd49b360-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141526; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ivE0OgVasNv4eQ+byR5QWn20FbxaTUDbvjSFp7QK60cmoGErPzReroOliZ9dJcNo86nEzImdvkYHcLeQ0EE0i1mSC+sV3+welJ69edQhlqkuWydJEsg5xLd3xUZQIgk14bAKHFrXRu+zAnbD8+IGLihswPX/kGwE3g4q0tIt6yI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141526; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xIVNnCOl//0NwdRtYGKxNcLBDp2Qsryi1rBCkz4SStc=; 
	b=NA5wwh6pTJaDIIYy6/E83Uv31PZFM7t/rjQcadECB5i4Fq1axnrHw49ObNlvXOPSxIFb3mOhgOR8VQWjEuhO1pPtuNdnTfYlCL0zqceDXJ9lPYIKIzzQNIH4Q1yxwnEZk++DsYLNu1/s0ySsi2lrBRh4kDRgoQS46Phh23O9HRY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141526;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xIVNnCOl//0NwdRtYGKxNcLBDp2Qsryi1rBCkz4SStc=;
	b=AY9KKnkB06vn++m9x/9zLYHd04WXgZAGqZVmnQ120S7oQnhomKvMFWSSjhgdbGpM
	4/+eyN9pEsyGzggIhX87IaIalNJlNIcUsdiQxA9WX8zTZgxlJnoXL+xBgh1maiQTWsi
	KvkpJF7h01BHXVVCBlJcogr1xHvhR1pzIRRtXrnA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v1 14/18] x86: generalize vcpu for domain building
Date: Wed,  6 Jul 2022 17:04:49 -0400
Message-Id: <20220706210454.30096-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Here, the vcpu initialization code for dom0 creation is generalized for use for
other domains.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/domain_builder.c | 14 +++++++++++++-
 xen/arch/x86/hvm/dom0_build.c |  7 ++++---
 xen/arch/x86/pv/dom0_build.c  |  2 +-
 xen/common/sched/core.c       | 25 ++++++++++++++++---------
 xen/include/xen/sched.h       |  3 ++-
 5 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain_builder.c b/xen/arch/x86/domain_builder.c
index 308e1a1c67..1a4a6b1ca7 100644
--- a/xen/arch/x86/domain_builder.c
+++ b/xen/arch/x86/domain_builder.c
@@ -28,6 +28,18 @@ static unsigned int __init dom_max_vcpus(struct boot_domain *bd)
         return bd->ncpus;
 }
 
+struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
+{
+    if ( bd->functions & BUILD_FUNCTION_INITIAL_DOM )
+        return alloc_dom0_vcpu0(bd->domain);
+
+    bd->domain->node_affinity = node_online_map;
+    bd->domain->auto_node_affinity = true;
+
+    return vcpu_create(bd->domain, 0);
+}
+
+
 void __init arch_create_dom(
     const struct boot_info *bi, struct boot_domain *bd)
 {
@@ -83,7 +95,7 @@ void __init arch_create_dom(
 
     init_dom0_cpuid_policy(bd->domain);
 
-    if ( alloc_dom0_vcpu0(bd->domain) == NULL )
+    if ( alloc_dom_vcpu0(bd) == NULL )
         panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2fee2ed926..ae3ffc614d 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -696,9 +696,10 @@ static int __init pvh_load_kernel(
     return 0;
 }
 
-static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
+static int __init pvh_setup_cpus(struct boot_domain *bd, paddr_t entry,
                                  paddr_t start_info)
 {
+    struct domain *d = bd->domain;
     struct vcpu *v = d->vcpu[0];
     int rc;
     /*
@@ -722,7 +723,7 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
         .cpu_regs.x86_32.tr_ar = 0x8b,
     };
 
-    sched_setup_dom0_vcpus(d);
+    sched_setup_dom_vcpus(bd);
 
     rc = arch_set_info_hvm_guest(v, &cpu_ctx);
     if ( rc )
@@ -1257,7 +1258,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
-    rc = pvh_setup_cpus(d, entry, start_info);
+    rc = pvh_setup_cpus(bd, entry, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 CPUs: %d\n", rc);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f1ea0575f0..9d1c9fb8b0 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -729,7 +729,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
 
     printk("Dom%u has maximum %u VCPUs\n", d->domain_id, d->max_vcpus);
 
-    sched_setup_dom0_vcpus(d);
+    sched_setup_dom_vcpus(bd);
 
     d->arch.paging.mode = 0;
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 250207038e..029f5ea24e 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -14,6 +14,8 @@
  */
 
 #ifndef COMPAT
+#include <xen/bootdomain.h>
+#include <xen/domain_builder.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
@@ -3399,13 +3401,13 @@ void wait(void)
 }
 
 #ifdef CONFIG_X86
-void __init sched_setup_dom0_vcpus(struct domain *d)
+void __init sched_setup_dom_vcpus(struct boot_domain *bd)
 {
     unsigned int i;
     struct sched_unit *unit;
 
-    for ( i = 1; i < d->max_vcpus; i++ )
-        vcpu_create(d, i);
+    for ( i = 1; i < bd->domain->max_vcpus; i++ )
+        vcpu_create(bd->domain, i);
 
     /*
      * PV-shim: vcpus are pinned 1:1.
@@ -3413,19 +3415,24 @@ void __init sched_setup_dom0_vcpus(struct domain *d)
      * onlining them. This avoids pinning a vcpu to a not yet online cpu here.
      */
     if ( pv_shim )
-        sched_set_affinity(d->vcpu[0]->sched_unit,
+        sched_set_affinity(bd->domain->vcpu[0]->sched_unit,
                            cpumask_of(0), cpumask_of(0));
     else
     {
-        for_each_sched_unit ( d, unit )
+        for_each_sched_unit ( bd->domain, unit )
         {
-            if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
-                sched_set_affinity(unit, &dom0_cpus, NULL);
-            sched_set_affinity(unit, NULL, &dom0_cpus);
+            if ( builder_is_initdom(bd) )
+            {
+                if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
+                    sched_set_affinity(unit, &dom0_cpus, NULL);
+                sched_set_affinity(unit, NULL, &dom0_cpus);
+            }
+            else
+                sched_set_affinity(unit, NULL, cpupool_valid_cpus(cpupool0));
         }
     }
 
-    domain_update_node_affinity(d);
+    domain_update_node_affinity(bd->domain);
 }
 #endif
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b9515eb497..6ab7d69cbd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -2,6 +2,7 @@
 #ifndef __SCHED_H__
 #define __SCHED_H__
 
+#include <xen/bootdomain.h>
 #include <xen/types.h>
 #include <xen/spinlock.h>
 #include <xen/rwlock.h>
@@ -1003,7 +1004,7 @@ static inline bool sched_has_urgent_vcpu(void)
 }
 
 void vcpu_set_periodic_timer(struct vcpu *v, s_time_t value);
-void sched_setup_dom0_vcpus(struct domain *d);
+void sched_setup_dom_vcpus(struct boot_domain *d);
 int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t reason);
 int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
 void restore_vcpu_affinity(struct domain *d);
-- 
2.20.1


