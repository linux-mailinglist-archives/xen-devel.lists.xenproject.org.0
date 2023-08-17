Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683177EFF8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 06:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585110.916132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWUvO-0000iQ-NV; Thu, 17 Aug 2023 04:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585110.916132; Thu, 17 Aug 2023 04:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWUvO-0000gl-Kf; Thu, 17 Aug 2023 04:47:58 +0000
Received: by outflank-mailman (input) for mailman id 585110;
 Thu, 17 Aug 2023 01:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jj84=EC=huawei.com=lizetao1@srs-se1.protection.inumbo.net>)
 id 1qWS7D-0006xw-06
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 01:47:59 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153b6397-3ca0-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 03:47:56 +0200 (CEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RR79L20WdzFqhV;
 Thu, 17 Aug 2023 09:44:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 09:47:52 +0800
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
X-Inumbo-ID: 153b6397-3ca0-11ee-8779-cb3800f73035
From: Li Zetao <lizetao1@huawei.com>
To: <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <wsa+renesas@sang-engineering.com>
CC: <lizetao1@huawei.com>, <gregkh@linuxfoundation.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH -next] xen: xenbus: Use helper function IS_ERR_OR_NULL()
Date: Thu, 17 Aug 2023 09:47:36 +0800
Message-ID: <20230817014736.3094289-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Use IS_ERR_OR_NULL() to detect an error pointer or a null pointer
open-coding to simplify the code.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/xen/xenbus/xenbus_probe_frontend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index 3f3836cb7279..fcb335bb7b18 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -429,7 +429,7 @@ static void xenbus_check_frontend(char *class, char *dev)
 		printk(KERN_DEBUG "XENBUS: frontend %s %s\n",
 				frontend, xenbus_strstate(fe_state));
 		backend = xenbus_read(XBT_NIL, frontend, "backend", NULL);
-		if (!backend || IS_ERR(backend))
+		if (IS_ERR_OR_NULL(backend))
 			goto out;
 		err = xenbus_scanf(XBT_NIL, backend, "state", "%i", &be_state);
 		if (err == 1)
-- 
2.34.1


