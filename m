Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA941D4CF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199502.353639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrz-0002YS-Mk; Thu, 30 Sep 2021 07:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199502.353639; Thu, 30 Sep 2021 07:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrz-0002Uq-IF; Thu, 30 Sep 2021 07:52:43 +0000
Received: by outflank-mailman (input) for mailman id 199502;
 Thu, 30 Sep 2021 07:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqry-00017f-5G
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:42 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a220379f-c5e5-450e-bfa6-05edd90ae1a3;
 Thu, 30 Sep 2021 07:52:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y26so21640122lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:29 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:27 -0700 (PDT)
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
X-Inumbo-ID: a220379f-c5e5-450e-bfa6-05edd90ae1a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TDiVVp/85Hu7qvLwikbqJ56SNZPH692g3qboO1XLKAU=;
        b=gq+EMwDmDw1J4eB8taY5f3+FOEntO+piewAuZeunn1C+ww+Gpe4FN6A4SMAuc96WSi
         WtQb6Bg6gpOBRKJNNFp/GdB3g/+CvNwEKOkYRPT+HN2l3zvRpuel0N2cCvaeJfo1T/k1
         YFpWFuOYmjRVr2Ee5iap9oNkIwElPkIaVMFIKflEslmtC+vym0qPnktCmae2FHOiacOr
         2AuMTN6SlkIBODhZSgOzQZfCJVkyKafhUqestf/egmoF+TfG5jrdIOJPPx7sqzz2VPiP
         TIb3PHHBsyEVScDfFPrGm0R+4TXfcCcm91GNOCLD58aT7vvr8Y1QsCDVd6eR5MDPNEwG
         x+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDiVVp/85Hu7qvLwikbqJ56SNZPH692g3qboO1XLKAU=;
        b=LR1rSyifsQztEPc0TgMjEqRgA4ybpWVlQyoWxTw0gG0jLcapWJE1pT2D/+ilkQRAYn
         Jcd2EPU8I6lehQ43VIxt76Ywc5pvN9y0nAnusB67styG/+2RiRT06dwX/MaL4ir0VcN3
         RWYK4FwtysE87GPlu4kpMolMl5aMIqyCsr2oMerDS8eBkWFWqxL3woc2PERtquOeEwuV
         RT3rZYRaVLLYtiZixhn3O1Sdm/tDIX11UXKa+mvP4OhnFjuf+/8jjlSw4jvIgvGFxXoD
         Lj+hoJ4LyT98C8vof2cUkx6TmJgCCuiHK+1kWtYhRhlssVdOKQpW1g9KuP4TJ0iI83M5
         +/WQ==
X-Gm-Message-State: AOAM532DC6hEznrqSCLl4bubWtZjT+3Ip5rRLViZOAugqWTvZqd5QXMn
	ckDHuWbzNtZ5yqMRbNuGFYm0qoC4yxQ=
X-Google-Smtp-Source: ABdhPJwpuWaTde9OK4X7N00bG/MnIC2YJvlxlY2pxfCMW92/HGzZzZm71JgEX/xw/8AO8tnK5RzPZQ==
X-Received: by 2002:a05:6512:31cb:: with SMTP id j11mr4500919lfe.299.1632988347903;
        Thu, 30 Sep 2021 00:52:27 -0700 (PDT)
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
Subject: [PATCH v3 03/11] vpci/header: Move register assignments from init_bars
Date: Thu, 30 Sep 2021 10:52:15 +0300
Message-Id: <20210930075223.860329-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is in preparation for dynamic assignment of the vPCI register
handlers depending on the domain: hwdom or guest.
The need for this step is that it is easier to have all related functionality
put at one place. When the subsequent patches add decisions on which
handlers to install, e.g. hwdom or guest handlers, then this is easily
achievable.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - constify struct pci_dev where possible
 - extend patch description
---
 xen/drivers/vpci/header.c | 83 ++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f8cd55e7c024..3d571356397a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -445,6 +445,55 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static int add_bar_handlers(const struct pci_dev *pdev)
+{
+    unsigned int i;
+    struct vpci_header *header = &pdev->vpci->header;
+    struct vpci_bar *bars = header->bars;
+    int rc;
+
+    /* Setup a handler for the command register. */
+    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
+                           2, header);
+    if ( rc )
+        return rc;
+
+    if ( pdev->ignore_bars )
+        return 0;
+
+    for ( i = 0; i < PCI_HEADER_NORMAL_NR_BARS + 1; i++ )
+    {
+        if ( (bars[i].type == VPCI_BAR_IO) || (bars[i].type == VPCI_BAR_EMPTY) )
+            continue;
+
+        if ( bars[i].type == VPCI_BAR_ROM )
+        {
+            unsigned int rom_reg;
+            uint8_t header_type = pci_conf_read8(pdev->sbdf,
+                                                 PCI_HEADER_TYPE) & 0x7f;
+            if ( header_type == PCI_HEADER_TYPE_NORMAL )
+                rom_reg = PCI_ROM_ADDRESS;
+            else
+                rom_reg = PCI_ROM_ADDRESS1;
+            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
+                                   rom_reg, 4, &bars[i]);
+            if ( rc )
+                return rc;
+        }
+        else
+        {
+            uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
+
+            /* This is either VPCI_BAR_MEM32 or VPCI_BAR_MEM64_{LO|HI}. */
+            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
+                                   4, &bars[i]);
+            if ( rc )
+                return rc;
+        }
+    }
+    return 0;
+}
+
 static int init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -470,14 +519,8 @@ static int init_bars(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
 
-    /* Setup a handler for the command register. */
-    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
-                           2, header);
-    if ( rc )
-        return rc;
-
     if ( pdev->ignore_bars )
-        return 0;
+        return add_bar_handlers(pdev);
 
     /* Disable memory decoding before sizing. */
     cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
@@ -492,14 +535,6 @@ static int init_bars(struct pci_dev *pdev)
         if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
         {
             bars[i].type = VPCI_BAR_MEM64_HI;
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
-                                   4, &bars[i]);
-            if ( rc )
-            {
-                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-                return rc;
-            }
-
             continue;
         }
 
@@ -532,14 +567,6 @@ static int init_bars(struct pci_dev *pdev)
         bars[i].addr = addr;
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
-
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
-                               &bars[i]);
-        if ( rc )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
     }
 
     /* Check expansion ROM. */
@@ -553,11 +580,13 @@ static int init_bars(struct pci_dev *pdev)
         rom->addr = addr;
         header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
                               PCI_ROM_ADDRESS_ENABLE;
+    }
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
-                               4, rom);
-        if ( rc )
-            rom->type = VPCI_BAR_EMPTY;
+    rc = add_bar_handlers(pdev);
+    if ( rc )
+    {
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        return rc;
     }
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
-- 
2.25.1


