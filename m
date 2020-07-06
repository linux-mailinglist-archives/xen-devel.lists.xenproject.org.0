Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD521215E02
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 20:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVXB-0003WV-HT; Mon, 06 Jul 2020 18:08:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8At=AR=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jsVXA-0003W5-9P
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 18:08:04 +0000
X-Inumbo-ID: a24d1442-bfb3-11ea-b7bb-bc764e2007e4
Received: from mail-pj1-x1042.google.com (unknown [2607:f8b0:4864:20::1042])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a24d1442-bfb3-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 18:08:03 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so42353pjb.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mBXFHkH5TzG6LqeVLyEATGFp3OINlEiEkwTG6DKP5gc=;
 b=FREEGuCxU2Zl2/sBJH058EpPMS4GiGXU/dTLgSmQEKbeNdyxgdzwv6AAMNmM25OGkN
 wHBZkctV9M8/clpVivrB7YRq+baoOE5bJDhR17Lw9dkYo23TMg+x1b8gyTP83jcBRsUn
 3SNWA8P3JttgJfmavqXK/qcf7fBcuz/PfiCLo7HOo3VIdWpaL4z8nf/hygxZQJjiflk+
 qPQPmXDwdqqBEwSL55lx+ZvGU5tvKjsYuSs334PaBtvBgBObRn//cpQIispeu/2WLEAh
 iKi3Ceg4sZjdH2QCP/1xYDV+sGiKJrKHFlkCfJNO/GbDEUNaHfr68A7APrHx0fubgBoX
 ag7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mBXFHkH5TzG6LqeVLyEATGFp3OINlEiEkwTG6DKP5gc=;
 b=f4LpsQACeisrZZfqzLbIU+/3bIejRcnLwqdJ7C8D+I2hFZ2ZHTam+BvQNGXDHrMRK5
 J3qDLVTB9FXanWpECDjSWOvy+zbjg6nBfJibZXxB+F9B1jnNTnaclYIBTbDQnRvruR67
 c0Q0GjNKqveZVoW4z0wpbRbRlchve+96RSHp4QYuZNvFph3vST4Jdpo1mRqb4Ww9QyBS
 XqNqmv/E74jF8ZU7FlnOiufJxcNZllk5wcyoQEh/rkjWqCIsg/WkmQs/OlcrOtH/B2Is
 Uv1kdqwiSPWcemKTyv3FP6l0YYIcqu//9HNu0pXmmazt8VV6ItuIHPHJpgvuOAaNqNqc
 8Bdw==
X-Gm-Message-State: AOAM530g1UgAiR9Dg90jMWBcG5f1Jp0wppbkB+TYvwCOMh0BbCeYA/mP
 sOh+SjIFuzpicnppQoDezwU=
X-Google-Smtp-Source: ABdhPJzfrg4kfMMYzI0FM6dp3y6GDVRu7C/vmGzXICthTgrs/634fOSnQFK49BpoDjYsRBctgws2Eg==
X-Received: by 2002:a17:90a:aa83:: with SMTP id l3mr399709pjq.73.1594058882791; 
 Mon, 06 Jul 2020 11:08:02 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.43.125])
 by smtp.gmail.com with ESMTPSA id 199sm20425544pgc.79.2020.07.06.11.07.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 11:08:02 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v2 1/3] xen/privcmd: Corrected error handling path
Date: Mon,  6 Jul 2020 23:46:10 +0530
Message-Id: <1594059372-15563-2-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
 drivers/xen/privcmd.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index a250d11..33677ea 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -580,13 +580,13 @@ static long privcmd_ioctl_mmap_batch(
 
 static int lock_pages(
 	struct privcmd_dm_op_buf kbufs[], unsigned int num,
-	struct page *pages[], unsigned int nr_pages)
+	struct page *pages[], unsigned int nr_pages, unsigned int *pinned)
 {
 	unsigned int i;
+	int page_count = 0;
 
 	for (i = 0; i < num; i++) {
 		unsigned int requested;
-		int pinned;
 
 		requested = DIV_ROUND_UP(
 			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
@@ -594,14 +594,15 @@ static int lock_pages(
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
@@ -611,13 +612,8 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
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
@@ -630,6 +626,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	struct xen_dm_op_buf *xbufs = NULL;
 	unsigned int i;
 	long rc;
+	unsigned int pinned = 0;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
 		return -EFAULT;
@@ -683,9 +680,11 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
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


