Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98375F166
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568629.888316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsJd-0004Mw-Bh; Mon, 24 Jul 2023 09:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568629.888316; Mon, 24 Jul 2023 09:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsJd-0004Jy-7f; Mon, 24 Jul 2023 09:57:21 +0000
Received: by outflank-mailman (input) for mailman id 568629;
 Mon, 24 Jul 2023 09:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsD3-0007Pe-IW
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:50:33 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86d4b8c1-2a07-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:50:31 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2680edb9767so229952a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:50:31 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:50:30 -0700 (PDT)
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
X-Inumbo-ID: 86d4b8c1-2a07-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192230; x=1690797030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5Pgz5o85vjRJX2NAYGHXGIfrVWxEYXMNean3UujJOE=;
        b=HTXrSeoRNfCylQUvp3rA93XfC5B9ZAm1jE2rq6Hxhf34WiOMuxDD1meCGjwu9EwIX7
         ZbtHbS4fRmsyA8f1AQ95KeA8pk2Wu8dqsEYadFuPM8kR0aC/DghUlOU1O4pFRVVN27md
         Jz3ZRGJgXj2574vm45/AlAwiQEEVW+fNcrUB9gqDXxsp5xfvZzaaREkRLWgNT154mbaN
         kLE4oZiRvqBvE8wXvErAyC7133TniCzwa8RrEDkzsepAqin0to9X/dlSZmLYhsSlZCfb
         1LIBzBngTPhlUQBluPspeHfucBGL5ud/FkBEqD4eyTXeqLx9y9KdZjNraR8njMzNn3Wl
         0XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192230; x=1690797030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5Pgz5o85vjRJX2NAYGHXGIfrVWxEYXMNean3UujJOE=;
        b=btzh2D4U9Wyc9YSx+2kmub6JUPbAfMvkz30bWKrVNZ/kip9ka7A5PSJsqbndAbwlOE
         UIU2EFnf8y1uetApeqSeFfq660gDpe+H1t6jMQvMcvSOLnXC8JtSZKtbEChL5Nw3Tc3U
         Y9NMyIJwcdWnkzhhZhTcqTbjbGR4qYeCrfb3dYSN4tYbkTsUpEpU4U+/q2q+6OR3IKVO
         whndvyPwbL+PdPt3rmHKLqNkSHXC16qXSMp+SIAv4Q3kEnG9y8PTUqiRoGuu6UWpMLov
         lQfPZr6jrx/8MP9VvxVv5GxO5QPfWAITXCTlgUXfOyTBBWSwt6aMle/xWZOJlfUTNXjt
         WGng==
X-Gm-Message-State: ABy/qLYrmm3GTJetX/JJgpEvvUxoaDhwFGXiDM0w84UsNof1iB7Pkm7A
	CkQf4OWu4qRFXzY6WEjbrNqgOQ==
X-Google-Smtp-Source: APBJJlEuFsN94AIprk7ia8ABwlM0Slt2XXWIAtSq+6lqm1qdEZFYXWzDVMuJVyeP2h9BJXp/48ZO1g==
X-Received: by 2002:a17:90a:5a4c:b0:263:1e82:2dc7 with SMTP id m12-20020a17090a5a4c00b002631e822dc7mr8465919pji.0.1690192230524;
        Mon, 24 Jul 2023 02:50:30 -0700 (PDT)
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
Subject: [PATCH v2 27/47] md/raid5: dynamically allocate the md-raid5 shrinker
Date: Mon, 24 Jul 2023 17:43:34 +0800
Message-Id: <20230724094354.90817-28-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the md-raid5 shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct r5conf.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/raid5.c | 25 ++++++++++++++-----------
 drivers/md/raid5.h |  2 +-
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 85b3004594e0..12443dfb7aeb 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7414,7 +7414,7 @@ static void free_conf(struct r5conf *conf)
 
 	log_exit(conf);
 
-	unregister_shrinker(&conf->shrinker);
+	shrinker_unregister(conf->shrinker);
 	free_thread_groups(conf);
 	shrink_stripes(conf);
 	raid5_free_percpu(conf);
@@ -7462,7 +7462,7 @@ static int raid5_alloc_percpu(struct r5conf *conf)
 static unsigned long raid5_cache_scan(struct shrinker *shrink,
 				      struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 	unsigned long ret = SHRINK_STOP;
 
 	if (mutex_trylock(&conf->cache_size_mutex)) {
@@ -7483,7 +7483,7 @@ static unsigned long raid5_cache_scan(struct shrinker *shrink,
 static unsigned long raid5_cache_count(struct shrinker *shrink,
 				       struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 
 	if (conf->max_nr_stripes < conf->min_nr_stripes)
 		/* unlikely, but not impossible */
@@ -7718,18 +7718,21 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	 * it reduces the queue depth and so can hurt throughput.
 	 * So set it rather large, scaled by number of devices.
 	 */
-	conf->shrinker.seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
-	conf->shrinker.scan_objects = raid5_cache_scan;
-	conf->shrinker.count_objects = raid5_cache_count;
-	conf->shrinker.batch = 128;
-	conf->shrinker.flags = 0;
-	ret = register_shrinker(&conf->shrinker, "md-raid5:%s", mdname(mddev));
-	if (ret) {
-		pr_warn("md/raid:%s: couldn't register shrinker.\n",
+	conf->shrinker = shrinker_alloc(0, "md-raid5:%s", mdname(mddev));
+	if (!conf->shrinker) {
+		pr_warn("md/raid:%s: couldn't allocate shrinker.\n",
 			mdname(mddev));
 		goto abort;
 	}
 
+	conf->shrinker->seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
+	conf->shrinker->scan_objects = raid5_cache_scan;
+	conf->shrinker->count_objects = raid5_cache_count;
+	conf->shrinker->batch = 128;
+	conf->shrinker->private_data = conf;
+
+	shrinker_register(conf->shrinker);
+
 	sprintf(pers_name, "raid%d", mddev->new_level);
 	rcu_assign_pointer(conf->thread,
 			   md_register_thread(raid5d, mddev, pers_name));
diff --git a/drivers/md/raid5.h b/drivers/md/raid5.h
index 97a795979a35..22bea20eccbd 100644
--- a/drivers/md/raid5.h
+++ b/drivers/md/raid5.h
@@ -670,7 +670,7 @@ struct r5conf {
 	wait_queue_head_t	wait_for_stripe;
 	wait_queue_head_t	wait_for_overlap;
 	unsigned long		cache_state;
-	struct shrinker		shrinker;
+	struct shrinker		*shrinker;
 	int			pool_size; /* number of disks in stripeheads in pool */
 	spinlock_t		device_lock;
 	struct disk_info	*disks;
-- 
2.30.2


