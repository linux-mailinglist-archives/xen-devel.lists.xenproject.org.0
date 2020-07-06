Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E9215E00
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 20:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVXO-0003Zp-4H; Mon, 06 Jul 2020 18:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8At=AR=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jsVXN-0003Zb-6o
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 18:08:17 +0000
X-Inumbo-ID: aa2eb68e-bfb3-11ea-b7bb-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa2eb68e-bfb3-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 18:08:16 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p3so18743013pgh.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ljWc7ncVT9pbFQys6lUrJ2oby+afUmM7eFZjxIhMARg=;
 b=jEACz1RudmH76IjHbdFlmoPGUPJKFxQCq2v9MrfJJA8KB3hgvmPKoJ6dh7OSUm81N/
 tl3W9rYACLLYLqhNvYdQec8GTl2ejOttzQ58EI02HItGcnKiiC5/2aB5g66OCIZC/E1u
 /mQOQRtDqM/vypg2TSJ4IrsIMarYUK8d/G66KFBDESnUPDZbWua4S7CX2i+MFnWN6+gm
 TAl9dt7TTOtSu6v1DhRGv8HYoLhUJhndqmVklEGZWSNyfwLROdQQHvcrbP7ORlKCEii6
 54YlItX98evWB9sVh7JTXi0t4Ki9jcwLstQgwmyBLwwyw2nX7hSrmTmI1pu9DpWmC1n2
 Kljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ljWc7ncVT9pbFQys6lUrJ2oby+afUmM7eFZjxIhMARg=;
 b=saViBWNFaphorBvdoiHFUe3Ac16LdrNg+0eCsKxgWYqjK77cfHe4UkD2Oz3hfnEagJ
 0IOF/B3vpeoLM+J8PbUXC97chCG4v39z1gswj6EGLxSBM6W2F5eLCJ2HozwYDa8vg/xe
 Ol8a1psvY+84/QINX/B4+tpS/ZC7u7q7b2G3XEelvL+tbk1cUukyyRG16Tw7uWxXas7P
 dP/1FchQw+0RJeFJEyWAXtAfng8g0ya+Y0aAIXqorYKfebaaZ+FIwhqfOr8aMpMym1lJ
 ZXiGQsspn5ixfoueKlPMbwurwYUOb3BUJIkmeSVQIF/ZplkgpT9HHkixnNi9AWGfJgV7
 QX/Q==
X-Gm-Message-State: AOAM532b+0docCwtZ3yfCmv92gfgShWV7bnxxib0gnIXomslAc2qxPf1
 c3QdlEyMbVzuGFvI9kcXSGI=
X-Google-Smtp-Source: ABdhPJxIo6PQngVuGXtLZOqfdIq2vAywCi8VVu0pPrqJTL0U3sjfe2jLu94RvE7iZvdk15XpRbmE0w==
X-Received: by 2002:a65:5682:: with SMTP id v2mr41106431pgs.231.1594058895951; 
 Mon, 06 Jul 2020 11:08:15 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.43.125])
 by smtp.gmail.com with ESMTPSA id 199sm20425544pgc.79.2020.07.06.11.08.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 11:08:15 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v2 3/3] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Mon,  6 Jul 2020 23:46:12 +0530
Message-Id: <1594059372-15563-4-git-send-email-jrdr.linux@gmail.com>
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

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information. This is case 5 as per document [1].

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
 drivers/xen/privcmd.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index f6c1543..5c5cd24 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -594,7 +594,7 @@ static int lock_pages(
 		if (requested > nr_pages)
 			return -ENOSPC;
 
-		page_count = get_user_pages_fast(
+		page_count = pin_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
 		if (page_count < 0)
@@ -610,13 +610,7 @@ static int lock_pages(
 
 static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
-	unsigned int i;
-
-	for (i = 0; i < nr_pages; i++) {
-		if (!PageDirty(pages[i]))
-			set_page_dirty_lock(pages[i]);
-		put_page(pages[i]);
-	}
+	unpin_user_pages_dirty_lock(pages, nr_pages, true);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
-- 
1.9.1


