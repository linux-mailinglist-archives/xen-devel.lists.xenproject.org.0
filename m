Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3C20511A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 13:47:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnhOX-0002Oe-Tj; Tue, 23 Jun 2020 11:47:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqpJ=AE=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jnhOW-0002OM-48
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 11:47:16 +0000
X-Inumbo-ID: 487d17bc-b547-11ea-bb8b-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 487d17bc-b547-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 11:47:15 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e9so9744503pgo.9
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pDMz4GEEd1HrNqab3SFEgh4HTzshHqZlUT8h2DVo/0o=;
 b=O0f174T9zxECMIrMcBnJlVgKJZ6AF1eadIxgibscZl51LZvB8RJvrqMkRvOifJ1CI8
 /NW27eFVBws4khf4Q2qK+/MggUcJwyAOfD1inExGIsaCdqPgaVcQI/lpgDRKhxW6DZ4c
 vHpAdYOFKt4Tw7nffVPHnQteL/omtnCI9D+PU6xJ/l+qW4gpxQVfVzLKgBp51y/iJeLb
 BhsNyPZiZimDHSuuF9JYkugBfFBkWTtmpsgF/s45n0Xfpkd5lBZaZNND2x/AZ06mD0dl
 fYUJBBGM0VrP/I2mSStcI2uddjS2oYMSuuaGhwQ3LJS5m1Stcz2Fnc79koTI+ITuoj4q
 Wxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pDMz4GEEd1HrNqab3SFEgh4HTzshHqZlUT8h2DVo/0o=;
 b=cj7tJ4skwdXFygLBfTvfkTPsZhYKFBCcH/JwEDrco61WKzz4GBHYcbE2Zk7MQ6v8Pt
 5+PfwV6MftWI7qr71OPqzP56Ri9+29vfuI4eRNLhuL5f7naEypoADWY0xG7yBgizMINl
 7sbka+GcUwjdA/wnFN+3DDeoelY6+zgjObEPnkMZ1Kv7mCokV37ExOyFZzlAKCWyTGeK
 cq4kYuqIPJAxFrpPLeKbQ0rIMQQgB+1r+ljOH2OAKMR8gTYoNCuQXAneTfiZOaRxvoFj
 O6o6cVyefBRxmj8YMHzCEgPwxUPOOFzUICVDhq1V777IrCFPn0GHLglSLAXfcdqPj8u3
 OMYQ==
X-Gm-Message-State: AOAM5317kgP2REZN+LiRAwrU4nCbquT7xewX2UF8zSyBslX4i1HFQ8Yx
 eWS2vCzT1A0Upd3Hn7/tYAM=
X-Google-Smtp-Source: ABdhPJyoqH2qE0gyMJuzujXPkfwbJMIuJEyJhbRiulWkylIrNAE8lewKA/I7Fqiq7o7Uu7FIu8YohA==
X-Received: by 2002:a63:6643:: with SMTP id a64mr14118116pgc.246.1592912834633; 
 Tue, 23 Jun 2020 04:47:14 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.62.127])
 by smtp.gmail.com with ESMTPSA id w203sm6828258pfc.128.2020.06.23.04.47.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jun 2020 04:47:13 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org
Subject: [RFC PATCH v2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Tue, 23 Jun 2020 17:25:28 +0530
Message-Id: <1592913328-15486-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information. This is case 5 as per document [1].

As discussed, pages need to be marked as dirty before unpinned it.

Previously, if lock_pages() end up partially mapping pages, it used
to return -ERRNO due to which unlock_pages() have to go through
each pages[i] till *nr_pages* to validate them. This can be avoided
by passing correct number partially mapped pages & -ERRNO separately
while returning from lock_pages() due to error.
With this fix unlock_pages() doesn't need to validate pages[i] till
*nr_pages* for error scenario.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 drivers/xen/privcmd.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index a250d11..eea90cd 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -580,25 +580,30 @@ static long privcmd_ioctl_mmap_batch(
 
 static int lock_pages(
 	struct privcmd_dm_op_buf kbufs[], unsigned int num,
-	struct page *pages[], unsigned int nr_pages)
+	struct page *pages[], unsigned int nr_pages, int *errno)
 {
 	unsigned int i;
+	int pinned = 0, rc = 0;
 
 	for (i = 0; i < num; i++) {
 		unsigned int requested;
-		int pinned;
 
+		rc += pinned;
 		requested = DIV_ROUND_UP(
 			offset_in_page(kbufs[i].uptr) + kbufs[i].size,
 			PAGE_SIZE);
-		if (requested > nr_pages)
-			return -ENOSPC;
+		if (requested > nr_pages) {
+			*errno = -ENOSPC;
+			return rc;
+		}
 
-		pinned = get_user_pages_fast(
+		pinned = pin_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
-		if (pinned < 0)
-			return pinned;
+		if (pinned < 0) {
+			*errno = pinned;
+			return rc;
+		}
 
 		nr_pages -= pinned;
 		pages += pinned;
@@ -613,11 +618,7 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 
 	if (!pages)
 		return;
-
-	for (i = 0; i < nr_pages; i++) {
-		if (pages[i])
-			put_page(pages[i]);
-	}
+	unpin_user_pages_dirty_lock(pages, nr_pages, 1);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
@@ -630,6 +631,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	struct xen_dm_op_buf *xbufs = NULL;
 	unsigned int i;
 	long rc;
+	int errno = 0;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
 		return -EFAULT;
@@ -683,9 +685,12 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 		goto out;
 	}
 
-	rc = lock_pages(kbufs, kdata.num, pages, nr_pages);
-	if (rc)
+	rc = lock_pages(kbufs, kdata.num, pages, nr_pages, &errno);
+	if (errno < 0) {
+		nr_pages = rc;
+		rc = errno;
 		goto out;
+	}
 
 	for (i = 0; i < kdata.num; i++) {
 		set_xen_guest_handle(xbufs[i].h, kbufs[i].uptr);
-- 
1.9.1


