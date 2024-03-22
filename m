Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96028887035
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696960.1088280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLV-0002un-TX; Fri, 22 Mar 2024 16:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696960.1088280; Fri, 22 Mar 2024 16:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLV-0002l1-Gy; Fri, 22 Mar 2024 16:02:17 +0000
Received: by outflank-mailman (input) for mailman id 696960;
 Fri, 22 Mar 2024 16:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLS-0000W5-W0
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb2b0a1-e865-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 17:02:12 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 38C994EE0C95;
 Fri, 22 Mar 2024 17:02:12 +0100 (CET)
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
X-Inumbo-ID: 8bb2b0a1-e865-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org
Subject: [XEN PATCH 09/11] x86/msi: address violation of MISRA C Rule 20.7 and coding style
Date: Fri, 22 Mar 2024 17:01:58 +0100
Message-Id: <c924aa0d5b3b6adbb24cc638f739173cbc41862c.1711118582.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

While at it, the style of these macros has been somewhat uniformed.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/msi.h | 47 +++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 997ccb87be0c..e24d46d95a02 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -147,33 +147,34 @@ int msi_free_irq(struct msi_desc *entry);
  */
 #define NR_HP_RESERVED_VECTORS 	20
 
-#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
-#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
-#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
-#define msi_data_reg(base, is64bit)	\
-	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
-#define msi_mask_bits_reg(base, is64bit) \
-	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
+#define msi_control_reg(base)        ((base) + PCI_MSI_FLAGS)
+#define msi_lower_address_reg(base)  ((base) + PCI_MSI_ADDRESS_LO)
+#define msi_upper_address_reg(base)  ((base) + PCI_MSI_ADDRESS_HI)
+#define msi_data_reg(base, is64bit) \
+    (((is64bit) == 1) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32)
+#define msi_mask_bits_reg(base, is64bit)                \
+    (((is64bit) == 1) ? (base) + PCI_MSI_MASK_BIT       \
+                      : (base) + PCI_MSI_MASK_BIT - 4)
 #define msi_pending_bits_reg(base, is64bit) \
-	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
-#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
+    ((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
+#define msi_disable(control) (control) &= ~PCI_MSI_FLAGS_ENABLE
 #define multi_msi_capable(control) \
-	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
+    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
 #define multi_msi_enable(control, num) \
-	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
-#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
-#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
+    (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
+#define is_64bit_address(control) (!!((control) & PCI_MSI_FLAGS_64BIT))
+#define is_mask_bit_support(control) (!!((control) & PCI_MSI_FLAGS_MASKBIT))
 #define msi_enable(control, num) multi_msi_enable(control, num); \
-	control |= PCI_MSI_FLAGS_ENABLE
-
-#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
-#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
-#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
-#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
-#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
-#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
-#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
-#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
+                                 (control) |= PCI_MSI_FLAGS_ENABLE
+
+#define msix_control_reg(base)       ((base) + PCI_MSIX_FLAGS)
+#define msix_table_offset_reg(base)  ((base) + PCI_MSIX_TABLE)
+#define msix_pba_offset_reg(base)    ((base) + PCI_MSIX_PBA)
+#define msix_enable(control)         (control) |= PCI_MSIX_FLAGS_ENABLE
+#define msix_disable(control)        (control) &= ~PCI_MSIX_FLAGS_ENABLE
+#define msix_table_size(control)     (((control) & PCI_MSIX_FLAGS_QSIZE) + 1)
+#define msix_unmask(address)         ((address) & ~PCI_MSIX_VECTOR_BITMASK)
+#define msix_mask(address)           ((address) | PCI_MSIX_VECTOR_BITMASK)
 
 /*
  * MSI Defined Data Structures
-- 
2.34.1


