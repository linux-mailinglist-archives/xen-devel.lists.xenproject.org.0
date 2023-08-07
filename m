Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C27720E8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578123.905532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyFE-0001LZ-MO; Mon, 07 Aug 2023 11:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578123.905532; Mon, 07 Aug 2023 11:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyFE-0001Bk-0x; Mon, 07 Aug 2023 11:17:52 +0000
Received: by outflank-mailman (input) for mailman id 578123;
 Mon, 07 Aug 2023 11:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSy9s-00018O-M4
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:12:20 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 457eec2a-3513-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:12:19 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2684e225a6cso660486a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:12:19 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:12:17 -0700 (PDT)
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
X-Inumbo-ID: 457eec2a-3513-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406737; x=1692011537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAY9+N2BbVQBjCT3MmFWkPxUR/2vf6o4m+CtMBoAzag=;
        b=Owhbp+vjTX9LgSb8kQ7MIhVXGKwDLhR+Ce+1Ax0621Bs9MrN8XWMe5+Ejw9lnwM3Ap
         IYUW911/vhmnbFJp/stmhIc489u8MPAzdlnhNeoJi8rBqpYOKUrjixaEdD0XprSya4Vj
         PDunDNjaDu16T3tMnzjFT3t7h/oKuuaUvjmMy7sBXTr5KsxElViOqZ7/5M9dmikw8+EO
         wMQGbexE8DINXXSrzaCt4DliIlnjdofAsiKIz1t/gb0CaZI+4t4MLa+CBQGQ2Bhdx8d2
         /xQiP0jkFYD6YIUPc+4v26SX8VshwmbMbumt9peptq8jkLOVQze1kYBLFAMAnfkePzJe
         dicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406737; x=1692011537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAY9+N2BbVQBjCT3MmFWkPxUR/2vf6o4m+CtMBoAzag=;
        b=dJaLlLrmXgWOUZI5bd6mabvqQSDi5zxAoOIY5DmkmvxjladkBniJR1KpF80CQN4gVn
         W6Dh23XWa6Rxzqd44GMGQwJR1GQl2+L8Iiy6Azkvda//mScE4IgKhMzudVtkXkG2GIoR
         Ikl/D17VoOWT4fsS6gkisHziocfSMUXxu3+EQBm5tzrieUIfVvAV54SpIGt3swIF/jOB
         HrVRhv7hsRzczSw/Mm1UMrnVQngh228tx0wS5/QBSfmy4ncTj2fDf1JW/IMaUR4VDOyS
         H4dABN+e73ZmkxncHOUCV3YoAGFYANAeKnPpvAiHaM2YcCLUW/puvoVKZOwBC6URhiN2
         RL8A==
X-Gm-Message-State: ABy/qLYzkXcU4SUXxNNK7QPBmfLoLKf1g4gD6FBZXn4eK33atezC/J0e
	9IIb21uOD6cv2Sg0I2DsmKi28g==
X-Google-Smtp-Source: APBJJlGzkEm3Uqt9ffvJXbz1uvSm9jYeOQTwgnDKGaV/IZVLtdfAA6YtivYmWFIriEmVEE/lzsK+Ow==
X-Received: by 2002:a17:90a:faf:b0:268:abc:83d5 with SMTP id 44-20020a17090a0faf00b002680abc83d5mr23476433pjz.4.1691406737630;
        Mon, 07 Aug 2023 04:12:17 -0700 (PDT)
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
Subject: [PATCH v4 11/48] gfs2: dynamically allocate the gfs2-glock shrinker
Date: Mon,  7 Aug 2023 19:08:59 +0800
Message-Id: <20230807110936.21819-12-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the gfs2-glock shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/gfs2/glock.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1438e7465e30..8d582ba7514f 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2046,11 +2046,7 @@ static unsigned long gfs2_glock_shrink_count(struct shrinker *shrink,
 	return vfs_pressure_ratio(atomic_read(&lru_count));
 }
 
-static struct shrinker glock_shrinker = {
-	.seeks = DEFAULT_SEEKS,
-	.count_objects = gfs2_glock_shrink_count,
-	.scan_objects = gfs2_glock_shrink_scan,
-};
+static struct shrinker *glock_shrinker;
 
 /**
  * glock_hash_walk - Call a function for glock in a hash bucket
@@ -2472,13 +2468,19 @@ int __init gfs2_glock_init(void)
 		return -ENOMEM;
 	}
 
-	ret = register_shrinker(&glock_shrinker, "gfs2-glock");
-	if (ret) {
+	glock_shrinker = shrinker_alloc(0, "gfs2-glock");
+	if (!glock_shrinker) {
 		destroy_workqueue(glock_workqueue);
 		rhashtable_destroy(&gl_hash_table);
-		return ret;
+		return -ENOMEM;
 	}
 
+	glock_shrinker->count_objects = gfs2_glock_shrink_count;
+	glock_shrinker->scan_objects = gfs2_glock_shrink_scan;
+	glock_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(glock_shrinker);
+
 	for (i = 0; i < GLOCK_WAIT_TABLE_SIZE; i++)
 		init_waitqueue_head(glock_wait_table + i);
 
@@ -2487,7 +2489,7 @@ int __init gfs2_glock_init(void)
 
 void gfs2_glock_exit(void)
 {
-	unregister_shrinker(&glock_shrinker);
+	shrinker_free(glock_shrinker);
 	rhashtable_destroy(&gl_hash_table);
 	destroy_workqueue(glock_workqueue);
 }
-- 
2.30.2


