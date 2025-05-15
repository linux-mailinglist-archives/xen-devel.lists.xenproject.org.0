Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56929AB810B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984912.1370878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFU9q-00029q-Tv; Thu, 15 May 2025 08:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984912.1370878; Thu, 15 May 2025 08:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFU9q-00028I-R0; Thu, 15 May 2025 08:41:38 +0000
Received: by outflank-mailman (input) for mailman id 984912;
 Thu, 15 May 2025 08:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFU9p-00028C-WE
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:41:38 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695747d2-3168-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 10:41:37 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso553183b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:41:37 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7423772752csm10507891b3a.45.2025.05.15.01.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 01:41:34 -0700 (PDT)
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
X-Inumbo-ID: 695747d2-3168-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747298495; x=1747903295; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqRMEPLxqZX/utGkKcFlYQHVQ4/IIk7nsedjFNrB0b0=;
        b=Mk8a2L54H0nBfNQXkPbMMJbAEErjdZEgshR0WWedF+XpNbwqQBkvrDW4/QmcnySEW+
         yvqOE4kYl6VwJZdKDpQyAzTls5CS2wReTWwACmdZZGURlUa0IL1fePa/Zemd1oP1nmTO
         tsQex9vSSNtiF2LcEIt6fAYa1cpAxuwFaCFsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298495; x=1747903295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqRMEPLxqZX/utGkKcFlYQHVQ4/IIk7nsedjFNrB0b0=;
        b=Z2IQs7z2mdm4BDhf6r0IWvsbV/8bOCMWCSnyd4jrb/qhrxQRwxpKRLYBPOk3zfYw0s
         qCa0RBiaSamcspQm5T1IHyg/ffNBlW965G+qn/aQYeM+XBJdWLvH/ueFfmcpaaubqB2p
         L729x+6LXKjVpyzZGzkBiq7/YWke3cyNzJ7CUnzT5d+GZukmvvE4LLrU8WyBqjwoFXZc
         1H7vK/tZdLULH2Vzp4dqVcw0DSfVHAUff8G6oGaLgyr5OukQ0rS/gkKNU96yiJeHgxOG
         5kPFHK2QNIaLFI2DOYcNJeOshh1+Uc0393GgJIgsM0Ea8ZgV/uSrKwXIQfsYdiO38Icx
         RdNw==
X-Gm-Message-State: AOJu0YwPt+QFxggMOwa+ADxKfBoCDPyqrARVhjLcDBXhDpmv8qCfThnC
	vNzIXKdvzohgfc7Cr+5dJvgS42vW1TOj1DkKZEdjgDrcYJxxAGMM5Cdq/ZflECKybmFYhE0S4O4
	g
X-Gm-Gg: ASbGncv7hMZp052J+fG2Dq5ggyl0LXJqwxXGqx+t0It90eLrscqUf67vXcVU0emI6UY
	AkY8TigCHVxu5drBHZdfJscSPu0VA82G0HyyNl6oIgDik7RPgx8uybOz+0K5sTYEsOM5N91quI0
	gxXyO5WyWo+F2Yxmih+0PduxcZtlsPA+IdJ2qRhmNqmGdld7HrAr8NB7XYRo2E8rKSky9FG3be3
	YsFhooXu+zUi4xtrx+1zg7wjEXdqxKFZGb59r1DAJ6zMfLG8fasu0R5tL6kBgjKUuoOyh1R2ucO
	glYyEZrBH4jaXAOCJEzO5z663eXqhKcVs1B5rHGhq1YWKM/+ITpjqhs2
X-Google-Smtp-Source: AGHT+IG42YuSndUT6fbaWN3j55pDUxRF9q12AgzIQzFnztBZAObLPZ7lAt0mFUImHIjgAxxrIqEJgA==
X-Received: by 2002:a05:6a00:2d25:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-742962219damr3655823b3a.11.1747298494568;
        Thu, 15 May 2025 01:41:34 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] x86/vpci: fix handling of BAR overlaps with non-hole regions
Date: Thu, 15 May 2025 10:41:23 +0200
Message-ID: <20250515084123.43289-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For once the message printed when a BAR overlaps with a non-hole regions is
not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
is quite likely overlapping with a reserved region in the memory map, and
already mapped as by default all reserved regions are identity mapped in
the p2m.  Fix the message so it just warns about the overlap, without
mentioning that the BAR won't be mapped, as this has caused confusion in
the past.

Secondly, when an overlap is detected the BAR 'enabled' field is not set,
hence other vPCI code that depends on it like vPCI MSI-X handling won't
function properly, as it sees the BAR as disabled, even when memory
decoding is enabled for the device and the BAR is likely mapped in the
p2m.  Change the handling of BARs that overlap non-hole regions to instead
remove any overlapped regions from the rangeset, so the resulting ranges to
map just contain the hole regions.  This requires introducing a new
pci_sanitize_bar_memory() that's implemented per-arch and sanitizes the
address range to add to the p2m.

For x86 pci_sanitize_bar_memory() removes any regions present in the host
memory map, for ARM this is currently left as a dummy handler to not change
existing behavior.

Ultimately the above changes should fix the vPCI MSI-X handlers not working
correctly when the BAR that contains the MSI-X table overlaps with a
non-hole region, as then the 'enabled' BAR bit won't be set and the MSI-X
traps won't handle accesses as expected.

Reported-by: Stefano Stabellini <stefano.stabellini@amd.com>
Fixes: 53d9133638c3 ('pci: do not disable memory decoding for devices')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/include/asm/pci.h |  3 ++
 xen/arch/x86/include/asm/pci.h | 12 ++------
 xen/arch/x86/pci.c             | 50 ++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/header.c      |  9 ++++++
 4 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 7f77226c9bbf..1605ec660d0b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -128,6 +128,9 @@ int pci_host_bridge_mappings(struct domain *d);
 
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 
+static inline int pci_sanitize_bar_memory(struct rangeset *r)
+{ return 0; }
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct pci_dev;
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index fd5480d67d43..d2701f2deb62 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -2,6 +2,7 @@
 #define __X86_PCI_H__
 
 #include <xen/mm.h>
+#include <xen/rangeset.h>
 
 #define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00U) >> 8)
 #define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fcU)
@@ -57,14 +58,7 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
-static inline bool pci_check_bar(const struct pci_dev *pdev,
-                                 mfn_t start, mfn_t end)
-{
-    /*
-     * Check if BAR is not overlapping with any memory region defined
-     * in the memory map.
-     */
-    return is_memory_hole(start, end);
-}
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
+int pci_sanitize_bar_memory(struct rangeset *r);
 
 #endif /* __X86_PCI_H__ */
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 97b792e578f1..afaf9fe1c053 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -98,3 +98,53 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
 
     return rc;
 }
+
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
+{
+    /*
+     * Check if BAR is not overlapping with any memory region defined
+     * in the memory map.
+     */
+    if ( !is_memory_hole(start, end) )
+        gdprintk(XENLOG_WARNING,
+                 "%pp: BAR at [%"PRI_mfn", %"PRI_mfn"] not in memory map hole\n",
+                 &pdev->sbdf, mfn_x(start), mfn_x(end));
+
+    /*
+     * Unconditionally return true, pci_sanitize_bar_memory() will remove any
+     * non-hole regions.
+     */
+    return true;
+}
+
+/* Remove overlaps with any ranges defined in the host memory map. */
+int pci_sanitize_bar_memory(struct rangeset *r)
+{
+    unsigned int i;
+
+    for ( i = 0; i < e820.nr_map; i++ )
+    {
+        const struct e820entry *entry = &e820.map[i];
+        int rc;
+
+        if ( !entry->size )
+            continue;
+
+        rc = rangeset_remove_range(r, PFN_DOWN(entry->addr),
+                                   PFN_UP(entry->addr + entry->size - 1));
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..1f48f2aac64e 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -394,6 +394,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 return rc;
             }
         }
+
+        rc = pci_sanitize_bar_memory(bar->mem);
+        if ( rc )
+        {
+            gprintk(XENLOG_WARNING,
+                    "%pp: failed to sanitize BAR#%u memory: %d\n",
+                    &pdev->sbdf, i, rc);
+            return rc;
+        }
     }
 
     /* Remove any MSIX regions if present. */
-- 
2.48.1


