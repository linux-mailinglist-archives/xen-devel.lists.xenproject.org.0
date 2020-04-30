Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5F1BFFE7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:16:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAv6-0007Rd-69; Thu, 30 Apr 2020 15:16:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H9qc=6O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jUAv4-0007R4-Um
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:16:10 +0000
X-Inumbo-ID: 811ec43f-8af5-11ea-9a67-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811ec43f-8af5-11ea-9a67-12813bfff9fa;
 Thu, 30 Apr 2020 15:16:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7ECE7AF4C;
 Thu, 30 Apr 2020 15:16:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] xen/cpupool: fix removing cpu from a cpupool
Date: Thu, 30 Apr 2020 17:15:59 +0200
Message-Id: <20200430151559.1464-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200430151559.1464-1-jgross@suse.com>
References: <20200430151559.1464-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit cb563d7665f2 ("xen/sched: support core scheduling for moving
cpus to/from cpupools") introduced a regression when trying to remove
an offline cpu from a cpupool, as the system would crash in this
situation.

Fix that by testing the cpu to be online.

Fixes: cb563d7665f2 ("xen/sched: support core scheduling for moving cpus to/from cpupools")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/cpupool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index d40345b585..de9e25af84 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -520,6 +520,9 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     debugtrace_printk("cpupool_unassign_cpu(pool=%d,cpu=%d)\n",
                       c->cpupool_id, cpu);
 
+    if ( !cpu_online(cpu) )
+        return -EINVAL;
+
     master_cpu = sched_get_resource_cpu(cpu);
     ret = cpupool_unassign_cpu_start(c, master_cpu);
     if ( ret )
-- 
2.16.4


