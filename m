Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CE5F78F3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 15:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418004.662760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognOO-00017m-M2; Fri, 07 Oct 2022 13:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418004.662760; Fri, 07 Oct 2022 13:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognOO-00014J-J2; Fri, 07 Oct 2022 13:27:56 +0000
Received: by outflank-mailman (input) for mailman id 418004;
 Fri, 07 Oct 2022 13:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sO4L=2I=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ognON-00014D-Kn
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 13:27:55 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79eaec4-4643-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 15:27:51 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id a13so7084047edj.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 06:27:54 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 cn22-20020a0564020cb600b00459012e5145sm1438183edb.70.2022.10.07.06.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:27:53 -0700 (PDT)
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
X-Inumbo-ID: d79eaec4-4643-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PORH37wl02w5zim2PpJcX5b14ycsNmFAFsoV/wDCQVg=;
        b=U8zIpLC9vkt1BxrKzxjy6Cz9Wfr50dEgERMUW7D3MmIk3M/GAnxJb0zX6CzjP1tWVm
         sh2qvWo/lWg/5UYdKf3IW9vu+3q5HyCpHAJzHMF8Y0so/+inIAUn7rHPiwOY2tNxDGMc
         mPARgY289vvOo0g1re36cTnA5sXHjurm0HQcJlEystO7CBW4Lxfsma8/vmjCJXAEOznS
         2PBgX3kVoYBFo3rSe+mtq97swC9VN3P/7LeLbEWtjI7/PiuDN3mH5G/rknAXEZ4TgNbv
         mn9+Q9n74kZdOKaBq0wbOoY8trlau9Wr0kwO0811xNWR9RCaIbQkALXA88J1xoukgH5O
         yb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PORH37wl02w5zim2PpJcX5b14ycsNmFAFsoV/wDCQVg=;
        b=bmvwRSVfzVnIE+WPNv3WydoYJjIlA6OQS/sSBtXH9mYVRuA70vRtWgCUCfMjUO0yVP
         ZhHpZtGMtpyoy27otob4hOGMMVTVEEgbuA6XS32233yuZ2uYg2K9bwUtne+9AE8KgcN6
         T58ALvLaKW2vK2uP3WCWkAM2gyrG8lWlXmQv8K1ApJMMIHAiYA18S/WsTIO3mFjVwUG2
         1OAf2pBuFGCaOLyguiAOpS/diaNlT4D4tfYaVDtvv8koKTolAdTnH+T6IqiTQdATKCQe
         VFkIRVed4jEIjyxZvIsB7uPTWLql8+QcxgDuaPDYWmKpQkzZdY6DBEW8HXB2qmsv+6r/
         WvSg==
X-Gm-Message-State: ACrzQf3bqJBZTTcPKqihrzvpUkStyVHbulbLJC0BbVg/fn8o2mqjxRNs
	KeANbzyYbPYeY0yjKEogH8UUcYC5ebY=
X-Google-Smtp-Source: AMsMyM6dRcRpow+v9ntj3SdSgn+856xu57eMalm4LP36SOxY1H2aCoZRDpopoA4CB96QCMhTyUgivg==
X-Received: by 2002:a05:6402:2489:b0:454:11de:7698 with SMTP id q9-20020a056402248900b0045411de7698mr4712240eda.214.1665149273742;
        Fri, 07 Oct 2022 06:27:53 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH] xen/virtio: Handle cases when page offset > PAGE_SIZE properly
Date: Fri,  7 Oct 2022 16:27:36 +0300
Message-Id: <20221007132736.2275574-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Passed to xen_grant_dma_map_page() offset in the page
can be > PAGE_SIZE even if the guest uses the same page granularity
as Xen (4KB).

Before current patch, if such case happened we ended up providing
grants for the whole region in xen_grant_dma_map_page() which
was really unnecessary. The more, we ended up not releasing all
grants which represented that region in xen_grant_dma_unmap_page().

Current patch updates the code to be able to deal with such cases.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>

Depens on:
https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/

Should go in only after that series.
---
 drivers/xen/grant-dma-ops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index c66f56d24013..1385f0e686fe 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -168,7 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(offset + size);
+	unsigned long dma_offset = offset_in_page(offset),
+			gfn_offset = PFN_DOWN(offset);
+	unsigned int i, n_pages = PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
@@ -187,10 +189,10 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 
 	for (i = 0; i < n_pages; i++) {
 		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
-				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
+				xen_page_to_gfn(page) + i + gfn_offset, dir == DMA_TO_DEVICE);
 	}
 
-	dma_handle = grant_to_dma(grant) + offset;
+	dma_handle = grant_to_dma(grant) + dma_offset;
 
 	return dma_handle;
 }
-- 
2.25.1


