Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D4A2B876
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883270.1293337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ5-0003mN-Lh; Fri, 07 Feb 2025 01:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883270.1293337; Fri, 07 Feb 2025 01:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ5-0003fL-HW; Fri, 07 Feb 2025 01:53:55 +0000
Received: by outflank-mailman (input) for mailman id 883270;
 Fri, 07 Feb 2025 01:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZ3-0003b1-Vo
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2416::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604f9cc3-e4f6-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 02:53:51 +0100 (CET)
Received: from BN9PR03CA0944.namprd03.prod.outlook.com (2603:10b6:408:108::19)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 01:53:47 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::a) by BN9PR03CA0944.outlook.office365.com
 (2603:10b6:408:108::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Fri,
 7 Feb 2025 01:53:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:45 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:44 -0600
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
X-Inumbo-ID: 604f9cc3-e4f6-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwh5qN1XChZy8uTrGnB0z2wZ5a3hwaJ5sTeDq6LHGX8HkMVG55P9+mm4ccwP8kE7tx+G8MtZkmAjH4aPzy4t7nfTxndwIX1lAJgEs4ll67oCPu+rW1H3DTJqB1Ryta2r0x1dABpYg4HAL7PL6j8404QVW8/nQHPfSxxHMAIN1yPOmRSEws2xO6ZK1IHtCxr8H1zhB5gkb+HWGzwSWclSO/HOcJWflcawta7erAEDe8qJLJL/TzG3pge+FLpZbbl7wNuOABNMJJNCY61TvEjfQ0Zq/vYXhK13CBUdKZK893eWVoLXTXTTrjxXgCGJFBXU+Gy6S1vPd9Jj1euHHxM0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdNnZPT/EWWNxVMQKl2mVk9CKJViJCGFeX7uqj/5yiU=;
 b=K8Nj9EHfniP8aatN3jWblCWPSLjgfFyX8EG2at2bEbn5UO6hIBCsFbqO5vJtMXWpJ6EVgc6bry404Dii2HVbeHwhgc8GsPBE9Av3qHxgE4Or1bnE+lJtX4Ohf/yRjyJBJe5C9wce0aj/QtSIckWT2WBQjGeyIoJ8rWKVZ4WWNnTj/BI/XwI8WfUD0EzknI5kCDxdTedIpiMSIKFR73H6QQl+Z/q/ZnzbkLwfx/RMPEedZR3eHso/EQ61GOYjVRMOa74r5oqRpMcYROm4u51O+xtA2SJw8VhbsB/jgnHi/BZWVvb+4K7Up2svXrHBW4rcwMxWmYfdB9kZFm6KFHxH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdNnZPT/EWWNxVMQKl2mVk9CKJViJCGFeX7uqj/5yiU=;
 b=Aoes1rfEnwH8YP7xS5f5AKOaHxgiDTwIvpioMcXrv9rWQMxVcJ7oKvq8VTktMZTmjn2zqyzd28k+u3ZNEgj2EyySKCWUGPYUpZi0i5NPAWdEJ4kXo2qYMVlHtwXArlRhf3SW+VsVB6wcsMge8l2ZotfBe/mP/CpvBow1QrruDGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v6 4/7] automation: add ping test to static-mem test
Date: Thu, 6 Feb 2025 17:53:38 -0800
Message-ID: <20250207015341.1208429-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|CY5PR12MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d84034-3f6a-427e-5d9e-08dd471a42a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UoCdwgCLVBxqS74stUzjhaDhftB7rhVtkjsZOA1t4YeYl+qLoblCZkvLYKf/?=
 =?us-ascii?Q?YnutNdNyy6MJ9STTsInAsDjEfOLYS3mzRGvXsHKzb0r0Gk7tQ+ENjf1vMT5u?=
 =?us-ascii?Q?uBT3RXmF10x1GLIcyZh5nfWzRl0qRc0Y0AN9+bEXH2doSagrdv6ZbR/yj6m1?=
 =?us-ascii?Q?OxjY7A3rGkwNannxZREnJANYleblrXejBrXNpDt0SkVNaKix+FD2i+3izpeH?=
 =?us-ascii?Q?XTjnFmAa2NFiOpYW14ATLXRmAibeSP/eRE5yrC1wlXFe10k8yWMz0ScmJ4zF?=
 =?us-ascii?Q?aEpSvpFMUiDccs53QK4IRCRhXM2u7bbcwYGA2iZ6RpV8bQTUEoCye4961bTG?=
 =?us-ascii?Q?33U93t5xH7oEWabTNwOJeOQuojI8fhLVtko7oHnplAKzV8GfZYz9YwtUJBD9?=
 =?us-ascii?Q?4ldvy7JwYI/fjDrn44FxaaY8VbnqT+5K5qRUqYEeD0S0r1cbYHByfK0Itv4g?=
 =?us-ascii?Q?qLGnXnnkwNeiDigPIdbLfmEqhqktphb8YWmXyNvK2X2XLRXLiAyHxdeg2qTY?=
 =?us-ascii?Q?MVjF0bYxOoOeO5kxPnzUIasEpkBXryCeaHidst0h1mRpU07wuZSsj6JnTopl?=
 =?us-ascii?Q?dE7/FN/CzfsmY7UhxABPcy1Z/CTRxJ1VHgYdlcEhvORQJi+k/M4W32YttORk?=
 =?us-ascii?Q?lFX7naK+3y1HrobXQDqT8BjHlXrtuhrezxcvqVByy2Fim1n4JrU5fiK62VSV?=
 =?us-ascii?Q?bMs5lma6tcRrKstQXTTvFAp5/2PrCE0jVtODEp5PBnOVvMD2hsGa54SCUHTJ?=
 =?us-ascii?Q?x0JypUZG9DeG8gLLMou7p7USDSQyjyAEOzSogQ0asvDbtpveZ7kETRZ/9hlh?=
 =?us-ascii?Q?Jl9ihTRNthqMF9tPfky9TEH/Ly4K3CNq2Bm4JXVwq3nczuMBGyoo62S7ApBQ?=
 =?us-ascii?Q?NnZxTFgUDjAgxJxUgW96s/7L235gC3cbb84N6yjVosazQALX0keksJKwhKFa?=
 =?us-ascii?Q?nRCp/k14Fs0TbXKLqGHSJw2kUjlUfdQ9H5aztgLtR+/JM/CrUk3UdMS1yT6I?=
 =?us-ascii?Q?Cf/W74jTNliUFXK/Pa4u0UIog9DdpxVIzJqKqUzo5kORB8URgLfDEq6TFcyC?=
 =?us-ascii?Q?iY5AJlDffMxunU1XkYwREi0f7oe4wSE0ITtArXHBEhv3Vj4WhS74BDkAfq8u?=
 =?us-ascii?Q?BGCrZ4W7vfUcvwu9b1Jz8jBfNYrOp8mTm141Dl/DNOIePBFeomS+/lJRLVBY?=
 =?us-ascii?Q?T/jEuFRwsgPrFgmIZXmgknrd2c0QwzmmQLHRuOROjHouI+KWaMN4jvURe2rS?=
 =?us-ascii?Q?jHwLmnFGDf8aktGpH5MI/S8HeBXPzvdTcGxJ1UYlDymxg/59winsiEnptA5x?=
 =?us-ascii?Q?RuNR0/yGE1W8qPqmsxEa9iS9yxf7z4hAxqeexBkyIhsfaR/78GhJguqZ6yKs?=
 =?us-ascii?Q?+Y2e5C8lE4cvi4CVTTVnxR5vJyEjqTUvGeHxG0J6EIaH0IPmV6g8Akr/0L1g?=
 =?us-ascii?Q?K4oRCOW8PFvniXdGavIkDqbyYthrJ2iuJ6DMAfBy7w2LJvasWy8V9Q3GiUSA?=
 =?us-ascii?Q?yTRubkGyuB+naRA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:46.8421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d84034-3f6a-427e-5d9e-08dd471a42a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201

With the recent fixes, Dom0less direct mapped domains can use PV
drivers. Extend the existing PV network ping tests to direct mapped
guests.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 83e1866ca6..f72d209361 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -25,6 +25,9 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     domU_check="
 mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
 if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
+    until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
+        sleep 30
+    done
     echo \"${passed}\"
 fi
 "
-- 
2.25.1


