Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068145D8AF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230881.399201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWy-0003sf-Kz; Thu, 25 Nov 2021 11:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230881.399201; Thu, 25 Nov 2021 11:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWy-0003mn-65; Thu, 25 Nov 2021 11:03:08 +0000
Received: by outflank-mailman (input) for mailman id 230881;
 Thu, 25 Nov 2021 11:03:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWv-0001K8-9h
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:05 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42e42885-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:03:03 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id bi37so15338748lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:03 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:02 -0800 (PST)
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
X-Inumbo-ID: 42e42885-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0goulj3ILS644tMO0YQq9bXnR7rW90qkHRTjF7tQQeI=;
        b=UrJyj4FUG1x0ALg9aBFoWluXc+IWI6+0EtF3UzJs890N/iRq9y5FZKVzwwC4gBXECI
         nGmd69BrCY6TWf2NqUKbjDqorFirlsTLuvE9P8VZj0H+oRudkXtSlnzZBZnyoNV29js/
         W5pkmWeN8OGJ8ua/UKfe8R97sHbWv3zEWQbDmUV0MfKNMdmqShf1ei/rLkIV0Ewa321h
         LuM4G7ti8ZT9Ke76YcoJVQ2ZYy9rl14oFUzH/KlQTPcsUrTPNZQKpacmDa3fZopAxdIA
         AoVcWwFyzcsy3lgPPh2vC/kiCBj2yoDjsRvhoqbBdUSq0/e7PNWFYTI0tsmUCL4D4uQI
         681A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0goulj3ILS644tMO0YQq9bXnR7rW90qkHRTjF7tQQeI=;
        b=XfFLWWTwXkce4/2v9+teLPSdwrT5BSVOewOn71QQi++uJQiq/JaI3Ylmrk2WVTKVp4
         yMQRI2UNKGSyZCKsyfXifySvHRXRvt5SVf30QnM7oWiWvMAk/0cxwDgEHeq1FdKuZJ/D
         MJUnx0k8CpDUZNA4Ee32rplyKqdIcusjJ2mgVxH3UafHXbuaaUT4b+wB42udHJlPXXlt
         TUCFWNes93Ug1ytofyFoKNLOiPX5/1HvN6N6T0iz2/jTmqAUYEeJzRvYtf7VNdQP5XOj
         1PAaCQvZSHmBg9SWyXRylG9+9Fv23T692RVCl+nWAxMACSRTMtX5fQmWDjhnMwtgT0OI
         BDKA==
X-Gm-Message-State: AOAM532DEHW0ea5NQjLhBEEEE8oWRGkDcIBCMA6SrjmS32Bjmj00LIc1
	THhap8OyRj4wK2RXWmjJZYEPCAyoKi9mTg==
X-Google-Smtp-Source: ABdhPJwTcrZIWmWIhIhIwdty/jDoU586b73+ZP2UFSd0S42UDaitxbH9WPRBAHPwrG/NuXfedaESIg==
X-Received: by 2002:a05:6512:3b9c:: with SMTP id g28mr23026819lfv.651.1637838183031;
        Thu, 25 Nov 2021 03:03:03 -0800 (PST)
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
Subject: [PATCH v5 07/14] vpci/header: handle p2m range sets per BAR
Date: Thu, 25 Nov 2021 13:02:44 +0200
Message-Id: <20211125110251.2877218-8-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
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

This is in preparation of making non-identity mappings in p2m for the
MMIOs/ROM.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
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
 xen/drivers/vpci/header.c | 190 +++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c   |  30 +++++-
 xen/include/xen/vpci.h    |   3 +-
 3 files changed, 166 insertions(+), 57 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 8880d34ebf8e..cc49aa68886f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -137,45 +137,86 @@ bool vpci_process_pending(struct vcpu *v)
         return false;
 
     spin_lock(&pdev->vpci_lock);
-    if ( !pdev->vpci_cancel_pending && v->vpci.mem )
+    if ( !pdev->vpci )
+    {
+        spin_unlock(&pdev->vpci_lock);
+        return false;
+    }
+
+    if ( !pdev->vpci_cancel_pending && v->vpci.map_pending )
     {
         struct map_data data = {
             .d = v->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
         };
-        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
+        struct vpci_header *header = &pdev->vpci->header;
+        unsigned int i;
 
-        if ( rc == -ERESTART )
+        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
         {
-            spin_unlock(&pdev->vpci_lock);
-            return true;
-        }
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
+                spin_unlock(&pdev->vpci_lock);
+                return true;
+            }
 
-        if ( pdev->vpci )
             /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev,
-                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
+            modify_decoding(pdev, rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
                             !rc && v->vpci.rom_only);
 
-        if ( rc )
-        {
-            /*
-             * FIXME: in case of failure remove the device from the domain.
-             * Note that there might still be leftover mappings. While this is
-             * safe for Dom0, for DomUs the domain needs to be killed in order
-             * to avoid leaking stale p2m mappings on failure.
-             */
-            if ( is_hardware_domain(v->domain) )
-                vpci_remove_device_locked(pdev);
-            else
-                domain_crash(v->domain);
+            if ( rc )
+            {
+                /*
+                 * FIXME: in case of failure remove the device from the domain.
+                 * Note that there might still be leftover mappings. While this is
+                 * safe for Dom0, for DomUs the domain needs to be killed in order
+                 * to avoid leaking stale p2m mappings on failure.
+                 */
+                if ( is_hardware_domain(v->domain) )
+                    vpci_remove_device_locked(pdev);
+                else
+                    domain_crash(v->domain);
+
+                break;
+            }
         }
+
+        v->vpci.map_pending = false;
     }
     spin_unlock(&pdev->vpci_lock);
 
     return false;
 }
 
+static void vpci_bar_remove_ranges(const struct pci_dev *pdev)
+{
+    struct vpci_header *header = &pdev->vpci->header;
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        rc = rangeset_remove_range(bar->mem, 0, ~0ULL);
+        if ( !rc )
+            printk(XENLOG_ERR
+                   "%pd %pp failed to remove range set for BAR: %d\n",
+                   pdev->domain, &pdev->sbdf, rc);
+    }
+}
+
 void vpci_cancel_pending_locked(struct pci_dev *pdev)
 {
     struct vcpu *v;
@@ -185,23 +226,33 @@ void vpci_cancel_pending_locked(struct pci_dev *pdev)
     /* Cancel any pending work now on all vCPUs. */
     for_each_vcpu( pdev->domain, v )
     {
-        if ( v->vpci.mem && (v->vpci.pdev == pdev) )
+        if ( v->vpci.map_pending && (v->vpci.pdev == pdev) )
         {
-            rangeset_destroy(v->vpci.mem);
-            v->vpci.mem = NULL;
+            vpci_bar_remove_ranges(pdev);
+            v->vpci.map_pending = false;
         }
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
 
-    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
-        process_pending_softirqs();
-    rangeset_destroy(mem);
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) == -ERESTART )
+            process_pending_softirqs();
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
 
@@ -209,7 +260,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
 }
 
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr = current;
 
@@ -220,7 +271,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.mem = mem;
+    curr->vpci.map_pending = true;
     curr->vpci.cmd = cmd;
     curr->vpci.rom_only = rom_only;
     /*
@@ -234,42 +285,40 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
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
 
@@ -280,14 +329,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
 
@@ -325,7 +381,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             unsigned long start = PFN_DOWN(bar->addr);
             unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
-            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
+            if ( !bar->enabled ||
+                 !rangeset_overlaps_range(bar->mem, start, end) ||
                  /*
                   * If only the ROM enable bit is toggled check against other
                   * BARs in the same device for overlaps, but not against the
@@ -334,14 +391,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                  (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
                 continue;
 
-            rc = rangeset_remove_range(mem, start, end);
+            rc = rangeset_remove_range(bar->mem, start, end);
             if ( rc )
             {
                 spin_unlock(&tmp->vpci_lock);
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
                        start, end, rc);
-                rangeset_destroy(mem);
-                return rc;
+                goto fail;
             }
         }
         spin_unlock(&tmp->vpci_lock);
@@ -360,12 +416,36 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
+    /* Destroy all the ranges we may have added. */
+    vpci_bar_remove_ranges(pdev);
+    return rc;
 }
 
 static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a9e9e8ec438c..98b12a61be6f 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -52,11 +52,16 @@ static void vpci_remove_device_handlers_locked(struct pci_dev *pdev)
 
 void vpci_remove_device_locked(struct pci_dev *pdev)
 {
+    struct vpci_header *header = &pdev->vpci->header;
+    unsigned int i;
+
     ASSERT(spin_is_locked(&pdev->vpci_lock));
 
     pdev->vpci_cancel_pending = true;
     vpci_remove_device_handlers_locked(pdev);
     vpci_cancel_pending_locked(pdev);
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        rangeset_destroy(header->bars[i].mem);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
@@ -92,6 +97,8 @@ static int run_vpci_init(struct pci_dev *pdev)
 int vpci_add_handlers(struct pci_dev *pdev)
 {
     struct vpci *vpci;
+    struct vpci_header *header;
+    unsigned int i;
     int rc;
 
     if ( !has_vpci(pdev->domain) )
@@ -108,11 +115,32 @@ int vpci_add_handlers(struct pci_dev *pdev)
     pdev->vpci = vpci;
     INIT_LIST_HEAD(&pdev->vpci->handlers);
 
+    header = &pdev->vpci->header;
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+        char str[32];
+
+        snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);
+        bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
+        if ( !bar->mem )
+        {
+            rc = -ENOMEM;
+            goto fail;
+        }
+    }
+
     rc = run_vpci_init(pdev);
     if ( rc )
-        vpci_remove_device_locked(pdev);
+        goto fail;
+
     spin_unlock(&pdev->vpci_lock);
 
+    return 0;
+
+ fail:
+    vpci_remove_device_locked(pdev);
+    spin_unlock(&pdev->vpci_lock);
     return rc;
 }
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0a73b14a92dc..18319fc329f9 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -73,6 +73,7 @@ struct vpci {
             /* Guest view of the BAR: address and lower bits. */
             uint64_t guest_reg;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -147,9 +148,9 @@ struct vpci {
 
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


