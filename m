Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83275F03A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568540.887958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsCv-0000g8-Md; Mon, 24 Jul 2023 09:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568540.887958; Mon, 24 Jul 2023 09:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsCv-0000b1-D2; Mon, 24 Jul 2023 09:50:25 +0000
Received: by outflank-mailman (input) for mailman id 568540;
 Mon, 24 Jul 2023 09:45:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNs8C-0007Dq-Q2
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:45:32 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d43596c9-2a06-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:45:32 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so1027577b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:45:32 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:45:30 -0700 (PDT)
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
X-Inumbo-ID: d43596c9-2a06-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690191931; x=1690796731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewD/GNBDsb9emQZc+crYJJhL9Ok7DRtPygkZmojk224=;
        b=DyvUb16iFXGbECeKR4Jj5b9Aqu7GqNXEePNkHat23I7b1VL4ke9XL7AFF21PJI8D03
         dadzrjq6WC5mtymsIwcgysKxt2IeQhVQYSg0yzEciG/3J3jMvvonWrabgIjT5cyrH4U0
         K1NmdQ2LZEMZR3X0ctjhZi8pkjfdY6FiANez7gH72dxDBt7t+C7AalBczQoExmv/leVd
         sjx5yitsqqA/ZPm80lkfCIhjuAfvEuRwNIJ4RlVw9F2GYFjyskW1Ygf/DVx+iz0W5Dlm
         41zeCUlShQCZl1UPIlyRzbY5fG4LbR2jBKDZp6zvisQp1bayYn113SLSSif4m+cEaf+t
         mhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191931; x=1690796731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewD/GNBDsb9emQZc+crYJJhL9Ok7DRtPygkZmojk224=;
        b=XJfqMrUnL4Iu4K8ua3DuJYHwHHn1DDP8Ou/tm7G1cWn5a07f0ewRH5n7ayIER9McI1
         0K9OIxIDI5Gfm3xA8pfa+AWOYzzhSmHsJuZl6gCRK8Jjf+C+NE8rEtKCPD+OeBqDnOKb
         FGz1xmRzzefDcCqjwdUOwTMizi7g3VCDr9kPs1uP5WlPans4PYae0aEoILbYxhCRG0LR
         8C4cfIC4NLOJ3zOCpHt5NR7IGkvQ9AvZ1pdl06Zuu1SBUEC7+yr4zmqGHSCipdf2oyj5
         2xegjPW3RMGuVfTZtLAeL7EmT/KzQ8eWqvrCw1XCPEl4HdQIB2J13T9E0HdkvBFbAyFY
         RzKA==
X-Gm-Message-State: ABy/qLaIFfUT7b/trNAtaIGgXSCIhPp5nOyN1JffRC9EMgwP4QV+iuJn
	VoctrQEkvk1RZf8WxOloPh6X0Q==
X-Google-Smtp-Source: APBJJlF4hVHTEAcnrryQeIsWufK3e63a7rX2g1OMpnBMufUIHv2BcOagu97Dc7evIwstimu7xBX17w==
X-Received: by 2002:a17:902:e849:b0:1b8:35fa:cdcc with SMTP id t9-20020a170902e84900b001b835facdccmr12688015plg.5.1690191930816;
        Mon, 24 Jul 2023 02:45:30 -0700 (PDT)
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
Subject: [PATCH v2 02/47] mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
Date: Mon, 24 Jul 2023 17:43:09 +0800
Message-Id: <20230724094354.90817-3-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugfs_remove_recursive() will wait for debugfs_file_put() to return,
so the shrinker will not be freed when doing debugfs operations (such as
shrinker_debugfs_count_show() and shrinker_debugfs_scan_write()), so there
is no need to hold shrinker_rwsem during debugfs operations.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/shrinker_debug.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index 3ab53fad8876..f1becfd45853 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -55,11 +55,6 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	if (!count_per_node)
 		return -ENOMEM;
 
-	ret = down_read_killable(&shrinker_rwsem);
-	if (ret) {
-		kfree(count_per_node);
-		return ret;
-	}
 	rcu_read_lock();
 
 	memcg_aware = shrinker->flags & SHRINKER_MEMCG_AWARE;
@@ -92,7 +87,6 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
 
 	rcu_read_unlock();
-	up_read(&shrinker_rwsem);
 
 	kfree(count_per_node);
 	return ret;
@@ -117,7 +111,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 	struct mem_cgroup *memcg = NULL;
 	int nid;
 	char kbuf[72];
-	ssize_t ret;
 
 	read_len = size < (sizeof(kbuf) - 1) ? size : (sizeof(kbuf) - 1);
 	if (copy_from_user(kbuf, buf, read_len))
@@ -146,12 +139,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 		return -EINVAL;
 	}
 
-	ret = down_read_killable(&shrinker_rwsem);
-	if (ret) {
-		mem_cgroup_put(memcg);
-		return ret;
-	}
-
 	sc.nid = nid;
 	sc.memcg = memcg;
 	sc.nr_to_scan = nr_to_scan;
@@ -159,7 +146,6 @@ static ssize_t shrinker_debugfs_scan_write(struct file *file,
 
 	shrinker->scan_objects(shrinker, &sc);
 
-	up_read(&shrinker_rwsem);
 	mem_cgroup_put(memcg);
 
 	return size;
-- 
2.30.2


