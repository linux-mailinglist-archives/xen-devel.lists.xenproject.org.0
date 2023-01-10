Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E931A663BF2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474490.735771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPm-0004o6-Qa; Tue, 10 Jan 2023 08:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474490.735771; Tue, 10 Jan 2023 08:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPm-0004jr-JH; Tue, 10 Jan 2023 08:55:26 +0000
Received: by outflank-mailman (input) for mailman id 474490;
 Tue, 10 Jan 2023 08:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOt-0005oC-Vo
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:32 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060.outbound.protection.outlook.com [40.107.241.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64252c3d-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:29 +0100 (CET)
Received: from DB3PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:8::36) by
 AS8PR08MB8014.eurprd08.prod.outlook.com (2603:10a6:20b:573::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Tue, 10 Jan 2023 08:54:23 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::7f) by DB3PR08CA0023.outlook.office365.com
 (2603:10a6:8::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:23 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Tue, 10 Jan 2023 08:54:23 +0000
Received: from 2c054ce7be9b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 905571E1-3E67-479C-9FC7-959B1C3C0CE3.1; 
 Tue, 10 Jan 2023 08:54:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c054ce7be9b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:16 +0000
Received: from FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::6) by
 AM8PR08MB5570.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Tue, 10 Jan 2023 08:54:14 +0000
Received: from VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::9) by FR3P281CA0152.outlook.office365.com
 (2603:10a6:d10:a2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT055.mail.protection.outlook.com (100.127.144.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:14 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:03 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:01 +0000
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
X-Inumbo-ID: 64252c3d-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0LsJ5CSUqhuJ+jKKH9S6bS+xUQ/jDtaI6zjdX/HcC4=;
 b=WgH4ZFzxCtwfDNF2TYm+Q3vSBwWD9rEQb4TbvG0TOlzyuovBK158ivFlfQksCTuKqgZatB1Cz8A+f8Nn1k0lhiJm52dmcxykXXCdncAAz86PloSxBXTHHgv/9kiQifdq13ZBwyaeOKUJo8sfZksjaRJqCjlzvRGgjxX9NYVqzF0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d9229752571d865
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6jgDNrWZ3RsmHR7P4XYzN/NdlYbwODLleULfn9UNAYMir2VIF7zBlO7Ls27pwSvg5oIx/q7PCuQ5edJrwtAdwT46/QZLpb76MPqSVkitkvSFGOi5dH/qOtHb2jCJ9MFsvb6ObRYcQsrat8y8nVVPr4T9e0zHRAQZIXyu2z175WSSE240ZAeQWwh9Rt7GylPisUm6DxHRNA8UU0nOrLOyyszn323yM2xJ4M7zyoLvVqRkUdYPfNk7niwTR+f48MWsqnFLG/1lzgAfgWsEUK5roCx1xP9ZeHfWHsRuuxRWB4VXDMwUW0iQzBxRfHUrvuLlotJ/pLY+CjViN2X05XjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0LsJ5CSUqhuJ+jKKH9S6bS+xUQ/jDtaI6zjdX/HcC4=;
 b=UTf5mljz33ND6pukkxyxuZg5BTqGNlTcWhypwwBfqzDDXsDjDZpHn06FfjKnZZY86SOdGH2j6B7UDOIjlwSEbdT8JmHRd12NkYiMaWWfLbK2nwzQc4Qqm3aZ5vEDtpBvaLbADi3NwDn0EsHHvQCFiO5ZNnC85vutBlzp0iLltQT28FZ+Lgq98EfjjtKFKyve5sPE5a4LJEcP8g0zRIPp7y/FuwHvMEr8tpqx7rwDyWHTTuQbwSKfi371zw7v9OWw+2g4Kmgb20CCCI5kkchlG36l0dBxt2yU3TBTNw8i0fUcDXorvpBCmXD2zKbGxlTN8OXdn9Ag7xnfakOlb05NaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0LsJ5CSUqhuJ+jKKH9S6bS+xUQ/jDtaI6zjdX/HcC4=;
 b=WgH4ZFzxCtwfDNF2TYm+Q3vSBwWD9rEQb4TbvG0TOlzyuovBK158ivFlfQksCTuKqgZatB1Cz8A+f8Nn1k0lhiJm52dmcxykXXCdncAAz86PloSxBXTHHgv/9kiQifdq13ZBwyaeOKUJo8sfZksjaRJqCjlzvRGgjxX9NYVqzF0=
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
Subject: [PATCH v2 07/17] xen/arm: introduce a helper to parse device tree processor node
Date: Tue, 10 Jan 2023 16:49:20 +0800
Message-ID: <20230110084930.1095203-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT055:EE_|AM8PR08MB5570:EE_|DBAEUR03FT046:EE_|AS8PR08MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7a8fcb-cf41-4814-5cb6-08daf2e84566
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1dn9LWEKyH0NMvNktotZQO1LMC0LUoKoNrL0OaDJ1rCVnG+XJJKj8ABBXnDcO40W00Rrb08qt9fWJgMn33fBt6OA/aWxVjazCfgpaelNlDGUn7ZrC1DIZDM3iTOudKyk9TOeiQOOfwV9UsjuWZ7oCRCnEhfY+woXV8k6EMT5ER5PSR/llt+2gv1QVoPSyIFiWNUYYkCKDgU+bUPrdoQdnO/FFfdAPU+gaYOiehCsfIGsPcWpHvLgkf7BAPSQmZXXzvfv7CdCVCRzU0eVVH8ZcRYr28fvtG7Gam5wfQIgclhxtcf7c3lLMlPItWnn/ySFmprS9ZRkP04vSAmCr33K1mzg9r/0q61ytraN74SS/l2h4maQRR44iMbjLVgf/9lIUh0CM2ACG9aslS4XDRQSFrsiKs4REGMk+Q3iIlELYdlgaLb+nvrX6Zdwc8FXOowA5NwsUZHIJqfGmql+lMNWe2k++lsnokavl65lsK3ppFG6bT1NtIAmcKsLRdS8j2D1zRtYs4pidexvMVU2Y2Y1TDLqtHnEh7YeUzD+vX2sSvmXDpqqOB/4qvkGH5JtCzclh8jtIDj0FxCgwnKPmvXqebMQ3GJKaOXlk9slre9qPUUMrhPXJWcsZt3BVnsWVOYr9ApVmfsGUw9OwBWwk5rHHdThKc1Jq5OQPxUGDvQGcrEcBFchpv677RV0So09ll1xS+b+PdQqO4VDf0IgCHKvB6c1EEkDSVLSHPP2uf1vmhQHdwTZKbx98Q2pKtU0yg1j
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(5660300002)(44832011)(8936002)(41300700001)(2906002)(36756003)(54906003)(83380400001)(8676002)(70586007)(70206006)(4326008)(316002)(6916009)(7696005)(26005)(81166007)(186003)(6666004)(86362001)(478600001)(336012)(1076003)(2616005)(40480700001)(47076005)(82740400003)(356005)(426003)(82310400005)(36860700001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5570
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	397c67c1-6fe2-499a-0e00-08daf2e83ff4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UO7Y7HN+aYDoyYCIxAQOUE9CJxW5LrZTDETgW7GLoZt54HIhkzx53jEXBrev3EaQMKlHSBh1DLNIj6UJxmJg5RYkIGZqMQUNT8B32pWJ1k/JJviFUm2M5dM19v1NZP76hSTWj5tgS4oJJm/cZfWethdMjYucOsEGa501MZeSn0OWfsWYzqVP84wrG/cx5+L5BiLBI39KQpIMCP03/H9Kps969UqXRUUMYg+zLNi+535naJQLnRSlI0LxECG+sr7x3qrKF9dXFvMIkd/J82lfRZ8s4GI3Z3cekFnoq3on3z30MqxiHIUSenddJg7BqyjOvYE4EbMCINs7sbo2fvn3w91YT/Wi20gzJkukTULDiaormFudITFD1ixepUiMsP6U4xkeByEyKWe5751RdEOKFGOyzGwWBdxbfswcULAoLJhPpMRCKoOobGcQdBRHxxyFinwo1eA3OyhLyFn2wscBCRR4vt3AsmcU6YpD9y9mbfuYV+u6rRUGdwt1svJgV/FY9hl0Do0jsygfsV/rMEjMn8m3MCv9TgWkM60rVZcJUVV91eIYTffds71wv5aCmY2MQu1EvdQSMNM7ps8jRaSRTi7yqRD8w3kAdZuDcNRNBpiMKYpGTleXlcLWrlj+Q82i4/AdVPzTWadeNK7qIuwadUDRGPO3jymwFvPeo1e+xLJQIFYd/dhDCqSZWoXklYO17mbSOiNYw++IMCCBV2j4vncFphA+6xy9EhZ9FMl7fIuZmdRmua7V6mYpkM4MXHNe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(81166007)(70206006)(4326008)(5660300002)(44832011)(8676002)(2906002)(8936002)(70586007)(83380400001)(82740400003)(36860700001)(86362001)(7696005)(478600001)(316002)(6666004)(6916009)(54906003)(40460700003)(40480700001)(82310400005)(41300700001)(336012)(107886003)(47076005)(1076003)(26005)(186003)(2616005)(426003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:23.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7a8fcb-cf41-4814-5cb6-08daf2e84566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8014

Processor NUMA ID information is stored in device tree's processor
node as "numa-node-id". We need a new helper to parse this ID from
processor node. If we get this ID from processor node, this ID's
validity still need to be checked. Once we got a invalid NUMA ID
from any processor node, the device tree will be marked as NUMA
information invalid.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Move numa_disabled from fdt_numa_processor_affinity_init
   to fdt_parse_numa_cpu_node.
2. Move invalid NUMA id check to fdt_parse_numa_cpu_node.
3. Return ENODATA for normal dtb without NUMA info.
4. Use NUMA status helpers instead of SRAT functions.
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h |  2 ++
 xen/arch/arm/numa.c             |  2 +-
 xen/arch/arm/numa_device_tree.c | 64 +++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/numa_device_tree.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 9073398d6e..bbc68e3735 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -39,6 +39,7 @@ obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa_device_tree.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e0c909cbb7..923ffbfd42 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -28,6 +28,8 @@ enum dt_numa_status {
     DT_NUMA_OFF,
 };
 
+extern enum dt_numa_status device_tree_numa;
+
 /*
  * In ACPI spec, 0-9 are the reserved values for node distance,
  * 10 indicates local node distance, 20 indicates remote node
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 4dd7cf10ba..3e02cec646 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -20,7 +20,7 @@
 #include <xen/init.h>
 #include <xen/numa.h>
 
-static enum dt_numa_status __read_mostly device_tree_numa;
+enum dt_numa_status __read_mostly device_tree_numa;
 
 static unsigned char __read_mostly
 node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
new file mode 100644
index 0000000000..c031053d24
--- /dev/null
+++ b/xen/arch/arm/numa_device_tree.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Arm Architecture support layer for device tree NUMA.
+ *
+ * Copyright (C) 2022 Arm Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/device_tree.h>
+
+/* Callback for device tree processor affinity */
+static int __init fdt_numa_processor_affinity_init(nodeid_t node)
+{
+    numa_set_processor_nodes_parsed(node);
+    device_tree_numa = DT_NUMA_ON;
+
+    printk(KERN_INFO "DT: NUMA node %"PRIu8" processor parsed\n", node);
+
+    return 0;
+}
+
+/* Parse CPU NUMA node info */
+static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
+{
+    unsigned int nid;
+
+    if ( numa_disabled() )
+        return -EINVAL;
+
+    /*
+     * device_tree_get_u32 will return NUMA_NO_NODE when this CPU
+     * DT node doesn't have numa-node-id. This can help us to
+     * distinguish a bad DTB and a normal DTB without NUMA info.
+     */
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", NUMA_NO_NODE);
+    if ( nid == NUMA_NO_NODE )
+    {
+        numa_fw_bad();
+        return -ENODATA;
+    }
+    else if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_ERR "DT: CPU numa node id %u is invalid\n", nid);
+        numa_fw_bad();
+        return -EINVAL;
+    }
+
+    return fdt_numa_processor_affinity_init(nid);
+}
-- 
2.25.1


