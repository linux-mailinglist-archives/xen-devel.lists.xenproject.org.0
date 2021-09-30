Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2068741D4CC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199499.353606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrp-0001So-LN; Thu, 30 Sep 2021 07:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199499.353606; Thu, 30 Sep 2021 07:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrp-0001Pt-HI; Thu, 30 Sep 2021 07:52:33 +0000
Received: by outflank-mailman (input) for mailman id 199499;
 Thu, 30 Sep 2021 07:52:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqro-00017f-4Y
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:32 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0cba9af-d264-4507-8780-0fae988df9d3;
 Thu, 30 Sep 2021 07:52:27 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j5so16802840lfg.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:27 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:25 -0700 (PDT)
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
X-Inumbo-ID: c0cba9af-d264-4507-8780-0fae988df9d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYPt7pXJxe63RSclQtSSHNmQ1mlJJN2741FNOcAd+O0=;
        b=mmTcp6QmfMwKYK8Ecm2Edk6w8zGbwZLtEjMPv51QDEdZ+/3BWqGxipsHqJioA8AD+X
         G3ak1zkWZvnjKpRTiNDLAzXNhxPype90V/3cZJuA1MaMck62kHkq2dZ6lFDA3DSO3GJI
         md3ktNg1lOpedGpEu6B9dOaK5dCwN7RysoAJHmt2URAL24egrXeHkWlYV6xvbcYgCTeI
         Us9GIm8dupHRsyGaojXSXOPSJe5EF5K1tXmtRxBKrpz0l+kILm93Muf6DbGQiNb52WeI
         MhL8Yd2Knzn0mHaB2u3fD9RkBicAmppviwtWL2u/0tEVROx2igk4cy4ftabtb5zsQmVY
         mK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYPt7pXJxe63RSclQtSSHNmQ1mlJJN2741FNOcAd+O0=;
        b=N0UzxToz2+Qu3odDCXTdVn1qf39LYhwBp2rtZF4zIZZEZ+PU3n4KnHQoVFStNO/S35
         Sh3+mksvwjVptWM2L5xa2ewyYuW42BfMU+riSVP2LAxiSBsB6LGuV5ovNeQi4f4dlqox
         hPXQpaz5ay/LnwIOJLaoPkOi7NY0CKn5DeJ4dNj8gaTyWkBuugagkUPDBNUB7j16v++2
         oyaAXxyDME+XboYjv/V+SmGXvDWq9zXkFSossU6hm/XefEoXE/PTInffbrD7yBFoLfkW
         RA9kZVem+OXwnGyovtUmzUrcGGkBG273vituH8r4ZZwvWddmRNn80K0CLYScwWp3hP0s
         Fqlw==
X-Gm-Message-State: AOAM532AGQCzyVBez6afEDQzG0f1ePyy6KwrBkNcYS2BdEiLGiRKbRWT
	BzdPLQiBqeIXMm/DBO/HFfi1HGknmR0=
X-Google-Smtp-Source: ABdhPJy0PnfpM6dmqJ2wGT69DJkwD/EOCR2NGBPp6wOubDrxAQpc5CiVAiUU5b60uCf9xGGlkW7xfw==
X-Received: by 2002:a05:6512:1691:: with SMTP id bu17mr4290276lfb.401.1632988345818;
        Thu, 30 Sep 2021 00:52:25 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated function
Date: Thu, 30 Sep 2021 10:52:13 +0300
Message-Id: <20210930075223.860329-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is in preparation for dynamic assignment of the vpci register
handlers depending on the domain: hwdom or guest.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
---
Since v1:
 - constify struct pci_dev where possible
---
 xen/drivers/vpci/vpci.c | 7 ++++++-
 xen/include/xen/vpci.h  | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cbd1bac7fc33..1666402d55b8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,7 +35,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+void vpci_remove_device_registers(const struct pci_dev *pdev)
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
index 9f5b5d52e159..2e910d0b1f90 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -28,6 +28,8 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+/* Remove all handlers for the device given. */
+void vpci_remove_device_registers(const struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register(struct vpci *vpci,
-- 
2.25.1


