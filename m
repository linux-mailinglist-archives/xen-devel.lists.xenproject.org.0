Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FEB426453
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204337.359517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirX-0001K2-V4; Fri, 08 Oct 2021 05:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204337.359517; Fri, 08 Oct 2021 05:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirX-0001GV-PQ; Fri, 08 Oct 2021 05:56:07 +0000
Received: by outflank-mailman (input) for mailman id 204337;
 Fri, 08 Oct 2021 05:56:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirV-0007cA-KS
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:56:05 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c27177f6-bd7e-4306-9d47-72ef149989c9;
 Fri, 08 Oct 2021 05:55:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b20so35071654lfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:45 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:43 -0700 (PDT)
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
X-Inumbo-ID: c27177f6-bd7e-4306-9d47-72ef149989c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZCJvktk62euiFf93z8Os38uZoCLuGeAveKltg5+4Wtc=;
        b=egTWtj0yY2eScJ0OlKXABb4G+bmYSWosMoQG8sskJ0bDLAxynVAbBUO8ze901KLgN0
         4gqvEwhbUTVm208gisrRZccw+DN3KtwxHFLyd8flxas7Ycqm/3zEiyS8Dx9szsY1EcGi
         ZWHuONWzcP7cVazxts2zgCR9c7Q1iNo66m4ToAgHhR2czvdLDM10zJhvEN27t/GNccFB
         2DlhzvXQQ7SW8x4QxwVeSKdnvDGhOG4QWoiXidYssrdLd3vP5rzZFZvDKeCckMDcvjrN
         dSziPh6BixoMhXDrhzHEUAKwoIPF+4fIEt77zMy+CwhChFtedX4g3nMk7dRAfpC/ij5w
         DWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZCJvktk62euiFf93z8Os38uZoCLuGeAveKltg5+4Wtc=;
        b=2FXGFiXo91/qts9DiPO7VRuwE8PH/7EsoGP7xdCJTlV+Y2CwZrmt7GI8FOw1jQsWzX
         +hti109Weu5TDnTsGPaR2eqgHPl4lJda/SGRHTb+FTabDh68WldbxDWBB0JWC5EN5E+u
         bo/mmYToWWAXOditBmzlLG/Dm+7jnuPvB6vqdaoPU9jA/P7igYttLZHNgB95KTCrp1/O
         iI0vvFyxClCaITjJfOuZwYx9sBbA9SJEnf0ZpxQhq8d1k2l8l98RZMarGtMR/JBNMGqq
         q4a10wLJdVTbUN4yvq/XR7KRkdywgyuYkLweIrfMw1Iz5TTOTeXTeCinhznK+fPt3WVS
         C/Ag==
X-Gm-Message-State: AOAM53221HWOBaM5sQzSvERpE9qcN6f9Lsz3gdl5Mj9WF+hk407zJzjb
	geRqmg3JYpmsxq9RC2WxUtTMsp4tgwA=
X-Google-Smtp-Source: ABdhPJw3iseSMLF5rjaGBAlP//RiQcLo4485Bz93gG+h/Km/Hsavi6PicqSrSmsmdebz/ACX9Ate4g==
X-Received: by 2002:a05:6512:3b94:: with SMTP id g20mr8678129lfv.119.1633672543928;
        Thu, 07 Oct 2021 22:55:43 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 05/10] xen/domain: Call pci_release_devices() when releasing domain resources
Date: Fri,  8 Oct 2021 08:55:30 +0300
Message-Id: <20211008055535.337436-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is the very same that we already do for DT devices. Moreover, x86
already calls pci_release_devices().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
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


