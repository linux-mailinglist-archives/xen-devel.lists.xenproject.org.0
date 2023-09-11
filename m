Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BF79A6D9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599203.934508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdUU-0001Yy-OA; Mon, 11 Sep 2023 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599203.934508; Mon, 11 Sep 2023 09:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdUU-0001Vc-LE; Mon, 11 Sep 2023 09:45:58 +0000
Received: by outflank-mailman (input) for mailman id 599203;
 Mon, 11 Sep 2023 09:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBsW=E3=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qfdUS-0001VS-Uy
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:45:57 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb8596c-5087-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 11:45:54 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c0efe0c4acso7083385ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 02:45:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a170902a58700b001bdc2fdcf7esm5988188plb.129.2023.09.11.02.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:45:52 -0700 (PDT)
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
X-Inumbo-ID: ffb8596c-5087-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694425553; x=1695030353; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FwhLiYYaF8GJm0hS886+94gWet3PBBx4VE+fsMZAKg=;
        b=M7TXfz6yDq27CXS11WyCQyzg/KY3gAPNxHbxkvOlo0yjy5QzcTWRMBYEOYnVuUJLmk
         mIiO4QtINXLM2rNN1P6A3xfueY+ecfI64jQVn2fLWRwLLJ35bJqGfxmHMGTWePDOoVRm
         Pg4gM0Eg//b4YW6px8+Jyqmw9ebYCNW57rRZoiNdjgkBOrHTLsEOJRA+ZGr8Ro088mKP
         vqtSL3utEypBJ+RKJasvflEiuB5jUQ6j1QGdKtzU2zlFXkL6vjqfUcH6NTgRhnSG56Fs
         zyFTuq/FAdGi2vVTUSUQb69VYjcoYpty2Pe0jn+fgCg16PyPmQFJ3e4AN8muQ6jvqTNd
         GvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425553; x=1695030353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FwhLiYYaF8GJm0hS886+94gWet3PBBx4VE+fsMZAKg=;
        b=pPcil+EBdUIHhTV3fnmYHob7S6CQaN6UWX4gT+CEknyKBka8A+U1d631J9vFLG+c+O
         El1PjbjyLgQG2nP2eZcBQdnhK/HzPatqo30N0mg/+oDg9DcoI+icXMGPsamTQWkw3Nyh
         Ei4i7mxp4Z8WLparqeWpBlBNyDN+xCab/Pk6BP99Pm3ReNPFyS6q47bocackO0iQ0Pks
         M+kGXJgvyd6yLTuG+nAFXN02A4V5ZcXaszR9Sc1cDCxj0ul6KxOE+e4NLlPCEDKBSK4U
         8uXmW5GLlALLF4fVgI8tgjenuc1nuqUoszHOSnY+oim5ePteZK30ZpE5VWligl8p7je+
         r4+Q==
X-Gm-Message-State: AOJu0YyeMrClrQ+rRWOsCoWzq4DKbYYczcMUkFa3M89hFru8SrmYaRbw
	aJEa2t876XI+/5EJR0MfvThljA==
X-Google-Smtp-Source: AGHT+IHJaWa+7S6PEpk0MEo5uFVZCUWjKmc0DPmv6mKvqIMnxGI/EF90IQq3u3ePRTZciiGyrN8JSg==
X-Received: by 2002:a17:903:41c8:b0:1c0:bf60:ba4f with SMTP id u8-20020a17090341c800b001c0bf60ba4fmr11505655ple.4.1694425553045;
        Mon, 11 Sep 2023 02:45:53 -0700 (PDT)
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
Subject: [PATCH v6 05/45] xenbus/backend: dynamically allocate the xen-backend shrinker
Date: Mon, 11 Sep 2023 17:44:04 +0800
Message-Id: <20230911094444.68966-6-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
References: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the xen-backend shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: xen-devel@lists.xenproject.org
---
 drivers/xen/xenbus/xenbus_probe_backend.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index da96c260e26b..5ebb7233076f 100644
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
@@ -305,8 +301,15 @@ static int __init xenbus_probe_backend_init(void)
 
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
+
+	shrinker_register(backend_memory_shrinker);
 
 	return 0;
 }
-- 
2.30.2


