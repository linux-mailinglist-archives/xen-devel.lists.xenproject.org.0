Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D44506713
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307860.523194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjQM-0002Gm-Ux; Tue, 19 Apr 2022 08:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307860.523194; Tue, 19 Apr 2022 08:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjQM-0002Et-Rk; Tue, 19 Apr 2022 08:41:26 +0000
Received: by outflank-mailman (input) for mailman id 307860;
 Tue, 19 Apr 2022 08:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=abXu=U5=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngjQL-0002En-Tj
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:41:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe06::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cf3cce2-bfbc-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 10:41:24 +0200 (CEST)
Received: from DU2P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::28)
 by AS4PR08MB7782.eurprd08.prod.outlook.com (2603:10a6:20b:516::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 19 Apr
 2022 08:41:19 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::85) by DU2P251CA0026.outlook.office365.com
 (2603:10a6:10:230::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25 via Frontend
 Transport; Tue, 19 Apr 2022 08:41:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 08:41:19 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Tue, 19 Apr 2022 08:41:19 +0000
Received: from 3365da07ef86.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF6BD8C6-7682-42F6-8B85-127173D7295C.1; 
 Mon, 18 Apr 2022 09:09:29 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3365da07ef86.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:28 +0000
Received: from AM0PR02CA0188.eurprd02.prod.outlook.com (2603:10a6:20b:28e::25)
 by AS8PR08MB6903.eurprd08.prod.outlook.com (2603:10a6:20b:39e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:27 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28e:cafe::86) by AM0PR02CA0188.outlook.office365.com
 (2603:10a6:20b:28e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.21 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:26 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:23 +0000
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
X-Inumbo-ID: 7cf3cce2-bfbc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7tS9ML08zDxjl47hmFDH/GGJS3XOkcDbsDVCb+URRE=;
 b=ophlSkyirVWZp6K5Kd3j4XzwEF3tUz/x+En54lL/dfh9To2lRZJAtiz88CHf5JB3IFTxpca6p0YH8I2rplqSTaqDFMUTXLWo41CiDEm4zhEYYkRW29xs0rrXeBMLNuv7wO4f42XYyIgpMpNEJp2A/LRuFllevCnIlo2mxiHKOo8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 759d7a6716b78d46
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8+EqGHmU1+ZedttPSni5tCucyt4TCUM1SpOF5naxAku3MwFsms6aa/hza9SPP6PZ+iOOGX2w9IZmsYujYnes376visrkOq0xCNIBdU2gyWJZsdjYm2mVGn2/TexOYdbjvH8DdUjPhrX+LaPbN4suJ2dMCCKQBzDWkD9OmB16Dk6EIpyQPntc7QpZQZ1x+MUSvfrnSG9WbN2Xa3gGdXTAmpLRg3tc8Oexqye7whrwXvoKDlVTaNFIlaCuLywehJKFCzl5u/AsheUkrGI7hGVa9xVSrOitpNZEpzZtwdYhH1ybMB8u4s7Q5tccvrQ2edVQL0SuOse5vT3x5ojLdXWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7tS9ML08zDxjl47hmFDH/GGJS3XOkcDbsDVCb+URRE=;
 b=Nr6y8EKFB86xRa9yuHG1lhHAShNhFaqBfqT8yfbTH90CpUExSO+Brnz48OuQnkbrahUZTmZN5W42SMWz9w/ytcTklBxf2JHOwQKiPVCv3xRXMtydB3lVMkGhX12spaRTL1yJVy1fkmhVa2YZ9LkKuR3mmOb2L6P26Pz60nQKaRM52YmTrDO37yX/C6QoiHjtjoOHfk6Y3e0FCtzO3bsW4aUOVisUHSs494gXVIRqaK6J6zyQXeczWZCQSEZEcO/CVXFRY+BuFFQeDyAlnYw2YhbtKQDZeOtK5B0TtmwefU3jCXHLuq/j3bH+eNHotNWparD8tlmoJ1/mJsEJyemwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7tS9ML08zDxjl47hmFDH/GGJS3XOkcDbsDVCb+URRE=;
 b=ophlSkyirVWZp6K5Kd3j4XzwEF3tUz/x+En54lL/dfh9To2lRZJAtiz88CHf5JB3IFTxpca6p0YH8I2rplqSTaqDFMUTXLWo41CiDEm4zhEYYkRW29xs0rrXeBMLNuv7wO4f42XYyIgpMpNEJp2A/LRuFllevCnIlo2mxiHKOo8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 09/10] xen/x86: use paddr_t for addresses in NUMA node structure
Date: Mon, 18 Apr 2022 17:07:34 +0800
Message-ID: <20220418090735.3940393-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 767ffcf6-bf7e-403f-801c-08da21e06022
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6903:EE_|DB5EUR03FT060:EE_|AS4PR08MB7782:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR08MB77827DFA80BFC61E22FC21BA9EF29@AS4PR08MB7782.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AMqSS0+fCfqaVC27wyHNgTl1/1i5GpGNEYQundD5iZsGld5mywSsTbtcbaMmaBb4gkYp7NFnGWUWMK/ItLYPM8SH7m7+qPGG8SjnS3xACnNIXva6GlJjaocX86urk1fxIFN0ybFb3r8sZoo/V7oy4VurgB5j5l6kSfpBJt0t9HWGOOXLy/zne+mVrqTFTH7nTyR6CWqmn7F61dvBK4kx6Bp5XtRpnQkZIzdYzzDWs8kQz6A2ffx/F6t7Q60ItKmWk76/0lZBznDFeCIRd+yR2pkBmBtjvigX8VRMmgXHZJPkXiDHrWg9HXIeTADKgnA1B1EDiuloLkIQ33T3ZqMVcvAHHfYOFjxMWwV50wf6zC/TGzzbrdlPqLnXbWYDjWDAzASq6juTRRTFJdRQtVzsWfQ0zrW3LAGyJgczF32Gkbk9YELSwtk6Et2IsN1dRHVxaje96OIZ+YUcu3Zd88lMDUl5wz8lAjlu8cTQHignV7/BJtPOEf5mcLmrQX/wfdMKhhNStx9zszU3Oas0Vw8AqLADx0y/CCO98GxF+lo3ZjfJjyM0V2atHAcshBILeOuv7VnRhe3RUg1S4xQ3MZImCv+Y838/JPjOItloyXvhYTxFb503/5MFFFGdzaAQ/rhM13k2KsJ2zEk1CSnzDwFCs3rE3ynQZqyxw4wbI908qAxZM2iJ8i3AODkvxfKJGHW9MmFXs4IRcFsw1h+EDrrrLA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(40460700003)(110136005)(26005)(47076005)(7696005)(36860700001)(8936002)(6666004)(5660300002)(54906003)(336012)(70586007)(70206006)(81166007)(36756003)(8676002)(2616005)(83380400001)(4326008)(1076003)(82310400005)(86362001)(426003)(316002)(44832011)(508600001)(2906002)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6903
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40d31bc9-b61b-48fc-1074-08da211b2370
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OEDOW+7ZD/gYj1kvhdC6mCpuCALUuar241SfJ+H5dDkybekn/R2Z+OcIY/nLC+jxG1pi17pDUOMr3eNd9dAUI0Gyx3WXNZeFzlHI8KBOcjzkmXA8JO8honH10nQ0Ngi1T2w7n04uZwgbxjjkgG7BV1lFctBBL2LUXU0Kvqk28QYWmDFitJtLzkpcXhoEnmdOZ76u8GB6oVpeBjQpG4AO2mvkwHa0PVtoEbL9y0ELHI6TPf+TNHmkzZHawDLAUULpqOGvLqcvrM2GFCWAI+AQpcyVy3bKXZqhC4oahBCrzaNzV+ybuXsMQ2LklSKVd7/nSfmacPSva23Sz+pkbWsTkKYZ+oW0xUbbSiLJqTT+J7Z5eZIXYisBgbL4fFvcs7zTffInP7mvDUehiHxynrPpZKUPkM4eMpWpgZKZHporfSbM+teE6Zz+7fWOU5n0ZXdXqJLjt+i8PvP22czQFrB3jQEu1YHBxL4RwR7iGD962sixyrR2YOztruu7XtF/BaJXugly8bWkauE3iguAODvmFXVco0METtjj2CcM3l0gHJKK9bJoqUalH3MK6la5du+Pt/+gipN3cZ4ImIV9+ybjKkPml3grsx680KLWBZtxUJGxWjpy0fp6wSXueRJfgmSg8uIAvl0kDOf2Oeo7le0UhZ3UFo+/8Pull8gHDyBrFwR9Amcbmuf9O6ZwOWHgF8AS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(47076005)(5660300002)(426003)(82310400005)(70206006)(70586007)(44832011)(8676002)(36756003)(450100002)(4326008)(508600001)(316002)(8936002)(2906002)(36860700001)(81166007)(83380400001)(26005)(1076003)(336012)(186003)(6666004)(54906003)(40460700003)(110136005)(7696005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 08:41:19.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 767ffcf6-bf7e-403f-801c-08da21e06022
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7782

NUMA node structure "struct node" is using u64 as node memory
range. In order to make other architectures can reuse this
NUMA node relative code, we replace the u64 to paddr_t. And
use pfn_to_paddr and paddr_to_pfn to replace explicit shift
operations. The relate PRIx64 in print messages have been
replaced by PRIpaddr at the same time. And some being-phased-out
types like u64 in the lines we have touched also have been
converted to uint64_t or unsigned long.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 ->v2:
1. Drop useless cast.
2. Use initializers of the variables.
3. Replace u64 by uint64_t.
4. Use unsigned long for start_pfn and end_pfn.
---
 xen/arch/x86/include/asm/numa.h |  8 ++++----
 xen/arch/x86/numa.c             | 30 +++++++++++++++---------------
 xen/arch/x86/srat.c             | 25 +++++++++++++------------
 3 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 6eeae02060..1239f017c2 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -19,7 +19,7 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
 struct node { 
-	u64 start,end; 
+	paddr_t start, end;
 };
 
 extern int compute_hash_shift(struct node *nodes, int numnodes,
@@ -38,7 +38,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
@@ -76,9 +76,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_have_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 
-void srat_parse_regions(u64 addr);
+void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 680b7d9002..2b3a51afd0 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -162,12 +162,12 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 /* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
     unsigned long start_pfn, end_pfn;
 
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
+    start_pfn = paddr_to_pfn(start);
+    end_pfn = paddr_to_pfn(end);
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
@@ -198,11 +198,12 @@ void __init numa_init_array(void)
 static int numa_fake __initdata = 0;
 
 /* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
 {
     int i;
     struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
     if ( hweight64(sz) > 1 )
@@ -218,9 +219,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
     memset(&nodes,0,sizeof(nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;
         if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
         nodes[i].end = nodes[i].start + sz;
         printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
                i,
@@ -246,6 +247,8 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
 void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 { 
     int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
 
 #ifdef CONFIG_NUMA_EMU
     if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
@@ -253,17 +256,15 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
+    if ( !numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
            numa_off ? "NUMA turned off" : "No NUMA configuration found");
 
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
@@ -276,8 +277,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     for ( i = 0; i < nr_cpu_ids; i++ )
         numa_set_node(i, 0);
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
+    setup_node_bootmem(0, start, end);
 }
 
 void numa_add_cpu(int cpu)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index cfe24c7e78..c3e13059e9 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
 
@@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(u64 start, u64 end)
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
 {
 	int i;
 
@@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
 	return -1;
 }
 
-static __init void cutoff_node(int i, u64 start, u64 end)
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 {
 	struct node *nd = &nodes[i];
 	if (nd->start < start) {
@@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	u64 start, end;
+	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
 	int i;
@@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
 		                !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
 		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
@@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
+		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
 		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
@@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->end = end;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
+	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
@@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
 
 	for (i = 0; i < e820.nr_map; i++) {
 		int j, found;
-		unsigned long long start, end;
+		paddr_t start, end;
 
 		if (e820.map[i].type != E820_RAM) {
 			continue;
@@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
 	}
@@ -432,7 +432,7 @@ static int __init cf_check srat_parse_region(
 	return 0;
 }
 
-void __init srat_parse_regions(u64 addr)
+void __init srat_parse_regions(paddr_t addr)
 {
 	u64 mask;
 	unsigned int i;
@@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	/* Finally register nodes */
 	for_each_node_mask(i, all_nodes_parsed)
 	{
-		u64 size = nodes[i].end - nodes[i].start;
+		paddr_t size = nodes[i].end - nodes[i].start;
+
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
 			       "BIOS Bug or mis-configured hardware?\n", i);
-- 
2.25.1


