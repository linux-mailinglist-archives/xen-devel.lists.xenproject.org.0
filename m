Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5805764A5E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570854.893162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw3N-00066Z-1k; Thu, 27 Jul 2023 08:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570854.893162; Thu, 27 Jul 2023 08:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOw3M-00063U-V6; Thu, 27 Jul 2023 08:08:56 +0000
Received: by outflank-mailman (input) for mailman id 570854;
 Thu, 27 Jul 2023 08:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw3L-0005Vh-Ml
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:08:55 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3799171-2c54-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:08:54 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686f74a8992so77591b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:08:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:08:52 -0700 (PDT)
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
X-Inumbo-ID: d3799171-2c54-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445332; x=1691050132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TzzNXWnGUC4v0Im6lZC1fetjV0NX81rj7dQA53Eb1w=;
        b=fVbo4B1Sn0AGX1nNJK0Eo1gukSsful8PC6Tpi9R2ay4P+tk9frdioPsIm2s6rPxi46
         ++BpYvSQrpfhaqWc0rmuBFjQPz0zzH5N+AGXb67rsChsvEkjfu687Mjmoln0lCJnbS1t
         S6gxfZ/pYInNuKorknrCkgDtrsNJQ+5b+KQpVkQdCPQpNRB6D3agySMM3uM99/xhPotu
         rAoYyPnK20sDnc7vY5XomSSW5p6ngHpl0qbTjtgeFdhf5V6H8EL0+GE/5QBEhSY2aRe8
         CqIfoMbQ3ZACqieIYGVBf+Lq9zLueZGm5ISvf4EF/2FFF37Zi67sB1q+1Y4ZesHEzWZS
         zb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445332; x=1691050132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TzzNXWnGUC4v0Im6lZC1fetjV0NX81rj7dQA53Eb1w=;
        b=Lyv+PyUCnP4yKg893kPTVDNcdc/0k/WVQsByLBqbrPWmML9NA/b6YAnNkoxsEZtVSx
         NUrv8KEDxruLzgZH4JG/gdVeN0wMgENt8FzxBl5+wv5qvqyxd5Xgbbp3fRV1f8ehL4vm
         /p7X1sPTT8PNC/ps888WEpGZcYoARz16jjoawJ5H1ZoD6cBNWdh3XPt9SIi7XqRForWH
         tQxkc5uHRbl6rYZ2uNgmhf4J1vVKXkahSsZHYY6C4a8RotEKgMy8cu9wgKTz05fSLmP6
         K27NYpqq2GXMytfMrIgJUUQs/YnlxhojGcrEQK1h79Msn/t2YF7lX1/ODpyFh1hkHbkG
         WbpQ==
X-Gm-Message-State: ABy/qLbucnOywEqheuaNGWEvrOdgSMX3l+KFhXq5Di/RxJAUjdk73vSX
	+Efwiq6Te/MATh9ioUfbfQrjjg==
X-Google-Smtp-Source: APBJJlFfoYzSpk6JWYRi+8IvWqqU5f15Mb/GG4zvV09auI3h1+KA8DLVYcizqJGa8aoS7uGFfDYCtA==
X-Received: by 2002:a05:6a00:488e:b0:677:bb4c:c321 with SMTP id dk14-20020a056a00488e00b00677bb4cc321mr4639246pfb.0.1690445332713;
        Thu, 27 Jul 2023 01:08:52 -0700 (PDT)
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
Subject: [PATCH v3 15/49] nfs: dynamically allocate the nfs-acl shrinker
Date: Thu, 27 Jul 2023 16:04:28 +0800
Message-Id: <20230727080502.77895-16-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the nfs-acl shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/nfs/super.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..072d82e1be06 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -129,11 +129,7 @@ static void nfs_ssc_unregister_ops(void)
 }
 #endif /* CONFIG_NFS_V4_2 */
 
-static struct shrinker acl_shrinker = {
-	.count_objects	= nfs_access_cache_count,
-	.scan_objects	= nfs_access_cache_scan,
-	.seeks		= DEFAULT_SEEKS,
-};
+static struct shrinker *acl_shrinker;
 
 /*
  * Register the NFS filesystems
@@ -153,9 +149,17 @@ int __init register_nfs_fs(void)
 	ret = nfs_register_sysctl();
 	if (ret < 0)
 		goto error_2;
-	ret = register_shrinker(&acl_shrinker, "nfs-acl");
-	if (ret < 0)
+
+	acl_shrinker = shrinker_alloc(0, "nfs-acl");
+	if (!acl_shrinker)
 		goto error_3;
+
+	acl_shrinker->count_objects = nfs_access_cache_count;
+	acl_shrinker->scan_objects = nfs_access_cache_scan;
+	acl_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(acl_shrinker);
+
 #ifdef CONFIG_NFS_V4_2
 	nfs_ssc_register_ops();
 #endif
@@ -175,7 +179,7 @@ int __init register_nfs_fs(void)
  */
 void __exit unregister_nfs_fs(void)
 {
-	unregister_shrinker(&acl_shrinker);
+	shrinker_free(acl_shrinker);
 	nfs_unregister_sysctl();
 	unregister_nfs4_fs();
 #ifdef CONFIG_NFS_V4_2
-- 
2.30.2


