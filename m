Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E73B64E1D0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463750.722025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyb-0006vR-Ey; Thu, 15 Dec 2022 19:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463750.722025; Thu, 15 Dec 2022 19:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyb-0006ry-BH; Thu, 15 Dec 2022 19:33:05 +0000
Received: by outflank-mailman (input) for mailman id 463750;
 Thu, 15 Dec 2022 19:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyZ-0006KU-Pr
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49ac883b-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:33:02 +0100 (CET)
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 CH0PR12MB5091.namprd12.prod.outlook.com (2603:10b6:610:be::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.12; Thu, 15 Dec 2022 19:32:59 +0000
Received: from DS1PEPF0000E644.namprd02.prod.outlook.com
 (2603:10b6:4:ae:cafe::25) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:32:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E644.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.9 via Frontend Transport; Thu, 15 Dec 2022 19:32:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:32:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:32:57 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:32:56 -0600
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
X-Inumbo-ID: 49ac883b-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg5o1zkItVJY2AOXu9KfQtYOrdnky6GjMIei7mexiv7lyHze1zAUGzeOBia+7SAxTMs5+SU6ImmDcGFTog0y/zjUt9bQQoRT6DDy7gG5W9HA/q+b1FMlKe2gy8khVKUfmANm3+e6mrRekCkiJg9kWxM7VlKw3OkiWACcxusXzpTO2YMNk+IIHDu6AyW0NuOfEhwte8urZJ+3f6JVCrKkuBd2MuCTbaO8EBC8GGbt+0rMrk7zkylBL/5YWmT2dfRzgmtM0UBgOVoIeWEQfZnZPbiqxbZNkupBIAhODJiegrKfpQwr9SoMkXfP9N3HGVTqkvCb670r57Bz8mqGLbY2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEcjDNJBIOdqWQvewngXlND3JwUSJKnAsyDlrtHgpXw=;
 b=AaPreCpbWE771yaxNRin2QU0dKV1I59WCpDW5rq/rIXO5Vytmfjkh7+wT5pQiKgUvcSHmVVyPb52SwRAqnnSV9urQJ4G/u3MQkC1l/4LHyLBvOVYseDENapBzwhGf17Fn307f1+BEPAXyVHtXghIRbd7pygTWkKBlZ3Tu8DyHknFycU05Eppum71LvmAi30bNyjqdwYstahv7IrfHb3D4hQj5Y+PPq4YZlGamm8PwWza6R2cHXSYmFgiMXKf+aiIZ6dsas+3UJWmKzVDEx0dgwsNEA6BOWw0qyFnMM21yqxrjqbJ//0eGjWCDm+urZFMAmYkYIHF+6+nEAYvYdqMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEcjDNJBIOdqWQvewngXlND3JwUSJKnAsyDlrtHgpXw=;
 b=5J2gydSOAgEhPqmIPNSUUm8lGj0gf/GHPWe+7GXNfGaw7CxKVx09Wsd8dP1u10ROjyrYRrds6Qe0q/Oxl8O2Ug8YV3MIJAN9fXQxFTiCgQth74+ozzBhHnnimCObfNuQl3h3n2b3e41z9C1flGNx0lPmI7CFPJLtLwEUCvD9BGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t
Date: Thu, 15 Dec 2022 19:32:38 +0000
Message-ID: <20221215193245.48314-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E644:EE_|CH0PR12MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cf6f67-9b36-408f-4299-08daded32c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tx/by94KrXnIowkCbGkaM8I6FrKN8u/SwUsT2V9SKXaROwIFh/RR7rxJHaybZBk6hFw939WHtTZ7pSPw/944UxDWCfxC/LOHPTaOboH4XxRvG0i4e3qAftS6bLrCXeXaqgLmvSsxR9q8SSJmgd9oUkgeyvov/I9dLdIjx3U2+QdPepxTxQoMJG8tplwTA21u0RjdzKKtwgnq5qEOSSo7v7GqqRSoNHO9MDG0gDI9VC4GB+d84d6wR/1ucHi4U43AceFeRAYwneKWAiPQEpWGyuCSOiMTfJYXIpjzkZ9wOVFZzueesI+yALNmfkDH52+VQ8NYqvYo18k6GzKXSVn914W+RUhrv/VaQBpkKfGbDeazbLvWBswnLzQXTd3aEb+Hkzij8IlrWzB9UDfzkcHj7CRPvVqmD01nCma1tALGWRZJ4wEz+4xyrCqzEcoQ6WZIkW7gWO7T3arl7R7Ai/pSC4GirMNCOKdCvmHnreyEi25hBePeMN9Zyj+PXMWwbKfvYq9ReyTeIIC2U4JrEzMA9gCSGYPjVdsm4JjkjsXlREebJLHz1bffYp6Jlog7OyCIUuyU0SO1wNlIkAYJeyCIcF3o2aq19RfkV9Okcg5YbROKiHffThlXmABLzcUaXBqywwZmaO6w7lK7vYaLQ0JPHWCe2XQ2VpIG1vwczUDnMUqhUscOjSM1ycY189r2c4R8scl1h5QCa4XKFkxC0N0aau1PYUa01LO32tPrHWgIcu4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(8676002)(4326008)(8936002)(70586007)(70206006)(41300700001)(103116003)(6916009)(356005)(54906003)(478600001)(316002)(2906002)(36756003)(40460700003)(86362001)(186003)(6666004)(26005)(2616005)(336012)(1076003)(47076005)(40480700001)(426003)(81166007)(82740400003)(82310400005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:32:59.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cf6f67-9b36-408f-4299-08daded32c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E644.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5091

paddr_t may be u64 or u32 depending of the type of architecture.
Thus, while translating between u64 and paddr_t, one should check that the
truncated bits are 0. If not, then raise an appropriate error.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/platform.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/arch/arm/include/asm/platform.h b/xen/arch/arm/include/asm/platform.h
index 997eb25216..6be1549f09 100644
--- a/xen/arch/arm/include/asm/platform.h
+++ b/xen/arch/arm/include/asm/platform.h
@@ -42,6 +42,32 @@ struct platform_desc {
     unsigned int dma_bitsize;
 };
 
+static inline int translate_dt_address_size(u64 *dt_addr, u64 *dt_size,
+                                            paddr_t *addr, paddr_t *size)
+{
+#ifdef CONFIG_ARM_PA_32
+    if ( dt_addr && (*dt_addr >> PADDR_SHIFT) )
+    {
+        dprintk(XENLOG_ERR, "Error in DT. Invalid address\n");
+        return -ENXIO;
+    }
+
+    if ( dt_size && (*dt_size >> PADDR_SHIFT) )
+    {
+        dprintk(XENLOG_ERR, "Error in DT. Invalid size\n");
+        return -ENXIO;
+    }
+#endif
+
+    if ( dt_addr && addr )
+        *addr = (paddr_t) (*dt_addr);
+
+    if ( dt_size && size )
+        *size = (paddr_t) (*dt_size);
+
+    return 0;
+}
+
 /*
  * Quirk for platforms where device tree incorrectly reports 4K GICC
  * size, but actually the two GICC register ranges are placed at 64K
-- 
2.17.1


