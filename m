Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B906B7DC34C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625423.974683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4M-0000U2-KQ; Mon, 30 Oct 2023 23:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625423.974683; Mon, 30 Oct 2023 23:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4M-0000QX-FT; Mon, 30 Oct 2023 23:53:18 +0000
Received: by outflank-mailman (input) for mailman id 625423;
 Mon, 30 Oct 2023 23:53:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j9+r=GM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxc4K-00009Y-J9
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:53:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d065591-777f-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 00:53:14 +0100 (CET)
Received: from BL1PR13CA0401.namprd13.prod.outlook.com (2603:10b6:208:2c2::16)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 23:53:11 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::a9) by BL1PR13CA0401.outlook.office365.com
 (2603:10b6:208:2c2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.15 via Frontend
 Transport; Mon, 30 Oct 2023 23:53:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 23:53:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:53:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:53:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 18:53:08 -0500
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
X-Inumbo-ID: 7d065591-777f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imHzs3GwAC+6ZjMUHbnb9YtsaRrtOaDVo8eICOfstejg1hldY8MNNgJDdM5atYTz3cuv94+KdgAPw3kF5GKhZsfk7/hMVg2fGkOOv2cLiMWK8FrQmAOhLZ8fqcaQTRACksSsTO7q5rcrOdIa6taO64eLWW0WIu0mIXwMrLLGfGOuY58OuC4VGvDlumFvEvuoT5OXmk685BVYRe1Jw/5QU2bI1/6GbzTt6fJ4PZzOrLeK9UHGKA8r5zK+8WIRU1bVjahvRX8sW5f+xrwGuNq8vEyxwEQXGRgTUra78cpBaF8qfu0Brj9Ovb6s2p9/l/ZSkCq4BGPNBKdehLqg7k2NtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vJBkkc7Wu6DjPvhvL3fqXdEasGwxXnYZMqwvjI9HKg=;
 b=EZSptB4ftEeXaVOUuvIlif8+C1KVV+FjR97dN3EViCeY7DLmVPxbTZDRh5V7pYCvcptMYIAC8dNlcjsDnxy5gpFE9fNN9dqgmE4EvgeHI0DWmCUdSJoITbdw5mU/XcvFMuDVWfhdnz0wKK46nLDTTYLpxqk61L41MrirQk3c0yGNdIhi/xrBxlrSX+cyWXLy8kYDPsiNdcpEqBIctgYBDWwQ8RZ3Cmo91BYL6H/mL93AfoomUBqYVzpwNIbVsZdzrnnXIGxk4jNeFxFjYgtxWjSev6225YCVoHnI4yT0AjNFTx6EhEKzkK6B9zkXVqSbrnr4PVaxBRtN5fisjForiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vJBkkc7Wu6DjPvhvL3fqXdEasGwxXnYZMqwvjI9HKg=;
 b=wsLPPBJjzMYhYqHrweR0kOMumGB9hVaOyx1xrs+lrTWHnChRtCcmVm4RHo95UFTsbMb7Kn/QOSgo8Ck+kO6KZrJbgy2L8DaDn1hM9IzBSL4o/N7D402VSS3gnkWzFekVpsId47AT4939Zaa3rYR53gpV63bec/ylBU1DJ/+RkHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 1/5] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Mon, 30 Oct 2023 19:52:32 -0400
Message-ID: <20231030235240.106998-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030235240.106998-1-stewart.hildebrand@amd.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1b210c-ea2b-48c3-3b0b-08dbd9a35f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5sog9IrAxzKul9ACe9euLhJMrMc+fdnjOJzAroWmZT/xrVokzEerYjDLZ8hrOWT3VCjq8+pRYXtjWfo8QoaYR3SxrEfn+KCEfw98XQS9T/QJWBHAt1/kvumwFmpFTtlHupIt8ZmCEd3PHNSqARj3rWIXdmWQZJtyMbCUPrZTnpGdhZS+qvWrbmNn6hhnWoqCaeJt97mEwr4I4DeWayjbfaa9lf08WhtIXTymM26Ja0UelQZpispveiJ5Qf+HDKLXDRLqJEqtW8jqMjXui2RPaLlopfUegj4X/FbesYbwKkzvfc/cJrK3dDxox5ZdTCyfNH+jXBS/gQpA45z2gr5498KJnRPMArRsvnGF+b1VhERHdni8vZURM4uB90sneT18g+hyllw4jSVrYt2cyceWTclvVJa8Gk1rnfOfiJjaMJ1/9UciygDGIkbLvR94cQCV0AoRg42HHrJA0GZsnCvbXGQn8CObmJjCHNsgMmVWht4NUIDMdaxX1X+MOfQRY5YldiS653xfd1EXQ8bZxXyB0PtwVxMuq35qUeysBrKbtPPOi9D4uiRMejmmxap7B5UADpm2FMnMjMPjdaRzB/Q8rJ9bD1wHTjBIIQmr1vxKhqGncgKa3WjOrN6kwVCSGbsVIA7A7mc0TTkhGhEz8PfJ8D2xTwkeO86FvU+3RQ2pQ9QeOPqvibTAP+fjVeFRAsaSl8fb+2JRB22Ys9XojSWKk9xaYN+nvOfiLTueJRiIW2cFNGbpMJWvwrK434baaph9vjrXVu7+W8iPwTec9jEPGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(5660300002)(44832011)(41300700001)(4326008)(8676002)(8936002)(86362001)(40480700001)(36756003)(82740400003)(316002)(6666004)(54906003)(36860700001)(47076005)(356005)(81166007)(70586007)(70206006)(426003)(26005)(1076003)(2616005)(336012)(478600001)(966005)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 23:53:10.3751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1b210c-ea2b-48c3-3b0b-08dbd9a35f41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483

From: Rahul Singh <rahul.singh@arm.com>

Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
the feature is not yet complete in the current upstream codebase. The purpose of
this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
testing and development of PCI passthrough on ARM.

Since PCI passthrough on ARM is still work in progress at this time, make it
depend on EXPERT.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])

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
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
---
 xen/arch/arm/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b78..5ff68e5d5979 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -190,6 +190,15 @@ config STATIC_SHM
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


