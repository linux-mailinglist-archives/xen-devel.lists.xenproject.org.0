Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36657A598
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370801.602728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFe-0007Tz-TA; Tue, 19 Jul 2022 17:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370801.602728; Tue, 19 Jul 2022 17:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFe-0007QV-PB; Tue, 19 Jul 2022 17:43:18 +0000
Received: by outflank-mailman (input) for mailman id 370801;
 Tue, 19 Jul 2022 17:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFd-00065R-3p
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44a5100f-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:15 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id bp15so28611028ejb.6
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:15 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:14 -0700 (PDT)
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
X-Inumbo-ID: 44a5100f-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OieAisZo52BPPW28GQWLm26fgvpHr9TxOwcPehMBtUc=;
        b=pbAkZHs2Ovwil0XJtD3oLEGPLgaJs45DiqIUbhMdbla4V4G66V2YM4ikeg2qrQ4pQw
         8/LSdMqbJ6E+mFQAt8XRlTJUPgMZN151f6EYkKYb0fAiuBrs1j3fhvSErbv02PkeQa/I
         HPftSqB2NfU1oH77y6mUGxYi+wQvlS8BJZ4adtdukSgrgJcKJqMEJcT0KYcsKrZkvjLI
         TfZL3Pdtbk9ttEqdqFJ+oxV/AEfCxldvFqHsYSm+GIFLEA/anf5hzZ7z5F0keoBc5AWa
         fEl1M9z9MtUXK+uoGvHnRR5q5mbbiskniNEKeZAuXAv112O9QKZTdiOcYjRihdjLy5aB
         u7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OieAisZo52BPPW28GQWLm26fgvpHr9TxOwcPehMBtUc=;
        b=B5EX3oKnMGXGzT9mtd+mXQDh/W/wVN6WSl9D1fHZj8TFbXlFgbqQ74dkIvRWyInHlW
         0LEyGFvvFlq2xp6dTZfRJJFEBaQ/swBl1YOncWUPI2oNnV81UX8o4VbGHvp97bVIgvKS
         /TYt/CUf20Wl7T+aIqwVJ84sZYnnqwFm93sdq46iNwJywdrxcBeTAhyY0YuSIE20RBYK
         rVrX7GWKtfV0LUQJJ415s3OuDwNIyRo/3J8HrqyMfD5rxIavnWSQsrLyK9NoxQuOiVWi
         5ZkUNXfTfiBkItFvBQP/MDQG93Lumd4VTzZhOWPyI1sHO+eZDkK3NkbK85fjoncEr2Mt
         M0pw==
X-Gm-Message-State: AJIora8rznq5QX6q6DFSt8cDkrQb1SAAQZ5xhnP2Xt7d365kGpz1GUI/
	ih2nEPPYc736r2GFLm3WKiiU6ibv6qQu6Q==
X-Google-Smtp-Source: AGRyM1tbRAV2e9n0Nj7kC5Lvvd3jfZNCpCrgvfb24h7ry3pXKn7AQqZZMwhIeAfOW5ccrheE5vPlUQ==
X-Received: by 2002:a17:907:28d4:b0:72b:49c0:d04a with SMTP id en20-20020a17090728d400b0072b49c0d04amr32968382ejc.141.1658252594893;
        Tue, 19 Jul 2022 10:43:14 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 05/11] vpci/header: handle p2m range sets per BAR
Date: Tue, 19 Jul 2022 20:42:47 +0300
Message-Id: <20220719174253.541965-6-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Instead of handling a single range set, that contains all the memory
regions of all the BARs and ROM, have them per BAR.
As the range sets are now created when a PCI device is added and destroyed
when it is removed so make them named and accounted.

Note that rangesets were chosen here despite there being only up to
3 separate ranges in each set (typically just 1). But rangeset per BAR
was chosen for the ease of implementation and existing code re-usability.

This is in preparation of making non-identity mappings in p2m for the MMIOs.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- update according to the new locking scheme
- remove odd fail label in modify_bars
- OT: rebased
Since v5:
- fix comments
- move rangeset allocation to init_bars and only allocate
  for MAPPABLE BARs
- check for overlap with the already setup BAR ranges
Since v4:
- use named range sets for BARs (Jan)
- changes required by the new locking scheme
- updated commit message (Jan)
Since v3:
- re-work vpci_cancel_pending accordingly to the per-BAR handling
- s/num_mem_ranges/map_pending and s/uint8_t/bool
- ASSERT(bar->mem) in modify_bars
- create and destroy the rangesets on add/remove
---
 xen/drivers/vpci/header.c | 241 +++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c   |   5 +
 xen/include/xen/vpci.h    |   3 +-
 3 files changed, 182 insertions(+), 67 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 9fbbdc3500..f14ff11882 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -131,64 +131,106 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    struct pci_dev *pdev = v->vpci.pdev;
+
+    if ( !pdev )
+        return false;
+
+    pcidevs_read_lock();
+
+    if ( v->vpci.map_pending )
     {
         struct map_data data = {
             .d = v->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
         };
-        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
-
-        if ( rc == -ERESTART )
-            return true;
-
-        pcidevs_read_lock();
-        spin_lock(&v->vpci.pdev->vpci->lock);
-        /* Disable memory decoding unconditionally on failure. */
-        modify_decoding(v->vpci.pdev,
-                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
-                        !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci->lock);
-        pcidevs_read_unlock();
-
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem = NULL;
-        if ( rc )
+        struct vpci_header *header = &pdev->vpci->header;
+        unsigned int i;
+
+        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
         {
-            /*
-             * FIXME: in case of failure remove the device from the domain.
-             * Note that there might still be leftover mappings. While this is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
-             */
-            pcidevs_write_lock();
-            vpci_remove_device(v->vpci.pdev);
-            pcidevs_write_unlock();
+            struct vpci_bar *bar = &header->bars[i];
+            int rc;
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+
+            if ( rc == -ERESTART )
+            {
+                pcidevs_read_unlock();
+                return true;
+            }
+
+            spin_lock(&pdev->vpci->lock);
+            /* Disable memory decoding unconditionally on failure. */
+            modify_decoding(pdev, rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY :
+                                       v->vpci.cmd, !rc && v->vpci.rom_only);
+            spin_unlock(&pdev->vpci->lock);
+
+            if ( rc )
+            {
+                /*
+                 * FIXME: in case of failure remove the device from the domain.
+                 * Note that there might still be leftover mappings. While this
+                 * is safe for Dom0, for DomUs the domain needs to be killed in
+                 * order to avoid leaking stale p2m mappings on failure.
+                 */
+                v->vpci.map_pending = false;
+                pcidevs_read_unlock();
+
+                if ( is_hardware_domain(v->domain) )
+                {
+                    pcidevs_write_lock();
+                    vpci_remove_device(v->vpci.pdev);
+                    pcidevs_write_unlock();
+                }
+                else
+                    domain_crash(v->domain);
+
+                return false;
+            }
         }
+
+        v->vpci.map_pending = false;
     }
 
+    pcidevs_read_unlock();
+
     return false;
 }
 
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            struct rangeset *mem, uint16_t cmd)
+                            uint16_t cmd)
 {
     struct map_data data = { .d = d, .map = true };
-    int rc;
+    struct vpci_header *header = &pdev->vpci->header;
+    int rc = 0;
+    unsigned int i;
 
-    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
+    ASSERT(pcidevs_write_locked());
+
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        /*
-         * It's safe to drop and re-acquire the lock in this context
-         * without risking pdev disappearing because devices cannot be
-         * removed until the initial domain has been started.
-         */
-        pcidevs_write_unlock();
-        process_pending_softirqs();
-        pcidevs_write_lock();
+        struct vpci_bar *bar = &header->bars[i];
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) == -ERESTART )
+        {
+            /*
+             * It's safe to drop and reacquire the lock in this context
+             * without risking pdev disappearing because devices cannot be
+             * removed until the initial domain has been started.
+             */
+            pcidevs_write_unlock();
+            process_pending_softirqs();
+            pcidevs_write_lock();
+        }
     }
-    rangeset_destroy(mem);
     if ( !rc )
         modify_decoding(pdev, cmd, false);
 
@@ -196,7 +238,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
 }
 
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr = current;
 
@@ -207,7 +249,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.mem = mem;
+    curr->vpci.map_pending = true;
     curr->vpci.cmd = cmd;
     curr->vpci.rom_only = rom_only;
     /*
@@ -221,43 +263,61 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
-    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
     const struct vpci_msix *msix = pdev->vpci->msix;
-    unsigned int i;
+    unsigned int i, j;
     int rc;
-
-    if ( !mem )
-        return -ENOMEM;
+    bool map_pending;
 
     /*
-     * Create a rangeset that represents the current device BARs memory region
-     * and compare it against all the currently active BAR memory regions. If
-     * an overlap is found, subtract it from the region to be mapped/unmapped.
+     * Create a rangeset per BAR that represents the current device memory
+     * region and compare it against all the currently active BAR memory
+     * regions. If an overlap is found, subtract it from the region to be
+     * mapped/unmapped.
      *
-     * First fill the rangeset with all the BARs of this device or with the ROM
+     * First fill the rangesets with the BARs of this device or with the ROM
      * BAR only, depending on whether the guest is toggling the memory decode
      * bit of the command register, or the enable bit of the ROM BAR register.
      */
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        const struct vpci_bar *bar = &header->bars[i];
+        struct vpci_bar *bar = &header->bars[i];
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
+        if ( !bar->mem )
+            continue;
+
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
             continue;
 
-        rc = rangeset_add_range(mem, start, end);
+        rc = rangeset_add_range(bar->mem, start, end);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start, end, rc);
-            rangeset_destroy(mem);
             return rc;
         }
+
+        /* Check for overlap with the already setup BAR ranges. */
+        for ( j = 0; j < i; j++ )
+        {
+            struct vpci_bar *bar = &header->bars[j];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc = rangeset_remove_range(bar->mem, start, end);
+            if ( rc )
+            {
+                printk(XENLOG_G_WARNING
+                       "Failed to remove overlapping range [%lx, %lx]: %d\n",
+                       start, end, rc);
+                return rc;
+            }
+        }
     }
 
     /* Remove any MSIX regions if present. */
@@ -267,14 +327,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
-        rc = rangeset_remove_range(mem, start, end);
-        if ( rc )
+        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
         {
-            printk(XENLOG_G_WARNING
-                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
-                   start, end, rc);
-            rangeset_destroy(mem);
-            return rc;
+            const struct vpci_bar *bar = &header->bars[j];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc = rangeset_remove_range(bar->mem, start, end);
+            if ( rc )
+            {
+                printk(XENLOG_G_WARNING
+                       "Failed to remove MSIX table [%lx, %lx]: %d\n",
+                       start, end, rc);
+                return rc;
+            }
         }
     }
 
@@ -306,7 +373,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             unsigned long start = PFN_DOWN(bar->addr);
             unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
-            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
+            if ( !bar->enabled ||
+                 !rangeset_overlaps_range(bar->mem, start, end) ||
                  /*
                   * If only the ROM enable bit is toggled check against other
                   * BARs in the same device for overlaps, but not against the
@@ -315,12 +383,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                  (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
                 continue;
 
-            rc = rangeset_remove_range(mem, start, end);
+            rc = rangeset_remove_range(bar->mem, start, end);
             if ( rc )
             {
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
                        start, end, rc);
-                rangeset_destroy(mem);
                 return rc;
             }
         }
@@ -339,10 +406,23 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, mem, cmd);
+        return apply_map(pdev->domain, pdev, cmd);
     }
 
-    defer_map(dev->domain, dev, mem, cmd, rom_only);
+    /* Find out how many memory ranges has left after MSI and overlaps. */
+    map_pending = false;
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        if ( !rangeset_is_empty(header->bars[i].mem) )
+        {
+            map_pending = true;
+            break;
+        }
+
+    /* If there's no mapping work write the command register now. */
+    if ( !map_pending )
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    else
+        defer_map(dev->domain, dev, cmd, rom_only);
 
     return 0;
 }
@@ -525,6 +605,19 @@ static void cf_check rom_write(
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static int bar_add_rangeset(struct pci_dev *pdev, struct vpci_bar *bar, int i)
+{
+    char str[32];
+
+    snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);
+
+    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
+    if ( !bar->mem )
+        return -ENOMEM;
+
+    return 0;
+}
+
 static int cf_check init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -611,6 +704,13 @@ static int cf_check init_bars(struct pci_dev *pdev)
         else
             bars[i].type = VPCI_BAR_MEM32;
 
+        rc = bar_add_rangeset(pdev, &bars[i], i);
+        if ( rc )
+        {
+            bars[i].type = VPCI_BAR_EMPTY;
+            goto fail;
+        }
+
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -661,6 +761,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
                                    rom_reg, 4, rom);
             if ( rc )
                 rom->type = VPCI_BAR_EMPTY;
+            else
+            {
+                rc = bar_add_rangeset(pdev, rom, i);
+                if ( rc )
+                {
+                    rom->type = VPCI_BAR_EMPTY;
+                    goto fail;
+                }
+            }
         }
     }
     else
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d187901422..f683346285 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
+    unsigned int i;
+
     ASSERT(pcidevs_write_locked());
 
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
@@ -54,6 +56,9 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+
+    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
+        rangeset_destroy(pdev->vpci->header.bars[i].mem);
     if ( pdev->vpci->msix && pdev->vpci->msix->pba )
         iounmap(pdev->vpci->msix->pba);
     xfree(pdev->vpci->msix);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6e1d3b93cd..6332659c4a 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -72,6 +72,7 @@ struct vpci {
             /* Guest view of the BAR: address and lower bits. */
             uint64_t guest_reg;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -146,9 +147,9 @@ struct vpci {
 
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct rangeset *mem;
     struct pci_dev *pdev;
     uint16_t cmd;
+    bool map_pending : 1;
     bool rom_only : 1;
 };
 
-- 
2.25.1


