Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4EF764BD4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570911.893493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBz-0005ZX-C2; Thu, 27 Jul 2023 08:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570911.893493; Thu, 27 Jul 2023 08:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBy-00053I-Dg; Thu, 27 Jul 2023 08:17:50 +0000
Received: by outflank-mailman (input) for mailman id 570911;
 Thu, 27 Jul 2023 08:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw3W-0001DS-OQ
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:09:06 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daad8221-2c54-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 10:09:06 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so170865b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:09:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:09:04 -0700 (PDT)
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
X-Inumbo-ID: daad8221-2c54-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445345; x=1691050145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxxR7cKF9GXj8MC2HKPXqv6o5/ypcgPst5/afOqmqdU=;
        b=f78FOiI4CNId+Ml2PzU7mY1IxHereBLlHPf7s7X8Gy+u8ge3z2zcNtZJbXgkJ1G/QR
         Bypsj3Qfs4NqFk8L9OHPUra+lfok5RS+DDluwPHI9kxnAJLSgVKbtyU1LC00kLM6jzmr
         VkgjJJoznrUMJZqGeb8qVz0Juy94c4XL4Hr58JZjfVBDwwW2089Gloj9mnDr01+e3vie
         ATN8u6YkhMkKc+i92NbP56LSIJl/sZe4eRd/+9U9Zz62iXDekK8cKEfr5HTH0aUYxIkr
         BT13YNvigorKsMJZpm5Ugf1VrzOLWJZerOzcVEByhulhpkn1iKJBA5Dz0oLwz2cUXQdL
         iC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445345; x=1691050145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxxR7cKF9GXj8MC2HKPXqv6o5/ypcgPst5/afOqmqdU=;
        b=ZqWGaJ7ZJO8HJDnSUkn1nVtorDYYt/Mt2v0eu9BIBHbGnH7hVgu9i+eBjPupZA52nW
         hUxHD9HclXjcAyuJRiDRZfoYIkey3e5/m5ULp//PQY+nBnCc3TImOFBiKWJGO/a0ovnJ
         bOYbuxO71upTeyN906zOy/yPvMHBngaecRRhgVI5TanFOaM+jQe4NsgTuCIl/FEjFIBC
         WtOSKGJ0NfESfpe1PvQBrWXN7BAvKbF6+zAJUvpgVgvPAlEUqp0nJQIggRoe2BIzcDVR
         60lAPxqredmYr0+5iEzAyaYhqAhnBQiHua3kdbglfUOiz2czP3rRbrzvKoecZMhSkYsh
         AUtA==
X-Gm-Message-State: ABy/qLaRH6e0VZddnGgjvwfd7c6pPPGtAAyQSRObX7fK58YraIPQtJYi
	9rkNnaxb5+okiPMOrzkeTz1Jiw==
X-Google-Smtp-Source: APBJJlFoKDsbKkERIQGnm+LFaFeLpxhRzI1EaDrRxfTAKZLr632PKwn78Yey2tH1KRLEMSWua5HIxg==
X-Received: by 2002:a05:6a00:4a10:b0:686:b990:560f with SMTP id do16-20020a056a004a1000b00686b990560fmr4379620pfb.2.1690445344746;
        Thu, 27 Jul 2023 01:09:04 -0700 (PDT)
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
Subject: [PATCH v3 16/49] nfsd: dynamically allocate the nfsd-filecache shrinker
Date: Thu, 27 Jul 2023 16:04:29 +0800
Message-Id: <20230727080502.77895-17-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the nfsd-filecache shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/nfsd/filecache.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index ee9c923192e0..872eb9501965 100644
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
+	shrinker_free(nfsd_file_shrinker);
 out_lru:
 	list_lru_destroy(&nfsd_file_lru);
 out_err:
@@ -891,7 +893,7 @@ nfsd_file_cache_shutdown(void)
 		return;
 
 	lease_unregister_notifier(&nfsd_file_lease_notifier);
-	unregister_shrinker(&nfsd_file_shrinker);
+	shrinker_free(nfsd_file_shrinker);
 	/*
 	 * make sure all callers of nfsd_file_lru_cb are done before
 	 * calling nfsd_file_cache_purge
-- 
2.30.2


