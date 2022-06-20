Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1755218B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 17:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352830.579720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3JeE-00007J-Ac; Mon, 20 Jun 2022 15:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352830.579720; Mon, 20 Jun 2022 15:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3JeE-0008Tg-4l; Mon, 20 Jun 2022 15:49:06 +0000
Received: by outflank-mailman (input) for mailman id 352830;
 Mon, 20 Jun 2022 15:49:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWFk=W3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o3JeC-0008Ae-R8
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 15:49:04 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82c9eb2a-f0b0-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 17:49:04 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id g12so6313339ljk.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jun 2022 08:49:04 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a2e9349000000b0024f3d1dae94sm1690149ljh.28.2022.06.20.08.49.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jun 2022 08:49:02 -0700 (PDT)
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
X-Inumbo-ID: 82c9eb2a-f0b0-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rlaK5EBLGtLc0krm/NL8VjdXnXIvfVQErc2uihOdLNA=;
        b=apvgpzqNUstKOMcGs47PvJ/CJGiFo3SYPo3oiXc1rEQh2ny24O/ZaJoNVHjnfHcBhL
         sE1/1NG3Vs/kIMo8gj3Dk2c1z7sWI1F6EdHVU5RcPgXfz+Rrfks6uLTuEu55gw1yM27b
         nh85POmnWW1OCbeaOgCJ1XfYEXGuLwKCpDlvM5NdDcpG18XiV34MmfpYzn/qxxS3SZdR
         3w/I/cMlbXoVrCAObEEAHpvGvc4hR6QkugR/gTlGww4Geap1+ZxIUXXzj/4cE8cyHnkL
         cIeYuaL8KGwLApG0jMafBYFesH5ABExrJ9c2WvNvoIXzvQwm7mV8bNGgDjR8bq5WUCJ8
         Dg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rlaK5EBLGtLc0krm/NL8VjdXnXIvfVQErc2uihOdLNA=;
        b=xflh4LTJLPEwjJcZ8D3zEeDdQPooGO+x6lHibr488MlmJsDtfwig8ApwICJcX4Rg15
         Slq40XFfYfnXBXksxGb3GNx9xs3fPWPQ1iHM4Yd++s65XvJCr0F0zuM/uo6Lf44RZdez
         0PwjNIUpgi77e+3QZmn+MNhrqpANa28q+1TZshlZUZ4eG32Q8Bmmh3usPI8lFj8XFMTs
         KrzD+7j4wlmymIq/EBiPs3aUmY9XS4Z67ZmEEmkOa+JapmludLIP4uM4tXJBMLTKazB6
         rYiibfi1EUPckwF5aU3xSR+rWQ3hyMMKTeZbQREqDgedmMgtY5R8Zv8PT7Ye8LlZiut5
         I21A==
X-Gm-Message-State: AJIora8V2EGrqiB8Z3IkjtvysyWoLS6ta8GETeVWi3cx0NL2xpmtwJUG
	f74Ec97oSnjbBTKKV9CIGohUd/lHQ5U=
X-Google-Smtp-Source: AGRyM1t8jZIIoIQOefBZwbkKIP31jN1TS68e69Tx5q0PTW0PQDRQ78ifLWRGU9zxegOfnvyNtEbWjQ==
X-Received: by 2002:a05:651c:8f:b0:255:8e6e:1980 with SMTP id 15-20020a05651c008f00b002558e6e1980mr11944050ljq.462.1655740143445;
        Mon, 20 Jun 2022 08:49:03 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V1 2/2] xen/grant-table: Use unpopulated contiguous pages instead of real RAM ones
Date: Mon, 20 Jun 2022 18:48:56 +0300
Message-Id: <1655740136-3974-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655740136-3974-1-git-send-email-olekstysh@gmail.com>
References: <1655740136-3974-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Depends on CONFIG_XEN_UNPOPULATED_ALLOC. If enabled then unpopulated
contiguous pages will be allocated for grant mapping into instead of
ballooning out real RAM pages.

Also fallback to allocate DMAable pages (balloon out real RAM pages)
if we failed to allocate unpopulated contiguous pages. Use recently
introduced is_xen_unpopulated_page() in gnttab_dma_free_pages() to know
what API to use for freeing pages.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Please note, I haven't re-checked yet the use-case where the xen-swiotlb
is involved (proposed by Stefano):
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2206031348230.2783803@ubuntu-linux-20-04-desktop/
I will re-check that for next version and add corresponding comment
in the code.

Changes RFC -> V1:
   - update commit subject/description
   - rework to avoid introducing alternative implementation
     of gnttab_dma_alloc(free)_pages(), use IS_ENABLED()
   - implement a fallback to real RAM pages if we failed to allocate
     unpopulated contiguous pages (resolve initial TODO)
   - update according to the API renaming (s/dma/contiguous)
---
 drivers/xen/grant-table.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 738029d..15e426b 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1047,6 +1047,23 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 	size_t size;
 	int i, ret;
 
+	if (IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC)) {
+		ret = xen_alloc_unpopulated_contiguous_pages(args->dev, args->nr_pages,
+				args->pages);
+		if (ret < 0)
+			goto fallback;
+
+		ret = gnttab_pages_set_private(args->nr_pages, args->pages);
+		if (ret < 0)
+			goto fail;
+
+		args->vaddr = page_to_virt(args->pages[0]);
+		args->dev_bus_addr = page_to_phys(args->pages[0]);
+
+		return ret;
+	}
+
+fallback:
 	size = args->nr_pages << PAGE_SHIFT;
 	if (args->coherent)
 		args->vaddr = dma_alloc_coherent(args->dev, size,
@@ -1103,6 +1120,13 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 
 	gnttab_pages_clear_private(args->nr_pages, args->pages);
 
+	if (IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC) &&
+			is_xen_unpopulated_page(args->pages[0])) {
+		xen_free_unpopulated_contiguous_pages(args->dev, args->nr_pages,
+				args->pages);
+		return 0;
+	}
+
 	for (i = 0; i < args->nr_pages; i++)
 		args->frames[i] = page_to_xen_pfn(args->pages[i]);
 
-- 
2.7.4


