Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26166391379
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 11:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132401.246984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llpcx-0002Wu-Mp; Wed, 26 May 2021 09:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132401.246984; Wed, 26 May 2021 09:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llpcx-0002RD-Hm; Wed, 26 May 2021 09:14:59 +0000
Received: by outflank-mailman (input) for mailman id 132401;
 Wed, 26 May 2021 09:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mEKv=KV=huawei.com=chenhuang5@srs-us1.protection.inumbo.net>)
 id 1llpYj-0002BS-BO
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 09:10:37 +0000
Received: from szxga04-in.huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5b45e28-f401-4546-8568-420a29a4138c;
 Wed, 26 May 2021 09:10:25 +0000 (UTC)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FqlTG3KXMz1BQTF;
 Wed, 26 May 2021 17:07:30 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:22 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:21 +0800
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
X-Inumbo-ID: d5b45e28-f401-4546-8568-420a29a4138c
From: Chen Huang <chenhuang5@huawei.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton
	<akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Jens
 Axboe" <axboe@kernel.dk>, Yang Yingliang <yangyingliang@huawei.com>,
	"Masahiro Yamada" <masahiroy@kernel.org>, Dan Carpenter
	<dan.carpenter@oracle.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <ocfs2-devel@oss.oracle.com>, Chen Huang
	<chenhuang5@huawei.com>
Subject: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with kstrtoull()
Date: Wed, 26 May 2021 09:20:19 +0000
Message-ID: <20210526092020.554341-2-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526092020.554341-1-chenhuang5@huawei.com>
References: <20210526092020.554341-1-chenhuang5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected

The simple_strtoull() function is deprecated in some situation, since
it does not check for the range overflow, use kstrtoull() instead.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 drivers/xen/xen-balloon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-balloon.c b/drivers/xen/xen-balloon.c
index a8d24433c8e9..1fba838963d2 100644
--- a/drivers/xen/xen-balloon.c
+++ b/drivers/xen/xen-balloon.c
@@ -163,13 +163,16 @@ static ssize_t store_target_kb(struct device *dev,
 			       const char *buf,
 			       size_t count)
 {
-	char *endchar;
+	ssize_t ret;
 	unsigned long long target_bytes;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	target_bytes = simple_strtoull(buf, &endchar, 0) * 1024;
+	ret = kstrtoull(buf, 0, &target_bytes);
+	if (ret)
+		return ret;
+	target_bytes *= 1024;
 
 	balloon_set_new_target(target_bytes >> PAGE_SHIFT);
 
-- 
2.25.1


