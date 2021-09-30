Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D741D4E6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199561.353727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqwe-0008OD-PT; Thu, 30 Sep 2021 07:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199561.353727; Thu, 30 Sep 2021 07:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqwe-0008ME-Kq; Thu, 30 Sep 2021 07:57:32 +0000
Received: by outflank-mailman (input) for mailman id 199561;
 Thu, 30 Sep 2021 07:57:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqsX-00017f-6I
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:53:17 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ac7d20e-d2a5-489d-acb4-b13358f83a1a;
 Thu, 30 Sep 2021 07:52:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j5so16804175lfg.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:35 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:33 -0700 (PDT)
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
X-Inumbo-ID: 9ac7d20e-d2a5-489d-acb4-b13358f83a1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kFKr9R5/eoTpWJugUvdw0hZSjF5zvjYKXnAMVRzF8Pk=;
        b=cWJGSCPP+epJ29KCHDh+8crG7u2S+kudHu40Amr21tBEaYnCRj4sLpj6yJlBz5lWjY
         bkH0E367iOZOHaRQVdwMKNzJb+JV4+Hdpvm9oZKzkFxD726NCHoDuDDfPzLQSBUpRL3L
         9gFvonYsfiA/cdTdKzmi+5Ei+EzFxrwYmM4UMvr7JF5bpk214Gygsk6sXxyi9OaJBOnD
         gUV2hlylrGcyAW4tN/mZrbZ2AeINau62FVNJQ+e/v/u+p9CChqku8UpSjyViK6YE5vD2
         xj/9U0yHM5Xhn43L9AK2JPGa9oCy5CEHeEiudzW4kf5ZRLmKNidiK4/f1BUA6xzxzKsv
         39FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kFKr9R5/eoTpWJugUvdw0hZSjF5zvjYKXnAMVRzF8Pk=;
        b=r4AWQ2Ooqfpm6p4JXzLGJkWw8tW67sIWlk0D+cPk2Wicb9rDHl8iWspPvc/WqNQnWI
         wgNI+WNDlNEEZzyGb5lL0uQx7jdewvKVc9tss0ImmQrqXqkP9hMjnvljrkolfzJgnYtw
         KFQtA6AJft7Axeq7Bo5selkocKYUuzAcIKFbDjKguIsV3regHtfp8a51xGpq23vp3g0Y
         U36o/fmNAVJjKZIC0iR3ZIhN4nmTieiLA0zTwVNJJk8AslesdPrA2BKi9VAstXhuXCG2
         ZV5c46+rcQD1rzDTFniUEmXi5TwVTUzWyDat9zCVZPuPr9ZX16AnxeVEwU+sw5pZ3VqC
         wOVQ==
X-Gm-Message-State: AOAM53095PPna5TjcukGTE0ypoywHseoZHeELUgGc6rfgQEN6MlDOPHf
	Zi781nuFbzJS0VPDs0+zDdDou3gG62w=
X-Google-Smtp-Source: ABdhPJzNrHs+SZ/Q+mD+Sr3QROyeTeMKrWMeDO5LFmSFYlTZ1RNOC9HAByTat96meLn6Ha/BcigpWQ==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr4255807lfr.378.1632988354376;
        Thu, 30 Sep 2021 00:52:34 -0700 (PDT)
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
Subject: [PATCH v3 09/11] vpci/header: Reset the command register when adding devices
Date: Thu, 30 Sep 2021 10:52:21 +0300
Message-Id: <20210930075223.860329-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when passing through a PCI device:
it is possible that when passing through a PCI device its memory
decoding bits in the command register are already set. Thus, a
guest OS may not write to the command register to update memory
decoding, so guest mappings (guest's view of the BARs) are
left not updated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
---
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 754aeb5a584f..70d911b147e1 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -451,8 +451,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
-                            uint32_t cmd, void *data)
+static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
 {
     /* TODO: Add proper emulation for all bits of the command register. */
 
@@ -467,14 +466,20 @@ static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
             cmd |= PCI_COMMAND_INTX_DISABLE;
         else
         {
-            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
+            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
 
             if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
                 cmd |= PCI_COMMAND_INTX_DISABLE;
         }
     }
 
-    cmd_write(pdev, reg, cmd, data);
+    return cmd;
+}
+
+static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t cmd, void *data)
+{
+    cmd_write(pdev, reg, emulate_cmd_reg(pdev, cmd), data);
 }
 
 static void bar_write(const struct pci_dev *pdev, unsigned int reg,
@@ -793,6 +798,10 @@ int vpci_bar_add_handlers(const struct domain *d, const struct pci_dev *pdev)
         gdprintk(XENLOG_ERR,
                  "%pp: failed to add BAR handlers for dom%pd: %d\n",
                  &pdev->sbdf, d, rc);
+
+    /* Reset the command register with respect to host settings. */
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, emulate_cmd_reg(pdev, 0));
+
     return rc;
 }
 
-- 
2.25.1


