Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763145CE7C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 21:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230547.398555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHD-0006an-Ee; Wed, 24 Nov 2021 20:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230547.398555; Wed, 24 Nov 2021 20:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzHD-0006Yy-76; Wed, 24 Nov 2021 20:53:59 +0000
Received: by outflank-mailman (input) for mailman id 230547;
 Wed, 24 Nov 2021 20:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpzHB-0006Ij-Cr
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 20:53:57 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a324125d-4d68-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 21:53:55 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id c32so10584617lfv.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 12:53:55 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j11sm97608ljc.9.2021.11.24.12.53.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Nov 2021 12:53:54 -0800 (PST)
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
X-Inumbo-ID: a324125d-4d68-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2+gPEFaRRl8eqNS/Y7LbhXO/rInityndJKkrLyh8HGc=;
        b=IwvGIOlmD0oLisHuoxC0LwTIm8NUw9yKPbrPmZLK8GGePIHRwcp+OPgQg9/dFz2RM+
         hiUSYru4os/gS4+2xDQ891EiT8Es/5YWqw9BDywwm1RY5ncIMObRrKeQgjYVgm8B6mkI
         UveLsDorJ+JQODSdlevg+ZACcmr+4Hinld08AA5HcR8ehyfrQ1nMgCkaYC5qAhWQSESz
         3y9fkpnDMP0RELGxwKQ9ofXdvltdwEWn94VpY5+xp5Y4y0Fk5nCw4RjtsfYxeAgV94kC
         dkhG+TFfzQBAPGrBfx14mFdmFl4LmT6G97wesoZyIx3ogxjn4o/PvrkXx/cU5UZSOZr6
         qyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2+gPEFaRRl8eqNS/Y7LbhXO/rInityndJKkrLyh8HGc=;
        b=m2O+7BByOZcpzVllj0Xqd7GxOEhcbtcCOdAdHr9Z3uAX2gqdYu6lvTHFVK+O4nzA66
         JsXKLBkN4u75wuj8SC0mRZQnzguTesp/v0iw7MDz6+xITA6xda6mnoSvJLkEo/3QxCDs
         pipLw3nKDeI0XlmwMs+iyXe/jSEc9hY1ZDlvARnUkXn/bBS2aq9kzZ/PuRYMhDyQXGr4
         Gu9HflN02dhPRScTD39KEjzTc+edf942OmcTVvK6RLhjnDhIRQsZOqvu4KzELOb/zv7X
         s5QWkH9W7+8fZKd3bgYUazd/yPLsCl644s+Zh2ilBeAiR0Uu5ykM6kLfJbZQGPKoRO1Y
         kdjA==
X-Gm-Message-State: AOAM5316ULt+dmQjtIIvbljjttldCAGWF/TFPavQuuzEUO2YylrFv++a
	W3mQlvmAS++iYXqtuPicWUg2BIlt24VMgQ==
X-Google-Smtp-Source: ABdhPJzgTBl/5RrVAWHSyUlG+h2B5h/aX5PT6dG7/gd2BKTy6uPSUT4F9O8nlmLnMgGhSJ12GFeJ4g==
X-Received: by 2002:a05:6512:22d2:: with SMTP id g18mr17528659lfu.244.1637787234615;
        Wed, 24 Nov 2021 12:53:54 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V3 1/6] xen/unpopulated-alloc: Drop check for virt_addr_valid() in fill_list()
Date: Wed, 24 Nov 2021 22:53:38 +0200
Message-Id: <1637787223-21129-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

If memremap_pages() succeeds the range is guaranteed to have proper page
table, there is no need for an additional virt_addr_valid() check.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Changes RFC -> V2:
   - new patch, instead of
     "[RFC PATCH 1/2] arm64: mm: Make virt_addr_valid to check for pfn_valid again"

Changes V2 -> V3:
   - add Boris' R-b
---
 drivers/xen/unpopulated-alloc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index 87e6b7d..a03dc5b 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -85,7 +85,6 @@ static int fill_list(unsigned int nr_pages)
 	for (i = 0; i < alloc_pages; i++) {
 		struct page *pg = virt_to_page(vaddr + PAGE_SIZE * i);
 
-		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
 		pg->zone_device_data = page_list;
 		page_list = pg;
 		list_count++;
-- 
2.7.4


