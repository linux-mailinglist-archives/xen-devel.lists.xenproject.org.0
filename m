Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08337708D
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 10:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124188.234461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfHu7-0006De-H2; Sat, 08 May 2021 08:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124188.234461; Sat, 08 May 2021 08:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfHu7-0006B2-CX; Sat, 08 May 2021 08:01:39 +0000
Received: by outflank-mailman (input) for mailman id 124188;
 Sat, 08 May 2021 02:19:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEvs=KD=huawei.com=thunder.leizhen@srs-us1.protection.inumbo.net>)
 id 1lfCZB-0007Du-NA
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 02:19:41 +0000
Received: from szxga05-in.huawei.com (unknown [45.249.212.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b832cd-9636-45f9-a45f-b16edd17fdbf;
 Sat, 08 May 2021 02:19:40 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FcWCw3fRwzkX8q;
 Sat,  8 May 2021 10:17:00 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 10:19:27 +0800
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
X-Inumbo-ID: d7b832cd-9636-45f9-a45f-b16edd17fdbf
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, "Dan
 Williams" <dan.j.williams@intel.com>, xen-devel
	<xen-devel@lists.xenproject.org>, linux-kernel <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] xen/unpopulated-alloc: fix error return code in fill_list()
Date: Sat, 8 May 2021 10:19:13 +0800
Message-ID: <20210508021913.1727-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected

Fix to return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Fixes: a4574f63edc6 ("mm/memremap_pages: convert to 'struct range'")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/xen/unpopulated-alloc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index e64e6befc63b..87e6b7db892f 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -39,8 +39,10 @@ static int fill_list(unsigned int nr_pages)
 	}
 
 	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
-	if (!pgmap)
+	if (!pgmap) {
+		ret = -ENOMEM;
 		goto err_pgmap;
+	}
 
 	pgmap->type = MEMORY_DEVICE_GENERIC;
 	pgmap->range = (struct range) {
-- 
2.25.1



