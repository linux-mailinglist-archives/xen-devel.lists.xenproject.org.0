Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEBC511470
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314684.532914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJA-0001LN-Cy; Wed, 27 Apr 2022 09:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314684.532914; Wed, 27 Apr 2022 09:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJA-0001IA-8N; Wed, 27 Apr 2022 09:50:04 +0000
Received: by outflank-mailman (input) for mailman id 314684;
 Wed, 27 Apr 2022 09:50:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJ8-00085x-Ps
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:50:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 683cf94c-c60f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:50:02 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E6EA14BF;
 Wed, 27 Apr 2022 02:50:01 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 525183F774;
 Wed, 27 Apr 2022 02:50:00 -0700 (PDT)
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
X-Inumbo-ID: 683cf94c-c60f-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 5/8] xen/sched: Remove unused-but-set variable
Date: Wed, 27 Apr 2022 11:49:38 +0200
Message-Id: <20220427094941.291554-6-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function schedule_cpu_add defines and sets a variable old_unit but
does not make use of it. Remove this variable.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/common/sched/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab678181..8a8c25bbda 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3104,7 +3104,7 @@ int schedule_cpu_add(unsigned int cpu, struct cpupool *c)
     {
         const cpumask_t *mask;
         unsigned int cpu_iter, idx = 0;
-        struct sched_unit *old_unit, *master_unit;
+        struct sched_unit *master_unit;
         struct sched_resource *sr_old;
 
         /*
@@ -3128,7 +3128,6 @@ int schedule_cpu_add(unsigned int cpu, struct cpupool *c)
             if ( cpu == cpu_iter )
                 continue;
 
-            old_unit = idle_vcpu[cpu_iter]->sched_unit;
             sr_old = get_sched_res(cpu_iter);
             kill_timer(&sr_old->s_timer);
             idle_vcpu[cpu_iter]->sched_unit = master_unit;
-- 
2.25.1


