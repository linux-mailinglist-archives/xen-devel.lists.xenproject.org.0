Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E823543DF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105395.201751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbP-00029z-4j; Mon, 05 Apr 2021 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105395.201751; Mon, 05 Apr 2021 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbO-00029F-Vj; Mon, 05 Apr 2021 15:57:22 +0000
Received: by outflank-mailman (input) for mailman id 105395;
 Mon, 05 Apr 2021 15:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbN-00027f-5b
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbM-0002nH-LS; Mon, 05 Apr 2021 15:57:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbM-00053b-Cu; Mon, 05 Apr 2021 15:57:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=FL2yQM6+D2+NHIgkPxbbHrXWAKmxpnXf59OkWXn01Qw=; b=olnT+4wdfgOmsFVK0XVuv2Zrh
	FMugV25jq7TYAhXZfOZEa1zDLyx93/ejxZ9Kv3epsIjZOdLbwoUjxytoUG0qNy0SpfHXWj414Viu6
	dMzKuBnjkGhNhdaD4dSgcQkaO8bEOSxwtvGYoAOt7gg6LdiOOvfVpuZRzaIu/bgntk344=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 02/14] xen/sched: Constify name and opt_name in struct scheduler
Date: Mon,  5 Apr 2021 16:57:01 +0100
Message-Id: <20210405155713.29754-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Both name and opt_name are pointing to literal string. So mark both of
the fields as const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/sched/private.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 92d0d4961063..a870320146ef 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -272,8 +272,8 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
 }
 
 struct scheduler {
-    char *name;             /* full name for this scheduler      */
-    char *opt_name;         /* option name for this scheduler    */
+    const char *name;       /* full name for this scheduler      */
+    const char *opt_name;   /* option name for this scheduler    */
     unsigned int sched_id;  /* ID for this scheduler             */
     void *sched_data;       /* global data pointer               */
     struct cpupool *cpupool;/* points to this scheduler's pool   */
-- 
2.17.1


