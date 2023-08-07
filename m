Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890A77207E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578072.905334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyDE-0001Dm-Gk; Mon, 07 Aug 2023 11:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578072.905334; Mon, 07 Aug 2023 11:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyDE-00019u-D4; Mon, 07 Aug 2023 11:15:48 +0000
Received: by outflank-mailman (input) for mailman id 578072;
 Mon, 07 Aug 2023 11:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSyDC-000610-Hv
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:15:46 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03400fe-3513-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:15:45 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-268663fb09cso631555a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:15:44 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:15:43 -0700 (PDT)
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
X-Inumbo-ID: c03400fe-3513-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406943; x=1692011743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDCHIUUJzhdUAQEb2C7RW/Dwv8wB1L4nNlzD+13VK1U=;
        b=BoRgxmNUDtxzbmTK8+NbyH+07KYCd+Dr+oKPPa6V2FtEa17D0GvDQxjGlpnMkhmfxh
         v95DV47NbKABEXmmquIWadBnc0OBxkEOLW5WkwOTzTf/BxgV/A3wBC3uAtz5110v+hzE
         Ab8A6lWD76Mq+5DiKmh8yjejLb6xJUC09A5jGZ8oJIUHv3JYqq06sjhL7prumjkiRo3O
         qB570Dus+/9+aUH0B/0q8kHN6EW2eaOwjl0xOlzT2kA7NW6hf0e/OVGGbp1TjXoLyoWq
         aNUKJyMjC1sbPHUX4hmJJ6cJvGihC8n4kqK2Irls4fBt7l8WiF7MHJ0n9oTLuTvoH1vN
         CZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406943; x=1692011743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDCHIUUJzhdUAQEb2C7RW/Dwv8wB1L4nNlzD+13VK1U=;
        b=jr/Q9sNyQxT8KIPuaN6TW6uu1MMsFisS4+TUobW/9cI2Mg2yj3uKE3H0NYviwBDtf2
         Zhs7faOcGGh9K3pCLcpn6ONPtFJeOnowt0QSfNX0c17aL7xxnY3DE69ijXzsh8W1dc/d
         B29lI2341vYIjmUBUv1DDopg9MDNkM/F55FrMKYdgY9krsBkJyhjz3Lzl+cZjuhZIUAf
         dnnTlJk9g2wA5+qjqPAKCj8yCFNbXrQmA6/cAnLEjM9R4ZLrOBKr4jFVmhGLPQfFNcYQ
         AU7SXXLYACV6SxD/XovjxcqnAh4CqNIcJT1PQ0fQHj9CNz5I7iDAIkzabDRQpLSEXKHe
         2HDQ==
X-Gm-Message-State: ABy/qLaQfNbesHR4zbNQ6KHkLPPlZIEpvRq86QMbppWmjkLlJtdO5ciH
	Thon+2+aP/sbmP+Rvk7eVeO2iw==
X-Google-Smtp-Source: APBJJlEUCHWWWNXSTNLHQrmZRIrp+biqETFoyppqOsbwjUrAqcyZvOjgkWFuVkSEp/5UbdP5i9KhZA==
X-Received: by 2002:a17:90a:6c97:b0:263:730b:f568 with SMTP id y23-20020a17090a6c9700b00263730bf568mr23067993pjj.3.1691406943426;
        Mon, 07 Aug 2023 04:15:43 -0700 (PDT)
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
Subject: [PATCH v4 27/48] dm zoned: dynamically allocate the dm-zoned-meta shrinker
Date: Mon,  7 Aug 2023 19:09:15 +0800
Message-Id: <20230807110936.21819-28-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct dmz_metadata.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/md/dm-zoned-metadata.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 9d3cca8e3dc9..bbb0e69a7908 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -187,7 +187,7 @@ struct dmz_metadata {
 	struct rb_root		mblk_rbtree;
 	struct list_head	mblk_lru_list;
 	struct list_head	mblk_dirty_list;
-	struct shrinker		mblk_shrinker;
+	struct shrinker		*mblk_shrinker;
 
 	/* Zone allocation management */
 	struct mutex		map_lock;
@@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
 static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
 					       struct shrink_control *sc)
 {
-	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
+	struct dmz_metadata *zmd = shrink->private_data;
 
 	return atomic_read(&zmd->nr_mblks);
 }
@@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
 static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
 					      struct shrink_control *sc)
 {
-	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
+	struct dmz_metadata *zmd = shrink->private_data;
 	unsigned long count;
 
 	spin_lock(&zmd->mblk_lock);
@@ -2936,19 +2936,24 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	 */
 	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
 	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
-	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
-	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
-	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
 
 	/* Metadata cache shrinker */
-	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
-				MAJOR(dev->bdev->bd_dev),
-				MINOR(dev->bdev->bd_dev));
-	if (ret) {
-		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
+	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
+					    MAJOR(dev->bdev->bd_dev),
+					    MINOR(dev->bdev->bd_dev));
+	if (!zmd->mblk_shrinker) {
+		ret = -ENOMEM;
+		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");
 		goto err;
 	}
 
+	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
+	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
+	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
+	zmd->mblk_shrinker->private_data = zmd;
+
+	shrinker_register(zmd->mblk_shrinker);
+
 	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
 	for (i = 0; i < zmd->nr_devs; i++)
 		dmz_print_dev(zmd, i);
@@ -2995,7 +3000,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
  */
 void dmz_dtr_metadata(struct dmz_metadata *zmd)
 {
-	unregister_shrinker(&zmd->mblk_shrinker);
+	shrinker_free(zmd->mblk_shrinker);
 	dmz_cleanup_metadata(zmd);
 	kfree(zmd);
 }
-- 
2.30.2


