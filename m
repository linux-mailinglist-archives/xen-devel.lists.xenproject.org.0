Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A77DFB27
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 21:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626979.977780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydrz-0000ey-8A; Thu, 02 Nov 2023 20:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626979.977780; Thu, 02 Nov 2023 20:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydrz-0000br-4n; Thu, 02 Nov 2023 20:00:47 +0000
Received: by outflank-mailman (input) for mailman id 626979;
 Thu, 02 Nov 2023 20:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qydrx-0000bG-SX
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 20:00:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80bf2312-79ba-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 21:00:43 +0100 (CET)
Received: from PH7PR17CA0028.namprd17.prod.outlook.com (2603:10b6:510:323::8)
 by CY5PR12MB6251.namprd12.prod.outlook.com (2603:10b6:930:21::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 20:00:38 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::78) by PH7PR17CA0028.outlook.office365.com
 (2603:10b6:510:323::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Thu, 2 Nov 2023 20:00:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 20:00:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:10 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 15:00:08 -0500
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
X-Inumbo-ID: 80bf2312-79ba-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgfxmImPfVTiJMNB0Wpk/VEPP/UHFDr/DJkSEpBHsQ2hBSm+RqBVAqSJE2Rxq3XZU/jV6IY4szhYHJaVHXnTx+5qlAIX7lzo9XFKzTF3g4Vl7dlLv9Gszhv8rEm8hBKxfvzujDgtln8P85b9qDZjyz3pM8tm5Pk2GsIHcivPtPwUEzCywf/Ipy/VEcY9ig2r4a3gcY0DEDNyXIu/fpj2otYwhsnKhDEmczl3cFzXEgJJP9FfjICaSZviDeJbko9RbZNeVmeaJbWG3KkXaFP+LXYK3SOLVf1bI4Da9enRPjy9CnYoX694CE357FBeQw9T2HsgROxWaVM1CU/wJVPFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLtVJgg2CaFtIR8gaoR2mC1Q7M054B9aA+rGVYOSc/0=;
 b=G92DrPTk6Dg1D1HvrZiRfGw+qXp7WYednTQrYHPJ5I2hKv37JFYOVHXIvCtClDTlUATvRQzwEE8ktBsA/3Twrxxq7JWou63it0UeZM4drrJzT1vNGRrLwGDjrBDYaefSiSPE2dJ2dWFTIcpAP+lZCIyCkVpjqr1f8ATYDqR0xRh+4nrXSQpQVG15uAMu3x7/FRAi3Y7Rwh5kIbUIUN5soXNY1BORwchaoCDCaRdelirH0SHIRv56E8miyA8Lq/UOtvYZFOeo6hnBeG4ZqGbA92IhT3WYa/892W3YPUtnA868fjZ9MckZ6vDLanSS1j6LvWFtCHYgkb6iruUmMpFxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLtVJgg2CaFtIR8gaoR2mC1Q7M054B9aA+rGVYOSc/0=;
 b=4QGb89SS48/uUMdBsokD0mPiplAYahIzkT8CcmsTz+vmDIWOyJyQCGz+VXdKUt1igl9vxH5XDQO/npl93h5uhVgGN1Ji4gMUqarFmGw8FimOaqM+CqYlzu1HAeYm9/Mvw6bbDzKqYJEia19pjMVcyrCjYzbCOuRSebprg+HlzVo=
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
	Stefano Stabellini <stefano.stabellini@amd.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 1/5] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Thu, 2 Nov 2023 15:59:29 -0400
Message-ID: <20231102195938.1254489-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CY5PR12MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 479f0b57-8cdc-45c6-8c0a-08dbdbde61dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KR0jAD2qqUILGTSbEKfoLA2swSVBFTl9OZ0W/t0ik1VJb5fdc7WgZFxyZ3WfI1+8HDkc3QfeUbv2UDBczVPBqJUI6clHBXgct5H6AipIySDgFMb/Jff3VUw7ahdXGud7ulDfQT4oW+6m8twrYIIDdAN1/UZHHs2TIWs6pj3rjepkGNMYMQkpXZfscsvMLcLhjnmXcyp9UIAfQ3UmJymnVT52qLsdNlGY85/LUqS0aL3S/Dw9did5BHQ7QyQNZ4xKKw47fUOfPlXbFzuQEy+9xLGA6GvYVOov9hBfPk80XqDK/vBXPshb031nV1z6oBRvoOP/2eL0CnTvZ1f8e6RcYc0W5ItUTaI34JxYF9X+P8zuNGlo7p1Bo3BgcfLZpo6SkU5BEJDZr/iu0gwSNhg1uV0HDaaUzp2EcHsKogyiLTG/pnhwkbZgcCpgnLFhgRhqekxmn6pvf5Sq90Ac8FYPTdwRiQVDcRx97GxOTOo78locT2ZAKK4EFBplXwKiXaCTRxevuo7a0e4vfvWhP3K/4EPWFT/1SzSDEPqmBjosVXaNyIEWzhujDayi3D//U9RDOMNf9MQZoTW+ht5/TCNL+pcO2+wtiajRIgapVT16PBLtakrSkewZ5W3yeOeg3o5KCmoKjObWTL7/8SzbY7Bpj37IKiwWu6UhbxIki4a60eqQ1x0JdpdPvIskG8dpogMnWFo6Zgwz9BAwGtFKqA0vuwuo7v7u+IOpg5tK55j24fdZVNMylp0gYlUU4h2cD5leg1dFKS/tJk0BjJQAWN5jgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(1076003)(2616005)(26005)(40460700003)(86362001)(82740400003)(36756003)(356005)(47076005)(81166007)(336012)(36860700001)(426003)(8676002)(6916009)(5660300002)(4326008)(2906002)(8936002)(44832011)(54906003)(40480700001)(316002)(478600001)(6666004)(70586007)(41300700001)(70206006)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:00:37.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479f0b57-8cdc-45c6-8c0a-08dbdbde61dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6251

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


