Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17663E922B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 15:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166054.303264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDntr-0000Hb-LE; Wed, 11 Aug 2021 13:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166054.303264; Wed, 11 Aug 2021 13:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDntr-0000EK-HE; Wed, 11 Aug 2021 13:04:03 +0000
Received: by outflank-mailman (input) for mailman id 166054;
 Wed, 11 Aug 2021 13:04:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QUIh=NC=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mDntp-0000EE-I8
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 13:04:01 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98525c6a-4e33-45c7-942a-7f3aa700216d;
 Wed, 11 Aug 2021 13:03:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l18so2960781wrv.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Aug 2021 06:03:59 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e25sm14948745wra.90.2021.08.11.06.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 06:03:58 -0700 (PDT)
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
X-Inumbo-ID: 98525c6a-4e33-45c7-942a-7f3aa700216d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M7dYvqy2JKnNvZpctQwFCPyCRhTLQAGmnCBzvZ4UvjI=;
        b=puXgpLj5dqm6bodzBvazpSMD2EV81OGf7eZQNUUkQA9CrAqdZjKsx8MCedRByE2rtz
         gYNqTmXSCQUrRaCr9UGoX4jstr0C0Jd2DOlb0aUIrS+DfehpYXYMW4vFoWag0GEgSjPQ
         2sOfyfyUmaHUaICxPTwX4GmUaqLUIszFvwK3Hfs3209Xepb/nmVtDH6mHhETyoImnZcg
         u+dZWC+Mvg8gv+zIEFi8EgDsfM2UfD70ohaVhBpR39NwRYu/r9Cp4dNFUqAAToIcdnSB
         zl+SQ8SlMmuQ3V4qw2UmPLEWxOU/NuWFXlstje7Us1KX4GApPNyV9qZZbKr5wvInyJuv
         JUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M7dYvqy2JKnNvZpctQwFCPyCRhTLQAGmnCBzvZ4UvjI=;
        b=TbklHMsRlAE+NmLhF7NVKpXi8mtotT9fXQXeO5vkC+WTcj9k96HEjh90gNARL3OQ1O
         PvTgdxzesq93m6uBYIpd4pxEdFE8yKS5zHJtb223TfziQBm+7DLvCN8b7WPppA6qCa24
         zi8ih7p+OL1EWqR/ySzQtxS1ObNoKLxsM2euDDDy9aRwGlR2WCMhzet3g2gDB1/x000p
         p8aeGX9vPw+gt7ign+YZbwhFJE82gTqEtCoKmTrc0sm+2u9Xtwi/nnyskY4LbPnREc0X
         0fEbR5BfC77fMKDDYNsZx3TwNAwkgEkMBz3CDKPGspXrWP4YZegWuskWs1sodVjAVthA
         sEGw==
X-Gm-Message-State: AOAM532vrpUTeNmWza48QgEh8WOG0w+eoQe/fNJsVPfG9TW7Y8qGtoJe
	aa4ZOugk2BMCSnub0Q8/pFU=
X-Google-Smtp-Source: ABdhPJwCOcvBt0OZVHzAjko+L3uV+bbR9CscECKdS+zB60fAfyeroqKVSnWH6a4eVUg28sp0SkorHA==
X-Received: by 2002:a5d:464a:: with SMTP id j10mr19304692wrs.190.1628687038800;
        Wed, 11 Aug 2021 06:03:58 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen/arm: smmu: Set/clear IOMMU domain for device
Date: Wed, 11 Aug 2021 16:03:56 +0300
Message-Id: <20210811130356.1143743-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a device is assigned/de-assigned it is required to properly set
IOMMU domain used to protect the device. This assignment was missing,
thus it was not possible to de-assign the device:

(XEN) Deassigning device 0000:03:00.0 from dom2
(XEN) smmu: 0000:03:00.0:  not attached to domain 2
(XEN) d2: deassign (0000:03:00.0) failed (-3)

Fix this by assigning IOMMU domain on arm_smmu_assign_dev and reset it
to NULL on arm_smmu_deassign_dev.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/smmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c234ad9c7f1e..373d9d4d123a 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2768,6 +2768,7 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 			arm_smmu_destroy_iommu_domain(domain);
 	} else {
 		atomic_inc(&domain->ref);
+		dev_iommu_domain(dev) = domain;
 	}
 
 out:
@@ -2794,7 +2795,10 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
 	atomic_dec(&domain->ref);
 
 	if (domain->ref.counter == 0)
+	{
 		arm_smmu_destroy_iommu_domain(domain);
+		dev_iommu_domain(dev) = NULL;
+	}
 
 	spin_unlock(&xen_domain->lock);
 
-- 
2.25.1


