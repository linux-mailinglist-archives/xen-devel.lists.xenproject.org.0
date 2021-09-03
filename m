Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6483FFDF9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177975.323821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM682-0005jn-0s; Fri, 03 Sep 2021 10:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177975.323821; Fri, 03 Sep 2021 10:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM681-0005gQ-TE; Fri, 03 Sep 2021 10:08:57 +0000
Received: by outflank-mailman (input) for mailman id 177975;
 Fri, 03 Sep 2021 10:08:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM680-0004Cr-AA
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:08:56 +0000
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfb4143e-4d10-43e8-a103-28cf681063e9;
 Fri, 03 Sep 2021 10:08:40 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z19so7227660edi.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:40 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:38 -0700 (PDT)
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
X-Inumbo-ID: cfb4143e-4d10-43e8-a103-28cf681063e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpLp7pLNUQ/DHxUjEhr/yTY0NKqDW6A0T3pZsizfVtE=;
        b=aS6tQADQYeExZDhOABC9iBB8GoJc3IuoFCRob+Cctdwhth+nveel2KGxkARVYlU6Jd
         Qgnsw8axED8hMhxC2pYHQ9oNoSo/Olz1veZ4TZuqbKzQZivPkh6by4D4cHiKbYkHSK91
         YRf3tKX+OFy/jc8fvxtX6h9mWPRbWAPECFFsxFE+A6QKglW5XRGmbuMg67a0TGkoDIJw
         /eSmzbrBWGArGKWd2yxvzNtdGv662yFyuBYuegN1QYkQSgbHkEqDsAUOzpcLfZcumjrq
         cZ2XfDNZRq17L5VjX+W5pDzGFNH7tT+468gnBCcwp09gPnFouOqA3oPEThxmheEzgx36
         8JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpLp7pLNUQ/DHxUjEhr/yTY0NKqDW6A0T3pZsizfVtE=;
        b=hGnApIAP71TtOCLXUjUKPy4WIrMPkur5k+NPSUeWn7p/Bf8CxvczUWGnlwjKqpPQcP
         9Y0eVWNEsj5402YA2Gbn//AJYvDDKoVXzV9QDF/Ps+iNmInd9cB0Cc+SOoFZS8/asqwT
         tTfsJeeSHJaC2dhpcFjiFNFectWoPuWWPGg0Z7aGKDHciQp/Z5hDb51wcF6vB7kI2N1r
         o0cFz+f9LWpM7xDisrSAzoVOdv0ooVvwsKGxRdZ2MfEA96Rzwy9NPLeVRX8dmbhQM0j6
         ZYj5JkfP2reHEmbEYz3M/2N8AeaN+RpskyCOLs7iDYTcCtetuKAJNg2RtePNh6AlqiEw
         d1Mw==
X-Gm-Message-State: AOAM5334/en9MEUJvPwecu2YmyDa6bOMJinsNafy5DPz5/8RswTn4lXw
	mt9V6eUOxVENPqJZI0u2GjZF5lc+2Bo=
X-Google-Smtp-Source: ABdhPJwZyi4jY7+BYhHRUtcHJ71NsVbFBf7jRjXcdY+sWwfFplhPMgxjOeq7kjOI9krtIeEBDoMxMA==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr3199500eds.380.1630663718806;
        Fri, 03 Sep 2021 03:08:38 -0700 (PDT)
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
Subject: [PATCH 4/9] vpci/header: Add and remove register handlers dynamically
Date: Fri,  3 Sep 2021 13:08:26 +0300
Message-Id: <20210903100831.177748-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Use stubs for guest domains for now.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 78 +++++++++++++++++++++++++++++++++++----
 xen/drivers/vpci/vpci.c   |  4 +-
 xen/include/xen/vpci.h    |  4 ++
 3 files changed, 76 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 31bca7a12942..5218b1af247e 100644
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
 
-static int add_bar_handlers(struct pci_dev *pdev)
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
+static int add_bar_handlers(struct pci_dev *pdev, bool is_hwdom)
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
@@ -475,8 +497,13 @@ static int add_bar_handlers(struct pci_dev *pdev)
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
@@ -485,8 +512,13 @@ static int add_bar_handlers(struct pci_dev *pdev)
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
@@ -593,6 +625,36 @@ static int init_bars(struct pci_dev *pdev)
 }
 REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
 
+int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
+{
+    int rc;
+
+    /* Remove previously added registers. */
+    vpci_remove_device_registers(pdev);
+
+    /* It only makes sense to add registers for hwdom or guest domain. */
+    if ( d->domain_id >= DOMID_FIRST_RESERVED )
+        return 0;
+
+    if ( is_hardware_domain(d) )
+        rc = add_bar_handlers(pdev, true);
+    else
+        rc = add_bar_handlers(pdev, false);
+
+    if ( rc )
+        gprintk(XENLOG_ERR,
+            "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
+            d->domain_id);
+    return rc;
+}
+
+int vpci_bar_remove_handlers(const struct domain *d, struct pci_dev *pdev)
+{
+    /* Remove previously added registers. */
+    vpci_remove_device_registers(pdev);
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index ee0ad63a3c12..4530313f01e7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -94,7 +94,7 @@ int vpci_assign_device(struct domain *d, struct pci_dev *dev)
     if ( !has_vpci(d) || (d->domain_id >= DOMID_FIRST_RESERVED) )
         return 0;
 
-    return 0;
+    return vpci_bar_add_handlers(d, dev);
 }
 
 /* Notify vPCI that device is de-assigned from guest. */
@@ -104,7 +104,7 @@ int vpci_deassign_device(struct domain *d, struct pci_dev *dev)
     if ( !has_vpci(d) || (d->domain_id >= DOMID_FIRST_RESERVED) )
         return 0;
 
-    return 0;
+    return vpci_bar_remove_handlers(d, dev);
 }
 
 #endif /* __XEN__ */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e7a1a09ab4c9..4aa2941a1081 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -63,6 +63,10 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
  */
 bool __must_check vpci_process_pending(struct vcpu *v);
 
+/* Add/remove BAR handlers for a domain. */
+int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev);
+int vpci_bar_remove_handlers(const struct domain *d, struct pci_dev *pdev);
+
 struct vpci {
     /* List of vPCI handlers for a device. */
     struct list_head handlers;
-- 
2.25.1


