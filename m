Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D5C7720BE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578081.905364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyEl-0002pH-QW; Mon, 07 Aug 2023 11:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578081.905364; Mon, 07 Aug 2023 11:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyEl-0002kD-LM; Mon, 07 Aug 2023 11:17:23 +0000
Received: by outflank-mailman (input) for mailman id 578081;
 Mon, 07 Aug 2023 11:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSgZ=DY=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qSyAX-00018O-Mw
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:13:01 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5de99339-3513-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:13:00 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bc4dc65aa7so5891685ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 04:13:00 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:12:58 -0700 (PDT)
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
X-Inumbo-ID: 5de99339-3513-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691406778; x=1692011578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXZOOFmuwv6/pQ9jzhgVENlSQpZ5agnqrhquB4Bsoao=;
        b=g3KOL41mxVnCoIlh87RyEsDJeaXpKCIwoVRjVxhTYPV9ovyT4HRH6y73TA0C1Q2AYh
         C+3L3G8pIHBsXVWnvOx0AYLweEtefCIlRKKK8q0sPYgt+7jxn0bL+VsW/sqLMELcQU4/
         RSW5M4MR9/5lWavNFyTrMZwhNOCIGcyf5LN7etoWY5j2p6K+9KrJUCEBYyshFVPRQ9qE
         9NhNeOSkMhfop8u2oBI3A6CKgZEogh2PPWGLFqTsvR6J0EWD/e9GH+/ajfKoDwPmRCfa
         I4bJZTgzaT9SOC+CveLtEvd/OempVrgFf6BTSlV6Y7dsnz5tzmtW7m2tX5rTM+xAbpCn
         YMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691406778; x=1692011578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXZOOFmuwv6/pQ9jzhgVENlSQpZ5agnqrhquB4Bsoao=;
        b=dw6YQIzrCTJiOTRFwg1LDsSLdtqI0zcKt04rN7wHe53xMNYo581D9WfbuOI2QV2+zw
         b5kXufSN7/sJg2fs5CjZ4nCFca01eZyZ+5wSYmOlvyua+utSNxNvM+t9e+liBVCfe5iF
         y4Lan68pZ+tugHwZvrKs85vGn6UtY/GALTnPntTIG58sZmu7oUqTDCxHSco0fixYSbzN
         A1P62aHyeAh3XbJleBpy1ktUo2aHDQVyKuo3ViXw2GibysoJER8bA7zOzTNMVE1v4Wvr
         nkqaBMtr8mEWdzFBNWHi3NSXOAqtzxmQPNcQs+WscLFapZzg/HLPkrpJX4xo6QkSy1iF
         JfyQ==
X-Gm-Message-State: ABy/qLZWbJREVdmN75KlkU5ibgJ+8HY6l7o/AS2wfmiqFcu4QopGYV13
	34M/UFeThjTsGWL/tuWQ4uf8pg==
X-Google-Smtp-Source: APBJJlFDSvCAq9gTdHkFF7Bzn2YL0W/qaEPzJ7AdGJ/zjCXgG1JFMDLiaFr2l43qqes0mOglkhZu9g==
X-Received: by 2002:a17:902:f688:b0:1bb:d7d4:e2b with SMTP id l8-20020a170902f68800b001bbd7d40e2bmr33138766plg.0.1691406778592;
        Mon, 07 Aug 2023 04:12:58 -0700 (PDT)
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
Subject: [PATCH v4 14/48] nfs: dynamically allocate the nfs-acl shrinker
Date: Mon,  7 Aug 2023 19:09:02 +0800
Message-Id: <20230807110936.21819-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the nfs-acl shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/nfs/super.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..1b5cd0444dda 100644
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
@@ -153,9 +149,19 @@ int __init register_nfs_fs(void)
 	ret = nfs_register_sysctl();
 	if (ret < 0)
 		goto error_2;
-	ret = register_shrinker(&acl_shrinker, "nfs-acl");
-	if (ret < 0)
+
+	acl_shrinker = shrinker_alloc(0, "nfs-acl");
+	if (!acl_shrinker) {
+		ret = -ENOMEM;
 		goto error_3;
+	}
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
@@ -175,7 +181,7 @@ int __init register_nfs_fs(void)
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


