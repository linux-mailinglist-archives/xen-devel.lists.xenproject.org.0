Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E728A772208
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578252.905690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyPE-00058G-RY; Mon, 07 Aug 2023 11:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578252.905690; Mon, 07 Aug 2023 11:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyPE-00051C-MZ; Mon, 07 Aug 2023 11:28:12 +0000
Received: by outflank-mailman (input) for mailman id 578252;
 Mon, 07 Aug 2023 11:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSyFr-0006s9-SW
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:18:31 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23680a48-3514-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 13:18:31 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-268663fb09cso631971a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:18:31 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:18:29 -0700 (PDT)
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
X-Inumbo-ID: 23680a48-3514-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691407110; x=1692011910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPvD0YF4yF0E/V3NMttF7YVdRMfLZcl9Qmy2whUD9jE=;
        b=Zyx6A0EStcsVwcUtmlmHBj8SZuYfnooxelT8QMOYXSAyp4FCbwtu0BbNt7l+P/wBJj
         3uKMQnjNsG7kojYgy7WxPCZCDaFjHA3Lkyvej9QWnqL7VojGrNrN9hCPJG63fZ7FoTcQ
         O0E54wIoRR4I2PoVCGsys6mtB59u+SgFkM0Y7fE6r6JpnE869MmShYbt1p4JfBRV0wIx
         7GkvLsY4v9shjjU3+1o+arkgzF82WBo8NnslYR1Cfid19C5zIsiC0KJHBzW/oF+sMC5M
         xApENfMLb6T9Hu0suHBowRs4nuIaRY0OBNI6a9JHKGzdE5XR+fVrCSwS1eOLCHlN+w0k
         LsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407110; x=1692011910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPvD0YF4yF0E/V3NMttF7YVdRMfLZcl9Qmy2whUD9jE=;
        b=EtLJeyewUjyz7bdR7JlKa4eCs4DIU6KDxoj8/owT4Ox2PaMjPt+lIUk2U/o98aJfND
         ix8HlPjorjlg8lqG8dbiVa/3rpeq1+xt+CTPaUbYO2L3Qq6qykXROUFYuacjaDA8vX9z
         nwFlACHD1BKAgKMNSB6Ga27j8dWCn1rZLoztE1FtXyE9/actL0vlH3xyA2hwqKKKQCgM
         vH7OuOQ7Fez8r6oSILkogQcSQfkuWSHY/ZIvJHmPpttrJTNlEFrGKzv819RFxiJjc5Y4
         fgPCnhJ5x1bJOYljZn7GsK9snekWO0RvUDdcIoa21S3CWebXc/2BIrjJOCNBxrwv3HE1
         vP9Q==
X-Gm-Message-State: ABy/qLbv1dlh9SFmbe/oCBTCMO+QfJrPPATKlmBkbvNa7gPEP9F+jM06
	qh6rNndfvaMAFrSIPDKfIG+Bxw==
X-Google-Smtp-Source: APBJJlFnoOazdp9TvNa1Sdutczsv0h+KjLn+q+TQByEK163E+9f/k1cC7rmChP+7R75WsTDRsF4HxQ==
X-Received: by 2002:a17:90a:901:b0:268:3a31:3e4d with SMTP id n1-20020a17090a090100b002683a313e4dmr23078917pjn.2.1691407109946;
        Mon, 07 Aug 2023 04:18:29 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 40/48] zsmalloc: dynamically allocate the mm-zspool shrinker
Date: Mon,  7 Aug 2023 19:09:28 +0800
Message-Id: <20230807110936.21819-41-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the mm-zspool shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct zs_pool.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/zsmalloc.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index b58f957429f0..1909234bb345 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -229,7 +229,7 @@ struct zs_pool {
 	struct zs_pool_stats stats;
 
 	/* Compact classes */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
@@ -2086,8 +2086,7 @@ static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
 	unsigned long pages_freed;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	/*
 	 * Compact classes and calculate compaction delta.
@@ -2105,8 +2104,7 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 	int i;
 	struct size_class *class;
 	unsigned long pages_to_free = 0;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	for (i = ZS_SIZE_CLASSES - 1; i >= 0; i--) {
 		class = pool->size_class[i];
@@ -2121,18 +2119,24 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 
 static void zs_unregister_shrinker(struct zs_pool *pool)
 {
-	unregister_shrinker(&pool->shrinker);
+	shrinker_free(pool->shrinker);
 }
 
 static int zs_register_shrinker(struct zs_pool *pool)
 {
-	pool->shrinker.scan_objects = zs_shrinker_scan;
-	pool->shrinker.count_objects = zs_shrinker_count;
-	pool->shrinker.batch = 0;
-	pool->shrinker.seeks = DEFAULT_SEEKS;
+	pool->shrinker = shrinker_alloc(0, "mm-zspool:%s", pool->name);
+	if (!pool->shrinker)
+		return -ENOMEM;
+
+	pool->shrinker->scan_objects = zs_shrinker_scan;
+	pool->shrinker->count_objects = zs_shrinker_count;
+	pool->shrinker->batch = 0;
+	pool->shrinker->seeks = DEFAULT_SEEKS;
+	pool->shrinker->private_data = pool;
 
-	return register_shrinker(&pool->shrinker, "mm-zspool:%s",
-				 pool->name);
+	shrinker_register(pool->shrinker);
+
+	return 0;
 }
 
 static int calculate_zspage_chain_size(int class_size)
-- 
2.30.2


