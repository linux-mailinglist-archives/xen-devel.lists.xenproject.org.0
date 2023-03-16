Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E236BC98A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510377.787915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjCA-0006JR-SW; Thu, 16 Mar 2023 08:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510377.787915; Thu, 16 Mar 2023 08:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjCA-0006Gc-Pb; Thu, 16 Mar 2023 08:42:46 +0000
Received: by outflank-mailman (input) for mailman id 510377;
 Thu, 16 Mar 2023 08:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXAR=7I=nfschina.com=yuzhe@srs-se1.protection.inumbo.net>)
 id 1pcjAQ-0006EC-70
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:40:58 +0000
Received: from mail.nfschina.com (unknown [42.101.60.237])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 427dd150-c3d6-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 09:40:54 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id D56C51A00AAA;
 Thu, 16 Mar 2023 16:40:43 +0800 (CST)
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtsi9PHcep3B; Thu, 16 Mar 2023 16:40:43 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: yuzhe@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 6DF971A0079E;
 Thu, 16 Mar 2023 16:40:42 +0800 (CST)
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
X-Inumbo-ID: 427dd150-c3d6-11ed-b464-930f4c7d94ae
X-Virus-Scanned: amavisd-new at nfschina.com
From: Yu Zhe <yuzhe@nfschina.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] xen: remove unnecessary (void*) conversions
Date: Thu, 16 Mar 2023 16:39:54 +0800
Message-Id: <20230316083954.4223-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0

Pointer variables of void * type do not require type cast.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/xen/xenfs/xensyms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/xenfs/xensyms.c b/drivers/xen/xenfs/xensyms.c
index c6c73a33c44d..b799bc759c15 100644
--- a/drivers/xen/xenfs/xensyms.c
+++ b/drivers/xen/xenfs/xensyms.c
@@ -64,7 +64,7 @@ static int xensyms_next_sym(struct xensyms *xs)
 
 static void *xensyms_start(struct seq_file *m, loff_t *pos)
 {
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 
 	xs->op.u.symdata.symnum = *pos;
 
@@ -76,7 +76,7 @@ static void *xensyms_start(struct seq_file *m, loff_t *pos)
 
 static void *xensyms_next(struct seq_file *m, void *p, loff_t *pos)
 {
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 
 	xs->op.u.symdata.symnum = ++(*pos);
 
@@ -88,7 +88,7 @@ static void *xensyms_next(struct seq_file *m, void *p, loff_t *pos)
 
 static int xensyms_show(struct seq_file *m, void *p)
 {
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 	struct xenpf_symdata *symdata = &xs->op.u.symdata;
 
 	seq_printf(m, "%016llx %c %s\n", symdata->address,
@@ -120,7 +120,7 @@ static int xensyms_open(struct inode *inode, struct file *file)
 		return ret;
 
 	m = file->private_data;
-	xs = (struct xensyms *)m->private;
+	xs = m->private;
 
 	xs->namelen = XEN_KSYM_NAME_LEN + 1;
 	xs->name = kzalloc(xs->namelen, GFP_KERNEL);
@@ -138,7 +138,7 @@ static int xensyms_open(struct inode *inode, struct file *file)
 static int xensyms_release(struct inode *inode, struct file *file)
 {
 	struct seq_file *m = file->private_data;
-	struct xensyms *xs = (struct xensyms *)m->private;
+	struct xensyms *xs = m->private;
 
 	kfree(xs->name);
 	return seq_release_private(inode, file);
-- 
2.11.0


