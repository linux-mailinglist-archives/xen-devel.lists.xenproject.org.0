Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9F36DE4A4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519806.806894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWC-0005fJ-0A; Tue, 11 Apr 2023 19:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519806.806894; Tue, 11 Apr 2023 19:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWB-0005cJ-Rb; Tue, 11 Apr 2023 19:19:03 +0000
Received: by outflank-mailman (input) for mailman id 519806;
 Tue, 11 Apr 2023 19:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUW-0004Ta-0r
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:20 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78375fb9-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:16 +0200 (CEST)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Tue, 11 Apr
 2023 19:17:13 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::68) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.22 via Frontend Transport; Tue, 11 Apr 2023 19:17:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:12 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:11 -0500
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
X-Inumbo-ID: 78375fb9-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2ZtciHNQZJ1CW8HGjWQBQaYU9j7azTGq6d429aQHdzUVfNY+HEgTexkd1sVJO95biDcrw3hgcE8H0Nhfj6TVvlcjMKaZcfDuC/c9XeHnS9V6r9rSmjMYVn3FEsNiW1LtemPqHGo5qL25K31njuz1We61WKQV2YKzT+gP6pozm0ir/rloUptHimg11gAPZEhFFsHc+nx+vEEXyNLoujb5SteJ374nbnXx8ini/09XWbtmfiystSKJZmvIykJr3Rs+uqbEChCRx4bFKC9flyn2KIoTFOSeDWvCzM2mVwkBLUcHfeusV4036wQatGP8EOvvN/VmDXJw9KT8Zwq5O5V2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5jE5w9tUBXYNb4GkaW66AGdvE8156w4aHYPgYkE7PU=;
 b=YxFnbaNOWzAlnzIFiw5613yOUxX5R0jVPGMcq9tgF0BRy+RgiKllDzuhPiGZi4U/anDvOkAhTzSxfD32QfPw4G5qPtW0FMVYC6cLJXEYYBtqLhxaar+tvmo1OSPE11OsG1AC6NzIT/IZ8H72vJ/Dr3IQJ1BtAsnbw3q2jN5KnREaiSATqwdksWmYNidCxWdfIwd+2sry/2/Lw24edOu8VlR8AVk/1JZJbnXZIXfJLAvODKVdsolt14jiPzYuPgOjMmqdEonYpHHT+lkiovERI2trJrfi+11dpHvgsbzW7tWEcbXGzQoNmKnDllw7C86cqYxNHsQjlLPs0WPYuFrUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5jE5w9tUBXYNb4GkaW66AGdvE8156w4aHYPgYkE7PU=;
 b=JQ/hU2P8vnyDzTVBSxNElxt8ZK5IT7TJQ8XEi+uUvWOa4YWebyhtS7WVkuVhxIIX8e3Dhu+yBATcGbf7wjzBLwILdKKGViPVecu7FoMITWx/tdHMCZz8NVhjbni0K1Nid5jHmBpNw7nTztLWeeA7mXUiK6oVmWGAoeWIeEJHmaM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v5 03/17] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Tue, 11 Apr 2023 12:16:22 -0700
Message-ID: <20230411191636.26926-22-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d21aa73-be46-49f3-61ab-08db3ac15aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Ye5PZBaC4XZ9/w0ud9o+0cmn0rwEgLvLYNNpTFIOK1wvfkPHxko6LLG21O64/yuJ4XkFLLeJfgt07VWzZQ6JKyRwMV7YuL3ktryLnBiE5FbYWIA7nwElkY1UInIzC79O/6u/lKjWh8ae0Wl/YfBxRZ21t7APPccxvQJtL3b/kmbb2ZZEaNKP4TqZWcAIBEr+SUmZoRwFsAJZlY0sBjtdXR6SyXy7+A/BOiLmp+Ns3yYGXCxFgZ7SSbDIHVWxBS+gADFTtSP6IER7T6efdjCTiEmp5n2I3tCyZHGEdVphRHLZOqHuxM8PSDxE7aCaIOdjHhU3J0SDgNHSYN1u2uTeJNYYIdAXidar1rYAm1afauzkt34f7P7JagqmOLb23Ja0TKBHTZAReO9KhQfeHojhCjSr/YMWcVW7KHcbSiP4Ow4sbvKdO1RNWgUxmBl4xHWZrq+YQkPHZG36AO5bDuRBU3RTIQZgw71y0j9xIXjZ+CYlEIvpopbvkwurva+eKQoDtyJDbCHXvLPrX9wtJhv0AcDJWXM8B6ckzwg5rfgL9tX2ZlkZUuYxPpkUCnDlz+sxYQNy+OznMRmAlNwAzmgCRHeI6hNoH4l8jygKzfZCXmRvd8L9MrxbyG0abRgdFOT1JnQGMwv495pWlcqa63M4JWnGw49JDeL5fSLeLIWIzaaWbcCC1qUzZO0lgbhfbcImPt6/qXunohb3VRLPLFamNJ3L0x8obJ4/8DUowVr41s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(186003)(8936002)(1076003)(26005)(40460700003)(478600001)(82310400005)(36860700001)(316002)(70206006)(54906003)(40480700001)(4326008)(6916009)(81166007)(6666004)(36756003)(86362001)(356005)(8676002)(70586007)(82740400003)(41300700001)(44832011)(2616005)(2906002)(47076005)(426003)(336012)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:13.1128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d21aa73-be46-49f3-61ab-08db3ac15aec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f..0a31f40af4 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -822,6 +822,12 @@ No support for QEMU backends in a 16K or 64K domain.
 
     Status: Supported
 
+### Device Tree Overlays
+
+Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
+
+    Status: Supported for ARM
+
 ### ARM: Guest ACPI support
 
     Status: Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..1fe3d698a5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -53,6 +53,11 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
 
+config OVERLAY_DTB
+	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	help
+	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
+
 config HVM
         def_bool y
 
-- 
2.17.1


