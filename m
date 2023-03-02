Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D46A8AB7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 21:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505398.778152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXpp8-0004kF-D7; Thu, 02 Mar 2023 20:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505398.778152; Thu, 02 Mar 2023 20:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXpp8-0004iT-7J; Thu, 02 Mar 2023 20:46:46 +0000
Received: by outflank-mailman (input) for mailman id 505398;
 Thu, 02 Mar 2023 20:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBoy=62=infradead.org=mcgrof@srs-se1.protection.inumbo.net>)
 id 1pXpp6-0004iE-6y
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 20:46:44 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5678ce7c-b93b-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 21:46:43 +0100 (CET)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXS-K5; Thu, 02 Mar 2023 20:46:14 +0000
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
X-Inumbo-ID: 5678ce7c-b93b-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FdfA4hbd8rob4fQ8ALRTamLZAV/vYtVA6accqcc3SkE=; b=fhFYPSITeZQoANR5nzpZq4Y0OT
	BQwHzsCAGMKWCiIoSIoIot7NNKjVrWJ2csclbdX/OOhLJYxICH7Q27IOcnWVnqBV6tXuU8kS52aj/
	YqHN4NX4N7fDDw4Ys9oApL+1jemtpaghDeLGYs3gvxuvAl+0KPuQkX4VoZYK3yKfBN3VTD7lR+L5y
	zoheqXVFYPGrL8npa41ZLEY4CWXClu94akdIDtt8HOvD3vZ7MVf6ahgT4td72SzQ/DFF6hyJSXBYo
	SVjTazXdtUIiOEkwWaBbVYO6PEJRqGYpTuZBgGoMQZtE1KOOqHJdw0x9dSfjUV+NG5jW2pzVBmTGb
	MxuTRIgg==;
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
Subject: [PATCH 4/7] md: simplify sysctl registration
Date: Thu,  2 Mar 2023 12:46:09 -0800
Message-Id: <20230302204612.782387-5-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

register_sysctl_table() is a deprecated compatibility wrapper.
register_sysctl() can do the directory creation for you so just use
that.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/md/md.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 927a43db5dfb..546b1b81eb28 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -322,26 +322,6 @@ static struct ctl_table raid_table[] = {
 	{ }
 };
 
-static struct ctl_table raid_dir_table[] = {
-	{
-		.procname	= "raid",
-		.maxlen		= 0,
-		.mode		= S_IRUGO|S_IXUGO,
-		.child		= raid_table,
-	},
-	{ }
-};
-
-static struct ctl_table raid_root_table[] = {
-	{
-		.procname	= "dev",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= raid_dir_table,
-	},
-	{  }
-};
-
 static int start_readonly;
 
 /*
@@ -9650,7 +9630,7 @@ static int __init md_init(void)
 	mdp_major = ret;
 
 	register_reboot_notifier(&md_notifier);
-	raid_table_header = register_sysctl_table(raid_root_table);
+	raid_table_header = register_sysctl("dev/raid", raid_table);
 
 	md_geninit();
 	return 0;
-- 
2.39.1


