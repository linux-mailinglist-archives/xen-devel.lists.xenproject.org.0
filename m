Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379004BF709
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 12:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276697.472949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMT6j-0006VC-3D; Tue, 22 Feb 2022 11:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276697.472949; Tue, 22 Feb 2022 11:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMT6i-0006SC-W6; Tue, 22 Feb 2022 11:13:24 +0000
Received: by outflank-mailman (input) for mailman id 276697;
 Tue, 22 Feb 2022 11:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pCta=TF=huawei.com=linmiaohe@srs-se1.protection.inumbo.net>)
 id 1nMT6h-0006S4-Lq
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 11:13:23 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f85945c-93d0-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 12:13:19 +0100 (CET)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K2xLr5zVwz9sxm;
 Tue, 22 Feb 2022 19:11:32 +0800 (CST)
Received: from huawei.com (10.175.124.27) by canpemm500002.china.huawei.com
 (7.192.104.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 22 Feb
 2022 19:13:15 +0800
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
X-Inumbo-ID: 6f85945c-93d0-11ec-8eb8-a37418f5ba1a
From: Miaohe Lin <linmiaohe@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>
CC: <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>, <linmiaohe@huawei.com>
Subject: [PATCH] xen: use helper macro __ATTR_RW
Date: Tue, 22 Feb 2022 19:12:22 +0800
Message-ID: <20220222111222.56877-1-linmiaohe@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected

Use helper macro __ATTR_RW to define hyp_sysfs_attr to make code more
clear. Minor readability improvement.

Signed-off-by: Miaohe Lin <linmiaohe@huawei.com>
---
 drivers/xen/sys-hypervisor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index feb1d16252e7..5e842c88a13e 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -25,8 +25,7 @@
 static struct hyp_sysfs_attr  _name##_attr = __ATTR_RO(_name)
 
 #define HYPERVISOR_ATTR_RW(_name) \
-static struct hyp_sysfs_attr _name##_attr = \
-	__ATTR(_name, 0644, _name##_show, _name##_store)
+static struct hyp_sysfs_attr _name##_attr = __ATTR_RW(_name)
 
 struct hyp_sysfs_attr {
 	struct attribute attr;
-- 
2.23.0


