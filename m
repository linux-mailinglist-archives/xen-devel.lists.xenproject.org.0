Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E834B4031
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271069.465402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvP-0007IB-FS; Mon, 14 Feb 2022 03:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271069.465402; Mon, 14 Feb 2022 03:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvP-0007DO-9k; Mon, 14 Feb 2022 03:21:15 +0000
Received: by outflank-mailman (input) for mailman id 271069;
 Mon, 14 Feb 2022 03:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvN-0007B5-KL
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2877ef72-8d45-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 04:21:12 +0100 (CET)
Received: from AS9PR06CA0170.eurprd06.prod.outlook.com (2603:10a6:20b:45c::30)
 by AM5PR0801MB1922.eurprd08.prod.outlook.com (2603:10a6:203:4b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:08 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::5) by AS9PR06CA0170.outlook.office365.com
 (2603:10a6:20b:45c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:08 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Mon, 14 Feb 2022 03:21:08 +0000
Received: from 14b0bff7f3e5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EF27C02-6C50-451F-977D-8ACBA3309D22.1; 
 Mon, 14 Feb 2022 03:21:01 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14b0bff7f3e5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:01 +0000
Received: from AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26)
 by AM5PR0801MB1617.eurprd08.prod.outlook.com (2603:10a6:203:39::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:00 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::99) by AM6PR08CA0014.outlook.office365.com
 (2603:10a6:20b:b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:00 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:00 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:03 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:02 +0000
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
X-Inumbo-ID: 2877ef72-8d45-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRbPxrfxtUguB6iv9k6N/YrNB/mDdmcGGUpf5LaQEEM=;
 b=l7JVg8X8abnzkPvGmomkMftevNR2bTX6whbXQVw0jRvKt5ASev6kniqONP+B/JdEsyMoE5KPUlGkth99to24XgFr+HMe4pILFaspHUBl9ZoKlE8Kza02xVBFsD8rSrqwaQgZ9fL7KHRPh4Ilcj24yp60v9DE82EI8o1grc/2Xck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0aa005b79a539185
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn7t9wL/8zslFhuNOCp+J8soot3UWDQ3Koi6/Ht1ctiI/tetglwQ9acSck/+wJK2D9ff6LEafTCWqcIsXPuCi/x59cJSuOqkMnOip3qbgVqICyIn/CFgQAL4GMZBXrJA5nSgu1kYdbj+QB3ieuLQKQNEq8p+f3ZHsiMRDoyiJuadeiweyOcUL1rVDjgTCcm3PS6VOkPN14JqvqjpAKjhZxubS0u4e1YeJC45mtjoVFCnGpraLWSquVERM5kIhDftNa7vUG5yRzvt39Ah2v87I8ovXdQs/YmfcSwejIKCK6pnvRdfTuWAEdog2u2oqY3/ctU6/ZTZmL8m5TeKM6lC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRbPxrfxtUguB6iv9k6N/YrNB/mDdmcGGUpf5LaQEEM=;
 b=XSJMtEzIpVWbVItoH67FfefwmcRj3Jmd/2XecuMbxWfaJFmKkXzpz09/B9LPE/M7ye5BIKfKO1j0LNyg7boKeJ0ZeVibf2ITNpEuw4qDBzMGAzHTByV50mDUd95SsFkaGXVOGL99LPKeaXR8EjOCU0PAjClmUIEtzQf42SgDYDpmHnf59NSP5/xrjxpvUWNOvSk0nNb6XgPZmY5LMUgY/2NvlvzOegOnqFS+7QRR7X7c5i5pIzLkCy1zYNrK0XV3tcMAGNyErBt03K6xWnfalwpPB646uXqctnMpOM16o3Z027msAVQQeV6zFmYVU1Q3w4DZ6aydGwmgT9kWSrXJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRbPxrfxtUguB6iv9k6N/YrNB/mDdmcGGUpf5LaQEEM=;
 b=l7JVg8X8abnzkPvGmomkMftevNR2bTX6whbXQVw0jRvKt5ASev6kniqONP+B/JdEsyMoE5KPUlGkth99to24XgFr+HMe4pILFaspHUBl9ZoKlE8Kza02xVBFsD8rSrqwaQgZ9fL7KHRPh4Ilcj24yp60v9DE82EI8o1grc/2Xck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 03/11] xen/arm: Allow device-passthrough even the IOMMU is off
Date: Mon, 14 Feb 2022 03:19:48 +0000
Message-ID: <20220214031956.3726764-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: f5050ff9-08df-4a93-8e63-08d9ef690afb
X-MS-TrafficTypeDiagnostic:
	AM5PR0801MB1617:EE_|VE1EUR03FT058:EE_|AM5PR0801MB1922:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1922B4AEB99AF3B313563C2FF7339@AM5PR0801MB1922.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ephZ2oyUDcH98HjX9CcnN3bu0CdjZtw1BtLTurq8DI6iT2zBzilFMpZpdrhcQ+ay7YVtAGJYzyIhK4ZLpr0oFVPROXligPXfkzHrK8+xmSzqrJE+GHKeYQsaAsTpz0Stnull4wpvet0wM6pdGAnsR+IMW3JDBZyfUZhn+SCC9MXr0VxA5wb3j8/F6SvhecSKxSILGks9Mjer5XAvO679ZPok4A0Gn3yJ2iA81/lViO7ShRAj/aCAI/XXbS04R30YzI/5B6+yS8EQ7JXd6xd3OTTnYgLPMwDKGEHZvwOr5yMgKkFPI7zcMaE5NaiWSWrq+gZuw2FZb3bXXKXlIGPp30sjOzMpKb1651iJowJsmxJ72b4S58LSEVHLFi5yh1e0OhJkFRx8QcZ/4Yasau+4jvSU5SF56bE3PJIpjd3ncHf0ym92qzWXHOEyegV01xPoJMsldu/lTCfUpDUNd/W+5+SMzwYMoLEGeDulqb9VXzYE1XWsq56EYu/9amP6U71TsWJ3es2C9gyo6UXbiABCbG3BBYDbfnAXXReA5KXVvwSPn1eYwE7+5Re4ywBtiiUVsIqYTZAMX2Y1E5Nq04bxc9m7Xno07kOHj2vpLpHssv7w0TlsggKuDw0u+tr0VM1tImcPNVH+EEhyycIgXmLku1lo1G6Z/P071gLLdRImV4SUXCbVW7F1P5L9P0Azwqzl9Wwqtu9tfdGsSfS29171pg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(81166007)(8936002)(54906003)(26005)(186003)(110136005)(70206006)(4326008)(8676002)(5660300002)(44832011)(82310400004)(2906002)(356005)(70586007)(86362001)(47076005)(2616005)(36860700001)(36756003)(508600001)(83380400001)(1076003)(40460700003)(336012)(426003)(7696005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1617
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53cd6acd-612c-4cf5-aee3-08d9ef6905f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+pBOsRCrhHTUW51ns4zGeurTLnkY4LiIVBo8mlf5Gb7iOMhsLiKQjCTOP3+Y909ekFIuEeC1veqVRfte+FZixoKjByEqJccjiOxKRlhIS9x/8uLOzUS9IiNn2HCWiZW3rgCNIQ4vMZSf85GF+sT/rn19ceCVkL6TSUw3UIbhdlC/z8FChpY0qPb2Xj4LaJCtZRmI7N7ynMIFLzT9fNK1NWiyUqwfVUp30V1ALSRWrw+FvXXGv6QkF9InVkJEWWFxSbvQSsM3JHcOrC1XPgkOT3lKR2+fNcLSiNWTMV9MuY7S300djFwiMajCOnMdggZEQqBGaMj6y/Nlm2BReHQRPks7rYhf94VgsXDoO8Z+uFoNGtq1Qetp+dpVhHJfrPKgO9hg45kaetKGQCoCb0/JZBTZS3lH7vAvnjeGup8tVIjX3DvS3hTkkKLwVmhvJMTTsjKJry0rBBEH1cnXQeg1v/ppnYnGStsug6UqBrQ7FCiFifnR4oPXwCrY4qfRKkhnvtZcwXSgcK7n5Ds1pgOhWtGR3wJnpGGDmy+VO16FOQuu9ce5+rEwPnmbYE2XOJZk1x+ZkBuMS24CebxOm+0anZ8vMCanMATzW7POPVXYRTbDlbXDzPZLsfW9fO6vJJao5qUrRm8KoS3n36I38teheQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(2906002)(83380400001)(44832011)(508600001)(426003)(336012)(7696005)(5660300002)(47076005)(6666004)(81166007)(316002)(82310400004)(8936002)(8676002)(186003)(2616005)(4326008)(36860700001)(54906003)(26005)(36756003)(110136005)(70586007)(1076003)(86362001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:08.3404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5050ff9-08df-4a93-8e63-08d9ef690afb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1922

From: Stefano Stabellini <sstabellini@kernel.org>

At the moment, we are only supporting device-passthrough when Xen has
enabled the IOMMU. There are some use cases where it is not possible to
use the IOMMU (e.g. doesn't exist, hardware limitation, performance) yet
it would be OK to assign a device to trusted domain so long they are
direct-mapped or the device doesn't do DMA.

Note that when the IOMMU is disabled, it will be necessary to add
xen,force-assign-without-iommu for every device that needs to be assigned.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 changes:
- new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
direct-map for domUs"
---
v4 changes:
- explain briefly in the commit message why we want to do device assignment
without IOMMU.
---
v5 changes:
- nothing changed
---
v6 changes
- commit message refinement
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6467e8ee32..c1e8c99f64 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3047,7 +3047,8 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
+             iommu_enabled )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.25.1


