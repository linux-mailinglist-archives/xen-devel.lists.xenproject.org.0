Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D1764AA9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570860.893212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw5K-0001Id-HL; Thu, 27 Jul 2023 08:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570860.893212; Thu, 27 Jul 2023 08:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw5K-0001GL-EM; Thu, 27 Jul 2023 08:10:58 +0000
Received: by outflank-mailman (input) for mailman id 570860;
 Thu, 27 Jul 2023 08:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw5I-0005Vh-Uy
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:10:56 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b977ad6-2c55-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:10:55 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so204303b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:10:55 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:10:53 -0700 (PDT)
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
X-Inumbo-ID: 1b977ad6-2c55-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445453; x=1691050253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu9w5C30y8MI/napZavPwFZ6nIJBEFlaB1CCEG9BfCw=;
        b=SsnsAPan45QSmQpJqAj4mS8LLavDombkZ7lBafLri7RggDFTDcpBOPuNyPBGUpCtjr
         o6WPy8R5HZiwm+Xan4YH//v4pvtUrfeXD65Yl1az+1fl+mR3tGlsBglM3Vyq8SiK2wyq
         igQhG5qCvspbkK2WSeD0wTcUc/mVkzohC4cNnc0XbtmIoWLvLOUFPW/6keJGSZm27mRz
         h/WfB+fRpcVUE83zuhvMF8jYZ5b4nmh/qAHVpz3lROeGSQfLjlNrgG+gcbPX1nT5Mc7l
         SChQ2Lyx0ddDcRFnW8nA/XTZimbKDOI/X2WL7QqkejXsVeMe1ddjPlvbW0l5uaRLNo6A
         kpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445453; x=1691050253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu9w5C30y8MI/napZavPwFZ6nIJBEFlaB1CCEG9BfCw=;
        b=F+u8Qifj4qONNm7/7GW54rckd9CNqQdY1Zk6LgGx1uxWM4wpEqKML3KIBaCUZZ+Tsd
         wDSuPkRXNAr9siIlKoyo0W/XaJaMFql4eNmz7ck8MPhUYVsuf5VAlNrw5XcfBj9R0lXv
         UzS386SRqeYtc9VloOfibIuKF1S8B+vSMJVvnS15a/3nczRLjVmz6LVr/OC4O2lty1YY
         FjgrkrSXhvwEs2pEd8lr/R/q2A7ZS7GPpuABwkj3S+TSMM083V4l4Cb+CEVfKlXEYKDw
         H4xqQ7NVcLnLRBTzS4NOpuTjvrZwKmIKJO/xoT0XClVy3aRGEcTq4GeQpt9zh7b9fJvN
         HBGg==
X-Gm-Message-State: ABy/qLYEyJ2HAXpnb+4x1CfN9pmmRagW9KrxjTo9GqrwcSnzavnekBBz
	M9m2WzGZdcguiWsdQRjV3y9gSg==
X-Google-Smtp-Source: APBJJlH8SkZovaBL43/tLWqoZ3fBR0XBkmVGy0uXARpdi3AER3WOYf3EsHJKszN8s65be9uhrbpx8A==
X-Received: by 2002:a05:6a20:12d3:b0:125:6443:4eb8 with SMTP id v19-20020a056a2012d300b0012564434eb8mr5769272pzg.5.1690445453524;
        Thu, 27 Jul 2023 01:10:53 -0700 (PDT)
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 25/49] drm/msm: dynamically allocate the drm-msm_gem shrinker
Date: Thu, 27 Jul 2023 16:04:38 +0800
Message-Id: <20230727080502.77895-26-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the drm-msm_gem shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct msm_drm_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  4 +--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 34 ++++++++++++++++----------
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4bd028fa7500..7f20249d6071 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -462,7 +462,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	msm_gem_shrinker_init(ddev);
+	ret = msm_gem_shrinker_init(ddev);
+	if (ret)
+		goto err_msm_uninit;
 
 	if (priv->kms_init) {
 		ret = priv->kms_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 02fd6c7d0bb7..e2fc56f161b5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -221,7 +221,7 @@ struct msm_drm_private {
 	} vram;
 
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	struct drm_atomic_state *pm_state;
 
@@ -283,7 +283,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
 #endif
 
-void msm_gem_shrinker_init(struct drm_device *dev);
+int msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index f38296ad8743..20699993e4f8 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
 static unsigned long
 msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct msm_drm_private *priv =
-		container_of(shrinker, struct msm_drm_private, shrinker);
+	struct msm_drm_private *priv = shrinker->private_data;
 	unsigned count = priv->lru.dontneed.count;
 
 	if (can_swap())
@@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
 static unsigned long
 msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct msm_drm_private *priv =
-		container_of(shrinker, struct msm_drm_private, shrinker);
+	struct msm_drm_private *priv = shrinker->private_data;
 	struct {
 		struct drm_gem_lru *lru;
 		bool (*shrink)(struct drm_gem_object *obj);
@@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
 	struct shrink_control sc = {
 		.nr_to_scan = nr_to_scan,
 	};
-	int ret;
+	unsigned long ret = SHRINK_STOP;
 
 	fs_reclaim_acquire(GFP_KERNEL);
-	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
+	if (priv->shrinker)
+		ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
 	fs_reclaim_release(GFP_KERNEL);
 
 	return ret;
@@ -210,16 +209,25 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
  *
  * This function registers and sets up the msm shrinker.
  */
-void msm_gem_shrinker_init(struct drm_device *dev)
+int msm_gem_shrinker_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	priv->shrinker.count_objects = msm_gem_shrinker_count;
-	priv->shrinker.scan_objects = msm_gem_shrinker_scan;
-	priv->shrinker.seeks = DEFAULT_SEEKS;
-	WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
+
+	priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
+	if (!priv->shrinker)
+		return -ENOMEM;
+
+	priv->shrinker->count_objects = msm_gem_shrinker_count;
+	priv->shrinker->scan_objects = msm_gem_shrinker_scan;
+	priv->shrinker->seeks = DEFAULT_SEEKS;
+	priv->shrinker->private_data = priv;
+
+	shrinker_register(priv->shrinker);
 
 	priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
 	WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
+
+	return 0;
 }
 
 /**
@@ -232,8 +240,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (priv->shrinker.nr_deferred) {
+	if (priv->shrinker) {
 		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
-		unregister_shrinker(&priv->shrinker);
+		shrinker_free(priv->shrinker);
 	}
 }
-- 
2.30.2


