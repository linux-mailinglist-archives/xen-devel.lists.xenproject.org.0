Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F4414802
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192620.343161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0cK-0005OW-6t; Wed, 22 Sep 2021 11:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192620.343161; Wed, 22 Sep 2021 11:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0cK-0005KN-2t; Wed, 22 Sep 2021 11:40:48 +0000
Received: by outflank-mailman (input) for mailman id 192620;
 Wed, 22 Sep 2021 11:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0cI-0005IC-Aw
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:40:46 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ec8c675e-1b99-11ec-b970-12813bfff9fa;
 Wed, 22 Sep 2021 11:40:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 317106D;
 Wed, 22 Sep 2021 04:40:45 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16A963F719;
 Wed, 22 Sep 2021 04:40:43 -0700 (PDT)
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
X-Inumbo-ID: ec8c675e-1b99-11ec-b970-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 15/17] xen/arm: Transitional change to build HAS_VPCI on ARM.
Date: Wed, 22 Sep 2021 12:35:01 +0100
Message-Id: <0b7654cc44452575cae43c4d1700075c3a42ea2a.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

This patch will be reverted once we add support for VPCI MSI/MSIX
support on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
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
index 5406daecda..9327b7488e 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -27,6 +27,14 @@ struct arch_pci_dev {
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


