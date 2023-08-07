Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675607720D6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578092.905438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyEx-0005Lc-Te; Mon, 07 Aug 2023 11:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578092.905438; Mon, 07 Aug 2023 11:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyEx-0005FN-Gg; Mon, 07 Aug 2023 11:17:35 +0000
Received: by outflank-mailman (input) for mailman id 578092;
 Mon, 07 Aug 2023 11:17:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSyDn-0006s9-M8
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:16:23 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d70680d7-3513-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 13:16:23 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5643140aa5fso526450a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:16:23 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:16:21 -0700 (PDT)
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
X-Inumbo-ID: d70680d7-3513-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406982; x=1692011782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n4eBW/y496rw0R30jGqgr9PaTd+TyGx4MFgxeJTY98=;
        b=FnWDWj5rwzmfFGLsv5BbODxTKmQBAUJaoO/xwiU3xtz9tOZ2AwDnatjsq2ab3ilYeJ
         iWF7FCg8OfJEY1lx/DDczF41LpfDlE6nRRduQxYHOyP9X3uK7n/ZO9q7VAhZSG3xs95Q
         OqWz/XghzU3SfaeMxwONvmK/HIjBzGEUASf2JFKX93u1G15t5fAwcHUsocilVhQXHkyU
         J1tWV2QNpc4U36fDDO4ejlIhucfEnNm2u0Wt3z4T4cfN7wJRCQagqckfUu/vztdG0xlS
         Buj0JJnUwu7QR/DBMG2ve3ld5n35BuwOJKjICt4m1cvU7hXO7dkM+KrhCZs3CTAs8/64
         gYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406982; x=1692011782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n4eBW/y496rw0R30jGqgr9PaTd+TyGx4MFgxeJTY98=;
        b=igIZy/9V3b34YvgWjnSj6z4EwxK4KdTd70zHOPx3DW9KtoRq9pbwVExLgwS84WFdL/
         Gkw6lIFGerii6CqTdbAjRlh0uR1xW97INZmWXRj0Xh/NDIS2AxeoEOqhfCudZIA08R9x
         Y8ivEd59a/tZZlhy1j44smSgQLF0T3WQZFN4/fpUibAZJ7sFNMYDWpPNkWK7CrJqRNlU
         ngAAFv9sOmXSQNx0CWGMLtyCK/7tcRlAVzlyCE7m+BxJtIrExRL4FEhdWkKw6JnCY6ZF
         fbDx4Ed82R2FWNQ2lLrLX4eXN/X+1pS5k4Yxk+TZVF0NKnx0hwns8sAhl1KEVBRyvrvG
         fTXQ==
X-Gm-Message-State: ABy/qLZr6tYxGC/HyLgvZoZIsiX6IUNBCrE2w1Bx8Ax+Z1wuHTHcKOBb
	OhIWKyjwHB3DEfC4/YJTczv4tg==
X-Google-Smtp-Source: APBJJlGfZoIKy5dlf67l9aDnuNmoWN294jSLFWBRn8Nrl68gwCTSSg7v4NaF4AAHW/6J0zEJitKJCg==
X-Received: by 2002:a17:90a:1f83:b0:268:3dc6:f0c5 with SMTP id x3-20020a17090a1f8300b002683dc6f0c5mr25038018pja.0.1691406981820;
        Mon, 07 Aug 2023 04:16:21 -0700 (PDT)
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
Subject: [PATCH v4 30/48] vmw_balloon: dynamically allocate the vmw-balloon shrinker
Date: Mon,  7 Aug 2023 19:09:18 +0800
Message-Id: <20230807110936.21819-31-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
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


