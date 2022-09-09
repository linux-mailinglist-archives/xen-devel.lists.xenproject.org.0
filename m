Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831855B3411
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404042.646357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaQJ-0005Ya-JG; Fri, 09 Sep 2022 09:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404042.646357; Fri, 09 Sep 2022 09:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaQJ-0005Vz-Ga; Fri, 09 Sep 2022 09:35:43 +0000
Received: by outflank-mailman (input) for mailman id 404042;
 Fri, 09 Sep 2022 09:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiEI=ZM=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oWaQH-0005FS-PL
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:35:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c4a4c3ca-3022-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 11:35:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AB7615DB;
 Fri,  9 Sep 2022 02:35:46 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A3CB3F73D;
 Fri,  9 Sep 2022 02:35:39 -0700 (PDT)
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
X-Inumbo-ID: c4a4c3ca-3022-11ed-a31c-8f8a9ae3403f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v6 1/2] xen/arm: pci: modify pci_find_host_bridge_node argument to const pdev
Date: Fri,  9 Sep 2022 10:34:39 +0100
Message-Id: <6f321bfd09a4e95d8280b9178dc8645e2cb6b2d2.1662715131.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662715131.git.rahul.singh@arm.com>
References: <cover.1662715131.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify pci_find_host_bridge_node argument to const pdev to avoid
converting the dev to pdev in pci_find_host_bridge_node and also
constify the return.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes in v6:
 - no changes
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - no changes
---
---
 xen/arch/arm/include/asm/pci.h     | 3 ++-
 xen/arch/arm/pci/pci-host-common.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 7c7449d64f..80a2431804 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -106,7 +106,8 @@ bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                      struct pci_host_bridge *bridge,
                                      uint64_t addr);
 struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
-struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
+const struct dt_device_node *
+pci_find_host_bridge_node(const struct pci_dev *pdev);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index fd8c0f837a..89ef30028e 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -243,10 +243,10 @@ err_exit:
 /*
  * Get host bridge node given a device attached to it.
  */
-struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
+const struct dt_device_node *
+pci_find_host_bridge_node(const struct pci_dev *pdev)
 {
     struct pci_host_bridge *bridge;
-    struct pci_dev *pdev = dev_to_pci(dev);
 
     bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
     if ( unlikely(!bridge) )
-- 
2.25.1


