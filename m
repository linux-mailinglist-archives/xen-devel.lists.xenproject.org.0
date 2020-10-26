Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE4298937
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12080.31654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZC-0004kN-MQ; Mon, 26 Oct 2020 09:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12080.31654; Mon, 26 Oct 2020 09:13:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZC-0004jo-Ip; Mon, 26 Oct 2020 09:13:26 +0000
Received: by outflank-mailman (input) for mailman id 12080;
 Mon, 26 Oct 2020 09:13:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZB-0004ev-DY
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3e88123-e98f-46cc-89ef-ca162c14a811;
 Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32ED1B236;
 Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZB-0004ev-DY
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:25 +0000
X-Inumbo-ID: c3e88123-e98f-46cc-89ef-ca162c14a811
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c3e88123-e98f-46cc-89ef-ca162c14a811;
	Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecPsgfMBalsxI2bSrpf4c/uqpvI8X4flzNfflD+HujM=;
	b=umOd6p2DKuwXUe/IOnnsMi4KI8Shwj6jZGazqTU+jtSkfGgbu2eK/oraBqzdQ+iamG2/EM
	z38ad7nUJrEgu4aXBWIOlZvGXkEWoHU3hoa/GBd3icnLPsCPx1+zu+jLPDjjSlk9Cq1HgB
	Uo86j4D3UmTLZ+gIHgqoSziSH2CFf7U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 32ED1B236;
	Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 02/12] xen/cpupool: add missing bits for per-cpupool scheduling granularity
Date: Mon, 26 Oct 2020 10:13:06 +0100
Message-Id: <20201026091316.25680-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even with storing the scheduling granularity in struct cpupool there
are still a few bits missing for being able to have cpupools with
different granularity (apart from the missing interface for setting
the individual granularities): the number of cpus in a scheduling
unit is always taken from the global sched_granularity variable.

So store the value in struct cpupool and use that instead of
sched_granularity.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/cpupool.c | 3 ++-
 xen/common/sched/private.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 7ea641ca26..6429c8f7b5 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -151,7 +151,7 @@ static void __init cpupool_gran_init(void)
 
 unsigned int cpupool_get_granularity(const struct cpupool *c)
 {
-    return c ? sched_granularity : 1;
+    return c ? c->sched_gran : 1;
 }
 
 static void free_cpupool_struct(struct cpupool *c)
@@ -289,6 +289,7 @@ static struct cpupool *cpupool_create(
     }
     c->sched->cpupool = c;
     c->gran = opt_sched_granularity;
+    c->sched_gran = sched_granularity;
 
     *q = c;
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index df50976eb2..685992cab9 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -514,6 +514,7 @@ struct cpupool
     struct scheduler *sched;
     atomic_t         refcnt;
     enum sched_gran  gran;
+    unsigned int     sched_gran;     /* Number of cpus per sched-item. */
 };
 
 static inline cpumask_t *cpupool_domain_master_cpumask(const struct domain *d)
-- 
2.26.2


