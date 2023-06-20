Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75C736A24
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551538.861156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ72-0008Om-Ak; Tue, 20 Jun 2023 11:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551538.861156; Tue, 20 Jun 2023 11:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ72-0008GH-5Q; Tue, 20 Jun 2023 11:01:28 +0000
Received: by outflank-mailman (input) for mailman id 551538;
 Tue, 20 Jun 2023 10:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBYhn-0004Ou-Dm
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:35:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2864a1e3-0f56-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 12:35:21 +0200 (CEST)
Received: from beta.bugseng.com (93-40-74-174.ip37.fastwebnet.it
 [93.40.74.174])
 by support.bugseng.com (Postfix) with ESMTPSA id 33C7A4EE0754;
 Tue, 20 Jun 2023 12:35:20 +0200 (CEST)
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
X-Inumbo-ID: 2864a1e3-0f56-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 02/13] AMD/IOMMU: fixed violations of MISRA C:2012 Rule 7.2
Date: Tue, 20 Jun 2023 12:34:54 +0200
Message-Id: <21337a20c5c8d66dff552c2f09054ea82b253dd6.1687250177.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
"A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".

I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu-defs.h | 122 +++++++++++------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu-defs.h b/xen/drivers/passthrough/amd/iommu-defs.h
index 35de548e3a..c145248f9a 100644
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -38,49 +38,49 @@
         ((uint64_t)(offset) << (12 + (PTE_PER_TABLE_SHIFT * ((level) - 1))))
 
 /* IOMMU Capability */
-#define PCI_CAP_ID_MASK		0x000000FF
+#define PCI_CAP_ID_MASK		0x000000FFU
 #define PCI_CAP_ID_SHIFT	0
-#define PCI_CAP_NEXT_PTR_MASK	0x0000FF00
+#define PCI_CAP_NEXT_PTR_MASK	0x0000FF00U
 #define PCI_CAP_NEXT_PTR_SHIFT	8
-#define PCI_CAP_TYPE_MASK	0x00070000
+#define PCI_CAP_TYPE_MASK	0x00070000U
 #define PCI_CAP_TYPE_SHIFT	16
-#define PCI_CAP_REV_MASK	0x00F80000
+#define PCI_CAP_REV_MASK	0x00F80000U
 #define PCI_CAP_REV_SHIFT	19
-#define PCI_CAP_IOTLB_MASK	0x01000000
+#define PCI_CAP_IOTLB_MASK	0x01000000U
 #define PCI_CAP_IOTLB_SHIFT	24
-#define PCI_CAP_HT_TUNNEL_MASK	0x02000000
+#define PCI_CAP_HT_TUNNEL_MASK	0x02000000U
 #define PCI_CAP_HT_TUNNEL_SHIFT	25
-#define PCI_CAP_NP_CACHE_MASK	0x04000000
+#define PCI_CAP_NP_CACHE_MASK	0x04000000U
 #define PCI_CAP_NP_CACHE_SHIFT	26
 #define PCI_CAP_EFRSUP_SHIFT    27
-#define PCI_CAP_RESET_MASK	0x80000000
+#define PCI_CAP_RESET_MASK	0x80000000U
 #define PCI_CAP_RESET_SHIFT	31
 
 #define PCI_CAP_TYPE_IOMMU		0x3
 
 #define PCI_CAP_MMIO_BAR_LOW_OFFSET	0x04
 #define PCI_CAP_MMIO_BAR_HIGH_OFFSET	0x08
-#define PCI_CAP_MMIO_BAR_LOW_MASK	0xFFFFC000
+#define PCI_CAP_MMIO_BAR_LOW_MASK	0xFFFFC000U
 #define IOMMU_MMIO_REGION_LENGTH	0x4000
 
 #define PCI_CAP_RANGE_OFFSET		0x0C
-#define PCI_CAP_BUS_NUMBER_MASK		0x0000FF00
+#define PCI_CAP_BUS_NUMBER_MASK		0x0000FF00U
 #define PCI_CAP_BUS_NUMBER_SHIFT	8
-#define PCI_CAP_FIRST_DEVICE_MASK	0x00FF0000
+#define PCI_CAP_FIRST_DEVICE_MASK	0x00FF0000U
 #define PCI_CAP_FIRST_DEVICE_SHIFT	16
-#define PCI_CAP_LAST_DEVICE_MASK	0xFF000000
+#define PCI_CAP_LAST_DEVICE_MASK	0xFF000000U
 #define PCI_CAP_LAST_DEVICE_SHIFT	24
 
-#define PCI_CAP_UNIT_ID_MASK    0x0000001F
+#define PCI_CAP_UNIT_ID_MASK    0x0000001FU
 #define PCI_CAP_UNIT_ID_SHIFT   0
 #define PCI_CAP_MISC_INFO_OFFSET    0x10
-#define PCI_CAP_MSI_NUMBER_MASK     0x0000001F
+#define PCI_CAP_MSI_NUMBER_MASK     0x0000001FU
 #define PCI_CAP_MSI_NUMBER_SHIFT    0
 
 /* Device Table */
 #define IOMMU_DEV_TABLE_BASE_LOW_OFFSET		0x00
 #define IOMMU_DEV_TABLE_BASE_HIGH_OFFSET	0x04
-#define IOMMU_DEV_TABLE_SIZE_MASK		0x000001FF
+#define IOMMU_DEV_TABLE_SIZE_MASK		0x000001FFU
 #define IOMMU_DEV_TABLE_SIZE_SHIFT		0
 
 #define IOMMU_DEV_TABLE_ENTRIES_PER_BUS		256
@@ -159,13 +159,13 @@ struct amd_iommu_dte {
 #define IOMMU_CMD_BUFFER_BASE_HIGH_OFFSET	0x0C
 #define IOMMU_CMD_BUFFER_HEAD_OFFSET		0x2000
 #define IOMMU_CMD_BUFFER_TAIL_OFFSET		0x2008
-#define IOMMU_CMD_BUFFER_LENGTH_MASK		0x0F000000
+#define IOMMU_CMD_BUFFER_LENGTH_MASK		0x0F000000U
 #define IOMMU_CMD_BUFFER_LENGTH_SHIFT		24
 
 #define IOMMU_CMD_BUFFER_ENTRY_ORDER            4
 #define IOMMU_CMD_BUFFER_MAX_ENTRIES            (1u << 15)
 
-#define IOMMU_CMD_OPCODE_MASK			0xF0000000
+#define IOMMU_CMD_OPCODE_MASK			0xF0000000U
 #define IOMMU_CMD_OPCODE_SHIFT			28
 #define IOMMU_CMD_COMPLETION_WAIT		0x1
 #define IOMMU_CMD_INVALIDATE_DEVTAB_ENTRY	0x2
@@ -178,50 +178,50 @@ struct amd_iommu_dte {
 /* COMPLETION_WAIT command */
 #define IOMMU_COMP_WAIT_DATA_BUFFER_SIZE	8
 #define IOMMU_COMP_WAIT_DATA_BUFFER_ALIGNMENT	8
-#define IOMMU_COMP_WAIT_S_FLAG_MASK		0x00000001
-#define IOMMU_COMP_WAIT_I_FLAG_MASK		0x00000002
-#define IOMMU_COMP_WAIT_F_FLAG_MASK		0x00000004
-#define IOMMU_COMP_WAIT_ADDR_LOW_MASK		0xFFFFFFF8
+#define IOMMU_COMP_WAIT_S_FLAG_MASK		0x00000001U
+#define IOMMU_COMP_WAIT_I_FLAG_MASK		0x00000002U
+#define IOMMU_COMP_WAIT_F_FLAG_MASK		0x00000004U
+#define IOMMU_COMP_WAIT_ADDR_LOW_MASK		0xFFFFFFF8U
 #define IOMMU_COMP_WAIT_ADDR_LOW_SHIFT		3
-#define IOMMU_COMP_WAIT_ADDR_HIGH_MASK		0x000FFFFF
+#define IOMMU_COMP_WAIT_ADDR_HIGH_MASK		0x000FFFFFU
 #define IOMMU_COMP_WAIT_ADDR_HIGH_SHIFT		0
 
 /* INVALIDATE_IOMMU_PAGES command */
-#define IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_MASK	0x0000FFFF
+#define IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_MASK	0x0000FFFFU
 #define IOMMU_INV_IOMMU_PAGES_DOMAIN_ID_SHIFT	0
-#define IOMMU_INV_IOMMU_PAGES_S_FLAG_MASK	0x00000001
+#define IOMMU_INV_IOMMU_PAGES_S_FLAG_MASK	0x00000001U
 #define IOMMU_INV_IOMMU_PAGES_S_FLAG_SHIFT	0
-#define IOMMU_INV_IOMMU_PAGES_PDE_FLAG_MASK	0x00000002
+#define IOMMU_INV_IOMMU_PAGES_PDE_FLAG_MASK	0x00000002U
 #define IOMMU_INV_IOMMU_PAGES_PDE_FLAG_SHIFT	1
-#define IOMMU_INV_IOMMU_PAGES_ADDR_LOW_MASK	0xFFFFF000
+#define IOMMU_INV_IOMMU_PAGES_ADDR_LOW_MASK	0xFFFFF000U
 #define IOMMU_INV_IOMMU_PAGES_ADDR_LOW_SHIFT	12
-#define IOMMU_INV_IOMMU_PAGES_ADDR_HIGH_MASK	0xFFFFFFFF
+#define IOMMU_INV_IOMMU_PAGES_ADDR_HIGH_MASK	0xFFFFFFFFU
 #define IOMMU_INV_IOMMU_PAGES_ADDR_HIGH_SHIFT	0
 
 /* INVALIDATE_DEVTAB_ENTRY command */
-#define IOMMU_INV_DEVTAB_ENTRY_DEVICE_ID_MASK   0x0000FFFF
+#define IOMMU_INV_DEVTAB_ENTRY_DEVICE_ID_MASK   0x0000FFFFU
 #define IOMMU_INV_DEVTAB_ENTRY_DEVICE_ID_SHIFT  0
 
 /* INVALIDATE_INTERRUPT_TABLE command */
-#define IOMMU_INV_INT_TABLE_DEVICE_ID_MASK   0x0000FFFF
+#define IOMMU_INV_INT_TABLE_DEVICE_ID_MASK   0x0000FFFFU
 #define IOMMU_INV_INT_TABLE_DEVICE_ID_SHIFT  0
 
 /* INVALIDATE_IOTLB_PAGES command */
-#define IOMMU_INV_IOTLB_PAGES_MAXPEND_MASK          0xff000000
+#define IOMMU_INV_IOTLB_PAGES_MAXPEND_MASK          0xff000000U
 #define IOMMU_INV_IOTLB_PAGES_MAXPEND_SHIFT         24
-#define IOMMU_INV_IOTLB_PAGES_PASID1_MASK           0x00ff0000
+#define IOMMU_INV_IOTLB_PAGES_PASID1_MASK           0x00ff0000U
 #define IOMMU_INV_IOTLB_PAGES_PASID1_SHIFT          16
-#define IOMMU_INV_IOTLB_PAGES_PASID2_MASK           0x0fff0000
+#define IOMMU_INV_IOTLB_PAGES_PASID2_MASK           0x0fff0000U
 #define IOMMU_INV_IOTLB_PAGES_PASID2_SHIFT          16
-#define IOMMU_INV_IOTLB_PAGES_QUEUEID_MASK          0x0000ffff
+#define IOMMU_INV_IOTLB_PAGES_QUEUEID_MASK          0x0000ffffU
 #define IOMMU_INV_IOTLB_PAGES_QUEUEID_SHIFT         0
-#define IOMMU_INV_IOTLB_PAGES_DEVICE_ID_MASK        0x0000FFFF
+#define IOMMU_INV_IOTLB_PAGES_DEVICE_ID_MASK        0x0000FFFFU
 #define IOMMU_INV_IOTLB_PAGES_DEVICE_ID_SHIFT       0
-#define IOMMU_INV_IOTLB_PAGES_ADDR_LOW_MASK         0xFFFFF000
+#define IOMMU_INV_IOTLB_PAGES_ADDR_LOW_MASK         0xFFFFF000U
 #define IOMMU_INV_IOTLB_PAGES_ADDR_LOW_SHIFT        12
-#define IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_MASK        0xFFFFFFFF
+#define IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_MASK        0xFFFFFFFFU
 #define IOMMU_INV_IOTLB_PAGES_ADDR_HIGH_SHIFT       0
-#define IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK           0x00000001
+#define IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK           0x00000001U
 #define IOMMU_INV_IOTLB_PAGES_S_FLAG_SHIFT          0
 
 /* Event Log */
@@ -229,18 +229,18 @@ struct amd_iommu_dte {
 #define IOMMU_EVENT_LOG_BASE_HIGH_OFFSET	0x14
 #define IOMMU_EVENT_LOG_HEAD_OFFSET		0x2010
 #define IOMMU_EVENT_LOG_TAIL_OFFSET		0x2018
-#define IOMMU_EVENT_LOG_LENGTH_MASK		0x0F000000
+#define IOMMU_EVENT_LOG_LENGTH_MASK		0x0F000000U
 #define IOMMU_EVENT_LOG_LENGTH_SHIFT		24
-#define IOMMU_EVENT_LOG_HEAD_MASK		0x0007FFF0
+#define IOMMU_EVENT_LOG_HEAD_MASK		0x0007FFF0U
 #define IOMMU_EVENT_LOG_HEAD_SHIFT		4
-#define IOMMU_EVENT_LOG_TAIL_MASK		0x0007FFF0
+#define IOMMU_EVENT_LOG_TAIL_MASK		0x0007FFF0U
 #define IOMMU_EVENT_LOG_TAIL_SHIFT		4
 
 #define IOMMU_EVENT_LOG_ENTRY_SIZE 			16
 #define IOMMU_EVENT_LOG_POWER_OF2_ENTRIES_PER_PAGE	8
 #define IOMMU_EVENT_LOG_U32_PER_ENTRY	(IOMMU_EVENT_LOG_ENTRY_SIZE / 4)
 
-#define IOMMU_EVENT_CODE_MASK			0xF0000000
+#define IOMMU_EVENT_CODE_MASK			0xF0000000U
 #define IOMMU_EVENT_CODE_SHIFT			28
 #define IOMMU_EVENT_ILLEGAL_DEV_TABLE_ENTRY	0x1
 #define IOMMU_EVENT_IO_PAGE_FAULT		0x2
@@ -251,12 +251,12 @@ struct amd_iommu_dte {
 #define IOMMU_EVENT_IOTLB_INV_TIMEOUT		0x7
 #define IOMMU_EVENT_INVALID_DEV_REQUEST		0x8
 
-#define IOMMU_EVENT_DOMAIN_ID_MASK           0x0000FFFF
+#define IOMMU_EVENT_DOMAIN_ID_MASK           0x0000FFFFU
 #define IOMMU_EVENT_DOMAIN_ID_SHIFT          0
-#define IOMMU_EVENT_DEVICE_ID_MASK           0x0000FFFF
+#define IOMMU_EVENT_DEVICE_ID_MASK           0x0000FFFFU
 #define IOMMU_EVENT_DEVICE_ID_SHIFT          0
 #define IOMMU_EVENT_FLAGS_SHIFT              16
-#define IOMMU_EVENT_FLAGS_MASK               0x0FFF0000
+#define IOMMU_EVENT_FLAGS_MASK               0x0FFF0000U
 
 /* PPR Log */
 #define IOMMU_PPR_LOG_ENTRY_SIZE                        16
@@ -265,21 +265,21 @@ struct amd_iommu_dte {
 
 #define IOMMU_PPR_LOG_BASE_LOW_OFFSET                   0x0038
 #define IOMMU_PPR_LOG_BASE_HIGH_OFFSET                  0x003C
-#define IOMMU_PPR_LOG_BASE_LOW_MASK                     0xFFFFF000
+#define IOMMU_PPR_LOG_BASE_LOW_MASK                     0xFFFFF000U
 #define IOMMU_PPR_LOG_BASE_LOW_SHIFT                    12
-#define IOMMU_PPR_LOG_BASE_HIGH_MASK                    0x000FFFFF
+#define IOMMU_PPR_LOG_BASE_HIGH_MASK                    0x000FFFFFU
 #define IOMMU_PPR_LOG_BASE_HIGH_SHIFT                   0
-#define IOMMU_PPR_LOG_LENGTH_MASK                       0x0F000000
+#define IOMMU_PPR_LOG_LENGTH_MASK                       0x0F000000U
 #define IOMMU_PPR_LOG_LENGTH_SHIFT                      24
-#define IOMMU_PPR_LOG_HEAD_MASK                         0x0007FFF0
+#define IOMMU_PPR_LOG_HEAD_MASK                         0x0007FFF0U
 #define IOMMU_PPR_LOG_HEAD_SHIFT                        4
-#define IOMMU_PPR_LOG_TAIL_MASK                         0x0007FFF0
+#define IOMMU_PPR_LOG_TAIL_MASK                         0x0007FFF0U
 #define IOMMU_PPR_LOG_TAIL_SHIFT                        4
 #define IOMMU_PPR_LOG_HEAD_OFFSET                       0x2030
 #define IOMMU_PPR_LOG_TAIL_OFFSET                       0x2038
-#define IOMMU_PPR_LOG_DEVICE_ID_MASK                    0x0000FFFF
+#define IOMMU_PPR_LOG_DEVICE_ID_MASK                    0x0000FFFFU
 #define IOMMU_PPR_LOG_DEVICE_ID_SHIFT                   0
-#define IOMMU_PPR_LOG_CODE_MASK                         0xF0000000
+#define IOMMU_PPR_LOG_CODE_MASK                         0xF0000000U
 #define IOMMU_PPR_LOG_CODE_SHIFT                        28
 
 #define IOMMU_LOG_ENTRY_TIMEOUT                         1000
@@ -342,17 +342,17 @@ union amd_iommu_control {
 #define IOMMU_EXCLUSION_BASE_HIGH_OFFSET	0x24
 #define IOMMU_EXCLUSION_LIMIT_LOW_OFFSET	0x28
 #define IOMMU_EXCLUSION_LIMIT_HIGH_OFFSET	0x2C
-#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000
+#define IOMMU_EXCLUSION_BASE_LOW_MASK		0xFFFFF000U
 #define IOMMU_EXCLUSION_BASE_LOW_SHIFT		12
-#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFF
+#define IOMMU_EXCLUSION_BASE_HIGH_MASK		0xFFFFFFFFU
 #define IOMMU_EXCLUSION_BASE_HIGH_SHIFT		0
-#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001
+#define IOMMU_EXCLUSION_RANGE_ENABLE_MASK	0x00000001U
 #define IOMMU_EXCLUSION_RANGE_ENABLE_SHIFT	0
-#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002
+#define IOMMU_EXCLUSION_ALLOW_ALL_MASK		0x00000002U
 #define IOMMU_EXCLUSION_ALLOW_ALL_SHIFT		1
-#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000
+#define IOMMU_EXCLUSION_LIMIT_LOW_MASK		0xFFFFF000U
 #define IOMMU_EXCLUSION_LIMIT_LOW_SHIFT		12
-#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFF
+#define IOMMU_EXCLUSION_LIMIT_HIGH_MASK		0xFFFFFFFFU
 #define IOMMU_EXCLUSION_LIMIT_HIGH_SHIFT	0
 
 /* Extended Feature Register */
@@ -476,14 +476,14 @@ union amd_iommu_pte {
 
 #define INV_IOMMU_ALL_PAGES_ADDRESS      ((1ULL << 63) - 1)
 
-#define IOMMU_RING_BUFFER_PTR_MASK                  0x0007FFF0
+#define IOMMU_RING_BUFFER_PTR_MASK                  0x0007FFF0U
 
-#define IOMMU_CMD_DEVICE_ID_MASK                    0x0000FFFF
+#define IOMMU_CMD_DEVICE_ID_MASK                    0x0000FFFFU
 #define IOMMU_CMD_DEVICE_ID_SHIFT                   0
 
-#define IOMMU_REG_BASE_ADDR_LOW_MASK                0xFFFFF000
+#define IOMMU_REG_BASE_ADDR_LOW_MASK                0xFFFFF000U
 #define IOMMU_REG_BASE_ADDR_LOW_SHIFT               12
-#define IOMMU_REG_BASE_ADDR_HIGH_MASK               0x000FFFFF
+#define IOMMU_REG_BASE_ADDR_HIGH_MASK               0x000FFFFFU
 #define IOMMU_REG_BASE_ADDR_HIGH_SHIFT              0
 
 #endif /* AMD_IOMMU_DEFS_H */
-- 
2.41.0


