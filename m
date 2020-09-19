Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A903270A45
	for <lists+xen-devel@lfdr.de>; Sat, 19 Sep 2020 04:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJSyk-0007HA-1W; Sat, 19 Sep 2020 02:51:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdNc=C4=huawei.com=miaoqinglang@srs-us1.protection.inumbo.net>)
 id 1kJSyi-0007H5-PF
 for xen-devel@lists.xenproject.org; Sat, 19 Sep 2020 02:51:56 +0000
X-Inumbo-ID: 05b2b31b-3dcc-45a4-9873-8f9232875c57
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05b2b31b-3dcc-45a4-9873-8f9232875c57;
 Sat, 19 Sep 2020 02:51:51 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 47D864FA4E1449EC3C6F;
 Sat, 19 Sep 2020 10:51:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 10:51:37 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
 "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next v2] x86/xen: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat, 19 Sep 2020 10:52:09 +0800
Message-ID: <20200919025209.17930-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
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

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 arch/x86/xen/p2m.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index be4151f42..3301875dd 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -795,17 +795,7 @@ static int p2m_dump_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int p2m_dump_open(struct inode *inode, struct file *filp)
-{
-	return single_open(filp, p2m_dump_show, NULL);
-}
-
-static const struct file_operations p2m_dump_fops = {
-	.open		= p2m_dump_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(p2m_dump);
 
 static struct dentry *d_mmu_debug;
 
-- 
2.23.0


