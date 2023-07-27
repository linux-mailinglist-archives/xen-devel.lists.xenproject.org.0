Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F3764AF0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570864.893231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw6t-0002Tv-8c; Thu, 27 Jul 2023 08:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570864.893231; Thu, 27 Jul 2023 08:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw6t-0002S7-5p; Thu, 27 Jul 2023 08:12:35 +0000
Received: by outflank-mailman (input) for mailman id 570864;
 Thu, 27 Jul 2023 08:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw6r-0001uZ-6r
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:12:33 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 551987c5-2c55-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:12:31 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so183566b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:12:31 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:12:29 -0700 (PDT)
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
X-Inumbo-ID: 551987c5-2c55-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445550; x=1691050350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVRvDV5EwClRaurogoo7jeCmWiPiam6NNimoVigpYsU=;
        b=VWs5xsEpAgA4DYNqF8K/FN4j7udZSbXqCeXnxv3YTG0Ik0TL2nl/Ugga9u7R+ZJeNR
         Wigeakgpk32H5TPwyUhkE7IqyM04zeUMVcePDa9eTKcIqF7mvyeMYMdU6pDKFeWcNWaR
         qvQCy7Nu/xowW6gGi5vD7bu0NuXZ8UlBiffMC2ufEn1khdTpqjsjaFRzBjIrPJfwSFKG
         LuwPnQLNAsZ+sSXWuMdy2i4BIcl75Eemb6JwQ/h/qU8W848mv79pSK1svvdUmrASzQOQ
         aQzV7ZNEhcTzx5oZvxCfNrl/tTU7BbbCJB9SufDvnC5P9J0UXQ5a+DGx/aTVEKn/U2IP
         9i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445550; x=1691050350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVRvDV5EwClRaurogoo7jeCmWiPiam6NNimoVigpYsU=;
        b=Co+Tzr4CJk538Et8RxlMqxQ/m4ZsH6yTuKWX8G6kDeZRoQvCIKEunKdir0rWOQ0utX
         0fLQG3H9zXQ9mvP9WU1zGu4hQqvHEJ8O2vrcRLzuIg5r+CRAWmwTdVsC8WX49e7WBvC5
         C1ZjczeaAkPS20AGDgbWLxQLHubi2rRCM949CAIzxRZzCRuS6KNV7ENgM3fWL+d7fOAN
         0QTbmDLBome7pdLlXbMDwcHPTobuPY2NYue9lYEeg3+VfgjIdhjDpdHclj1+NdxiqR/L
         qicqLZYTR13879TdR7S+DUk71bk1+9HS/vrdplQaQgmEVKw4Wyjt1nF6+bngJOi/gEB3
         KWpQ==
X-Gm-Message-State: ABy/qLavh3HolSoCx3xpd9MSztiOcsdZIFeO/ELLw83VUXUiEeJUSZSB
	bZue7NckC7aF5k73p/A/9S5t6w==
X-Google-Smtp-Source: APBJJlF08KF/2Ja1GiYKXzi0SbMDWba0XluK8fJxZEI3QrufrkFF+7lpMuNnhPZU1iQtSxNfzq1jqw==
X-Received: by 2002:a05:6a21:32a9:b0:136:f3ef:4d2 with SMTP id yt41-20020a056a2132a900b00136f3ef04d2mr6069372pzb.3.1690445550183;
        Thu, 27 Jul 2023 01:12:30 -0700 (PDT)
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
Subject: [PATCH v3 33/49] mbcache: dynamically allocate the mbcache shrinker
Date: Thu, 27 Jul 2023 16:04:46 +0800
Message-Id: <20230727080502.77895-34-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the mbcache shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct mb_cache.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/mbcache.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/mbcache.c b/fs/mbcache.c
index 2a4b8b549e93..0d1e24e9a5e3 100644
--- a/fs/mbcache.c
+++ b/fs/mbcache.c
@@ -37,7 +37,7 @@ struct mb_cache {
 	struct list_head	c_list;
 	/* Number of entries in cache */
 	unsigned long		c_entry_count;
-	struct shrinker		c_shrink;
+	struct shrinker		*c_shrink;
 	/* Work for shrinking when the cache has too many entries */
 	struct work_struct	c_shrink_work;
 };
@@ -293,8 +293,7 @@ EXPORT_SYMBOL(mb_cache_entry_touch);
 static unsigned long mb_cache_count(struct shrinker *shrink,
 				    struct shrink_control *sc)
 {
-	struct mb_cache *cache = container_of(shrink, struct mb_cache,
-					      c_shrink);
+	struct mb_cache *cache = shrink->private_data;
 
 	return cache->c_entry_count;
 }
@@ -333,8 +332,7 @@ static unsigned long mb_cache_shrink(struct mb_cache *cache,
 static unsigned long mb_cache_scan(struct shrinker *shrink,
 				   struct shrink_control *sc)
 {
-	struct mb_cache *cache = container_of(shrink, struct mb_cache,
-					      c_shrink);
+	struct mb_cache *cache = shrink->private_data;
 	return mb_cache_shrink(cache, sc->nr_to_scan);
 }
 
@@ -377,15 +375,20 @@ struct mb_cache *mb_cache_create(int bucket_bits)
 	for (i = 0; i < bucket_count; i++)
 		INIT_HLIST_BL_HEAD(&cache->c_hash[i]);
 
-	cache->c_shrink.count_objects = mb_cache_count;
-	cache->c_shrink.scan_objects = mb_cache_scan;
-	cache->c_shrink.seeks = DEFAULT_SEEKS;
-	if (register_shrinker(&cache->c_shrink, "mbcache-shrinker")) {
+	cache->c_shrink = shrinker_alloc(0, "mbcache-shrinker");
+	if (!cache->c_shrink) {
 		kfree(cache->c_hash);
 		kfree(cache);
 		goto err_out;
 	}
 
+	cache->c_shrink->count_objects = mb_cache_count;
+	cache->c_shrink->scan_objects = mb_cache_scan;
+	cache->c_shrink->seeks = DEFAULT_SEEKS;
+	cache->c_shrink->private_data = cache;
+
+	shrinker_register(cache->c_shrink);
+
 	INIT_WORK(&cache->c_shrink_work, mb_cache_shrink_worker);
 
 	return cache;
@@ -406,7 +409,7 @@ void mb_cache_destroy(struct mb_cache *cache)
 {
 	struct mb_cache_entry *entry, *next;
 
-	unregister_shrinker(&cache->c_shrink);
+	shrinker_free(cache->c_shrink);
 
 	/*
 	 * We don't bother with any locking. Cache must not be used at this
-- 
2.30.2


