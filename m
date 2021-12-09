Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE946F49B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243309.420887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfl-0004e6-9k; Thu, 09 Dec 2021 20:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243309.420887; Thu, 09 Dec 2021 20:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfl-0004aK-3p; Thu, 09 Dec 2021 20:05:45 +0000
Received: by outflank-mailman (input) for mailman id 243309;
 Thu, 09 Dec 2021 20:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvPfj-0004Xd-Kc
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:05:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 630f33d4-592b-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:05:42 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id k37so14217604lfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:05:42 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o12sm87371lft.134.2021.12.09.12.05.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Dec 2021 12:05:41 -0800 (PST)
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
X-Inumbo-ID: 630f33d4-592b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CS9aK8CojMqdb/AcA3jHRSI+mrWqH9RveIgOpizvY9U=;
        b=nJ6YIRKoVQppvpal4aj4p6po8BZEoe2W0v2EiJOt2lz9DD/MZQz4YOGAFga6byn+PS
         bpoNN7jJzU6n+1ymG3q5nkDMcZyj6qh8VLD5qe9Y82B5S10kXdLAgf8PzlZT01cHKuhA
         JXaYSWqP6JLSTiUSi3EyD3xZ+LiV/d/6rJhFyPL5A2n9Qlamzj6EkCbfiO7uXKvO0fDC
         dDKM/bTNoo7nV/iChOSyPjaEfVz8kw6VsAW++5dxIl2Ed/EHaOmZKJK0QgUPBpIFINJw
         0i+XdqKk7zJC+3HWynXOo7JID118X95q9twABJWbrjnKOuX9i34ZaQ8aTIjd0bmhB/4Y
         F9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CS9aK8CojMqdb/AcA3jHRSI+mrWqH9RveIgOpizvY9U=;
        b=umZOmpncV5DvbBxEb6oHOlz9kOa+EJ59snXEfx5Oy291ItQ2SyfpA4uv77TgZwEYSy
         oIEQMnMakZNaEpl8r62MUXf88K8gTGBHVWCO/OoT235i7fmmzqmJmPXNyrNSJsLAFwyJ
         UUXiT3D5qA9Lpevd7tg9YwG6yTpv1PXK8BIcfcrLTqEq/vAJmyE2lUp8IUFvQ3UyYP/x
         MSqx+3NQ9OowqNvEkRhE3kboMCLfYs3/gfETBU5qREEQ8VDikS3ohNv7AaSr9YfesIVF
         S+/eF1KCXHHbSc3fNVIZj1JPf/fw30/YMs+WupmVeOHOyeiVbUUagxejl1BBvtz99CAh
         YdhA==
X-Gm-Message-State: AOAM531GgODPNySFrr8+i1Qh1byPDdkoJ+9YYe+nAb/zIIXYplTOdTVv
	ohlsDRll3ak3kB0IxTBnh2C9f9oJS+7u4Q==
X-Google-Smtp-Source: ABdhPJxerwr28Tg8c06W+QUK8C5H1O0rKZUkku9U1Odi1NykdsC2f8brvhJBN6XBJ2EuJVFZAjwx2Q==
X-Received: by 2002:a05:6512:2312:: with SMTP id o18mr8160079lfu.333.1639080342265;
        Thu, 09 Dec 2021 12:05:42 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 1/6] xen/unpopulated-alloc: Drop check for virt_addr_valid() in fill_list()
Date: Thu,  9 Dec 2021 22:05:31 +0200
Message-Id: <1639080336-26573-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>

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

Changes V3 -> V4:
   - no changes
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


