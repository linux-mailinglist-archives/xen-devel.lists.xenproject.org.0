Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D762460F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 16:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441904.695955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot9at-0003wr-Ns; Thu, 10 Nov 2022 15:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441904.695955; Thu, 10 Nov 2022 15:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot9at-0003uZ-LF; Thu, 10 Nov 2022 15:35:55 +0000
Received: by outflank-mailman (input) for mailman id 441904;
 Thu, 10 Nov 2022 15:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMI0=3K=huawei.com=yangyingliang@srs-se1.protection.inumbo.net>)
 id 1ot9RV-0000zN-Eg
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 15:26:13 +0000
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff298871-610b-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 16:26:09 +0100 (CET)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N7Qdq2RdCz15MNt;
 Thu, 10 Nov 2022 23:25:51 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 23:26:05 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 10 Nov
 2022 23:26:04 +0800
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
X-Inumbo-ID: ff298871-610b-11ed-91b5-6bf2151ebd3b
From: Yang Yingliang <yangyingliang@huawei.com>
To: <xen-devel@lists.xenproject.org>
CC: <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <yangyingliang@huawei.com>
Subject: [PATCH] xen/pcpu: fix possible memory leak in register_pcpu()
Date: Thu, 10 Nov 2022 23:24:41 +0800
Message-ID: <20221110152441.401630-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

In device_add(), dev_set_name() is called to allocate name, if it returns
error, the name need be freed. As comment of device_register() says, it
should use put_device() to give up the reference in the error path. So fix
this by calling put_device(), then the name can be freed in kobject_cleanup().

Fixes: f65c9bb3fb72 ("xen/pcpu: Xen physical cpus online/offline sys interface")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/xen/pcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index 47aa3a1ccaf5..fd3a644b0855 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -228,7 +228,7 @@ static int register_pcpu(struct pcpu *pcpu)
 
 	err = device_register(dev);
 	if (err) {
-		pcpu_release(dev);
+		put_device(dev);
 		return err;
 	}
 
-- 
2.25.1


