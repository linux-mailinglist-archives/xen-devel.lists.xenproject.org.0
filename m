Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716C4B26BD8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081979.1441971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR5-0001Xz-JJ; Thu, 14 Aug 2025 16:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081979.1441971; Thu, 14 Aug 2025 16:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR5-0001WB-CF; Thu, 14 Aug 2025 16:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1081979;
 Thu, 14 Aug 2025 16:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umaR3-0000md-Fi
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:04:13 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fd66da-7928-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 18:04:13 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9d41bfa35so907963f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 09:04:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b916394937sm7421304f8f.6.2025.08.14.09.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:04:11 -0700 (PDT)
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
X-Inumbo-ID: 51fd66da-7928-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755187452; x=1755792252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psLG+a7CXrYEhoUcdPoZMaJ5jEU0fJdv182ycPW3oJY=;
        b=mtyHyx0pGttgZb8AMfiPdem3cuDCzz6+nZcR7NTF2vx5nDvZPVEburYcal6DWmbfKp
         kVsV6y0kcwGBK/O7i/FxhkYU3MYm7/YVm+7bNtLPzPN5mLCplG4sWGiRChbTkIdoogGQ
         s+aCA16jJmJamLSuAFU7h47/eGv3GZhQJCJ4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187452; x=1755792252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psLG+a7CXrYEhoUcdPoZMaJ5jEU0fJdv182ycPW3oJY=;
        b=nD0uwKJklUmFW8v6lShlcy8SROyXYySeQzj3aVE3jX1J5CsmCnTPY4Q+nNcXi1Gyad
         z9dE2d76Y+MUzF2wr91+9N0x+y9DjmLcQnvZs/KVg5kvn1ReyGMTxjIO/k37hibhmsS2
         iA+t7p/+dFMglxYWVreMTZUf0VX0qz9mE7B9uzI1qRq9ArNS1ZUl7iz+8kH6EdaaWOx4
         D78Wi9ugwnYXLEfl+u7lxydX9LI4dDwPy8yfMn94ndiW8yaJE/aOGXC7z2eopxEnYqew
         zcVOvWWiYcI2SI3JoJbygX3CT+Yu9ik7VRwR7josHbMlA2+4V/g9HGaLZybFAzjz4LU7
         g4fg==
X-Gm-Message-State: AOJu0YxMdlx7SM7mfnX2768r7nR8NmJCnHtreZz39V4Zd7t3g0GqyT+N
	b2ij7FW+aBUlhpyIKmf2RTbNFvyQz7kIyCE4AUoFB/Pc50BjoFOOJ2H9CaIFhiGHs7QCmXsnual
	3rDqX
X-Gm-Gg: ASbGncs8kTjDL+bC/FJjsTLbaLjgZq/5X6J7a8LzmmsQqORTslAQQN2DtL1e+YP4GoN
	PTh5o5fqlzx0z5Od0Ee7CMDupdQto3RIT95ThPwSC0rLkX8XIU9EDxx88ez+ruwcq+Fdrcmb4bB
	2srTzGwfbqU/57SuzWxoay6lVlvnc+ITeBBc6fk9QCRZmGYaCS12a8vWsRqdwCQVSltPbBwFSkk
	c+iQIubSFkjC4ti3xh9oyGgyZEd7M/ApoBzYzOJLCsnSEows2ycIDnzenHZXvbB8bunr9aEEUbO
	hkBV11QuqGC8nuHucE3swfccYmcQsUcK4tpmyFtds2w15SGimFUlBCv3Q8JVQYlhSiBKyjTHiyO
	qD5F229q8DrHk7VnSsqXoWtnIAaUt5S1J6YZ7RgxOBrCoM/6Q9lOd5OxqT4IfiFWv2Q==
X-Google-Smtp-Source: AGHT+IFVNy9qIZPfceRvaHctViLQahdoKWIo5FMIKzNqIfiwufvCPdS8zCJ/TffyRWtxQ+EoGQvZdQ==
X-Received: by 2002:a5d:5f4a:0:b0:3b8:d493:31ed with SMTP id ffacd0b85a97d-3b9edf4454emr3440941f8f.47.1755187452069;
        Thu, 14 Aug 2025 09:04:12 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@amd.com,
	Jiqian.Chen@amd.com,
	jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/5] xen/vpci: only check BAR validity once
Date: Thu, 14 Aug 2025 18:03:58 +0200
Message-ID: <20250814160358.95543-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814160358.95543-1-roger.pau@citrix.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid multiple calls to pci_check_bar() for the same memory decoding
related operation, as each call can possibly print a warning message avoid
a BAR being in an invalid position.

Store whether the BAR is validly positioned in modify_bars(), and used that
cached value for the whole operation.  This allows to get rid of
modify_decoding(), as the setting of whether the BAR is enabled or not can
be easily done in vpci_process_pending() itself, without the need for an
external helper.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 4acab25a9300 ('x86/vpci: fix handling of BAR overlaps with non-hole regions')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 69 ++++++++++-----------------------------
 xen/include/xen/vpci.h    |  5 +++
 2 files changed, 23 insertions(+), 51 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 255c6d54b406..2071bed81676 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -121,46 +121,6 @@ static int cf_check map_range(
     return rc;
 }
 
-/*
- * The rom_only parameter is used to signal the map/unmap helpers that the ROM
- * BAR's enable bit has changed with the memory decoding bit already enabled.
- * If rom_only is not set then it's the memory decoding bit that changed.
- */
-static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
-                            bool rom_only)
-{
-    struct vpci_header *header = &pdev->vpci->header;
-    bool map = cmd & PCI_COMMAND_MEMORY;
-    unsigned int i;
-
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-    {
-        struct vpci_bar *bar = &header->bars[i];
-
-        if ( !MAPPABLE_BAR(bar) )
-            continue;
-
-        if ( rom_only && bar->type == VPCI_BAR_ROM )
-        {
-            unsigned int rom_pos = (i == PCI_HEADER_NORMAL_NR_BARS)
-                                   ? PCI_ROM_ADDRESS : PCI_ROM_ADDRESS1;
-            uint32_t val = bar->addr |
-                           (map ? PCI_ROM_ADDRESS_ENABLE : 0);
-
-            if ( pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
-                               _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
-                bar->enabled = map;
-            return;
-        }
-
-        if ( !rom_only &&
-             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
-             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
-                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
-            bar->enabled = map;
-    }
-}
-
 bool vpci_process_pending(struct vcpu *v)
 {
     const struct pci_dev *pdev = v->vpci.pdev;
@@ -190,8 +150,10 @@ bool vpci_process_pending(struct vcpu *v)
         };
         int rc;
 
+        ASSERT(bar->valid || rangeset_is_empty(bar->mem));
+
         if ( rangeset_is_empty(bar->mem) )
-            continue;
+            goto next;
 
         rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
@@ -217,13 +179,13 @@ bool vpci_process_pending(struct vcpu *v)
          * rangeset_consume_ranges() itself doesn't generate any errors.
          */
         rangeset_purge(bar->mem);
+
+ next:
+        if ( bar->valid )
+            bar->enabled = v->vpci.cmd & PCI_COMMAND_MEMORY;
     }
     v->vpci.pdev = NULL;
 
-    spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
-    spin_unlock(&pdev->vpci->lock);
-
     read_unlock(&v->domain->pci_lock);
 
     return false;
@@ -243,10 +205,8 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
         struct vpci_bar *bar = &header->bars[i];
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
-        if ( rangeset_is_empty(bar->mem) )
-            continue;
-
-        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
+        while ( bar->mem &&
+                (rc = rangeset_consume_ranges(bar->mem, map_range,
                                               &data)) == -ERESTART )
         {
             /*
@@ -258,9 +218,10 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
             process_pending_softirqs();
             write_lock(&d->pci_lock);
         }
+
+        if ( bar->valid )
+            bar->enabled = true;
     }
-    if ( !rc )
-        modify_decoding(pdev, cmd, false);
 
     return rc;
 }
@@ -326,6 +287,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          */
         rangeset_purge(bar->mem);
 
+        /* Reset whether the BAR is valid, will be checked below. */
+        bar->valid = false;
+
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
                        : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
@@ -341,6 +305,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
+        bar->valid = true;
+
         /*
          * Make sure that the guest set address has the same page offset
          * as the physical address on the host or otherwise things won't work as
@@ -539,6 +505,7 @@ static void cf_check cmd_write(
     if ( (cmd & PCI_COMMAND_MEMORY) && vpci_make_msix_hole(pdev) )
         return;
 #endif
+
     /*
      * FIXME: for domUs we don't want the guest toggling the memory decoding
      * bit.  It should be set in vpci_init_header() and guest attempts to
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 17cfecb0aabf..6bdbbb842f58 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -128,6 +128,11 @@ struct vpci {
             bool prefetchable : 1;
             /* Store whether the BAR is mapped into guest p2m. */
             bool enabled      : 1;
+            /*
+             * Is the BAR position valid?  Used to store intermediate state
+             * before BAR modifications are applied to the p2m.
+             */
+            bool valid        : 1;
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
-- 
2.49.0


