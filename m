Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF83E8EBA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165760.302980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWP-0001UQ-1R; Wed, 11 Aug 2021 10:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165760.302980; Wed, 11 Aug 2021 10:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWN-0001Em-V9; Wed, 11 Aug 2021 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 165760;
 Wed, 11 Aug 2021 10:31:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlS3-0002Qj-Ht
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9914a608-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:26:33 +0000 (UTC)
Received: from AM6PR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::29) by AM6PR08MB4230.eurprd08.prod.outlook.com
 (2603:10a6:20b:b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:22 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::94) by AM6PR01CA0052.outlook.office365.com
 (2603:10a6:20b:e0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:22 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Wed, 11 Aug 2021 10:26:21 +0000
Received: from 953aac4d7777.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 240EC2A7-6D33-475B-A18B-3652790E2523.1; 
 Wed, 11 Aug 2021 10:26:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 953aac4d7777.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:15 +0000
Received: from DU2PR04CA0214.eurprd04.prod.outlook.com (2603:10a6:10:2b1::9)
 by VE1PR08MB4655.eurprd08.prod.outlook.com (2603:10a6:802:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:26:11 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::c8) by DU2PR04CA0214.outlook.office365.com
 (2603:10a6:10:2b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:26:11 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:26:10 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:26:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:07 +0000
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
X-Inumbo-ID: 9914a608-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC7LKln6ahLVf1ZtsKqkIlBSpfKHZSkuLzsKHx1whuA=;
 b=Uc2JWPzPk4RaPqmlEr/GhDjg2cAz3GGRbv+hvnvaG8jKLqrXJ6GNcynv78wy0/G/kiVN5bQKnFP0a02ewo5q4IZR43fSJnLw4tzN0tR7p9HQJZ0DBsXNYHo55k2KJZgHkSNHNm2xIlDpqgA3rnYH/5b1M7yH7ZpGb3qMYdVfwiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bfa62c877f4a58c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdeJ5BlmKjY522cuSEd9qU8CbBDNWUW3iyu9lpoLvLMmRX2XdEDaRJjSQOhXhH2RX8mcM9bqYdl0D/6h4F9WnNs50HMpBx5aYL32For8CW4YYmPhPYjgnVjoyeX/25W+s5OoAtOvTrSObHSzh8uSjzb3q7l120eNKxQ8PnJiGSInx5Ss85cbce9Oiuo7w8fcNRnsedrL2rAm5GJ+sHwpy8dJIwU6d73WLelnti70XQbyI7vz7UteuObHYtSIIA/o0PQv0OooOlASVLK6rUzlVs7LO2FrBgMGWTTp1Q1/pkGsS2ItmiwWSAhyS7ugJokOPrZYAGL/RAojKC/gv8x8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC7LKln6ahLVf1ZtsKqkIlBSpfKHZSkuLzsKHx1whuA=;
 b=ofkOqKaPfY9ht1fZqEGgvNpFknD2uBrC5Nvs718ZXufR40CP0fjI2BEAPtEkR2NX20Tt1qysnekyOyq/KmL5c/q9hPwfYi5yguZjcRdxAp9kPpbMybtqIAYVJqxCloBrG7xvzxOdGyx/qpMjyg7dHCNCW/dOWZExmZfe9TBvPF9c6W0EYd60bsMTIN0NzLED4+ti7lpNO9lp5lp4KNDnYxqbsDvBdXNEVm6Ijaf9A7qck4DRHwE/vht0X4VJBVD4jps5EyyqRVbmVaYqYcOXveWsasaEEfiIp+svHjji3T+OKkOF5oE5moc4HIP5McMeOuF/EQwa8tui7a9O7e8HXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC7LKln6ahLVf1ZtsKqkIlBSpfKHZSkuLzsKHx1whuA=;
 b=Uc2JWPzPk4RaPqmlEr/GhDjg2cAz3GGRbv+hvnvaG8jKLqrXJ6GNcynv78wy0/G/kiVN5bQKnFP0a02ewo5q4IZR43fSJnLw4tzN0tR7p9HQJZ0DBsXNYHo55k2KJZgHkSNHNm2xIlDpqgA3rnYH/5b1M7yH7ZpGb3qMYdVfwiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 40/40] xen/x86: move dump_numa info hotkey to common
Date: Wed, 11 Aug 2021 18:24:23 +0800
Message-ID: <20210811102423.28908-41-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d24e0e-22c8-4345-5baa-08d95cb27737
X-MS-TrafficTypeDiagnostic: VE1PR08MB4655:|AM6PR08MB4230:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4230C34DAD1B32C5485FBFBF9EF89@AM6PR08MB4230.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:229;OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fFX9f+oxeHoOwV2hfG37Kz7uwFVyY9bLz/MhWCcCkRGrsxLSNVYijVsO1aerGdoIe+o+rd847lXAlXkWg1KWymJoE0TXN+8PBDYAUdfny/drOe0KoGC18LLhSuCW1Wf94D3cgniV23ORrmzZOFVInZWvUmlQDujHgWiZakTxQae+GNdvQqMV/8Yd2/ejsShTjCity6QDbc/CRscZxI371f0W3NhHr5zG7VoHndOBSxuyCd8jhOzU7EZoW50v8wP8Uu/a867tCIi7jMJT678giJxskun9MJ0coCSPIqXpzYZIZ0YSdZCIS7QbzmZuUZVORZwWoXmkJIaiFVGsBZ01hlgYg/DckKT1LsoaDFk6UR9WycE1LKJ4cgrzzHQ4kRY5cldwZdZQ+Oqcv/kDGbWB/we0NN+7nPxaohwB7BZiB7frdjzxAMKPyac28sZ2i3V1CtaIPzI4hUTUZ5oVjPP3XaMC4vFKzVqGMNtzs4V2rBqLa9mKekUJpUksygECdau9XJJFw9Ugn6MpluwgC04P4+GhRce+nEiwjaY9W2cuLGv3rlTUm/+FRirl6FGAv+OjVB2RnK1CconQTMAqMjfZKMxzH46CniVLaeX5V6aoUSGwhWqwIHkBKPLqbiRcXpX1QO54s/3QYrQVkpoVQk0895HJl5lW+u9iFPvVKurxWC1klV8QwMATJfRDzv/65icvQWaRVP9xDGZ9URUP4EO/XFBB48XWa+stEvnao83o5M0rl72QouvxvXwG5PBG3IrHY3y33CR993KKSui5Or0URTR7AKPYmB5TA06KskqPVpM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(8936002)(8676002)(86362001)(2616005)(6666004)(36756003)(5660300002)(70586007)(82740400003)(44832011)(426003)(81166007)(70206006)(356005)(2906002)(186003)(83380400001)(82310400003)(34070700002)(110136005)(4326008)(478600001)(36860700001)(26005)(336012)(316002)(47076005)(1076003)(7696005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4655
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b9f83ae-760f-429f-031c-08d95cb270d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5DU+2zZSNl1eyuz7qzDXYiED0DI6w7LuuRK1fxt0BQXdqjE4yTFhXwpzZVLUSHR2qTvF0STRV6fR4MhHtZtKoI7cN+PpQBsObeexMOIBPkTuU+ZVBOVXmMVcDF6VJ5mbKYWWrE5++7HcaJ4j5PnHp8a85F2lGPzanVoYVfc+UlCG5MgOaHThchQMkq+UPXraJQGk1J7+R7VO+Mvyiy71bInaEbs8YNHfXDyyHdMXUlh8+vkbITQdH8YDVLL9sflSB/HwLt8xmgZmzCK8k2zGfRr5R+mqcmO1UeL35FvjfYKwD/xKa3nb4nr11+sPemHwEbkiXCazOtLwOcvPUFBNAzXdlqvS8ri86D21UDGWnbLOb+HBTW4hDiN0ueiuNL8l73LUENGNwwfABQON5tO4PY6UYx2dodmCUQkFpxEcjtJ8cYDqFNlOuGjRKXEl/bOrxmB2cVSo7zD3pYpMFkVWgL1TEJmVhsRcFgbkQzU/VX7jccJv7cGplX65pi+rRZs8TDf363Zk2kGY9C1SpqF5UtfXM+DXs3gqx7gIkF3s7gkA/xMcf7Fjl1oeBakMkgQ/EJrCShMJtXIPWsMxWxCuSTOC8ivgl5RynemeeU5AmOyM3ob+uwl1rEC57OTFNVOSCXFmv9F4yT6j4Hkx4DgvDqC8EgN29HX2HdknHJsvSwTTsSPK4Y2NHuQoCJJ4dSMmIGscpCqIhNt8WLPTGvk03ygpq8WB1li1MI6jiXmJhC8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(336012)(1076003)(186003)(44832011)(36860700001)(82310400003)(8936002)(81166007)(36756003)(7696005)(5660300002)(86362001)(70206006)(316002)(26005)(2616005)(70586007)(426003)(47076005)(110136005)(6666004)(83380400001)(508600001)(2906002)(8676002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:22.2986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d24e0e-22c8-4345-5baa-08d95cb27737
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4230

As device tree based NUMA has been enabled for Arm, so not
only x86 needs to dump numa info through hotkey, but also
Arm can use this hotkey to dump numa info.

In this patch, we move this hotkey to common. Arm can use it
to dump its numa information:

(XEN)  key 'u' (ascii '75') => dump NUMA info
(XEN) 'u' pressed -> dumping numa info (now = 8805901249990)
(XEN) NODE0 start->524288 size->520192 free->257673
(XEN) NODE1 start->8912896 size->524288 free->499676
(XEN) CPU0...1 -> NODE0
(XEN) CPU2...3 -> NODE1
(XEN) Memory location of each domain:
(XEN) Domain 0 (total: 262144):
(XEN)     Node 0: 262144
(XEN)     Node 1: 0

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c | 142 -------------------------------------------
 xen/common/numa.c   | 144 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 142 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 380d8ed6fd..322801cb17 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -112,145 +112,3 @@ int __init arch_meminfo_get_ram_bank_range(int bank,
 
 	return 0;
 }
-
-static void dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static __init int register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
diff --git a/xen/common/numa.c b/xen/common/numa.c
index c98eb8d571..eb1950c51a 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -14,7 +14,9 @@
 #include <xen/smp.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
+#include <xen/keyhandler.h>
 #include <xen/param.h>
+#include <xen/softirq.h>
 #include <asm/acpi.h>
 
 static int numa_setup(const char *s);
@@ -442,3 +444,145 @@ static __init int numa_setup(const char *opt)
 
     return 0;
 }
+
+static void dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+    struct page_info *page;
+    unsigned int page_num_node[MAX_NUMNODES];
+    const struct vnuma_info *vnuma;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        for_each_online_node ( i )
+            page_num_node[i] = 0;
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each(page, &d->page_list)
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%d", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%d ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%d", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static __init int register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
-- 
2.25.1


