Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727B2AB89E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22475.48846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dY-0004K6-3f; Mon, 09 Nov 2020 12:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22475.48846; Mon, 09 Nov 2020 12:51:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dX-0004J9-Us; Mon, 09 Nov 2020 12:51:07 +0000
Received: by outflank-mailman (input) for mailman id 22475;
 Mon, 09 Nov 2020 12:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dW-0003tf-Gq
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:06 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9df39a4f-6d66-4634-bf58-8d1c09321705;
 Mon, 09 Nov 2020 12:50:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r17so4485213ljg.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:41 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:40 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dW-0003tf-Gq
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:06 +0000
X-Inumbo-ID: 9df39a4f-6d66-4634-bf58-8d1c09321705
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9df39a4f-6d66-4634-bf58-8d1c09321705;
	Mon, 09 Nov 2020 12:50:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r17so4485213ljg.5
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4uUYf7LbdujIXi0hlvWg2yt1O+62hgozBNucQm/XVxE=;
        b=nuwE9B9bn+tdWxbabj0uNIsC6wr3xTqxw523yvetQHGv9ujFCwj5IpveMzBLiEuxW5
         CzBHsvYtNJNSfdoCNVPN2gibjCnBV8cmoZ/G182Pq7LZ/B6bSc4p46PfxWc20qhTq4bf
         yJ5H6rcqP5nWWjUHaiFILNhnbohX21o/MgrRAUU9q3byvwB4QQlNfCcalA2T4plp6Mry
         czXMqb2Yt3f0tjy9mMUWuTWC8I8AFmbkZoRFT/pprF5e0ye9ZfPZedRyyewF7DGHSvz+
         xFNpUVJW6vsMfeXp/zN/ln613ZS9gXC5/BwunyyBjkN6wxXaIA1M1qDBwisLr3i3yREW
         L5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4uUYf7LbdujIXi0hlvWg2yt1O+62hgozBNucQm/XVxE=;
        b=tGA1NsK2O635NrFwhsWnHTHJKbbs6b067pV9K8s+DGJoSdby3N54iy9wlncmhtK+PT
         +IhrmiHmDEKhkHFXc/cUYhxTC4OPhdYpu0hqFZ0pmoLX4G29iwpZ2JFMqt7ig/Jxd6j/
         DbRQISp0HZ3eIxfSLXfUKSlQkmcAjK8ZjGVXQVe/o1urdo35vq74upQ1WhytXkcMMWQn
         58vKLkwSPGAsZ4jx5TqgU9QcPPuaNBJenqSPl2HFWLxzfwOXUUCBwu5ieP5I/GKSWXF7
         62+P5b2YwNNv9uVRzj5vGof7Talwc9YU4lY9TgjuYVjdFjWS1fopqhK+O4xFjzJr3Fth
         VC6A==
X-Gm-Message-State: AOAM5339VLqtFA/TXl2oWsuZcwg+1rO2EbTCqMc3LLkGUI0RogmCRcAW
	xDNsld7jwa/3h8v0K6gN+eM=
X-Google-Smtp-Source: ABdhPJzEeHBOgXtCrM/P1zLK3bmDqq8tzFO+IcwdqhxWfb94Tao7VH7AAbtiw041BJADLaam0L9ihA==
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr5764786ljn.139.1604926240752;
        Mon, 09 Nov 2020 04:50:40 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:40 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 06/10] vpci: Make every domain handle its own BARs
Date: Mon,  9 Nov 2020 14:50:27 +0200
Message-Id: <20201109125031.26409-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment there is an identity mapping between how a guest sees its
BARs and how they are programmed into guest domain's p2m. This is not
going to work as guest domains have their own view on the BARs.
Extend existing vPCI BAR handling to allow every domain to have its own
view of the BARs: only hardware domain sees physical memory addresses in
this case and for the rest those are emulated, including logic required
for the guests to detect memory sizes and properties.

While emulating BAR access for the guests create a link between the
virtual BAR address and physical one: use full memory address while
creating range sets used to map/unmap corresponding address spaces and
exploit the fact that PCI BAR value doesn't use 8 lower bits of the
memory address. Use those bits to pass physical BAR's index, so we can
build/remove proper p2m mappings.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 276 ++++++++++++++++++++++++++++++++++----
 xen/drivers/vpci/vpci.c   |   1 +
 xen/include/xen/vpci.h    |  24 ++--
 3 files changed, 265 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f74f728884c0..7dc7c70e24f2 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -31,14 +31,87 @@
 struct map_data {
     struct domain *d;
     bool map;
+    struct pci_dev *pdev;
 };
 
+static struct vpci_header *get_vpci_header(struct domain *d,
+                                           const struct pci_dev *pdev);
+
+static struct vpci_header *get_hwdom_vpci_header(const struct pci_dev *pdev)
+{
+    if ( unlikely(list_empty(&pdev->vpci->headers)) )
+        return get_vpci_header(hardware_domain, pdev);
+
+    /* hwdom's header is always the very first entry. */
+    return list_first_entry(&pdev->vpci->headers, struct vpci_header, node);
+}
+
+static struct vpci_header *get_vpci_header(struct domain *d,
+                                           const struct pci_dev *pdev)
+{
+    struct list_head *prev;
+    struct vpci_header *header;
+    struct vpci *vpci = pdev->vpci;
+
+    list_for_each( prev, &vpci->headers )
+    {
+        struct vpci_header *this = list_entry(prev, struct vpci_header, node);
+
+        if ( this->domain_id == d->domain_id )
+            return this;
+    }
+    printk(XENLOG_DEBUG "--------------------------------------" \
+           "Adding new vPCI BAR headers for domain %d: " PRI_pci" \n",
+           d->domain_id, pdev->sbdf.seg, pdev->sbdf.bus,
+           pdev->sbdf.dev, pdev->sbdf.fn);
+    header = xzalloc(struct vpci_header);
+    if ( !header )
+    {
+        printk(XENLOG_ERR
+               "Failed to add new vPCI BAR headers for domain %d: " PRI_pci" \n",
+               d->domain_id, pdev->sbdf.seg, pdev->sbdf.bus,
+               pdev->sbdf.dev, pdev->sbdf.fn);
+        return NULL;
+    }
+
+    if ( !is_hardware_domain(d) )
+    {
+        struct vpci_header *hwdom_header = get_hwdom_vpci_header(pdev);
+
+        /* Make a copy of the hwdom's BARs as the initial state for vBARs. */
+        memcpy(header, hwdom_header, sizeof(*header));
+    }
+
+    header->domain_id = d->domain_id;
+    list_add_tail(&header->node, &vpci->headers);
+    return header;
+}
+
+static struct vpci_bar *get_vpci_bar(struct domain *d,
+                                     const struct pci_dev *pdev,
+                                     int bar_idx)
+{
+    struct vpci_header *vheader;
+
+    vheader = get_vpci_header(d, pdev);
+    if ( !vheader )
+        return NULL;
+
+    return &vheader->bars[bar_idx];
+}
+
 static int map_range(unsigned long s, unsigned long e, void *data,
                      unsigned long *c)
 {
     const struct map_data *map = data;
-    int rc;
-
+    unsigned long mfn;
+    int rc, bar_idx;
+    struct vpci_header *header = get_hwdom_vpci_header(map->pdev);
+
+    bar_idx = s & ~PCI_BASE_ADDRESS_MEM_MASK;
+    s = PFN_DOWN(s);
+    e = PFN_DOWN(e);
+    mfn = _mfn(PFN_DOWN(header->bars[bar_idx].addr));
     for ( ; ; )
     {
         unsigned long size = e - s + 1;
@@ -52,11 +125,15 @@ static int map_range(unsigned long s, unsigned long e, void *data,
          * - {un}map_mmio_regions doesn't support preemption.
          */
 
-        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
+        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, mfn)
+                      : unmap_mmio_regions(map->d, _gfn(s), size, mfn);
         if ( rc == 0 )
         {
-            *c += size;
+            /*
+             * Range set is not expressed in frame numbers and the size
+             * is the number of frames, so update accordingly.
+             */
+            *c += size << PAGE_SHIFT;
             break;
         }
         if ( rc < 0 )
@@ -67,8 +144,9 @@ static int map_range(unsigned long s, unsigned long e, void *data,
             break;
         }
         ASSERT(rc < size);
-        *c += rc;
+        *c += rc << PAGE_SHIFT;
         s += rc;
+        mfn += rc;
         if ( general_preempt_check() )
                 return -ERESTART;
     }
@@ -84,7 +162,7 @@ static int map_range(unsigned long s, unsigned long e, void *data,
 static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
                             bool rom_only)
 {
-    struct vpci_header *header = &pdev->vpci->header;
+    struct vpci_header *header = get_hwdom_vpci_header(pdev);
     bool map = cmd & PCI_COMMAND_MEMORY;
     unsigned int i;
 
@@ -136,6 +214,7 @@ bool vpci_process_pending(struct vcpu *v)
         struct map_data data = {
             .d = v->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .pdev = v->vpci.pdev,
         };
         int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
 
@@ -168,7 +247,8 @@ bool vpci_process_pending(struct vcpu *v)
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             struct rangeset *mem, uint16_t cmd)
 {
-    struct map_data data = { .d = d, .map = true };
+    struct map_data data = { .d = d, .map = true,
+        .pdev = (struct pci_dev *)pdev };
     int rc;
 
     while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
@@ -205,7 +285,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
 
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
-    struct vpci_header *header = &pdev->vpci->header;
+    struct vpci_header *header;
     struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
 #ifdef CONFIG_X86
@@ -217,6 +297,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     if ( !mem )
         return -ENOMEM;
 
+    if ( is_hardware_domain(current->domain) )
+        header = get_hwdom_vpci_header(pdev);
+    else
+        header = get_vpci_header(current->domain, pdev);
+
     /*
      * Create a rangeset that represents the current device BARs memory region
      * and compare it against all the currently active BAR memory regions. If
@@ -225,12 +310,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * First fill the rangeset with all the BARs of this device or with the ROM
      * BAR only, depending on whether the guest is toggling the memory decode
      * bit of the command register, or the enable bit of the ROM BAR register.
+     *
+     * Use the PCI reserved bits of the BAR to pass BAR's index.
      */
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         const struct vpci_bar *bar = &header->bars[i];
-        unsigned long start = PFN_DOWN(bar->addr);
-        unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
+        unsigned long start = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) | i;
+        unsigned long end = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) +
+            bar->size - 1;
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
@@ -251,9 +339,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     /* Remove any MSIX regions if present. */
     for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
     {
-        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
-        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
-                                     vmsix_table_size(pdev->vpci, i) - 1);
+        unsigned long start = (vmsix_table_addr(pdev->vpci, i) &
+                               PCI_BASE_ADDRESS_MEM_MASK) | i;
+        unsigned long end = (vmsix_table_addr(pdev->vpci, i) &
+                             PCI_BASE_ADDRESS_MEM_MASK ) +
+                             vmsix_table_size(pdev->vpci, i) - 1;
 
         rc = rangeset_remove_range(mem, start, end);
         if ( rc )
@@ -273,6 +363,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      */
     for_each_pdev ( pdev->domain, tmp )
     {
+        struct vpci_header *header;
+
         if ( tmp == pdev )
         {
             /*
@@ -289,11 +381,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 continue;
         }
 
-        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
+        header = get_vpci_header(tmp->domain, pdev);
+
+        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
         {
-            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
-            unsigned long start = PFN_DOWN(bar->addr);
-            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
+            const struct vpci_bar *bar = &header->bars[i];
+            unsigned long start = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK) | i;
+            unsigned long end = (bar->addr & PCI_BASE_ADDRESS_MEM_MASK)
+                + bar->size - 1;
 
             if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
                  /*
@@ -357,7 +452,7 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void bar_write(const struct pci_dev *pdev, unsigned int reg,
+static void bar_write_hwdom(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
     struct vpci_bar *bar = data;
@@ -377,14 +472,17 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
     {
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
+        {
+            struct vpci_header *header = get_hwdom_vpci_header(pdev);
+
             gprintk(XENLOG_WARNING,
                     "%04x:%02x:%02x.%u: ignored BAR %lu write with memory decoding enabled\n",
                     pdev->seg, pdev->bus, slot, func,
-                    bar - pdev->vpci->header.bars + hi);
+                    bar - header->bars + hi);
+        }
         return;
     }
 
-
     /*
      * Update the cached address, so that when memory decoding is enabled
      * Xen can map the BAR into the guest p2m.
@@ -403,10 +501,89 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
+static uint32_t bar_read_hwdom(const struct pci_dev *pdev, unsigned int reg,
+                               void *data)
+{
+    return vpci_hw_read32(pdev, reg, data);
+}
+
+static void bar_write_guest(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t val, void *data)
+{
+    struct vpci_bar *vbar = data;
+    bool hi = false;
+
+    if ( vbar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        vbar--;
+        hi = true;
+    }
+    vbar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
+    vbar->addr |= (uint64_t)val << (hi ? 32 : 0);
+}
+
+static uint32_t bar_read_guest(const struct pci_dev *pdev, unsigned int reg,
+                               void *data)
+{
+    struct vpci_bar *vbar = data;
+    uint32_t val;
+    bool hi = false;
+
+    if ( vbar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        vbar--;
+        hi = true;
+    }
+
+    if ( vbar->type == VPCI_BAR_MEM64_LO || vbar->type == VPCI_BAR_MEM64_HI )
+    {
+        if ( hi )
+            val = vbar->addr >> 32;
+        else
+            val = vbar->addr & 0xffffffff;
+        if ( val == ~0 )
+        {
+            /* Guests detects BAR's properties and sizes. */
+            if ( !hi )
+            {
+                val = 0xffffffff & ~(vbar->size - 1);
+                val |= vbar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
+                                                    : PCI_BASE_ADDRESS_MEM_TYPE_64;
+                val |= vbar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+            }
+            else
+                val = vbar->size >> 32;
+            vbar->addr &= ~(0xffffffffull << (hi ? 32 : 0));
+            vbar->addr |= (uint64_t)val << (hi ? 32 : 0);
+        }
+    }
+    else if ( vbar->type == VPCI_BAR_MEM32 )
+    {
+        val = vbar->addr;
+        if ( val == ~0 )
+        {
+            if ( !hi )
+            {
+                val = 0xffffffff & ~(vbar->size - 1);
+                val |= vbar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
+                                                    : PCI_BASE_ADDRESS_MEM_TYPE_64;
+                val |= vbar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+            }
+        }
+    }
+    else
+    {
+        val = vbar->addr;
+    }
+    return val;
+}
+
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
-    struct vpci_header *header = &pdev->vpci->header;
+    struct vpci_header *header = get_hwdom_vpci_header(pdev);
     struct vpci_bar *rom = data;
     uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
@@ -452,15 +629,56 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
+static uint32_t bar_read_dispatch(const struct pci_dev *pdev, unsigned int reg,
+                                  void *data)
+{
+    struct vpci_bar *vbar, *bar = data;
+
+    if ( is_hardware_domain(current->domain) )
+        return bar_read_hwdom(pdev, reg, data);
+
+    vbar = get_vpci_bar(current->domain, pdev, bar->index);
+    if ( !vbar )
+        return ~0;
+
+    return bar_read_guest(pdev, reg, vbar);
+}
+
+static void bar_write_dispatch(const struct pci_dev *pdev, unsigned int reg,
+                               uint32_t val, void *data)
+{
+    struct vpci_bar *bar = data;
+
+    if ( is_hardware_domain(current->domain) )
+        bar_write_hwdom(pdev, reg, val, data);
+    else
+    {
+        struct vpci_bar *vbar = get_vpci_bar(current->domain, pdev, bar->index);
+
+        if ( !vbar )
+            return;
+        bar_write_guest(pdev, reg, val, vbar);
+    }
+}
+
+/*
+ * FIXME: This is called early while adding vPCI handlers which is done
+ * by and for hwdom.
+ */
 static int init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
     unsigned int i, num_bars, rom_reg;
-    struct vpci_header *header = &pdev->vpci->header;
-    struct vpci_bar *bars = header->bars;
+    struct vpci_header *header;
+    struct vpci_bar *bars;
     int rc;
 
+    header = get_hwdom_vpci_header(pdev);
+    if ( !header )
+        return -ENOMEM;
+    bars = header->bars;
+
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_NORMAL:
@@ -496,11 +714,12 @@ static int init_bars(struct pci_dev *pdev)
         uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
         uint32_t val;
 
+        bars[i].index = i;
         if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
         {
             bars[i].type = VPCI_BAR_MEM64_HI;
-            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
-                                   4, &bars[i]);
+            rc = vpci_add_register(pdev->vpci, bar_read_dispatch,
+                                   bar_write_dispatch, reg, 4, &bars[i]);
             if ( rc )
             {
                 pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
@@ -540,8 +759,8 @@ static int init_bars(struct pci_dev *pdev)
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
-                               &bars[i]);
+        rc = vpci_add_register(pdev->vpci, bar_read_dispatch,
+                               bar_write_dispatch, reg, 4, &bars[i]);
         if ( rc )
         {
             pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
@@ -558,6 +777,7 @@ static int init_bars(struct pci_dev *pdev)
         rom->type = VPCI_BAR_ROM;
         rom->size = size;
         rom->addr = addr;
+        rom->index = num_bars;
         header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
                               PCI_ROM_ADDRESS_ENABLE;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a5293521a36a..728029da3e9c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -69,6 +69,7 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
         return -ENOMEM;
 
     INIT_LIST_HEAD(&pdev->vpci->handlers);
+    INIT_LIST_HEAD(&pdev->vpci->headers);
     spin_lock_init(&pdev->vpci->lock);
 
     for ( i = 0; i < NUM_VPCI_INIT; i++ )
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index c3501e9ec010..54423bc6556d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -55,16 +55,14 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
  */
 bool __must_check vpci_process_pending(struct vcpu *v);
 
-struct vpci {
-    /* List of vPCI handlers for a device. */
-    struct list_head handlers;
-    spinlock_t lock;
-
 #ifdef __XEN__
-    /* Hide the rest of the vpci struct from the user-space test harness. */
     struct vpci_header {
+    struct list_head node;
+    /* Domain that owns this view of the BARs. */
+    domid_t domain_id;
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            int index;
             uint64_t addr;
             uint64_t size;
             enum {
@@ -88,8 +86,18 @@ struct vpci {
          * is mapped into guest p2m) if there's a ROM BAR on the device.
          */
         bool rom_enabled      : 1;
-        /* FIXME: currently there's no support for SR-IOV. */
-    } header;
+};
+#endif
+
+struct vpci {
+    /* List of vPCI handlers for a device. */
+    struct list_head handlers;
+    spinlock_t lock;
+
+#ifdef __XEN__
+    /* Hide the rest of the vpci struct from the user-space test harness. */
+    /* List of vPCI headers for all domains. */
+    struct list_head headers;
 
 #ifdef CONFIG_X86
     /* MSI data. */
-- 
2.17.1


