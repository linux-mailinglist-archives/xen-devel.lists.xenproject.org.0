Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5C3E8EBC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165772.303000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWT-0002b2-Uc; Wed, 11 Aug 2021 10:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165772.303000; Wed, 11 Aug 2021 10:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWS-00029H-RP; Wed, 11 Aug 2021 10:31:44 +0000
Received: by outflank-mailman (input) for mailman id 165772;
 Wed, 11 Aug 2021 10:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRg-0000BQ-Eg
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca0173c4-c714-4ae9-8de7-ede4a1f1d539;
 Wed, 11 Aug 2021 10:25:42 +0000 (UTC)
Received: from DBBPR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:d4::19)
 by VI1PR08MB4541.eurprd08.prod.outlook.com (2603:10a6:803:f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:39 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::61) by DBBPR09CA0031.outlook.office365.com
 (2603:10a6:10:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:39 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Wed, 11 Aug 2021 10:25:39 +0000
Received: from 6e46e89ab710.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 646000BB-06E3-49E7-BA0F-AA52E0AA75C3.1; 
 Wed, 11 Aug 2021 10:25:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6e46e89ab710.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:32 +0000
Received: from DU2PR04CA0230.eurprd04.prod.outlook.com (2603:10a6:10:2b1::25)
 by AM7PR08MB5415.eurprd08.prod.outlook.com (2603:10a6:20b:10d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:31 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::d6) by DU2PR04CA0230.outlook.office365.com
 (2603:10a6:10:2b1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:31 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:25 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:26 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:23 +0000
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
X-Inumbo-ID: ca0173c4-c714-4ae9-8de7-ede4a1f1d539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJdqw/WESrBdaASbDcLiFFaHTeYsE5uHyM9TMKEbuAg=;
 b=xM06aacso6FJmHHGd+8YXh50A9tLYqAAT5U3JzJFQfr8vLzNuxT/fVLpWwDe1fCaLZK2Bje54b50RwM7WhsdKJoOfdWZL7yY0Ce03g1rnR5p4E2bfSBCshF0lSF26bE5SHqVdsf5T2KIPkbt69XJTzILcYMVtdxEe+kqCDi05EE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e180c4a8c8508b1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuefLb6Wknlk6Zb1WxqaNj/Oww2DOpwbfPl7I//aK9nSaT93xH2XhTpzOp8CcZq5/UnubsTyq3f1/Q7E5gtBUL7tI5kg/iFTqc7fC6CGBp0MpOWuN2/d0MUwj92jx8vN4v7JUwGxO9tnKtQHEsv1Tw8NBupGZ6VGBterW/nBAOnIrK5/9U10gEtuPMXoVM1AFptIn0IwmRKnEqEkilObUt7yuzf0QSEYZmb/4dJ6I8y6lWZuNcCpDefgr9lQ75IbMJyr/tk4+vQ06voFZehyc2eTUn4RQAwEXHZoHxp4fUSEN5RyKmoUn0jrs6YpE97hYo19A3NgjuItOiS+GlmbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJdqw/WESrBdaASbDcLiFFaHTeYsE5uHyM9TMKEbuAg=;
 b=bgOs3lYnePVKnu4FtcWUB60z70oFi1CBDTMqXitHMmcrSjrxCvUg1bxlTBTv/20D1jhtEGJ4jzwz/GfeJO7NCuLvyfMyJEcWwAVJYaMJriY2b3sCTnvwqReGHyf/LASzY1y85PQ2DFGZvhqfFLdLk9xP5ub/dak0tbBnlKh7M8qwasFNet275VokjVassZ5JG6emhU3Ezu5aFFA7JIxS9s/ohx+ZXymRC72YaBWaaLKcKPow4pZelGSM7UL25+NDLa+NrjkYfxloTaVfKXhOQJdxj+tWutzdORYDb8AkBVv7FxjKPTNtjKAmWF+GjBsQ3lCrHQ2zD7Fc5j16MzCcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJdqw/WESrBdaASbDcLiFFaHTeYsE5uHyM9TMKEbuAg=;
 b=xM06aacso6FJmHHGd+8YXh50A9tLYqAAT5U3JzJFQfr8vLzNuxT/fVLpWwDe1fCaLZK2Bje54b50RwM7WhsdKJoOfdWZL7yY0Ce03g1rnR5p4E2bfSBCshF0lSF26bE5SHqVdsf5T2KIPkbt69XJTzILcYMVtdxEe+kqCDi05EE=
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
Subject: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device tree processor node
Date: Wed, 11 Aug 2021 18:24:05 +0800
Message-ID: <20210811102423.28908-23-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4962245-712c-433c-6ed8-08d95cb25da9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5415:|VI1PR08MB4541:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4541F25B7C7A8FBD25D456BD9EF89@VI1PR08MB4541.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7ZJeEoHDM/jCTyjusdBToazj8npPidTTW9b50HnBa0x2GaPHZlGe+Yes09GOIKq3rDkTegC7GT+7iy32PJIdjdfzpL9O2nN5zgSnJtcVBFwhQ0tcgoSc+52Sm+LDLhGpqR3NkXxVPFaJSdfICQu1zZzKoajw8hUGcf2+fKoqCvI7vJoEY+TBBSrLLg5R0srXysrKuylilE93AGUC4AzGl0nSN39TRiw5+T2iCLd/iTbQS9gKCEpDrcjyFnqOgkAyEOHAelvfDeWDrAxxmtZ/Vb8vdeESKgwFOoxqGJgbQuaZTnA2x9VFMKjI+IGwLLjaM5S0zjtWp3oXD/sKGcLTxqQOzUl4RjEYE1gxeMf7EStgyuZwbr6kpfAbEK1Er095UnfyjaA2fNO5JittXBFw2GoH9WKWo7caVjueQHpTF6wNSa1fwkaEiQUWhg7idkOA2e4doTcywb6vmEwE8Y+g7TuStK6f35zp1sMYeDP9+o9FyBczMn5amYcIrlTjiCTWyqBTAE/ofwmm8BFvC0bHaHFqR20RqZBroBQUM6An3jUkGr5rVGukxhDN+VmMuxHzIlrAoccVFp53Nkq6NV9qcsjmIjPoNFBgIZel4gzbaDKntZ/Xd8UMsHc2wxlBGyhKkAVjpwBSaDUZ9xXRONThcdhmo/vp8h7IHAbL+M/KFBs7LPkgK73cRwihNpWhQMOL51BfWelRIc0NY9tcirYULn8C3rvgQmVVrUemHzCYt4pRs1RM8IcP950Q2zQ3hecfogQcZhO1pb0DtnyGO/beA+n60xRNtNhpdPTDDLL6Bng=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(46966006)(36840700001)(316002)(110136005)(356005)(4326008)(2616005)(478600001)(44832011)(47076005)(81166007)(36860700001)(70586007)(86362001)(82740400003)(336012)(426003)(7696005)(70206006)(82310400003)(8936002)(2906002)(8676002)(1076003)(26005)(36756003)(6666004)(34070700002)(5660300002)(83380400001)(186003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5415
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67fd6f5b-cb5b-48b3-e9dd-08d95cb258ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bqkz9zJytwuUtozJWDbiVnWJ0Ej4CzGzQ1swrAq5LU/g9RNrMZ9PNGg0fJ1xhBd94g623AaYSI2EVXa07Ne1qPkmmpWV9mKEAbVLBfR9abM4LNfdtCIdV2l6o8bzANaWhNIq67YfS5Nr1s+ECJ2LQPuGonw7Pkb8ZZt73yQrjnIBhK41S+l9xfvOoTMt9HFZbDkxvllxzk7xQ8x/f6DPnQ+DGsE03QcUXyzVMKGQVaztJG1O4M+pXTYTSwS8j2uHgE941vWQNcg5LAxRRZN0cJ433eNLdtlNA6Ovw59kMbNNYbydlPqIsmElDAfY7yw7ig2pGvlBIZJC++pgimdFrSinw8lWb/c1W/Iv3youfbWMc2SwGeCAd4+tOT4RwWWqi5vvRyqI7KulcPDJ63brxAtyFoudIp/Y2PIwe2+IkxEYB6r0Opmhy5igOkLZZvKIwN3SL99OkPN7zh+HMSwkashrb0WYaYGohdtiME/3OrZ6Mhc5iZqltaFqPjSxGh2Ephit/Z0SuaTmu5Rk+VztkmJ7s9WtjWLxyYLDbijKbJrIHnZJc7OWLV5rUCPn1mihayAoxMm9IL0IOsPfvghyaQWMFdl+puBteO+9kjmm8POwO1j29oZrXOeI39cmuv0r4hrTb9LlbDchOv9HNIjBie+LYATwxCwCbO5xmK/BKnJj5rm6Cp6Jw/ami5l4NUlFObqCGSky1TkWL8LAZBWF0xpjBWn7ZRdAf2xTvg87cuU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(36860700001)(26005)(70586007)(2616005)(86362001)(6666004)(2906002)(186003)(70206006)(44832011)(82310400003)(426003)(478600001)(110136005)(316002)(8936002)(7696005)(4326008)(82740400003)(1076003)(36756003)(8676002)(5660300002)(81166007)(83380400001)(47076005)(336012)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:39.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4962245-712c-433c-6ed8-08d95cb25da9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4541

Processor NUMA ID information is stored in device tree's processor
node as "numa-node-id". We need a new helper to parse this ID from
processor node. If we get this ID from processor node, this ID's
validity still need to be checked. Once we got a invalid NUMA ID
from any processor node, the device tree will be marked as NUMA
information invalid.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 41 +++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 1c74ad135d..37cc56acf3 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -20,16 +20,53 @@
 #include <xen/init.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/device_tree.h>
+#include <asm/setup.h>
 
 s8 device_tree_numa = 0;
+static nodemask_t processor_nodes_parsed __initdata;
 
-int srat_disabled(void)
+static int srat_disabled(void)
 {
     return numa_off || device_tree_numa < 0;
 }
 
-void __init bad_srat(void)
+static __init void bad_srat(void)
 {
     printk(KERN_ERR "DT: NUMA information is not used.\n");
     device_tree_numa = -1;
 }
+
+/* Callback for device tree processor affinity */
+static int __init dtb_numa_processor_affinity_init(nodeid_t node)
+{
+    if ( srat_disabled() )
+        return -EINVAL;
+    else if ( node == NUMA_NO_NODE || node >= MAX_NUMNODES ) {
+		bad_srat();
+		return -EINVAL;
+	}
+
+    node_set(node, processor_nodes_parsed);
+
+    device_tree_numa = 1;
+    printk(KERN_INFO "DT: NUMA node %u processor parsed\n", node);
+
+    return 0;
+}
+
+/* Parse CPU NUMA node info */
+int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
+{
+    uint32_t nid;
+
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
+    printk(XENLOG_WARNING "CPU on NUMA node:%u\n", nid);
+    if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
+        return -EINVAL;
+    }
+
+    return dtb_numa_processor_affinity_init(nid);
+}
-- 
2.25.1


