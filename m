Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917421C713
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2020 05:32:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juSiH-0001nv-DM; Sun, 12 Jul 2020 03:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQ2C=AX=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1juSiF-0001nG-3n
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2020 03:31:35 +0000
X-Inumbo-ID: 2f373f0a-c3f0-11ea-8496-bc764e2007e4
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f373f0a-c3f0-11ea-8496-bc764e2007e4;
 Sun, 12 Jul 2020 03:31:34 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m9so4487595pfh.0
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2020 20:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aJSWgi0xiDq2TEjOwzrr33u9Kob9ua2/jtyaxeBw01I=;
 b=BJXHKUnEMD8COwDxple2uc80bG5s+/UbetrM7wV8qMA4W1AeaRkA1dUyAA+qm438vT
 Gy00Mc+YrUQxaq/DmQnTK1DFyC3H+fK0aLz6QNB/mvbhx4hZHMLc+AM+rAPjoq2VGf4k
 sTWacxWoTe8csdNCUsjNqLRQyLsgRh+itgowLckdvIv4Nqt2ooHoxOl3UtBKHxwHkPGa
 jgH0sN/FUstxj6s1MRpaEihCKLF7llJxium2YMebgjk+qKe3lORUerU1ZbCR0fNoAocG
 koPDJjKw+JGN2l7JqMyjXe2+sP64iRvf3HrcuZhNGqf+POiictvmNBqs9fI9orDMVJFq
 7KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aJSWgi0xiDq2TEjOwzrr33u9Kob9ua2/jtyaxeBw01I=;
 b=ElqGhu3LePqe7f8xqa8bJ413NRB3lMIILWu+bNM4+mzKv2sHz0jqq9GjD9Z4awW41B
 ejtQsCrPxgBCRU/cQHTzUkcRmmKFPlhJjeohOIMjLTYd/2j2D0MLmpzXBP3lwsDyGIyE
 aAqpDWHQ/c0YmJtcrVJhYRPBjDq8r6STQYmr2+50tn+9QXB9e8ZBuyWrHuKCJc7zSFIJ
 hSsfkidYNrrFtZ+3pnznbeFuRd47Qq6fnx7GoiP+fFsMJzbSlz5jGGtJJJoK/I29KY/K
 CQmBtERSRPevryidq6Z71ZDlQ6lC2017I9p846g+pRnIF8gwex+9EPOHiMWrWAzmEg+J
 vYlg==
X-Gm-Message-State: AOAM530Sl4h9ivQFa932WGkXZdPVMLOvtk7lsHRVP59PIRzlZ1QwK14w
 o5/wuwwx8dSH88VIl9aosBQ=
X-Google-Smtp-Source: ABdhPJzGcosdIsNjTLJCw8K3Nj8FTvzS0ofcadybPbfYsTh6uAimwx5dECsp1E5FMwZE8E+TEIqYmw==
X-Received: by 2002:a63:dd4d:: with SMTP id g13mr63445998pgj.179.1594524693521; 
 Sat, 11 Jul 2020 20:31:33 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.224.89])
 by smtp.gmail.com with ESMTPSA id s89sm9750271pjj.28.2020.07.11.20.31.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Jul 2020 20:31:32 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v3 1/3] xen/privcmd: Corrected error handling path
Date: Sun, 12 Jul 2020 09:09:53 +0530
Message-Id: <1594525195-28345-2-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <xadimgnik@gmail.com>,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Previously, if lock_pages() end up partially mapping pages, it used
to return -ERRNO due to which unlock_pages() have to go through
each pages[i] till *nr_pages* to validate them. This can be avoided
by passing correct number of partially mapped pages & -ERRNO separately,
while returning from lock_pages() due to error.

With this fix unlock_pages() doesn't need to validate pages[i] till
*nr_pages* for error scenario and few condition checks can be ignored.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
 drivers/xen/privcmd.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 5dfc59f..b001673 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -579,13 +579,13 @@ static long privcmd_ioctl_mmap_batch(
 
 static int lock_pages(
 	struct privcmd_dm_op_buf kbufs[], unsigned int num,
-	struct page *pages[], unsigned int nr_pages)
+	struct page *pages[], unsigned int nr_pages, unsigned int *pinned)
 {
 	unsigned int i;
 
 	for (i = 0; i < num; i++) {
 		unsigned int requested;
-		int pinned;
+		int page_count;
 
 		requested = DIV_ROUND_UP(
 			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
@@ -593,14 +593,15 @@ static int lock_pages(
 		if (requested > nr_pages)
 			return -ENOSPC;
 
-		pinned = get_user_pages_fast(
+		page_count = get_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
-		if (pinned < 0)
-			return pinned;
+		if (page_count < 0)
+			return page_count;
 
-		nr_pages -= pinned;
-		pages += pinned;
+		*pinned += page_count;
+		nr_pages -= page_count;
+		pages += page_count;
 	}
 
 	return 0;
@@ -610,13 +611,8 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
 	unsigned int i;
 
-	if (!pages)
-		return;
-
-	for (i = 0; i < nr_pages; i++) {
-		if (pages[i])
-			put_page(pages[i]);
-	}
+	for (i = 0; i < nr_pages; i++)
+		put_page(pages[i]);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
@@ -629,6 +625,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	struct xen_dm_op_buf *xbufs = NULL;
 	unsigned int i;
 	long rc;
+	unsigned int pinned = 0;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
 		return -EFAULT;
@@ -682,9 +679,11 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 		goto out;
 	}
 
-	rc = lock_pages(kbufs, kdata.num, pages, nr_pages);
-	if (rc)
+	rc = lock_pages(kbufs, kdata.num, pages, nr_pages, &pinned);
+	if (rc < 0) {
+		nr_pages = pinned;
 		goto out;
+	}
 
 	for (i = 0; i < kdata.num; i++) {
 		set_xen_guest_handle(xbufs[i].h, kbufs[i].uptr);
-- 
1.9.1


