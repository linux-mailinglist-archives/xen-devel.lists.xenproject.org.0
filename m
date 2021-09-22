Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BDE4147E0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192522.343018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0Xj-0004oV-9r; Wed, 22 Sep 2021 11:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192522.343018; Wed, 22 Sep 2021 11:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0Xj-0004kz-6X; Wed, 22 Sep 2021 11:36:03 +0000
Received: by outflank-mailman (input) for mailman id 192522;
 Wed, 22 Sep 2021 11:36:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0Xi-0004iM-32
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:36:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4207b5f5-1b99-11ec-b970-12813bfff9fa;
 Wed, 22 Sep 2021 11:36:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C56A11B3;
 Wed, 22 Sep 2021 04:36:00 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C6F63F719;
 Wed, 22 Sep 2021 04:35:59 -0700 (PDT)
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
X-Inumbo-ID: 4207b5f5-1b99-11ec-b970-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 02/17] xen/pci: solve compilation error on ARM with HAS_PCI enabled
Date: Wed, 22 Sep 2021 12:34:48 +0100
Message-Id: <b6a9c007061f963332af63da544e5031e18a7850.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compilation error is observed when HAS_PCI is enabled for ARM
architecture.

Add definition for arch_iommu_use_permitted() and
arch_pci_clean_pirqs().

pci.c: In function ‘deassign_device’:
pci.c:849:49: error: implicit declaration of function ‘pci_to_dev’;
did you mean ‘dt_to_dev’? [-Werror=implicit-function-declaration]
            pci_to_dev(pdev));
pci.c:880: undefined reference to `arch_pci_clean_pirqs’
pci.c:1392: undefined reference to `arch_iommu_use_permitted'

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2:
- Remove pci_conf_read*(..) dummy implementation
- Add in code comment for arch_pci_clean_pirqs() and arch_iommu_use_permitted()
- Fixed minor comments
---
 xen/arch/arm/Makefile               |  1 +
 xen/arch/arm/pci/Makefile           |  1 +
 xen/arch/arm/pci/pci.c              | 33 +++++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/iommu.c |  9 ++++++++
 xen/include/asm-arm/pci.h           | 31 ++++++++++++++++++++++++---
 5 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/pci/Makefile
 create mode 100644 xen/arch/arm/pci/pci.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d3b97b5b4..44d7cc81fa 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
 obj-$(CONFIG_ARM_64) += efi/
 obj-$(CONFIG_ACPI) += acpi/
+obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
new file mode 100644
index 0000000000..a98035df4c
--- /dev/null
+++ b/xen/arch/arm/pci/Makefile
@@ -0,0 +1 @@
+obj-y += pci.o
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
new file mode 100644
index 0000000000..a7a7bc3213
--- /dev/null
+++ b/xen/arch/arm/pci/pci.c
@@ -0,0 +1,33 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/pci.h>
+
+/*
+ * PIRQ event channels are not supported on Arm, so nothing to do.
+ */
+int arch_pci_clean_pirqs(struct domain *d)
+{
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
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index db3b07a571..ee653a9c48 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -135,3 +135,12 @@ void arch_iommu_domain_destroy(struct domain *d)
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
 }
+
+/*
+ * Unlike x86, Arm doesn't support mem-sharing, mem-paging and log-dirty (yet).
+ * So there is no restriction to use the IOMMU.
+ */
+bool arch_iommu_use_permitted(const struct domain *d)
+{
+    return true;
+}
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index de13359f65..7dd9eb3dba 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -1,7 +1,32 @@
-#ifndef __X86_PCI_H__
-#define __X86_PCI_H__
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
 
+#ifndef __ARM_PCI_H__
+#define __ARM_PCI_H__
+
+#ifdef CONFIG_HAS_PCI
+
+#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
+
+/* Arch pci dev struct */
 struct arch_pci_dev {
+    struct device dev;
 };
 
-#endif /* __X86_PCI_H__ */
+#else   /*!CONFIG_HAS_PCI*/
+
+struct arch_pci_dev { };
+
+#endif  /*!CONFIG_HAS_PCI*/
+#endif /* __ARM_PCI_H__ */
-- 
2.17.1


