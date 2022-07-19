Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0757A5A1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370799.602707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFc-0006th-2L; Tue, 19 Jul 2022 17:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370799.602707; Tue, 19 Jul 2022 17:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFb-0006qa-VG; Tue, 19 Jul 2022 17:43:15 +0000
Received: by outflank-mailman (input) for mailman id 370799;
 Tue, 19 Jul 2022 17:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFa-00065R-4T
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:14 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42fd6b47-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:13 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id sz17so28557006ejc.9
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:13 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:11 -0700 (PDT)
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
X-Inumbo-ID: 42fd6b47-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FgW5CBHXdcnwWKRIlMpQopBORvtG8zr4OSYqoD8fHyU=;
        b=CXgYMn7KHHmlUqP2ylgTZ4SLg8AaLwROxv/SKbNwpq/p3FgltdZdTs6yeq+BDsJ7aV
         YNoGKCkkYI4h1wKk0+RIKQUNDiyQxnSWgcqG8fkYU+2pp6vzaMinRYeP6DBDRHWDB7RO
         XlRGcN7iLtGIFfRGPoGPYYcIy0rQi1Ldw8NoKvdrN7kUDXjQK6VRBAWdZm3xUdy60EIQ
         IN2j7d+00XPogxocVYsNGBfyN88FEtKUFwbtcMWb3ey5vYb60PUAOA3GGHgbAJ+/2z6R
         E/Icog1jEAu9L4AtdD1rDxNsLkkGDYRhMOYo91mPWJhMbeKft6Iz5rhsCOIF+a62OEYT
         A3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FgW5CBHXdcnwWKRIlMpQopBORvtG8zr4OSYqoD8fHyU=;
        b=tBP421QWy7xNtktv2Z03NW7PB1jVDDgOY2q0d/qtaq+KYQKyXfJxfn63K9NZiogNdP
         r0SnRkiUBiuW5hXv1rjQOFaPx1yDoIxFSJMT9YxIsEHj8mmVILMWBNvC3SudTIiHMZ9a
         yoFUJ4DDqsosA+I5+mhwqr7VToVWWx33GZNkh5K8KFa4oR7HJhEBV29gPsH13uoOjjGa
         NYqPD8ZcNAKNIMRDNg6O8d1PLfpIc5Bk01saZfccxvSo6yitNbn1zwgIAEwC2rkbD4XR
         6p3MPoPxZoyeiv6fRFL9hwq43OLXwCpBROg4Ts60PT+VwB4nksQiQSmqjxKYDQZVlvuh
         REMw==
X-Gm-Message-State: AJIora8r977G3T3TKQyAMWUIj8yYcsZU4Vh7ctNY49V9qz0Hn2y9k69r
	Vww8VOjI1IELjTNcLVK0vzMUeV4DwnnA6A==
X-Google-Smtp-Source: AGRyM1ubvpmCjkSWVW5k2cVxXUpISmssUtDd1KiuVlTJ0QCQMdV9iUR30c8eFT1SCyrdIoIl4TkXrw==
X-Received: by 2002:a17:907:948e:b0:72d:3fd2:5da0 with SMTP id dm14-20020a170907948e00b0072d3fd25da0mr30077049ejc.225.1658252592168;
        Tue, 19 Jul 2022 10:43:12 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 03/11] vpci/header: implement guest BAR register handlers
Date: Tue, 19 Jul 2022 20:42:45 +0300
Message-Id: <20220719174253.541965-4-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
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
Since v6:
- unify the writing of the PCI_COMMAND register on the
  error path into a label
- do not introduce bar_ignore_access helper and open code
- s/guest_bar_ignore_read/empty_bar_read
- update error message in guest_bar_write
- only setup empty_bar_read for IO if !x86
- OT: rebased
- OT: add cf_check specifier to guest_bar_(write)read() and empty_bar_read()
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
 xen/drivers/vpci/header.c | 151 +++++++++++++++++++++++++++++++-------
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 126 insertions(+), 28 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e0461b1139..9fbbdc3500 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -412,6 +412,71 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
+static void cf_check guest_bar_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
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
+                "%pp: ignored BAR %zu write attempting to change page offset\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+
+    bar->guest_reg = guest_reg;
+}
+
+static uint32_t cf_check guest_bar_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
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
+static uint32_t cf_check empty_bar_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    return 0;
+}
+
 static void cf_check rom_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -468,6 +533,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header;
     struct vpci_bar *bars;
     int rc;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
 
     ASSERT(pcidevs_write_locked());
 
@@ -512,13 +578,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
-            {
-                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-                return rc;
-            }
+                goto fail;
 
             continue;
         }
@@ -527,6 +592,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
         {
             bars[i].type = VPCI_BAR_IO;
+
+#ifndef CONFIG_X86
+            if ( !is_hwdom )
+            {
+                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, &bars[i]);
+                if ( rc )
+                    goto fail;
+            }
+#endif
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
@@ -538,14 +614,20 @@ static int cf_check init_bars(struct pci_dev *pdev)
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
 
         if ( size == 0 )
         {
             bars[i].type = VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, &bars[i]);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
 
@@ -553,34 +635,47 @@ static int cf_check init_bars(struct pci_dev *pdev)
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
-        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
-                               &bars[i]);
+        rc = vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
+                               is_hwdom ? bar_write : guest_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
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
+        rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                               rom_reg, 4, &header->bars[num_bars]);
         if ( rc )
-            rom->type = VPCI_BAR_EMPTY;
+            goto fail;
     }
 
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+
+ fail:
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    return rc;
 }
 REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e5501b9207..6e1d3b93cd 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -67,7 +67,10 @@ struct vpci {
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


