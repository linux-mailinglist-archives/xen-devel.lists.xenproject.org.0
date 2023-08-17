Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB0277EE6C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585006.915997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4F-0005iU-4D; Thu, 17 Aug 2023 00:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585006.915997; Thu, 17 Aug 2023 00:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4F-0005em-0o; Thu, 17 Aug 2023 00:40:51 +0000
Received: by outflank-mailman (input) for mailman id 585006;
 Thu, 17 Aug 2023 00:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4D-0002YP-Jc
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c47200-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:48 +0200 (CEST)
Received: from SA0PR11CA0095.namprd11.prod.outlook.com (2603:10b6:806:d1::10)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 00:40:43 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:d1:cafe::2) by SA0PR11CA0095.outlook.office365.com
 (2603:10b6:806:d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:25 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:24 -0500
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
X-Inumbo-ID: b5c47200-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnwaWOEJ7yNKLN+L9Ybsu9XGVjH2uxQPQF0yT3amZiwXbl8xef6/wi3D4PzvFPChwEKG/OMcCeQnuxMxgE2oOhDMsgcaBrXw0A40EG2qKTK3HtXjq+qNcXW8mQQst+heZUugdshTLJyosRCQ6griZPIusLzNvWFTSz9oD9Cq+NBIN1YK45aPC/j+pYt3b3V0inHP48qaN6v1Uy3Vae6M85F/RBWkBJG0cwRsHpiXjG0JqPJEUw/f+4TfvU5lePCvCpHMm72f7562m6fV5RQQEY0qktRQRUWw6BAv4aE0DVQSttiuR/bc9SbdhHoEQHKLzZakTKPJGXTFYTCbaxJfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGVNShdnG/aIBZ1qd0+shXMehlt+J631oNOuesBuA1Q=;
 b=eIKwi5DPgFWacIw83htMjFa9MLuWNIKPJVRFCg+qj/pTcZtvp6hQiPY5sAulDzz08qtljeR56xDOOZa6sX/YZG66Qo9xmR1GrZMGUlGAMs+3W9Nxe3W/SGOJ+tfcKY8uHeUlftBaI+5ZKBdo1meui20N6ieZcpstvq6cFGaYndEUYRti/SDuzCTlFrYfagaWCpLh96ExYUuqYIp0chuQUBGq/DQ/L6pqaLz31rr/EkO6c4rHxjKZAv0NCGINGKLsB75swsI3eMzLcVRXDUflcC+yOgcQLROK1YVMZdyOUhrRTfsyFs+csTRFLEyNWtr3Tncr+HdQY9KPrUzIBnAVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGVNShdnG/aIBZ1qd0+shXMehlt+J631oNOuesBuA1Q=;
 b=i91laATEWyd6D60JM8/H57huPqXJoaVOeJGcZqNcKK/H4v81s0z4O+s1qUn6YyWVQ9fPdBGu9Y07prXYuvuRoVEkahK+bfhusjoPAGnhP0qlEu68jGLx/V86lISyfIoPU/V0Z6bu1SUswFtuhOac9KaQSGso7Fd6BETGN0e1cgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v8 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Wed, 16 Aug 2023 17:39:33 -0700
Message-ID: <20230817003947.3849-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 38266f72-d326-4833-68fa-08db9eba96fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FF2DsZW1M7oVyFbl8A2lvQZO1dijxqQ5dEGN8qpMutVWzclSgiozMQMcajZuUZRe3GVS7Gel3FGmrS74wjRZCVZPJJhpkFi+8dBHCrES+IYdjoC6yy6Kfme+oyigvBIQQ+RUhzSQ2R8hB/XmYP3umsM/A2qAM72lHjtR+ROr5ofNRnfz9t2UaG9YEeB+d3tdY7K4BAFd6Q4cu81nr7yNdUHzL0PRkq9pCCmI3uR5YxYCzulYW3k04iSi1MZEsGklmS8QfoB4ukhuaASn9LZxEoD4oUIFzgCV3plhr+5w1qodc1F/HL4yWOIc7hAPVNedD9yE5+aZPC9ogVRsFMndBwZpPShumhDoAT+O0kmWo7Em90BAWxhd2mvZMgmRHH9dADkshu9TmyaKBuA1fbYYzl8SszUxAZ21EsNt+KTkqqoh0qXpMdSvHLeqvxlt2Q61PkFfCnU5YV8pLmlT1ufSAzZz0OMfnOzVkK5Ch9uqefqboH9Wb8L7z9yiQ+ygr0YLCnHXe0oEOCbTbQFg3dPkWW8kgxXfQRftqcpLqggyRgwGiRnOZ9y6xfvf4YxHYR74IOz/IpyX3T8n4chqy6Dhm61X9yY03rTtgq34qR4qhtIhHUDKtN3RgQGUqJo2aUtMHnbagHbZnQubajyZGPNX9/5uZbUBhgNr3/BeweaTGpBAoJhuNWicnsRjoBACmApj8OJ42Qd2Y+dQWSzMNcoWgQ6E16ox68f7Xb4snzLEkSKSjjVyWSEbqy8WhpF7w7Ir6vuq1za+aFU4sUpOvfgkzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(4001150100001)(336012)(478600001)(7416002)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:43.6531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38266f72-d326-4833-68fa-08db9eba96fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
Arm.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
Changes from v7:
    Add this feature as "experimental support" in CHANGELOG.md
---
---
 CHANGELOG.md         | 3 ++-
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..47098dbfca 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - On Arm, experimental support for dynamic addition/removal of Xen device tree
+   nodes using a device tree overlay binary(.dtbo).
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 35a6249e03..8eb006565c 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -844,6 +844,12 @@ No support for QEMU backends in a 16K or 64K domain.
 
     Status: Supported
 
+### Device Tree Overlays
+
+Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
+
+    Status, ARM: Experimental
+
 ### ARM: Guest ACPI support
 
     Status: Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fd57a82dd2..02c4796438 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -92,6 +92,11 @@ config HAS_ITS
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


