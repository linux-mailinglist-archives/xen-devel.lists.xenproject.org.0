Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB341D4D2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199512.353672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsF-0004Bp-NP; Thu, 30 Sep 2021 07:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199512.353672; Thu, 30 Sep 2021 07:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsF-000497-Gs; Thu, 30 Sep 2021 07:52:59 +0000
Received: by outflank-mailman (input) for mailman id 199512;
 Thu, 30 Sep 2021 07:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqsD-00017f-5g
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:57 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b232defa-7f1f-4f21-a814-d8a592319df9;
 Thu, 30 Sep 2021 07:52:32 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e15so21624994lfr.10
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:32 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:30 -0700 (PDT)
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
X-Inumbo-ID: b232defa-7f1f-4f21-a814-d8a592319df9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UYb/ANGHKxQ/isBZ8jDr5PIwHDVyjvEKH2Wdujmg3Lc=;
        b=WsHQwrDr4Uem1Ds+1pFynepoQjyxeZ3K137PcLJmgDm7Mrrm1d4dj6crZNwwcehEsM
         rGxflMhwppxr+6Em7Ci3Czif9QiZf01ignkNZku1A2kDqHxa5dAstqUNVHxYq4DrTdAe
         FA6fxmriL3u0ohz55idRcIQB7Hof+Ysk65j+f8vxzl9zHHj/ESrkw3INkTBsub6Nc2uN
         ZgEi2Q2Y+Uqdgi7FhVG5x/sfpr1/QFBKHfNzcXPy4itnubQpBs585W8SvHSQF0HeBWNK
         wRF+reCZw69rw/RCSITlGRJwLzXYfOEH4H0fLtextUzkDroqcXaPYTayGMsYeLMXoG5M
         tfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UYb/ANGHKxQ/isBZ8jDr5PIwHDVyjvEKH2Wdujmg3Lc=;
        b=4zAgsL6XanX8+iKOPhsRXjsQlYX/hUouKk6oyNSNTbs6sb8Rl5/b1TFX+WGj6CQ04t
         6602IAcLo65bYVIWWmNAkBiSJwyw9Iw8o1cKQBDogATvh3dACclIxwFFCD/VyfBE2ZYI
         JQeBOLMvJd+T1BLFPvIA5T4FnyL1NrKbw7JRvMLA3Ng+rnSzgmNa39lgmsRuQkmm+urB
         3fA9SFbay3JoPM3ifX6n4GJqSNcajW098UjhYaofQhCaFCln6yFxbIDYJDKbhaUuTpNN
         B7ga0FmEYwq2qfVg6C8PhFxmjjfDIZODhirwWtdoM/ZmNgnG3/2FmgCargyb6G35vGsI
         /9wg==
X-Gm-Message-State: AOAM530O8wjJY05sKi9HCdsCe+GuNhpnXAA0V5SrKyb0WQIlTHiFx2Sf
	B7pducG1RTtofNuGpj3lWTJONTp0g68=
X-Google-Smtp-Source: ABdhPJxtPd0OLutL4StYyqSyghgjofxpr4rhGLOzhT+xWd9gDCurFN9nBS2/pZyCBlB8otMRHCex5g==
X-Received: by 2002:a05:6512:c9:: with SMTP id c9mr4363608lfp.142.1632988351070;
        Thu, 30 Sep 2021 00:52:31 -0700 (PDT)
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
Subject: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Date: Thu, 30 Sep 2021 10:52:18 +0300
Message-Id: <20210930075223.860329-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Instead of handling a single range set, that contains all the memory
regions of all the BARs and ROM, have them per BAR.

This is in preparation of making non-identity mappings in p2m for the
MMIOs/ROM.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 172 ++++++++++++++++++++++++++------------
 xen/include/xen/vpci.h    |   3 +-
 2 files changed, 122 insertions(+), 53 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec4d215f36ff..9c603d26d302 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -131,49 +131,75 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    if ( v->vpci.num_mem_ranges )
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
+            if ( !bar->mem )
+                continue;
 
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem = NULL;
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
+            rangeset_destroy(bar->mem);
+            bar->mem = NULL;
+            v->vpci.num_mem_ranges--;
+            if ( rc )
+                /*
+                 * FIXME: in case of failure remove the device from the domain.
+                 * Note that there might still be leftover mappings. While this is
+                 * safe for Dom0, for DomUs the domain will likely need to be
+                 * killed in order to avoid leaking stale p2m mappings on
+                 * failure.
+                 */
+                vpci_remove_device(pdev);
+        }
     }
 
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
+
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
 
-    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
-        process_pending_softirqs();
-    rangeset_destroy(mem);
+        if ( !bar->mem )
+            continue;
+
+        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) == -ERESTART )
+            process_pending_softirqs();
+        rangeset_destroy(bar->mem);
+        bar->mem = NULL;
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
 
@@ -181,7 +207,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
 }
 
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only, uint8_t num_mem_ranges)
 {
     struct vcpu *curr = current;
 
@@ -192,9 +218,9 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev = pdev;
-    curr->vpci.mem = mem;
     curr->vpci.cmd = cmd;
     curr->vpci.rom_only = rom_only;
+    curr->vpci.num_mem_ranges = num_mem_ranges;
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
      * execution with pending mapping operations, to trigger the invocation
@@ -206,42 +232,47 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
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
+    uint8_t num_mem_ranges;
 
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
 
+        bar->mem = NULL;
+
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
             continue;
 
-        rc = rangeset_add_range(mem, start, end);
+        bar->mem = rangeset_new(NULL, NULL, 0);
+        if ( !bar->mem )
+        {
+            rc = -ENOMEM;
+            goto fail;
+        }
+
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
 
@@ -252,14 +283,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
+            if ( !bar->mem )
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
 
@@ -291,7 +329,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             unsigned long start = PFN_DOWN(bar->addr);
             unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
 
-            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
+            if ( !bar->enabled ||
+                 !rangeset_overlaps_range(bar->mem, start, end) ||
                  /*
                   * If only the ROM enable bit is toggled check against other
                   * BARs in the same device for overlaps, but not against the
@@ -300,13 +339,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
@@ -324,12 +362,42 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, mem, cmd);
+        return apply_map(pdev->domain, pdev, cmd);
     }
 
-    defer_map(dev->domain, dev, mem, cmd, rom_only);
+    /* Find out how many memory ranges has left after MSI and overlaps. */
+    num_mem_ranges = 0;
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+
+        if ( !rangeset_is_empty(bar->mem) )
+            num_mem_ranges++;
+    }
+
+    /*
+     * There are cases when PCI device, root port for example, has neither
+     * memory space nor IO. In this case PCI command register write is
+     * missed resulting in the underlying PCI device not functional, so:
+     *   - if there are no regions write the command register now
+     *   - if there are regions then defer work and write later on
+     */
+    if ( !num_mem_ranges )
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    else
+        defer_map(dev->domain, dev, cmd, rom_only, num_mem_ranges);
 
     return 0;
+
+fail:
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
+        struct vpci_bar *bar = &header->bars[i];
+
+        rangeset_destroy(bar->mem);
+        bar->mem = NULL;
+    }
+    return rc;
 }
 
 static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index a0320b22cb36..352e02d0106d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,6 +80,7 @@ struct vpci {
             /* Guest view of the BAR. */
             uint64_t guest_addr;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -154,9 +155,9 @@ struct vpci {
 
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct rangeset *mem;
     struct pci_dev *pdev;
     uint16_t cmd;
+    uint8_t num_mem_ranges;
     bool rom_only : 1;
 };
 
-- 
2.25.1


