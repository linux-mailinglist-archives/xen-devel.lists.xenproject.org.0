Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CF25ED10
	for <lists+xen-devel@lfdr.de>; Sun,  6 Sep 2020 08:53:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEoXi-0007z5-Jm; Sun, 06 Sep 2020 06:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EKjW=CP=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1kEoXh-0007yx-Oz
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 06:52:49 +0000
X-Inumbo-ID: b40d6706-da4f-4a1f-828e-e6b319c4c834
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b40d6706-da4f-4a1f-828e-e6b319c4c834;
 Sun, 06 Sep 2020 06:52:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 17so6897964pfw.9
 for <xen-devel@lists.xenproject.org>; Sat, 05 Sep 2020 23:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Db0fgXXbzH2p2U25JJ6scSTK1v1Ti17DDq8xS5lR3/w=;
 b=MszkEUa5ryYy30yaiYP8RoyZtu6DMbERcUxtpSd18pBj6WexOGEKKL7JkkCjeVUYa4
 CLPoxhkxomeYAPBFdTEqbgyEnE9h08KH9vh/2zYii0811dV9ABqMr9Y+OOGDR4GbOKWQ
 DTwpEZ4rNvQ47beCtgBw67QI3/z/j2BUult3VlMTBvtL7D8gc932t9nL1RVNBW0Q2Xql
 EOvSDVqH3rJH+AbCcVBG9XpMu4jVYzF9TmggKmsf6S17fC4F3G27oREvQ7LQPIXCtV4U
 8VXHh/QZPE+IAXJLXGU2l8GBimNhAKcGwVpsPC1+d9MH2dSd3obODmPQiNoIKRnUkMfy
 Fgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Db0fgXXbzH2p2U25JJ6scSTK1v1Ti17DDq8xS5lR3/w=;
 b=luH2F88ghxKHw0D0AseQsVMm5JSHQZK+K8nVh6wSStECHli75YrSvaJAgCG3AWJ5v7
 tTZ83LZhC37DXMcNc/CO2sqKAxgrLhkjGBDf9e6m9HcB642uMEJQ2aAaakMWQVQ2AkRO
 M5aL3rmTWG76lA+jyDj4v4VwrySVjaVGZunAa3dvuIpaOY542XY0l4/+Ko6Uz7ozwjiT
 sN2prLurT/p0wgxUJ75GTCxvncQ6PrhXeUYI3wQ+h/uU2yZWUyfbllTa4C/vIeeGr7lQ
 O2avvonH0BGdZevM2cAF9SBn9o38elCgBcwcA0Tf8mRgNXITrz+euufXlE/d5nUZQQP1
 reaQ==
X-Gm-Message-State: AOAM531eREUME2cK6Ekj2PbbArPNNgPKyhZ/HZc6KTXRQpS8T3JcW+RT
 j1xDsxaNSlNsuNIQzrvFOkLT2SRsraolSA==
X-Google-Smtp-Source: ABdhPJxQeP2UYdkYbiXq2FOVaFF2XXnDUgZOTqlJ7qMyx28A9j6QYQ0Cphyslfl3lZuG6wql4/ZCpQ==
X-Received: by 2002:aa7:941a:: with SMTP id x26mr11701444pfo.177.1599375168362; 
 Sat, 05 Sep 2020 23:52:48 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.54.54])
 by smtp.gmail.com with ESMTPSA id n128sm9199947pga.5.2020.09.05.23.52.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Sep 2020 23:52:47 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 david.vrabel@citrix.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 2/2] xen/gntdev.c: Convert get_user_pages*() to
 pin_user_pages*()
Date: Sun,  6 Sep 2020 12:21:54 +0530
Message-Id: <1599375114-32360-2-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
References: <1599375114-32360-1-git-send-email-jrdr.linux@gmail.com>
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

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information. This is case 5 as per document [1].

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: David Vrabel <david.vrabel@citrix.com>
---
 drivers/xen/gntdev.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 5e1411b..a36b712 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -731,7 +731,7 @@ static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
 	unsigned long xen_pfn;
 	int ret;
 
-	ret = get_user_pages_fast(addr, 1, batch->writeable ? FOLL_WRITE : 0, &page);
+	ret = pin_user_pages_fast(addr, 1, batch->writeable ? FOLL_WRITE : 0, &page);
 	if (ret < 0)
 		return ret;
 
@@ -745,13 +745,7 @@ static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
 
 static void gntdev_put_pages(struct gntdev_copy_batch *batch)
 {
-	unsigned int i;
-
-	for (i = 0; i < batch->nr_pages; i++) {
-		if(batch->writeable && !PageDirty(batch->pages[i]))
-			set_page_dirty_lock(batch->pages[i]);
-		put_page(batch->pages[i]);
-	}
+	unpin_user_pages_dirty_lock(batch->pages, batch->nr_pages, batch->writeable);
 	batch->nr_pages = 0;
 	batch->writeable = false;
 }
-- 
1.9.1


