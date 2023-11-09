Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EBE7E7188
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629786.982266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19mv-0003eC-O6; Thu, 09 Nov 2023 18:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629786.982266; Thu, 09 Nov 2023 18:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19mv-0003aq-KK; Thu, 09 Nov 2023 18:29:57 +0000
Received: by outflank-mailman (input) for mailman id 629786;
 Thu, 09 Nov 2023 18:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19mu-00018Z-0R
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:29:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa2dd67a-7f2d-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 19:29:55 +0100 (CET)
Received: from CH5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:1f4::29)
 by SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 18:29:51 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:610:1f4:cafe::b7) by CH5PR04CA0018.outlook.office365.com
 (2603:10b6:610:1f4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:29:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.82) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.21 via Frontend Transport; Thu, 9 Nov 2023 18:29:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:29:50 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:29:49 -0600
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
X-Inumbo-ID: fa2dd67a-7f2d-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muPLhG00j+C5DyDwlNP2vwsD54DXvQQj6OLKKeT37EiqF+0NSO13EvudA0N//Opb/6UmbFh70CordTaBAVJEzUZ/XwCYVy0ziDPyxaFhBr05aa6pb1lAVV/8XojY4eILPgfCGGJVjetPCMTUWFdBkqsflBnhOBhb0i6Xf0aAFerpQF88+S18a2hqL9rEswqyeSAEAwBgCHV/RXIyzcKact1y21XrAxAarK2qErXxEqIZnfnGBqM96yvfpEbxfkcaxDtMoQcVlry4KpklRcl/Q+Qu7fMEL2hUs5rGDIis+4lu/lCnHtYNEx5HlIMSOcAeBOuoiYbf40OKvMH7VFh/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBl/mT4Fp4+iCx8kQINOf/6N5HM+ggw/1Xmyu+udaKU=;
 b=YArZ0oeLwGVfZiPSFpB6iHgrpuKgV2Fmiw5pYDeUZw6XFHJl5nQJTc5jnpimr1PbBjc62OKbB3WY59HiQw/vmc8FX9jIrnmkJpNwsKDrlrxdPbC41Z/6fol7h2zFv5EUCVWOU0BlaOPL2vVWyreMvnVXHRTDyPVYhDbj1JxGUEGZ02CFXta/2LR5hC0tRutsLzQlvu6yZUn41BqUsMgsMBrgEobbcpfM0c2Z2jlILlc/EoxkIjfwNmSoxL2ui0HauJPkoxGtcF8ov+rl0z0NVwpEfyW/ITVTPMt4S62vBJpyApLg4mjgU8sMEdkqnYREr1kCXLcfDdkrcYR2e+tpsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBl/mT4Fp4+iCx8kQINOf/6N5HM+ggw/1Xmyu+udaKU=;
 b=EcVekibYrOTN4DxlI4a1PW4T4DGlcHPeBLHSzf5MzSJ+xa9wcyUwrdC9ydW3zRtpV0guHiIuYYGcaE9AZIjpRdass1ZRhodVV/tA8y0CbOYNN+G8SyimBggT9PicpCGo3Se30XsjrxajtuuqzOmvZTRwH5+sGlaMB8Qv7wZzmqE=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v6 7/9] xen/arm: Fix mapping for PCI bridge mmio region
Date: Thu, 9 Nov 2023 13:27:10 -0500
Message-ID: <20231109182716.367119-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|SJ1PR12MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 838934e6-8042-405c-2839-08dbe151dc87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NxazQx5KqTVY3fY5VPxAXoX70stO2Ey+ccDBUkUAv7zaEQdVx0nR3yg84mIB2KDGvVsYaOKcoUGs0vLbkDib2VWQpAxVtjxFenDFDwf7/J0azyZTOo/jfviNE4cTxfulwbQcsbg5RfVYQ44RZd5zt8UT63fLkc2K3fiuPeGxr5FmLBaSqyo1hcLO1j8iSklAxzjtbzNn7PwBZp5F3rE+Xj2ff8iQOIHaRxQVw68Xj2ELQL8gVTYnYLkux+POr+VX5wV64c0v4YVL7u2m5jAHHJUY89hcBOTSvj7hMRx2fwkFMAY4TDfGz3WhCJYpkB5fI0yxqLf7yR23kQrA/mOaNKuwAgspuTmo0on4TdOujAerYWrXUQI4+Fbj+85gA9L5Y/7BYtZyKsh3euWhSBJ615InwbUDFUwqzVmtPXAP5lL2yWlUYaxI2Sl22rJGwZKiPZZ9LAMUfBELQIGk3GidZHyknwEE1IcXHZsFmy2rWxA9HREVz7fruV0+isOj5sRrT5cUgIVbOYp2r9mWjoQxzo1CsUXS9fSPUi3yoaHgP4t9UiQG1ZkTMipa9NLhKIw/cmywztYkxmc5DRDa/YsidJeWSXvyiO0uFoTXsrUtbGrjl18jeUaPXRKlVIn2Qf7vQ2Ml4leSd/tE7Y/Rz1eqTmnXW9cngJRZU7YKBhm2xhD7/SCbxZeflCFx8PwrzMooQwuvBASIuMxV+ilInP2z2mnMkL5Hs322YLnv7AVRabzYbK2//VgKEYK0yO1p8RAVJmfuaDaaI/lkEPRez+beEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(36840700001)(40470700004)(46966006)(83380400001)(6666004)(36860700001)(2616005)(478600001)(1076003)(26005)(47076005)(336012)(2906002)(426003)(41300700001)(5660300002)(54906003)(4326008)(70586007)(44832011)(70206006)(8936002)(8676002)(316002)(6916009)(36756003)(82740400003)(356005)(86362001)(81166007)(966005)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:29:51.0565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838934e6-8042-405c-2839-08dbe151dc87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027

From: Rahul Singh <rahul.singh@arm.com>

Current code skip the mapping for PCI bridge MMIO region to dom0 when
pci_passthrough_enabled flag is set. Mapping should be skip when
has_vpci(d) is enabled for the domain, as we need to skip the mapping
only when VPCI handler are registered for ECAM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This patch was originally picked up from [1]

v5->v6:
* drop unrelated change in xen/arch/arm/domain_build.c:handle_linux_pci_domain()

v4->v5:
* new patch

changes since picking up from [1]:
* rebase on top of "dynamic node programming using overlay dtbo" series
* replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_PCI)
  instead of removing

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.html
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 1f631d327441..4d69c298858d 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -330,7 +330,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
         .d = d,
         .p2mt = p2mt,
         .skip_mapping = !own_device ||
-                        (is_pci_passthrough_enabled() &&
+                        (has_vpci(d) &&
                         (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
         .iomem_ranges = iomem_ranges,
         .irq_ranges = irq_ranges
-- 
2.42.0


