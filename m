Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D014DDCCA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 16:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292103.496066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVEUI-0001zd-EI; Fri, 18 Mar 2022 15:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292103.496066; Fri, 18 Mar 2022 15:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVEUI-0001tF-9P; Fri, 18 Mar 2022 15:25:58 +0000
Received: by outflank-mailman (input) for mailman id 292103;
 Fri, 18 Mar 2022 15:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNnc=T5=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nVEUH-0001kl-Am
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 15:25:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b49b473d-a6cf-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 16:25:56 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B0021576;
 Fri, 18 Mar 2022 08:25:55 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A9AF3F7D7;
 Fri, 18 Mar 2022 08:25:53 -0700 (PDT)
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
X-Inumbo-ID: b49b473d-a6cf-11ec-8eba-a37418f5ba1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/6] xen/sched: create public function for cpupools creation
Date: Fri, 18 Mar 2022 15:25:37 +0000
Message-Id: <20220318152541.7460-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318152541.7460-1-luca.fancellu@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>

Create new public function to create cpupools, can take as parameter
the scheduler id or a negative value that means the default Xen
scheduler will be used.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v3:
- Fixed comment (Andrew)
Changes in v2:
- cpupool_create_pool doesn't check anymore for pool id uniqueness
  before calling cpupool_create. Modified commit message accordingly
---
 xen/common/sched/cpupool.c | 15 +++++++++++++++
 xen/include/xen/sched.h    | 16 ++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index a6da4970506a..89a891af7076 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1219,6 +1219,21 @@ static void cpupool_hypfs_init(void)
 
 #endif /* CONFIG_HYPFS */
 
+struct cpupool *__init cpupool_create_pool(unsigned int pool_id, int sched_id)
+{
+    struct cpupool *pool;
+
+    if ( sched_id < 0 )
+        sched_id = scheduler_get_default()->sched_id;
+
+    pool = cpupool_create(pool_id, sched_id);
+
+    BUG_ON(IS_ERR(pool));
+    cpupool_put(pool);
+
+    return pool;
+}
+
 static int __init cf_check cpupool_init(void)
 {
     unsigned int cpu;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 10ea969c7af9..415b939ba8ae 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1145,6 +1145,22 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
 unsigned int cpupool_get_id(const struct domain *d);
 const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);
+
+/*
+ * cpupool_create_pool - Creates a cpupool
+ * @pool_id: id of the pool to be created
+ * @sched_id: id of the scheduler to be used for the pool
+ *
+ * Creates a cpupool with pool_id id.
+ * The sched_id parameter identifies the scheduler to be used, if it is
+ * negative, the default scheduler of Xen will be used.
+ *
+ * returns:
+ *     pointer to the struct cpupool just created, or Xen will panic in case of
+ *     error
+ */
+struct cpupool *cpupool_create_pool(unsigned int pool_id, int sched_id);
+
 extern void cf_check dump_runq(unsigned char key);
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
-- 
2.17.1


