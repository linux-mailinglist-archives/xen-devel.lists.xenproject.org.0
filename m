Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C615A2C990E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41621.74912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uk-0004Vq-Lb; Tue, 01 Dec 2020 08:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41621.74912; Tue, 01 Dec 2020 08:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uk-0004VI-HZ; Tue, 01 Dec 2020 08:21:34 +0000
Received: by outflank-mailman (input) for mailman id 41621;
 Tue, 01 Dec 2020 08:21:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0ui-0004Uj-NE
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24573929-9acf-4325-b865-1e4397cf6f40;
 Tue, 01 Dec 2020 08:21:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23AC5AC2F;
 Tue,  1 Dec 2020 08:21:31 +0000 (UTC)
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
X-Inumbo-ID: 24573929-9acf-4325-b865-1e4397cf6f40
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uevcohjDdjyaRW4J/XJl3vfCGPtDJwSk8swOs/WEatk=;
	b=qmGLVYtTEwAPxQupeGB9PHxOUoB5b8zhWnwI/5dP1T9FMNI2wlSPT1uQZRV/2QP3WK32pu
	sVH1k4Z6Pcc/QzeWxFtbJqPxkGy8eavtdlCiMzvMnnLjTeFlM10K+f1NlHWRk1fqPaxCm1
	jMKKHgbP8tCbU0C547Rmfxe6cvXHB+0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 01/17] xen/cpupool: add cpu to sched_res_mask when removing it from cpupool
Date: Tue,  1 Dec 2020 09:21:12 +0100
Message-Id: <20201201082128.15239-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a cpu is removed from a cpupool and added to the free cpus it
should be added to sched_res_mask, too.

The related removal from sched_res_mask in case of core scheduling
is already done in schedule_cpu_add().

As long as all cpupools share the same scheduling granularity there
is nothing going wrong with the missing addition, but this will change
when per-cpupool granularity is fully supported.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ed973e90ec..f8c81592af 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3189,6 +3189,7 @@ int schedule_cpu_rm(unsigned int cpu)
             /* Adjust cpu masks of resources (old and new). */
             cpumask_clear_cpu(cpu_iter, sr->cpus);
             cpumask_set_cpu(cpu_iter, sr_new[idx]->cpus);
+            cpumask_set_cpu(cpu_iter, &sched_res_mask);
 
             /* Init timer. */
             init_timer(&sr_new[idx]->s_timer, s_timer_fn, NULL, cpu_iter);
-- 
2.26.2


