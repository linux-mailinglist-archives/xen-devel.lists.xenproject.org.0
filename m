Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40845D8AE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230879.399185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWv-0003Im-Ov; Thu, 25 Nov 2021 11:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230879.399185; Thu, 25 Nov 2021 11:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWv-0003AW-Fy; Thu, 25 Nov 2021 11:03:05 +0000
Received: by outflank-mailman (input) for mailman id 230879;
 Thu, 25 Nov 2021 11:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWt-0001K8-CC
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:03 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4218a690-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:03:02 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id bu18so15489161lfb.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:02 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:01 -0800 (PST)
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
X-Inumbo-ID: 4218a690-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+IzydKHdJygtefHSBhDUYSHyy89TbaBO8s7u4ieLkg=;
        b=ph97ktYAdzOhWjuIz9sTV0tBn0nTxfzF89jNMYPHNw9sIrPDgKIX/dn9UYZUWn5Qvo
         WQp/qb9S6xSR3MONRkDU8o0RKYtBC7ZxF6LUTnU6c0ThCCeGxFE1aglOLTQWPFq2mNMv
         ZM0C9nb1n0hTRYksRTNy7KVdrVqCMWtq3ua+76LKq04OoQlF4Q4Ro62wCPBmEBC4AzMP
         OATAC0f3dkRk/CGBFFTlS/9l8crAtSMmEKFFd49S0EtZZ0ELznLgxugFIiXqU5Bh5NWl
         emjxazNH2BrNCDxDrkpkxRIjLHyZeoFnnUxP8vX4ru0P1U4+Idyh5/wBPg/wiMpoiS7I
         loWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+IzydKHdJygtefHSBhDUYSHyy89TbaBO8s7u4ieLkg=;
        b=GJPxTqDGKHs/ihoFM2nP4jOYVEVut6Eck1Nvz3tQVnPBeKi6G2L0jU8GRWO/r525ND
         AfqCT0uWvTmGixp/NulizKxLBZDQglOj9Pzg6Nm+UAdpDoZnTbe+EgZ95joxO7PA+beY
         DMW7emomuB6gI4BVmYawt45cE0EJT6E4sI3kOCh3yzhTc8mBhqsWz7IikxLwcng4HfVh
         uLhp70vFn75kgPfKJavepmY2Zx7pzBAXkL6qRT5UJs4nDWnb4hSOCx5a+ycGy/QZ0R8h
         epSPWYxpW1uOPRRtp3ttzVJZiC+6R7U7yUmTDOlQsjKXK7zmaZskL6c4ERmTD9K72V+C
         Wzig==
X-Gm-Message-State: AOAM530PZjXkQ2eXRM7PM6zrmNAdWwubi1pa5hjsOoiqzKfOh7iAI2L0
	uZUn0ha/EhAvja6uFCD84REOlhusQI4AQA==
X-Google-Smtp-Source: ABdhPJy8wI74HkKqpkhUCTmVZjQSZRS/HDZXqAarTk1y6geijO/HfiIwnyEwRYpA2iUuDDNcFUpddQ==
X-Received: by 2002:a05:6512:3ca1:: with SMTP id h33mr22339207lfv.640.1637838181712;
        Thu, 25 Nov 2021 03:03:01 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 06/14] vpci/header: implement guest BAR register handlers
Date: Thu, 25 Nov 2021 13:02:43 +0200
Message-Id: <20211125110251.2877218-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

ROM BAR is only handled for the hardware domain and for guest domains
there is a stub: at the moment PCI expansion ROM handling is supported
for x86 only and it might not be used by other architectures without
emulating x86. Other use-cases may include using that expansion ROM before
Xen boots, hence no emulation is needed in Xen itself. Or when a guest
wants to use the ROM code which seems to be rare.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v4:
- updated commit message
- s/guest_addr/guest_reg
Since v3:
- squashed two patches: dynamic add/remove handlers and guest BAR
  handler implementation
- fix guest BAR read of the high part of a 64bit BAR (Roger)
- add error handling to vpci_assign_device
- s/dom%pd/%pd
- blank line before return
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
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment
---
 xen/drivers/vpci/header.c | 72 +++++++++++++++++++++++++++++++++++----
 xen/include/xen/vpci.h    |  3 ++
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ba333fb2f9b0..8880d34ebf8e 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -433,6 +433,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
+static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t val, void *data)
+{
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
+    {
+        val &= PCI_BASE_ADDRESS_MEM_MASK;
+        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
+                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
+        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+    }
+
+    bar->guest_reg &= ~(0xffffffffull << (hi ? 32 : 0));
+    bar->guest_reg |= (uint64_t)val << (hi ? 32 : 0);
+
+    bar->guest_reg &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
+}
+
+static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
+                               void *data)
+{
+    const struct vpci_bar *bar = data;
+    bool hi = false;
+
+    if ( bar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi = true;
+    }
+
+    return bar->guest_reg >> (hi ? 32 : 0);
+}
+
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
@@ -481,6 +523,17 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
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
 static int init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -489,6 +542,7 @@ static int init_bars(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
 
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
@@ -528,8 +582,10 @@ static int init_bars(struct pci_dev *pdev)
         if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
         {
             bars[i].type = VPCI_BAR_MEM64_HI;
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
-                                   4, &bars[i]);
+            rc = vpci_add_register(pdev->vpci,
+                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
+                                   is_hwdom ? bar_write : guest_bar_write,
+                                   reg, 4, &bars[i]);
             if ( rc )
             {
                 pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
@@ -569,8 +625,10 @@ static int init_bars(struct pci_dev *pdev)
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
-                               &bars[i]);
+        rc = vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
+                               is_hwdom ? bar_write : guest_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
         {
             pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
@@ -590,8 +648,10 @@ static int init_bars(struct pci_dev *pdev)
         header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
                               PCI_ROM_ADDRESS_ENABLE;
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
-                               4, rom);
+        rc = vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_rom_read,
+                               is_hwdom ? rom_write : guest_rom_write,
+                               rom_reg, 4, rom);
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
     }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index ed127a08a953..0a73b14a92dc 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -68,7 +68,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical view of the BAR. */
             uint64_t addr;
+            /* Guest view of the BAR: address and lower bits. */
+            uint64_t guest_reg;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.25.1


