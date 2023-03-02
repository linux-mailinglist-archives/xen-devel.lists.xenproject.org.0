Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D06A8AB5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 21:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505401.778181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXppA-0005SQ-Ba; Thu, 02 Mar 2023 20:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505401.778181; Thu, 02 Mar 2023 20:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXppA-0005N4-1z; Thu, 02 Mar 2023 20:46:48 +0000
Received: by outflank-mailman (input) for mailman id 505401;
 Thu, 02 Mar 2023 20:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBoy=62=infradead.org=mcgrof@srs-se1.protection.inumbo.net>)
 id 1pXpp8-0004ie-F9
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 20:46:46 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5689b507-b93b-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 21:46:43 +0100 (CET)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXY-T5; Thu, 02 Mar 2023 20:46:14 +0000
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
X-Inumbo-ID: 5689b507-b93b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dtfyNVshuDQIj+dlbLKUh3FrBpHjPuB+OiDl4kHMg0w=; b=y+/KNE5d+TW3hH8L9Iql5pMuDY
	mtQ2q1980lq3pkwG/xQP1LmilCyPNzezGqF7q0DG5V7xsGEwDTYwL1JvJCDFTe/zRXH57HGHD5QW/
	O8UeGtO2rrvC7q1JiYXTkhaSl2XwOkiMf9u7Bw475hl1I50DYfKypH7bafzPo/5auQO5nAWWpyMzo
	gGUrJvFV6cuTyc3hE4lyn5hDmXOrOPtNk1IXXmXNQPVhLjpjwJ7GPmbWttNzvSv3PP/4O3nghH0oh
	Q9RypKa5XuLJaNXMpBIQPO6xY6fjA5jHIzzVMBlTxnFZ6w8BOSv37SOKMsJSXJC05q7iNhPjFZil9
	SHo+B+Mg==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com,
	keescook@chromium.org,
	yzaikin@google.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	minyard@acm.org,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	song@kernel.org,
	robinmholt@gmail.com,
	steve.wahl@hpe.com,
	mike.travis@hpe.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org
Cc: j.granados@samsung.com,
	zhangpeng362@huawei.com,
	tangmeng@uniontech.com,
	willy@infradead.org,
	nixiaoming@huawei.com,
	sujiaxun@uniontech.com,
	patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	apparmor@lists.ubuntu.com,
	linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 7/7] xen: simplify sysctl registration for balloon
Date: Thu,  2 Mar 2023 12:46:12 -0800
Message-Id: <20230302204612.782387-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

register_sysctl_table() is a deprecated compatibility wrapper.
register_sysctl_init() can do the directory creation for you so just
use that.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/xen/balloon.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 617a7f4f07a8..586a1673459e 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -97,24 +97,6 @@ static struct ctl_table balloon_table[] = {
 	{ }
 };
 
-static struct ctl_table balloon_root[] = {
-	{
-		.procname	= "balloon",
-		.mode		= 0555,
-		.child		= balloon_table,
-	},
-	{ }
-};
-
-static struct ctl_table xen_root[] = {
-	{
-		.procname	= "xen",
-		.mode		= 0555,
-		.child		= balloon_root,
-	},
-	{ }
-};
-
 #else
 #define xen_hotplug_unpopulated 0
 #endif
@@ -747,7 +729,7 @@ static int __init balloon_init(void)
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
 	set_online_page_callback(&xen_online_page);
 	register_memory_notifier(&xen_memory_nb);
-	register_sysctl_table(xen_root);
+	register_sysctl_init("xen/balloon", balloon_table);
 #endif
 
 	balloon_add_regions();
-- 
2.39.1


