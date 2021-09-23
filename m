Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A565C415F06
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194129.345879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOI3-0003Ap-AP; Thu, 23 Sep 2021 12:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194129.345879; Thu, 23 Sep 2021 12:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOI3-000377-48; Thu, 23 Sep 2021 12:57:27 +0000
Received: by outflank-mailman (input) for mailman id 194129;
 Thu, 23 Sep 2021 12:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHL-0004it-6g
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:43 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96030892-7a61-4732-967d-19f6ffea7ce8;
 Thu, 23 Sep 2021 12:55:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b15so25737297lfe.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:09 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:06 -0700 (PDT)
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
X-Inumbo-ID: 96030892-7a61-4732-967d-19f6ffea7ce8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TDiVVp/85Hu7qvLwikbqJ56SNZPH692g3qboO1XLKAU=;
        b=DH6sRara2lIzT7fiwygzxRyOEAe577X/U+ypPVBFF3U4XBHY3okF7NHXhAa5CI51Wv
         Fw/7ho2wGWStYpkbJMigRCdA+zzNU2ENw6FgfszkkxD9GKyiH27CqGyMG/KCrbP2FLDs
         oTfO8tIjkCLZ58BkutfSpTkZYIHxJMyLxumi5oe85jSGgg3N9yOqUjoc+QmgCWY8kxNV
         ZB8EGKcddtd4yuCpos2HcQM64WWqhJWGxWhp7FyxFSOFjVzHwpjwRw1RUkrak7yZBWxN
         zTkTxwCRoDZH2Cemj7kYlRKwv6wuP/qBCODwtaxVsC5+dedlFvIzSEZiMRSOA/u4r/Fo
         SHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDiVVp/85Hu7qvLwikbqJ56SNZPH692g3qboO1XLKAU=;
        b=FlZSmYqkQf2Tyl3See2tex9xXOdO5oHHltCsviCHS5fIWWC18VidiU9SOPJSMXnkAq
         qOvXuCxiaOPMXWpsOAoZ2ldPD7AcyqalmZhzd5Zx+aG+PkNCi4EYoyxVlBgq4nkEZm9T
         d0CvmFrPhGJHELV2YCS5DHAZu1Ab80+B4CWv3mKZuUG/wQoIz09WNrBP/HUuNtkKdf8s
         BYT5CP/RU9elfhQDEBW6ov1VaqQMNgCdGnsh2TaQG91ZO6y/nDUOYJJq3Q7JTGwBp7X4
         zbiDgIVT/pB5LCjHsMtTeOoEozBDvAXsaXcie87z+wYLaa4ZXc/Orog2nDxLORwsy4F+
         g86Q==
X-Gm-Message-State: AOAM53178bYDJmQzvewRufKUY2XifSr8uQ1IwGg2UzuSE8UfZi9V24VX
	QlXIlHKkUUSjETERgLfoItjltJ2fJFa1Dg==
X-Google-Smtp-Source: ABdhPJwtuLnpa/+icsyqakDioUzcXtFi1z998oW4N/1k6zq5qBg75ioZqd9T0FC0ynDimZ2biRkQeQ==
X-Received: by 2002:a05:6512:2e8:: with SMTP id m8mr4278108lfq.22.1632401707216;
        Thu, 23 Sep 2021 05:55:07 -0700 (PDT)
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
Subject: [PATCH v2 03/11] vpci/header: Move register assignments from init_bars
Date: Thu, 23 Sep 2021 15:54:53 +0300
Message-Id: <20210923125501.234252-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
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


