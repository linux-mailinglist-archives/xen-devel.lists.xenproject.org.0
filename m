Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00301247D77
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 06:25:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7t9w-0004JA-6P; Tue, 18 Aug 2020 04:23:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT7/=B4=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1k7t9v-0004J5-1E
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 04:23:39 +0000
X-Inumbo-ID: 38c5a14f-a077-4ebd-8abc-e16c9d7a97b8
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38c5a14f-a077-4ebd-8abc-e16c9d7a97b8;
 Tue, 18 Aug 2020 04:23:38 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t10so8603872plz.10
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 21:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MjCY8rpgvZIeePV2ZEI1OaZrnaoZS1f7YHPkOunmzDc=;
 b=JzErDCndyn4Rs/n2yd72DenQUw5racpwxvZ1Ai1HpU3yj7zIG2QnNfnHu43RR+Cg+w
 V3zlNo08arB101kV9OHzc1RnEm7y6wcZ8p7iXNgIr1n6pJLLBqRBZUonNisA4LMrFNC0
 P/EIToB8UUqqOp1IAzZkBG6Sj4ODm0xNLVVOKgLfZhp37P6GV9BU4XEWg1g5n5fiZRZl
 7PHN8olAJXN1cE2cw68ylMEgpuSzn5IKMPQ8JdVxlVdmifPDEv5e7KPl6sXtC7r23mbA
 unHDZmfHu6EbnjNY4cJddVzM9WJoNIZE6I72vvIIAo2raZWYhJAJXgF2SaL9I7LfmWNH
 Xpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MjCY8rpgvZIeePV2ZEI1OaZrnaoZS1f7YHPkOunmzDc=;
 b=MN5zBRI/ArTOt3wJhpSVOcfcdaDAb0xSiR2ElHTa6WCpGanpT4nNkydQjPIYs7VifU
 xXIWV86HIn3zXi7QtoaswaQLYfMkMGcMAqIfekm9gcKtaKh4HRsiQHE68VwnJTCKjJEM
 +KO+4sz24JQadhHULVukNnYd+sKEM5L90Rkk8kL0PltkDI8871LxnsuwnwlXYCH3OfWD
 X25t91JXZzUM5R4XhNqAm54ztSJYwetN85kHDslgML5ZKMq/TqogVewIQAa52T3qV5hS
 5+n/Ylna3f5jdLRCa0WgraKBnzC6WG0+M8IFXCQH+UJAKRnsZpcBnvOMEGN2FnJh8DZG
 HUkg==
X-Gm-Message-State: AOAM530IacMo4ScjYmd7VkvJ17/oZfM42lHmSbwDiFRPdlMeHe3QTQhO
 gASYc6SoQufHAPNpvkbQE+M=
X-Google-Smtp-Source: ABdhPJy46eUmLUGChVfbGRKdcZHHpjR7Pc2RNX+ASKQP3uknc0mEbY3nkewlaClqzNjO8hXMRV4xhg==
X-Received: by 2002:a17:902:7293:: with SMTP id
 d19mr14270101pll.303.1597724617198; 
 Mon, 17 Aug 2020 21:23:37 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.172.185.173])
 by smtp.gmail.com with ESMTPSA id s6sm19622206pjn.48.2020.08.17.21.23.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 21:23:36 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Subject: [RFC PATCH] xen/gntdev.c: Convert get_user_pages*() to
 pin_user_pages*()
Date: Tue, 18 Aug 2020 10:02:20 +0530
Message-Id: <1597725140-8310-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information. This is case 5 as per document [1].

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
---
 drivers/xen/gntdev.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 64a9025a..e480509 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -730,7 +730,7 @@ static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
 	unsigned long xen_pfn;
 	int ret;
 
-	ret = get_user_pages_fast(addr, 1, writeable ? FOLL_WRITE : 0, &page);
+	ret = pin_user_pages_fast(addr, 1, writeable ? FOLL_WRITE : 0, &page);
 	if (ret < 0)
 		return ret;
 
@@ -744,10 +744,7 @@ static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
 
 static void gntdev_put_pages(struct gntdev_copy_batch *batch)
 {
-	unsigned int i;
-
-	for (i = 0; i < batch->nr_pages; i++)
-		put_page(batch->pages[i]);
+	unpin_user_pages(batch->pages, batch->nr_pages);
 	batch->nr_pages = 0;
 }
 
-- 
1.9.1


