Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E2415EFF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194125.345863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOHn-0002EC-PQ; Thu, 23 Sep 2021 12:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194125.345863; Thu, 23 Sep 2021 12:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOHn-000266-Iq; Thu, 23 Sep 2021 12:57:11 +0000
Received: by outflank-mailman (input) for mailman id 194125;
 Thu, 23 Sep 2021 12:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHG-0004it-6L
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:38 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d0baee5-c887-4f26-b64c-1231e4c064d0;
 Thu, 23 Sep 2021 12:55:09 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t10so26352813lfd.8
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:09 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:07 -0700 (PDT)
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
X-Inumbo-ID: 9d0baee5-c887-4f26-b64c-1231e4c064d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8BU9mTDeAzJlCIShSCG3B8dpXtNyqwk/IzMfbTSVhQk=;
        b=EMo4gYUd9HuWyuM57Ppq0ISKssPDVmxqd/a2Lx8YxHs+mmxcN3gEsd/EPXpnRYNWZp
         xUlW26eHqyQlqEpQH2chnUCMJNrSGZO3Olbx+hOgheIIXNim7uQ4qz1WphFudbVt50hd
         BCE6CDc6s2BR9ov02TwJG7FxwD0KVKAB8inrPSF6WAz2svtSEwAjq2zndY8KtQBCs2Bt
         HImAJ9sxfgDV5pyymroSzP67w/57I5BESX9bfWnOdMX54tMd6Ku2IEzbJ+9gjj97OMYH
         lbjW5qmWvr4ZF3gWxm6X3XoGpR5GKQmxcH2VeFEYmbXfqZJOLOnSZqJuBjHlzRFybmot
         cppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8BU9mTDeAzJlCIShSCG3B8dpXtNyqwk/IzMfbTSVhQk=;
        b=4a0G+kWshZWoBxi7Xqd6K1O0pb4xD9vF9QBvwoI+2kpIT30DmiXFGhsxycY2KiQi3S
         Lw5b9ssgWW9GSy9SiRzo2bRAcaAo4Yuex4wY0zslgEyQqhd2hDbJd6+O/p2UKgcuGLuf
         2Ry2oZ4bRY0rAOXt+RcG5gOSCDuJKmDzDmguPcS+Mgtippe3FZPtYI/ov8jTS8WHfkx0
         V2GrjXDjxMLpF0RHBkqAM/uyZOow8uCx3gTXnA+PUaAL3kND54isqo/kA6OMlDRfm5xO
         V0mB5IqAo6aerG/eQBCwGEITkgGZ+X4tCiZkuZOpvxuBhzUMlxsIyo5C1q14PH+n6Ju3
         wz5w==
X-Gm-Message-State: AOAM530be766ngxLmP3nQ1ryXOXn/iHx3aoT3hHskcql+DL0REAxtDYC
	uIiuKsby47M63fe6c8Zz40S0P+MwCL9U9A==
X-Google-Smtp-Source: ABdhPJyHMtn4B5EwqiLHMWf9G5BqvVikcJTSRJI2KpV/yKtKmYNsU7V2hYr/2ZAL2nqe2p+lvspzlQ==
X-Received: by 2002:a05:6512:10d0:: with SMTP id k16mr4161319lfg.530.1632401708273;
        Thu, 23 Sep 2021 05:55:08 -0700 (PDT)
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
Subject: [PATCH v2 04/11] vpci/header: Add and remove register handlers dynamically
Date: Thu, 23 Sep 2021 15:54:54 +0300
Message-Id: <20210923125501.234252-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Use stubs for guest domains for now.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
---
 xen/drivers/Kconfig       |  4 +++
 xen/drivers/vpci/header.c | 72 ++++++++++++++++++++++++++++++++++-----
 xen/drivers/vpci/vpci.c   |  8 +++++
 xen/include/xen/vpci.h    |  8 +++++
 4 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47a6..f3e3a05a4544 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
 
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_PCI
+
 endmenu
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
index a8fed3d2c42e..0cdc0c3f75c4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -94,7 +94,11 @@ int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    return vpci_bar_add_handlers(d, dev);
+#else
     return 0;
+#endif
 }
 
 /* Notify vPCI that device is de-assigned from guest. */
@@ -104,7 +108,11 @@ int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
     if ( is_system_domain(d) || !has_vpci(d) )
         return 0;
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    return vpci_bar_remove_handlers(d, dev);
+#else
     return 0;
+#endif
 }
 
 #endif /* __XEN__ */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b9485b2aea1b..912cbc6aa7ad 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -63,6 +63,14 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
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


