Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62075F172
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568665.888391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsKC-00080B-5I; Mon, 24 Jul 2023 09:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568665.888391; Mon, 24 Jul 2023 09:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsKC-0007uE-0T; Mon, 24 Jul 2023 09:57:56 +0000
Received: by outflank-mailman (input) for mailman id 568665;
 Mon, 24 Jul 2023 09:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsF9-0005oA-S1
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:52:43 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5332f9b-2a07-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:52:43 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bba9539a23so649915ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:52:43 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:52:41 -0700 (PDT)
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
X-Inumbo-ID: d5332f9b-2a07-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192362; x=1690797162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+msSROnlHTbkN8WdS5VhxMSS48DaBcuNUu675bILAm8=;
        b=h3gsG4QXWw/nahqBxLdBCvqi4m8rD0FXz9A20d9YDr1GVweA7QI5gIYRXxeR03F7VF
         avO+YUz8f1IL6J1uYX1/b0NEPW6FiLuYcPPgWc9sNeFYAy1/jQVonTK3Har+aojJwTqi
         hQZEwnSV3LL7ecl9UfamsDpZO40zuTjDqPfF5eu13La0YtcWt3KQO54XvrgMZueVi5PZ
         X9MwcigdTTnwiJ3xQrZgNRbLcfkBdWK7eRH096K0D7h66kc666JHvNvIGlIc1vw99tH0
         GAm/hWRvtDUBnuyuOUfh8qzrbwzBKl3sPPd+rGOKnxJaCrXEUUZmWLLd6RNa7iYZg14F
         z6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192362; x=1690797162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+msSROnlHTbkN8WdS5VhxMSS48DaBcuNUu675bILAm8=;
        b=bi1ZbKYczVSEU8Nu43yuMVsJ+hnVtPG1Kwwg4Eey3DcEBpfASoSUeVfwc5apDTO5XF
         75B39e9GXFhXjNavPDKWQEYClwR88j/A5NNdo+UZwg83nwS+VE80hhMU1EdantxgfN5c
         Rs8SX4PSsBAkx+gWuCeWG9/4v/QLdtqw1YDYryFuXvC6oZb7VGHdv3K9P+THe6ShCtjO
         cLRjRX89LyMhSYnRnt9GDaoBKm4buacDFi6MEhqNTaG3anojcJNQypSEJxQlLgPRBmvB
         bn6pueHRZN4pYjPjpsDvBCte5XN/O99g8a/Ue3POWbTcJ/3qPNbx9dTmn/zciJBMLiG3
         wmHw==
X-Gm-Message-State: ABy/qLbUrb/o6mUm0BA2hAJxpy1bHrx7/CU6xi61l1WFuNxTbDvturar
	6WJ09N0e9/e66lLwbr1WYHOmng==
X-Google-Smtp-Source: APBJJlFjFnMUMe3SYJatR/saB9KY/jkISOdIPz1PLzDLS3adgTzHCnV8/bXf0D4q3OfiSxgFenVrMg==
X-Received: by 2002:a17:903:41c9:b0:1b8:17e8:547e with SMTP id u9-20020a17090341c900b001b817e8547emr12208099ple.1.1690192361964;
        Mon, 24 Jul 2023 02:52:41 -0700 (PDT)
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
Subject: [PATCH v2 38/47] xfs: dynamically allocate the xfs-qm shrinker
Date: Mon, 24 Jul 2023 17:43:45 +0800
Message-Id: <20230724094354.90817-39-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the xfs-qm shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct xfs_quotainfo.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/xfs/xfs_qm.c | 26 +++++++++++++-------------
 fs/xfs/xfs_qm.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
index 6abcc34fafd8..8f1216e1efc1 100644
--- a/fs/xfs/xfs_qm.c
+++ b/fs/xfs/xfs_qm.c
@@ -504,8 +504,7 @@ xfs_qm_shrink_scan(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_quotainfo	*qi = container_of(shrink,
-					struct xfs_quotainfo, qi_shrinker);
+	struct xfs_quotainfo	*qi = shrink->private_data;
 	struct xfs_qm_isolate	isol;
 	unsigned long		freed;
 	int			error;
@@ -539,8 +538,7 @@ xfs_qm_shrink_count(
 	struct shrinker		*shrink,
 	struct shrink_control	*sc)
 {
-	struct xfs_quotainfo	*qi = container_of(shrink,
-					struct xfs_quotainfo, qi_shrinker);
+	struct xfs_quotainfo	*qi = shrink->private_data;
 
 	return list_lru_shrink_count(&qi->qi_lru, sc);
 }
@@ -680,16 +678,18 @@ xfs_qm_init_quotainfo(
 	if (XFS_IS_PQUOTA_ON(mp))
 		xfs_qm_set_defquota(mp, XFS_DQTYPE_PROJ, qinf);
 
-	qinf->qi_shrinker.count_objects = xfs_qm_shrink_count;
-	qinf->qi_shrinker.scan_objects = xfs_qm_shrink_scan;
-	qinf->qi_shrinker.seeks = DEFAULT_SEEKS;
-	qinf->qi_shrinker.flags = SHRINKER_NUMA_AWARE;
-
-	error = register_shrinker(&qinf->qi_shrinker, "xfs-qm:%s",
-				  mp->m_super->s_id);
-	if (error)
+	qinf->qi_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-qm:%s",
+					   mp->m_super->s_id);
+	if (!qinf->qi_shrinker)
 		goto out_free_inos;
 
+	qinf->qi_shrinker->count_objects = xfs_qm_shrink_count;
+	qinf->qi_shrinker->scan_objects = xfs_qm_shrink_scan;
+	qinf->qi_shrinker->seeks = DEFAULT_SEEKS;
+	qinf->qi_shrinker->private_data = qinf;
+
+	shrinker_register(qinf->qi_shrinker);
+
 	return 0;
 
 out_free_inos:
@@ -718,7 +718,7 @@ xfs_qm_destroy_quotainfo(
 	qi = mp->m_quotainfo;
 	ASSERT(qi != NULL);
 
-	unregister_shrinker(&qi->qi_shrinker);
+	shrinker_unregister(qi->qi_shrinker);
 	list_lru_destroy(&qi->qi_lru);
 	xfs_qm_destroy_quotainos(qi);
 	mutex_destroy(&qi->qi_tree_lock);
diff --git a/fs/xfs/xfs_qm.h b/fs/xfs/xfs_qm.h
index 9683f0457d19..d5c9fc4ba591 100644
--- a/fs/xfs/xfs_qm.h
+++ b/fs/xfs/xfs_qm.h
@@ -63,7 +63,7 @@ struct xfs_quotainfo {
 	struct xfs_def_quota	qi_usr_default;
 	struct xfs_def_quota	qi_grp_default;
 	struct xfs_def_quota	qi_prj_default;
-	struct shrinker		qi_shrinker;
+	struct shrinker		*qi_shrinker;
 
 	/* Minimum and maximum quota expiration timestamp values. */
 	time64_t		qi_expiry_min;
-- 
2.30.2


