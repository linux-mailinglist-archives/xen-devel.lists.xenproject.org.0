Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59846A8AB9
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 21:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505402.778185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXppA-0005Uv-Fq; Thu, 02 Mar 2023 20:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505402.778185; Thu, 02 Mar 2023 20:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXppA-0005RZ-A5; Thu, 02 Mar 2023 20:46:48 +0000
Received: by outflank-mailman (input) for mailman id 505402;
 Thu, 02 Mar 2023 20:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBoy=62=infradead.org=mcgrof@srs-se1.protection.inumbo.net>)
 id 1pXpp8-0004iE-Rm
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 20:46:46 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ef370c-b93b-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 21:46:44 +0100 (CET)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXO-Df; Thu, 02 Mar 2023 20:46:14 +0000
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
X-Inumbo-ID: 56ef370c-b93b-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MXqH7HxuGUp4vr/6baVHWsjCOA7cvGA5MJGn2lYMgHY=; b=Wn18YuHvszFD95jKeWngGibMfk
	m0dkZQ/T4wh0lgQnmNyqnPNU8wiR3wNNIOFAQ/uJApiYoYiCX6W4rfGp9dazoMtM2bwoM+0WBiCNC
	Zufdri5+sD3Q341upVXgIu1muzt5P4Jq3In7jEXridJQdLINYWC/lbJZRuwwbCAPQbiRw2Gifn7PV
	5l4S/BZ9ufO6qSJiEuCDouaynQw+hbOCQIXagyqfer/Tf0CgxPlq9N55pKEXLUt0GgP9bjK+YI+um
	6CZGflx9Hg4Q3sGl2wesUq57AAJ6djo3BjCYRDNYjrv49f8LE+JOOtmq1J70LFUnI4mMWXgd2vQ2k
	0Y7scWbg==;
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
Subject: [PATCH 2/7] ipmi: simplify sysctl registration
Date: Thu,  2 Mar 2023 12:46:07 -0800
Message-Id: <20230302204612.782387-3-mcgrof@kernel.org>
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
 drivers/char/ipmi/ipmi_poweroff.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index 163ec9749e55..870659d91db2 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -659,20 +659,6 @@ static struct ctl_table ipmi_table[] = {
 	{ }
 };
 
-static struct ctl_table ipmi_dir_table[] = {
-	{ .procname	= "ipmi",
-	  .mode		= 0555,
-	  .child	= ipmi_table },
-	{ }
-};
-
-static struct ctl_table ipmi_root_table[] = {
-	{ .procname	= "dev",
-	  .mode		= 0555,
-	  .child	= ipmi_dir_table },
-	{ }
-};
-
 static struct ctl_table_header *ipmi_table_header;
 #endif /* CONFIG_PROC_FS */
 
@@ -689,7 +675,7 @@ static int __init ipmi_poweroff_init(void)
 		pr_info("Power cycle is enabled\n");
 
 #ifdef CONFIG_PROC_FS
-	ipmi_table_header = register_sysctl_table(ipmi_root_table);
+	ipmi_table_header = register_sysctl("dev/ipmi", ipmi_table);
 	if (!ipmi_table_header) {
 		pr_err("Unable to register powercycle sysctl\n");
 		rv = -ENOMEM;
-- 
2.39.1


