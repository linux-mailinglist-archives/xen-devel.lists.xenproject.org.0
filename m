Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97574D5B6A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288728.489765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWJ-0003KM-0z; Fri, 11 Mar 2022 06:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288728.489765; Fri, 11 Mar 2022 06:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWI-0003HY-MF; Fri, 11 Mar 2022 06:12:58 +0000
Received: by outflank-mailman (input) for mailman id 288728;
 Fri, 11 Mar 2022 06:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWG-0008Q3-M2
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a2db3e8-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:12:55 +0100 (CET)
Received: from AS8PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:20b:313::8)
 by VI1PR0801MB1935.eurprd08.prod.outlook.com (2603:10a6:800:87::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 11 Mar
 2022 06:12:51 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::94) by AS8PR04CA0063.outlook.office365.com
 (2603:10a6:20b:313::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:49 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Fri, 11 Mar 2022 06:12:49 +0000
Received: from 28280eae6570.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6511A843-2DD5-4832-869F-DB913DB77101.1; 
 Fri, 11 Mar 2022 06:12:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28280eae6570.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:43 +0000
Received: from AM5PR0101CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::43) by VI1PR08MB3823.eurprd08.prod.outlook.com
 (2603:10a6:803:c2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Fri, 11 Mar
 2022 06:12:41 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::be) by AM5PR0101CA0030.outlook.office365.com
 (2603:10a6:206:16::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.24 via Frontend Transport; Fri, 11 Mar 2022 06:12:38 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:35 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:33 +0000
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
X-Inumbo-ID: 4a2db3e8-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bSp5tvM7rKX9UVcthkuPyrtsBk3BRPoTnoVQ5rFyO8=;
 b=vokE7VE9Pe134rWz6CfxUcU9dgqMNWt8V4d/IHH/G/qj+rD5RyEO8cWnImnV7SOIKqVIRwOu2f6/bjcrBqwcjbMGMM6jobYUdKmtmDf2YaS/Z1Pmr2QHm3cvy9X7RKqlZBpGJND7DNw8CcwxWz/6U1Qw5jBBuq8tCI3Ds4WBSLk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74e58dee669366f6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+AgXP+2vOov0PBeexjTZBfM7Lp0yQd/i7BkCh8Fn0pvEFIHW4HFq57koUCFabsd7U1lQTGaPjISXsrFKJriRtFnKjNE2kYE1uAFEH/0UYxIwtVTxNUepST5PFREeZLheiHSqHW957yd2q2wuXn84NZLnmBhMBPnwmhILILG5djCSZ6CN+PjrYYoeWdQyIWqH2giHcyx5kknVkxMelkjhT+oT45ApGkixWrqx1X7NIfn4Bb2C5vs2Q4Haap3j/LM8809TP5vC4UJSDekyyG5NcR8eVzQFYt9PJ+5vxCOwKequAnzyFsQv6030oKYZjYfcxa3yHl7lFi4x4al4SYzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bSp5tvM7rKX9UVcthkuPyrtsBk3BRPoTnoVQ5rFyO8=;
 b=F2yg9B852m+q4m1S0YubZTQMElumoTKR0Js9werY5VLYTopQnvkTRExEsawQ7XPMxIM2f0ytttUf7L3U5zfMVc+f1OuxMk6pOi0NRKHmHgAyYfkC0uunQOVAB+pZySydHmdR4YxLShwljm9sCVXhmZIkO4tIzec7vCoLfjlPSAx45BxGVxzBuSiw6UNmi43F9IoII/Zhj0IbCkAglfjmBvwnXgoRyn/KNK+AIy7DWGhXb3Fq6m4DasouDd83YEckbaHqGDmUKd0ZtwzBbyUqUq+1vTCQkbIifBq4faUoTGPh4bK+4XhSaYHTNwL86sOyyISe2XdelrAW0tG7SkfFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bSp5tvM7rKX9UVcthkuPyrtsBk3BRPoTnoVQ5rFyO8=;
 b=vokE7VE9Pe134rWz6CfxUcU9dgqMNWt8V4d/IHH/G/qj+rD5RyEO8cWnImnV7SOIKqVIRwOu2f6/bjcrBqwcjbMGMM6jobYUdKmtmDf2YaS/Z1Pmr2QHm3cvy9X7RKqlZBpGJND7DNw8CcwxWz/6U1Qw5jBBuq8tCI3Ds4WBSLk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 09/13] xen/arm: enable statically shared memory on Dom0
Date: Fri, 11 Mar 2022 14:11:19 +0800
Message-ID: <20220311061123.1883189-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 67d17d15-7a52-4646-f820-08da03262b7c
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3823:EE_|AM5EUR03FT037:EE_|VI1PR0801MB1935:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1935C911F1AB635FE50BF57DF70C9@VI1PR0801MB1935.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hI7RjNMXdFV6mZWsfP+ofJDy8dmiS5Gpi4U8thMTMpmWBDwO3o/sE2D137AHhecPOhzLQp+7M4mHvhpJBoXk/SeiLgFdIneFuAnf9PP4BZXTl8a+/R5ZcP399oijlwYGPK8vMlJrz855wncZ99FzT327atmW+VGFyDEwngLNdy8AzMMk4JAXui5sAEw7B1lFaFT2sfLX2dRTCH7jehgqC+N66/odRiFUgoWp7hyICvHmycE9NMHYWjbhIdfWNgyBsKIyoG7R3S0+yFi8K6cT9FcDb2muMAEgGGTsPriOnwkaKZix0ajWInk43nL8PfbKc3h1j4gb8xHEH9Og+SaLv5xTyIOK2gXkZKmfgaHL01j7Q2Noysiig7vCtjtpJjdiiDp83JQuJwtLNTMAQmnRRzDNyTqWNAH8i1VKe0Ow+y/hAD1pI4VOH5/ezR2Sc2bs1X4kdrdRyA5bN7qLzNIUUpr446XPCAGMPwQrTkZmHDvgVBLuTHbWA2QVu80F8ip5a8VXOQAuFgI8VxHt3VgSkR4uYsvXXyvav7lx51Gdb0wAaSju0Mi9BOtY4S/rUPLaezmlbb5LcG8aYpVidfYo2r6em7PgtNBe4CS1SDOOWUE6T0IJo2OclYLWLaWx08HTS9fSViz89qdj4qA3/4SMGxCgsRvRTe15VD+Ie0tA892Yrqz8RuW/QIye6cvZ+vuD6fhCcRVxaxbNIzMdtK0mEw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(86362001)(26005)(336012)(70586007)(426003)(82310400004)(8936002)(186003)(8676002)(316002)(4326008)(508600001)(6666004)(70206006)(356005)(36756003)(1076003)(7696005)(81166007)(36860700001)(5660300002)(2906002)(2616005)(40460700003)(6916009)(54906003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3823
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef85de60-c0ba-4312-c22c-08da032624d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OK8XyJTcI9oA0J33lcHPhn10QNiU6zCb9sfmf7W/wIlRwXJx0SbgDY857oWZGYgiGB3Im6Y8KTqjy5yUp5isWemZnRRiQQqcAKs3HTP66SYRHrx+hDmW8uBf4b9fKWCYjpAcPzwLpLrUfEItSpvM+y1Va0vmPoAxecwJO/L2nnTLWoMV/LN5h1H/l/Th9XhqFEPk+0iKhm/bKre8kHB9PjtM+CoudwmUOZe9NvDZgt1FiD23DWGVcff5yvpwbfOaKsItubGr7qUFcu92eYN6Y3qF5cM6Z0cFgtrAieXYBIpXB5n5eX3sm6cPPhTV2MFijLhrLfWAaO0HBRMF4HDLJZYmflByIHUFobmLL+t+AOi9Tx0UaKfEI3gqE2bCY1tvzHBJAnkQBLTXTyPpeHfrmPsg8M56UyY8hSGQ+6YOdArhyyLzC5HuCNXzowsvvl2J5gJR3MIbi7nMXbRbL2eCVhnvG0rVJQBt5GkkdFvaxcdC/cl51kYI17szes/xRwaohPxUMzfGjwA187F99vHx0HeQoFm9YnqjAxLepdggm0ySx0MXWGb7MNF54UtDziNfIlaQSd3kiyBQFIESpbuUvEn/XwJucUF0yMy7BGmpDu1ldEDtXG9O2uFvF/L529WBjOk1OSEshdqtPao/6fmI33v0YokhbDe5edoE01zZvCLnMnR/AWf0/a/0cMzqRURU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(70586007)(8676002)(36756003)(4326008)(86362001)(54906003)(6916009)(316002)(82310400004)(81166007)(2906002)(8936002)(426003)(186003)(336012)(26005)(40460700003)(1076003)(2616005)(6666004)(508600001)(7696005)(36860700001)(47076005)(107886003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:49.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d17d15-7a52-4646-f820-08da03262b7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1935

From: Penny Zheng <penny.zheng@arm.com>

To add statically shared memory nodes in Dom0, user shall put according
static shared memory configuration under /chosen node.

This commit adds shm-processing function process_shm in construct_dom0
to enable statically shared memory on Dom0.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 997df46ddd..d35f98ff9c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2561,6 +2561,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                                    d->arch.shm_mem);
+        if ( res )
+            return res;
     }
 
     res = fdt_end_node(kinfo->fdt);
@@ -3572,6 +3577,9 @@ static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = {};
     int rc;
+#ifdef CONFIG_STATIC_SHM
+    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+#endif
 
     /* Sanity! */
     BUG_ON(d->domain_id != 0);
@@ -3606,6 +3614,12 @@ static int __init construct_dom0(struct domain *d)
     allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
+#ifdef CONFIG_STATIC_SHM
+    rc = process_shm(d, chosen);
+    if ( rc < 0 )
+        return rc;
+#endif
+
     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
     rc = gic_map_hwdom_extra_mappings(d);
     if ( rc < 0 )
-- 
2.25.1


