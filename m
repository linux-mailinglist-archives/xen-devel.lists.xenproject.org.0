Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C96737077
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 17:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551944.861729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdJd-0000Mi-UE; Tue, 20 Jun 2023 15:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551944.861729; Tue, 20 Jun 2023 15:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdJd-0000KZ-R9; Tue, 20 Jun 2023 15:30:45 +0000
Received: by outflank-mailman (input) for mailman id 551944;
 Tue, 20 Jun 2023 15:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkNP=CI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qBdJc-0000KR-Er
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 15:30:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6acbbd05-0f7f-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 17:30:43 +0200 (CEST)
Received: from BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46) by
 IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Tue, 20 Jun 2023 15:30:39 +0000
Received: from DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:94:cafe::3d) by BYAPR01CA0069.outlook.office365.com
 (2603:10b6:a03:94::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 15:30:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT069.mail.protection.outlook.com (10.13.173.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.37 via Frontend Transport; Tue, 20 Jun 2023 15:30:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:30:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:30:36 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 10:30:35 -0500
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
X-Inumbo-ID: 6acbbd05-0f7f-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoRUYfhxmkYI1i5Bnkj/aM/soI3D7V2APNX1xiiq0HZIhmsGjzx/+jPNr9BZL3TR6IKSy/NbzQqBMBk3Sg/OGQz2trJ1RqWFfF6ORceXsHYJTZvYS4CD8P9neJE8o55ZQ7qTep+klFwfDh5jMm+u2OypjNaypguAZlxROMf7DKnEw9oGkX79elqjvFH7GjWvR/n+HGHj+Ex95RelbLeH1iIwRz90BZpTVLx5mkN/DkqwiNpEKOV9QbP+uEqS5Sc642A6rzkrchkt36gIWjbPXd0EC0GvVrmTfnEp5qpRniMfsk9hiU4DFh8oIWk7RVzKdfAQv1tUvYCY2glwK63PYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PW8XXwxR3mhUCuU75aK6Miub4PizW0qiJ7ZMU8vXgGU=;
 b=UmWTtG7mKHA2oclHT/T0VpULlHadQdMll1vR1qG09g/I+Sh4B3uRMIPJlvMGOOHumLuMOExmmw12IQUe+thf45mihppT0PyjZpX+HVeaPxiMazNqsZzM5rW39jwDvHoyRDJNmWA6FV1ufH52WjM4FTYNT+JKA5pUX2SdSqpw/2QvpHGxxqFHlzqZO8/abR47oQxFUXA042pDqTDGgdqfhB2FKQi0Md5HZA0JvrJfZ5tMOs9787WWvXLb4AwzsWGOacT2cu3VzS42U70ydBFn9y42363ykQLWIu4L0qCIxp6jlykoenFMqeQL1qXfJE4UeDgljZjq7BF6bU+Ndrcp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PW8XXwxR3mhUCuU75aK6Miub4PizW0qiJ7ZMU8vXgGU=;
 b=idtju5wtfHrMeK8Cs7mxDacNpgYL0/dbxB6cSDqj1rha6XYwS9wxCGSwwkBr4vwftS/IdPO1P5HC5zK9aQ1reIso4CZ0j3V5UcaGDUtGE++1kQBlnbgspQNhAXlzFM1BnPCVH0ry0LrWO2Ozj2ED2DUIkCiXfOnBqPIG3L/2MIY=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v1 1/2] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Tue, 20 Jun 2023 11:29:20 -0400
Message-ID: <20230620152924.23622-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT069:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a0f858-f251-4168-2ba3-08db71a34c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a9ZLolILG/e8ssLp3McrLGM/BfpLnrgkwtg0FZC2qTxpewGGaF9uEH1iCzfqZZb8fMAvwL80fCbJy/XYxgYsNx8sgI6dWrQhTuqjRJzvQrNqIlt9FpSXBr3Af7JzVLHwpynbzNtD9jEmKLTDGFoTTNLoIDrqN4MU2cO5b74F7HCJbwjC8ciCaT5T0ARxmT+DDleRxLOdeRLGOfk/jrjvlILlVzK0vBK2zLeDVktWZszRiE5ODIhrxwcFzec3wyqg6GTY3FI4ftIp/f6h1EHQgodnmPysn3fJrYvi11+CN3OBoyaM7IyH42NIpKVA58bhDsciJ41lMTFOhHkOficIQhR9V6LJe1yDgmvdco21kD9LDNqwodE6nlSFgy42rpxO0uGbUYgfeQqPBSiUzL0O/V108rAXJFXu8oimRRAliJW3Tk8eF8ghLdEsyrmgYOBx67hY9XteGt9cU3kk2AttHsFZIDu3KqS+gY4BL6ISVI2y5qJCQabym8711Dvc9swLB7tFXuoQktHPKmvAhBDgsuK+DmfRaUQeR2yH1E07XVNS0ti0nDcxDaDW83GHkpUgysI0aAuYl1VBB5O9+QjLkbjlNYlcxpTXdq0ZqEapsyut9iJTVyAVe4AfPmaGIAOwA/wOvMsVcK/ST72zX80jcWK6iC8U2Iu2MgLFvKA8r2/nfvOrsFPL4ddoz1szFrDPQDXIh4Y/H88+kDv+CBGvik93sJ8EyE8WIYbxsgAvXs8vO3+VCZnpygeGEbjqvscRJLYSI+AGJuA7DhIRhc4glafRNs4GLXXPS5/r77fdpzU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(82310400005)(47076005)(966005)(478600001)(6666004)(336012)(54906003)(2616005)(1076003)(426003)(26005)(186003)(2906002)(5660300002)(44832011)(40460700003)(36756003)(70206006)(356005)(81166007)(70586007)(82740400003)(40480700001)(4326008)(316002)(8936002)(8676002)(41300700001)(86362001)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:30:37.4673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a0f858-f251-4168-2ba3-08db71a34c3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309

From: Rahul Singh <rahul.singh@arm.com>

Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
the feature is not yet complete in the current upstream codebase. The purpose of
this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
testing and development of PCI passthrough on ARM.

Since PCI passthrough on ARM is still work in progress at this time, make it
depend on UNSUPPORTED.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])

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
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
---
 xen/arch/arm/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 61e581b8c2b0..3d22cd26a68c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -184,6 +184,15 @@ config STATIC_SHM
 	help
 	  This option enables statically shared memory on a dom0less system.
 
+config PCI_PASSTHROUGH
+	bool "PCI passthrough on ARM (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM_64
+	select HAS_PCI
+	select HAS_VPCI
+	default n
+	help
+	  PCI device passthrough on ARM (UNSUPPORTED)
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
-- 
2.41.0


