Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926593FFDF4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177970.323788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67n-0004WV-0V; Fri, 03 Sep 2021 10:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177970.323788; Fri, 03 Sep 2021 10:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67m-0004U0-TJ; Fri, 03 Sep 2021 10:08:42 +0000
Received: by outflank-mailman (input) for mailman id 177970;
 Fri, 03 Sep 2021 10:08:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM67l-0004Cr-9V
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:08:41 +0000
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a207c60b-2f84-4a2e-8c87-e4da339ca8fd;
 Fri, 03 Sep 2021 10:08:36 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mf2so10990326ejb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:36 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:35 -0700 (PDT)
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
X-Inumbo-ID: a207c60b-2f84-4a2e-8c87-e4da339ca8fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZadtWS/HmdzZ6ZB6hMvTOb7/437UPtLCPee6STSCqfE=;
        b=YhHIT73vy+PVxx26h1vPYEo5XBj3ro3OZ8ijz9+VhFJjzLOVDwpyT4NP5euCOnWr6F
         sXNIdIdwveV+4JJNloPws1E3n6Qi3ChdN9OgIrXxwDb3quCHFdbymal/0yvXMNj9eLKy
         rpvYV/4QQUS3mNCN08ose74UFLipgvvzzaThClvTPt6m8yytTwArmYRLrDbwUdlCjlwa
         Us4A/LRhlNmNfGnBUb+ygPZcwZ46eX0hpKznDPYPRaQBm59/7pFQJhV/aYIUkAeTNmGW
         YCjjIQo1QPg+2ZCq+OnF2tXhNd9qFuj+CzZ8qJS8zb8SFxw36Od7qiX+H7XIm3NLw3Pg
         JKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZadtWS/HmdzZ6ZB6hMvTOb7/437UPtLCPee6STSCqfE=;
        b=Uey5oSbYIwQXHH9NMZKn+7cI48afypAEdjXa55LJy1A+9R4MKMFUl49TIEpRjNybEB
         13dtLALW21QIbsUBSq6WP1+gdfH3xLAKEV91ac/4OTv8HAiIpIg8TdXFNfcVyUP3iJic
         L63ds6uBWA3us0EY5o13sTUHj2DhQ0aZYPqDrylJqHO5A2cvntCJr+jYVCxcxs1fBnsy
         pTIUve6hfQIyPMNxP46vNTsYQZ4SixRVfuft2/YPEa1Oxsmt6rVFFIPIa2Uc6zeB+9/K
         +q0ig0nEPa2PYN6/vNRpqE/7Abwmo5hbDgrAZCYolMxnVPxLoPDHE+0V1sl8Adn15pkn
         QV1Q==
X-Gm-Message-State: AOAM532yciggjHHlrkznHx4PQ140XKp6WbKSxiBfvBZDLj0Rv2g3sSnQ
	o7Nccq1vwXUrcAfJJz9Gr//naxT4rws=
X-Google-Smtp-Source: ABdhPJwgZPoQj1ss4jKZJbBH8b+YlK07Jv0KEwHZKKBxDLUyLP9WFuc8uyLUXAIwk7Pj5zBg8EBp3Q==
X-Received: by 2002:a17:907:362:: with SMTP id rs2mr3352436ejb.17.1630663715405;
        Fri, 03 Sep 2021 03:08:35 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 1/9] vpci: Make vpci registers removal a dedicated function
Date: Fri,  3 Sep 2021 13:08:23 +0300
Message-Id: <20210903100831.177748-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is in preparation for dynamic assignment of the vpci register
handlers depending on the domain: hwdom or guest.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/vpci.c | 7 ++++++-
 xen/include/xen/vpci.h  | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cbd1bac7fc33..b05530f2a6b0 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,7 +35,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+void vpci_remove_device_registers(struct pci_dev *pdev)
 {
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
@@ -48,6 +48,11 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+}
+
+void vpci_remove_device(struct pci_dev *pdev)
+{
+    vpci_remove_device_registers(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9f5b5d52e159..b861f438cc78 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -28,6 +28,8 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+/* Remove all handlers for the device given. */
+void vpci_remove_device_registers(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register(struct vpci *vpci,
-- 
2.25.1


