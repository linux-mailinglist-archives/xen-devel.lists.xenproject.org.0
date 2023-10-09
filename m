Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ABB7BEB18
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614456.955539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwOQ-0003aQ-Eq; Mon, 09 Oct 2023 19:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614456.955539; Mon, 09 Oct 2023 19:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwOQ-0003Y0-Bi; Mon, 09 Oct 2023 19:58:18 +0000
Received: by outflank-mailman (input) for mailman id 614456;
 Mon, 09 Oct 2023 19:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpwOP-0003Ue-06
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:58:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df0c804-66de-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:58:14 +0200 (CEST)
Received: from MN2PR11CA0029.namprd11.prod.outlook.com (2603:10b6:208:23b::34)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 19:58:10 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::39) by MN2PR11CA0029.outlook.office365.com
 (2603:10b6:208:23b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 19:58:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:58:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:58:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 12:57:59 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:57:57 -0500
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
X-Inumbo-ID: 2df0c804-66de-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzIRiSvH2+8AHEmJpDg3ZDlWH+d6pVDS1Fd5PxYl04hMFB4V3uYC2lyBn1422Urvp5KPuMRwThvDHBCSVruwoCqNvQUB8w3L+eATw+tbQueMBSM4OWe/2RhXIe3Dmio5mcBWfOc50whkETRStyvpTcHBozsLWOwE0VQtRWj0yIYrAwhAQkHZd2aiE0qH/OqV1Utk2nx/C/RxF+l5IBukl3czthFDwgMJyF2iL7BQ0k9anXEwHa0VqfKtmWR97lYVTpiS2N53zb60ZLbNIzlJXJG+zwX2WRkcBtnx9oZ0gY0iXAVFpA1nApEpUFjKWDZUYGa7mkem3iD8FXue0tRc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tFoqijnrmC0w4wv+Wq5XMW+oCAoSLFk0LkyRA0dK/o=;
 b=cp1RJ9A/hFW/CJ3WvcTo4jrOaxvUEACv1iVIpf+rcFu1sxhLGHKmloIlz3TUrIdMC0LnLfc4/nYKTENIZHwsSvuEBvJInXcfhJwx1RNAtGHuO3Y6J4GOH6YQXdQbHiLJLK8F7Exw6ek4R/8Gz/onpT8qlidztVTZKNt/C5Y/skWvDSUiuf4oeMi5cFsCBnYtR1OYcy7H3qzs1BNUrPQ/XyWhrblGnDY1tDW5VLjNfXHuQG3rBML7IdOjsSi/+WJKDS8/SiXlTjYFPDkMZ3Zb0t4KDVchNsNETywnF/Q3+bCOYevRD9JluZTU+42yFzhdTSIz3dVXrNrptkc8dFP8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tFoqijnrmC0w4wv+Wq5XMW+oCAoSLFk0LkyRA0dK/o=;
 b=HjBBSPZkc3JyTJBw5p4shdWBpWXzuikgf/l2bGiP8FUqrazOEaWxWSqrAIgZxaHwgl7u+3B0CoGM1StPAA1VzBChSZb4Aqbl2AN0aRSLniMP25qfZ2Z2dnQBxUSchLDlLlMnwiIll3ia9HF+484N6jfeiXJ/bWEHlWzAX6/pTlM=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 1/5] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Mon, 9 Oct 2023 15:57:40 -0400
Message-ID: <20231009195747.889326-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009195747.889326-1-stewart.hildebrand@amd.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|BL1PR12MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e59378-0410-4dd6-06b6-08dbc9020fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HJU+0TlR3XQIkUK5cygvK1KAwvCDhR99BvJh6RIX96ULMBg18ERDufeIKbQ1V7eCWnsGntj2wYAD/uoF1RpyD0/oFPbo8FfBSmAxtpPvPwPj0haUT4nEH2jOjFUjAoN7FjJMrjmz9aUrtQ5ScTk6Efd2EDxXyCTfqgdYQiRxSkCZ5/IFjIHPUw377ikUKwLu5+0xWIK1VpJAag4O1jrh4reG1tdBTDXLHDOqZ5vFrQCpWva4vDFvh/GEjlMEM1flqbWyjhlc7z+6aQjNcCfL639oV77uZIcOHGv2KZzfcJeAR6KdZgqHw0aNM4YXYgr3kK4G+vljcfD8Fz2DOWPsYWMg4rzcReQy1h6xJ7QkOg61+yJMQ174SmMqRvaaLlwt4a5l9Yv9e0QGbUGz/CiBlYC2Ix2yVQFO2NUuedoEfiSAcD2Re2mvq+HvsIJJrjg0ojYz7JTLhrKdRHJ9LpG+obJxBMGX+L48IBwLtLNnuE22obXVCsZtlf4I96Cnbd7wicJCEEyEKRSfXMHvxsu9nJeq+WSqGuoy0GdjzRRqPzyiBOBujckkTTg7CmH6UXxMIKg4TIslxRjXYYSXLIENAbde3Xv2GCGyTN6bg/JlkCkPL/mev3OP6dzfIbI8NPbqKG8Z0sRrDZtMgl7dx68lBW77MpY5lzsCNM61qD1Y+a8J1bhSqMRKYhjSoS4xl91D3NS4dl5SXCS8sIiBg+xu4URpsHja21GsarvnKVw0E/BMTPR8iu5W/mimuNWx/PS1PfFoVjqG34TydbQveHun/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(2616005)(426003)(26005)(336012)(1076003)(40460700003)(81166007)(82740400003)(86362001)(36756003)(356005)(40480700001)(8936002)(44832011)(2906002)(4326008)(478600001)(6666004)(47076005)(36860700001)(8676002)(5660300002)(6916009)(316002)(966005)(41300700001)(54906003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:58:09.3767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e59378-0410-4dd6-06b6-08dbc9020fc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378

From: Rahul Singh <rahul.singh@arm.com>

Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
the feature is not yet complete in the current upstream codebase. The purpose of
this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
testing and development of PCI passthrough on ARM.

Since PCI passthrough on ARM is still work in progress at this time, make it
depend on EXPERT.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])

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
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
---
 xen/arch/arm/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 632dd9792e3c..fcb5a0920c5c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -191,6 +191,15 @@ config STATIC_SHM
 	help
 	  This option enables statically shared memory on a dom0less system.
 
+config PCI_PASSTHROUGH
+	bool "PCI passthrough" if EXPERT
+	depends on ARM_64
+	select HAS_PCI
+	select HAS_VPCI
+	default n
+	help
+	  This option enables PCI device passthrough
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
-- 
2.42.0


