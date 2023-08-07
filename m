Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3C771F9D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578032.905254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSy8q-0004sR-Vu; Mon, 07 Aug 2023 11:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578032.905254; Mon, 07 Aug 2023 11:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSy8q-0004pp-Rj; Mon, 07 Aug 2023 11:11:16 +0000
Received: by outflank-mailman (input) for mailman id 578032;
 Mon, 07 Aug 2023 11:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSy8p-0002Ee-5f
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:11:15 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f15c7de-3513-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 13:11:14 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so361726a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:11:14 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:11:12 -0700 (PDT)
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
X-Inumbo-ID: 1f15c7de-3513-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406673; x=1692011473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ2nJ797AaeiRC4tEbuFSwr/qroaEGD64TBkJX9gwcc=;
        b=ln47b2De8WoaconN/yovNFIYkpyrSlbHjJ7O30AuN0v3fhaptV8Rv8p/uTgMw5ewUp
         ZG1baXWX3w4cWqVDXIBOemS0oLj2+PNkaGXC2OZVpKMXphkVdxVMTs/lnTAL5HQl/5sY
         XaAH/gxR2iJTsD9i1SGvIVeauJ8ohBUlyO6fZCAIfCsaCSqlNBgSWC3X4OcCTxOF8D8P
         aJ3rhIbrBRQ4RScgXu8Juii6sq5YNvbJw6x09Ixyfaq7t74WXRGryvfs7JEz6b0jZFwc
         ahGUwsb8fn5Z7b9T7/r6r1MmeGyYyDblu8RFgBNHHb0eaf9aJCBTyNjHYvmNxb3vGqrU
         A9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406673; x=1692011473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ2nJ797AaeiRC4tEbuFSwr/qroaEGD64TBkJX9gwcc=;
        b=M0ZiYOwDXC+xMfiI3/AdM+JNwS2KIJvSXGSyd84mZ+ZAZR6pA0l/tqtjSb1ZGxjiIX
         8CeoBb/aaG4hU1Wq8DocHW3vqnhvsbb0qFi5eCjPI5zlKpcopyiiOPf5Ov2qZww4uEZ3
         FRtrywCOLP8/p1AMl1653HQ/3rqb/v2wg0H6mF/J03gLPs389DenxTfaXorlaebkSPe3
         5xT5YOUwxfbzeifg8eAxKy1MsL/pl5zldHW87whDuP2I9BR4sW6F6WrsnJIZIxTFFWws
         T8F+avXyysnHFF5KOOy9yZ7+M7IWJ0GT7VbnkIwDj0xn7A3qUNkxbPPll1bfrP/E8SLP
         VDcg==
X-Gm-Message-State: ABy/qLYYGz1UeYzt7o54ETlyEANcTPR/oLu4Y5QcJyd4GBbi/T/tf7bw
	5hoV8o+Vt7DCoES4zm3URdtNaw==
X-Google-Smtp-Source: APBJJlHrBtuiCQCJiVcJQ0g2xFi5uTTiYi1uZvqZ47NJp4VxlVmrIr4dlBS1TaGO2GoKAlBNE4DJvw==
X-Received: by 2002:a17:90a:53a3:b0:268:437:7bd9 with SMTP id y32-20020a17090a53a300b0026804377bd9mr23468663pjh.3.1691406672888;
        Mon, 07 Aug 2023 04:11:12 -0700 (PDT)
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
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 06/48] binder: dynamically allocate the android-binder shrinker
Date: Mon,  7 Aug 2023 19:08:54 +0800
Message-Id: <20230807110936.21819-7-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the android-binder shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/android/binder_alloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e3db8297095a..62675cedd38e 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -1053,11 +1053,7 @@ binder_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 			    NULL, sc->nr_to_scan);
 }
 
-static struct shrinker binder_shrinker = {
-	.count_objects = binder_shrink_count,
-	.scan_objects = binder_shrink_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *binder_shrinker;
 
 /**
  * binder_alloc_init() - called by binder_open() for per-proc initialization
@@ -1077,19 +1073,30 @@ void binder_alloc_init(struct binder_alloc *alloc)
 
 int binder_alloc_shrinker_init(void)
 {
-	int ret = list_lru_init(&binder_alloc_lru);
+	int ret;
 
-	if (ret == 0) {
-		ret = register_shrinker(&binder_shrinker, "android-binder");
-		if (ret)
-			list_lru_destroy(&binder_alloc_lru);
+	ret = list_lru_init(&binder_alloc_lru);
+	if (ret)
+		return ret;
+
+	binder_shrinker = shrinker_alloc(0, "android-binder");
+	if (!binder_shrinker) {
+		list_lru_destroy(&binder_alloc_lru);
+		return -ENOMEM;
 	}
-	return ret;
+
+	binder_shrinker->count_objects = binder_shrink_count;
+	binder_shrinker->scan_objects = binder_shrink_scan;
+	binder_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(binder_shrinker);
+
+	return 0;
 }
 
 void binder_alloc_shrinker_exit(void)
 {
-	unregister_shrinker(&binder_shrinker);
+	shrinker_free(binder_shrinker);
 	list_lru_destroy(&binder_alloc_lru);
 }
 
-- 
2.30.2


