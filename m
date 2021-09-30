Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA78B41D443
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199405.353485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGX-0006oh-KF; Thu, 30 Sep 2021 07:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199405.353485; Thu, 30 Sep 2021 07:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGX-0006mD-FC; Thu, 30 Sep 2021 07:14:01 +0000
Received: by outflank-mailman (input) for mailman id 199405;
 Thu, 30 Sep 2021 07:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGW-0004B3-A0
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:14:00 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd2f18fa-4e3d-477f-b7ea-6800107a4ee7;
 Thu, 30 Sep 2021 07:13:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b20so21448376lfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:34 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:33 -0700 (PDT)
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
X-Inumbo-ID: fd2f18fa-4e3d-477f-b7ea-6800107a4ee7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Ihu8WIsBNrrd/XYg45D3f8fvmiiGUNqVLLkujQ3kSQ=;
        b=fE5/IjUDjo4l107VbJ4aqktSyFzd7iAjLsxvokbkRHyLo4sKvfQL4RQpibEt36GD28
         4C6KrzW4Q8H4zCYcaEyMQYWNKFUaB/2kZi9MAWp2Q3qzzg+UCq/5rWPHvhvpcQ9/etwK
         CkKOm1FYGwihWockE7SHYnX3bdl7BG2uN+Or25KDZzJcvSLaqOBRjGdm09nXqFIN0Gkn
         LOCPa24WrPp0twSwtoraG/DDudssRsvSI3T1XzByPAoff5lcqX25ey1HogZNmgZ53fAO
         neyW7FovDTbbLvFWucFJ74aD+gu1bdgd5/qTW3PMuIvnqzAormQOEIvOu4pbeYDAWOUf
         UvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Ihu8WIsBNrrd/XYg45D3f8fvmiiGUNqVLLkujQ3kSQ=;
        b=rWOf1NzpFS0eyKDFQ9QoaWlPFI2nwaOoU+iu7Lzo4YfX9GvnBnOx9KZ7YTvYKlaT2c
         M9Aafjm+kksGK2VGP+n++KP5Gdl4UvgBTYMyyEhLlati2GNcVCpThk4XUbKU9U6C5xkI
         7ZgRJnayZfHFIHz3KrPKo9+Wc4ThVrTGcLPZoHOobv/SpurE7uuUy9AWPQdZiwfXObyb
         tcCylXn8iIoSwhAP5dSwfJzWm7cmCoT1aEhEEVinbbbDHXBSxVbUYvy7wLRkgukvTupq
         JbMcnbmvbnU8FiX3didYjPxySRKbomhFneSmHKf/m88I368ZyJQLAnZGVd/S7mRfJEOL
         2RGg==
X-Gm-Message-State: AOAM530rwyOl/nUbhnNNnu60tiMWOL8Cldeh6G06J13z4EWzhWotOzEH
	1031yPR0AO4Es7EKjgpNAO4DCqsjBVo=
X-Google-Smtp-Source: ABdhPJz3/MVKmhM5NSLFMJHtFSPfgOVqhklIHuHK5sSHXtiDLFtawOUTyUxTLRQNQ4StGxtpEF7bfg==
X-Received: by 2002:ac2:50d1:: with SMTP id h17mr4320299lfm.212.1632986013540;
        Thu, 30 Sep 2021 00:13:33 -0700 (PDT)
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
Subject: [PATCH v3 06/11] xen/domain: Call pci_release_devices() when releasing domain resources
Date: Thu, 30 Sep 2021 10:13:21 +0300
Message-Id: <20210930071326.857390-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is the very same that we already do for DT devices. Moreover, x86
already calls pci_release_devices().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Since v1:
 - re-wording in the commit message
---
 xen/arch/arm/domain.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index fbb52f78f1a6..79012bf77757 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
  * function which may return -ERESTART.
  */
 enum {
-    PROG_tee = 1,
+    PROG_pci = 1,
+    PROG_tee,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
 #endif
+#ifdef CONFIG_HAS_PCI
+    PROGRESS(pci):
+        ret = pci_release_devices(d);
+        if ( ret )
+            return ret;
+#endif
 
     PROGRESS(tee):
         ret = tee_relinquish_resources(d);
-- 
2.25.1


