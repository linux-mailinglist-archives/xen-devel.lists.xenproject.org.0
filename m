Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98BE4244F7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202992.358066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvW-00065n-9J; Wed, 06 Oct 2021 17:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202992.358066; Wed, 06 Oct 2021 17:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvW-00061A-1p; Wed, 06 Oct 2021 17:41:58 +0000
Received: by outflank-mailman (input) for mailman id 202992;
 Wed, 06 Oct 2021 17:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAvU-0005xz-Do
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:41:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b2c3fd5a-26cc-11ec-bf8b-12813bfff9fa;
 Wed, 06 Oct 2021 17:41:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7226E11B3;
 Wed,  6 Oct 2021 10:41:55 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55E6D3F70D;
 Wed,  6 Oct 2021 10:41:54 -0700 (PDT)
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
X-Inumbo-ID: b2c3fd5a-26cc-11ec-bf8b-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 09/11] xen/arm: Transitional change to build HAS_VPCI on ARM.
Date: Wed,  6 Oct 2021 18:40:35 +0100
Message-Id: <b9653c6247060574cf68e1f780ef1db3dd0c20d3.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch will be reverted once we add support for VPCI MSI/MSIX
support on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v5: none
Change in v4:
- Added Acked-by: Stefano Stabellini <sstabellini@kernel.org>
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change in v3: none
Change in v2: Patch introduced in v2
---
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
2.25.1


