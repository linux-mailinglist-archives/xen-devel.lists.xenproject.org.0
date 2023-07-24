Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7B75F170
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568657.888375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsK1-0007Kl-KG; Mon, 24 Jul 2023 09:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568657.888375; Mon, 24 Jul 2023 09:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsK1-0007FE-GP; Mon, 24 Jul 2023 09:57:45 +0000
Received: by outflank-mailman (input) for mailman id 568657;
 Mon, 24 Jul 2023 09:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsFL-0005oA-No
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:52:55 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc3aa0de-2a07-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:52:55 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-51f64817809so328424a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:52:55 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:52:53 -0700 (PDT)
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
X-Inumbo-ID: dc3aa0de-2a07-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192374; x=1690797174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IhUpcns1yxxzymDv5YqZr0WL/UQLCqdNy71sVoDGM4=;
        b=cIXR9ZHqZERNOWsb2ZEdIjE0QFxOnKivQ/lQuhg52n2dMXmoDDPFPRWm0FPSeKIyTD
         9MEjhkMrHdf4N2tIjeBY0uc5lSquXoXdYhiP9qX8UK1EW+X5crHHo79SFmqf55ARZX3O
         wyO0k7uy2smy2xR1NzKu5/FuAH29r1/9qws6QCy0a0A/Wi9H8QSjdkQwDRNOZuARuvE0
         YOjOyD02m78GscpYM7KCycgCs59mpkV1Df2xA3PyuSplvUE6fAmcpCViKcuW1UFX7dOt
         MJAdKKXTxsI7gYL1+jy4JOfZOmvmuaNL5149/IaptalG+QZNj6invXd818tFo/LPEoBW
         HvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192374; x=1690797174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IhUpcns1yxxzymDv5YqZr0WL/UQLCqdNy71sVoDGM4=;
        b=KbBo23ixA6hT45TjgZBimhVIFEARtJCH5MvqSNyM7vFKIrALmeUfbWM5brGEjWr/GJ
         9KT28+jyymgQ4C3g7gasFhpJuFx62/MAtyyq2lDgNBaeS7SU5MBDJoKhi9MN3tKGgKKQ
         p2iOixXqibx+zi6A4xvcVyYurQPQn37EXtiQnaKJ4y1jUuYmq4zbOIK3ALvfROwiwj5O
         Cvyv5ARE2u9ytMV7s/bUwLxsmar624Hd/XyRKedxDPSyHZj+NnEyTj457JXxbu/YBzLT
         5KGjEytZunZU/4gUNzWHYkgiNCbQclheNAZ6LuJy6fgXf5cL51hxVPVTPq7OWAP6t3Mx
         ciOA==
X-Gm-Message-State: ABy/qLaBB5BpRZht2kvX3SBzMoi7eo9gINLAoWekW7t17RaGiXUo08D1
	jzhaj8U1Uuzaz0/QpNfuoE9+iw==
X-Google-Smtp-Source: APBJJlHBx7nK5g3+kldzxnSt3u+r3r/G3QW+9x74hGsko9rk5z0xsgiAGVczPyEk+gpBI6IeMpdddg==
X-Received: by 2002:a17:902:dad1:b0:1b8:aded:524c with SMTP id q17-20020a170902dad100b001b8aded524cmr12547787plx.1.1690192373829;
        Mon, 24 Jul 2023 02:52:53 -0700 (PDT)
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
	muchun.song@linux.dev
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
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 39/47] zsmalloc: dynamically allocate the mm-zspool shrinker
Date: Mon, 24 Jul 2023 17:43:46 +0800
Message-Id: <20230724094354.90817-40-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the mm-zspool shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct zs_pool.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/zsmalloc.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 32f5bc4074df..bbbffe313318 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -229,7 +229,7 @@ struct zs_pool {
 	struct zs_pool_stats stats;
 
 	/* Compact classes */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
@@ -2082,8 +2082,7 @@ static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
 	unsigned long pages_freed;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	/*
 	 * Compact classes and calculate compaction delta.
@@ -2101,8 +2100,7 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 	int i;
 	struct size_class *class;
 	unsigned long pages_to_free = 0;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	for (i = ZS_SIZE_CLASSES - 1; i >= 0; i--) {
 		class = pool->size_class[i];
@@ -2117,18 +2115,24 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 
 static void zs_unregister_shrinker(struct zs_pool *pool)
 {
-	unregister_shrinker(&pool->shrinker);
+	shrinker_unregister(pool->shrinker);
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


