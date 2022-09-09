Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBE5B3413
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404043.646368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaQW-0005zQ-Sd; Fri, 09 Sep 2022 09:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404043.646368; Fri, 09 Sep 2022 09:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaQW-0005w7-PO; Fri, 09 Sep 2022 09:35:56 +0000
Received: by outflank-mailman (input) for mailman id 404043;
 Fri, 09 Sep 2022 09:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiEI=ZM=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oWaQU-0005FS-UC
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:35:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cc73ce15-3022-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 11:35:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7961815DB;
 Fri,  9 Sep 2022 02:35:59 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D30403F73D;
 Fri,  9 Sep 2022 02:35:51 -0700 (PDT)
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
X-Inumbo-ID: cc73ce15-3022-11ed-a31c-8f8a9ae3403f
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
Subject: [PATCH v6 2/2] xen/pci: replace call to is_memory_hole to pci_check_bar
Date: Fri,  9 Sep 2022 10:34:40 +0100
Message-Id: <851cdf28f007326e9f7e1aaeab3688498aaecc9e.1662715131.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662715131.git.rahul.singh@arm.com>
References: <cover.1662715131.git.rahul.singh@arm.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
 - change from unsigned long to paddr_t
Changes in v5:
 - drop use of PFN_UP and PF_DOWN in case addresses are not aligned.
 - As we drop the PFN_UP and PFN_DOWN we need to use the mfn_to_maddr()
   to get the BAR address without page shift.
 - Add TODO comment for address alignment check for ranges.
 - Added Jan Acked-by for x86 and common code.
Changes in v4:
 - check "s <= e" before callback
 - Add TODO comment for revisiting the function pci_check_bar() when
   ACPI PCI passthrough support is added.
 - Not Added the Jan Acked-by as patch is modified.
Changes in v3:
 - fix minor comments
---
---
 xen/arch/arm/include/asm/pci.h     |  2 ++
 xen/arch/arm/pci/pci-host-common.c | 54 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/pci.h     | 10 ++++++
 xen/drivers/passthrough/pci.c      |  8 ++---
 4 files changed, 70 insertions(+), 4 deletions(-)

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
index 89ef30028e..a8ece94303 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -24,6 +24,16 @@
 
 #include <asm/setup.h>
 
+/*
+ * struct to hold pci device bar.
+ */
+struct pdev_bar_check
+{
+    paddr_t start;
+    paddr_t end;
+    bool is_valid;
+};
+
 /*
  * List for all the pci host bridges.
  */
@@ -363,6 +373,50 @@ int __init pci_host_bridge_mappings(struct domain *d)
     return 0;
 }
 
+/*
+ * TODO: BAR addresses and Root Complex window addresses are not guaranteed
+ * to be page aligned. We should check for alignment but this is not the
+ * right place for alignment check.
+ */
+static int is_bar_valid(const struct dt_device_node *dev,
+                        paddr_t addr, paddr_t len, void *data)
+{
+    struct pdev_bar_check *bar_data = data;
+    paddr_t s = bar_data->start;
+    paddr_t e = bar_data->end;
+
+    if ( (s >= addr) && (e <= (addr + len - 1)) )
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
+    paddr_t s = mfn_to_maddr(start);
+    paddr_t e = mfn_to_maddr(end);
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


