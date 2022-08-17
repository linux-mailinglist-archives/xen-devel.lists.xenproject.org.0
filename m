Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0A59719E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 16:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389010.625819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKIs-00028m-5Y; Wed, 17 Aug 2022 14:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389010.625819; Wed, 17 Aug 2022 14:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKIs-000261-1l; Wed, 17 Aug 2022 14:45:54 +0000
Received: by outflank-mailman (input) for mailman id 389010;
 Wed, 17 Aug 2022 14:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ6E=YV=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOKIr-00025V-AP
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 14:45:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4a8ded2a-1e3b-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 16:45:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9260E113E;
 Wed, 17 Aug 2022 07:45:52 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D263F3F70D;
 Wed, 17 Aug 2022 07:45:50 -0700 (PDT)
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
X-Inumbo-ID: 4a8ded2a-1e3b-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/arm: pci: modify pci_find_host_bridge_node argument to const pdev
Date: Wed, 17 Aug 2022 15:45:26 +0100
Message-Id: <5f0f92fe734d3c8478c98a90b7eb85e032d7b9ce.1660746990.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660746990.git.rahul.singh@arm.com>
References: <cover.1660746990.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify pci_find_host_bridge_node argument to const pdev to avoid
converting the dev to pdev in pci_find_host_bridge_node and also
constify the return.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - this patch is introduced in this version
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


