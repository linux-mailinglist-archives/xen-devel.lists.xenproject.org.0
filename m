Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A8415EEA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194106.345802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFp-0006k9-FW; Thu, 23 Sep 2021 12:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194106.345802; Thu, 23 Sep 2021 12:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFp-0006hr-Ai; Thu, 23 Sep 2021 12:55:09 +0000
Received: by outflank-mailman (input) for mailman id 194106;
 Thu, 23 Sep 2021 12:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFo-0004it-4U
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:08 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f66fc0e9-a9da-4562-ac96-1818e2faaa98;
 Thu, 23 Sep 2021 12:54:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b15so25733308lfe.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:47 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:45 -0700 (PDT)
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
X-Inumbo-ID: f66fc0e9-a9da-4562-ac96-1818e2faaa98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7U9a60NMzbH9p0acv4bSjt13eIGtF1+DTnt5NlygFls=;
        b=Ml9zeKG++Ld2AfqsBT77oaujf9ckmq47WrQi7mDfp3hwnG1gIz5YT7UhV7KYZCiP3G
         vufCvHDbRMUlQLZHIBnuzvT/unQKGI4w2EQ0IGY6Pi0gPE0Io/DwdNvSX0iiqK7s5rwS
         +6b/5MzhcwdHXCkdFkfD/SdllAO4IsGYyKEHsSd3MZlYovly8miq16qXQtQAOhwolWDS
         jUWJTJsO16yPrhvhcbDp1ErLjzeqDMHIE/WkHFQcV76aELl85nnbMFjiMK0ozg4UTt/q
         HPyYlxRyZ5tjcF9grNmNSFDCw27nLZ2D4NBfkcUzASz3N4jmTdTkVnVV1kiInULS7Rkr
         K3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7U9a60NMzbH9p0acv4bSjt13eIGtF1+DTnt5NlygFls=;
        b=rNJhTzfFl+pxmtAWIbcjt0e2yXsQOTU37aSwsCYlmvAhhfk+0H5Iwyr89yAZ+m1S6Z
         x2l/wFr6Uix40uosyiZEVU9qaIOy870gE5HAe2SZ/ScCs/oTinq+gYVKexCAAt89S61x
         gS1A2XFSdAXgP/1tdWKlx5GgNQ3Da2CM17/wRB424nhzeI/Wo9sn6m4HoiGStWtvpksA
         gGgV9Qum14HkMZ1Pv5j5VeUXpt0CHQWWLBC42ra4wyzu17cNQDeqe5VGwTb+xEZbef/Y
         UgwJCDHUIb/mDhlZfGG1UVfGmpdkcs98TCk0CK1GbJ50GNpU91dgUunhXhNJ9NsiqIbR
         onbw==
X-Gm-Message-State: AOAM530SZxYSnyja0F/y8l4emfRA9AoBcWplfVfbFvY5SihTdZuzq02Z
	7Wqn3f0WeAidx+wqyAJQZosp/d2TFD7O2A==
X-Google-Smtp-Source: ABdhPJzqrMZnYsb4N9IlBnYa8xgiZ3yr1gWFMLelnAwzhGFLJ2/uDp0cj6r6FbGXmwrcmNHNKRuPng==
X-Received: by 2002:a2e:144a:: with SMTP id 10mr5292738lju.149.1632401686081;
        Thu, 23 Sep 2021 05:54:46 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Date: Thu, 23 Sep 2021 15:54:32 +0300
Message-Id: <20210923125438.234162-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While adding a PCI device mark it as such, so other frameworks
can distinguish it form DT devices.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - Moved the assignment from iommu_add_device to alloc_pdev
---
 xen/drivers/passthrough/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 633e89ac1311..fc3469bc12dc 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->bus) = bus;
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
+#ifdef CONFIG_ARM
+    pci_to_dev(pdev)->type = DEV_PCI;
+#endif
 
     rc = pdev_msi_init(pdev);
     if ( rc )
-- 
2.25.1


