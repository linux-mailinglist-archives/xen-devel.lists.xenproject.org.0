Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C175F057
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568574.888084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD8-0004AF-Bp; Mon, 24 Jul 2023 09:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568574.888084; Mon, 24 Jul 2023 09:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD7-0003pO-HS; Mon, 24 Jul 2023 09:50:37 +0000
Received: by outflank-mailman (input) for mailman id 568574;
 Mon, 24 Jul 2023 09:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsAv-0007Pe-KG
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:48:21 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 382642cf-2a07-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:48:19 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bb91c20602so2228665ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:48:19 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:48:18 -0700 (PDT)
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
X-Inumbo-ID: 382642cf-2a07-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192098; x=1690796898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av+QDe1dYuRDqLy0LPAsVex0suGCyDNqgU4hNImbDOo=;
        b=bDwQiK4fS0yTwWq4oVGVRKxPIDCclDxFD1XuAsmfHKruu98HTXXz11gYjdkSK/HgQ4
         rQnPx3dscLMyKil4aICcT0ClG/ZXMBy6mCQ6rCkQE03v5xWhoTzeYQvpLwD9l9p7vXT0
         v6DYimpLGMp1ValFsBMSR4AyqoftBHG/Cr11IkBPDpuRa7fi2izlKP1Mq3g/2PWtCUJ9
         byo8ZZ2a8q2qzXYTrMXoHTjOf2N4B4XMSkAD5N1iIFEjrTIqUQlkmwpGlE+j3WXksgRd
         fNHXLvhFxXWRY9vsToZ4OCxL1qfGN5pYRyHLSBIlboKFdsL2/OFWebl/aiL58+zCQO6q
         AKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192098; x=1690796898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av+QDe1dYuRDqLy0LPAsVex0suGCyDNqgU4hNImbDOo=;
        b=Pgm5J1Lwu3zbgdYuWiXKxV+eiGeiXp5Z8UcZLFVXeAIPZJn5PElR5j1NjjWHhti2QP
         o/A6WJpwRBYXklk7xxzH1FwjqXROGWioIyyPbrCkZlaklnpHP1bHYcYgnylEpB6z7a63
         N3WyhoOmjam++apBj0Pv6qKR/PDHaKCqXDvd4U5CM3+v1WRsI0nc1YbQlpEY+4ZkCs7c
         +ajuyHEBrfZxFaBQKq/d9MaMBMG2WZOKT2GKByuYs7I/4nMUxF433ZttUqdwUDEKhCFD
         HvXguWhK4RNbPWt0sVJVpPHA/zvv/qKbpQwR3ETalASKc6ZCYmBVxwEa6+ikTNo6iTq2
         oSeQ==
X-Gm-Message-State: ABy/qLZ6hiQ8FFwBmdxqqrSzK8WaT/FCYb0dx16ZAI1aEuLeZOPH5omZ
	fmLUaRWtubGCbWgoNz5wxz8wzg==
X-Google-Smtp-Source: APBJJlGdal6NRof8mBJ7MOpqyhGdVFWorp9Fsw25TA7e6Zh0vfd9YbcVPo2ONhSqPJyVS7KwA30xww==
X-Received: by 2002:a17:902:ea01:b0:1bb:83ec:832 with SMTP id s1-20020a170902ea0100b001bb83ec0832mr8333588plg.2.1690192098526;
        Mon, 24 Jul 2023 02:48:18 -0700 (PDT)
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
Subject: [PATCH v2 16/47] ubifs: dynamically allocate the ubifs-slab shrinker
Date: Mon, 24 Jul 2023 17:43:23 +0800
Message-Id: <20230724094354.90817-17-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the ubifs-slab shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/ubifs/super.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 32cb14759796..f2a3a58f7860 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -54,11 +54,7 @@ module_param_cb(default_version, &ubifs_default_version_ops, &ubifs_default_vers
 static struct kmem_cache *ubifs_inode_slab;
 
 /* UBIFS TNC shrinker description */
-static struct shrinker ubifs_shrinker_info = {
-	.scan_objects = ubifs_shrink_scan,
-	.count_objects = ubifs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *ubifs_shrinker_info;
 
 /**
  * validate_inode - validate inode.
@@ -2373,7 +2369,7 @@ static void inode_slab_ctor(void *obj)
 
 static int __init ubifs_init(void)
 {
-	int err;
+	int err = -ENOMEM;
 
 	BUILD_BUG_ON(sizeof(struct ubifs_ch) != 24);
 
@@ -2439,10 +2435,16 @@ static int __init ubifs_init(void)
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-	err = register_shrinker(&ubifs_shrinker_info, "ubifs-slab");
-	if (err)
+	ubifs_shrinker_info = shrinker_alloc(0, "ubifs-slab");
+	if (!ubifs_shrinker_info)
 		goto out_slab;
 
+	ubifs_shrinker_info->count_objects = ubifs_shrink_count;
+	ubifs_shrinker_info->scan_objects = ubifs_shrink_scan;
+	ubifs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(ubifs_shrinker_info);
+
 	err = ubifs_compressors_init();
 	if (err)
 		goto out_shrinker;
@@ -2467,7 +2469,7 @@ static int __init ubifs_init(void)
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
 out_shrinker:
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_unregister(ubifs_shrinker_info);
 out_slab:
 	kmem_cache_destroy(ubifs_inode_slab);
 	return err;
@@ -2483,7 +2485,7 @@ static void __exit ubifs_exit(void)
 	dbg_debugfs_exit();
 	ubifs_sysfs_exit();
 	ubifs_compressors_exit();
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_unregister(ubifs_shrinker_info);
 
 	/*
 	 * Make sure all delayed rcu free inodes are flushed before we
-- 
2.30.2


