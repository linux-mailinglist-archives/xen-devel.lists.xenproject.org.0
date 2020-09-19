Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6B270AB6
	for <lists+xen-devel@lfdr.de>; Sat, 19 Sep 2020 06:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJUYv-0007Rb-Hd; Sat, 19 Sep 2020 04:33:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0rF=C4=huawei.com=jingxiangfeng@srs-us1.protection.inumbo.net>)
 id 1kJTN0-0000gw-J7
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2020 03:17:02 +0000
X-Inumbo-ID: 892ebfb6-c078-4477-89f0-94b4c6e02874
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 892ebfb6-c078-4477-89f0-94b4c6e02874;
 Sat, 19 Sep 2020 03:16:56 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3E32B30318231580C927;
 Sat, 19 Sep 2020 11:16:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 11:16:41 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
 <jingxiangfeng@huawei.com>
Subject: [PATCH] xen: remove redundant initialization of variable ret
Date: Sat, 19 Sep 2020 11:17:02 +0800
Message-ID: <20200919031702.32192-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 19 Sep 2020 04:33:23 +0000
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

After commit 9f51c05dc41a ("pvcalls-front: Avoid
get_free_pages(GFP_KERNEL) under spinlock"), the variable ret is being
initialized with '-ENOMEM' that is meaningless. So remove it.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/xen/pvcalls-front.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 72d725a0ab5c..7984645b5956 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -371,7 +371,7 @@ static int alloc_active_ring(struct sock_mapping *map)
 static int create_active(struct sock_mapping *map, evtchn_port_t *evtchn)
 {
 	void *bytes;
-	int ret = -ENOMEM, irq = -1, i;
+	int ret, irq = -1, i;
 
 	*evtchn = 0;
 	init_waitqueue_head(&map->active.inflight_conn_req);
-- 
2.17.1


