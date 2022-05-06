Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72151D731
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322978.544536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwdO-0000Xi-KK; Fri, 06 May 2022 12:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322978.544536; Fri, 06 May 2022 12:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwdO-0000P7-B6; Fri, 06 May 2022 12:00:34 +0000
Received: by outflank-mailman (input) for mailman id 322978;
 Fri, 06 May 2022 12:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjQo=VO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nmwdM-0007iX-9T
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:00:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 20c4ebcb-cd34-11ec-a406-831a346695d4;
 Fri, 06 May 2022 14:00:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB718113E;
 Fri,  6 May 2022 05:00:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F36EF3F7F5;
 Fri,  6 May 2022 05:00:29 -0700 (PDT)
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
X-Inumbo-ID: 20c4ebcb-cd34-11ec-a406-831a346695d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v8 5/7] xen/cpupool: Don't allow removing cpu0 from cpupool0
Date: Fri,  6 May 2022 13:00:10 +0100
Message-Id: <20220506120012.32326-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506120012.32326-1-luca.fancellu@arm.com>
References: <20220506120012.32326-1-luca.fancellu@arm.com>

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


