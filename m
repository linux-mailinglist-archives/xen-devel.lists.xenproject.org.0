Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D96A8AB8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 21:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505400.778164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXpp8-0004yW-Vl; Thu, 02 Mar 2023 20:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505400.778164; Thu, 02 Mar 2023 20:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXpp8-0004qh-P3; Thu, 02 Mar 2023 20:46:46 +0000
Received: by outflank-mailman (input) for mailman id 505400;
 Thu, 02 Mar 2023 20:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBoy=62=infradead.org=mcgrof@srs-se1.protection.inumbo.net>)
 id 1pXpp7-0004iE-Rf
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 20:46:45 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56b74eb2-b93b-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 21:46:43 +0100 (CET)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXU-Mw; Thu, 02 Mar 2023 20:46:14 +0000
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
X-Inumbo-ID: 56b74eb2-b93b-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=71lfCsPo7yFKiIAEzb7+CVhOSJuKqCJLiCYyMEP1nX8=; b=p6Yel5Hfld+1FW2EBNV5366POq
	vJPcZmFCSoBMiHWsnzV+jFaz/uDjYDZKCSMVih6k7yTXZeK0esG+XoqGZm9PRwj7XoUWz1rJk2q/E
	W+/FxaL2XVpQFgwiqiS/BLSFmuYGCiJ2RytjR/MyXk6RSB5u/Gb6pD9cbTP3FOuh/IUlWNVZg9nlC
	ae1SW5g3A+R91mMBWyCJsTKqh3vMrYlSFc91+9y4TqjqjC2hXi5zZKAl59br57tm1NS/Si0Gk8WIN
	4LHLL8b5jmRCk45aZvhVhNvYHw+agvS23gBr87drZJxFTEPUWGT0jgdOq4ItcyYm6kfRP8hHNOmNG
	e/bvQgIQ==;
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
Subject: [PATCH 5/7] sgi-xp: simplify sysctl registration
Date: Thu,  2 Mar 2023 12:46:10 -0800
Message-Id: <20230302204612.782387-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

Although this driver is a good use case for having a directory
that is not other directories and then subdirectories with more
entries, the usage of register_sysctl_table() can recurse and
increases complexity so to avoid that just split out the
registration to each directory with its own entries.

register_sysctl_table() is a deprecated compatibility wrapper.
register_sysctl() can do the directory creation for you so just use
that.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/misc/sgi-xp/xpc_main.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index b2c3c22fc13c..6da509d692bb 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -93,7 +93,7 @@ int xpc_disengage_timelimit = XPC_DISENGAGE_DEFAULT_TIMELIMIT;
 static int xpc_disengage_min_timelimit;	/* = 0 */
 static int xpc_disengage_max_timelimit = 120;
 
-static struct ctl_table xpc_sys_xpc_hb_dir[] = {
+static struct ctl_table xpc_sys_xpc_hb[] = {
 	{
 	 .procname = "hb_interval",
 	 .data = &xpc_hb_interval,
@@ -112,11 +112,7 @@ static struct ctl_table xpc_sys_xpc_hb_dir[] = {
 	 .extra2 = &xpc_hb_check_max_interval},
 	{}
 };
-static struct ctl_table xpc_sys_xpc_dir[] = {
-	{
-	 .procname = "hb",
-	 .mode = 0555,
-	 .child = xpc_sys_xpc_hb_dir},
+static struct ctl_table xpc_sys_xpc[] = {
 	{
 	 .procname = "disengage_timelimit",
 	 .data = &xpc_disengage_timelimit,
@@ -127,14 +123,9 @@ static struct ctl_table xpc_sys_xpc_dir[] = {
 	 .extra2 = &xpc_disengage_max_timelimit},
 	{}
 };
-static struct ctl_table xpc_sys_dir[] = {
-	{
-	 .procname = "xpc",
-	 .mode = 0555,
-	 .child = xpc_sys_xpc_dir},
-	{}
-};
+
 static struct ctl_table_header *xpc_sysctl;
+static struct ctl_table_header *xpc_sysctl_hb;
 
 /* non-zero if any remote partition disengage was timed out */
 int xpc_disengage_timedout;
@@ -1041,6 +1032,8 @@ xpc_do_exit(enum xp_retval reason)
 
 	if (xpc_sysctl)
 		unregister_sysctl_table(xpc_sysctl);
+	if (xpc_sysctl_hb)
+		unregister_sysctl_table(xpc_sysctl_hb);
 
 	xpc_teardown_partitions();
 
@@ -1243,7 +1236,8 @@ xpc_init(void)
 		goto out_1;
 	}
 
-	xpc_sysctl = register_sysctl_table(xpc_sys_dir);
+	xpc_sysctl = register_sysctl("xpc", xpc_sys_xpc);
+	xpc_sysctl_hb = register_sysctl("xpc/hb", xpc_sys_xpc_hb);
 
 	/*
 	 * Fill the partition reserved page with the information needed by
@@ -1308,6 +1302,8 @@ xpc_init(void)
 	(void)unregister_die_notifier(&xpc_die_notifier);
 	(void)unregister_reboot_notifier(&xpc_reboot_notifier);
 out_2:
+	if (xpc_sysctl_hb)
+		unregister_sysctl_table(xpc_sysctl_hb);
 	if (xpc_sysctl)
 		unregister_sysctl_table(xpc_sysctl);
 
-- 
2.39.1


