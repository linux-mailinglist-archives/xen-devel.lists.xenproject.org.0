Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ACE415E17
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193928.345534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNev-0005Ao-S1; Thu, 23 Sep 2021 12:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193928.345534; Thu, 23 Sep 2021 12:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNev-00058c-Ng; Thu, 23 Sep 2021 12:17:01 +0000
Received: by outflank-mailman (input) for mailman id 193928;
 Thu, 23 Sep 2021 12:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNWi-0005KP-7n
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::61a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cb65bf7-a450-400a-91b1-1323ad587036;
 Thu, 23 Sep 2021 12:04:53 +0000 (UTC)
Received: from DU2PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:10:2b0::17)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:49 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::9c) by DU2PR04CA0162.outlook.office365.com
 (2603:10a6:10:2b0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:49 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:49 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Thu, 23 Sep 2021 12:04:49 +0000
Received: from 3548f08ec3d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68D427ED-28CA-4AFD-BC4E-C23B61B42A9C.1; 
 Thu, 23 Sep 2021 12:04:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3548f08ec3d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:35 +0000
Received: from AS9PR06CA0096.eurprd06.prod.outlook.com (2603:10a6:20b:465::25)
 by AM0PR08MB5363.eurprd08.prod.outlook.com (2603:10a6:208:188::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:04:33 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::4f) by AS9PR06CA0096.outlook.office365.com
 (2603:10a6:20b:465::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:08 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:06 +0000
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
X-Inumbo-ID: 1cb65bf7-a450-400a-91b1-1323ad587036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQXv12XCrC0ornD3XLR6+SrgHIB9Pxv0AYpsZjKo72M=;
 b=a6cHRChBhtKx/YM2LKALl/qBfS6yG+vAqwnM6DuAj/5Qzf2tCpp/paD0XXktUEWO9ZnaJ7np4A5ZB5O3G28xm6Xr8lSCklBTE3l7a03hYA1jdp0koxEQ78g46IwwjvXo3MNoDJzy5GBzFbTIAUr8MA0DTBfmx7sqJIqD9TI1QIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6b074adeafe187f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxmubAxpGvAIsBj3jW5/TAqbSDAoE+BYSSbXcCaiJpCNqRp+GIHVmSm6mzd58y0ktGYzOiDeREQrvfyaHQEA/RM4qXhARyqSYcSGJv61VsfvD/Req4Tx5sr66iqNO3z/zR8xoFc0+mEobvHRyv9T7zDKZ/ev59kZFH3NU0ss5JrBSgiPzmAYWJY9OYYoqZUn5Qt/FBKPH17rd7mm1EzADuz/8BApzQP2Pg3BF2y6LzI8ylVeiQ8y2rTRMa8JwP1tDTZKdJYzak5g4o85EFNMkK82U+cSUTwKT442lsQbhT02vUeztHVHSEhCATbUSHpFjfE7ldJBOqR38CZPeWe4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cQXv12XCrC0ornD3XLR6+SrgHIB9Pxv0AYpsZjKo72M=;
 b=Gks5zDlFNm1dO2scoCgfCfycFecaKUXENm4ME4iqs552H6lu8DGD7TQTT8Q/5bPVn9CTXjxeH+RwHGdp3qdOHDz0gjZHBOq9a0Q7GqlIQaAV3bQOFuDF/C3/VEUbf1iLEO9HLzfkwEa72ePbFr3vs16k8oZk3XGlizZLhcE5Yd2nltnzE0auUVtUWdzSNkyKR7pqur2/fmWuSWNGs5Z1W+bcJh+ni+suMP77i0RBkDinsChGdtztBTmmPelWPuxmxFKdqU4xUvLV/Ot6NUubWl8mkUQCxOgkX8dxKfI0l4B3u0E/Q1qgmrnMFHpjQ7lMNV2WA0vx5ZgGX2cH5NqSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQXv12XCrC0ornD3XLR6+SrgHIB9Pxv0AYpsZjKo72M=;
 b=a6cHRChBhtKx/YM2LKALl/qBfS6yG+vAqwnM6DuAj/5Qzf2tCpp/paD0XXktUEWO9ZnaJ7np4A5ZB5O3G28xm6Xr8lSCklBTE3l7a03hYA1jdp0koxEQ78g46IwwjvXo3MNoDJzy5GBzFbTIAUr8MA0DTBfmx7sqJIqD9TI1QIM=
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
Subject: [PATCH 27/37] xen/arm: Add boot and secondary CPU to NUMA system
Date: Thu, 23 Sep 2021 20:02:26 +0800
Message-ID: <20210923120236.3692135-28-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29c3aa62-b93a-4e6c-587f-08d97e8a57ec
X-MS-TrafficTypeDiagnostic: AM0PR08MB5363:|VI1PR08MB4447:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB44475541191CBD530E1340FE9EA39@VI1PR08MB4447.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9OXy2VLFXhEAEPzN/ck0kCHr3GGPjpx0WKFBXgmMQzRC4uakapqD5/ls5Mx2EXNZwiDRLSHHqYArcNi6SOCdp0V3A0VK8fwtnAqzzf10QxS4mrl9rPV+0T++29aj7N2dg7Q36Km8IMYko/HaUWVBZ6zBiqdikgJoTjyaD6GSTleyyOFsCzoYXrVkIPY6xhAvSstMX2lQqmFBR5bHcBe0pReaVL/Xk1kKsxxH9pQxlQ4UiBAkgywx/k0MBfTv1M8ywPIhEybHuf/PpiA0EkiV9sveXIlYYm+R7rqgzPQPSqSIyrYLCe/T9Ht6Cz3wI45uCA9t/KaZJ3EMUNWxs/UAdmLHwYmIvU35viPyB0ydKdNiZ6af1DC8vyk91vt+/8uh+8bb/YdUwrGDTlGYwC7MKtiP0x+cHxYFcjgvj1wrvqb5a3cFeaNKZYyEH8IcLU5zd3ry5oqV0wafQWxyVxYSnq8U02jU2/HQh5O3IMwZlE7t51VMYTSoNwdo8YNENyARu6RdxbYK2zvpik7zU63kIx5r5vIQAyyZ5cXrxGXtftD++5+u6T8phwPEo95JNfKWbnzOxmo7iMGaJe4az7JYx3O2HJBuSSSbJuIssdaxlK9Edx/7uctbVYQxZc7x7rIcapSaCQCIcShUOyUoFlf19BwK33+/WtG2IKPGymnVciTVway4AT2hCE3l7MYGi62OqyxNTl6/fw+Pz5RukwTFCtBG83FihZQzTsnOqZ+wLDc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(316002)(1076003)(5660300002)(83380400001)(8936002)(36756003)(82310400003)(110136005)(36860700001)(2616005)(2906002)(86362001)(70206006)(4326008)(508600001)(426003)(8676002)(7696005)(70586007)(6666004)(47076005)(81166007)(336012)(44832011)(186003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5363
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d9a9377-4a40-4df4-517d-08d97e8a4e85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8TFpdkcx4EqOQng0e8tm1dUSqyWPpyQlk+ZJw+f9ZSqD2Qa5Tk3vxYHqT5uUuRjMjwmk1yuYzNomvcJGOMQ6CbIvpCAr2SKIRte2FHrCfm1ztkkjY6ZmhpNjfZdL4OzgsbSn+55GxQhILzYtjbnZ6H3Oyg8x1Ztn8RnNOz83GYjuSUvy/if+DUB1JJuU5Qbu/N6AF4Eo+sKxj7P/SY2glEuZCwPdHY7p8OKbaHFzqIuSjGpcQh1ukWBMs9NzrKpwhDcN2jBWgxyZC7dPxQoqItdjxBbzXta8dBLjPps5ncPYTfkZNiJ6hY+YzESMMbzUNpdCXtmzUFCEh9NnGITYEoLteaxpQjAy48JE8yw85UifJ/XnSlSCtt5SYmzTzNewXKaTp47oWHZmGTh1Q5tCCUKl1UM9p2lus3Z+FbQBFW+CsQ1t1dWg3SoE+5JaR0MRRI/XgxNSL2oXiLIlnTKJt2vEyiOQh43eogQEgrJb475qIsUqYLGE42zokZ49WARpF4Eyawk+n1X502RVvRVkgKOyzHUL+RJVhP6aDfxxNa7cjVwhGjrGvO2ee3EHFN/X66hSeWTa5GNATfuV3hRZXv7Dq36iG6QoFcfO1jO2vREm0wv0SdalI50x2m42zvHX53fpW8ALUOGY1JXxuUnnAdDz3RZS1uHS4U3pSO2cOF2vlFkQAviXFXEWepyzjDc48+6/rKWLsT2m0pJpfst0FA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(336012)(2616005)(316002)(5660300002)(86362001)(110136005)(426003)(4326008)(36756003)(47076005)(186003)(81166007)(2906002)(44832011)(26005)(8676002)(83380400001)(8936002)(1076003)(82310400003)(36860700001)(7696005)(70586007)(70206006)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:49.5269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c3aa62-b93a-4e6c-587f-08d97e8a57ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447

In this patch, we make NUMA node online and add cpu to
its NUMA node. This will make NUMA-aware components
have NUMA affinity data to support their work.

To keep the mostly the same behavior of x86, we still use
srat_detect_node to online node. The difference is that,
we have prepared cpu_to_node in dt_smp_init_cpus, so we
don't need to setup cpu_to_node in srat_detect_node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c        | 10 ++++++++++
 xen/arch/arm/setup.c       |  5 +++++
 xen/include/asm-arm/numa.h | 10 ++++++++++
 3 files changed, 25 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 5209d3de4d..7f05299b76 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -32,6 +32,16 @@ __init void bad_srat(void)
     fw_numa = -1;
 }
 
+void srat_detect_node(int cpu)
+{
+    nodeid_t node = cpu_to_node[cpu];
+
+    if ( node == NUMA_NO_NODE )
+        node = 0;
+
+    node_set_online(node);
+}
+
 void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance)
 {
     if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 49dc90d198..1f0fbc95b5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -988,6 +988,11 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     for_each_present_cpu ( i )
     {
+        /* Detect and online node based on cpu_to_node[] */
+        srat_detect_node(i);
+        /* Set up node_to_cpumask based on cpu_to_node[]. */
+        numa_add_cpu(i);
+
         if ( (num_online_cpus() < cpus) && !cpu_online(i) )
         {
             int ret = cpu_up(i);
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 8a4ad379e0..7675012cb7 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -46,11 +46,21 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+static inline void numa_add_cpu(int cpu)
+{
+
+}
+
 static inline void numa_set_node(int cpu, nodeid_t node)
 {
 
 }
 
+static inline void srat_detect_node(int cpu)
+{
+
+}
+
 #endif
 
 static inline unsigned int arch_have_default_dmazone(void)
-- 
2.25.1


