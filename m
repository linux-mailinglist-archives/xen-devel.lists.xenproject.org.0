Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B058AD4C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 17:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381368.616029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzWD-0001CT-HD; Fri, 05 Aug 2022 15:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381368.616029; Fri, 05 Aug 2022 15:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzWD-00018n-E0; Fri, 05 Aug 2022 15:45:45 +0000
Received: by outflank-mailman (input) for mailman id 381368;
 Fri, 05 Aug 2022 15:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcVI=YJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oJzWC-00017n-B6
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 15:45:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a9cbb75a-14d5-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 17:45:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19251113E;
 Fri,  5 Aug 2022 08:45:43 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D38B63F73B;
 Fri,  5 Aug 2022 08:45:40 -0700 (PDT)
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
X-Inumbo-ID: a9cbb75a-14d5-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Date: Fri,  5 Aug 2022 16:43:45 +0100
Message-Id: <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

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
 xen/arch/arm/include/asm/pci.h     | 12 ++++++++++
 xen/arch/arm/pci/pci-host-common.c | 35 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/pci.h     | 10 +++++++++
 xen/drivers/passthrough/pci.c      |  8 +++----
 4 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 7c7449d64f..5c4ab2c4dc 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -91,6 +91,16 @@ struct pci_ecam_ops {
     int (*init)(struct pci_config_window *);
 };
 
+/*
+ * struct to hold pci device bar.
+ */
+struct pdev_bar
+{
+    mfn_t start;
+    mfn_t end;
+    bool is_valid;
+};
+
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
 
@@ -125,6 +135,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
 
 int pci_host_bridge_mappings(struct domain *d);
 
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index fd8c0f837a..8ea1aaeece 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -363,6 +363,41 @@ int __init pci_host_bridge_mappings(struct domain *d)
     return 0;
 }
 
+static int is_bar_valid(const struct dt_device_node *dev,
+                        u64 addr, u64 len, void *data)
+{
+    struct pdev_bar *bar_data = data;
+    unsigned long s = mfn_x(bar_data->start);
+    unsigned long e = mfn_x(bar_data->end);
+
+    if ( (s < e) && (s >= PFN_DOWN(addr)) && (e<= PFN_DOWN(addr + len - 1)) )
+        bar_data->is_valid =  true;
+
+    return 0;
+}
+
+bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
+{
+    int ret;
+    struct dt_device_node *dt_node;
+    struct device *dev = (struct device *)pci_to_dev(pdev);
+    struct pdev_bar bar_data =  {
+        .start = start,
+        .end = end,
+        .is_valid = false
+    };
+
+    dt_node = pci_find_host_bridge_node(dev);
+
+    ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
+    if ( ret < 0 )
+        return ret;
+
+    if ( !bar_data.is_valid )
+        return false;
+
+    return true;
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
index 29356d59a7..52453a05fe 100644
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


