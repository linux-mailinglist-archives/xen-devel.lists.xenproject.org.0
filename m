Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3206445FE9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222090.384165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9V-0001EC-Cw; Fri, 05 Nov 2021 06:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222090.384165; Fri, 05 Nov 2021 06:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9V-00018H-7l; Fri, 05 Nov 2021 06:56:41 +0000
Received: by outflank-mailman (input) for mailman id 222090;
 Fri, 05 Nov 2021 06:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9T-0008Eb-Mr
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861e9070-3e05-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:56:38 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id f4so29495659edx.12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:38 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:37 -0700 (PDT)
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
X-Inumbo-ID: 861e9070-3e05-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ML1aAu3IHztXCkFRlcAEFUek/kmwkbVwdWAMwIa7IiY=;
        b=B+kLXAGSoP5K67q+UjBfKNTD07Hi8tXBKZLuFqxX1ybcLGn6BehgY/xDJFrLTcoL/P
         2KTYZxueyCl84lqK9QCrmfVdk3xpuuNI5eQXRzEA9wjKSZKSd8K2jtyEf6k6qiB7yxCJ
         s6LRoVrhDoG9Ro1fEEaw8EvoPdbSVouXPqeT13NrKyyMibrHi2y7xgxi23UWK3elpIfu
         zZVJI3Yrl5M7E4D/DczQ8NxtOx6U+iMrgOGq+9TJiSGgRe/nN9Ir+XH/EhVO8jrJFpT1
         7op+WMUShlFkxkQUnYlDzuzQyG7Yo+fVBW76d3tXmiImIkGYmMTWEtFPcdGbOM01AhWH
         iXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ML1aAu3IHztXCkFRlcAEFUek/kmwkbVwdWAMwIa7IiY=;
        b=WKMa7fmMdYIGPeWdjEzMa6pmHm8/mswW16zy0o9zMogtw76+hBhCKlfHvjIt1dZTvE
         VelJL1KPJXwSMT8FZ1+Q8GzqJFeyIH+lgfOjgi9PV+IFPpL7WO78SH/KLweaeddvUGqx
         idOxgXwndzDgXikB1DEhFFes1uvD1Azzdb1wRSUFj6xuOZc5hifbYKkcZ5k/uJ5V6GKm
         2RdViZzRDlsOSe/dmLFq7DOV4jLH6b+SN87ZxGH9++yzoeLDEyBo2Rn6u4bwE3busSRG
         beUp1OaQJj2gA5LdUV6yTNjg2JwgZAVidJeW0K++jzLBgNrA57ilfw6lLiGgvlugS2vf
         oQpQ==
X-Gm-Message-State: AOAM532rBehjrUnER4975Muz97aRjxy7Kort4MQXgqrQVrhvUrqVLIYK
	v2o8R2Ox4BJvOaewl7xm9aJIzlOqMHX8cw==
X-Google-Smtp-Source: ABdhPJxj//nL6Afs0JcLrsOFV1xEzm8zxoqIz8BOeE7e8dGiIwXDkh0VQ5NF5uzvT6GZpOM6XJun2g==
X-Received: by 2002:a17:907:6e16:: with SMTP id sd22mr55367485ejc.542.1636095398279;
        Thu, 04 Nov 2021 23:56:38 -0700 (PDT)
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
Subject: [PATCH v4 05/11] vpci/header: implement guest BAR register handlers
Date: Fri,  5 Nov 2021 08:56:23 +0200
Message-Id: <20211105065629.940943-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
there is a stub: at the moment PCI expansion ROM is x86 only, so it
might not be used by other architectures without emulating x86. Other
use-cases may include using that expansion ROM before Xen boots, hence
no emulation is needed in Xen itself. Or when a guest wants to use the
ROM code which seems to be rare.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
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
index ef538386e95d..1239051ee8ff 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -408,6 +408,48 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
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
+    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
+    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
+
+    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
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
+    return bar->guest_addr >> (hi ? 32 : 0);
+}
+
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
@@ -456,6 +498,17 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
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
@@ -464,6 +517,7 @@ static int init_bars(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
 
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
@@ -503,8 +557,10 @@ static int init_bars(struct pci_dev *pdev)
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
@@ -544,8 +600,10 @@ static int init_bars(struct pci_dev *pdev)
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
@@ -565,8 +623,10 @@ static int init_bars(struct pci_dev *pdev)
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
index a016b4197801..3e7428da822c 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -70,7 +70,10 @@ struct vpci {
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


