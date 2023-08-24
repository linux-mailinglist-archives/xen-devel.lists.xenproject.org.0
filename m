Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FEF7865FC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 05:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589734.921756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ1Gw-0001p1-3X; Thu, 24 Aug 2023 03:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589734.921756; Thu, 24 Aug 2023 03:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ1Gv-0001mj-Vf; Thu, 24 Aug 2023 03:44:37 +0000
Received: by outflank-mailman (input) for mailman id 589734;
 Thu, 24 Aug 2023 03:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Lin=EJ=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qZ1Gu-0001md-0l
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 03:44:36 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88e7e09f-4230-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 05:44:33 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68a32506e90so1062098b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 20:44:32 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b005579f12a238sm10533157pgo.86.2023.08.23.20.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 20:44:30 -0700 (PDT)
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
X-Inumbo-ID: 88e7e09f-4230-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692848671; x=1693453471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL9UzNFH9xRc40ovijxQr7+deLFTeJc0QRJlNk7UAJE=;
        b=bY9LD4tgkqWxkQKKd/RDOoX5W8qpuGAecHeEhLMfDjHuJUY0svZZBxoximm9J6Y19i
         IqrrH7xW9H7peP2arsnyh17grC5SQNfshLtri8kPslLmcIm+7WgUocRo8Yx/4Tfw2jXR
         c3uYDXcSM/kuK3tPVglakJG9pBHZK8VSYZiPXSkCgitJGmj1bNL4q/waTdyTfhOKwshR
         aTWnSB7OVezKYHSxHn7x3sc27R1ATOK+S6Og+iQUPKgoVWwop02aWHbGt7Gzi+eH1aCx
         GxgOchcaZoRBNIXtV5nUG7kDq0z3sxxuYYxZNhstl4e05qGO/BrwD9AQR8U5OepcAJBK
         FutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692848671; x=1693453471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL9UzNFH9xRc40ovijxQr7+deLFTeJc0QRJlNk7UAJE=;
        b=FrSTwSDNG78xtJW5o7/Ku4D3q8UQO8dTBM6t84iWNICkBFpCG4kky0Injbju33ps8m
         jQBYQdxodsZPSqPUhIrU0aiGuvXG4LtoV8o5ujEzJ6taZRxvD5u5cgTwSVuxM9kdKiXc
         YBIBBXO7+bl0nM7/CmbwcFrqRi3IwiGbWxBODEIvWhgS1/+7pszeTaMfkr9Tcp1DD3wP
         MTcJIGaD9wK7i2VqZ/563z62dO7F5BdWXUytuZIynVx7djENOH634jV3EJSC67n6bMjL
         7f+U32Jr8gmLuqF2+SKxuQij9dOEhNCytQtSC81/Buwn9k0lClRYokBXRJnvsknhLfKB
         0Tbw==
X-Gm-Message-State: AOJu0YxcQVQMpHbw3Y9YT0CiolGlXOgSuYm6tWuJeHDRmakrEjbxmYhE
	VetBfjwwVlfS2hEddFufLAtkGA==
X-Google-Smtp-Source: AGHT+IF9XwmI1K/7s22ZAfh1q1VXcTL8c0ROJkv/uTQnOzzzUix0h5W4i5ROCPEGbt2KzyOxEQAr3A==
X-Received: by 2002:a05:6a20:938d:b0:13c:bda3:79c3 with SMTP id x13-20020a056a20938d00b0013cbda379c3mr17551017pzh.4.1692848671217;
        Wed, 23 Aug 2023 20:44:31 -0700 (PDT)
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
	linux-fsdevel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 05/45] xenbus/backend: dynamically allocate the xen-backend shrinker
Date: Thu, 24 Aug 2023 11:42:24 +0800
Message-Id: <20230824034304.37411-6-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
CC: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: xen-devel@lists.xenproject.org
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


