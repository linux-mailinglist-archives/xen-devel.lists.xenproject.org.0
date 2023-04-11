Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D56DE49A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519771.806760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUL-0005T8-GL; Tue, 11 Apr 2023 19:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519771.806760; Tue, 11 Apr 2023 19:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUL-0005MU-6G; Tue, 11 Apr 2023 19:17:09 +0000
Received: by outflank-mailman (input) for mailman id 519771;
 Tue, 11 Apr 2023 19:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUI-0004DR-7o
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70c37f42-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:04 +0200 (CEST)
Received: from MW3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:303:2b::9)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:01 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::87) by MW3PR05CA0004.outlook.office365.com
 (2603:10b6:303:2b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:01 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:56 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:55 -0500
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
X-Inumbo-ID: 70c37f42-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxpCf3u8aQhuKKrQ0T4SThXXP1/7rOEjefrnQSrBSTFBH+2vet0/BkN9/96BSOh7BRc29yBAuGPfWBrzsmO+z5fnIfCwZv+/W19BY/NV8YANilCikYT1V6SYpNidRCML6foQhvXzNpSPdoWeuYsSgXeXBoRcw30A9hLweGC05laY3bfZd0nKDfZygI2pHhb+DVTBGxMKHmbwxn5ZVbZ7WJk6S5aqZRc1vjlpRsq2ZVXjC8+8eeuht7v/iiIdbRQyVVxOlmpJIwUjwPmg0cum0s/L0CtRf+4gtmJkTKc71Q13em4p8IVwFzZY2HoSwbOnofwG8X+xRU252Zq5wh0tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5jE5w9tUBXYNb4GkaW66AGdvE8156w4aHYPgYkE7PU=;
 b=J8chaI68GCgVd6yiVlsCc2D6W9f8W6rt3VGRxdijG5QkKl4XmOHnBv8yIOYI/Rgw6Klo5ZQhcfIdeK4P15dtOyfRXRvLNo/MftvzVHrbSeH/vaYcM9RFyEJ7NUhxXpfNqKRi+aR0qwKnJVPtlrB7QQh00GsQM9m0Rodu36ZTFZeAjjD47Mx2VrRjvv9dtW52pf3kcqkolch+iGosTYvrcT784CYrbxufSy0xOdAiTpXV1A0iS3ImLKKJp6281qCGzbhF9c9Xln6UIHd4NKB3CWweckTiIqaye45CAj0ZJkXf6BnGjxwtBMmifjilgQ5RjO+UazrA0bzcIwYk090FzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5jE5w9tUBXYNb4GkaW66AGdvE8156w4aHYPgYkE7PU=;
 b=wxWB/BWXY2CO32y5vRS7236kub8VwKV+uQFpF+1OL7L0gNQP0NFpjSVE+5iJrM4LMKSlT0XcPeLcswieKsQ8nTGed5rjuOLbVuJXYhTiPU4/xfe0O9OCoYPR1oCufxMZ35hDCStB3gc6PZlfTqyQ9vA0Q0yoWaW96zC54AlnEGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v5 03/17] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Tue, 11 Apr 2023 12:16:04 -0700
Message-ID: <20230411191636.26926-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a1cd42-a56c-4eb5-c800-08db3ac153f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XWH3oXWHqcZD9sTbyewkrsWBFCMU89fDJmR4pzMiPZW5pze/IlzoIeNqgMO+onWgXaj7kkAxDBoDLNVOcSQsC8idNUm+ugK7ePoigLJoBTkuI4LPtr6TpF1Hu96MhwTrlzVFaMa8sY/LwPPV4Jv9pxEySrnK4eUpkPnpbZIFmvfQwFd2u2XDDj5UI2KTlnkYAVF8I4WaxTvn1RsWJ01pNp1scH91N4EH6kjSdx9cp9nn4MhQKQyquijx0FvB96sd8lhRvXqKnGN4ej9l87xkd6gaBZFF2QDaWi/bx8h82ONNlZbn/6Bdf9FCl4EgW9/S3afztXOAIZr0zPtDkxpYUmdBxecv9dJ0AWU5e18XbD9auKVMJm/1NlaTK8CnG5SPzNnfl840lBkZdlL1otUt/ycx6XbjnQ8Pg18BFGRMa54ksmJgSg7RBkpYZ0ebggriUDOCaJTYHTG1iDX7k35EY/ACLzaqqPtlL8QkBkYeLj32xs5mlb5IuZUXzwgAMxGmvvp6TOPOE+EMrXpxYCmby1nAHtZ6i/vJHIVuc8xH9wvDpCtCcA1gw/nFOXZ0eiJaWGH/JmKExlvCImja4S1yoLikS/kf61uDhiWCluec1ISqzh7nToVQZBqAlEykzumK+3IM04rzaalN6zkN/upDRJ+JUwM+HvF/xC7nLvPig/jILnqLMs5OG7+4ucnYho7ogyInqZSxFbkoEr5V6l8vHITm7LFWVa+3ZtQdrpW0ie8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(70206006)(70586007)(8676002)(4326008)(6916009)(5660300002)(86362001)(186003)(426003)(336012)(40480700001)(41300700001)(6666004)(82310400005)(316002)(8936002)(478600001)(54906003)(2906002)(36756003)(40460700003)(26005)(44832011)(82740400003)(1076003)(2616005)(47076005)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:01.3563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a1cd42-a56c-4eb5-c800-08db3ac153f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962

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


