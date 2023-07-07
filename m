Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCB74A898
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 03:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560137.875800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaaW-00021Z-FT; Fri, 07 Jul 2023 01:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560137.875800; Fri, 07 Jul 2023 01:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaaW-0001ys-Bg; Fri, 07 Jul 2023 01:48:48 +0000
Received: by outflank-mailman (input) for mailman id 560137;
 Fri, 07 Jul 2023 01:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHaaV-0001Z8-0G
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 01:48:47 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68efa17a-1c68-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 03:48:46 +0200 (CEST)
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by CH2PR12MB4924.namprd12.prod.outlook.com (2603:10b6:610:6b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 01:48:41 +0000
Received: from DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::c2) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24 via Frontend
 Transport; Fri, 7 Jul 2023 01:48:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT113.mail.protection.outlook.com (10.13.173.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 01:48:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:48:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 6 Jul 2023
 18:48:40 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 20:48:38 -0500
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
X-Inumbo-ID: 68efa17a-1c68-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwrDHSjpgab8eEyIQmL2noTteZUW/k+KJjSIc1Fx80w3/WBDJ2O6Dq5I9b1DEPntgvwAoJFRO1p4oQPQQtdVyPWaqtG52jKAH7fOcvbCjyXNogKaD2uZuMg7Ps6GN0RiQwm6WLx3cTjkcoWinHdSBck06PTGhUTUV9fF74I0sj0+rdZQgRpTAut4LkY14vwK2/EHsCwyIxH2Wpn8LtJbOWkxt/5mA+dx/vNZiwRNhurOH1nXU60aDujhUoba3aiAQl0yV2TaTx5u9QBpscJpwez/arVs/HvaEBRSHLCJIH7X3GnqfFqjpuVSqlSjBgBupl2LjenztgV1rH8IFa4njA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0rigZ++MbBuGufh9GmN/eA2TQY7krzeh8M2cqJ+47o=;
 b=jDOqKn0OOUvevYEDsBK2B0xYguJz4VLwFg7GHZi9CQXO4fgwUlnehNXF/oVbHb/M8z67evZI3ZeZNMKwEgy6t08KXveMlbrL+gQaTVEM/IUHG2E7M2hcBMDynCwYjc+XZnuiAtXSG6mygIsil4bJX/Q0EN3LNaxksUv+lBR3sF4NuqknW9z8TLnwQ9dfFV5g6nLPemv89Leir0h69lnhnjDVV6CXuANQGhscEJqCLeQ50ZbmXbzqIR3bY0HhCj9jv1XtKcheJOkYMk4bFO9zurlmVocOR60FHxmZD5FF1EWIxelLGZ/mwDPqHpCRxd8NV5X4nu9dHRU2EohPn5RFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0rigZ++MbBuGufh9GmN/eA2TQY7krzeh8M2cqJ+47o=;
 b=aaQWF0ydzLDaP2t/YDNkF57HjRTFioGZyj3qiPtJFvvO745Zdr6MfW7ReYPSC43IhcJFC8em283VTMESFK2bG2VjC4BKRReGfC1QAodLSfaNwwohxoHdVijpOOmbTjIVE/+0xJGzBL3ZdYDv9++LP13t4xeDzg630USisfQEVog=
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
Subject: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
Date: Thu, 6 Jul 2023 21:47:48 -0400
Message-ID: <20230707014754.51333-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707014754.51333-1-stewart.hildebrand@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT113:EE_|CH2PR12MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e8f078-2347-45cd-0310-08db7e8c4a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JWStyl0azENLkvX6rVue17JMZJmqIK8SUWLXigJ0PQuLe1cLlH5hjMnLj64WADpBEQ9S6Hv4K9+6bYmsdwYhL7FkgO2QbxI40g7pOd1+duYRexg9rFlaUTOJwyAKDO9fqgRkADyAM6f6Ew0S2+kFbfpPGB+xIZ1gghu4VmwwM1NShjuW3o9GzbRhDdskipOxdjPcNUvDYAV26enUn04QvCSbIly5gvOzdbTIF2Pxe1eh3AI/Khqb9PwKFNMjtGtatobTe25E0/dMf+UdkMo33OWRvxZ58S6CWKbCbyNf+6Ue5QAGO4gp0Z02U4Hr2+p7r0srZ0IEgjAIKgYl0N9Pr9doK09grL1Am+xfAnoxT0YvY/LISInAXq/e5zaU0pXlTQPHNe2GVeF8EbJKVRHTrEBAUNg5YZ0eOmi4tLfsgXcSq2OqlYwLP+WEfEZv/MlOvUId/yRku0lxGx9QRTOXMREYiROiSXATjuEhJa9+6ZpUrlcxFPXQjoTiXkA9RQOkq1Xm6qgL+pY0rO6TK+mQ3nbf4WMbgIjh5tJzNhWiRGbuJka0PC/lM3e+XpGxrnXNfkYPkIlSKfvXXeeGo1Wry5tx10Y1gJ5fwCAEpPbnVBKFv+vq6N0ymMjFjRFn4BKgIeBC7bFl1GsUJUki1XV1p8qrkhi2LfmM0kUt0l2q1EpH1n2roA/xg5SlcLJfB/8iiQSEl5skHi7aZGkpdjXzu/uT1aqaaTutRONQ1NsT89TZsOmGDIJfCzoSxWyPgdTIftXzK9fk+r39zqGt4FoYInPA6VsyfaP6E37NYE6wNaU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(6666004)(40460700003)(82740400003)(478600001)(54906003)(81166007)(356005)(5660300002)(8676002)(8936002)(2906002)(36756003)(82310400005)(44832011)(40480700001)(70586007)(4326008)(6916009)(70206006)(316002)(41300700001)(1076003)(26005)(86362001)(36860700001)(426003)(47076005)(186003)(336012)(2616005)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 01:48:40.9227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e8f078-2347-45cd-0310-08db7e8c4a4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4924

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
---
(cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
 downstream branch [1])

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
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
---
 xen/arch/arm/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 439cc94f3344..4e0cc421ad48 100644
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
2.41.0


