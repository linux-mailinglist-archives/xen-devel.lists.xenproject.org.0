Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3A3EF9FD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 07:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168080.306862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGE1h-0001BP-7s; Wed, 18 Aug 2021 05:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168080.306862; Wed, 18 Aug 2021 05:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGE1h-00018l-3S; Wed, 18 Aug 2021 05:22:09 +0000
Received: by outflank-mailman (input) for mailman id 168080;
 Wed, 18 Aug 2021 05:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Bg=NJ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mGE1e-00017u-SU
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 05:22:06 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21b5b610-ae6a-4085-a7f5-1ebdcc59b9d4;
 Wed, 18 Aug 2021 05:22:05 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id i28so2794405ljm.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 22:22:05 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id d9sm487219ljq.54.2021.08.17.22.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 22:22:04 -0700 (PDT)
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
X-Inumbo-ID: 21b5b610-ae6a-4085-a7f5-1ebdcc59b9d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chF99kLUEJ6GaQDk1MdS20aNXpvmw60+IvjkdFNFHtQ=;
        b=tyrBao7nNF50005uoF+B9eDH2dI1bMj3HmSyiUqQaaOFgHtXma0WTcOhPYVhWcDY38
         N/08EmOGM/gIfKX4Zjgea+3oEzqpmUAX5wqbWTzMiZfjqDyzPbRK3XwdGfMaOmTFWOc4
         CJn+CG+gFzu7TIG1p08+PSTlS1GYLj0O2Sg2clopRJxBCsQSIxo44pkh2NfrYxflNVoN
         At83RC3ctdKZHovWrhEOCs0gj0mcC9wBtFjjtkzfFd0FnoYcOyVVxH22RcjDE63FTS6Q
         FOhP6wjKoSe4FWQjGWBchSHtXKfGTipNE80pRpupnx/sBZqOfOuCcJHu8muBkvZIZi5K
         r/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chF99kLUEJ6GaQDk1MdS20aNXpvmw60+IvjkdFNFHtQ=;
        b=qB80BdU2P+K3m5NiB2qqAEZ+7g9IHkfQ2z0LTLblI1CmYxoX3EDzdLrKGoKModRh5t
         JkAy9UczDmOu2gDcJM76EWq7s5/fxD/SbPJzimpMCSapmpVP/qAqTzZ39xuCBNmAeWpZ
         rRI9Qga5bMik4ubHAFK5rWxPc6Httpe+GsN7+CUGxYnwknsNqgD4ZT82TSyDYuK6NoFO
         9UejW5Z3qbvfXbHYPPZpmZLNWFoFwskFpqZh+xz5SSo6gcxHG+yA3zFguSNx5cr2Zybe
         e525xVoGFbtFtmkjh54Ph71U7Bzml+jAxrzVUtKXLARVJTv5oAyBgsSjZy6xjw4I+yT1
         jKhA==
X-Gm-Message-State: AOAM5328irD1fjPHLdcEvmGmV+fZ6qecwVMxuNMb6nrNoaOWq0q+u5Ux
	T2HQPNzwyDxyFVijyBTVpvk=
X-Google-Smtp-Source: ABdhPJzXZ3uASSMWKoiso5N8kPrHeEDw5GDxKzdWrlas45OaX4IlaMqjeAWb6V01KcTXr6vSvL6hFg==
X-Received: by 2002:a2e:b4b9:: with SMTP id q25mr6128371ljm.180.1629264124854;
        Tue, 17 Aug 2021 22:22:04 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v2] xen/arm: smmu: Set/clear IOMMU domain for device
Date: Wed, 18 Aug 2021 08:22:02 +0300
Message-Id: <20210818052202.1711084-1-andr2000@gmail.com>
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

Fixes: 06d1f7a278dd ("xen/arm: smmuv1: Keep track of S2CR state")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
v2:
Fixed NULL assignment out of refcount == 0 check for domain
Added "Fixes" tag
---
 xen/drivers/passthrough/arm/smmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c234ad9c7f1e..c9dfc4caa0d6 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2768,6 +2768,7 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 			arm_smmu_destroy_iommu_domain(domain);
 	} else {
 		atomic_inc(&domain->ref);
+		dev_iommu_domain(dev) = domain;
 	}
 
 out:
@@ -2791,6 +2792,7 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
 	spin_lock(&xen_domain->lock);
 
 	arm_smmu_detach_dev(domain, dev);
+	dev_iommu_domain(dev) = NULL;
 	atomic_dec(&domain->ref);
 
 	if (domain->ref.counter == 0)
-- 
2.25.1


