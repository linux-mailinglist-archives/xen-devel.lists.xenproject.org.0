Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887D3CCCD9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 06:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158048.291168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5KVs-0003tl-II; Mon, 19 Jul 2021 04:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158048.291168; Mon, 19 Jul 2021 04:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5KVs-0003rT-Ep; Mon, 19 Jul 2021 04:04:16 +0000
Received: by outflank-mailman (input) for mailman id 158048;
 Mon, 19 Jul 2021 03:25:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40Jp=ML=fudan.edu.cn=xiyuyang19@srs-us1.protection.inumbo.net>)
 id 1m5JuG-0008Qb-Fn
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 03:25:26 +0000
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (unknown
 [165.227.154.27]) by us1-amaz-eas2.inumbo.com (Halon) with SMTP
 id f1f7c8dc-e840-11eb-8ae6-12813bfff9fa;
 Mon, 19 Jul 2021 03:25:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.162.86.133])
 by app1 (Coremail) with SMTP id XAUFCgDXt2iY8PRgLyaIAA--.722S3;
 Mon, 19 Jul 2021 11:25:12 +0800 (CST)
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
X-Inumbo-ID: f1f7c8dc-e840-11eb-8ae6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id; bh=Lcw52HFkeq79mvMCsUXc/S2q9uj7FXlOnZGYD5PeKys=; b=W
	QlLosoW25H2O8B0qQBk7NkSVUV40cyeeEgw8Fg2OFOfLFfJDJCyNy2AH65mSQpTb
	Nt6Mbuqm0zQ7+QpN2h9PYlkD3StJFeW1bD/NCvy5JcFsNEecmAw6Bdq7M0xAuLQV
	GL+w5bakBb46YZpG7oZLA/2vQx1UV3hEYwuka8ZPbc=
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yuanxzhang@fudan.edu.cn,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>,
	Xin Tan <tanxin.ctf@gmail.com>
Subject: [PATCH] xen-blkback: Convert from atomic_t to refcount_t on xen_blkif->refcnt
Date: Mon, 19 Jul 2021 11:25:06 +0800
Message-Id: <1626665106-49298-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:XAUFCgDXt2iY8PRgLyaIAA--.722S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3tF17ZrWkWr4fGryfZwb_yoW8Zw4rpF
	s8Aa4xJFWUKF1xW3ZrAa1I9a43Ja98JFW5Way7C3s8Zr9xtwn2y3ZYkryagry8ZrZ3Jrn2
	q3ZIgw18A3WxuF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbZmitUUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/

refcount_t type and corresponding API can protect refcounters from
accidental underflow and overflow and further use-after-free situations.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/block/xen-blkback/common.h | 7 ++++---
 drivers/block/xen-blkback/xenbus.c | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index bda5c815e441..d074cf41b4bc 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -27,6 +27,7 @@
 #ifndef __XEN_BLKIF__BACKEND__COMMON_H__
 #define __XEN_BLKIF__BACKEND__COMMON_H__
 
+#include <linux/refcount.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
@@ -306,7 +307,7 @@ struct xen_blkif {
 	struct xen_vbd		vbd;
 	/* Back pointer to the backend_info. */
 	struct backend_info	*be;
-	atomic_t		refcnt;
+	refcount_t		refcnt;
 	/* for barrier (drain) requests */
 	struct completion	drain_complete;
 	atomic_t		drain;
@@ -359,10 +360,10 @@ struct pending_req {
 
 #define vbd_sz(_v)	bdev_nr_sectors((_v)->bdev)
 
-#define xen_blkif_get(_b) (atomic_inc(&(_b)->refcnt))
+#define xen_blkif_get(_b) (refcount_inc(&(_b)->refcnt))
 #define xen_blkif_put(_b)				\
 	do {						\
-		if (atomic_dec_and_test(&(_b)->refcnt))	\
+		if (refcount_dec_and_test(&(_b)->refcnt))	\
 			schedule_work(&(_b)->free_work);\
 	} while (0)
 
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 125b22205d38..b0bd5faa3865 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -168,7 +168,7 @@ static struct xen_blkif *xen_blkif_alloc(domid_t domid)
 		return ERR_PTR(-ENOMEM);
 
 	blkif->domid = domid;
-	atomic_set(&blkif->refcnt, 1);
+	refcount_set(&blkif->refcnt, 1);
 	init_completion(&blkif->drain_complete);
 
 	/*
-- 
2.7.4


