Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529441D4D0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199505.353649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqs5-000351-11; Thu, 30 Sep 2021 07:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199505.353649; Thu, 30 Sep 2021 07:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqs4-00032G-Sp; Thu, 30 Sep 2021 07:52:48 +0000
Received: by outflank-mailman (input) for mailman id 199505;
 Thu, 30 Sep 2021 07:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqs3-00017f-59
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:47 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85314c14-274d-4084-803c-7360f29354b5;
 Thu, 30 Sep 2021 07:52:30 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z24so21538335lfu.13
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:30 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:28 -0700 (PDT)
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
X-Inumbo-ID: 85314c14-274d-4084-803c-7360f29354b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+lvSnXHbydzAtV18JqDZDz/Q4JuLo0GbEWE975rivV4=;
        b=RvBF4VUM1Fk+E+WSGa+N7HuxNUkCF1yYamFAn+WCByN3h1ck/uPr2ThjCz3Htwvszv
         JD7MB/R4pYL7vd/scgYTgNkJQNgCjwrlCskorlXeGcafl9saDZeKdSlCK5sx/iGgPWvY
         FkluY894cb3vxLxpgDS+LhXM5DGQFst3R2A2zGIicFMY2V7MJBsqu2XOTQxDLsd6H5pM
         t1WQYQPTn9FHiTj+oWpuU/ilwnQXWAgf3VsRffW0cmEJT83rP2+h6O3y50MoDxSQrDCI
         C7t/ulzm7EjOmIoaSP5sIFPxPdDCdYSQ0tw1XpQfjFH7PR5oAVZvTbzkejD+3t+qJxQp
         d5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+lvSnXHbydzAtV18JqDZDz/Q4JuLo0GbEWE975rivV4=;
        b=bbEmUZqfG+Et0o4TqJfZoETZ3j1sfaPnfQtC8JPViwOC1MmlocMDkNl1ZlV7X/92n8
         0oVUpug0pvdlv85Yy2CvXwwtT7lCS7TMvRgN30XkBwZcSC/m/Aq2Z0HfJ2FdL63eoypu
         ipoomkjank1MhNl0n0RQijxB08e3Zb29ItFXpb4RM8X6KFBiJqcwuQyfEiNxOLmAHUcy
         tTfBn8z+KSV5L+uz3RMO7dbaflnCVI96QQIa3uxUA5itrnweDXLDAliYM4SNiTOjDG65
         CDSFsCLh8tfzMtTCyjg7yACmThSzqgwdktchlHHmeqI+daFESFPP5yqJBtu6H865HL1Q
         jIgg==
X-Gm-Message-State: AOAM530eR/hB3bG2uFbWDeQXOAPHE/Hn7DKEtKcHACX/RiRc1EVZ15gr
	s5OkVFC4/pFccrlmLyQcIsSPyQbkFGY=
X-Google-Smtp-Source: ABdhPJz0Z246UwdyliQVLaHOSo2T5zlzJH0n8U8wqH0wwto1FrUvKVB6rbV1sDwYhVfQlVl9ywO6xQ==
X-Received: by 2002:a05:6512:b8f:: with SMTP id b15mr4596943lfv.655.1632988348949;
        Thu, 30 Sep 2021 00:52:28 -0700 (PDT)
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
Subject: [PATCH v3 04/11] vpci/header: Add and remove register handlers dynamically
Date: Thu, 30 Sep 2021 10:52:16 +0300
Message-Id: <20210930075223.860329-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Use stubs for guest domains for now.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v2:
- remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
  has been eliminated from being built on x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
---
 xen/drivers/vpci/header.c | 72 ++++++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c   |  4 +--
 xen/include/xen/vpci.h    |  8 +++++
 3 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 3d571356397a..1ce98795fcca 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -397,6 +397,17 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
+static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t val, void *data)
+{
+}
+
+static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
+                               void *data)
+{
+    return 0xffffffff;
+}
+
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
@@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
-static int add_bar_handlers(const struct pci_dev *pdev)
+static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t val, void *data)
+{
+}
+
+static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
+                               void *data)
+{
+    return 0xffffffff;
+}
+
+static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)
 {
     unsigned int i;
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
 
-    /* Setup a handler for the command register. */
+    /* Setup a handler for the command register: same for hwdom and guests. */
     rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
                            2, header);
     if ( rc )
@@ -475,8 +497,13 @@ static int add_bar_handlers(const struct pci_dev *pdev)
                 rom_reg = PCI_ROM_ADDRESS;
             else
                 rom_reg = PCI_ROM_ADDRESS1;
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
-                                   rom_reg, 4, &bars[i]);
+            if ( is_hwdom )
+                rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
+                                       rom_reg, 4, &bars[i]);
+            else
+                rc = vpci_add_register(pdev->vpci,
+                                       guest_rom_read, guest_rom_write,
+                                       rom_reg, 4, &bars[i]);
             if ( rc )
                 return rc;
         }
@@ -485,8 +512,13 @@ static int add_bar_handlers(const struct pci_dev *pdev)
             uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
 
             /* This is either VPCI_BAR_MEM32 or VPCI_BAR_MEM64_{LO|HI}. */
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
-                                   4, &bars[i]);
+            if ( is_hwdom )
+                rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write,
+                                       reg, 4, &bars[i]);
+            else
+                rc = vpci_add_register(pdev->vpci,
+                                       guest_bar_read, guest_bar_write,
+                                       reg, 4, &bars[i]);
             if ( rc )
                 return rc;
         }
@@ -520,7 +552,7 @@ static int init_bars(struct pci_dev *pdev)
     }
 
     if ( pdev->ignore_bars )
-        return add_bar_handlers(pdev);
+        return add_bar_handlers(pdev, true);
 
     /* Disable memory decoding before sizing. */
     cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
@@ -582,7 +614,7 @@ static int init_bars(struct pci_dev *pdev)
                               PCI_ROM_ADDRESS_ENABLE;
     }
 
-    rc = add_bar_handlers(pdev);
+    rc = add_bar_handlers(pdev, true);
     if ( rc )
     {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
@@ -593,6 +625,30 @@ static int init_bars(struct pci_dev *pdev)
 }
 REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+int vpci_bar_add_handlers(const struct domain *d, const struct pci_dev *pdev)
+{
+    int rc;
+
+    /* Remove previously added registers. */
+    vpci_remove_device_registers(pdev);
+
+    rc = add_bar_handlers(pdev, is_hardware_domain(d));
+    if ( rc )
+        gdprintk(XENLOG_ERR,
+                 "%pp: failed to add BAR handlers for dom%pd: %d\n",
+                 &pdev->sbdf, d, rc);
+    return rc;
+}
+
+int vpci_bar_remove_handlers(const struct domain *d, const struct pci_dev *pdev)
+{
+    /* Remove previously added registers. */
+    vpci_remove_device_registers(pdev);
+    return 0;
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0fe86cb30d23..702f7b5d5dda 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -95,7 +95,7 @@ int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
-    return 0;
+    return vpci_bar_add_handlers(d, dev);
 }
 
 /* Notify vPCI that device is de-assigned from guest. */
@@ -105,7 +105,7 @@ int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
-    return 0;
+    return vpci_bar_remove_handlers(d, dev);
 }
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index ecc08f2c0f65..fd822c903af5 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -57,6 +57,14 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
  */
 bool __must_check vpci_process_pending(struct vcpu *v);
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Add/remove BAR handlers for a domain. */
+int vpci_bar_add_handlers(const struct domain *d,
+                          const struct pci_dev *pdev);
+int vpci_bar_remove_handlers(const struct domain *d,
+                             const struct pci_dev *pdev);
+#endif
+
 struct vpci {
     /* List of vPCI handlers for a device. */
     struct list_head handlers;
-- 
2.25.1


