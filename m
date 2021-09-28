Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3441B619
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198312.351764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHlq-0008Se-8m; Tue, 28 Sep 2021 18:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198312.351764; Tue, 28 Sep 2021 18:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHlq-0008Nm-4Q; Tue, 28 Sep 2021 18:24:02 +0000
Received: by outflank-mailman (input) for mailman id 198312;
 Tue, 28 Sep 2021 18:24:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHlo-0007ni-KZ
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:24:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 60b7dc57-d8fb-42d8-aaa2-b15f0d1259c7;
 Tue, 28 Sep 2021 18:23:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 725F86D;
 Tue, 28 Sep 2021 11:23:56 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A203F793;
 Tue, 28 Sep 2021 11:23:55 -0700 (PDT)
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
X-Inumbo-ID: 60b7dc57-d8fb-42d8-aaa2-b15f0d1259c7
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 15/17] xen/arm: Transitional change to build HAS_VPCI on ARM.
Date: Tue, 28 Sep 2021 19:18:24 +0100
Message-Id: <adabef3cd1774ca51f1b409bd97a2ae353eaac2b.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

This patch will be reverted once we add support for VPCI MSI/MSIX
support on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3: none
Change in v2: Patch introduced in v2
---
 xen/drivers/vpci/Makefile | 3 ++-
 xen/drivers/vpci/header.c | 2 ++
 xen/include/asm-arm/pci.h | 8 ++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 55d1bdfda0..1a1413b93e 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1 +1,2 @@
-obj-y += vpci.o header.o msi.o msix.o
+obj-y += vpci.o header.o
+obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ba9a036202..f8cd55e7c0 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
      * FIXME: punching holes after the p2m has been set up might be racy for
      * DomU usage, needs to be revisited.
      */
+#ifdef CONFIG_HAS_PCI_MSI
     if ( map && !rom_only && vpci_make_msix_hole(pdev) )
         return;
+#endif
 
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 49c9622902..5532ce3977 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -26,6 +26,14 @@ struct arch_pci_dev {
     struct device dev;
 };
 
+/* Arch-specific MSI data for vPCI. */
+struct vpci_arch_msi {
+};
+
+/* Arch-specific MSI-X entry data for vPCI. */
+struct vpci_arch_msix_entry {
+};
+
 /*
  * struct to hold the mappings of a config space window. This
  * is expected to be used as sysdata for PCI controllers that
-- 
2.17.1


