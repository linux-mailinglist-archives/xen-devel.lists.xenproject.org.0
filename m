Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0D3E8EC0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165808.303049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWg-0005ao-Cw; Wed, 11 Aug 2021 10:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165808.303049; Wed, 11 Aug 2021 10:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWf-0005Ma-T8; Wed, 11 Aug 2021 10:31:57 +0000
Received: by outflank-mailman (input) for mailman id 165808;
 Wed, 11 Aug 2021 10:31:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQi-0000BQ-DC
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee7cf173-2a8d-4b89-a047-364952b5b166;
 Wed, 11 Aug 2021 10:25:23 +0000 (UTC)
Received: from AM5PR0602CA0008.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::18) by HE1PR0802MB2186.eurprd08.prod.outlook.com
 (2603:10a6:3:c2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:20 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::c5) by AM5PR0602CA0008.outlook.office365.com
 (2603:10a6:203:a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:20 +0000
Received: ("Tessian outbound 8529ae990a93:v101");
 Wed, 11 Aug 2021 10:25:20 +0000
Received: from 3358db577759.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A4C8296-03E9-4151-BF62-673E17BFBE0D.1; 
 Wed, 11 Aug 2021 10:25:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3358db577759.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:14 +0000
Received: from DB6P18901CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::21)
 by AM0PR08MB4402.eurprd08.prod.outlook.com (2603:10a6:208:147::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:13 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::1f) by DB6P18901CA0011.outlook.office365.com
 (2603:10a6:4:16::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:13 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:53 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:51 +0000
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
X-Inumbo-ID: ee7cf173-2a8d-4b89-a047-364952b5b166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmnzUhju9srN188tSaExwiieGSbzaEkgNMCpBSvyPLA=;
 b=Ipy4ShwT/1eiEWDVn5MMEvFRuYed8PJZC4QFJ1cNf5KlU0snfZG4Fnuiee1X+Jfcw+p7Y2QHXyuN72MMv6vUUz4byKAs0F7WwEpDj907Bwow+cISSWand9c0KRqlbU4m/+64qXLQVGl4REgFjjja6gQ4tY3INA8vHGr9NKGLeJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fab414aca7c3e418
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLMu0kFdbJv6AV1F86TAiPhZQjiKAPY8d9PpnRq94AHALBqy2g+6CFZN+d+40ICLTVk8bkz2kJPzbs07/j0IX0+czFqmShK4KbNad7hWIzY2orUV3DJGgPYrbJ1PNm5Px1RZ7NK7PdvTDR1o/JxXHAo17eUJ+d0Ygn/i/1wSXVsFBLP8c+gHFmMuv4bdqL15Bkr2Yt61tW16arFT1zT1NHIO5wOZqh2ev1TxrQLc2G4P24APWEt9ivFrjHab1L0d+pdrc11iJb03dxeNO1Wr8cnjJS7l7UWc/+uLDTNgN3WwQuOzkNquyt/iWDsiJOOxaIkghLQKar37Dzw33hyoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmnzUhju9srN188tSaExwiieGSbzaEkgNMCpBSvyPLA=;
 b=fsaNLtGBM66gxt1G+aQqANQOp/e+5dS4QZEA2NgvtQrqWvi5nJxQ/vv96M2l52YdFIM9nLsbmYLvO1Ix2PGAMJKy1ns+cuJw94pKtAJnS2L1GeP3R2QKya5eRGMc2t/uYozxaAZ1zyJMMb0fo9RPf/eW2X3RgFpVxCX5kxMPNsCJtsw/dy9S2mRDT2NGZ9gzx6HeiPuamx2gGQqG23hTPQty0kbtwUggxfaJDmoHlV0RPvRDk4PDCGrBu0WRIN4UqZoFQq0eZXodayua1q85HAyA6maPMPxUSU58eAM66eiIT6JcKQ+jf8/HS+J3hI+xOUwJCtTgBEeBypHWmgoUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmnzUhju9srN188tSaExwiieGSbzaEkgNMCpBSvyPLA=;
 b=Ipy4ShwT/1eiEWDVn5MMEvFRuYed8PJZC4QFJ1cNf5KlU0snfZG4Fnuiee1X+Jfcw+p7Y2QHXyuN72MMv6vUUz4byKAs0F7WwEpDj907Bwow+cISSWand9c0KRqlbU4m/+64qXLQVGl4REgFjjja6gQ4tY3INA8vHGr9NKGLeJo=
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
Subject: [XEN RFC PATCH 09/40] xen/x86: Move numa_add_cpu_node to common
Date: Wed, 11 Aug 2021 18:23:52 +0800
Message-ID: <20210811102423.28908-10-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9c0dbb9-090e-4792-2728-08d95cb2527e
X-MS-TrafficTypeDiagnostic: AM0PR08MB4402:|HE1PR0802MB2186:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2186285B235F810D3E9015FE9EF89@HE1PR0802MB2186.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XWBzrLD3+PECD9WHYpVOtLbtv6qSWXpBjNPRLH5D1vf9pJ1v5G9PlNwEVt3lctpGMzXXPNagv8HxbXmvXBjnvR9ijMsYFOVOJO1HA3gYrFQvSejAPbDJdiBPcBJNOW+rw88umFQAA3JCPHWaG4kdHdboRWdZNLrQ6kVVffaFWVSMDaREMdN0h3tVevMP/bS0GGEiG9ZCziR9nq6Jm0yHxxe0jsaonPbPRh9zYdKeRj0/+qiM4Lu0PF7H1eM1vnuc31EAEjQgWTQ1eWppbgd8rj+gIXT06+LiHQLzEva4jnFM1G9Nj0YF5YCiAVxZBtnIR+T4e2ETLiBGog9pCsjInexmCYpTnS0JUTIilA0bWtwdMYZPtRl8f/ayIrMb6HUVXn5G7MUVxGSfqgxIF5H4uIGDMIzIbWoqTKQu1MPgXtCX7vRrIrEKoxXunwjuqp+nyg1DEtt9tqk3m4pdniJa7KfGygW48fnuGzN158GnJhAN43DmocLEnvrBcgrajAsETzVdHhiFj2Rve48hhawgemB+Ii2y0QgUw4jxI5yiW8JfFgZJhquDOpKx6f0pZRD0x94+GnXmNOnl1muKoTcC0wOPNcpWew2Al7fcxelS0en4b7REIJI97sRA59JEMUPky3f90O67ZwWO+E9F59/TJMPwMck8K1pm4VyKVpXHMTpAAu0Mqoue8/Wbn1PhNxb43kBoFLpvUr018iZPLq/5gIHewa0UAlWMf7lmqYC94XAnsiRM12jiMnXrSJuHZVxwXXCdBS712uwbQv2PvE6V0SdeMDZ5d6TzeisZPYLxjhQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(46966006)(36840700001)(8676002)(316002)(356005)(44832011)(36860700001)(110136005)(5660300002)(82310400003)(8936002)(47076005)(36756003)(426003)(2616005)(7696005)(34070700002)(336012)(2906002)(186003)(26005)(70206006)(81166007)(83380400001)(1076003)(82740400003)(70586007)(478600001)(4326008)(86362001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4402
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	555b3839-2917-4d27-9769-08d95cb24e02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZqLoNq7nbiZkyWxq3DqfCZWdzhz6rDdEZvBHOIlVjUAeKMS2jSZYuhvoMxFViGlrBOgFqAWwHp/H1HvniV3EUqSOpWEh6Ol6gtJsjoAut53qTJO7NELLoRIXvBLiRj1t4uqa0FAvayXkx7a/OUIdJaOc6um6aHpvHPMQ7VXIz7hpT03JnLuIHh7CZiuNkb02yFiIfW7VSLnn+QxamVGQsA7Q1Cc22BATwP6GIrexiZ5oaoZhCtAUGBrsILLFMnsJu2iw1BoV/j7u4jl4SYBUTB7gFi8+J07Qs7FEkFgwcZ/uVe85NVMo6wt6iS2RN6TSBVbczDLal0yt3ZWT2C+w7KwE6UPMWbo6419hbCNGMarRjMwxdIDQViq9mlAknmIlJMiGT2cUtn05q2o6ETRYpCY4jPWUCSSzCBE9dPBwvXOV76In0FaHaOQB9GaIC9xghvW53J16axpLiFqDujNY+WZ+xJhOC2JXIzoqKI2RhWL5yCgyFUVmGcsOZGqOUO6k+ovJ9FIkSmqDK5cjXJGi/cYpmmDzw4G2JBKTJjSOmclbtcEwOuTvER5P4WB1ZV6Lh5tvKn5dxNZ4UvaWYk0AH8V+uIojTGdNkaRHVbwsPgih62S4G04SuMmIyj3JYvwmRfCUKxuUpwFy4x76d9fYO15OL7jmK3KfH5O6kiYmMaAzRINCStn/4bd18+Pt0VuvZ78E6A8VpF9du3w9e9Xgwvu4umP4txcDG2SRKhUWy7U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(36840700001)(46966006)(83380400001)(426003)(2616005)(7696005)(44832011)(8936002)(2906002)(70206006)(47076005)(478600001)(8676002)(316002)(1076003)(186003)(82740400003)(36756003)(4326008)(81166007)(110136005)(26005)(82310400003)(336012)(86362001)(36860700001)(5660300002)(70586007)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:20.6409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c0dbb9-090e-4792-2728-08d95cb2527e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2186

This function will be reused by Arm later, so we move it
from arch/x86 to common. But we keep cpu_to_node and
node_to_cpumask to x86 header file. Because cpu_to_node and
node_to_cpumask have different implementation for x86 and Arm.
We will move them to common header file when we change the Arm
implementation in later patches.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        |  9 ---------
 xen/common/numa.c          | 11 +++++++++++
 xen/include/asm-x86/numa.h |  1 -
 xen/include/xen/numa.h     |  2 ++
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index a6211be121..f2626b3968 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -29,16 +29,12 @@ custom_param("numa", numa_setup);
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
@@ -167,11 +163,6 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
                     (u64)end_pfn << PAGE_SHIFT);
 }
 
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
 void numa_set_node(int cpu, nodeid_t node)
 {
     cpu_to_node[cpu] = node;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index e65b6a6676..9b6f23dfc1 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -23,6 +23,12 @@ typeof(*memnodemap) _memnodemap[64];
 unsigned long memnodemapsize;
 u8 *memnodemap;
 
+nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
@@ -129,3 +135,8 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
 
     return shift;
 }
+
+void numa_add_cpu(int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index abe5617d01..07ff78ea1b 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -27,7 +27,6 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
-extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
 extern bool numa_off;
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 39e8a4e00a..f9769cba4b 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -51,6 +51,8 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
 
+extern void numa_add_cpu(int cpu);
+
 #endif /* CONFIG_NUMA */
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


