Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484B75F062
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568593.888154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsDM-0007xM-Lj; Mon, 24 Jul 2023 09:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568593.888154; Mon, 24 Jul 2023 09:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsDL-0007Tc-8F; Mon, 24 Jul 2023 09:50:51 +0000
Received: by outflank-mailman (input) for mailman id 568593;
 Mon, 24 Jul 2023 09:49:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsCH-0007Pe-W3
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:49:45 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a458985-2a07-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:49:44 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bba9539a23so645295ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:49:43 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:49:42 -0700 (PDT)
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
X-Inumbo-ID: 6a458985-2a07-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192182; x=1690796982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPgx5tx5pugTz0d6jibfzfGw2xSKE+ix47CgP1Qw/g4=;
        b=eNFqSXTl7Fs+A61apTH/V806oFNFqUEW9iBW/QGnoaz3m8bxFzAIk52taB3hTPoo0J
         15Uy/EhxhzzXrAniIeKy95ZVaJB60ETDr5+Beo/2JORQV0eMMIYUvFGSn01JXJQmgfvF
         wVSzhI8MrjoxVzBXxfbK/bzinkaNiYLaxnx8BzakR2VO4bS5jTMeezTAiUWxMRd9glqy
         y7ZbeUA/amFMlmdildpnpY/ykDL2iuVB+OIlcnryGkEk6VSFnVV3f/s+KAnTQMPBvZI0
         bhvIVOkp7ajnZG67FTbNaTw3FFqm546EN6Ypmf7e8IynzALyaOfSF7MjrTN2cH5bObeQ
         XNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192182; x=1690796982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPgx5tx5pugTz0d6jibfzfGw2xSKE+ix47CgP1Qw/g4=;
        b=RjEPDcsi/fckVyuYHlAPVUyLa5zLwkQKGzw/vqotMw4PHVOlYboHeYwC9te5o8xBXR
         lrQOau2IM7XWUtCFwsMFKEPRFTOHyZnPY9w7XPTrDsdYQOA8K3ISkLHjlDaMvlkCQ9kh
         DRvP2MqTZFZljNSr83+ItXZmrB4Y51JXzXvUBTVbgbKSTl/ay6OcP8aQy0WwNSLeE+9S
         OlYSUdy/udwr48DnfRnFng64YJ5cWS//E4FsSWtVNS140G4sMVpZNVjnaqubUZifJr3x
         +6MumYLWuAKYumH/q50DqLP7kQeaudX2IHQsDgN8LlPbu0pHWz7fBg1ibXY1RZ8SdtJg
         OtHw==
X-Gm-Message-State: ABy/qLZLEloRcyprfm5N0XQ50tGcdVbcPPGevQ/UqKM7FWqSf9p10Za0
	9/qDi6S4G0lzmtY+BWUak/oFug==
X-Google-Smtp-Source: APBJJlHNherDqZFzA7p7tcMEc26kiZZ4z0G58iklJcv127ghy/RIpJQTR76k3+Vr6OIbO3Et5X/b8Q==
X-Received: by 2002:a17:903:2305:b0:1b8:b0c4:2e3d with SMTP id d5-20020a170903230500b001b8b0c42e3dmr12244115plh.4.1690192182555;
        Mon, 24 Jul 2023 02:49:42 -0700 (PDT)
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
Subject: [PATCH v2 23/47] drm/msm: dynamically allocate the drm-msm_gem shrinker
Date: Mon, 24 Jul 2023 17:43:30 +0800
Message-Id: <20230724094354.90817-24-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the drm-msm_gem shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct msm_drm_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
 drivers/gpu/drm/msm/msm_drv.h          |  4 +--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 36 ++++++++++++++++----------
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 891eff8433a9..7f6933be703f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -461,7 +461,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	msm_gem_shrinker_init(ddev);
+	ret = msm_gem_shrinker_init(ddev);
+	if (ret)
+		goto err_msm_uninit;
 
 	if (priv->kms_init) {
 		ret = priv->kms_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..84523d4a1e58 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -217,7 +217,7 @@ struct msm_drm_private {
 	} vram;
 
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	struct drm_atomic_state *pm_state;
 
@@ -279,7 +279,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
 #endif
 
-void msm_gem_shrinker_init(struct drm_device *dev);
+int msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index f38296ad8743..7daab1298c11 100644
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
@@ -210,16 +209,27 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
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
+	if (!priv->shrinker) {
+		WARN_ON(1);
+		return -ENOMEM;
+	}
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
@@ -232,8 +242,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (priv->shrinker.nr_deferred) {
+	if (priv->shrinker) {
 		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
-		unregister_shrinker(&priv->shrinker);
+		shrinker_unregister(priv->shrinker);
 	}
 }
-- 
2.30.2


