Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD34415DE1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193849.345413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVP-0005Kb-SU; Thu, 23 Sep 2021 12:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193849.345413; Thu, 23 Sep 2021 12:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVP-0005HV-PF; Thu, 23 Sep 2021 12:07:11 +0000
Received: by outflank-mailman (input) for mailman id 193849;
 Thu, 23 Sep 2021 12:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSv-0005KP-0E
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:37 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38991186-efbb-4ccb-9f64-24a4c1aa4c7b;
 Thu, 23 Sep 2021 12:03:54 +0000 (UTC)
Received: from AM6PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:f0::21)
 by VI1PR0801MB1727.eurprd08.prod.outlook.com (2603:10a6:800:5a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:51 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::9c) by AM6PR04CA0044.outlook.office365.com
 (2603:10a6:20b:f0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:51 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:51 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 23 Sep 2021 12:03:49 +0000
Received: from 9cf742a5989a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8CAD156-9C5C-46D6-864B-12E3A182BFB0.1; 
 Thu, 23 Sep 2021 12:03:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cf742a5989a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:35 +0000
Received: from AM5PR0602CA0024.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::34) by DBBPR08MB6251.eurprd08.prod.outlook.com
 (2603:10a6:10:208::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:32 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::72) by AM5PR0602CA0024.outlook.office365.com
 (2603:10a6:203:a3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:32 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:26 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:24 +0000
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
X-Inumbo-ID: 38991186-efbb-4ccb-9f64-24a4c1aa4c7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq6wTyOtVX+3FOXJpOSjlfoDJNYhe/IRFtzFw5fVKj4=;
 b=IPXnMSf4VYMZpzXVA9fCiTHr2TseQttPgKx36J3MFvKVJgRl8XhW6BQ7fCI4Jx1uozmN8DRFhGErfTZrp1xd08AZX6+HkUNnMlucr959QsJIIIItcShfpqFZQnjnvLmm3sUBkXyuJxIPcXidS5Votg/FO3xlBA3c08I2HQJwOtA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 075236bcbe98196f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIo3EqQhsCeV/fCeHZB6X314PnTI8tW7HR+6YpKLwuZGwSrFxWj1bjfJvdo98x05icNgXHF4WUW+heqCMTxpOZEwxSN9WCdIbEg/G5raUMp292pHZbAbuiA+hHQr8syAARNYJzALEesc2xkQIxtxeXihVw791GeLZGx5TTbU5J5Elu3SQoUThIVCW7FZLrzZn1/4DJ8vWbIgPqJQ9hV31HCz2g7hmoyS9Ws3wrSCagPry7/p5xRh13xgWsg/BDm0AyrwP6dbGQdPb3x2azqMuhPbOmWY/OizICFXPIvRygaXslqi53eUzTSZi6AV7StOpyAyz3G8ckJ9Ui4aDJJ6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Qq6wTyOtVX+3FOXJpOSjlfoDJNYhe/IRFtzFw5fVKj4=;
 b=OK0lF41h6aqkbdbqVCbk7GySxh5KaybLYwM7qpM6r9Vzo+mUQEw2/lO23UhR7YOavfAl2DFA8GSl71v5OL/y8qSDnbmvA2M1x++f6XnF0xy/J/cZyDyR3kiGibQz4yv6vIRoCPWWGCMORndSJw8P8qPJeH7DGcVb7en1oKF+zTJ9dr4Lv+XAOIeXeNJbK+VdDQz0uk/h79voyF4W5aOKQ49QQNkkLup9P+1lANHWkzP9fkirnjEgPFlR0JdsqpyYOR7atpSCnnq5GUl7QBfRo2yIDfZuJ++BshFQs9b18eAcO8/V6E+MfXzXKjvrnFvdflG8TJ0SepVHXFVo7xuZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq6wTyOtVX+3FOXJpOSjlfoDJNYhe/IRFtzFw5fVKj4=;
 b=IPXnMSf4VYMZpzXVA9fCiTHr2TseQttPgKx36J3MFvKVJgRl8XhW6BQ7fCI4Jx1uozmN8DRFhGErfTZrp1xd08AZX6+HkUNnMlucr959QsJIIIItcShfpqFZQnjnvLmm3sUBkXyuJxIPcXidS5Votg/FO3xlBA3c08I2HQJwOtA=
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
Subject: [PATCH 08/37] xen/x86: add detection of discontinous node memory range
Date: Thu, 23 Sep 2021 20:02:07 +0800
Message-ID: <20210923120236.3692135-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31a1b0e-3918-4675-0fd5-08d97e8a3521
X-MS-TrafficTypeDiagnostic: DBBPR08MB6251:|VI1PR0801MB1727:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB172740517A9ADADE655951F99EA39@VI1PR0801MB1727.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uy7r7emIWxUurtOpRer+cKjJzZDL7auIjL+c2A4QEVJS6VpcoLTrqdDyNVc8LHZwnP0Oi8X7fXg0dano/SodwiZMRJeXjPha0aM+9lzyxK9tAPpTEHdKZ9SdjEA29fPYkzYrolmQ8+AyslPF9aQa2T2NYw00hLnD6GzjW9KpFYuG6dPW0aWieMZgBrteWAEanZQsiqUgWIsn53Ddvn/4jEZIeXlvze4Wga8nDaUYrxyw7cHBIGP/ajdVKl1tn2QeCASd+wbTAJTi90WyzT2YtXKr8KbV6UO69YIJxkZ+MG5IiGaeYeKMG+90iBUf/PJnZ/nqr/OpImOX8aHFcqTm/68K4F0WkLhbNkQryynr0aTwcA0UNrAWf48gWHyixG6+y3weD/yB4Wr1RCNcINkZlMzQKEgQ4qyArj0SAYF3L2vTWxOAwcf8XuBniDULFmZjLiZENeMiVKF3owQSU8ZR4WfoJgkQNN0ClHWGI9+/4PQ6Bo7wW3N7CGJKoeGtqWGIawQO6LcA43opLNl6V5YJgRzBpnohgqiHtV10kO/6fxaXuOtTRUpYT+AA4J8IBmh/tBV9wn2/WrWZgejlcJBCZpodiVAZDxvh65J35dFZ62fzwKnn8TE1IXOImrDXtbaWIeDk4BcSqzdaRz0XrJ19jFIpJNTXJwqH0EatTWEJxHuMmWLFdIxs84yxCNWZgjf7+uLeSbnd1LE1HEv/GcZ2EDgGSO4EvQQx31ZAwj9G4/Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(36860700001)(356005)(8676002)(47076005)(316002)(5660300002)(8936002)(44832011)(86362001)(110136005)(6666004)(2616005)(4326008)(70206006)(336012)(426003)(82310400003)(1076003)(83380400001)(2906002)(186003)(70586007)(26005)(36756003)(7696005)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6251
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5d596cd-dc95-4c7b-ab3e-08d97e8a29fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9UMxvly7c9LfuHITUmQhy3K2KZ1efgz8BFrzECO+BYdSUItM6dNRhG8qnNu/pPfzT33ecGHokezDjFKx6kOhb+aSaO5b4EvIXoJ+iUFH8PXBk7t4zEBcQ0x3B7yBJCMRnIlJApjyN6Q2lRhUoe+jVwXesR14SNnifVeOt7wpTEEpw9UfpNMOfq+ALU/SPKkiT8t50eRIH1sgIFYDN/D5WIDNcRgNPQGAXGKRVRpqZz3tfrHuftiQGWgXAndAXi12d29ULJt7GMSxUeW8ZVjlkYi2jTJ8fPXAfw+sbEoz4QgsRTLw7PnXqzP1hSMrFaGBS7txeSPFnZTStY5etnjhwzBtcuGAAmLtId918cfsOWlqi5Vm562X3xunqPNXl6XUHWupVIX8fTU+NrSEN091Tm/fS4qt9qPl8EqcW38gbtIHQtagprPN1OkuIltr98CELnCStcfZDZ5J9UM4DWZTqaMt0cudTOxGofnY/qiAopZZ6FTUY+VIlhwiteB6bTT3fkWffSBkH2jYJA5qaf/3NvTeNBlbe3eaFc4QrCgxOjTqo5ek324JDnbe8FiS/Py5kVIhJvmXkhSTPeA2gDzWx3IrADI7mJ/+D9zpJxGhzY3u1UNrAM5Ef3Lna5lD0MV5OzGLqFa6w/L3dEse6iBRh8MHvrJ/XisHdrrBmAarwXk/8KgtOKdzlcsHUJsx0zHGpVrN+vC1SdUyFr1gIKYqwA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(186003)(86362001)(4326008)(508600001)(83380400001)(70586007)(426003)(82310400003)(2906002)(26005)(81166007)(7696005)(70206006)(47076005)(6666004)(44832011)(36756003)(36860700001)(316002)(1076003)(2616005)(8676002)(5660300002)(336012)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:51.0522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b31a1b0e-3918-4675-0fd5-08d97e8a3521
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1727

One NUMA node may contain several memory blocks. In current Xen
code, Xen will maintain a node memory range for each node to cover
all its memory blocks. But here comes the problem, in the gap of
one node's two memory blocks, if there are some memory blocks don't
belong to this node (remote memory blocks). This node's memory range
will be expanded to cover these remote memory blocks.

One node's memory range contains othe nodes' memory, this is obviously
not very reasonable. This means current NUMA code only can support
node has continous memory blocks. However, on a physical machine, the
addresses of multiple nodes can be interleaved.

So in this patch, we add code to detect discontinous memory blocks
for one node. NUMA initializtion will be failed and error messages
will be printed when Xen detect such hardware configuration.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 7d20d7f222..2f08fa4660 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -271,6 +271,36 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 		       pxm, pa->apic_id, node);
 }
 
+/*
+ * Check to see if there are other nodes within this node's range.
+ * We just need to check full contains situation. Because overlaps
+ * have been checked before by conflicting_memblks.
+ */
+static bool __init is_node_memory_continuous(nodeid_t nid,
+    paddr_t start, paddr_t end)
+{
+	nodeid_t i;
+
+	struct node *nd = &nodes[nid];
+	for_each_node_mask(i, memory_nodes_parsed)
+	{
+		/* Skip itself */
+		if (i == nid)
+			continue;
+
+		nd = &nodes[i];
+		if (start < nd->start && nd->end < end)
+		{
+			printk(KERN_ERR
+			       "NODE %u: (%"PRIpaddr"-%"PRIpaddr") intertwine with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
+			       nid, start, end, i, nd->start, nd->end);
+			return false;
+		}
+	}
+
+	return true;
+}
+
 /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
@@ -344,6 +374,12 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->start = start;
 			if (nd->end < end)
 				nd->end = end;
+
+			/* Check whether this range contains memory for other nodes */
+			if (!is_node_memory_continuous(node, nd->start, nd->end)) {
+				bad_srat();
+				return;
+			}
 		}
 	}
 	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
-- 
2.25.1


