Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE75F85C2
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 17:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418539.663377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBTI-0007QU-A9; Sat, 08 Oct 2022 15:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418539.663377; Sat, 08 Oct 2022 15:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBTI-0007NU-68; Sat, 08 Oct 2022 15:10:36 +0000
Received: by outflank-mailman (input) for mailman id 418539;
 Sat, 08 Oct 2022 15:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eQj=2J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ohBTG-0007Gm-Pb
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 15:10:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b10c4a0-471b-11ed-9377-c1cf23e5d27e;
 Sat, 08 Oct 2022 17:10:33 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id k2so16891942ejr.2
 for <xen-devel@lists.xenproject.org>; Sat, 08 Oct 2022 08:10:33 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a50d6d9000000b0045723aa48ccsm3523119edj.93.2022.10.08.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 08:10:32 -0700 (PDT)
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
X-Inumbo-ID: 5b10c4a0-471b-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20FlK2f2Ao6in3DL/pE8fjcn0IFPQLl6lYsp91zsW/g=;
        b=ROTHMsmP/hzHS74G5W9dubaxDxyjkONMkP12fjLSs7nXD77oMmyr0l2NmnTjHv1Hwy
         zks7PaJdMSnEWoAwqOi4UUoC/kVKHQBEn96iD61c9+n+1FyW4sj89a410hBePPTvINK8
         UuWofOk3ZZLRM2tvGpQmPVrNfKp7G6/wRNk4HT9KH4xo0vtnzi+/rXdpzu+0xabMtWhO
         hEx800aqTYrse+VY0x4iY7CgkcjXyxeaVDfNM2f184zWPNkzqCHSrll/+0v7GeQThF7D
         SXMJJswpnKdExgww62wuwncf+ygGRYHuTAZ3Ac37jBQBsTaDaL7waMhuE2VrE+7Fah4G
         P/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20FlK2f2Ao6in3DL/pE8fjcn0IFPQLl6lYsp91zsW/g=;
        b=4ed9YuPVAcEQy1STFwnmcnX5T78Oefi+Yc5UisjZ1T9+Fbhnt7m2KjvpyaL/fDHOcR
         67IZGKovM64QE2VFEMzcQH+ascqWT28qdHrOIIdv1amNjxcc1DYrIsBIw49qpXOqYEF/
         9PJD0UeCmN84Wr+GE3bgTDYLW69YXvxrHV3ZX0uQvkNJ4koHYywu4tPSqhV17Tgl6GAl
         hKz3gaJ7Cf2XM5r87c8QR62iWiLskG640TqKz5lzBwFJPqN9JvHZ7enhu9IRSD2qAPvo
         Y6JhAdQBSL1iV2wrfuCZGfGH8MZfx5XwiPp+tHy6mZXm+0Ov86PUOY4/2EbmyXucBoYl
         U2eQ==
X-Gm-Message-State: ACrzQf365iqegQsk+kcAstCCy3jVy7EXPPsy1mXGuN/v1svFs9JZxU4p
	fAZuk3eyymZJnsuJU6ClhEFpL7TnXwg=
X-Google-Smtp-Source: AMsMyM5XtGDmusETEHuN4wJntwNBpo8Mn3TJU8DM8u6nC3r7GTulKyyiTrXMGTKfS0fnjt2h4eGUBQ==
X-Received: by 2002:a17:906:974f:b0:780:4a3c:d179 with SMTP id o15-20020a170906974f00b007804a3cd179mr8378820ejy.289.1665241832708;
        Sat, 08 Oct 2022 08:10:32 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V2 1/2] xen/virtio: Handle cases when page offset > PAGE_SIZE properly
Date: Sat,  8 Oct 2022 18:10:12 +0300
Message-Id: <20221008151013.2537826-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221008151013.2537826-1-olekstysh@gmail.com>
References: <20221008151013.2537826-1-olekstysh@gmail.com>
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

Changes V1 -> V2:
   - s/gfn_offset/pfn_offset
   - clarify gfn calculation when granting a page

Previous discussion is at:
https://lore.kernel.org/lkml/20221007132736.2275574-1-olekstysh@gmail.com/
---
 drivers/xen/grant-dma-ops.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index c66f56d24013..1d018e3a68a0 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -168,7 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
-	unsigned int i, n_pages = PFN_UP(offset + size);
+	unsigned long dma_offset = offset_in_page(offset),
+			pfn_offset = PFN_DOWN(offset);
+	unsigned int i, n_pages = PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
@@ -187,10 +189,11 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 
 	for (i = 0; i < n_pages; i++) {
 		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
-				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
+				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
+				dir == DMA_TO_DEVICE);
 	}
 
-	dma_handle = grant_to_dma(grant) + offset;
+	dma_handle = grant_to_dma(grant) + dma_offset;
 
 	return dma_handle;
 }
-- 
2.25.1


