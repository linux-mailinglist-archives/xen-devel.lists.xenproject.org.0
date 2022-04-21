Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EE6509A6B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 10:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309847.526376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhRzs-0003jW-Dh; Thu, 21 Apr 2022 08:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309847.526376; Thu, 21 Apr 2022 08:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhRzs-0003bt-8G; Thu, 21 Apr 2022 08:17:04 +0000
Received: by outflank-mailman (input) for mailman id 309847;
 Thu, 21 Apr 2022 08:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=foL4=U7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nhRzq-0002nQ-EG
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 08:17:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6a4101c6-c14b-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 10:16:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 093C81515;
 Thu, 21 Apr 2022 01:17:00 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72C3E3F73B;
 Thu, 21 Apr 2022 01:16:59 -0700 (PDT)
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
X-Inumbo-ID: 6a4101c6-c14b-11ec-8fbf-03012f2f19d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH v8 5/7] xen/cpupool: Don't allow removing cpu0 from cpupool0
Date: Thu, 21 Apr 2022 09:16:43 +0100
Message-Id: <20220421081645.40235-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421081645.40235-1-luca.fancellu@arm.com>
References: <20220421081645.40235-1-luca.fancellu@arm.com>

Cpu0 must remain in cpupool0, otherwise some operations like moving cpus
between cpupools, cpu hotplug, destroying cpupools, shutdown of the host,
might not work in a sane way.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes in v8:
- Add R-by (Juergen)
Changes in v7:
- new patch
---
 xen/common/sched/cpupool.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 86a175f99cd5..0a93bcc631bf 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -572,6 +572,7 @@ static long cf_check cpupool_unassign_cpu_helper(void *info)
  * possible failures:
  * - last cpu and still active domains in cpupool
  * - cpu just being unplugged
+ * - Attempt to remove boot cpu from cpupool0
  */
 static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
 {
@@ -582,7 +583,12 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     debugtrace_printk("cpupool_unassign_cpu(pool=%u,cpu=%d)\n",
                       c->cpupool_id, cpu);
 
-    if ( !cpu_online(cpu) )
+    /*
+     * Cpu0 must remain in cpupool0, otherwise some operations like moving cpus
+     * between cpupools, cpu hotplug, destroying cpupools, shutdown of the host,
+     * might not work in a sane way.
+     */
+    if ( (!c->cpupool_id && !cpu) || !cpu_online(cpu) )
         return -EINVAL;
 
     master_cpu = sched_get_resource_cpu(cpu);
-- 
2.17.1


