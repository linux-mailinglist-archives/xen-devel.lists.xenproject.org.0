Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77969764BBC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570893.893382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBe-0000Ti-T9; Thu, 27 Jul 2023 08:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570893.893382; Thu, 27 Jul 2023 08:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBe-0000Jw-CC; Thu, 27 Jul 2023 08:17:30 +0000
Received: by outflank-mailman (input) for mailman id 570893;
 Thu, 27 Jul 2023 08:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw2A-0000Tn-Ut
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:07:42 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7f9273a-2c54-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:07:41 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-682b1768a0bso174674b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:07:41 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:07:39 -0700 (PDT)
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
X-Inumbo-ID: a7f9273a-2c54-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445259; x=1691050059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=;
        b=bsOGFEHMBlylId/BUUU6j2E7pnjQ9uMa3Dv7D6LoIY48uPLQavKrpj689NrNUpNLTl
         Aanz7sKMrDaOTTGh4q0MwHTWAvihn1jLx/NBWz0K9CQrFU5rnVI5CzfKG4yO6ADEleGk
         +0iHBjbO0i9m2+usUNEX9xFmZ3EhQv1mJHg4H05ocCDdgDOngyKPTxLLXx+aCRh/qeWu
         DaVggQ15a1Fk3lZ/quyODiCtb+FgmREKB0V2Ac2I9AcArTAe8N9Pb2STGieOdKv9GKuP
         YDdg42gSOnr6HuMRpDchso7LM2qcKeKJNp+Y2dbUP8m4urT1oK6m0eJU2zmqUir1DcF2
         Lspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445259; x=1691050059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bO4yc6b0222dRNj48HoFyPuU9QjRVolFKKVhhMGpLKw=;
        b=M9O7sDayoabJlIu+DRbGXEDWGO21EFB1N95fisxwKgkD0Q9UFwNHRDa3WYE1gV9CLJ
         B5UXv62qXB3ZRVaja49F9A+8+4Q0sOCpagCseHolFkRIAdfiONxJ3seWE4a8rPQS8KyR
         Dep4+YLYA2gITr9LdNMK7ndViKXUYfl6yGRt2UX8Cqu4XFYo6fYp44rVk8czFqttUORk
         Z5bILAdj36/lpcAqJRWkw0iaYUa9+RpfOgaAz1zjCfo6s3OqvzjmERtVzX6oCCWNtfjV
         069tKd6e9u9OEYX1s9fbQQP+dhrx5tB8adnJlymnCTjJ5Algj5mvOIuRGVRpntCt9WHd
         lmHw==
X-Gm-Message-State: ABy/qLbH8PqRWCeoz2/9EQ7tAe3YXJWgZiLEJv208uiyKhBvfYvJPwKC
	/sksUHx1c+1so141WRl99lM7fA==
X-Google-Smtp-Source: APBJJlEtjuu7JvMViG/zI1+BRK6QgnXajX34xFKdSMMqB1WswZOW9mIhLIlLvIrLtx031P4ulw5hGg==
X-Received: by 2002:a05:6a20:9381:b0:137:8f19:1de7 with SMTP id x1-20020a056a20938100b001378f191de7mr6160325pzh.0.1690445259706;
        Thu, 27 Jul 2023 01:07:39 -0700 (PDT)
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
Subject: [PATCH v3 09/49] xenbus/backend: dynamically allocate the xen-backend shrinker
Date: Thu, 27 Jul 2023 16:04:22 +0800
Message-Id: <20230727080502.77895-10-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..929c41a5ccee 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -284,13 +284,9 @@ static unsigned long backend_shrink_memory_count(struct shrinker *shrinker,
 	return 0;
 }
 
-static struct shrinker backend_memory_shrinker = {
-	.count_objects = backend_shrink_memory_count,
-	.seeks = DEFAULT_SEEKS,
-};
-
 static int __init xenbus_probe_backend_init(void)
 {
+	struct shrinker *backend_memory_shrinker;
 	static struct notifier_block xenstore_notifier = {
 		.notifier_call = backend_probe_and_watch
 	};
@@ -305,8 +301,16 @@ static int __init xenbus_probe_backend_init(void)
 
 	register_xenstore_notifier(&xenstore_notifier);
 
-	if (register_shrinker(&backend_memory_shrinker, "xen-backend"))
-		pr_warn("shrinker registration failed\n");
+	backend_memory_shrinker = shrinker_alloc(0, "xen-backend");
+	if (!backend_memory_shrinker) {
+		pr_warn("shrinker allocation failed\n");
+		return 0;
+	}
+
+	backend_memory_shrinker->count_objects = backend_shrink_memory_count;
+	backend_memory_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(backend_memory_shrinker);
 
 	return 0;
 }
-- 
2.30.2


