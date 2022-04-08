Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E384F9113
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 10:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301206.514047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckFR-0001zr-4w; Fri, 08 Apr 2022 08:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301206.514047; Fri, 08 Apr 2022 08:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckFQ-0001wn-SZ; Fri, 08 Apr 2022 08:45:40 +0000
Received: by outflank-mailman (input) for mailman id 301206;
 Fri, 08 Apr 2022 08:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zQ4=US=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nckFO-0000Ej-IT
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 08:45:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 42f136f1-b718-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 10:45:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C17831650;
 Fri,  8 Apr 2022 01:45:36 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 582933F73B;
 Fri,  8 Apr 2022 01:45:35 -0700 (PDT)
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
X-Inumbo-ID: 42f136f1-b718-11ec-a405-831a346695d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v6 6/6] xen/cpupool: Allow cpupool0 to use different scheduler
Date: Fri,  8 Apr 2022 09:45:17 +0100
Message-Id: <20220408084517.33082-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408084517.33082-1-luca.fancellu@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>

Currently cpupool0 can use only the default scheduler, and
cpupool_create has an hardcoded behavior when creating the pool 0
that doesn't allocate new memory for the scheduler, but uses the
default scheduler structure in memory.

With this commit it is possible to allocate a different scheduler for
the cpupool0 when using the boot time cpupool.
To achieve this the hardcoded behavior in cpupool_create is removed
and the cpupool0 creation is moved.

When compiling without boot time cpupools enabled, the current
behavior is maintained (except that cpupool0 scheduler memory will be
allocated).

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes in v6:
- Add R-by
Changes in v5:
- no changes
Changes in v4:
- no changes
Changes in v3:
- fix typo in commit message (Juergen)
- rebase changes
Changes in v2:
- new patch
---
 xen/common/boot_cpupools.c | 5 ++++-
 xen/common/sched/cpupool.c | 8 +-------
 xen/include/xen/sched.h    | 5 ++++-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/common/boot_cpupools.c b/xen/common/boot_cpupools.c
index 240bae4cebb8..5955e6f9a98b 100644
--- a/xen/common/boot_cpupools.c
+++ b/xen/common/boot_cpupools.c
@@ -205,8 +205,11 @@ void __init btcpupools_allocate_pools(void)
     if ( add_extra_cpupool )
         next_pool_id++;
 
+    /* Keep track of cpupool id 0 with the global cpupool0 */
+    cpupool0 = cpupool_create_pool(0, pool_sched_map[0]);
+
     /* Create cpupools with selected schedulers */
-    for ( i = 0; i < next_pool_id; i++ )
+    for ( i = 1; i < next_pool_id; i++ )
         cpupool_create_pool(i, pool_sched_map[i]);
 }
 
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 86a175f99cd5..83112f5f04d3 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -312,10 +312,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
         c->cpupool_id = q->cpupool_id + 1;
     }
 
-    if ( poolid == 0 )
-        c->sched = scheduler_get_default();
-    else
-        c->sched = scheduler_alloc(sched_id);
+    c->sched = scheduler_alloc(sched_id);
     if ( IS_ERR(c->sched) )
     {
         ret = PTR_ERR(c->sched);
@@ -1242,9 +1239,6 @@ static int __init cf_check cpupool_init(void)
 
     cpupool_hypfs_init();
 
-    cpupool0 = cpupool_create(0, 0);
-    BUG_ON(IS_ERR(cpupool0));
-    cpupool_put(cpupool0);
     register_cpu_notifier(&cpu_nfb);
 
     btcpupools_dtb_parse();
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b62315ad5e5d..e8f31758c058 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1185,7 +1185,10 @@ void btcpupools_dtb_parse(void);
 int btcpupools_get_domain_pool_id(const struct dt_device_node *node);
 
 #else /* !CONFIG_BOOT_TIME_CPUPOOLS */
-static inline void btcpupools_allocate_pools(void) {}
+static inline void btcpupools_allocate_pools(void)
+{
+    cpupool0 = cpupool_create_pool(0, -1);
+}
 static inline void btcpupools_dtb_parse(void) {}
 static inline unsigned int btcpupools_get_cpupool_id(unsigned int cpu)
 {
-- 
2.17.1


