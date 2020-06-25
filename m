Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A70C2098A9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 04:55:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joI2P-0008Kx-J1; Thu, 25 Jun 2020 02:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=829E=AG=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1joI2O-0008Ks-Dw
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 02:54:52 +0000
X-Inumbo-ID: 3d4ae06a-b68f-11ea-8496-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d4ae06a-b68f-11ea-8496-bc764e2007e4;
 Thu, 25 Jun 2020 02:54:51 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u128so2585693pgu.13
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 19:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fAhw99hSHSp4oWrS0namYNm6Go3NsuSaLTMdS2js2yg=;
 b=tGJIN5xGsgN1is4VPvkWyDq1pQcJK/f4mEt+aWjJHg7bZ3RJcDogKlmQ0OSbuVj4dk
 m8f1/44VpRJ3kiSvogq4WXlZ3AY6U2bU3iwIhwsi9/432OcHSqoK785PT1o24waKPk3y
 JkpBWrh9BmojPyt6eC9QUQqiXQK5t8N4VSGy8DmuPGEt9bR/ONK3zzbAggeOqH7PR7UW
 TlCDWeZoRDnx4wuJN4Y2p4v0QoXAKAgzmw1+ZZV1tyk93pdcs1CcjpKikxhpATOSO5Lc
 RsNnXAUUon3g9H+ZafgA/DX3BsvOxBOIRnnzmEgwjDKYQudXSSRn33PYSWi6eyNCcZWx
 whGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fAhw99hSHSp4oWrS0namYNm6Go3NsuSaLTMdS2js2yg=;
 b=twqJFTeEEX4fxsGgAzm7a/HLzE0I9/p1j0AkZJ0+XJ9R/HG0n7mFvLKhHUqibuL/8H
 ezw6yPC3QwvpcLQ/sWgjTmupOELc7dmudyRWAu4fmb2Z2RYV173LfzVho+anGoV4Auw0
 yhIewnVZtC5tvcOX6Os49U93YvdEay3/wOpaE1EWP3c32+WYyY0rEstGr7c2LV/WQ9sW
 Evfe576gy/Cy8xW69CETs4Xz/I+ODVv7BabqcQ1jbTvXPlAWgtpBR0s/rPCY/hYqrY21
 pUKfJPZIuKAazx4/RWHq4O9/7jkHA6A2lCc1ekCDzD8+jKA4DCGIXxGqIx64M7uhepRV
 r9Pw==
X-Gm-Message-State: AOAM532557qhAnWC22FJoGCiZnyd92ZpUL8UjdGnG7FWlARkUNhYTmQ3
 xlsM5DmimG5DlNarOVgaf6Y=
X-Google-Smtp-Source: ABdhPJypIwr6XPQgemt6CJF4aVOuSE9P8rFDuFGhKBDr+zcFrzEKlnZEEU3wYydNz5mYaZJaYnAkvg==
X-Received: by 2002:a63:de18:: with SMTP id f24mr23694179pgg.415.1593053690835; 
 Wed, 24 Jun 2020 19:54:50 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.182.254.114])
 by smtp.gmail.com with ESMTPSA id y10sm18593000pgi.54.2020.06.24.19.54.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 19:54:50 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH 1/2] xen/privcmd: Corrected error handling path and mark pages
 dirty
Date: Thu, 25 Jun 2020 08:32:39 +0530
Message-Id: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
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

As discussed, pages need to be marked as dirty before unpinned it in
unlock_pages() which was oversight.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
Hi,

I'm compile tested this, but unable to run-time test, so any testing
help is much appriciated.

 drivers/xen/privcmd.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index a250d11..0da417c 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -580,43 +580,44 @@ static long privcmd_ioctl_mmap_batch(
 
 static int lock_pages(
 	struct privcmd_dm_op_buf kbufs[], unsigned int num,
-	struct page *pages[], unsigned int nr_pages)
+	struct page *pages[], unsigned int nr_pages, int *pinned)
 {
 	unsigned int i;
+	int errno = 0, page_count = 0;
 
 	for (i = 0; i < num; i++) {
 		unsigned int requested;
-		int pinned;
 
+		*pinned += page_count;
 		requested = DIV_ROUND_UP(
 			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
 			PAGE_SIZE);
 		if (requested > nr_pages)
 			return -ENOSPC;
 
-		pinned = get_user_pages_fast(
+		page_count = get_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
-		if (pinned < 0)
-			return pinned;
+		if (page_count < 0) {
+			errno = page_count;
+			return errno;
+		}
 
-		nr_pages -= pinned;
-		pages += pinned;
+		nr_pages -= page_count;
+		pages += page_count;
 	}
 
-	return 0;
+	return errno;
 }
 
 static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
 	unsigned int i;
 
-	if (!pages)
-		return;
-
 	for (i = 0; i < nr_pages; i++) {
-		if (pages[i])
-			put_page(pages[i]);
+		if (!PageDirty(page))
+			set_page_dirty_lock(page);
+		put_page(pages[i]);
 	}
 }
 
@@ -630,6 +631,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	struct xen_dm_op_buf *xbufs = NULL;
 	unsigned int i;
 	long rc;
+	int pinned = 0;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
 		return -EFAULT;
@@ -683,9 +685,11 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
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


