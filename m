Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E4452B02
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226094.390686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1e-0006RG-2e; Tue, 16 Nov 2021 06:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226094.390686; Tue, 16 Nov 2021 06:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms1d-0006K6-Ri; Tue, 16 Nov 2021 06:33:01 +0000
Received: by outflank-mailman (input) for mailman id 226094;
 Tue, 16 Nov 2021 06:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms1c-0001yg-49
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:33:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09abfe24-46a7-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 07:32:58 +0100 (CET)
Received: from AS9PR06CA0065.eurprd06.prod.outlook.com (2603:10a6:20b:464::30)
 by AM6PR08MB3909.eurprd08.prod.outlook.com (2603:10a6:20b:8e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 06:32:35 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::b6) by AS9PR06CA0065.outlook.office365.com
 (2603:10a6:20b:464::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:33 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Tue, 16 Nov 2021 06:32:33 +0000
Received: from 43cec5f3e56d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55F79680-E9D2-445F-940F-8917808E6AA3.1; 
 Tue, 16 Nov 2021 06:32:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43cec5f3e56d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:26 +0000
Received: from DB7PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:52::39)
 by DB7PR08MB3323.eurprd08.prod.outlook.com (2603:10a6:5:1c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:15 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::e8) by DB7PR02CA0026.outlook.office365.com
 (2603:10a6:10:52::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:15 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:14 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:12 +0000
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
X-Inumbo-ID: 09abfe24-46a7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLLz/WofmlF99QVBOwKRtERUtZEC32OCFQqbgszLG0k=;
 b=axeZAptQUP2ucEdgz0mseLytPExPjzqSTD8/wfJ2Gy+RUieno4wGyTDz2wrbimiAvXgJJ8J780PiXaQFq7Am9tESYsLDvUrEDrOzvVDMspf6T2UdMN+GGPWakTLmWwY6Nusr+cfE+WeeHADv/BNfTiowLfoSO7Dg/KbA6xxASQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd8ed3fcd4df5581
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhO4E2uWlx814IYB6wVQze6ku2kxubxb1szKSG83kyFuxaC4pbmYly8CQd6EoPc5iKfcC8dftzSCeEig4S163wBi0i5pwADVb1YtRNQzJYZDp01xVdHt66r7eZZCQvq9gHBVuGTsJJeO4SV4Y9M46JVjOkQ3BlV2Pw99I5WUlWfEJxhQtVRrDp6Da82JCUkBrnqBKX3b83jacGS8tawRL3fSu+srIt8G5e9U8uwTAGTTDd1AvNHsb2qwMQsZ7CEmH8YGArYqmIiXynj4HNV1GUiKd44kWrJcULQ2UKgmFYJxi22pBE1Jop+P/TxkABuTCUESg7pnrOtnscm0mUshrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLLz/WofmlF99QVBOwKRtERUtZEC32OCFQqbgszLG0k=;
 b=oYCS6aqjrSeFfUALIZp2sbv5nA0yXK4UnpTh0dnbBKWrJIGMzaCt5bsMkXyMKeuT8qUKKol7IbqNGS95r9JGQ8lT10mk8dS+zWgZTeCWiFlKyrEHxDadgX/fKAfPSVo0mjOxvPEVnX/e43wF7/xRMO8fUlGEJnxKjfTi9jUWCwP8bp91+B2fNCiy5C5BWeKV313k1cj5/VTjABcbyrHlvleuJvr2LNMdvBRcjMarHyhV6dQv6iYyEaJldgbawpWc2M0F9f1yDTawXwrFrAIFsmsZqfKJ3nFECF1hdRL85LLn52SXdtl886EWnTK06j+tQL6ngCwl5gZwvZtPpzcZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLLz/WofmlF99QVBOwKRtERUtZEC32OCFQqbgszLG0k=;
 b=axeZAptQUP2ucEdgz0mseLytPExPjzqSTD8/wfJ2Gy+RUieno4wGyTDz2wrbimiAvXgJJ8J780PiXaQFq7Am9tESYsLDvUrEDrOzvVDMspf6T2UdMN+GGPWakTLmWwY6Nusr+cfE+WeeHADv/BNfTiowLfoSO7Dg/KbA6xxASQ0=
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
Subject: [PATCH v3 03/10] xen/arm: introduce new helper parse_static_mem_prop and acquire_static_memory_bank
Date: Tue, 16 Nov 2021 06:31:48 +0000
Message-ID: <20211116063155.901183-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffb7e8e8-c3bc-4292-24fd-08d9a8cadfb9
X-MS-TrafficTypeDiagnostic: DB7PR08MB3323:|AM6PR08MB3909:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3909A5670EE1468CA5D0FAF8F7999@AM6PR08MB3909.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:281;OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YgY5E3aN2Xf9veT9bmw36rgHt+EBpmIWE2izfFRGWL0jPpZHSOdLnn2cFBfuQp7TrqxaXtWWOZvJpQf4/bIhLPjbHP4XdJT/h0Vx17km9pBR65WYmykR9toGHrLw22r7R58s9uwLqv0xggJ23aYAaGHwXSuiqhjgT4OhPR59RjFcZxWzpmzGGzcR4+mDD12FYecDvVtaNZoLTbgoVtaAQQFyIzgjnAx7/OgTIs5TktEgnQ4m4lq7va/HXvfUidDLyK5pW4Apu+hnJF16OWAPTlyzD2gekWfoykiqCQzXqcBWxwgQS8N9zBPyu7E9JCfKodhojJfkHdoEfjXOGlBpn4M33p8G0Ckd+d3NAcJBAHeZTR3vO0clG0LjLGelFv9H+iM38gucXPHLUkyWErUUmh5b8IsraOrDpf0azcyoQCkvMW4p91dz93j3kzGjuPMrEPaKU9G30qj23WcprnO9UH8woynfz8AaCyMDzh4dnPoWJP/vhMIdUkp0ZdVjN+3Owtcbs7cNRxwkEKHmKuU2eDsuDTqtixiqhPvtVUqgL9SXlxBiqm0rr5+wWFAlVhsjHqBpCJzGiaFa3s+fjW1W7hmhP5MMwDZCkT2wryLaFSO2k3dH5cL7oVieq6yosX8RYEsw3ISiOvsN3UbFTdq82jzK9gc6nQV6QFHagvbZllwB1nRJPrk9AJvJg8Kns/yrB1HdUUrPdsdf5V2wK8LZJyRcieOR5nj1jyKViBVmG1g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(5660300002)(8936002)(82310400003)(356005)(6666004)(26005)(2616005)(86362001)(1076003)(110136005)(54906003)(47076005)(2906002)(44832011)(186003)(36756003)(81166007)(7696005)(4326008)(336012)(36860700001)(508600001)(83380400001)(70586007)(426003)(316002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3323
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eabbbfbb-ef8e-42bc-df11-08d9a8cad47b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c7JpKh8hq9+SR/5B0h2q8q85BlCo1wWFVfipaqplccKdoqrHu+U+f9fzgb6cD3xYmj7pKh5HhFnR6b3UO9UH3eP2MQAurMQzY+Fn8/QWKNleAdIWbs0LvOmVNV0FFe+ggo512sbkmRxZijv0nEtqq7YO3g5iGuWIqvjezaXZt9M6lRih6k1b3F/t43NZQhMegrJlJU7l6OjWIgJKxh4T+Wfg3wCi6sMjXedWSSdB74jJCKFJod/rrkKy3hgAzercxuIR//1iBZvPTVSTDM70yV6M96fAQO/GRH68yqeeM5R9KUPHCwbzwsACrUj07nhMFKSgkik9uvK/+pSEyiYc0rQtslRZ+UieRcwh157KOgzWC+akGvfianDA5D09wckGqvJf7srQwgcIQzccqfYqFSZ5TeqEYND8ksRC/p6gmijJD5n3FT8oATNRN/XgFUxF4S32t50xcXVQ65XFEun4STYe0GgeVfu6qIQ5uNzYQkrWu5sFgaqTwpiPO9cdmWahvSGzWOE+7aY+J8OvCT8uVBRHhBwG20LZWmNctPV9VZxQm7fNuB3CvDIJJZzOIa2lQAQSK0oklV+Q9QH6Du/Hv+XtkXM2dB0A+vWrbQmmq6j7KFpiiURx8SPOw6oRiHQHs8Rx8xCGgeae2XzX9IC+gk8eA2tWG017qe3t79JrMtPWI4ckFGnU/ixudkbjyOBQxPrwNXvS9YrZF4d+rJk0yQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(1076003)(70206006)(4326008)(82310400003)(26005)(2906002)(36756003)(54906003)(316002)(110136005)(7696005)(81166007)(83380400001)(336012)(508600001)(6666004)(70586007)(8676002)(36860700001)(47076005)(8936002)(86362001)(5660300002)(2616005)(44832011)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:33.8839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb7e8e8-c3bc-4292-24fd-08d9a8cadfb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3909

Later, we will introduce allocate_static_memory_11 for allocating static
memory for direct-map domains, and it will share a lot common codes with
the existing allocate_static_memory.

In order not to bring a lot of duplicate codes, and also to make the whole
code more readable, this commit extracts common codes into two new helpers
parse_static_mem_prop and acquire_static_memory_bank.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- new commit to move the split off of the code outside in a separate patch
---
 xen/arch/arm/domain_build.c | 100 +++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7a063f62fe..1dc728e848 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -515,12 +515,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
     return true;
 }
 
+static mfn_t __init acquire_static_memory_bank(struct domain *d,
+                                             const __be32 **cell,
+                                             u32 addr_cells, u32 size_cells,
+                                             paddr_t *pbase, paddr_t *psize)
+{
+    mfn_t smfn;
+    int res;
+
+    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
+    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
+    if ( PFN_DOWN(*psize) > UINT_MAX )
+    {
+        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
+               d, *psize);
+        return INVALID_MFN;
+    }
+
+    smfn = maddr_to_mfn(*pbase);
+    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
+    if ( res )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire static memory: %d.\n", d, res);
+        return INVALID_MFN;
+    }
+
+    return smfn;
+}
+
+static int __init parse_static_mem_prop(const struct dt_device_node *node,
+                                        u32 *addr_cells, u32 *size_cells,
+                                        int *length, const __be32 **cell)
+{
+    const struct dt_property *prop;
+
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                               addr_cells) )
+    {
+        printk(XENLOG_ERR
+               "failed to read \"#xen,static-mem-address-cells\".\n");
+        return -EINVAL;
+    }
+
+    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                               size_cells) )
+    {
+        printk(XENLOG_ERR
+               "failed to read \"#xen,static-mem-size-cells\".\n");
+        return -EINVAL;
+    }
+
+    *cell = (const __be32 *)prop->value;
+    *length = prop->length;
+
+    return 0;
+}
+
 /* Allocate memory from static memory as RAM for one specific domain d. */
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
-    const struct dt_property *prop;
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, gbank, bank = 0;
     const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
@@ -529,24 +586,10 @@ static void __init allocate_static_memory(struct domain *d,
     u64 tot_size = 0;
     paddr_t pbase, psize, gsize;
     mfn_t smfn;
-    int res;
-
-    prop = dt_find_property(node, "xen,static-mem", NULL);
-    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
-                               &addr_cells) )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
-        goto fail;
-    }
+    int length;
 
-    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
-                               &size_cells) )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
         goto fail;
-    }
     reg_cells = addr_cells + size_cells;
 
     /*
@@ -557,29 +600,14 @@ static void __init allocate_static_memory(struct domain *d,
     gbank = 0;
     gsize = ramsize[gbank];
     kinfo->mem.bank[gbank].start = rambase[gbank];
-
-    cell = (const __be32 *)prop->value;
-    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+    nr_banks = length / (reg_cells * sizeof (u32));
 
     for ( ; bank < nr_banks; bank++ )
     {
-        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
-        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
-
-        if ( PFN_DOWN(psize) > UINT_MAX )
-        {
-            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
-                   d, psize);
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( !mfn_valid(smfn) )
             goto fail;
-        }
-        smfn = maddr_to_mfn(pbase);
-        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
-        if ( res )
-        {
-            printk(XENLOG_ERR
-                   "%pd: failed to acquire static memory: %d.\n", d, res);
-            goto fail;
-        }
 
         printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
                d, bank, pbase, pbase + psize);
-- 
2.25.1


