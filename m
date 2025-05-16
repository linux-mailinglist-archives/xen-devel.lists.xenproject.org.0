Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED8AB97C0
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986538.1372089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqUI-0005G4-5j; Fri, 16 May 2025 08:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986538.1372089; Fri, 16 May 2025 08:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqUI-0005EH-2s; Fri, 16 May 2025 08:32:14 +0000
Received: by outflank-mailman (input) for mailman id 986538;
 Fri, 16 May 2025 08:32:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFqUG-0005EB-4c
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:32:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42f8a941-3230-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:32:11 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5f62d3ed994so3438674a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:32:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-6005a6dfd50sm1024554a12.34.2025.05.16.01.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 01:32:09 -0700 (PDT)
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
X-Inumbo-ID: 42f8a941-3230-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747384330; x=1747989130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dlsHrKY+Gx86Elbji/GCycF9KX+wzlaT3AAVeSqxvY=;
        b=hkIl8deSdqy3+b4Ozp+JK0AsorZklDNSDrv2D9jdBRvUtlbdbFlcJs2yOIlQla/aeD
         55ZxNq4Ebw5pP6HXTBPQy0oSfgPO3p9iZnAfrTBQjWXbVFy/59qJDbxGgfzkpt7z3DSw
         HSlBTY9KfiFU8kU9Wxl4Yuo9Wuf4EY8HHjra4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747384330; x=1747989130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dlsHrKY+Gx86Elbji/GCycF9KX+wzlaT3AAVeSqxvY=;
        b=S7mOr6Cm+JQHeufPunZDUWlG2NsFcGlu+BfLYeW3hZP4pgP+Fei4Ge/9Czz+ktVnot
         pslYQQurr+QH2rSMAw1WBeoe9jq+lEdseCK2sjEbCyfFdveNRwZ+nT6a8JAMqn4dYbzk
         KjpaMkCAn4e7v+dmQzfFFW9r0hHaZ3ck6yXxE0cNcg2Q3wH4lU5ODq35os8wB3jtusrX
         TOOvNX3WhxGc3223/aoOo/Y9/UISPWsQMN/FJuajI42LdSHCvpN9fokzBhBet6O6/pjy
         0zPFzGxBlyavEuE4ANUbtE7MfaFL9n4PLgmELnSf2Yo7KjuEzW0Nh5YUKUVZmTWC9UYz
         vrXA==
X-Gm-Message-State: AOJu0YxJM/ADbtxhnzQv63aibWMJNvAM8SATSwQy9R25o/yzHv10c9vo
	qmU84uVBTEQCgxY88EjIeUVxtHmYWRolAvDoMe/qciuiAo8TbadnZT4yiE0kA59gfiQNRBXarDO
	q66Gc
X-Gm-Gg: ASbGncsccNHAw0GnVOdwj9VXypXReSPFDkWQ2NfeYCg5nBmy2w3IlJTMX5ZUUO+XnuJ
	aMt/ihksNh1ylbtU146LFTysFvov97wqPIBTHY6HM/WNh8QaPiLQDgTtKNUuM/ih8bMtWZarN9b
	O+PyEWZyNY/agZOS6yzoirgX/nuT+kllHDvP0ipPJ/B75bX5ZJwhdLuMwB+Dy60rnGNZQmYteiz
	pEGPnH0hM6YkVhiSFr1JbGawWkvp4/9wirwvNQnumqlgsD2ZACEbKEsXg8oVp8seRl6kxes4NiV
	6DKLTd8egWKB5jPFeHnrJ/nLONYbUZZRJl+yCT3Hp34MaD4flnqbWei8WEm1kn7qFa1fPvZK1N+
	u6Fca3u6NWuf4aW6fAIU=
X-Google-Smtp-Source: AGHT+IEs2tOTsSb8P7FFYMod8nw81xrhdtjBdt6FXKUjoWsYH6e5lSjTc9AZn37lBvXOBfJi3ZSk3A==
X-Received: by 2002:a05:6402:40d3:b0:5fe:e999:e553 with SMTP id 4fb4d7f45d1cf-600900f4c4bmr1951513a12.23.1747384329916;
        Fri, 16 May 2025 01:32:09 -0700 (PDT)
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
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Victor M Lira <victorm.lira@amd.com>
Subject: [PATCH v2] x86/vpci: fix handling of BAR overlaps with non-hole regions
Date: Fri, 16 May 2025 10:31:59 +0200
Message-ID: <20250516083159.61945-1-roger.pau@citrix.com>
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
Tested-by: Victor M Lira <victorm.lira@amd.com>
---
Changes since v1:
 - Use a forward declaration for struct rangeset instead of including the
   header.
---
 xen/arch/arm/include/asm/pci.h |  3 ++
 xen/arch/x86/include/asm/pci.h | 13 +++------
 xen/arch/x86/pci.c             | 50 ++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/header.c      |  9 ++++++
 4 files changed, 66 insertions(+), 9 deletions(-)

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
index fd5480d67d43..bed99437cc3b 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -57,14 +57,9 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
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
+
+struct rangeset;
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


