Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F744A9404
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265016.458394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBm-0003Qb-DS; Fri, 04 Feb 2022 06:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265016.458394; Fri, 04 Feb 2022 06:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBl-0003BJ-DR; Fri, 04 Feb 2022 06:35:21 +0000
Received: by outflank-mailman (input) for mailman id 265016;
 Fri, 04 Feb 2022 06:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBh-0008DX-6q
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:17 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d5fbd2f-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:16 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id o17so7206043ljp.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:16 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:15 -0800 (PST)
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
X-Inumbo-ID: 9d5fbd2f-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qo4xVV2IOrLU3ayXp+CLSEr+b1lCwCF0zrFQg2DftNA=;
        b=DW8T5+dKfc/hN9mnCARyk2APUMIqiKK4CcqjIN0Whced814pQ8sYHC/r342zGCp7Gw
         IBwogyUJD9Ll9XN/ABcSgRxIMazNdqgGYw6lOmF65gWB6mOnkOmc0Xgmhk34CQccPhNo
         GtIPYj5MTo4WiqPdTXiYUr2UdjamJFF8aitaHwtOtk2vcf/i52oQls8Sya0/R0AaXkAD
         CG0OaC/BimKmkIEF0RssbmfnB6KDFgkf0q/P4ZQO+yo0tTnJ4zF8wscY/MxfJWeKFx02
         rbq+wZ/wpS2fq4B4fhEQYjVdTqlPpD0+jelO1aoh1jAhQbiFmzuHbzY9AGUMIDU4O5D+
         ux1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qo4xVV2IOrLU3ayXp+CLSEr+b1lCwCF0zrFQg2DftNA=;
        b=maYQAknmYI3sU1lx/8bDsOmWYL6R0ezSWud7+oY2B3r4w3KJvkACpfyzb9dh8EGptg
         M3rd+t1mIV1vMUb0Ud1f332jOk4eugoERLoILfQWj8jKQVZptrVIdvGeXbpuegD2Sswn
         uIRLYRc6QXerWKAE8LEDxMwUIP83o1w9rLvyoC67uO9O8TF9XQ2Lrs3QljIuYzRXVqW0
         MfTJoyy4kLtK2AKHGPTuuuuO/PBTkfzijiRuZdaJQ5JpGKSJTWTbuwDUSkwpVb7dRFf7
         Jq3MztAZbU9NSzR7OBS5Erg3oOgg96w97bT+IV4IDaR5G4ZWKuazTGV/6yGkPwbnvZCL
         XRxw==
X-Gm-Message-State: AOAM531hlDQUhcnH/lpWWjcPQxvq3UPhZy7CYUKvs3Fj6lg+jiYQ//bi
	l1wwBXmDBLkjs3tfyH8qoJ19xW0lioI=
X-Google-Smtp-Source: ABdhPJwWj2gtNHZB0Bqn6McKeBHaWxFGAxFvXVwELlj4nHdWpNKInEIKgGnAdCyCL0new9sD8fO1VA==
X-Received: by 2002:a2e:82c4:: with SMTP id n4mr893394ljh.163.1643956515947;
        Thu, 03 Feb 2022 22:35:15 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 13/13] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Fri,  4 Feb 2022 08:34:59 +0200
Message-Id: <20220204063459.680961-14-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 84b2b068a0fe..c5902cb9d34d 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -131,6 +131,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -151,7 +153,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.25.1


