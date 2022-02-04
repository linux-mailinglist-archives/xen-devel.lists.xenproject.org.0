Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE264A9411
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265009.458332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBc-0001PZ-87; Fri, 04 Feb 2022 06:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265009.458332; Fri, 04 Feb 2022 06:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBb-0001Lt-Of; Fri, 04 Feb 2022 06:35:11 +0000
Received: by outflank-mailman (input) for mailman id 265009;
 Fri, 04 Feb 2022 06:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBZ-0008DX-Hg
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:09 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98aeb6f8-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:08 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id e17so7167593ljk.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:08 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:07 -0800 (PST)
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
X-Inumbo-ID: 98aeb6f8-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4b53rA6xzj/VK8mPmETSCKHkM43BtRFV7FZoD/x6CYM=;
        b=LGFssdbglsHSBRlLC10zAwfwl+lxGwyGLcSEdRXHsHfCtbH4EZFUs1eo+aoLDmBg4S
         eB6pFpKJGKQyDTv/SUipdDjBH8iXt/3A/eV7ucleaPmF2llLUvbbMFoCgFShlOdgrmE5
         IivVoOTRjsuUm/VdB7KPtmsXA9ZYwcx9V1RbdqPeDn0jUaaRojQoDRGJ6z4ZWA9TaktG
         faQlTO2kJ0JfREXc0+N3NSw8kLhL6bnWJC8ppgKvyBEIHgfvSZmsnkZOh72SlUdfD6qm
         Z26XqIeZu6GCEF9d4lT6hQIpHAwq0pcEgoN+k/wlaH2N9n2lviiCuaq+NvWUEJnQ4+KW
         CkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4b53rA6xzj/VK8mPmETSCKHkM43BtRFV7FZoD/x6CYM=;
        b=ludS6Bq5lxUDJyLJKJ8L+CWi66r/6ORTsCqx+1w/amxtZDbLTFpSZAfeff8/ruX/rn
         /9m89XT7xmb59nzqBJwUuB7ELOQyhB2L0Jp4DRcPUdTzt2cgFoa8wR/MJmmlcZUAcQfR
         22C+aahPb+c8Q5/9AXtNYbKBIyaoX1foBB18uMQPlHJQuNU5LbQCCOAhDCe4ij9bhTSN
         Iyf+BSWuGAmfN3CTLL00I24nJinXMdU4dreUZj+JI1Rtri0gn7wGmboUOurUS67SIH6h
         mjGAgzjE+J00TyicWXEZaLhrqIXxEDkzWAzc0VvED7yfd+C+8u+cwa0fAuWYG04AgJVO
         s1zg==
X-Gm-Message-State: AOAM530Dyhj/fsnMHHgF4Dto7rPTkZlt94RhiU26H68c0e6j4Zxb7L0o
	LVWXDDBj29dbr05SjhoEUZaJRAfhzfE=
X-Google-Smtp-Source: ABdhPJyT9UqVfIhAtTM96uy+/s3bkntSE0jQKHwafHnI3xVxjYIKf9NL0rxmdS5y0dE9VlwJS+zJEg==
X-Received: by 2002:a2e:95cb:: with SMTP id y11mr937679ljh.129.1643956507945;
        Thu, 03 Feb 2022 22:35:07 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 06/13] vpci/header: implement guest BAR register handlers
Date: Fri,  4 Feb 2022 08:34:52 +0200
Message-Id: <20220204063459.680961-7-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

All empty, IO and ROM BARs for guests are emulated by returning 0 on
reads and ignoring writes: this BARs are special with this respect as
their lower bits have special meaning, so returning default ~0 on read
may confuse guest OS.

Memory decoding is initially disabled when used by guests in order to
prevent the BAR being placed on top of a RAM region.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v5:
- make sure that the guest set address has the same page offset
  as the physical address on the host
- remove guest_rom_{read|write} as those just implement the default
  behaviour of the registers not being handled
- adjusted comment for struct vpci.addr field
- add guest handlers for BARs which are not handled and will otherwise
  return ~0 on read and ignore writes. The BARs are special with this
  respect as their lower bits have special meaning, so returning ~0
  doesn't seem to be right
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
 xen/drivers/vpci/header.c | 131 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 118 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index bd23c0274d48..2620a95ff35b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -406,6 +406,81 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
+static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
+                            uint32_t val, void *data)
+{
+    struct vpci_bar *bar = data;
+    bool hi = false;
+    uint64_t guest_reg = bar->guest_reg;
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
+    guest_reg &= ~(0xffffffffull << (hi ? 32 : 0));
+    guest_reg |= (uint64_t)val << (hi ? 32 : 0);
+
+    guest_reg &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
+
+    /*
+     * Make sure that the guest set address has the same page offset
+     * as the physical address on the host or otherwise things won't work as
+     * expected.
+     */
+    if ( (guest_reg & (~PAGE_MASK & PCI_BASE_ADDRESS_MEM_MASK)) !=
+         (bar->addr & ~PAGE_MASK) )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: ignored BAR %zu write with wrong page offset\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+
+    bar->guest_reg = guest_reg;
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
+static uint32_t guest_bar_ignore_read(const struct pci_dev *pdev,
+                                      unsigned int reg, void *data)
+{
+    return 0;
+}
+
+static int bar_ignore_access(const struct pci_dev *pdev, unsigned int reg,
+                             struct vpci_bar *bar)
+{
+    if ( is_hardware_domain(pdev->domain) )
+        return 0;
+
+    return vpci_add_register(pdev->vpci, guest_bar_ignore_read, NULL,
+                             reg, 4, bar);
+}
+
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
@@ -462,6 +537,7 @@ static int init_bars(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
 
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
@@ -501,8 +577,10 @@ static int init_bars(struct pci_dev *pdev)
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
@@ -516,6 +594,11 @@ static int init_bars(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
         {
             bars[i].type = VPCI_BAR_IO;
+
+            rc = bar_ignore_access(pdev, reg, &bars[i]);
+            if ( rc )
+                return rc;
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
@@ -535,6 +618,11 @@ static int init_bars(struct pci_dev *pdev)
         if ( size == 0 )
         {
             bars[i].type = VPCI_BAR_EMPTY;
+
+            rc = bar_ignore_access(pdev, reg, &bars[i]);
+            if ( rc )
+                return rc;
+
             continue;
         }
 
@@ -542,8 +630,10 @@ static int init_bars(struct pci_dev *pdev)
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
@@ -551,22 +641,31 @@ static int init_bars(struct pci_dev *pdev)
         }
     }
 
-    /* Check expansion ROM. */
-    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
-    if ( rc > 0 && size )
+    /* Check expansion ROM: we do not handle ROM for guests. */
+    if ( is_hwdom )
     {
-        struct vpci_bar *rom = &header->bars[num_bars];
+        rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
+        if ( rc > 0 && size )
+        {
+            struct vpci_bar *rom = &header->bars[num_bars];
 
-        rom->type = VPCI_BAR_ROM;
-        rom->size = size;
-        rom->addr = addr;
-        header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
-                              PCI_ROM_ADDRESS_ENABLE;
+            rom->type = VPCI_BAR_ROM;
+            rom->size = size;
+            rom->addr = addr;
+            header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
+                                  PCI_ROM_ADDRESS_ENABLE;
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
-                               4, rom);
+            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
+                                   rom_reg, 4, rom);
+            if ( rc )
+                rom->type = VPCI_BAR_EMPTY;
+        }
+    }
+    else
+    {
+        rc = bar_ignore_access(pdev, rom_reg, &header->bars[num_bars]);
         if ( rc )
-            rom->type = VPCI_BAR_EMPTY;
+            return rc;
     }
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 246307e6f5d5..270d22b85653 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -66,7 +66,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest view of the BAR: address and lower bits. */
+            uint64_t guest_reg;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.25.1


