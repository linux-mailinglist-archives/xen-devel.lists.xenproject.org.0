Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA80630E32
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 12:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446047.701546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owLgk-0008So-Px; Sat, 19 Nov 2022 11:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446047.701546; Sat, 19 Nov 2022 11:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owLgk-0008IO-Jx; Sat, 19 Nov 2022 11:07:10 +0000
Received: by outflank-mailman (input) for mailman id 446047;
 Sat, 19 Nov 2022 09:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TADl=3T=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1owJkG-0003FI-OH
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 09:02:40 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c0e0df-67e8-11ed-8fd2-01056ac49cbb;
 Sat, 19 Nov 2022 10:02:38 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NDnhk1qhNzHvsQ;
 Sat, 19 Nov 2022 17:01:58 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 17:02:31 +0800
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
X-Inumbo-ID: e8c0e0df-67e8-11ed-8fd2-01056ac49cbb
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] x86/xen: Fix memory leak in xen_init_lock_cpu()
Date: Sat, 19 Nov 2022 16:59:23 +0800
Message-ID: <20221119085923.114889-3-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119085923.114889-1-xiujianfeng@huawei.com>
References: <20221119085923.114889-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

In xen_init_lock_cpu(), the @name has allocated new string by kasprintf(),
if bind_ipi_to_irqhandler() fails, it should be freed, otherwise may lead
to a memory leak issue, fix it.

Fixes: 2d9e1e2f58b5 ("xen: implement Xen-specific spinlocks")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/x86/xen/spinlock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 043c73dfd2c9..156d3e04c9ef 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -86,7 +86,8 @@ void xen_init_lock_cpu(int cpu)
 		disable_irq(irq); /* make sure it's never delivered */
 		per_cpu(lock_kicker_irq, cpu) = irq;
 		per_cpu(irq_name, cpu) = name;
-	}
+	} else
+		kfree(name);
 
 	printk("cpu %d spinlock event irq %d\n", cpu, irq);
 }
-- 
2.17.1


