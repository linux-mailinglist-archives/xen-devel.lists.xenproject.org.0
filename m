Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F675F053
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568571.888077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD7-0003rl-AM; Mon, 24 Jul 2023 09:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568571.888077; Mon, 24 Jul 2023 09:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD5-0003Nc-Tl; Mon, 24 Jul 2023 09:50:35 +0000
Received: by outflank-mailman (input) for mailman id 568571;
 Mon, 24 Jul 2023 09:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsAi-0007J3-Ms
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:48:08 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3106102d-2a07-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:48:07 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so1028046b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:48:07 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:48:06 -0700 (PDT)
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
X-Inumbo-ID: 3106102d-2a07-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192086; x=1690796886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztwb9n/1dXh113w/8xubUIoix8VXd/5rqVT4RvFn/tw=;
        b=Am7FnjS3Cpm4I6+unn47wV0WInP35j7cWyw7YSHmXYddBbEndaPLIOhBD501lhuXhz
         ziS0uq23cHOpl1MZygPYTe8AuNvoAdPlGK8k32I3Ef9lRu2tiO1YjBbYZCD1R2rMLxT1
         sbS7mgch7/EfOaLRKT3V6tvhfJSY21ngFnqMEHN8grEnjoqg0M6Q11qf7CVQTrHQJzW3
         E1Q+qRl3oeLAaumIkMGruzrANQhf6ocLGFa54JS2CwGaWbDUA2Re4gbZJ2jDKM9ntSrw
         dCSeZvHulgVnMl/ivIn59gXFxJS3Mnbl4ERIMhlA37amtawTgx9ciEfDapqLjZzr2ZBw
         AsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192086; x=1690796886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztwb9n/1dXh113w/8xubUIoix8VXd/5rqVT4RvFn/tw=;
        b=N0SD36Pj+gfyIIhu/RyDQGS8Xve37Zgo56eS9NhHYD25qwbXS1Qe5HGbwicF7lSoFz
         nl51d9r5NFvlglfo+qXoD4y89+jgjSdjaXaBi/AN/jOZJOZ9vY4r0y8JuaHfnP2PT++T
         HtkfI/Vd3E4+d4EC9g/AdoceqsyNXJdy34NaUmf2HkjxVZmXrkgpshbJj8brH82EdOU5
         t3C/lDmDZOp8kCKWCX7cFk28eMWy0RWxOh/kvNd0fVoK5N/H0bmFnF9EgIYDwGEmBO1g
         tULZyOGf/orkyYEAas3hngK1pcWvWBVJiePilTZBcyWrNGx4+ryXGzqkIlfa/kfKu/Gn
         gGoQ==
X-Gm-Message-State: ABy/qLaRah1Tw1dZIcDw6h1Go4D6bXq/7gKk1LhBnmfQISnzD+nVe78W
	4OpGSdFhEJPbB09gNqLcGa3rTg==
X-Google-Smtp-Source: APBJJlHRxCFTSeAmJPIiRwzXlrngv0y6n5gqphR6YCBFCcMRvGq0CtVM2WuFHUMj7p5y6QUWxkmpXA==
X-Received: by 2002:a17:902:dad1:b0:1b8:aded:524c with SMTP id q17-20020a170902dad100b001b8aded524cmr12538511plx.1.1690192086608;
        Mon, 24 Jul 2023 02:48:06 -0700 (PDT)
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
Subject: [PATCH v2 15/47] quota: dynamically allocate the dquota-cache shrinker
Date: Mon, 24 Jul 2023 17:43:22 +0800
Message-Id: <20230724094354.90817-16-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the dquota-cache shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/quota/dquot.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index e8232242dd34..6cb2d8911bc3 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -791,11 +791,7 @@ dqcache_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 	percpu_counter_read_positive(&dqstats.counter[DQST_FREE_DQUOTS]));
 }
 
-static struct shrinker dqcache_shrinker = {
-	.count_objects = dqcache_shrink_count,
-	.scan_objects = dqcache_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *dqcache_shrinker;
 
 /*
  * Safely release dquot and put reference to dquot.
@@ -2991,8 +2987,15 @@ static int __init dquot_init(void)
 	pr_info("VFS: Dquot-cache hash table entries: %ld (order %ld,"
 		" %ld bytes)\n", nr_hash, order, (PAGE_SIZE << order));
 
-	if (register_shrinker(&dqcache_shrinker, "dquota-cache"))
-		panic("Cannot register dquot shrinker");
+	dqcache_shrinker = shrinker_alloc(0, "dquota-cache");
+	if (!dqcache_shrinker)
+		panic("Cannot allocate dquot shrinker");
+
+	dqcache_shrinker->count_objects = dqcache_shrink_count;
+	dqcache_shrinker->scan_objects = dqcache_shrink_scan;
+	dqcache_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(dqcache_shrinker);
 
 	return 0;
 }
-- 
2.30.2


