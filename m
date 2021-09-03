Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35453FFDF6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177978.323832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM686-0006FX-JK; Fri, 03 Sep 2021 10:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177978.323832; Fri, 03 Sep 2021 10:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM686-0006AD-F4; Fri, 03 Sep 2021 10:09:02 +0000
Received: by outflank-mailman (input) for mailman id 177978;
 Fri, 03 Sep 2021 10:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM685-0004Cr-AL
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:09:01 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37d65df0-7563-4c10-bccc-ae1dcb106e2e;
 Fri, 03 Sep 2021 10:08:40 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id l6so7262298edb.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:40 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:39 -0700 (PDT)
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
X-Inumbo-ID: 37d65df0-7563-4c10-bccc-ae1dcb106e2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s1iI/pfNat4kQKr5zc/XN1JzcSSy61j1M1hI6YBK6Xs=;
        b=gBoRCW32iLvtnLPg39hDXD7cmyijkqaXRSJbAXbKOPEXyhDl0dgAaIZEz7n/8UZi4w
         xyP3FtbSUjU/63qIdjQ0mfR/gRCcCNLbo5+ikGBVrFTa2CYIa89ObRAV5x0LVELdz3K0
         gMdRG0CMUMNI1PoCqvx9gcF4dXo8MyFy60K9OjUcvHXSWX5viFQP5LDlfcUWYNyGXtIP
         zNLijBaZRzBMnCN3hJ3eHRipmudvgGiOpZcTXSfGXwt6qisNkUKhee+0WE34G69/e8mr
         HfTRJZRDqlnW++VApih2L91ZVfsGE+GAThkzBOdxFK99Io93rNBqo/1UlvVCckHjsX+9
         O+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s1iI/pfNat4kQKr5zc/XN1JzcSSy61j1M1hI6YBK6Xs=;
        b=ZH36fSUXi+4e9k9fED+FPhzapioOgKCe7C+6cxPN0UuaFxp4KN4lXQD87Uvbho9dbc
         ZZx86Su6a9Z8uVYtlcN4+kEjDJCgZ66LjCIPqAbzSjCFy51ucPxamBYSMFI7FJLj8TMS
         oFcpaTx+5DsPQW5xkXwvU8PHRN9REpyvveUCQtO8eWkMH1qjy05X2+/WO6c4SMpjXVFD
         zxI/g3d0pl6junt10RLbld6CQNUuUK2yZdwoOe+E11YUqcxfMLjHCIHlway3mXLBNnrk
         EKO+JALJdLx0ekrKEmzq1zohANVnfEMuKETO5Hrekci6wFI2BUOyMBmsV0fxqJSQNEnb
         rXUA==
X-Gm-Message-State: AOAM5320yZ6ZaDujZgZ7muxVMPZlWCCMjj6PlaSzBYzth8romaK4UiCc
	VI2SoTl4QY8DO4p+o22aqXANV8JE758=
X-Google-Smtp-Source: ABdhPJxrROUzQ4fz2kKiNwMn7jDNiM+KTMqFpM3OJ8BQuHdw/HwgIHYajSQwwLbnO5MBR/YkklXeKg==
X-Received: by 2002:a05:6402:424c:: with SMTP id g12mr3162442edb.37.1630663719821;
        Fri, 03 Sep 2021 03:08:39 -0700 (PDT)
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
Subject: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Date: Fri,  3 Sep 2021 13:08:27 +0300
Message-Id: <20210903100831.177748-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

ROM BAR is only handled for the hardware domain and for guest domains
there is a stub: at the moment PCI expansion ROM is x86 only, so it
might not be used by other architectures without emulating x86. Other
use-cases may include using that expansion ROM before Xen boots, hence
no emulation is needed in Xen itself. Or when a guest wants to use the
ROM code which seems to be rare.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c  | 69 +++++++++++++++++++++++++++++++++++++-
 xen/include/xen/pci_regs.h |  1 +
 xen/include/xen/vpci.h     |  3 ++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5218b1af247e..793f79ece831 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -400,12 +400,72 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
 static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
                             uint32_t val, void *data)
 {
+    struct vpci_bar *bar = data;
+    bool hi = false;
+
+    if ( bar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi = true;
+    }
+    else
+        val &= PCI_BASE_ADDRESS_MEM_MASK;
+    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
+    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
 }
 
 static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
                                void *data)
 {
-    return 0xffffffff;
+    struct vpci_bar *bar = data;
+    uint32_t val;
+    bool hi = false;
+
+    switch ( bar->type )
+    {
+    case VPCI_BAR_MEM64_HI:
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi = true;
+        /* fallthrough */
+    case VPCI_BAR_MEM64_LO:
+    {
+        if ( hi )
+            val = bar->guest_addr >> 32;
+        else
+            val = bar->guest_addr & 0xffffffff;
+        if ( (val & PCI_BASE_ADDRESS_MEM_MASK_32) ==  PCI_BASE_ADDRESS_MEM_MASK_32 )
+        {
+            /* Guests detects BAR's properties and sizes. */
+            if ( hi )
+                val = bar->size >> 32;
+            else
+                val = 0xffffffff & ~(bar->size - 1);
+        }
+        if ( !hi )
+        {
+            val |= PCI_BASE_ADDRESS_MEM_TYPE_64;
+            val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+        }
+        bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
+        bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
+        break;
+    }
+    case VPCI_BAR_MEM32:
+    {
+        val = bar->guest_addr;
+        if ( (val & PCI_BASE_ADDRESS_MEM_MASK_32) ==  PCI_BASE_ADDRESS_MEM_MASK_32 )
+            val = 0xffffffff & ~(bar->size - 1);
+        val |= PCI_BASE_ADDRESS_MEM_TYPE_32;
+        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+        break;
+    }
+    default:
+        val = bar->guest_addr;
+        break;
+    }
+    return val;
 }
 
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
@@ -522,6 +582,13 @@ static int add_bar_handlers(struct pci_dev *pdev, bool is_hwdom)
             if ( rc )
                 return rc;
         }
+        /*
+         * It is neither safe nor secure to initialize guest's view of the BARs
+         * with real values which are used by the hardware domain, so assign
+         * all zeros to guest's view of the BARs, so the guest can perform
+         * proper PCI device enumeration and assign BARs on its own.
+         */
+        bars[i].guest_addr = 0;
     }
     return 0;
 }
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index cc4ee3b83e5c..038eb18c5357 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -103,6 +103,7 @@
 #define  PCI_BASE_ADDRESS_MEM_TYPE_64	0x04	/* 64 bit address */
 #define  PCI_BASE_ADDRESS_MEM_PREFETCH	0x08	/* prefetchable? */
 #define  PCI_BASE_ADDRESS_MEM_MASK	(~0x0fUL)
+#define  PCI_BASE_ADDRESS_MEM_MASK_32	(~0x0fU)
 #define  PCI_BASE_ADDRESS_IO_MASK	(~0x03UL)
 /* bit 1 is reserved if address_space = 1 */
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 4aa2941a1081..db86b8e7fa3c 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -77,7 +77,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical view of the BAR. */
             uint64_t addr;
+            /* Guest view of the BAR. */
+            uint64_t guest_addr;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.25.1


