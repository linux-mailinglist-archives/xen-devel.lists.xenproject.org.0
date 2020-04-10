Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F9D1A4604
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 13:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMsH6-0007rA-VV; Fri, 10 Apr 2020 11:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kGWp=52=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1jMsH5-0007r5-FV
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 11:56:43 +0000
X-Inumbo-ID: 5472a7d0-7b22-11ea-9e09-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5472a7d0-7b22-11ea-9e09-bc764e2007e4;
 Fri, 10 Apr 2020 11:56:39 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 036C678809575001BBEA;
 Fri, 10 Apr 2020 19:56:34 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 19:56:23 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>
Subject: [PATCH -next] xen/pvcalls: Make pvcalls_back_global static
Date: Fri, 10 Apr 2020 19:56:20 +0800
Message-ID: <20200410115620.33024-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix sparse warning:

drivers/xen/pvcalls-back.c:30:3: warning:
 symbol 'pvcalls_back_global' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/xen/pvcalls-back.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index cf4ce3e9358d..4807704f8d69 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -24,7 +24,7 @@
 #define PVCALLS_VERSIONS "1"
 #define MAX_RING_ORDER XENBUS_MAX_RING_GRANT_ORDER
 
-struct pvcalls_back_global {
+static struct pvcalls_back_global {
 	struct list_head frontends;
 	struct semaphore frontends_lock;
 } pvcalls_back_global;
-- 
2.17.1



