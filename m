Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9275AD4134
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 19:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011155.1389506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP33f-000166-Gp; Tue, 10 Jun 2025 17:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011155.1389506; Tue, 10 Jun 2025 17:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP33f-00012z-Cl; Tue, 10 Jun 2025 17:46:47 +0000
Received: by outflank-mailman (input) for mailman id 1011155;
 Tue, 10 Jun 2025 17:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghGr=YZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uP33e-00012t-7K
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 17:46:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def93b78-4622-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 19:46:44 +0200 (CEST)
Received: from DM6PR08CA0029.namprd08.prod.outlook.com (2603:10b6:5:80::42) by
 IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Tue, 10 Jun
 2025 17:46:40 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:80:cafe::b1) by DM6PR08CA0029.outlook.office365.com
 (2603:10b6:5:80::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 10 Jun 2025 17:46:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 17:46:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 12:46:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 12:46:37 -0500
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
X-Inumbo-ID: def93b78-4622-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXepyki7lPQi795Hsr6y6frYhaDCD5C9UNfkovwIRR8rMBihKqLckAlMUf0Ej5fkd/f3MNgvZt5VU/CZSN+F6kgTbfWCrix4cVJvbylbkkCaG6Bq9yzbTFlsHTp09CADGkKaZmR55MNhgerjVKg9tRzW5iDU139t0mWsrCH3GPdR24kd+dJe3EhVZ+VgqrjG7NtVuse95r8Nr5+lBsvcbB47ebdIEOrSNeqBt2jux0XkmkBaYKdgfoRRHwPAVS97edMbSgVZm2IJct/MbVbD7oK/U6KaR0nO1yONoe4LfmSJ6AN/A6W/XCiy1l4HpcNvuwp3TBwEwWrONL5ETue4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bEb9fNvb2msY5p20GZTzmeXGe1QTu1AvV8qLq/dRag=;
 b=Uh3MTHMZOrcx9YBwAlmv1migvVkr6KGQqDO8S/YyyCgM0mFkB7z17NpQhVYu2YSeWiE2eJK015NpbIfu88xoQtIgL0AJaX/E5fJgcUUte3o3FnNwkl2Pn8nwMFHvD5Ktq4TVa6QbnX+5XF3PyQhX9AD+ZQViSUt/bGWQIhur/b39kkSne/GAZiVIM5Y9SFQXdJ346MxJS43UiHbiETgXwC8pvzHiTFzT8XE9OXM0rMoqRkiLfg7D1+ljpvBrrJm3YW1eImpQ0pzjf5/PQrqXGJgK/gj4BI4TFTi2nJ1F9eqqLPUU0R/QUcpOsFe/AH9Z3FOgBhL7SKTW5RbAq1aF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bEb9fNvb2msY5p20GZTzmeXGe1QTu1AvV8qLq/dRag=;
 b=Fg0hI4emgKvHvideCPrIeXlTXybizUmaEnnXxemaslPHJR9LflBHVWJlpe7VkohwtJPkPKdCYNN+7CNM4VeR0ZVFkEv3lUIjH8tBZvwaTpO0X7AWOsPkkUGbk1zdrMKI1FZ+9wEFtM1aNgtPPVLyGriAEm1fDrNN7bN6ANW9TAo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v7] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Tue, 10 Jun 2025 13:46:22 -0400
Message-ID: <20250610174635.203439-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e711a4c-162d-4ba3-d8e7-08dda846c13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qhhAYKs0h/6MvD6FKZoJvbGdg2N6XM095gSJnfuPwOtIO5J5ZsDKVkPOQ3jT?=
 =?us-ascii?Q?BVDwByu1j7hNncDDMZi/BUswFvaLSPUoKD19HokSUuXQ3aB2n/DFLdHYY3WN?=
 =?us-ascii?Q?GmKAChvqXhUb+4CYm4J3sL+GTBnea46hsCXnmy8mFguMdi1fRoa/HUhxusTq?=
 =?us-ascii?Q?KHrHOZMm9ggZCFfXEMKRjWgOzFyOwkoL4zsp68zibnj8m1HTbByKHsELUhxs?=
 =?us-ascii?Q?lfQNNNtPwAVK+NFnCZCPxMj53aKKL49VjwjGwjZAR3hvUtE3DporRYQQF4Nd?=
 =?us-ascii?Q?sxRv8ge5juO/UJzZ0LTCTQCpPjVEo3p4OdVpwC1VSs3H+1WKmPOHcr48Jf77?=
 =?us-ascii?Q?J5UBX5LKGZgh6q5yERxXDUer5ZIgvPRVuvKwmCA/mun+KVKDuqsokIqm9PeY?=
 =?us-ascii?Q?q1yao65B2AikirPs/E/84rvy6DzvclOA8gOtNTMPY4fQX1hKwwUiwWhLXS5G?=
 =?us-ascii?Q?sONm6BqgvSmhs0ZAGEwE9m+Yxl3Oa41qN9uaZpVExAcnqBn1UeV5NE/W9VhY?=
 =?us-ascii?Q?O2Z2jQWltnRXMm2Y9WmXSa8PmTa90uFi2NGceQInusa8XYXGvWIK1gRtqAJs?=
 =?us-ascii?Q?z6k7s2W8EGu4a7HWpr0cNxGAa5hLpEAX+3cS5tNTiqdTBCPCRwy6G/HXtwcW?=
 =?us-ascii?Q?V1mQ8iZafpx/d0gTvVKQev7BMW4bIvdW840KOqJ3pJXWbN0KsIscXaKFyaXs?=
 =?us-ascii?Q?8q+Z0fTo1vj09acZLRPQ0krk8pyD4ECw8L7UdIJZMOag3IgFOClR7iSVDiGm?=
 =?us-ascii?Q?SY5WssLWSjPUCEgxuiheDlaBb+EB+7uEClknXkyRlxBVDUtxxuUQWM1+DkY5?=
 =?us-ascii?Q?Xmvr/OmusT8v6+x0CgrZ7KrMMesxcFP08xOL9qiAQJn3h0P9qf1jy/8JIoaR?=
 =?us-ascii?Q?mu3dShq8+Bqw2YXYQPUGk709h/lIlPjhCLjO9kv40SusbJ069wJTTW99jEWh?=
 =?us-ascii?Q?V9kvg7cLEB25tq4O39lAtJJRBzrjfmSy31Evp9r2tXhf6kL+5T5tP7rh+Jwm?=
 =?us-ascii?Q?PIFy8qM1v9BZAz5J6a2woeVKYFKhhWhUAlnxIZ4VJ08k70Kqlemdf9hcNz4f?=
 =?us-ascii?Q?MWljBeEDgqpXrd+Exmo/pwLLT40zufDbgg1UWA3MJv+2r0nELrqJXOWzG/zi?=
 =?us-ascii?Q?xJXuvXk7CBYzswNnqqjeYKxJKBZuex8qxxhQ/+XRgEkcj5iwJoAGg16pKFD9?=
 =?us-ascii?Q?CDpCVEJnLiNjRdzsmequIrUhjrcb6OTTOWTUmLOktcDlyMSq5uNpaiZri49R?=
 =?us-ascii?Q?+3sSU6uHejLkVwXK5VF52TyKx6J8tFyf+o5QAyhBL05v9N/lKC9JE3Cz9v3/?=
 =?us-ascii?Q?Hf+EQ5UEcgsA03wk5VQ/1PNPfMdeS9C+2gLUPRvqnqv6ZBcG7+Sz9ooPYJMF?=
 =?us-ascii?Q?6OE93t6L52fJVUn0+nhWLuhydDY3HN3TNB/Bfx7Bvv/VNSooypmuXBHuDPCk?=
 =?us-ascii?Q?aCRIZNKkFEx0f4bXXIwPHPSS3yzFWu5Xn1dKRV1Z848qVmFbSblC16JIlvT7?=
 =?us-ascii?Q?MhKe4iZ7jwTHBQo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 17:46:39.8686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e711a4c-162d-4ba3-d8e7-08dda846c13a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

From: Rahul Singh <rahul.singh@arm.com>

Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM,
even though the feature is not yet complete in the current upstream
codebase. The purpose of this is to make it easier to enable the
necessary configs (HAS_PCI, HAS_VPCI) for testing and development of PCI
passthrough on ARM.

Since PCI passthrough on ARM is still work in progress at this time,
make it depend on EXPERT.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This requires ("xen/arm: fix build with HAS_PCI") [4] to be merged first

The alpine-3.18-gcc-arm64-randconfig CI job should pick up the new
config option, but if we wanted it to be built more consistently in CI
we could add CONFIG_PCI_PASSTHROUGH=y to one of the arm jobs in
automation/gitlab-ci/build.yaml, e.g. alpine-3.18-gcc-debug-arm64.

v6->v7:
* rebase
* send patch separately from series [3]
* add HAS_VPCI_GUEST_SUPPORT since it's upstream now
* drop Julien's A-b due to changes and was given several releases ago

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* no change

v2->v3:
* add Julien's A-b

v1->v2:
* drop "ARM" naming since it is already in an ARM category
* depend on EXPERT instead of UNSUPPORTED

Changes from downstream to v1:
* depends on ARM_64 (Stefano)
* Don't select HAS_VPCI_GUEST_SUPPORT since this config option is not currently
  used in the upstream codebase. This will want to be re-added here once the
  vpci series [2] is merged.
* Don't select ARM_SMMU_V3 since this option can already be selected
  independently. While PCI passthrough on ARM depends on an SMMU, it does not
  depend on a particular version or variant of an SMMU.
* Don't select HAS_ITS since this option can already be selected independently.
  HAS_ITS may want to be added here once the MSI series [1] is merged.
* Don't select LATE_HWDOM since this option is unrelated to PCI passthrough.

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthrough
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
[3] https://lore.kernel.org/xen-devel/20231113222118.825758-1-stewart.hildebrand@amd.com/T/#t
[4] https://lore.kernel.org/xen-devel/20250610142300.197599-1-stewart.hildebrand@amd.com/T/#t

(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])
---
 xen/arch/arm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f25da3ca5fd..778feff16a55 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -258,6 +258,16 @@ config PARTIAL_EMULATION
 
 source "arch/arm/firmware/Kconfig"
 
+config PCI_PASSTHROUGH
+	bool "PCI passthrough" if EXPERT
+	depends on ARM_64
+	select HAS_PCI
+	select HAS_VPCI
+	select HAS_VPCI_GUEST_SUPPORT
+	default n
+	help
+	  This option enables PCI device passthrough
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"

base-commit: 86a12671c5d33063b6f958bdcca7c9d14cd5aac8
-- 
2.49.0


