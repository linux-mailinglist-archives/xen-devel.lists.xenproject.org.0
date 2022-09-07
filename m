Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE05B02BE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401342.643191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt5b-0005Ta-A0; Wed, 07 Sep 2022 11:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401342.643191; Wed, 07 Sep 2022 11:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt5b-0005R6-7H; Wed, 07 Sep 2022 11:19:27 +0000
Received: by outflank-mailman (input) for mailman id 401342;
 Wed, 07 Sep 2022 11:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVsx3-0006sS-Lc
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:10:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b2f190e1-2e9d-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:10:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88FBD1042;
 Wed,  7 Sep 2022 04:10:42 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF073F7B4;
 Wed,  7 Sep 2022 04:10:35 -0700 (PDT)
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
X-Inumbo-ID: b2f190e1-2e9d-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v4 1/2] xen/arm: pci: modify pci_find_host_bridge_node argument to const pdev
Date: Wed,  7 Sep 2022 12:09:49 +0100
Message-Id: <535d4f87b6632edfca76e0be6db371ab817b7f82.1662548825.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662548825.git.rahul.singh@arm.com>
References: <cover.1662548825.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify pci_find_host_bridge_node argument to const pdev to avoid
converting the dev to pdev in pci_find_host_bridge_node and also
constify the return.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
 - no changes
Changes in v3:
 - no changes
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


