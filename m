Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255D764BBB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570884.893331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBa-0007TI-4l; Thu, 27 Jul 2023 08:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570884.893331; Thu, 27 Jul 2023 08:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwBZ-0007Ij-Q7; Thu, 27 Jul 2023 08:17:25 +0000
Received: by outflank-mailman (input) for mailman id 570884;
 Thu, 27 Jul 2023 08:17:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOw7S-0001DS-8w
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:13:10 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bd67f85-2c55-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 10:13:09 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so168608b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 01:13:09 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:13:07 -0700 (PDT)
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
X-Inumbo-ID: 6bd67f85-2c55-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690445588; x=1691050388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQyM2U1mZ/Gwc1nAOvYev1L9XLZmdJlRT0RgZ5HuwGo=;
        b=kd6rt5g6FvxszAExAWwDvnGLZ3nlFI6+LjpyYA2SwsBpfxyntyz5JxeLs4IsuFoqam
         BPrbW0IZbPo4bp5jr8CP6dW+kXsV2/xzlGqHNQMPkgHqzMSniXcziiHnCVK42nJM1noq
         S50aGwia7MX8euX+8hfeRRERjX2qwSrJrcd+yJ4VULel6DaWSf6W0hZ/qFtzG1N+JN0n
         uQB95m4CN8ZeNY7Xsu+pZiPFb9O3G4aVUw6FAsCxKpZx+yuB9vunfivBBZ8XUQHuWQvc
         AX+QkUyO8AP8Aa2+4wftvFDhdV62VUn8gnj7NjCNsCf/vREHbdt8IjenIeReKEgqNeKN
         BvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445588; x=1691050388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQyM2U1mZ/Gwc1nAOvYev1L9XLZmdJlRT0RgZ5HuwGo=;
        b=bowyAzA4AazocHU6kFWdOSWCRTQcTNSRT5Ztx53ts5F2HkJRhtam8aQo0d1IJI0Gck
         70fcR6xIhIOVdHCkBNpHNOSU/BPn0Gv72iOjBhaAdyWjqT5fUgdyfh9ay5NI8n45+vyD
         +eA4uBAYW8uFXOD5jwhQWfQFArhE8w9wJdkObKWbNIUOZ3cQ3TZ+4d/RUh+Ui6H9Vprm
         JPG0gixeUShYGObbieEQjMaG1toUYGur4owCz59FsxYSqevyiDS1QeNVtWvHp49yqwY1
         NiTrrzUl/b6LJjbwoYhzMwtp5/b3Iy+c9UdBgACg8L9bpxznxRj/p/Egl1jqtoISm4S5
         wg7g==
X-Gm-Message-State: ABy/qLZTFrcyrEsrg9Gk9Orf0PVUkDe6Gz6BlVD7NVHyxImvjpQA11+r
	z87+/5cd1T2Uha88x9LL1w/4Zw==
X-Google-Smtp-Source: APBJJlGx3t3etMepgJMVu+n+Us77oI88lCmbMpzaxwGd8c6y1MJ13X5vnrHVztpBTHVV1RS/gpzzOQ==
X-Received: by 2002:a05:6a21:3281:b0:137:514a:982d with SMTP id yt1-20020a056a21328100b00137514a982dmr6062167pzb.6.1690445588272;
        Thu, 27 Jul 2023 01:13:08 -0700 (PDT)
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
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v3 36/49] nfsd: dynamically allocate the nfsd-client shrinker
Date: Thu, 27 Jul 2023 16:04:49 +0800
Message-Id: <20230727080502.77895-37-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the nfsd-client shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct nfsd_net.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Chuck Lever <chuck.lever@oracle.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/netns.h     |  2 +-
 fs/nfsd/nfs4state.c | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
index ec49b200b797..f669444d5336 100644
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -195,7 +195,7 @@ struct nfsd_net {
 	int			nfs4_max_clients;
 
 	atomic_t		nfsd_courtesy_clients;
-	struct shrinker		nfsd_client_shrinker;
+	struct shrinker		*nfsd_client_shrinker;
 	struct work_struct	nfsd_shrinker_work;
 };
 
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index ef7118ebee00..75334a43ded4 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -4388,8 +4388,7 @@ static unsigned long
 nfsd4_state_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	int count;
-	struct nfsd_net *nn = container_of(shrink,
-			struct nfsd_net, nfsd_client_shrinker);
+	struct nfsd_net *nn = shrink->private_data;
 
 	count = atomic_read(&nn->nfsd_courtesy_clients);
 	if (!count)
@@ -8123,12 +8122,17 @@ static int nfs4_state_create_net(struct net *net)
 	INIT_WORK(&nn->nfsd_shrinker_work, nfsd4_state_shrinker_worker);
 	get_net(net);
 
-	nn->nfsd_client_shrinker.scan_objects = nfsd4_state_shrinker_scan;
-	nn->nfsd_client_shrinker.count_objects = nfsd4_state_shrinker_count;
-	nn->nfsd_client_shrinker.seeks = DEFAULT_SEEKS;
-
-	if (register_shrinker(&nn->nfsd_client_shrinker, "nfsd-client"))
+	nn->nfsd_client_shrinker = shrinker_alloc(0, "nfsd-client");
+	if (!nn->nfsd_client_shrinker)
 		goto err_shrinker;
+
+	nn->nfsd_client_shrinker->scan_objects = nfsd4_state_shrinker_scan;
+	nn->nfsd_client_shrinker->count_objects = nfsd4_state_shrinker_count;
+	nn->nfsd_client_shrinker->seeks = DEFAULT_SEEKS;
+	nn->nfsd_client_shrinker->private_data = nn;
+
+	shrinker_register(nn->nfsd_client_shrinker);
+
 	return 0;
 
 err_shrinker:
@@ -8226,7 +8230,7 @@ nfs4_state_shutdown_net(struct net *net)
 	struct list_head *pos, *next, reaplist;
 	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 
-	unregister_shrinker(&nn->nfsd_client_shrinker);
+	shrinker_free(nn->nfsd_client_shrinker);
 	cancel_work(&nn->nfsd_shrinker_work);
 	cancel_delayed_work_sync(&nn->laundromat_work);
 	locks_end_grace(&nn->nfsd4_manager);
-- 
2.30.2


