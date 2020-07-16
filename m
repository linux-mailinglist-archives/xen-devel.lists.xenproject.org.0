Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6781221F72
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 11:10:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvzta-0007W4-Iy; Thu, 16 Jul 2020 09:09:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKj/=A3=huawei.com=miaoqinglang@srs-us1.protection.inumbo.net>)
 id 1jvzn3-0007O7-Vu
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 09:02:54 +0000
X-Inumbo-ID: 1f77d9d4-c743-11ea-948f-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f77d9d4-c743-11ea-948f-12813bfff9fa;
 Thu, 16 Jul 2020 09:02:50 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 17F9E5A95E9514988E2A;
 Thu, 16 Jul 2020 17:02:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 17:02:46 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Chen-Yu Tsai
 <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: [PATCH -next] x86/xen: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 17:06:41 +0800
Message-ID: <20200716090641.14184-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:09:37 +0000
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Chen Huang <chenhuang5@huawei.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 arch/x86/xen/p2m.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 4cf680e2e..0f4a449de 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -799,17 +799,7 @@ static int p2m_dump_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int p2m_dump_open(struct inode *inode, struct file *filp)
-{
-	return single_open(filp, p2m_dump_show, NULL);
-}
-
-static const struct file_operations p2m_dump_fops = {
-	.open		= p2m_dump_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(p2m_dump);
 
 static struct dentry *d_mmu_debug;
 
-- 
2.17.1


