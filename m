Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D494925ED0F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Sep 2020 08:53:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEoXZ-0007yD-AE; Sun, 06 Sep 2020 06:52:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EKjW=CP=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1kEoXX-0007y8-C6
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 06:52:39 +0000
X-Inumbo-ID: c65c9d88-36ae-46b0-8ef0-133eb3865884
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c65c9d88-36ae-46b0-8ef0-133eb3865884;
 Sun, 06 Sep 2020 06:52:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id o20so6897685pfp.11
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2020 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=I8rUO5c4QrQRi9NNPvOCt3d+iZWUjwi1tunN9Rub0tk=;
 b=bBMF2qL2q68MmK+glJEpZUPZMT5jo4AkJIZPACEdTgHHQYds5lYa0HzW4ZqHxulhek
 kg1UBfq/mFaLo4mOn+pW+Vr2Ub09QHqW8e0PkGGW7AXh2TpyTa73nKEBjxSt3a74KlNC
 1C7BDNXH0LpF0QsHSLlfC3icvJnycMKJdKAerK94DBpDlsG0OV/dMQgJRn/DoCBQYdkp
 KrL3X4uQ8sCo0qSULOuCxy86q9BFzrAgFX3dvOLE74SF2yab+XAfBFLVnQ6SRnF8YZBm
 5tUaZAPBx/Mz/D38G/C1aYXVHplqBczDkQnixhFqxwN2Ff/FOOGJSbaD7CVvyjbKRph2
 x8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I8rUO5c4QrQRi9NNPvOCt3d+iZWUjwi1tunN9Rub0tk=;
 b=qUFnGgBfQGYVbQC1Y7s6NmOEIXKCVAff4zwwcKE3niw8dY6HoAV7qoEeAnOvPKAjaa
 UQZQtDWEdCESPvyHyLe+KlbKO/RlY792ENcC0DymBJRX5pyidKS0Quur7i0p2SnKy8C/
 0NbyW+yXglUw6Tfgd0Bp00yrupjBo58Wr32GlcqnGDyC5wY+/LZohe+0SjkvxMuxAJKx
 QLImj44aVzPaCM4EW1eCIQHp3peeAPA4ecIMrjuR94HpsQRk9ls+PLPdMKJEYKVKAt3L
 WfuROZtWgqOH2s7/Rlk3DMTCBjXq/HPY5SRF8w7s24kJ7urhVJnqUVsj8/+rOEsH5HDB
 67ng==
X-Gm-Message-State: AOAM5301ql70bw20/Xxmjox+yA8cBGQ1cSdx1h+NvwVF4ULcljZ5CiIS
 z6pa9K3ISXyvRr/XwtSM7cA=
X-Google-Smtp-Source: ABdhPJwEUgCBR4QoLI3A2rl1Ro4L22TGg8358epQwwM3mEnmQWCqsaTjXqpy9QwbeAFz1ke6Dlv9ug==
X-Received: by 2002:aa7:83cf:: with SMTP id j15mr15147634pfn.251.1599375157754; 
 Sat, 05 Sep 2020 23:52:37 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.54.54])
 by smtp.gmail.com with ESMTPSA id n128sm9199947pga.5.2020.09.05.23.52.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Sep 2020 23:52:36 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 david.vrabel@citrix.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 1/2] xen/gntdev.c: Mark pages as dirty
Date: Sun,  6 Sep 2020 12:21:53 +0530
Message-Id: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There seems to be a bug in the original code when gntdev_get_page()
is called with writeable=true then the page needs to be marked dirty
before being put.

To address this, a bool writeable is added in gnt_dev_copy_batch, set
it in gntdev_grant_copy_seg() (and drop `writeable` argument to
gntdev_get_page()) and then, based on batch->writeable, use
set_page_dirty_lock().

Fixes: a4cdb556cae0 (xen/gntdev: add ioctl for grant copy)
Suggested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: David Vrabel <david.vrabel@citrix.com>
---
 drivers/xen/gntdev.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 64a9025a..5e1411b 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -720,17 +720,18 @@ struct gntdev_copy_batch {
 	s16 __user *status[GNTDEV_COPY_BATCH];
 	unsigned int nr_ops;
 	unsigned int nr_pages;
+	bool writeable;
 };
 
 static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
-			   bool writeable, unsigned long *gfn)
+				unsigned long *gfn)
 {
 	unsigned long addr = (unsigned long)virt;
 	struct page *page;
 	unsigned long xen_pfn;
 	int ret;
 
-	ret = get_user_pages_fast(addr, 1, writeable ? FOLL_WRITE : 0, &page);
+	ret = get_user_pages_fast(addr, 1, batch->writeable ? FOLL_WRITE : 0, &page);
 	if (ret < 0)
 		return ret;
 
@@ -746,9 +747,13 @@ static void gntdev_put_pages(struct gntdev_copy_batch *batch)
 {
 	unsigned int i;
 
-	for (i = 0; i < batch->nr_pages; i++)
+	for (i = 0; i < batch->nr_pages; i++) {
+		if (batch->writeable && !PageDirty(batch->pages[i]))
+			set_page_dirty_lock(batch->pages[i]);
 		put_page(batch->pages[i]);
+	}
 	batch->nr_pages = 0;
+	batch->writeable = false;
 }
 
 static int gntdev_copy(struct gntdev_copy_batch *batch)
@@ -837,8 +842,9 @@ static int gntdev_grant_copy_seg(struct gntdev_copy_batch *batch,
 			virt = seg->source.virt + copied;
 			off = (unsigned long)virt & ~XEN_PAGE_MASK;
 			len = min(len, (size_t)XEN_PAGE_SIZE - off);
+			batch->writeable = false;
 
-			ret = gntdev_get_page(batch, virt, false, &gfn);
+			ret = gntdev_get_page(batch, virt, &gfn);
 			if (ret < 0)
 				return ret;
 
@@ -856,8 +862,9 @@ static int gntdev_grant_copy_seg(struct gntdev_copy_batch *batch,
 			virt = seg->dest.virt + copied;
 			off = (unsigned long)virt & ~XEN_PAGE_MASK;
 			len = min(len, (size_t)XEN_PAGE_SIZE - off);
+			batch->writeable = true;
 
-			ret = gntdev_get_page(batch, virt, true, &gfn);
+			ret = gntdev_get_page(batch, virt, &gfn);
 			if (ret < 0)
 				return ret;
 
-- 
1.9.1


