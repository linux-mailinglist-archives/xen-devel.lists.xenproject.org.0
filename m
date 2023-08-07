Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C780B772207
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578250.905683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyPE-000517-DH; Mon, 07 Aug 2023 11:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578250.905683; Mon, 07 Aug 2023 11:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyPE-0004xS-9a; Mon, 07 Aug 2023 11:28:12 +0000
Received: by outflank-mailman (input) for mailman id 578250;
 Mon, 07 Aug 2023 11:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSyF3-0006s9-6W
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:17:41 +0000
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [2607:f8b0:4864:20::d30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04ddda3e-3514-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 13:17:39 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-790b9d7d643so44590439f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:17:39 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:17:38 -0700 (PDT)
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
X-Inumbo-ID: 04ddda3e-3514-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691407059; x=1692011859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+7Rjo519K3FhaZ9jqPWNUITMom2L2BqSXFVMuCYJXE=;
        b=ip0wYuQW2+/exFbWgV8xiqSMo5oTQ+OAdV6N1Ar0LEuRT0eIq620KDbMvERQspVuIX
         AL+wevZXKdon9YRPQjclhoX9H3SrxByFFe9jR5690ffz3lESe4Q0ZFhT9ousgzw0xt/w
         5RRxxYEFUQ/KP/U5y/hPXXWHBw2c8mi1xHmKIZ7mZeQKJVTuYBj/qteoNFG9SyZ1tjUE
         RbAUg65PVJJ+WhDtWwqZYb434jDUE36PynN0DkYIbM09s/1BNwwPxkk2HM9wFLeNzyaL
         lqpAqgXw+Mhtz5SgHNy0c1hVzxk4Y6rOc9m8zwrbUN+lDejRoW7+lKGMq2jSF6Ub2+cH
         D5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407059; x=1692011859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+7Rjo519K3FhaZ9jqPWNUITMom2L2BqSXFVMuCYJXE=;
        b=IYFh/VSQ6/cidi+jf0nhzcTQeI9y1xQJfbAW9BcAUDcSOkIdtobxG0CfFsHy1kJXHr
         3eMZfXoQtKHOrYeZlWLYIxG++ZNTVvcCct+4ueAqx5KRjo7Lb/ZQ+c4KmVHorodkZHRH
         2/imh+ld2G+k90TuXvxLiM2GkPyhcKrUv77O5MFlwTfIfgvv1wT1Ee9bYe9OqAmm51tK
         q8JqhBrlGxJn2UeD2gy2P6vEQNR2MTgSKlsk3OzTQeCZI6OlBYPLbAoIS6YBHeG+KCp+
         ZcmUQQ5ESptvvSlJGh6duNvAGGY6anO8mwECMc15CcV0EAbPO6sA8dWtcjHg9yTVn4X0
         /2Ww==
X-Gm-Message-State: ABy/qLbG5FbxkgtHmmPOgWlvKkNjH7lETMXfttqTSQF/XSbIZYfyulWc
	iqb52F/EXWZX57kIDnntw3MehQ==
X-Google-Smtp-Source: APBJJlEqWtJMEzUOeETqs91YS6OhZnccr6gvE839NK54utINPmY3rqSAbE5saT2wFNMSrRFNpkUXNA==
X-Received: by 2002:a05:6e02:8ef:b0:349:1d60:7250 with SMTP id n15-20020a056e0208ef00b003491d607250mr23020165ilt.0.1691407058833;
        Mon, 07 Aug 2023 04:17:38 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org,
	david@fromorbit.com,
	tkhai@ya.ru,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	djwong@kernel.org,
	brauner@kernel.org,
	paulmck@kernel.org,
	tytso@mit.edu,
	steven.price@arm.com,
	cel@kernel.org,
	senozhatsky@chromium.org,
	yujie.liu@intel.com,
	gregkh@linuxfoundation.org,
	muchun.song@linux.dev,
	simon.horman@corigine.com,
	dlemoal@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com,
	linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v4 36/48] nfsd: dynamically allocate the nfsd-reply shrinker
Date: Mon,  7 Aug 2023 19:09:24 +0800
Message-Id: <20230807110936.21819-37-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the nfsd-reply shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct nfsd_net.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Chuck Lever <chuck.lever@oracle.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/netns.h    |  2 +-
 fs/nfsd/nfscache.c | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
index f669444d5336..ab303a8b77d5 100644
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -177,7 +177,7 @@ struct nfsd_net {
 	/* size of cache when we saw the longest hash chain */
 	unsigned int             longest_chain_cachesize;
 
-	struct shrinker		nfsd_reply_cache_shrinker;
+	struct shrinker		*nfsd_reply_cache_shrinker;
 
 	/* tracking server-to-server copy mounts */
 	spinlock_t              nfsd_ssc_lock;
diff --git a/fs/nfsd/nfscache.c b/fs/nfsd/nfscache.c
index 80621a709510..fd56a52aa5fb 100644
--- a/fs/nfsd/nfscache.c
+++ b/fs/nfsd/nfscache.c
@@ -201,26 +201,29 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
 {
 	unsigned int hashsize;
 	unsigned int i;
-	int status = 0;
 
 	nn->max_drc_entries = nfsd_cache_size_limit();
 	atomic_set(&nn->num_drc_entries, 0);
 	hashsize = nfsd_hashsize(nn->max_drc_entries);
 	nn->maskbits = ilog2(hashsize);
 
-	nn->nfsd_reply_cache_shrinker.scan_objects = nfsd_reply_cache_scan;
-	nn->nfsd_reply_cache_shrinker.count_objects = nfsd_reply_cache_count;
-	nn->nfsd_reply_cache_shrinker.seeks = 1;
-	status = register_shrinker(&nn->nfsd_reply_cache_shrinker,
-				   "nfsd-reply:%s", nn->nfsd_name);
-	if (status)
-		return status;
-
 	nn->drc_hashtbl = kvzalloc(array_size(hashsize,
 				sizeof(*nn->drc_hashtbl)), GFP_KERNEL);
 	if (!nn->drc_hashtbl)
+		return -ENOMEM;
+
+	nn->nfsd_reply_cache_shrinker = shrinker_alloc(0, "nfsd-reply:%s",
+						       nn->nfsd_name);
+	if (!nn->nfsd_reply_cache_shrinker)
 		goto out_shrinker;
 
+	nn->nfsd_reply_cache_shrinker->scan_objects = nfsd_reply_cache_scan;
+	nn->nfsd_reply_cache_shrinker->count_objects = nfsd_reply_cache_count;
+	nn->nfsd_reply_cache_shrinker->seeks = 1;
+	nn->nfsd_reply_cache_shrinker->private_data = nn;
+
+	shrinker_register(nn->nfsd_reply_cache_shrinker);
+
 	for (i = 0; i < hashsize; i++) {
 		INIT_LIST_HEAD(&nn->drc_hashtbl[i].lru_head);
 		spin_lock_init(&nn->drc_hashtbl[i].cache_lock);
@@ -229,7 +232,7 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
 
 	return 0;
 out_shrinker:
-	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
+	kvfree(nn->drc_hashtbl);
 	printk(KERN_ERR "nfsd: failed to allocate reply cache\n");
 	return -ENOMEM;
 }
@@ -239,7 +242,7 @@ void nfsd_reply_cache_shutdown(struct nfsd_net *nn)
 	struct nfsd_cacherep *rp;
 	unsigned int i;
 
-	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
+	shrinker_free(nn->nfsd_reply_cache_shrinker);
 
 	for (i = 0; i < nn->drc_hashsize; i++) {
 		struct list_head *head = &nn->drc_hashtbl[i].lru_head;
@@ -323,8 +326,7 @@ nfsd_prune_bucket_locked(struct nfsd_net *nn, struct nfsd_drc_bucket *b,
 static unsigned long
 nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct nfsd_net *nn = container_of(shrink,
-				struct nfsd_net, nfsd_reply_cache_shrinker);
+	struct nfsd_net *nn = shrink->private_data;
 
 	return atomic_read(&nn->num_drc_entries);
 }
@@ -343,8 +345,7 @@ nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
 static unsigned long
 nfsd_reply_cache_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct nfsd_net *nn = container_of(shrink,
-				struct nfsd_net, nfsd_reply_cache_shrinker);
+	struct nfsd_net *nn = shrink->private_data;
 	unsigned long freed = 0;
 	LIST_HEAD(dispose);
 	unsigned int i;
-- 
2.30.2


