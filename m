Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A320513E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 13:50:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnhRC-0002gB-CJ; Tue, 23 Jun 2020 11:50:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqpJ=AE=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jnhRA-0002bp-Ux
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 11:50:00 +0000
X-Inumbo-ID: a9f5b1b6-b547-11ea-b7bb-bc764e2007e4
Received: from mail-pj1-x1041.google.com (unknown [2607:f8b0:4864:20::1041])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9f5b1b6-b547-11ea-b7bb-bc764e2007e4;
 Tue, 23 Jun 2020 11:49:59 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id d6so1446806pjs.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=70/IVEhJ02HvpdsdNd9PlWVOivEwQQMsYQTKyuJVw5w=;
 b=MppwvfZJn8ecf5EIZhuRbEQ8l3NLLdTBNC06snahwn8RnuLn37zTW3Xh1tgQBJu5Vt
 zZyxaozNnvbmbkJvjzRixuvhZtfr9BzypqeE7l/aJ6+mEpn+h5IJNmHFc6l0ee/FvwOI
 Bl7TfpCpdRUnxhNvJmSg5FqkwoCFnVEYKOMeoe4LE1sLzSHyQqXCwHUCpL38FDtoPAOh
 E0mzT9Toou2nx99Ka5OdaBLolD3f2E9ypbp04kqP1nUuCWYyUKkhv/38fkxmjhwbUb0b
 pvjqBWy8ekO5F4RnkOQutCDq2i7behQUQ7VGXx3Sx0N6fwI8lTypVzf2fMihGCmML3cx
 47wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=70/IVEhJ02HvpdsdNd9PlWVOivEwQQMsYQTKyuJVw5w=;
 b=J+OHUp7IyDZbKqYyd7/zV0K6b0Eb5ghxUys34xYxZ3Mw6rfaKQKxBDwzxr2OJrfVXO
 xH/5pg9tPV7fOTRuXc3p4I2p/a9/W4agGVdJ8K3dZFnIfu98EgjjVEesPKwFXlMHmsM+
 IBOQ/giSNSKL9bWoQWtFofB9ZdTUic9qD5wjmIXmTDA1Nu/9JExjG2hyRQB9HI+AHdi/
 dlLoS/czqykqI9XkCM0rmU1YBogmz23/iYEu8Ed2TH5S5W3JqRCF3IpxqZYhAgqsdyu3
 x2RBk4p2MqzbM4Lyw4AaffZgM3Yw4qrQaGnLmxVhWSi340EvjU9tiWCSWPuzRVUU78R+
 ajmg==
X-Gm-Message-State: AOAM530ZGceG59eUPVe2DZ90JQmHn8BxK7kDq/AGm/UOfZ+BTujuwwc7
 dQ4E2OBGFY/1MWiAeO+KjDA=
X-Google-Smtp-Source: ABdhPJyStVCImaOd+pzTqmM89EzcHfoa9xSYUzHKMG+nb3a6hRmdLRowoxq6o0VzoGGzLOSJsnRG7w==
X-Received: by 2002:a17:902:8b8a:: with SMTP id
 ay10mr10745807plb.235.1592912997980; 
 Tue, 23 Jun 2020 04:49:57 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.62.127])
 by smtp.gmail.com with ESMTPSA id cm13sm2290720pjb.5.2020.06.23.04.49.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jun 2020 04:49:57 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	sstabellini@kernel.org
Subject: [RFC PATCH v2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Tue, 23 Jun 2020 17:28:19 +0530
Message-Id: <1592913499-15558-1-git-send-email-jrdr.linux@gmail.com>
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
 drivers/xen/privcmd.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index a250d11..013d23b 100644
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
@@ -609,15 +614,10 @@ static int lock_pages(
 
 static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
-	unsigned int i;
-
 	if (!pages)
 		return;
 
-	for (i = 0; i < nr_pages; i++) {
-		if (pages[i])
-			put_page(pages[i]);
-	}
+	unpin_user_pages_dirty_lock(pages, nr_pages, 1);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
@@ -630,6 +630,7 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
 	struct xen_dm_op_buf *xbufs = NULL;
 	unsigned int i;
 	long rc;
+	int errno = 0;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
 		return -EFAULT;
@@ -683,9 +684,12 @@ static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
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


