Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30F43B682
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 18:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216513.376143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfOzH-0001rM-4h; Tue, 26 Oct 2021 16:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216513.376143; Tue, 26 Oct 2021 16:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfOzH-0001pA-0w; Tue, 26 Oct 2021 16:07:43 +0000
Received: by outflank-mailman (input) for mailman id 216513;
 Tue, 26 Oct 2021 16:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gydQ=PO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mfOzF-0001p4-Dy
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 16:07:41 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65c92945-8471-487b-8b58-668d415969e9;
 Tue, 26 Oct 2021 16:07:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h7so4688458ede.8
 for <xen-devel@lists.xenproject.org>; Tue, 26 Oct 2021 09:07:40 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id eu9sm4025195ejc.14.2021.10.26.09.05.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:05:20 -0700 (PDT)
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
X-Inumbo-ID: 65c92945-8471-487b-8b58-668d415969e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oU+EeY72Fqxo4fuN88dML4OJjiCHzSRBLySQqfRpU6s=;
        b=EpVIsA8GKPo7dk/fZDHOCL8DXg2THekLyD8GvJ1+QSmhCGoRek4kq37MFuWeTXiRpx
         D1fz2Uxu7u1Jr82GIuHHPi3DZMBcOyePePAP1ibi9T7jyzBIFJ1aWFoaWOjyoWvE0jd7
         PMjhtJHVqDl+TlWbjSAWulUT3+fJwS9xZv9WZ0rqS3cKIXcFZA7QruaP6OCF7XDYQR9R
         SSO1vUiz9NKtvxPAaoKztcSELSAGXAuBs/iVKXwNIhMhxGtT3XKEAN164OBgah0hXQ50
         /rSS/COR3zV9a674A1N+TuaMMHk3wqS4qAaGRq97YqtSrG5+U8FHO6UnHvtVHfna5Z1X
         RJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oU+EeY72Fqxo4fuN88dML4OJjiCHzSRBLySQqfRpU6s=;
        b=rAdBncCT7GBAr1vgXVAt5vpLjg79alkbzKZ3/wLiMgkzjXa4307D0Wo+1/kusoC5Ur
         fksvhqSnysqyf6NBzjzYFTwdDzTkXNLx0t2UzF3IUCCzuYJ1M+XjLHoLjrZ8hBwDTdb/
         8n4LMdez9/BV0mTmy9/P3VFd+gOqePo+D5yoAjLMVPIT4nfgkzAPEY4/xFbG4b0h2kmF
         ER/6y/7wGHmwv9kWWK0j3I6vue3ezaNNEoepeVff8qbnW9Cc4Egww6zsDdaJHTHA6uRY
         h4diBzSkY0jHTt5yxVlqOLWgon3KUKhovVrzy7yUgzrTBkyBwNNm+NqC/pA7bmoQEPs0
         yRsg==
X-Gm-Message-State: AOAM533cKSDhF4ENbZAozvstNTL2Q0HDlfhwfDPcg3CsXKosANIQL/Am
	yXhXjs73HqoDH4/8plUEJbfnp6BT8as=
X-Google-Smtp-Source: ABdhPJzrbtOvYqLsp3FLdTpT/Amo1B5J4A7Ys4+PXalhb9IOcwydKRsjZqHL2AH62jn9HrKJliqqFw==
X-Received: by 2002:a50:ee01:: with SMTP id g1mr22757719eds.79.1635264320421;
        Tue, 26 Oct 2021 09:05:20 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V2 1/4] xen/unpopulated-alloc: Drop check for virt_addr_valid() in fill_list()
Date: Tue, 26 Oct 2021 19:05:09 +0300
Message-Id: <1635264312-3796-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

If memremap_pages() succeeds the range is guaranteed to have proper page
table, there is no need for an additional virt_addr_valid() check.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V2:
   - new patch, instead of
     "[RFC PATCH 1/2] arm64: mm: Make virt_addr_valid to check for pfn_valid again"
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


