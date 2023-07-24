Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322E75F051
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568567.888054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD4-0003CQ-4C; Mon, 24 Jul 2023 09:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568567.888054; Mon, 24 Jul 2023 09:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsD3-0002vp-Bg; Mon, 24 Jul 2023 09:50:33 +0000
Received: by outflank-mailman (input) for mailman id 568567;
 Mon, 24 Jul 2023 09:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsAK-0007J3-SR
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:47:44 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22acab3b-2a07-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:47:44 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b8c364ad3bso8858835ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:47:44 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
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
X-Inumbo-ID: 22acab3b-2a07-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192062; x=1690796862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=;
        b=gX8Q7SXHLW91QeJQyKDVumBjdRBjyll1XQW/JTChdq9dJqktv+X9ib4/uAMXxgigqH
         2jaNwNGzNzbxV0P1Wq3smVBCy4sNVeMp2d3znSQmH+08EqCorhh8sobS3FzAo1aci+WZ
         ahKKXhVh1u/zcYQLSV07bWs7cg92+ga+7wTGv6JJSEqo99xKqc3+YUXi9LMwyQq6STAk
         AcT7MY/9kuaNFBZqw4pd3+jIBecT2Ao+Yw0ycAdTL8xM/HvxupDlq0E7GLdDU4836YR8
         3HkgcSbyA4vS6vLviPYG979wLCQ5W42uSMh1vXnsGUiqQWrA1KKfF7bNogJb+rMbZ6Yg
         D/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192062; x=1690796862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=;
        b=F0Q4lIQNVD97+YyolyKd9T7/j0slewcsWq4rxdPZSPjE9Rj9CgdfQIrzzX0uX3+lvv
         HZSJM/adHA4WKsBXAS4Olb8SWxUKAdVgMz1JfKj5snbevWG6Vet30cAkMGzN2RMUQ7HA
         Gw/NGNjiJ0yzduoqM43hmTqFfVHUUarHPYCvcnibsrRMK4wdE1kml8Ff8KKs3DTaa1pp
         cE3GhQR93vwnDEh7q7eh0T7xDkQY66WNkwBCZFqkqQnVROl/jaSdgiecbFjEjMLO/DIL
         KcM2WZKs+nHqtLefpCF9ZkF2UvC6654ZdRGSBB95ghe++clTVztJWymPtW1N20Qu50Rb
         pEAg==
X-Gm-Message-State: ABy/qLbL9ZEkqGV7BDnVpuh85QDI5iKyQzLlkfu0yZUgQTMLzls4c26e
	bpNGBFEzZXW1J+kwxmf9FEL+sg==
X-Google-Smtp-Source: APBJJlE2hlcoboYUdUaSOoRiDnmiId7r6Wv5DYfSEbrHd1JPgB9nwdB4ObCAMGW7eL9gTiY+r7GrFA==
X-Received: by 2002:a17:902:d508:b0:1a6:6bdb:b548 with SMTP id b8-20020a170902d50800b001a66bdbb548mr12141350plg.1.1690192062448;
        Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
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
Subject: [PATCH v2 13/47] nfs: dynamically allocate the nfs-acl shrinker
Date: Mon, 24 Jul 2023 17:43:20 +0800
Message-Id: <20230724094354.90817-14-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use new APIs to dynamically allocate the nfs-acl shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/nfs/super.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..a90b12593383 100644
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
+	shrinker_unregister(acl_shrinker);
 	nfs_unregister_sysctl();
 	unregister_nfs4_fs();
 #ifdef CONFIG_NFS_V4_2
-- 
2.30.2


