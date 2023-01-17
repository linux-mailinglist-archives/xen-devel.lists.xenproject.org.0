Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11AD66E52A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479672.743747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1Z-0003iT-B4; Tue, 17 Jan 2023 17:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479672.743747; Tue, 17 Jan 2023 17:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1Z-0003eA-5r; Tue, 17 Jan 2023 17:45:29 +0000
Received: by outflank-mailman (input) for mailman id 479672;
 Tue, 17 Jan 2023 17:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1W-0000r0-VQ
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9150966-968e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 18:45:26 +0100 (CET)
Received: from BL1P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::27)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:23 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::3f) by BL1P223CA0022.outlook.office365.com
 (2603:10b6:208:2c4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 17:45:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:22 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:21 -0600
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
X-Inumbo-ID: b9150966-968e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBJjOCkPyaoxD6G7id62wRiaiWDS/1HY87hdxnzub2UNmcIXt+m0m44F9H9Yq696VilWXc889IefY6MpjEQm0bKoE/bvOz/RZdVwhwF5jHwfJYR/BgC3uLed3zkpr4ZxW/DlApTDfkg+cR0qdBzhPVJc8rssUR9ZcBgAbgMGPNerPRDwr3+CESrkvacorewa3/9CxK0pdIe3GK/RTRyPIxYp4G6voz6SIghcm/GIiJf/3wF9TRcKlAcSjpc2bBgkZtyfkX30QLa3YPfOXER6kCLXVDS05laULDKVCF5nrEjPRbSyCQotOSx2jZNoK36EYxOIjo5sLVgJ9loG8oZGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nDuDeqGPvT23nv75ZOIBleV+rCr7pLBOWXoJ8VggXg=;
 b=GPfTSl6dycvsx8crBIZOVcl/YOjUtuql06TX+aOi3b+fI30oVuxqOApcqHoNYyRYB89dKoJV/RbK+pOsvKZDbDBnUqy52hu7EbHLZZiOd9zci+uWuKMALugB+iQZ6Z5aQYOgszaow5dX+n6TUselqYn4zH4Ek6hyXqsycDH97J3PpAlyZ9shDgV80Gr3z7KwqtqAZh0MS+xmUUzrV8YDR/rKs9OyZZU8zHen3wUasxdlAjihfcihaRcDuHSPcV/XYJ8kXlcdwWM3skBqC6MQoF/Ieo6s+opSVHjMV+3p8IMV9jjLgiS69eVzocI/ZyjjGIpUfyBUbjYYe0mLXSaRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nDuDeqGPvT23nv75ZOIBleV+rCr7pLBOWXoJ8VggXg=;
 b=rCL9kKkbpiuErU1APbqn83efvQQs5QIdaSwioZK9XIJ17kOE3+I3EqemkgC4YCnSiCdp5woNHgVHGXxy2t3Wklk1PiKe2OYvNwvq6Wso4EQLEbpTVuumBDZ1Zbv8UzulNpZj7mH+28LKQwKoEFQqlE4BlxougO5A4RpwxzAyIVg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
Date: Tue, 17 Jan 2023 17:43:58 +0000
Message-ID: <20230117174358.15344-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: decc4f7b-83ff-4bc6-1c26-08daf8b29c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z8gaDb+q0YxsODVGSp4Qzyz0rZZ0aV8Er2c4KtZ1LLzKshoDeE5Cmrcjdk+jMis9w726fSVcuMPlJ5u8PGraQnqlChyv4wjRAzLUU/i1LawdYRQGxoZG905gHGbsWo3eEWpYspewdrvSe8GoztTQkJOVxuvrOKUp22PvQDJAsOaaGStxfhldGNut2kozWWffK5VZ6lseQUPBmKNFU8hzawo9O64tMH42wKBMcB1w3ZsIA9OnMTnCZDhgwcBEXRL++QRcutO/JauR5Asao6Yq0Kf+bW5x64H1alZC3tSp1SgGYLcGbJSmV6qfy+ThuI7i7w8ZL/dOLkRclpQMwGrYGoSQsoKFraqjIn9FoE/A4jmY0Q17CVAVXjkmW143z1e8rrLH3N93VzIxt4Ds4Hf9MVt5cqF6LpmLnvivtDqxW6cVyGY2WveRRzczBn54lo99VwBqucvOzkWvwPpeOmjmWCveBtpDZXQ0jQpYwMG6FgZv60mY1TCtlqGEe2Nm5mY3yEUENjKkTiuEX6Vb1MZYhZGibBwiGDx/N+y+d+aVqH3e1aIeXR6pToDYQKXg8P0x/JC4FM6IFdXjgr4wFqvQg9dajFVXptOKihVx3hIRCQ6V3OHgbW6iax+hEW2OGatJzwz2+1puRDdXLlFz2L3gOcBhoIeOvaAp9CvphoKWB6mvQMVzi75vdW4L9sIzVA6DWIXjaErOL4WiS+8XT8n2YkXPqehjpJxLRsREfxyBgt4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(8936002)(36756003)(83380400001)(2616005)(70206006)(70586007)(6916009)(4326008)(47076005)(426003)(8676002)(336012)(54906003)(316002)(5660300002)(81166007)(356005)(82740400003)(82310400005)(86362001)(1076003)(2906002)(40460700003)(103116003)(36860700001)(40480700001)(478600001)(186003)(26005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:23.3593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: decc4f7b-83ff-4bc6-1c26-08daf8b29c2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003

VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
"Virtualization Translation Control Register" for the bit descriptions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - New patch.

 xen/arch/arm/p2m.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..cfdea55e71 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
     register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
 
 #ifdef CONFIG_ARM_32
-    if ( p2m_ipa_bits < 40 )
+    if ( p2m_ipa_bits < PADDR_BITS )
         panic("P2M: Not able to support %u-bit IPA at the moment\n",
               p2m_ipa_bits);
 
-    printk("P2M: 40-bit IPA\n");
-    p2m_ipa_bits = 40;
+    printk("P2M: %u-bit IPA\n",PADDR_BITS);
+    p2m_ipa_bits = PADDR_BITS;
+#ifdef CONFIG_ARM_PA_32
+    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
+#else
     val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
+#endif
     val |= VTCR_SL0(0x1); /* P2M starts at first level */
 #else /* CONFIG_ARM_64 */
     static const struct {
-- 
2.17.1


