Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99675F066
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568597.888171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsDP-0000QO-Ai; Mon, 24 Jul 2023 09:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568597.888171; Mon, 24 Jul 2023 09:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsDO-0008G6-08; Mon, 24 Jul 2023 09:50:54 +0000
Received: by outflank-mailman (input) for mailman id 568597;
 Mon, 24 Jul 2023 09:50:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsCf-0000Sq-EE
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:50:09 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78bfb01a-2a07-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:50:08 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bb91c20602so2230925ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:50:08 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:50:06 -0700 (PDT)
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
X-Inumbo-ID: 78bfb01a-2a07-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192207; x=1690797007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tyryk3a6lKy52HCDJ7LTSnMns1BMfalny9tATaKfF4=;
        b=amQ/RyxG43H24ZUKc8otE5jiO+PYmxLlS/jMlPB0P6LNf3YwKIyMMGT5x5GETrJzMq
         RUBPJl4XNLYJOZfW+4QQddSzJ1AOcHQOg+iS5NlIsw7P4JxkBKv7P6vm/OPtlqHKc3hY
         SLjp5JA2uLEQMXCeF85H9FjbP+u1neEShB4g/q4BDTYJUem7uHrE3aZx7t8/OvBixlxe
         PbLUlPG8K2MumMSz8pDMF7zGqwESYJNwxt0dJLhsSfALoKSzpnkM0Hd7rb9gY0+HtLOP
         61X4fPzjkMASXPftIRT+bLKVEY2jgFRxsHYQZDL2GJ8BmZMhp7tc/64KlMZKvh3Rfksj
         0TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192207; x=1690797007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tyryk3a6lKy52HCDJ7LTSnMns1BMfalny9tATaKfF4=;
        b=dLWWJQh6Ph8fLllFRMpEbxlpipMqC09oCxZk1GEPsJhsWJMhErGhA/MXHp/Jz2GNJ1
         wAZ4IytYpKXpRrzJ80XkMC1NXq+veVGFSGnhENlAoPWTIOOkJgH2R4L9ODBRzPUZz4Z3
         6WViFFh5fLAZUHU4q2cE3ngLVvhf7TEtaehvClU6Yn9QicZNIEvHOYirMB7ViqNcdq9o
         nq58M8QWcHFB06D3NH+09rulpRYvbriPhAzuhWWU6g589hSBmlSNx9KxMmp9MD5ZesHS
         wkBM2oaQz2l+bC35OsF9XWmPNvDzDfZW2FEqm9ySiSnw9CoKnBDrtBu6O8tL/CNtACDo
         wumg==
X-Gm-Message-State: ABy/qLZxkC/7512YXTBmBLwWR0f+Zv7n6sVAsqou039F+JQ68pfyD/jm
	0KxeZD9QxUmIrEBS/nrLAc5J5w==
X-Google-Smtp-Source: APBJJlGNSrKSFiHfBgDCDwymx1T6XElAyTc+fmhNn0a9fde+MwuOtWNaHmnJx2SRiMlK6zefGJ37qA==
X-Received: by 2002:a17:902:f682:b0:1b3:ec39:f42c with SMTP id l2-20020a170902f68200b001b3ec39f42cmr12377411plg.5.1690192206827;
        Mon, 24 Jul 2023 02:50:06 -0700 (PDT)
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
Subject: [PATCH v2 25/47] dm: dynamically allocate the dm-bufio shrinker
Date: Mon, 24 Jul 2023 17:43:32 +0800
Message-Id: <20230724094354.90817-26-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the dm-bufio shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct dm_bufio_client.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/dm-bufio.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index bc309e41d074..028e30a4b2d0 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -963,7 +963,7 @@ struct dm_bufio_client {
 
 	sector_t start;
 
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 	struct work_struct shrink_work;
 	atomic_long_t need_shrink;
 
@@ -2368,7 +2368,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
 {
 	struct dm_bufio_client *c;
 
-	c = container_of(shrink, struct dm_bufio_client, shrinker);
+	c = shrink->private_data;
 	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
 	queue_work(dm_bufio_wq, &c->shrink_work);
 
@@ -2377,7 +2377,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
 
 static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 {
-	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
+	struct dm_bufio_client *c = shrink->private_data;
 	unsigned long count = cache_total(&c->cache);
 	unsigned long retain_target = get_retain_buffers(c);
 	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
@@ -2490,15 +2490,19 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
 	INIT_WORK(&c->shrink_work, shrink_work);
 	atomic_long_set(&c->need_shrink, 0);
 
-	c->shrinker.count_objects = dm_bufio_shrink_count;
-	c->shrinker.scan_objects = dm_bufio_shrink_scan;
-	c->shrinker.seeks = 1;
-	c->shrinker.batch = 0;
-	r = register_shrinker(&c->shrinker, "dm-bufio:(%u:%u)",
-			      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
-	if (r)
+	c->shrinker = shrinker_alloc(0, "dm-bufio:(%u:%u)",
+				     MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
+	if (!c->shrinker)
 		goto bad;
 
+	c->shrinker->count_objects = dm_bufio_shrink_count;
+	c->shrinker->scan_objects = dm_bufio_shrink_scan;
+	c->shrinker->seeks = 1;
+	c->shrinker->batch = 0;
+	c->shrinker->private_data = c;
+
+	shrinker_register(c->shrinker);
+
 	mutex_lock(&dm_bufio_clients_lock);
 	dm_bufio_client_count++;
 	list_add(&c->client_list, &dm_bufio_all_clients);
@@ -2537,7 +2541,7 @@ void dm_bufio_client_destroy(struct dm_bufio_client *c)
 
 	drop_buffers(c);
 
-	unregister_shrinker(&c->shrinker);
+	shrinker_unregister(c->shrinker);
 	flush_work(&c->shrink_work);
 
 	mutex_lock(&dm_bufio_clients_lock);
-- 
2.30.2


