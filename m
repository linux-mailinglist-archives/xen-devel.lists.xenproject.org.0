Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06621C712
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2020 05:32:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juSiU-0001qw-09; Sun, 12 Jul 2020 03:31:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQ2C=AX=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1juSiS-0001ot-8w
 for xen-devel@lists.xenproject.org; Sun, 12 Jul 2020 03:31:48 +0000
X-Inumbo-ID: 373492d4-c3f0-11ea-bca7-bc764e2007e4
Received: from mail-pj1-x1041.google.com (unknown [2607:f8b0:4864:20::1041])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 373492d4-c3f0-11ea-bca7-bc764e2007e4;
 Sun, 12 Jul 2020 03:31:47 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id gc9so4521787pjb.2
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2020 20:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CSSDnsVzCbm4HJvWsVbXXkGEs9xedyGKl/Rt6nKFdOE=;
 b=dbumPayO/fDTRmwmbfWoGMopnkBa2rTRRdhdRZxImMg+IAEJ4iJ8xxqnf4pNPHIBg1
 Twl174xM19B2sWzwefd5I9eq27cj5l4WVLLgvH8RrIDAYsmA5AKM/GXypd5+wBM+d3m0
 b34IyrConj/4kSOSkZLRoYbZzX/ILotrFvuLHy95osDmsX2ON1+iwKFO8738TKSReZYJ
 2C7jOsaov4l/WQlCt1iLyoWVRE7qOPoZ20O3E9H/PPRrrQd7alB/0C/ybSJlCGcI7Ou3
 aoh4/zO9wrDfQLZg6SgO+lQTHtcB2q2Xm6GAxchCvbsre8RS+cGwptniFoffEJI5O9D6
 h6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CSSDnsVzCbm4HJvWsVbXXkGEs9xedyGKl/Rt6nKFdOE=;
 b=SXsGadSeoX1Z9tsDe5i/OO9+Y+xDSSjO8sFg4ma8QBW+qnNjdwYYjm/OcaB2QdNLDi
 LE0zVsn2kPCDGNZ7+Dp+b//lC2lV9APp6nZnpFqMwnbpEtUotOLAMcGoVig5ntjakHG5
 Zwh7Exl9bE6eWLyw009w1UjhJFZuzOP2KA0AZJQGnBYwT31fTJ4nhgYRbyxeg7Ixue9n
 VtzLP1BBR8UlnXZc/cZWrFmk7mQQRD56sAJmhuqRrE/abg4DuzFXesndL/9gEbpZqWL3
 6Kg8KFf69ymclqmIAtUKu8V5eWpMqd6xSyGVNF4xuH2UijBN5vkJcAf1t+jqF4LuYKmP
 f1dA==
X-Gm-Message-State: AOAM530sSl2F+04TDIrq8agun/xqwVDHPhsn9tccmbmJYAfVcNJ22KWu
 Q3cqcpGYLFaWyHrqzjUTuJs=
X-Google-Smtp-Source: ABdhPJxjvGahtoyXNSccUhl0AeaffkZO4kJLPbsRyYmRclGhUYpFdroi35MHWOJWvCcdaQoqJ6BZFw==
X-Received: by 2002:a17:902:904c:: with SMTP id
 w12mr22660155plz.147.1594524707025; 
 Sat, 11 Jul 2020 20:31:47 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.224.89])
 by smtp.gmail.com with ESMTPSA id s89sm9750271pjj.28.2020.07.11.20.31.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Jul 2020 20:31:46 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v3 3/3] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Sun, 12 Jul 2020 09:09:55 +0530
Message-Id: <1594525195-28345-4-git-send-email-jrdr.linux@gmail.com>
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

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information. This is case 5 as per document [1].

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
 drivers/xen/privcmd.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 079d35b..63abe6c 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -593,7 +593,7 @@ static int lock_pages(
 		if (requested > nr_pages)
 			return -ENOSPC;
 
-		page_count = get_user_pages_fast(
+		page_count = pin_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
 		if (page_count < 0)
@@ -609,13 +609,7 @@ static int lock_pages(
 
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


