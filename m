Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A2298936
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12078.31641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZ8-0004gG-Fy; Mon, 26 Oct 2020 09:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12078.31641; Mon, 26 Oct 2020 09:13:22 +0000
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
	id 1kWyZ8-0004fa-9U; Mon, 26 Oct 2020 09:13:22 +0000
Received: by outflank-mailman (input) for mailman id 12078;
 Mon, 26 Oct 2020 09:13:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZ6-0004f1-Sm
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dafdec3e-1b45-494f-b5d9-81e097f3cb5a;
 Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1018CB234;
 Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZ6-0004f1-Sm
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:20 +0000
X-Inumbo-ID: dafdec3e-1b45-494f-b5d9-81e097f3cb5a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dafdec3e-1b45-494f-b5d9-81e097f3cb5a;
	Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+BqtDReQpO+TXL58A4bLpNMJ+nOUR/20v/rJyuhuj4=;
	b=jIQEYVwFJQcO6tgFsP5y643ojuRqFb0JEVZyJ8pBXnPRDkcdWxnb7+NoRXv84suKMhSrBV
	3vDphIgKzxy01drPzNsfPJGIqunAyg2YYodaHLQep5/3+kytO/1QcnD2qqkxeu32O/V7Wd
	dOpMtsCMVoo/eFfH4gkcMaRo26xLKY0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1018CB234;
	Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 01/12] xen/cpupool: add cpu to sched_res_mask when removing it from cpupool
Date: Mon, 26 Oct 2020 10:13:05 +0100
Message-Id: <20201026091316.25680-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a cpu is removed from a cpupool and added to the free cpus it
should be added to sched_res_mask, too.

The related removal from sched_res_mask in case of core scheduling
is already done in schedule_cpu_add().

As long as all cpupools share the same scheduling granularity there
is nothing going wrong with the missing removal, but this will change
when per-cpupool granularity is fully supported.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


