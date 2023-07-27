Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992F764AE3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570862.893222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw6U-0001wh-R5; Thu, 27 Jul 2023 08:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570862.893222; Thu, 27 Jul 2023 08:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw6U-0001uo-Np; Thu, 27 Jul 2023 08:12:10 +0000
Received: by outflank-mailman (input) for mailman id 570862;
 Thu, 27 Jul 2023 08:12:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw6T-0001uZ-FJ
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:12:09 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a65dae-2c55-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:12:07 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so171381b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:12:07 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:12:05 -0700 (PDT)
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
X-Inumbo-ID: 46a65dae-2c55-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445526; x=1691050326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n4eBW/y496rw0R30jGqgr9PaTd+TyGx4MFgxeJTY98=;
        b=DFuBBIj0qr+rYIge0pXV6Iz/WQCtDScPhobpwepkK1qFA4vWSgHpJ4XkcYuuPfpNPf
         m1KmSzju36tqFFEerRbxzoJUh0jIYJTO7HIOFb+RZm+pVFB00ovmyWsAOFYYwfcBZmMb
         e24YxGtb0LaJS553DCfCR3CRRqCI01KNxWybG2aaWT/P5M881ZLs+BB0bNl6iFKLm1jP
         1CGPhfxCNsRDquotgL0k/wpTHggVzHbYlQp/c6oXuHB7Tn0FP6ZxNpyiHbKUJJqBcB/S
         A1bIsa86Qg72/76knWel/9Oqk1Wqg5ySfdUAutMowRhvxEtU3jYo18G5n5eEy4cYbgQS
         NQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445526; x=1691050326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n4eBW/y496rw0R30jGqgr9PaTd+TyGx4MFgxeJTY98=;
        b=MCswUnUo2FIMzgnQMIoIjfzVC168rtFCnTU3EtA5MBdAhgkQR/8tLQHtuqeVymJKAh
         PqmvYFuDEQgNNhCUc1JWzx1hOUuFRPBpcTIAW0nOPDGDS5FIQ1VJ31Q1zl/4et+Fbbg4
         jDr19CPV7zfYRgLk6rIrS0fuX56pM/uoMFAKGIVcOuNGTBsHubJstShZCg+GgCJtJD1b
         MGb2sFMM2LoMyNOhuYTa2zpcs3b4UW+atK/qPpj31zI2QjAF63sP3cnMOCwCOlkLNZgZ
         aQp7XY0AkyUdzMnU62PhWIJ3KjfLw/jLShP0rNCR3RFMXHgLXjTTRtyaWPufDhI+R3gk
         y3Dg==
X-Gm-Message-State: ABy/qLb5hEAukzmJDOx8urQmTM3pag3CkKrk9SrDQi0/uISFt+qexrt/
	CYBP4Zh37O8Rp1NvIUEp63ZQCw==
X-Google-Smtp-Source: APBJJlHcYWOCpFnX36R6RazQvm5Mh7k9Kqh4ud2Oospjm3wjIj4ouKJfJr17R2K3rHFvQEDvt90Syw==
X-Received: by 2002:a05:6a00:4685:b0:675:8521:ddc7 with SMTP id de5-20020a056a00468500b006758521ddc7mr4426362pfb.0.1690445525874;
        Thu, 27 Jul 2023 01:12:05 -0700 (PDT)
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
Subject: [PATCH v3 31/49] vmw_balloon: dynamically allocate the vmw-balloon shrinker
Date: Thu, 27 Jul 2023 16:04:44 +0800
Message-Id: <20230727080502.77895-32-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the vmw-balloon shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct vmballoon.

And we can simply exit vmballoon_init() when registering the shrinker
fails. So the shrinker_registered indication is redundant, just remove it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/misc/vmw_balloon.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 9ce9b9e0e9b6..ac2cdb6cdf74 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -380,16 +380,7 @@ struct vmballoon {
 	/**
 	 * @shrinker: shrinker interface that is used to avoid over-inflation.
 	 */
-	struct shrinker shrinker;
-
-	/**
-	 * @shrinker_registered: whether the shrinker was registered.
-	 *
-	 * The shrinker interface does not handle gracefully the removal of
-	 * shrinker that was not registered before. This indication allows to
-	 * simplify the unregistration process.
-	 */
-	bool shrinker_registered;
+	struct shrinker *shrinker;
 };
 
 static struct vmballoon balloon;
@@ -1568,29 +1559,27 @@ static unsigned long vmballoon_shrinker_count(struct shrinker *shrinker,
 
 static void vmballoon_unregister_shrinker(struct vmballoon *b)
 {
-	if (b->shrinker_registered)
-		unregister_shrinker(&b->shrinker);
-	b->shrinker_registered = false;
+	shrinker_free(b->shrinker);
 }
 
 static int vmballoon_register_shrinker(struct vmballoon *b)
 {
-	int r;
-
 	/* Do nothing if the shrinker is not enabled */
 	if (!vmwballoon_shrinker_enable)
 		return 0;
 
-	b->shrinker.scan_objects = vmballoon_shrinker_scan;
-	b->shrinker.count_objects = vmballoon_shrinker_count;
-	b->shrinker.seeks = DEFAULT_SEEKS;
+	b->shrinker = shrinker_alloc(0, "vmw-balloon");
+	if (!b->shrinker)
+		return -ENOMEM;
 
-	r = register_shrinker(&b->shrinker, "vmw-balloon");
+	b->shrinker->scan_objects = vmballoon_shrinker_scan;
+	b->shrinker->count_objects = vmballoon_shrinker_count;
+	b->shrinker->seeks = DEFAULT_SEEKS;
+	b->shrinker->private_data = b;
 
-	if (r == 0)
-		b->shrinker_registered = true;
+	shrinker_register(b->shrinker);
 
-	return r;
+	return 0;
 }
 
 /*
@@ -1883,7 +1872,7 @@ static int __init vmballoon_init(void)
 
 	error = vmballoon_register_shrinker(&balloon);
 	if (error)
-		goto fail;
+		return error;
 
 	/*
 	 * Initialization of compaction must be done after the call to
@@ -1905,9 +1894,6 @@ static int __init vmballoon_init(void)
 	vmballoon_debugfs_init(&balloon);
 
 	return 0;
-fail:
-	vmballoon_unregister_shrinker(&balloon);
-	return error;
 }
 
 /*
-- 
2.30.2


