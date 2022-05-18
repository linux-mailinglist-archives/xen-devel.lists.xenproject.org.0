Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC852BD96
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332288.555963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKuN-00052H-EM; Wed, 18 May 2022 14:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332288.555963; Wed, 18 May 2022 14:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKuN-0004z3-BL; Wed, 18 May 2022 14:44:15 +0000
Received: by outflank-mailman (input) for mailman id 332288;
 Wed, 18 May 2022 14:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nrKuM-0004yx-Gz
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:44:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc196f62-d6b8-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 16:44:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 26F9D1F8C9;
 Wed, 18 May 2022 14:44:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0055E133F5;
 Wed, 18 May 2022 14:44:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U+dCOjwGhWJ2NgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 May 2022 14:44:12 +0000
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
X-Inumbo-ID: fc196f62-d6b8-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652885053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lp2JXZZbjQGpQ2E8nMNlpB3Q9z/2jFQfOgGeYMz8dMo=;
	b=WM53zxgOOECQo45ZRhQwIHZFRvNd6+4MGg3VeAFMEF3WpPVxbFtFAe6UsuguSv7nbFKMm1
	u64/CEk6ac5JeGaTEE4QGjpKEAF8yhrKN9dCQ7wsb2jT8IVWJ8GA6ffKmbUCtkhk8MKBzQ
	GVn7WYGAFRirljg+jJNf8FqTt1SO5/M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] xen/cpupool: limit number of cpupools
Date: Wed, 18 May 2022 16:44:10 +0200
Message-Id: <20220518144410.6806-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the number of cpupools in a system is unlimited. This can lead to
multiple problems (e.g. duplicate cpupool-id).

Limit the number of cpupools to twice the number of maximum possible
cpus, allowing to have one cpupool per physical cpu plus some spare
cpupools for special means (there are already existing use cases for
such spare cpupools).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/cpupool.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f6e3d97e52..7cc25ee8b4 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -30,6 +30,7 @@ struct cpupool *cpupool0;                /* Initial cpupool with Dom0 */
 cpumask_t cpupool_free_cpus;             /* cpus not in any cpupool */
 
 static LIST_HEAD(cpupool_list);          /* linked list, sorted by poolid */
+static unsigned int n_cpupools;
 
 static int cpupool_moving_cpu = -1;
 static struct cpupool *cpupool_cpu_moving = NULL;
@@ -276,6 +277,14 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
     spin_lock(&cpupool_lock);
 
+    /* Don't allow too many cpupools. */
+    if ( n_cpupools >= 2 * nr_cpu_ids )
+    {
+        ret = -ENOSPC;
+        goto unlock;
+    }
+    n_cpupools++;
+
     if ( poolid != CPUPOOLID_NONE )
     {
         q = __cpupool_find_by_id(poolid, false);
@@ -332,7 +341,9 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
  err:
     list_del(&c->list);
+    n_cpupools--;
 
+ unlock:
     spin_unlock(&cpupool_lock);
 
     free_cpupool_struct(c);
@@ -356,6 +367,7 @@ static int cpupool_destroy(struct cpupool *c)
         return -EBUSY;
     }
 
+    n_cpupools--;
     list_del(&c->list);
 
     spin_unlock(&cpupool_lock);
-- 
2.35.3


