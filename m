Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C73E8EA7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165698.302814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVq-0002Uc-Ob; Wed, 11 Aug 2021 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165698.302814; Wed, 11 Aug 2021 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVq-0002Jy-EZ; Wed, 11 Aug 2021 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 165698;
 Wed, 11 Aug 2021 10:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRM-0000BQ-EM
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:28 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3146180f-42be-47ce-92a2-96b78428a5a2;
 Wed, 11 Aug 2021 10:25:36 +0000 (UTC)
Received: from DU2PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:10:234::20)
 by PAXPR08MB7188.eurprd08.prod.outlook.com (2603:10a6:102:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:25:34 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::b5) by DU2PR04CA0045.outlook.office365.com
 (2603:10a6:10:234::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:34 +0000
Received: ("Tessian outbound 312d863716bf:v101");
 Wed, 11 Aug 2021 10:25:34 +0000
Received: from 6ed41c1450f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C0FF7C0-2993-441C-83FA-181B6A9C0AC6.1; 
 Wed, 11 Aug 2021 10:25:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ed41c1450f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:28 +0000
Received: from DB7PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:52::22)
 by AM8PR08MB6371.eurprd08.prod.outlook.com (2603:10a6:20b:363::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:27 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::4d) by DB7PR02CA0009.outlook.office365.com
 (2603:10a6:10:52::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:27 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:20 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:18 +0000
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
X-Inumbo-ID: 3146180f-42be-47ce-92a2-96b78428a5a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNLCmK6o/BFFBB7IYOhSAdZku5C++eyuzlH2uW7CLH0=;
 b=aeCJXtoif4BhD+J4YNFBM/IUmssP/oAVlVwTxKjVuzApBrF/KZHt+SesE7jv/XNnIbml+2Z1GrdqTJv39zW5yJHw4gF5lgG+RoP8Nxr0OQiCfagg1/TU26wJaCwsuoK5KwwSk0YdPUlQVOI/dZ0dy3hJ3Zco+2xmc8lmu8Xp8hY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe3c316242becbc4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3RYLdBH2XihTuLxNA/1NhEFa6pWijjibavw4gXxUozq4Gf9ejzy96yiVLV051y/Z5M56bWDq/Z3ksQFGOhe5jQMSnk3049mlZTEvsoZ78ssT0L9LlXUxWZKB1eGO4AP8CSTNkfcdm+YXWY1/6A5Kb9w+Kc8XAR2HCv13VGxZLsCmTiW7mWQwmknTLa+b8GoqEdEMd9Evjy6O+puU45L5X6Wm9CRAn4Eyv4ITQVidRDuldGQTPkyIoxF86j2k3zBEVustot+mbJPkPbKBrvKkKCVsH+Fcu88X/gSw6CWawYwgb0in4mv1839qypvmOBktP6EOuBPrA+GBuqE1JccSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNLCmK6o/BFFBB7IYOhSAdZku5C++eyuzlH2uW7CLH0=;
 b=nYedcGbvefpwtmW3iafVXHd9qREg97v+SKJDDnyWIEupjPRRsEa8I1aZFa6eZ8l3ST6ZGy3lgHfj/KaIBdIs3q7kc0A3Nwq8OBZyCN/GHoNMLctw6ijPGib/RMtJqR8FQ+RbZzI02C3BBPaLkas6UMyvTn68z8cuy75NfTO1VUTenFVMuAediAm7m/P36B2FF0sjJKzSoYxJDWDgjJxg97qKIKEofGaj3O/oqKKXaIlywXbE735Nwbbi9TeGGVSU13hU0gV/uBfdSjEdiRXLEVLqkRxwgspyVDh7Kk6xlTxjr8kPA52alpv5IBoAveQ1YpQZAlXdEvv7U5Rxq9oUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNLCmK6o/BFFBB7IYOhSAdZku5C++eyuzlH2uW7CLH0=;
 b=aeCJXtoif4BhD+J4YNFBM/IUmssP/oAVlVwTxKjVuzApBrF/KZHt+SesE7jv/XNnIbml+2Z1GrdqTJv39zW5yJHw4gF5lgG+RoP8Nxr0OQiCfagg1/TU26wJaCwsuoK5KwwSk0YdPUlQVOI/dZ0dy3hJ3Zco+2xmc8lmu8Xp8hY=
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
Subject: [XEN RFC PATCH 20/40] xen/arm: implement node distance helpers for Arm64
Date: Wed, 11 Aug 2021 18:24:03 +0800
Message-ID: <20210811102423.28908-21-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9173b6a8-9437-4cb3-4920-08d95cb25ad3
X-MS-TrafficTypeDiagnostic: AM8PR08MB6371:|PAXPR08MB7188:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB71887ECB8A74E3E5222892239EF89@PAXPR08MB7188.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CNVNHijh+W6JKMq1eh1rG5Ca9MlwhxDgONSTYQ5v8WFdu2iiC1HCT9auBVf4YAok5U57NfbMR2NOewtLRM7NY/ubtMOCH2IMkCiGE/8TlPU6ePshjf4mGCzFn8ELAB/X6tjNtjWSUtXayxtHCRF7jr4dXlyglO8BJRMiI45NxxugvlmTa5m1c5ICW1kAJ5EMaqfHT7wOCrcPM4PFMvBp4eK7/yjojFxZ2uatECSTRGIS2E91o5eD/yBbrzgp8dYVHkHjSH3V9zzTPk1Lls5Jn+LqmBI3ulmLznkorudZj6DTu1miObucHi+z7eozO9fq5ITTNNRHva1Gtw+cCyXfJ2ekmje3nTDgahP69oQzT1/gOwlfnhfyjWpoUFApIf2KLpsHOjC3Z27MhEJPowmVPW3JNJArNglYoVBYaqrM4invtiuIH+/eP9hSD1R2hq5IplsV5JV0LmWrjysN3AU/fz04IO3EgINeC4U0JZuFwJv4dBZkUghnewmZH89UMxQ3zfktjOgTL+dNA0USEDTdFDBxPEmK0yh1bcQpsupbcUH+Wr426Xg3sMBSwcSVUbo706UVDBMO/IAIf9oZYtpV0SMARoipITU4CYJGEE94DeM+kwCgMIuLz+S3JgxNQM3TM3J1DdN5vrmgAxXsxU1N+R+LZYTYecCJfpG9DC2qB/vY5ibKS8bWXsScsLqhjr9tWdvPVZ/ZT2/Ouho8DDoN4RaTc5hLK6s4T/dm1YPFrSgUCaXwg3ZFdRSl5WTsYUVUKTkY/i6e4+eZz+9n4JJ+kQcThyvRxWZy8pTDh3ZzC3k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(186003)(2616005)(336012)(356005)(44832011)(81166007)(2906002)(83380400001)(426003)(82740400003)(8676002)(1076003)(86362001)(8936002)(47076005)(36860700001)(5660300002)(82310400003)(36756003)(34070700002)(478600001)(6666004)(70586007)(70206006)(4326008)(7696005)(316002)(110136005)(26005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6371
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	646cedfa-6495-4223-9542-08d95cb25672
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DsZmDzEGkesL6DQNt6wmLe9ROt5I/Fdaz5LaUAvEKdku/3XJcFoC12mHvEZBH83+R3rQ+wTPl/P+rMiIy9QmBPuHAB6QL+Qq8amgds7nJxctCijy/LrkasZdKv1H8EaBSkzb0zCq2KakxlQTR9fC6L31nSlHFwHGwt0ngfgZAHvbsUXxVQlweXTGmMtQHb+Ia32lYe9S/RW1IV1yRBbzpcfmBuMAWs7MPj9uKMw4DobJ11vYGH1DFW1nXDetMwHKaxfwkbx/5SjSWFzJlju5tTiwcoWZulXgaVi44j1+9kyp4oEiK5X1XviHI1P8jX1kbfDTxXnCeMLqg2C263uqHrbukTVLCSp+3GTuUxt/uW0me7ry7WdJc031zxMHHv65S3i9i0MhRVQpVViZJnNfbdTCuEbc+LdH3kOecH7Xt0jgbyDMSLtmR3n9dzEOAilRNTQGjZp1Hf2rmjoQuBMGaJre6vwgq+35Uk+5Wg9SJ9Aj41btPGbFw8NPEFMU+qtiLN6RwGs+Lhc9ntb3xYS/UY+LgjfT+GCaofiS86umPfFliwddULR7E3GjSO9a1GVqjy6N6LSfVb1F5qk1BTIaGfRYCkFLAR8wII8efLdDmgpR7mZ6iNZPUgJGq/aBG3E/cwKs3aVCunGAoxArPenleHkV3ZaYucD5PiPvAMul/5vdHCA1DmAp750hYuPuM9NWsAU/an4H+KyXinLyKhYOP2ZLfWhfX9l26m78B1g1AjM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(36840700001)(8676002)(7696005)(82740400003)(83380400001)(6666004)(70586007)(316002)(70206006)(110136005)(26005)(5660300002)(186003)(4326008)(8936002)(47076005)(82310400003)(1076003)(478600001)(86362001)(336012)(36756003)(81166007)(44832011)(2616005)(2906002)(426003)(36860700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:34.7286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9173b6a8-9437-4cb3-4920-08d95cb25ad3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7188

In current Xen code, __node_distance is a fake API, it always
returns NUMA_REMOTE_DISTANCE(20). Now we use a matrix to record
the distance between any two nodes. Accordingly, we provide a
set_node_distance API to set the distance for any two nodes in
this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c        | 44 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/numa.h | 12 ++++++++++-
 xen/include/asm-x86/numa.h |  1 -
 xen/include/xen/numa.h     |  2 +-
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 566ad1e52b..f61a8df645 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -23,6 +23,11 @@
 #include <xen/pfn.h>
 #include <asm/setup.h>
 
+static uint8_t __read_mostly
+node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
+    { NUMA_REMOTE_DISTANCE }
+};
+
 void numa_set_node(int cpu, nodeid_t nid)
 {
     if ( nid >= MAX_NUMNODES ||
@@ -32,6 +37,45 @@ void numa_set_node(int cpu, nodeid_t nid)
     cpu_to_node[cpu] = nid;
 }
 
+void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance)
+{
+    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+    {
+        printk(KERN_WARNING
+            "NUMA nodes are out of matrix, from=%u to=%u distance=%u\n",
+            from, to, distance);
+        return;
+    }
+
+    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
+    if ( distance >= NUMA_NO_DISTANCE ||
+        (distance >= NUMA_DISTANCE_UDF_MIN &&
+         distance <= NUMA_DISTANCE_UDF_MAX) ||
+        (from == to && distance != NUMA_LOCAL_DISTANCE) )
+    {
+        printk(KERN_WARNING
+            "Invalid NUMA node distance, from:%d to:%d distance=%d\n",
+            from, to, distance);
+        return;
+    }
+
+    node_distance_map[from][to] = distance;
+}
+
+uint8_t __node_distance(nodeid_t from, nodeid_t to)
+{
+    /*
+     * Check whether the nodes are in the matrix range.
+     * When any node is out of range, except from and to nodes are the
+     * same, we treat them as unreachable (return 0xFF)
+     */
+    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
+
+    return node_distance_map[from][to];
+}
+EXPORT_SYMBOL(__node_distance);
+
 void __init numa_init(bool acpi_off)
 {
     uint32_t idx;
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index bb495a24e1..559b028a01 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -12,8 +12,19 @@ typedef u8 nodeid_t;
  * set the number of NUMA memory block number to 128.
  */
 #define NODES_SHIFT      6
+/*
+ * In ACPI spec, 0-9 are the reserved values for node distance,
+ * 10 indicates local node distance, 20 indicates remote node
+ * distance. Set node distance map in device tree will follow
+ * the ACPI's definition.
+ */
+#define NUMA_DISTANCE_UDF_MIN   0
+#define NUMA_DISTANCE_UDF_MAX   9
+#define NUMA_LOCAL_DISTANCE     10
+#define NUMA_REMOTE_DISTANCE    20
 
 extern void numa_init(bool acpi_off);
+extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
 
 /*
  * Temporary for fake NUMA node, when CPU, memory and distance
@@ -21,7 +32,6 @@ extern void numa_init(bool acpi_off);
  * symbols will be removed.
  */
 extern mfn_t first_valid_mfn;
-#define __node_distance(a, b) (20)
 
 #else
 
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 5a57a51e26..e0253c20b7 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -21,7 +21,6 @@ extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
 void srat_parse_regions(u64 addr);
-extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
 #endif
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index cb08d2eca9..0475823b13 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -58,7 +58,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
-
+extern u8 __node_distance(nodeid_t a, nodeid_t b);
 extern void numa_add_cpu(int cpu);
 
 struct node {
-- 
2.25.1


