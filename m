Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C34975F052
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568569.888064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD5-0003Ny-2e; Mon, 24 Jul 2023 09:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568569.888064; Mon, 24 Jul 2023 09:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD4-0003A8-8W; Mon, 24 Jul 2023 09:50:34 +0000
Received: by outflank-mailman (input) for mailman id 568569;
 Mon, 24 Jul 2023 09:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsAY-0007Pe-CF
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:47:58 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29da9214-2a07-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:47:56 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b7dfb95761so5876465ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:47:55 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:47:54 -0700 (PDT)
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
X-Inumbo-ID: 29da9214-2a07-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192074; x=1690796874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qReDjbjFz0xyiV7re04rgbBc1uubNDIxQ7QKRYWZSRs=;
        b=ENVLEGhvMjLiUvisyoHJontwb50xfTslV0XVCIZNbj3XxjFa+A4sTXO4Rw3QqFmux5
         XbznTWGuyuir8FMQeIa7tywzBJUnyvYSwuYJ02HBKdcTkSJdAtoOPw44n28eP8zUKucc
         q8yY+ysDs6yXU3SX/8XFuGMKyo+SMyS0Zlg4rwVloT2TyOVOz/Imh5E9tEAGm8xg8jyO
         QATQrcFlR17SUbjRuc1dqQxPY8algfDWOcvmKhvXGbaXm39iJYJiLthaOzWAxzJVeqgh
         fJOtvB6CBEjtg12DSwkb6lmHRDFIhGbGsjcgpxt8MGvrxNBdwtVQD4ot+/N3ASfLH/lS
         XEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192074; x=1690796874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qReDjbjFz0xyiV7re04rgbBc1uubNDIxQ7QKRYWZSRs=;
        b=YDx8jm6pOIY3u4qiKr2Eo6LY1/wVzPS9L8jRSU2nqkQoTwWHJCVtcsL1qilT0k1ldf
         s5kFjVWpuBAuXCXrPyakbjaA6HLl9bSiCr6dtIW81AJcwG857qru0uniX/RIoGmmZEJb
         3/rKc+kZuQCYp6t4uSvuClq2J0gCJ38plwwFvk8PtXENnlj90j2o+xEbYOLYEI3CThI6
         00bulTJ50suZoagXNrOse0dcLN2UkjZNddnPgP3d60N/xUzaZ9IykKrkrLP9OtU2wtUR
         Q84vQsbp13xScKGbFRM8edbNQOqU8rpHDQwRsRsxsiTzuU0Jxvopzf//r93mBQEx0PVR
         nd0w==
X-Gm-Message-State: ABy/qLZdPaoEeFn6rn/S22Gfjzc1kKIeWL0sU+qB5jKd5uI5H47HpD4F
	uyXAFXzyzjNlthVmvAM9u8UwyA==
X-Google-Smtp-Source: APBJJlFmRr0YS7/80cQjb3Wv0/ryy4A2Bv0/hjBc48SsvJ3Rmt9/pUa2TTT24oRtgj6qJ02D1OEnuA==
X-Received: by 2002:a17:902:dacf:b0:1b8:9215:9163 with SMTP id q15-20020a170902dacf00b001b892159163mr12197474plx.6.1690192074491;
        Mon, 24 Jul 2023 02:47:54 -0700 (PDT)
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
Subject: [PATCH v2 14/47] nfsd: dynamically allocate the nfsd-filecache shrinker
Date: Mon, 24 Jul 2023 17:43:21 +0800
Message-Id: <20230724094354.90817-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the nfsd-filecache shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/nfsd/filecache.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index ee9c923192e0..50216768d408 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -521,11 +521,7 @@ nfsd_file_lru_scan(struct shrinker *s, struct shrink_control *sc)
 	return ret;
 }
 
-static struct shrinker	nfsd_file_shrinker = {
-	.scan_objects = nfsd_file_lru_scan,
-	.count_objects = nfsd_file_lru_count,
-	.seeks = 1,
-};
+static struct shrinker *nfsd_file_shrinker;
 
 /**
  * nfsd_file_cond_queue - conditionally unhash and queue a nfsd_file
@@ -746,12 +742,18 @@ nfsd_file_cache_init(void)
 		goto out_err;
 	}
 
-	ret = register_shrinker(&nfsd_file_shrinker, "nfsd-filecache");
-	if (ret) {
-		pr_err("nfsd: failed to register nfsd_file_shrinker: %d\n", ret);
+	nfsd_file_shrinker = shrinker_alloc(0, "nfsd-filecache");
+	if (!nfsd_file_shrinker) {
+		pr_err("nfsd: failed to allocate nfsd_file_shrinker\n");
 		goto out_lru;
 	}
 
+	nfsd_file_shrinker->count_objects = nfsd_file_lru_count;
+	nfsd_file_shrinker->scan_objects = nfsd_file_lru_scan;
+	nfsd_file_shrinker->seeks = 1;
+
+	shrinker_register(nfsd_file_shrinker);
+
 	ret = lease_register_notifier(&nfsd_file_lease_notifier);
 	if (ret) {
 		pr_err("nfsd: unable to register lease notifier: %d\n", ret);
@@ -774,7 +776,7 @@ nfsd_file_cache_init(void)
 out_notifier:
 	lease_unregister_notifier(&nfsd_file_lease_notifier);
 out_shrinker:
-	unregister_shrinker(&nfsd_file_shrinker);
+	shrinker_unregister(nfsd_file_shrinker);
 out_lru:
 	list_lru_destroy(&nfsd_file_lru);
 out_err:
@@ -891,7 +893,7 @@ nfsd_file_cache_shutdown(void)
 		return;
 
 	lease_unregister_notifier(&nfsd_file_lease_notifier);
-	unregister_shrinker(&nfsd_file_shrinker);
+	shrinker_unregister(nfsd_file_shrinker);
 	/*
 	 * make sure all callers of nfsd_file_lru_cb are done before
 	 * calling nfsd_file_cache_purge
-- 
2.30.2


