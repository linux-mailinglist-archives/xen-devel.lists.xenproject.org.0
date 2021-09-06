Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D627D401C8C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179932.326388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEtM-0002US-GC; Mon, 06 Sep 2021 13:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179932.326388; Mon, 06 Sep 2021 13:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEtM-0002R7-CO; Mon, 06 Sep 2021 13:42:32 +0000
Received: by outflank-mailman (input) for mailman id 179932;
 Mon, 06 Sep 2021 13:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HKT=N4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mNEtL-0002Qv-PG
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:42:31 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f9f0901-a3f0-434a-a066-225fbfd0f79f;
 Mon, 06 Sep 2021 13:42:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x27so13602366lfu.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Sep 2021 06:42:30 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j20sm746556lfr.248.2021.09.06.06.42.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Sep 2021 06:42:29 -0700 (PDT)
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
X-Inumbo-ID: 6f9f0901-a3f0-434a-a066-225fbfd0f79f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=1Op4eoAO59qaq+mkjX+eiujVM6Ur2TNXFe7+MnMWPAo=;
        b=h4C3JZ0PaIs5BAjfC12yjm/XbJG+Sg9p+OZEUfx6eyBgaJw16VkFji68h8VfPdxIED
         P6NK7acmk/yKEkPtyzd8dOEYML8uVsibT46B4+PTyLzRROJ9UOz50n3CKRTwqI4BtZID
         jYMegg7iXrsRGKkDxwGNXMUZtijc3jxaTR4SDPtzc6IhfF4/RKhw1B+8L7VqCWlFd72a
         Nw1aOjXB8yydiaSexP00VHw/XHaEC/OsrgKO90QMBaaRZ+NBjerGSvjiOcjwgLYsnxKN
         41vUrRQsPxLno+ecJ+ts8wOK7MH7c+2sUWZ35uvbub1655t2VThcR2w8nj7iJLkWrbvY
         MJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1Op4eoAO59qaq+mkjX+eiujVM6Ur2TNXFe7+MnMWPAo=;
        b=dtplSFlS2iLmP9mfCONq2rU9nXDXoRV8en7BPQgB1K1/Zv+kyugvTEITYW2gK0aExV
         p3Q3f1e7EijKTDTVroOH+KieAtV+vXNK2z/fZDc4J7/1cbEgjxS1J5BukQN9XCpFGn5s
         QrdPFq5EyeUXtSiKmVjcf1h4OVXRma9z2KwdmlpslhduhExOoWu76OaRcITbzYx0Kr3J
         8zRxEJyKXxW6+jqMoeUqC5YGEcaaqarCiERgmvpgsewDBm6HGakr+kLUHgdM3nBhk2Mm
         Fm0+tWe0p6XlIIo0vZxhq1s2n8AlimIWcCdZoBk9Vwk+2t/D7NPnX87iHgiSFO4+jaTF
         B/vQ==
X-Gm-Message-State: AOAM531Un2z+GEK1RiKtHeqDwJTLdhla0rIIqSE+iXiZn0EpbsY3p1fN
	HZn+ZUL71tL95iuM/3f99MZfyVyHbBY=
X-Google-Smtp-Source: ABdhPJywLRGtr+1AwJ1jlC5wYfXjRpuRgZv/48wcKg6PKsZfGss8UwtlELHpiu/sosOoKvpQOWBbWQ==
X-Received: by 2002:ac2:5f78:: with SMTP id c24mr2880538lfc.554.1630935749687;
        Mon, 06 Sep 2021 06:42:29 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
Date: Mon,  6 Sep 2021 16:42:21 +0300
Message-Id: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Allocate anonymous domheap pages as there is no strict need to
account them to a particular domain.

Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
domU and dom0 can allocate" the dom0 cannot allocate memory outside
of the pre-allocated region. This means if we try to allocate
non-anonymous page to be accounted to dom0 we will get an
over-allocation issue when assigning that page to the domain.
The anonymous page, in turn, is not assigned to any domain.

CC: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/optee.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 3453615..83b4994 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -410,7 +410,7 @@ static struct shm_rpc *allocate_and_pin_shm_rpc(struct optee_domain *ctx,
     if ( !shm_rpc )
         return ERR_PTR(-ENOMEM);
 
-    shm_rpc->xen_arg_pg = alloc_domheap_page(current->domain, 0);
+    shm_rpc->xen_arg_pg = alloc_domheap_page(NULL, 0);
     if ( !shm_rpc->xen_arg_pg )
     {
         xfree(shm_rpc);
@@ -774,7 +774,7 @@ static int translate_noncontig(struct optee_domain *ctx,
      * - There is a plan to implement preemption in the code below, which
      *   will allow use to increase default MAX_SHM_BUFFER_PG value.
      */
-    xen_pgs = alloc_domheap_pages(current->domain, order, 0);
+    xen_pgs = alloc_domheap_pages(NULL, order, 0);
     if ( !xen_pgs )
         return -ENOMEM;
 
@@ -938,7 +938,7 @@ static bool copy_std_request(struct cpu_user_regs *regs,
 
     BUILD_BUG_ON(OPTEE_MSG_NONCONTIG_PAGE_SIZE > PAGE_SIZE);
 
-    call->xen_arg_pg = alloc_domheap_page(current->domain, 0);
+    call->xen_arg_pg = alloc_domheap_page(NULL, 0);
     if ( !call->xen_arg_pg )
     {
         set_user_reg(regs, 0, OPTEE_SMC_RETURN_ENOMEM);
-- 
2.7.4


