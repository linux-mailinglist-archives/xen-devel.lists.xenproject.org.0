Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966F4B6903
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272922.467939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusS-0003UF-Ps; Tue, 15 Feb 2022 10:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272922.467939; Tue, 15 Feb 2022 10:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusS-0003Qj-LP; Tue, 15 Feb 2022 10:16:08 +0000
Received: by outflank-mailman (input) for mailman id 272922;
 Tue, 15 Feb 2022 10:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nJusQ-0002aj-Jf
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:16:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4894bf6c-8e48-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 11:16:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 772011424;
 Tue, 15 Feb 2022 02:16:04 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B9473F66F;
 Tue, 15 Feb 2022 02:16:03 -0800 (PST)
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
X-Inumbo-ID: 4894bf6c-8e48-11ec-b215-9bbe72dcb22c
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] xen/sched: create public function for cpupools creation
Date: Tue, 15 Feb 2022 10:15:48 +0000
Message-Id: <20220215101551.23101-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220215101551.23101-1-luca.fancellu@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>

Create new public function to create cpupools, it checks for pool id
uniqueness before creating the pool and can take a scheduler id or
a negative value that means the default Xen scheduler will be used.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/common/sched/cpupool.c | 26 ++++++++++++++++++++++++++
 xen/include/xen/sched.h    | 17 +++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 8c6e6eb9ccd5..4da12528d6b9 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1218,6 +1218,32 @@ static void cpupool_hypfs_init(void)
 
 #endif /* CONFIG_HYPFS */
 
+struct cpupool *__init cpupool_create_pool(unsigned int pool_id, int sched_id)
+{
+    struct cpupool *pool;
+
+    ASSERT(!spin_is_locked(&cpupool_lock));
+
+    spin_lock(&cpupool_lock);
+    /* Check if a cpupool with pool_id exists */
+    pool = __cpupool_find_by_id(pool_id, true);
+    spin_unlock(&cpupool_lock);
+
+    /* Pool exists, return an error */
+    if ( pool )
+        return NULL;
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
 static int __init cpupool_init(void)
 {
     unsigned int cpu;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f78cc4c4c9..a50df1bccdc0 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1145,6 +1145,23 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
 unsigned int cpupool_get_id(const struct domain *d);
 const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);
+
+/*
+ * cpupool_create_pool - Creates a cpupool
+ * @pool_id: id of the pool to be created
+ * @sched_id: id of the scheduler to be used for the pool
+ *
+ * Creates a cpupool with pool_id id, the id must be unique and the function
+ * will return an error if the pool id exists.
+ * The sched_id parameter identifies the scheduler to be used, if it is
+ * negative, the default scheduler of Xen will be used.
+ *
+ * returns:
+ *     pointer to the struct cpupool just created, on success
+ *     NULL, on cpupool creation error
+ */
+struct cpupool *cpupool_create_pool(unsigned int pool_id, int sched_id);
+
 extern void dump_runq(unsigned char key);
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
-- 
2.17.1


