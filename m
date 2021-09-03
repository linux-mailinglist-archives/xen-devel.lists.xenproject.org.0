Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42573FFC14
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177845.323601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eQ-0000Rh-3m; Fri, 03 Sep 2021 08:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177845.323601; Fri, 03 Sep 2021 08:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eP-0000MS-Vm; Fri, 03 Sep 2021 08:34:17 +0000
Received: by outflank-mailman (input) for mailman id 177845;
 Fri, 03 Sep 2021 08:34:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4eO-0006kQ-DJ
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:16 +0000
Received: from mail-ej1-x62f.google.com (unknown [2a00:1450:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27e92245-e9a7-4d08-b7db-06c719470729;
 Fri, 03 Sep 2021 08:33:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id x11so10579940ejv.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:56 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:54 -0700 (PDT)
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
X-Inumbo-ID: 27e92245-e9a7-4d08-b7db-06c719470729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zEaEEkjSVbLwgqZ2cO/SvSyYHTCsAuDtk1o9tcPz34M=;
        b=HOEWMOzgAHfhqGy9RD08ptIgiNJDtfBpZENO+7wmukitpCXKU/tg2fBV+y4B5GPbeZ
         nc617mYgWSgBkpaW4vuo16HZ9MEpN6RQrgWJ6q05CQtakHUM9tZgI3oY9+bCavK6RfvD
         /Z5kGtwMD+pBzSNmg8rVMzrHjsh3Ac/qSBRoejs561XlEe8rtWJROHH3P8toAYjpOg0u
         GC5NtpzMwvW+z9I37LMc3EWyZY+bAC5A7dznB6kxyhp8224v3H81NjGIfPkG4Ng//ZK9
         jmNQ+aYz/U+d5xKG/+qYldB4flk+vPZS3BIDdQ7TKOzfrfzmsoFflWkGBScLO5yZ2+dc
         LL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zEaEEkjSVbLwgqZ2cO/SvSyYHTCsAuDtk1o9tcPz34M=;
        b=DdGy+TRLNw447nRDWa8eJGApCfFbQfReNvgW8pH60UiCN/SorZTs60lprwxoqtb4hs
         rmgP1lGzTtV2swotSG1xTKz9qnrfWW/fDrQ9sj8KSea4C84Jqfm5NdtYq2JGrGbCm8fL
         fG805Mgc3AUF1E2QTo88vuwvadMZXvX2IQKpZkNYtYobbkYGN90hEL34gJrjxGHgrgAz
         I8WIIqLWAI2Ii3/BaOZnzSouaSc0YRFQQ3zD9UJF2xMRcDMuooDYCvQG+UFgNI6JwzTW
         mmApM5Ap2CcM5SZ6RbiO1a/5WKpxT5VRU1rk5mULWN0vjkr3MUQJJt48ANSvqLRzrocA
         u8eQ==
X-Gm-Message-State: AOAM530l5Uu+nBzJSIgtyQkQA41cdnN7ZvTYnI2/5urjS4An/BSc8jhD
	QrgONB206CkZ7AO4HjjL4+SqUNh3dO8=
X-Google-Smtp-Source: ABdhPJwRW77fMud+VU+y2+UHwAx3A+siV93Yru3KtspqID6C5FmqhT1A5wFmO04G72SDTjkT5t52Uw==
X-Received: by 2002:a17:906:ff41:: with SMTP id zo1mr2759320ejb.525.1630658035099;
        Fri, 03 Sep 2021 01:33:55 -0700 (PDT)
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
Subject: [PATCH 05/11] xen/arm: Mark device as PCI while creating one
Date: Fri,  3 Sep 2021 11:33:41 +0300
Message-Id: <20210903083347.131786-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While adding a PCI device mark it as such, so other frameworks
can distinguish it form DT devices.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/passthrough/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 56e261e9bd08..25304dbe9956 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1301,6 +1301,9 @@ static int iommu_add_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
+#ifdef CONFIG_ARM
+    pci_to_dev(pdev)->type = DEV_PCI;
+#endif
     rc = hd->platform_ops->add_device(pdev->devfn, pci_to_dev(pdev));
     if ( rc || !pdev->phantom_stride )
         return rc;
-- 
2.25.1


