Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563B852A9E5
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 20:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331383.554901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Yh-0004qc-Tm; Tue, 17 May 2022 18:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331383.554901; Tue, 17 May 2022 18:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Yh-0004kR-QF; Tue, 17 May 2022 18:04:35 +0000
Received: by outflank-mailman (input) for mailman id 331383;
 Tue, 17 May 2022 18:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpkB=VZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nr1Yg-0004Vy-FR
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 18:04:34 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdef61e8-d60b-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 20:04:33 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1895125wma.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 May 2022 11:04:33 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfc6c3000000b0020c5253d8dasm12978625wrh.38.2022.05.17.11.04.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 May 2022 11:04:31 -0700 (PDT)
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
X-Inumbo-ID: cdef61e8-d60b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xUxnvY0wWYvQFwVkkKnZ0hYzB77/1hWqL1wilzE489c=;
        b=kb8ddVNGcr5cVeafnyHPeYNXQERd/qF31HFkfUdq2R0uWdYsIrV5qJc5rqOLz8AJ2R
         LeqlzPakVREbISyj+rzFqGHtWdSCexiQvfb3BzQZY4Gb6WIGH1gnWvSpBsaSAoOAgJPw
         Y2gQVbghkdgpguWD5R6ZUeT1mykXPwp1lsXvUamDbQaFqmfp7ZJs19gwZMPPJzKo2yI5
         qsxQdCIXfE44XW+Ui9ZV8j0XprUOYnEv+bHcF2+ibhH3I9NCtjxHxMwKRYDXdrArzigQ
         AkB6D1SgJLfFBjy+aEuoy/qrUgNvZwQus2tAbvnVgDGakrkC9Xvt3cWzsnYci380bHt5
         MjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xUxnvY0wWYvQFwVkkKnZ0hYzB77/1hWqL1wilzE489c=;
        b=babiyVOFuR1fChbdaLJ8r5mJB91tqUFB4syB6bKZ6SV1whYpKNMCWpwvPa83PWsLJR
         79J4xD+xceunW/JkYDA4JEG08VvZHKpUQBLRleDYFsJgrbmrLjFK7MSHPsNiM+j+yhge
         3n6//6kYpqm0nE2fy+x47dRviFrH+Wj4uZJVzWp3wTQwioZVx2HxPpI81dJj2kD1ZroE
         hXDZLew0T2vxnG6ocebFhfOrCgc+w12PwrdmlVzCYhtT2GbilnCBVrfC/TX6QTLG3zBZ
         7ALIO4/84l8BcOfjliALjEjtlrzDby3Z0TbBBJR2x5xgmu+LDlx8OMcDgkC+5JV8eL8k
         zx9Q==
X-Gm-Message-State: AOAM531Ek7ITc86+RLsWC/ss/PMyO1WPRNXjCMhAtW8EQ0o1SDLas1mL
	9hHw3ZMn5p+3mbNcWS0i/x1WpnFyju8=
X-Google-Smtp-Source: ABdhPJzy8So6LUCbbqsaVyGqZpkGWh1nIJifHTvsH6tXSl1Cxhg/tQhSmkYmww8KULDXmX3Xv/O7fQ==
X-Received: by 2002:a05:600c:1989:b0:394:8dc0:b57f with SMTP id t9-20020a05600c198900b003948dc0b57fmr33101152wmq.110.1652810672320;
        Tue, 17 May 2022 11:04:32 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 2/2] xen/grant-table: Use unpopulated DMAable pages instead of real RAM ones
Date: Tue, 17 May 2022 21:04:18 +0300
Message-Id: <1652810658-27810-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652810658-27810-1-git-send-email-olekstysh@gmail.com>
References: <1652810658-27810-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Depends on CONFIG_XEN_UNPOPULATED_ALLOC. If enabled then unpopulated
DMAable (contiguous) pages will be allocated for grant mapping into
instead of ballooning out real RAM pages.

TODO: Fallback to real RAM pages if xen_alloc_unpopulated_dma_pages()
fails.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 drivers/xen/grant-table.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 8ccccac..2bb4392 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -864,6 +864,25 @@ EXPORT_SYMBOL_GPL(gnttab_free_pages);
  */
 int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 {
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+	int ret;
+
+	ret = xen_alloc_unpopulated_dma_pages(args->dev, args->nr_pages,
+			args->pages);
+	if (ret < 0)
+		return ret;
+
+	ret = gnttab_pages_set_private(args->nr_pages, args->pages);
+	if (ret < 0) {
+		gnttab_dma_free_pages(args);
+		return ret;
+	}
+
+	args->vaddr = page_to_virt(args->pages[0]);
+	args->dev_bus_addr = page_to_phys(args->pages[0]);
+
+	return ret;
+#else
 	unsigned long pfn, start_pfn;
 	size_t size;
 	int i, ret;
@@ -910,6 +929,7 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 fail:
 	gnttab_dma_free_pages(args);
 	return ret;
+#endif
 }
 EXPORT_SYMBOL_GPL(gnttab_dma_alloc_pages);
 
@@ -919,6 +939,12 @@ EXPORT_SYMBOL_GPL(gnttab_dma_alloc_pages);
  */
 int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 {
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+	gnttab_pages_clear_private(args->nr_pages, args->pages);
+	xen_free_unpopulated_dma_pages(args->dev, args->nr_pages, args->pages);
+
+	return 0;
+#else
 	size_t size;
 	int i, ret;
 
@@ -946,6 +972,7 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 		dma_free_wc(args->dev, size,
 			    args->vaddr, args->dev_bus_addr);
 	return ret;
+#endif
 }
 EXPORT_SYMBOL_GPL(gnttab_dma_free_pages);
 #endif
-- 
2.7.4


