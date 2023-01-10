Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D4663BEA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474446.735688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOt-0000dD-EL; Tue, 10 Jan 2023 08:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474446.735688; Tue, 10 Jan 2023 08:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOt-0000b3-9d; Tue, 10 Jan 2023 08:54:31 +0000
Received: by outflank-mailman (input) for mailman id 474446;
 Tue, 10 Jan 2023 08:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOr-0005s6-Jv
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a65bd2-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:26 +0100 (CET)
Received: from DB8PR06CA0045.eurprd06.prod.outlook.com (2603:10a6:10:120::19)
 by DBAPR08MB5861.eurprd08.prod.outlook.com (2603:10a6:10:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:23 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::32) by DB8PR06CA0045.outlook.office365.com
 (2603:10a6:10:120::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:23 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 10 Jan 2023 08:54:23 +0000
Received: from f4bffd900317.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AA26FAB-2024-4733-AA56-034F6642273B.1; 
 Tue, 10 Jan 2023 08:54:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4bffd900317.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:16 +0000
Received: from AM6PR0502CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::36) by AS2PR08MB8973.eurprd08.prod.outlook.com
 (2603:10a6:20b:5f9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:13 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::93) by AM6PR0502CA0059.outlook.office365.com
 (2603:10a6:20b:56::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:13 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:12 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:12 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:09 +0000
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
X-Inumbo-ID: 62a65bd2-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRix1bFfBrxEVUq1lAzsdtefn4r0M5T6xXFzQdn7bOs=;
 b=TByQ2A56Oj+s/Q6qPo4M1+1wWWTRJP8X2fVKh+IQHP3B/WKRsvf9jZ0VlDv6ES1VuxwSYkTmrlYSM2rmhGWmyKcpf599z/IdUUejg4sHtk0DXfXcQPbq4bJGpYibW9qv9153PefoZpFiCU6SaXKczprLOBeENXiyJcyospIs78s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85e75a5faba983db
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQbR3ZzRCvzDAoHp4L9ive+hsvhmUcqg97wd8xHLFRBHE3Jn3bTCmj7Za8dhzUoKW88Qi2CWZKqrsILSci+3yjTPhGpVmEFXMMtQprrYJ+M0ZTvu5GiPg3VUzSqXPEUsXvtxumzkJ6TMppWGroCmPI0xEYlIh7WfD6JcN7u84KTPaL32/dLOPPp9JgurcUwXFYuTV5BuShvQJvJ+K/rlnSl8hVrMoswB4ZIrELS5JoNY1uJJhaC3Px7VeceMkdh3w5slb35hMzFHB52ARVo3vrMvwi8RFtE3Bdf8F+KRpVpQFuX3FVjCAWNuOOO1bJ3j5MdXk8NoJriGVlySeufdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRix1bFfBrxEVUq1lAzsdtefn4r0M5T6xXFzQdn7bOs=;
 b=GYLnOcdNRdhrW+SrPEnQPEETok8PHeTjMS+JWMVVMnv362bV++O/JD2R1SgpR9sJcnEjHA2X/k//u0XOFohBE+9woEiaYne/3gDmOlOLdlLhQ7K6cy9t0darbqAfdaogW3/9x1lh3BgqMn+Y9G2BPuTSwpcDkDIR2cqZ9kvfDFEIuXUAi4wcmFwH9hbZoOzYgqvvpUgqau4PHj63pk7gS00J71Gkzdm4XT7dZUNUOmST/E302/2eZJ0eyXioCFDsVS76zdYtXRbyK+FaZIbnzrwWLHCEMAqour7rQcRBBJn5aTJ7zICVU/Y2RQ2kYVlbYf/wWFxv1xY61j0KFtRzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRix1bFfBrxEVUq1lAzsdtefn4r0M5T6xXFzQdn7bOs=;
 b=TByQ2A56Oj+s/Q6qPo4M1+1wWWTRJP8X2fVKh+IQHP3B/WKRsvf9jZ0VlDv6ES1VuxwSYkTmrlYSM2rmhGWmyKcpf599z/IdUUejg4sHtk0DXfXcQPbq4bJGpYibW9qv9153PefoZpFiCU6SaXKczprLOBeENXiyJcyospIs78s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 10/17] xen/arm: unified entry to parse all NUMA data from device tree
Date: Tue, 10 Jan 2023 16:49:23 +0800
Message-ID: <20230110084930.1095203-11-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT064:EE_|AS2PR08MB8973:EE_|DBAEUR03FT011:EE_|DBAPR08MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d5f511-aa9a-4fd2-2bbe-08daf2e84513
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eDEPRIrXslnvkQzfPCa7Vo7kc3fEslyGVOTpJ8Nu4WNjk9ENPS73j6L7txDMvh7u821zMtsxApJG9MCb5dblNLZLoTAgF5G2NM39iAhYUA7/JcPFMc7fCVzosCky4iqIR3OGSQ7IzScGPMFKYSVQ3D7gfo6Lc22Izc7GJVUJa3uM+1K+avAFhcKpHNWUbXWUd9sLCOrPnA3geNPbJznX/ahBG27r/ebviWuXneoJxJv/tTAowbPUaF0ybLyutx2WtiD55kPaRJkQjcfMGGJtoH43286ppH+D8gEI/7PgfTrGExzuLGKr/xq559QvzMnAdA9hK3o49gyD3ATEu+zr35+GRlU3StarhgiMKDubpES0ku7/4SrzI6YRMukxd3fyNz5+VJWnDfFrWH1Pcj54X2JhpdWs1KvEq2nqwqC3F/XGDHekgNoJUrVAfjeDu+rvtoPydCA2I/z/jt18rN5eYpuWEXI3Y/prPboUmlXFm1Z9rge6tm2bBI4KRHzc+ykw7LOZtauYcV7oJf+H5TnpEUwCDHMNgq0nxBCuQKnz7EGduf7bbQ1C836zIVGlR6nl/GiJGLMYWOq1XB8p039G2PjUbufRJ0RYL3WdYWPh+jy2bXgCfYE+xX887MD+F6uPDwdPA95kFVcZ/LthRgijhR/FXmdIWvFZq+tcUhQGT+jviu3PILC+KBQ/cMQKxjqmSY69T4MbGZY69osAfC20Pw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(82310400005)(36860700001)(478600001)(83380400001)(5660300002)(36756003)(54906003)(44832011)(2906002)(86362001)(82740400003)(8676002)(4326008)(6916009)(426003)(41300700001)(2616005)(1076003)(6666004)(40480700001)(186003)(26005)(336012)(70206006)(316002)(356005)(70586007)(47076005)(7696005)(8936002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8973
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fb67014-4de0-43c8-fbb0-08daf2e83f34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cMzoiPRsPavEwZ/zgF2cTpX8F7zk8zzKFzSN7Db5mKz2Wn4wLhak1nod52Oqz86buv1TNLZq9L7rc6+soQoYnV694g/lrhmDy5hYiOPdSur3GZXp4PRhtA++LN5lHmKGDPt+L/qcSCsJvZUUcaH1abkF3mN8USAI+fj7HjisGPty55nMx/wzjWtq9C8mBo45hNz9HxJ45fxSDuOOAUQZArsGr5BKkPsb+eCxfz/itAaQFnvTQzrZg6+oeeG0Lj6pCSOazIrAwDe1z4QE2Aix+A06XM3i1I2TbkjGmIIi5utxqwVcblAP5bVla+ySyM8dmvRRCNonwv+HlONUL2mVaY08K0mnioNvCZwPdqWeCTQ5de/XgrZsdfHf0d4FhIWxQmhagn14l0SFoldmWOfWgHhkLfL8Bj0JWPptGoMdc5L3gHXqVmR7OpHEUpCsMOY+GQZFJ2hf/S+xSChODfIN3SOZei4iO0HlnAm8dc5iae1GVqDinvEnclE3rIGJhtHMprAYnsMQ7Pr+07UiCabvJWIhBjwN5ZXYBNiQyEWCRtxnwEYMsbP2ClORnUTz7STxy2r06VYj7zDn65kOr8ocqmcTq3bWu98ElD95U4SWtmIejoN/xYJ33XpqVynS4XjO017D14X9ZJLvFbnDaQDngqGvr4G5ebXB3lC6UUw4O1W74SHQfKzKa6z2BKnvAJUjCLbTr6/MEdrPnBoDvJI+nQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(70586007)(70206006)(83380400001)(8676002)(4326008)(5660300002)(7696005)(36756003)(8936002)(41300700001)(186003)(40480700001)(81166007)(26005)(6666004)(54906003)(6916009)(82740400003)(107886003)(426003)(82310400005)(47076005)(316002)(86362001)(40460700003)(1076003)(478600001)(2616005)(336012)(44832011)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:23.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d5f511-aa9a-4fd2-2bbe-08daf2e84513
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5861

In this function, we scan the whole device tree to parse CPU node id,
memory node id and distance-map. Though early_scan_node will invoke
a handler to process memory nodes. If we want to parse memory node id
in that handler, we have to embed NUMA parse code in that handler.
But we still need to scan whole device tree to find CPU NUMA id and
distance-map. In this case, we include memory NUMA id parse in this
function too. Another benefit is that we have a unique entry for device
tree NUMA data parse.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1->v2:
1. Fix typos in commit message.
2. Fix code style and align parameters.
3. Use strncmp to replace memcmp.
---
 xen/arch/arm/include/asm/numa.h |  1 +
 xen/arch/arm/numa_device_tree.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 923ffbfd42..1213d30ce0 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -44,6 +44,7 @@ extern enum dt_numa_status device_tree_numa;
 extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
 extern void numa_detect_cpu_node(unsigned int cpu);
+extern int numa_device_tree_init(const void *fdt);
 
 #else
 
diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 88056e7ef8..4009b9b6de 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -258,3 +258,33 @@ invalid_data:
     numa_fw_bad();
     return -EINVAL;
 }
+
+static int __init fdt_scan_numa_nodes(const void *fdt, int node,
+                                      const char *uname, int depth,
+                                      unsigned int address_cells,
+                                      unsigned int size_cells, void *data)
+{
+    int len, ret = 0;
+    const void *prop;
+
+    prop = fdt_getprop(fdt, node, "device_type", &len);
+    if ( prop )
+    {
+        if ( strncmp(prop, "cpu", len) == 0 )
+            ret = fdt_parse_numa_cpu_node(fdt, node);
+        else if ( strncmp(prop, "memory", len) == 0 )
+            ret = fdt_parse_numa_memory_node(fdt, node, uname,
+                                address_cells, size_cells);
+    }
+    else if ( fdt_node_check_compatible(fdt, node,
+                                        "numa-distance-map-v1") == 0 )
+        ret = fdt_parse_numa_distance_map_v1(fdt, node);
+
+    return ret;
+}
+
+/* Initialize NUMA from device tree */
+int __init numa_device_tree_init(const void *fdt)
+{
+    return device_tree_for_each_node(fdt, 0, fdt_scan_numa_nodes, NULL);
+}
-- 
2.25.1


