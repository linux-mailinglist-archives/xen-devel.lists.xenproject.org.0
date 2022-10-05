Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16525F595A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 19:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416379.661043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og8VY-0003wk-K6; Wed, 05 Oct 2022 17:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416379.661043; Wed, 05 Oct 2022 17:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og8VY-0003ut-H6; Wed, 05 Oct 2022 17:48:36 +0000
Received: by outflank-mailman (input) for mailman id 416379;
 Wed, 05 Oct 2022 17:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTo3=2G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1og8VX-0003fH-6y
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 17:48:35 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed704e3-44d5-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 19:48:34 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id k2so7121038ejr.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Oct 2022 10:48:34 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 ee32-20020a056402292000b0044e7862ab3fsm4320697edb.7.2022.10.05.10.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 10:48:32 -0700 (PDT)
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
X-Inumbo-ID: eed704e3-44d5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUqPpYv5HbJS3RJZgdTtH5zBJM8cF/Q/yQo70/LIPGg=;
        b=q2NAXUerg5Qq4svf9ZBclqSa7jhIsyyWtisVfdHoR09jVE9TUdLqPM4efflTILBJ2E
         1QzruERT96PZYju0r7C2ZaHvg30mr5WuMueOXGd/ZwvoZmmuOUN13WUjo0E1wd+IbDqs
         BHtddK4HNWj9DlWucI/LF6hcSCBL5vdIlYwIr7rf7LHwpwKw1u0JzBn48GS4yFmoiv+C
         BXfd99AdwgNOMIo8PqFDtYXynE8wj8nj18ErlAFmAjYKe4avYXwKc2MTtpfsUUJ0Hr+d
         nyJcbqw+4Yt20d6Zxo8CDJDZfh2dhLrWeY1cgcrGP5JOqbkMqzLlOTlOQlgFouD46h6r
         MMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUqPpYv5HbJS3RJZgdTtH5zBJM8cF/Q/yQo70/LIPGg=;
        b=sNyYJOSRJzkOojEVEp8LqCP/WX03axbkZHiFGjvLuGQBm1DbOR7V9EQNCeybUnAGOT
         b+5OQRDOKjkxaXZ1f+Fy1LM8/Zxqb8fh7esFvTbFHgT/C18yjcQexk+nnFZEUSyavu86
         Wyb/Mi/tSIV0K5Kjf7Qa7aGFAivcn3QclcPhhe6OObJuKzYUUWPkEJTSXudpdRP9N14X
         29PuNYGC/blThAIDcDXCFJeB8VVU9iaMR+VlPMCsfy+I+Es/m36fl/Puadh8jKLfJUHm
         Mxw5ZGeDgx7KjdYrHTXHyszxUIDfOuYg8ubW6hPzbbUMANXbVqZ/JKVEI1kw5M63ja2C
         7vAg==
X-Gm-Message-State: ACrzQf1hjKoauVlUwcFmJRRIxVbkj7VbWOn1LoYMSXBWW35rg9+STCSu
	Ttic1Kf8dTGmESHOsHbCbQpN149dm7A=
X-Google-Smtp-Source: AMsMyM7qFxTtDClHub9HwGnUCHbj0K2B+uD3aLcbrl4tDcKrhmWQ/TdQGfyyThVB1O4Bfc/Y82Eqaw==
X-Received: by 2002:a17:906:4ac1:b0:780:3448:ff06 with SMTP id u1-20020a1709064ac100b007803448ff06mr587283ejt.403.1664992113581;
        Wed, 05 Oct 2022 10:48:33 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] xen/virtio: Fix n_pages calculation in xen_grant_dma_map(unmap)_page()
Date: Wed,  5 Oct 2022 20:48:22 +0300
Message-Id: <20221005174823.1800761-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005174823.1800761-1-olekstysh@gmail.com>
References: <20221005174823.1800761-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Take page offset into the account when calculating the number of pages
to be granted.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict memory access under Xen")
---
 drivers/xen/grant-dma-ops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 8973fc1e9ccc..1998d0e8ce82 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -153,7 +153,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(size);
+	unsigned int i, n_pages = PFN_UP(offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
@@ -185,7 +185,8 @@ static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				     unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(size);
+	unsigned long offset = dma_handle & (PAGE_SIZE - 1);
+	unsigned int i, n_pages = PFN_UP(offset + size);
 	grant_ref_t grant;
 
 	if (WARN_ON(dir == DMA_NONE))
-- 
2.25.1


