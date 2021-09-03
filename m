Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E73FFDF7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177972.323811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67x-0005GD-Mn; Fri, 03 Sep 2021 10:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177972.323811; Fri, 03 Sep 2021 10:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67x-0005D5-Ho; Fri, 03 Sep 2021 10:08:53 +0000
Received: by outflank-mailman (input) for mailman id 177972;
 Fri, 03 Sep 2021 10:08:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM67v-0004Cr-9x
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:08:51 +0000
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89cdb7c8-25df-49a2-9db1-259e6a8e8cb4;
 Fri, 03 Sep 2021 10:08:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id me10so10971791ejb.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:38 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:37 -0700 (PDT)
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
X-Inumbo-ID: 89cdb7c8-25df-49a2-9db1-259e6a8e8cb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3lxrhjHMCKgFgAktbulKfLSKY9SXLgEbqYmkCK+IHbI=;
        b=Cv6kNVKYxIEVmbcaX8DIKNQHN8wBj6cryOD0sKuPJKv/+o8YHRTdPVgVqD77l1hCb6
         vatzSz/C6yHUi7ZQZQ1JJlU9uCyOpq+GVxJBb9jeFDqhIQnX1cbkCtJinWZEU8eqJTQb
         jio/WmVPkE2k/zzaVXS7GL4dFAA2E0ouwzXpQCTsyFf2pUaDlvQFEaS78sYbu8YIPTXR
         U0FzaEvsPtV9sf174mXGL7Qw5/UuezecIBC+kpvG2EDzz17a/p2ZqvM6XZnGtCvqk3aL
         JIFwtBwu3xMljkBTPCWgfBV3fdb37XBeKMLOsqDZpBQznPnsEXb1R1MSjDFX+LUX9qeG
         nioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3lxrhjHMCKgFgAktbulKfLSKY9SXLgEbqYmkCK+IHbI=;
        b=Ar3aSlPCK0GtA4sCgxbYDimL2lZEujfGD2CTEiPA4eS5hh2KiOr+ahOg/9X58VTFh+
         v5lR3rXR1PGqZBPlv6NyAtoXOKwDm/GlvPQORD1cv9rpQng+6BEL/CrL/tjQaIaeOsLx
         RvUcwQiWdrc86goE79/rqqttWHovaGPNXawkzszYlLSZkzIyloeq+35lhBDgKREonL2E
         HY7eWCxYx2OJ1YAx3K2dVxroEccnwMuJyEQNYtGy25KnLRTzVJxrF6wWVINKeRkfq28i
         zk5netoP+L1mM+0e/Z1PeN9DzxSn+js6BPlupxFg73mQJCkXFXuJlL5oMNeuWRUsOoh5
         FBug==
X-Gm-Message-State: AOAM531FhXhUDauNFwiRD38UU1Lwv98u1OTOwNGaZvrk9+LAgVT1XWyj
	NZgM9J3TcaXszgvC0eIpF50lRxd6098=
X-Google-Smtp-Source: ABdhPJydxNWuh4lL4oZ/Fi+pB8Xp26xfg9TIMj2hvhsDyPP/rb6TmJbYwxmJmWH3EGwe4uJeauyAdQ==
X-Received: by 2002:a17:906:ff41:: with SMTP id zo1mr3148886ejb.525.1630663717693;
        Fri, 03 Sep 2021 03:08:37 -0700 (PDT)
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
Subject: [PATCH 3/9] vpci/header: Move register assignments from init_bars
Date: Fri,  3 Sep 2021 13:08:25 +0300
Message-Id: <20210903100831.177748-4-andr2000@gmail.com>
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
 xen/drivers/vpci/header.c | 83 ++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f8cd55e7c024..31bca7a12942 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -445,6 +445,55 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static int add_bar_handlers(struct pci_dev *pdev)
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


