Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C394333BC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 12:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212956.371051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYv-00014V-Vu; Tue, 19 Oct 2021 10:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212956.371051; Tue, 19 Oct 2021 10:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYv-00011m-R7; Tue, 19 Oct 2021 10:41:41 +0000
Received: by outflank-mailman (input) for mailman id 212956;
 Tue, 19 Oct 2021 10:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mcmYt-0008TS-ND
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:41:39 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 200a4a94-30c9-11ec-830c-12813bfff9fa;
 Tue, 19 Oct 2021 10:41:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65923D6E;
 Tue, 19 Oct 2021 03:41:32 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C80463F70D;
 Tue, 19 Oct 2021 03:41:30 -0700 (PDT)
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
X-Inumbo-ID: 200a4a94-30c9-11ec-830c-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	sstabellini@kernel.org,
	Oleksandr_Andrushchenko@epam.com,
	jbeulich@suse.com,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] xen/pci: Add missing vpci handler cleanup
Date: Tue, 19 Oct 2021 11:40:35 +0100
Message-Id: <77e42e006ec7824e9d531cf488f746c2d7545f08.1634639117.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634639117.git.bertrand.marquis@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing vpci handlers cleanup during pci_device_remove and in case
of error with iommu during pci_device_add.

Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
defined.

Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
for ARM")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/drivers/passthrough/pci.c | 2 ++
 xen/include/xen/vpci.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index d7e09448d1..ddf08a3fae 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -766,6 +766,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         ret = iommu_add_device(pdev);
         if ( ret )
         {
+            vpci_remove_device(pdev);
             pdev->domain = NULL;
             goto out;
         }
@@ -813,6 +814,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+            vpci_remove_device(pdev);
             pci_cleanup_msi(pdev);
             ret = iommu_remove_device(pdev);
             if ( pdev->domain )
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6746c2589a..9ea66e033f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -230,6 +230,8 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
     return 0;
 }
 
+static inline void vpci_remove_device(struct pci_dev *pdev) { }
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.25.1


