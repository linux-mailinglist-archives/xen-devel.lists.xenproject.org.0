Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F90445FF1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222091.384175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9W-0001Wf-Rc; Fri, 05 Nov 2021 06:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222091.384175; Fri, 05 Nov 2021 06:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9W-0001R3-MT; Fri, 05 Nov 2021 06:56:42 +0000
Received: by outflank-mailman (input) for mailman id 222091;
 Fri, 05 Nov 2021 06:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9V-0008Eb-9o
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:41 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86e6829e-3e05-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:56:40 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id g14so29236259edz.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:40 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:39 -0700 (PDT)
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
X-Inumbo-ID: 86e6829e-3e05-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ov4OeG0y0S9wF384aoMSS8nrG9C7KacWnjexXbSAJKA=;
        b=Ygg8Kw2PgYYWbUaPHVHr3ncCSlDkgVKitIY41ydr4W+kINTYeSzHNrli5PH5igfBJf
         5KVg9L165M5E/gh2/9bgNC36oXtFOvRGx3cqiBCs3wiPvjVHKNA7zvt5y9kobuyNkawp
         s4GEGfD06lo+L5iqn8R6Dq85OFPEiXTbx8la/0M7+GtQ6loojNKAye8xb/uDZqVOLm9A
         vVLHZGGJBP4tsn9OVj73P9YyrWxSjfpwtOgTfc0Cp9b2325M1Fu+/08hztAJuh4D5n84
         2KCSrX9+1wIu8YgMfzPG69sLy6aABux0EgwPN2Tlna/DhsNwP5bm3xOs/r+KdQPJfbIJ
         hleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ov4OeG0y0S9wF384aoMSS8nrG9C7KacWnjexXbSAJKA=;
        b=1O+wZq8mEneiR4sITWrmGqz8+eo/ZMwJOXl3X/Pxptf2YAH+gATF1CP7aSYep4rvJA
         v14DSkIKGMggov8RwpTXgmkFRBiNH2Ao3M/fkRpthoAZtFV6Z1KWggQFEQtpIlXvhNFR
         CyEOqtkESmcm9ZgOsN3VthDPlcNK5AcEWSaX3Yaqcbkfhsi8Hv+1c1OenslamD/ifrTH
         uF0IbfQ2i1kkwGoHT2/MKNoHYKO8zoAR4ZfvI6HjunIcOSQFm8bhLYbxWm/BGskhHXXF
         7JPHXcg3qgkHb29S5MW/0AnChnmZReToSZUllqXDDF15JGfdlka48D67QqW76Cxhl+GO
         AFVw==
X-Gm-Message-State: AOAM532IM9bl5+zV26TVpWskzNTee1jTS9I8AbgeBCbp0e2K5MHobXGz
	F6/XHYMkp6v9p0LXu+PoMGgP48Rn2VBZ5Q==
X-Google-Smtp-Source: ABdhPJzwW/asJb0bvmcPKQN0yvkDuDBQ2D84ldeYdNb020GJuam20MKFJNTL5jXaXCWobIQlP0aZZQ==
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr67588980ejd.425.1636095399489;
        Thu, 04 Nov 2021 23:56:39 -0700 (PDT)
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
Subject: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Date: Fri,  5 Nov 2021 08:56:24 +0200
Message-Id: <20211105065629.940943-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Instead of handling a single range set, that contains all the memory
regions of all the BARs and ROM, have them per BAR.

This is in preparation of making non-identity mappings in p2m for the
MMIOs/ROM.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v3:
- re-work vpci_cancel_pending accordingly to the per-BAR handling
- s/num_mem_ranges/map_pending and s/uint8_t/bool
- ASSERT(bar->mem) in modify_bars
- create and destroy the rangesets on add/remove
---
 xen/drivers/vpci/header.c | 178 ++++++++++++++++++++++++++------------
 xen/drivers/vpci/vpci.c   |  26 +++++-
 xen/include/xen/vpci.h    |   3 +-
 3 files changed, 150 insertions(+), 57 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1239051ee8ff..5fc2dfbbc864 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -131,34 +131,50 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    if ( v->vpci.map_pending )
     {
         struct map_data data = {
             .d = v->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
         };
-        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
+        struct pci_dev *pdev = v->vpci.pdev;
+        struct vpci_header *header = &pdev->vpci->header;
+        unsigned int i;
 
-        if ( rc == -ERESTART )
-            return true;
+        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        {
+            struct vpci_bar *bar = &header->bars[i];
+            int rc;
 
-        spin_lock(&v->vpci.pdev->vpci->lock);
-        /* Disable memory decoding unconditionally on failure. */
-        modify_decoding(v->vpci.pdev,
-                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
-                        !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci->lock);
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
 
-        vpci_cancel_pending(v->vpci.pdev);
-        if ( rc )
-            /*
-             * FIXME: in case of failure remove the device from the domain.
-             * Note that there might still be leftover mappings. While this is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
-             */
-            vpci_remove_device(v->vpci.pdev);
+            rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+
+            if ( rc == -ERESTART )
+                return true;
+
+            spin_lock(&pdev->vpci->lock);
+            /* Disable memory decoding unconditionally on failure. */
+            modify_decoding(pdev,
+                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
+                            !rc && v->vpci.rom_only);
+            spin_unlock(&pdev->vpci->lock);
+
+            if ( rc )
+            {
+                /*
+                 * FIXME: in case of failure remove the device from the domain.
+                 * Note that there might still be leftover mappings. While this is
+                 * safe for Dom0, for DomUs the domain will likely need to be
+                 * killed in order to avoid leaking stale p2m mappings on
+                 * failure.
+                 */
+                vpci_remove_device(pdev);
+                break;
+            }
+        }
+        v->vpci.map_pending = false;
     }
 
     return false;
@@ -169,22 +185,48 @@ void vpci_cancel_pending(const struct pci_dev *pdev)
     struct vcpu *v = current;
 
     /* Cancel any pending work now. */
-    if ( v->vpci.mem && v->vpci.pdev == pdev)
+    if ( v->vpci.map_pending && v->vpci.pdev == pdev)
     {
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem = NULL;
+        struct vpci_header *header = &pdev->vpci->header;
+        unsigned int i;
+        int rc;
+
+        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        {
+            struct vpci_bar *bar = &header->bars[i];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc = rangeset_remove_range(bar->mem, 0, ~0ULL);
+            if ( !rc )
+                printk(XENLOG_ERR
+                       "%pd %pp failed to remove range set for BAR: %d\n",
+                       v->domain, &pdev->sbdf, rc);
+        }
+        v->vpci.map_pending = false;
     }
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
+
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
 
-    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
-        process_pending_softirqs();
-    rangeset_destroy(mem);
+        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) == -ERESTART )
+            process_pending_softirqs();
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
 
@@ -192,7 +234,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
 }
 
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr = current;
 
@@ -203,9 +245,9 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.mem = mem;
     curr->vpci.cmd = cmd;
     curr->vpci.rom_only = rom_only;
+    curr->vpci.map_pending = true;
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
      * execution with pending mapping operations, to trigger the invocation
@@ -217,42 +259,40 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
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
+     * Create a rangeset per BAR that represents the current device memory region
      * and compare it against all the currently active BAR memory regions. If
      * an overlap is found, subtract it from the region to be mapped/unmapped.
      *
-     * First fill the rangeset with all the BARs of this device or with the ROM
+     * First fill the rangesets with all the BARs of this device or with the ROM
      * BAR only, depending on whether the guest is toggling the memory decode
      * bit of the command register, or the enable bit of the ROM BAR register.
      */
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        const struct vpci_bar *bar = &header->bars[i];
+        struct vpci_bar *bar = &header->bars[i];
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
+        ASSERT(bar->mem);
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
-            return rc;
+            goto fail;
         }
     }
 
@@ -263,14 +303,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
+                goto fail;
+            }
         }
     }
 
@@ -302,7 +349,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             unsigned long start = PFN_DOWN(bar->addr);
             unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
-            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
+            if ( !bar->enabled ||
+                 !rangeset_overlaps_range(bar->mem, start, end) ||
                  /*
                   * If only the ROM enable bit is toggled check against other
                   * BARs in the same device for overlaps, but not against the
@@ -311,13 +359,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                  (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
                 continue;
 
-            rc = rangeset_remove_range(mem, start, end);
+            rc = rangeset_remove_range(bar->mem, start, end);
             if ( rc )
             {
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
                        start, end, rc);
-                rangeset_destroy(mem);
-                return rc;
+                goto fail;
             }
         }
     }
@@ -335,12 +382,35 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
+    /*
+     * There are cases when PCI device, root port for example, has neither
+     * memory space nor IO. In this case PCI command register write is
+     * missed resulting in the underlying PCI device not functional, so:
+     *   - if there are no regions write the command register now
+     *   - if there are regions then defer work and write later on
+     */
+    if ( !map_pending )
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    else
+        defer_map(dev->domain, dev, cmd, rom_only);
 
     return 0;
+
+fail:
+    vpci_cancel_pending(pdev);
+    return rc;
 }
 
 static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 5f086398a98c..45733300f00b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -55,7 +55,12 @@ void vpci_remove_device_handlers(const struct pci_dev *pdev)
 
 void vpci_remove_device(struct pci_dev *pdev)
 {
+    struct vpci_header *header = &pdev->vpci->header;
+    unsigned int i;
+
     vpci_cancel_pending(pdev);
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        rangeset_destroy(header->bars[i].mem);
     vpci_remove_device_handlers(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
@@ -80,6 +85,8 @@ static int run_vpci_init(struct pci_dev *pdev)
 
 int vpci_add_handlers(struct pci_dev *pdev)
 {
+    struct vpci_header *header;
+    unsigned int i;
     int rc;
 
     if ( !has_vpci(pdev->domain) )
@@ -95,10 +102,25 @@ int vpci_add_handlers(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
 
+    header = &pdev->vpci->header;
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+
+        bar->mem = rangeset_new(NULL, NULL, 0);
+        if ( !bar->mem )
+        {
+            rc = -ENOMEM;
+            goto fail;
+        }
+    }
+
     rc = run_vpci_init(pdev);
-    if ( rc )
-        vpci_remove_device(pdev);
+    if ( !rc )
+        return 0;
 
+ fail:
+    vpci_remove_device(pdev);
     return rc;
 }
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3e7428da822c..143f3166a730 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -75,6 +75,7 @@ struct vpci {
             /* Guest view of the BAR. */
             uint64_t guest_addr;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -149,9 +150,9 @@ struct vpci {
 
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


