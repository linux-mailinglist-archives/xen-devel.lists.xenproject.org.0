Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09A5B028B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401300.643136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsxa-00028d-GD; Wed, 07 Sep 2022 11:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401300.643136; Wed, 07 Sep 2022 11:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsxa-00025t-CY; Wed, 07 Sep 2022 11:11:10 +0000
Received: by outflank-mailman (input) for mailman id 401300;
 Wed, 07 Sep 2022 11:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVsxZ-00025a-7Q
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:11:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c58694bd-2e9d-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 13:11:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 989CC1042;
 Wed,  7 Sep 2022 04:11:13 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 030203F7B4;
 Wed,  7 Sep 2022 04:11:05 -0700 (PDT)
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
X-Inumbo-ID: c58694bd-2e9d-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to pci_check_bar
Date: Wed,  7 Sep 2022 12:09:50 +0100
Message-Id: <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662548825.git.rahul.singh@arm.com>
References: <cover.1662548825.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_memory_hole was implemented for x86 and not for ARM when introduced.
Replace is_memory_hole call to pci_check_bar as function should check
if device BAR is in defined memory range. Also, add an implementation
for ARM which is required for PCI passthrough.

On x86, pci_check_bar will call is_memory_hole which will check if BAR
is not overlapping with any memory region defined in the memory map.

On ARM, pci_check_bar will go through the host bridge ranges and check
if the BAR is in the range of defined ranges.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v4:
 - check "s <= e" before callback
 - Add TODO comment for revisiting the function pci_check_bar() when
   ACPI PCI passthrough support is added.
 - Not Added the Jan Acked-by as patch is modified.
Changes in v3:
 - fix minor comments
---
 xen/arch/arm/include/asm/pci.h     |  2 ++
 xen/arch/arm/pci/pci-host-common.c | 49 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/pci.h     | 10 ++++++
 xen/drivers/passthrough/pci.c      |  8 ++---
 4 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 80a2431804..8cb46f6b71 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -126,6 +126,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
 
 int pci_host_bridge_mappings(struct domain *d);
 
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 89ef30028e..13d419aa45 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -24,6 +24,16 @@
 
 #include <asm/setup.h>
 
+/*
+ * struct to hold pci device bar.
+ */
+struct pdev_bar_check
+{
+    unsigned long start;
+    unsigned long end;
+    bool is_valid;
+};
+
 /*
  * List for all the pci host bridges.
  */
@@ -363,6 +373,45 @@ int __init pci_host_bridge_mappings(struct domain *d)
     return 0;
 }
 
+static int is_bar_valid(const struct dt_device_node *dev,
+                        uint64_t addr, uint64_t len, void *data)
+{
+    struct pdev_bar_check *bar_data = data;
+    unsigned long s = bar_data->start;
+    unsigned long e = bar_data->end;
+
+    if ( (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
+        bar_data->is_valid =  true;
+
+    return 0;
+}
+
+/* TODO: Revisit this function when ACPI PCI passthrough support is added. */
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
+{
+    int ret;
+    const struct dt_device_node *dt_node;
+    unsigned long s = mfn_x(start);
+    unsigned long e = mfn_x(end);
+    struct pdev_bar_check bar_data =  {
+        .start = s,
+        .end = e,
+        .is_valid = false
+    };
+
+    if ( s >= e )
+        return false;
+
+    dt_node = pci_find_host_bridge_node(pdev);
+    if ( !dt_node )
+        return false;
+
+    ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
+    if ( ret < 0 )
+        return false;
+
+    return bar_data.is_valid;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index c8e1a9ecdb..f4a58c8acf 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -57,4 +57,14 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
+static inline bool pci_check_bar(const struct pci_dev *pdev,
+                                 mfn_t start, mfn_t end)
+{
+    /*
+     * Check if BAR is not overlapping with any memory region defined
+     * in the memory map.
+     */
+    return is_memory_hole(start, end);
+}
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index cdaf5c247f..149f68bb6e 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -304,8 +304,8 @@ static void check_pdev(const struct pci_dev *pdev)
         if ( rc < 0 )
             /* Unable to size, better leave memory decoding disabled. */
             return;
-        if ( size && !is_memory_hole(maddr_to_mfn(addr),
-                                     maddr_to_mfn(addr + size - 1)) )
+        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
+                                    maddr_to_mfn(addr + size - 1)) )
         {
             /*
              * Return without enabling memory decoding if BAR position is not
@@ -331,8 +331,8 @@ static void check_pdev(const struct pci_dev *pdev)
 
         if ( rc < 0 )
             return;
-        if ( size && !is_memory_hole(maddr_to_mfn(addr),
-                                     maddr_to_mfn(addr + size - 1)) )
+        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
+                                    maddr_to_mfn(addr + size - 1)) )
         {
             printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
                    PFN_DOWN(addr + size - 1));
-- 
2.25.1


