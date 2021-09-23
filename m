Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E51415E22
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193975.345616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfc-0000fm-1s; Thu, 23 Sep 2021 12:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193975.345616; Thu, 23 Sep 2021 12:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfb-0000a3-TA; Thu, 23 Sep 2021 12:17:43 +0000
Received: by outflank-mailman (input) for mailman id 193975;
 Thu, 23 Sep 2021 12:17:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNWT-0005KP-7N
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d98c97-e649-444e-b6ac-6ce67b78bbac;
 Thu, 23 Sep 2021 12:04:49 +0000 (UTC)
Received: from FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::21)
 by VI1PR08MB3296.eurprd08.prod.outlook.com (2603:10a6:803:3e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:04:43 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::d) by FR0P281CA0038.outlook.office365.com
 (2603:10a6:d10:48::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:43 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:43 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Thu, 23 Sep 2021 12:04:42 +0000
Received: from 66052b498c8c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 681A7DAD-D5D4-46CE-BE94-CA1844AD4D6B.1; 
 Thu, 23 Sep 2021 12:04:17 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66052b498c8c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:17 +0000
Received: from AS9PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:20b:465::21)
 by PAXPR08MB7203.eurprd08.prod.outlook.com (2603:10a6:102:20a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 12:04:17 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::94) by AS9PR06CA0103.outlook.office365.com
 (2603:10a6:20b:465::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:17 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:01 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:00 +0000
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
X-Inumbo-ID: 69d98c97-e649-444e-b6ac-6ce67b78bbac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIObFkd9jRKDqLY57XelL0JAnNTNC5COXU4N00/2A38=;
 b=74aQ+7KDAnTF9+j6xpUlrEN85gY6syIWqjKk8JqB+0q9rHbM8o52OeChSlj3+AttjAp3KHzRFx5mFZcI+mGJ1jvmYg6vSKLMqxIkonYk+ZLMobkKDmt37IS+Eyoa0NhVTvE3Es4kg/AT+bLuLE64HBqRCVv8blPc+gqMFnrNV3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 567f3102161f69e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP/zNJPO5KyDYCe5/wxO9umB3FvU5vtY2wLmCYzdV/UVFJqM/AAJyrGoumys7NZ8YzVivc42yqbzJNn6QOhXBYvPj27TivQS2E/a2/uIxyXPxjyA2UIG+SgjGz2mf4+DONnMVU6I7L8MW+Sc8VgnOHpt1lArHnP2VfCSbcRfmFCFu+I4R+IaA92WCUNYfiL/GoT0BBOz5eHSrEs66d56SzOYWiHbulrVk4yWBPxYPjOT0TEqMC08EL+QQHKxklEor/UHxolsAvVnhnCdvvG1OXclca7LOXMvw0Nt8TsRE7gmOF6WNrN+BbtPimLF9kyxPmzloAOt/A2MU3QMUEJv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wIObFkd9jRKDqLY57XelL0JAnNTNC5COXU4N00/2A38=;
 b=LBGWFaKxmXwylkWgvWOqpLhpoyn0jCAW8ZKB/7fLBKpZzawEdOAmjMqrsRdP/+reSNleIwRbFT+42PgeF7Wp+g6Wd5tJX/N7tfueqU7l7uVOLgMKiq+GTRH57MXcAkpImXvOH333uCNQ0apRroU1HIDBzyFvt0suwq5cyLrJnt/20OghCZ5IwWS1J7fyTcAyhIWcC3ZrFFIQxSC6qtjvJWzSSFyLC1eM8WsHVLJd92POKycWfnewJBJHt3QLPpZqQLDPWcotTQ4K/HeziSwyalOTmk3q8OyExlKVKelE93xLrTkLN4pMVi5KR+PMhhtL49tAC1sK4zLQjywMTzcIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIObFkd9jRKDqLY57XelL0JAnNTNC5COXU4N00/2A38=;
 b=74aQ+7KDAnTF9+j6xpUlrEN85gY6syIWqjKk8JqB+0q9rHbM8o52OeChSlj3+AttjAp3KHzRFx5mFZcI+mGJ1jvmYg6vSKLMqxIkonYk+ZLMobkKDmt37IS+Eyoa0NhVTvE3Es4kg/AT+bLuLE64HBqRCVv8blPc+gqMFnrNV3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 24/37] xen/arm: implement two arch helpers to get memory map info
Date: Thu, 23 Sep 2021 20:02:23 +0800
Message-ID: <20210923120236.3692135-25-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bac5a6e-2d53-4269-219b-08d97e8a545c
X-MS-TrafficTypeDiagnostic: PAXPR08MB7203:|VI1PR08MB3296:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3296161D0C0BE2E6867AB78B9EA39@VI1PR08MB3296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:411;OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XLLsowjDBurWKits5jk3cvABClzJgMkFxYytr5n51No/kq7tNPXVnCNL7+LzDWFFlaX7jewOWK9o8l0bWINhDmpaKdJUKQaMpZuDPJrq1+/EquKOH+ywFtZSrpoYbvwF/mE6RGW+ORNhnzh3XSwG+8NPcWNIe95MrgU2/zHGxKemfw6R8SA1xcibumFfTPxUEfbkHq7wKRg3euJ+PJvngxZ1vJisGh9meMlzxfXLd1WvVjzYYOg+i/XzZMnJCtIwHncMG+tbFXslHq8NzsDwRH6sc9j5YyAxliYzg1lWMrnwl0VujqD5thPtoub1peRanlGfwDoao53mYO+KSWVglHYiCFmaMprgNUS7ZLRYJDEJEOcGIbuSzlVVCGLNrdZr0EEACN/1YGnvD/6Z50TuO09JIf5xdoyjD7skT4f8GvYpI2/XLlkXtGxn+Q+WunffW3ACXtJ6rluaIX6/B2DpUK/7m9oh6QYBxnsPI7NgAYpxDDDIanDnI3Rl/h7N5lzf4GHZv1UI+xanCLSL5vZ7jaSMGExxrBzMJu9LanSsHsgZV0Jj/YS3jdJFCHKONmK5qpKFFIpH6Mw1KSCjzEMrYphBvOPrnoloRG5ICuXj069lFGSTnpCvyEDgkzb1px2Qdy6bRmBZXelcTlbGLil38DNfyE57ksjgRSDQh51mApK3W1py7EUFtW4sndnHYG5UD1k9F2Y5Jq5GP7YQl3weze3tW8nYR4F4BpUolp/6Nx4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(2616005)(508600001)(26005)(7696005)(83380400001)(81166007)(356005)(186003)(336012)(4744005)(1076003)(70586007)(70206006)(5660300002)(82310400003)(47076005)(6666004)(110136005)(36860700001)(86362001)(4326008)(2906002)(8676002)(316002)(8936002)(36756003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7203
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9d3b4a0-823a-4d7d-8bde-08d97e8a4493
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I/qx8ut2212vOdMajIPRJ9jKTwNIQOJvng4oJTay4805szLCvoZa2vJFU2cPIRMReLdNavh+EN/09ibxp1GArmd5TL/f0hfhFxqofhQxqfyMnu7kBaZBPgfs+2RQc9px6hESekjI7gG4bpFVN8Svnkd8pCPVj71aaghpkkayD+g28hYFs+8+Xg40iNAxu1rvUmLnF+gezmuDc83NEpvT1+B57ItJy44Wca84+OrRLk79to00SCqSFiyTNyqhOhw3+CJyyCDOA177gzC6Z+pQP96THfsVsv8eMJ6qJDW359sBIfrX3DesaImwiyHI0S2LtvmJpcGHeyoU0Z/ifX8vojnXIcnwcAFUOCPlaKpmVNIz+jWQdH9mk7naIb/2WpwGlFl4SoOHo6L3AoulGavMX1Cx7gTYwCM62JAgmqJ3RqVf7pbjWLV0U43RGcBJl4Qeqms/livc3THymiRuwjPIRzjRsitORmHGJh/ieXpRodZmDei6ZX8IWXZ2jGXjC/6rVbZZG3b0GnJr4bXi1CYDp67XhkEFpVf0Jr7CPGdkDQL80yRH9+zD7ocSS5/3EGzXNuGPb0oVsb8UDLFtXARX3CC6kXjVd6fZuGijTvU6IlGVtNoKhRCphf0iG4UYrdsvexQBxOPCDs27dxO3DHP34pU6rwXZApdz53iynTOpBk1mQMRmxpwI+M52P/sR+Q6cAz0oMpEwFF2sdDZLBqHgkQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(8936002)(110136005)(1076003)(186003)(2906002)(336012)(82310400003)(426003)(26005)(4744005)(47076005)(4326008)(316002)(7696005)(36860700001)(508600001)(36756003)(6666004)(44832011)(83380400001)(86362001)(81166007)(2616005)(70206006)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:43.4497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bac5a6e-2d53-4269-219b-08d97e8a545c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3296

These two helpers are architecture APIs that are required by
nodes_cover_memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 3f08870d69..3755b01ef4 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -67,3 +67,17 @@ uint8_t __node_distance(nodeid_t from, nodeid_t to)
     return node_distance_map[from][to];
 }
 EXPORT_SYMBOL(__node_distance);
+
+uint32_t __init arch_meminfo_get_nr_bank(void)
+{
+	return bootinfo.mem.nr_banks;
+}
+
+int __init arch_meminfo_get_ram_bank_range(uint32_t bank,
+	paddr_t *start, paddr_t *end)
+{
+	*start = bootinfo.mem.bank[bank].start;
+	*end = bootinfo.mem.bank[bank].start + bootinfo.mem.bank[bank].size;
+
+	return 0;
+}
-- 
2.25.1


