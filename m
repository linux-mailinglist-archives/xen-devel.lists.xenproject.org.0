Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844A7FA020
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642067.1001165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bBG-0002YP-FY; Mon, 27 Nov 2023 12:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642067.1001165; Mon, 27 Nov 2023 12:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bBG-0002Vq-Ct; Mon, 27 Nov 2023 12:57:42 +0000
Received: by outflank-mailman (input) for mailman id 642067;
 Mon, 27 Nov 2023 12:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJh/=HI=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1r7bBF-0002Vk-SA
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:57:41 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4e722f-8d24-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 13:57:40 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c5039d4e88so50455981fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 04:57:40 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffc50000000b00332cb561c8dsm11987442wrs.112.2023.11.27.04.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 04:57:39 -0800 (PST)
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
X-Inumbo-ID: 8c4e722f-8d24-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089860; x=1701694660; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjt6k/8uh3hwCXXR7YydDVs4BIzvpxlypHixoFNvEN0=;
        b=IK/PTfD+qbZhbxN1jm1OvrM7/xqOR42CEKnR7sKwIN7YKmrkAcCNtWmx6hOxaXznZX
         xZaA2W3TM+qgpCFMOrz3mzfCdwiHyvQuMp9ycM7D9cvtI4hbqzKquKMh//cAxiopYQcL
         h6hgJNnPuNymSZIxFN83beIZ6OsDx7U3Dt4gP4Tf6mAC+Oeg39+Bede/9rkRsp5RRR6G
         2JCJu2965wSZh/JzaaJrU+O9WnS8uPacmySUccA9f/4o8/guBdX0Cv7rMw6yqNqPHXSx
         VecljdGIbxjdwM4Om1nSvozv4xfBZQXwsyoYoemRsiFrQTMNLrFoIZW3Y3aphAcZ+C4m
         zSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089860; x=1701694660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjt6k/8uh3hwCXXR7YydDVs4BIzvpxlypHixoFNvEN0=;
        b=XfkwJetmrAsyBDC8Z7Z09qBfzrTASTkuk4rvmDerj5GQ43bx7k6pfIOHaiv6T4i1tv
         QNwjGhnEgpcI5ZY8NGF4HYaVVpd/gCPmhRCa8ynRKiLXZ8BviCPfnIOsNH7FpH6uylZG
         hGMuw4lIPkV/GmsdZq1Fk4IgNnm0fLxZwxoYOIT+Me8PBckYkVBLTwPetUpYG3akVXfT
         SoQA4VJ063ZnfHW2oFwH3sSNjs8jKkmLnmxlbYDOQBz6vXrFVVlvy8UifUBnsl+k8fjX
         ICX776V8ndcGC13ZCjkzJBBa+7BTcxtVI7WNoAiwqkGqMon8x1QE7HtFJnTMYF0/2IqA
         4mrA==
X-Gm-Message-State: AOJu0YxnOYMJLh2xKYqrKB+pGawDBbBU5VieZe2bCrfsQ3oSAXAM4KnZ
	kT05hmQUbOSiDYjpxjBgADHqTw==
X-Google-Smtp-Source: AGHT+IH4FeHkACMbF03cjzsbK+N/epx+FNdWdYPGoXzsZlA+/Oqge/c/eDLnMpx/HFxScHtGL5JStg==
X-Received: by 2002:a2e:3207:0:b0:2c5:6cb:2e50 with SMTP id y7-20020a2e3207000000b002c506cb2e50mr7457759ljy.27.1701089860305;
        Mon, 27 Nov 2023 04:57:40 -0800 (PST)
Date: Mon, 27 Nov 2023 15:57:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Julien Grall <jgrall@amazon.com>, Rahul Singh <rahul.singh@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	David Vrabel <david.vrabel@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/events: fix error codes in xen_bind_pirq_msi_to_irq()
Message-ID: <60028de8-a137-423d-91d8-00b2942bd73d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error code needs to be set on these error paths.

Fixes: 5dd9ad32d775 ("xen/events: drop xen_allocate_irqs_dynamic()")
Fixes: d2ba3166f23b ("xen/events: move drivers/xen/events.c into drivers/xen/events/")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Are we going to backport these to stable?  Should I split this into two
patches?

 drivers/xen/events/events_base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index f5edb9e27e3c..aae62603b461 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1105,13 +1105,17 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 	mutex_lock(&irq_mapping_update_lock);
 
 	irq = irq_alloc_descs(-1, 0, nvec, -1);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto out;
+	}
 
 	for (i = 0; i < nvec; i++) {
 		info = xen_irq_init(irq + i);
-		if (!info)
+		if (!info) {
+			ret = -ENOMEM;
 			goto error_irq;
+		}
 
 		irq_set_chip_and_handler_name(irq + i, &xen_pirq_chip, handle_edge_irq, name);
 
-- 
2.42.0


