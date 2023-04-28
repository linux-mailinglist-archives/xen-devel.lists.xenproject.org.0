Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE56F1DBD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527452.820075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNC-0000TJ-Sv; Fri, 28 Apr 2023 17:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527452.820075; Fri, 28 Apr 2023 17:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNC-0000QR-P9; Fri, 28 Apr 2023 17:59:10 +0000
Received: by outflank-mailman (input) for mailman id 527452;
 Fri, 28 Apr 2023 17:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSNB-0006vK-FE
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:09 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e94cecf-e5ee-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 19:59:08 +0200 (CEST)
Received: from BN9PR03CA0586.namprd03.prod.outlook.com (2603:10b6:408:10d::21)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 17:59:04 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::73) by BN9PR03CA0586.outlook.office365.com
 (2603:10b6:408:10d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:59:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.25 via Frontend Transport; Fri, 28 Apr 2023 17:59:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 10:59:03 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:59:02 -0500
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
X-Inumbo-ID: 5e94cecf-e5ee-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBXlB1ZG6/vmMhaoU+FTj7J3FLddgv8NMNmGzN+5zsBrlXJskBWgla0qsKCXzXKQb3jeFfJl3RJ2EVZnWjV5UP16frOlDMLlkhtJRHmKm37TDsfulB9eGeqUkntWvCQ308UhlqxXRCRgLmf/us2OF8pgbB4rklum8PDXC7ZEmYQCMgMjq0wlWV5n2Z/iuSgXIp0xATKc4ojRTwSGjaaOPXG0ocrVWrZLubX/L7t3dLDKGqyZKpNzlR+9Mt6aW1DD8ZRjKmEDYb7vVUR4EGtaLATJ2Wh2Fpe+FdWBcuVR8Hu7Av40Z4AgNIx+YzNAOrxUYbdr2H7sgME1BFPYKbs/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOm2SpQiMUEOdheU2722eg0DN0nkyL2aqaeiPOs0j1M=;
 b=PFU3zbn4b2Z7u47mU7vqTKQxNb+/E1YpQcr8BrMnJo1u4PZKfAQGS1BQZa/wJ2vAt41OTkLjpdmiKKRZjZvLUSYLtylUjsi0p9LGIH/AjLa60YkRGV34ZTTk/fCych3TbuTU8AI51GXw1ZlFP6OZJbuQ37Q+X05RuvQoBQ2T2VX1ZLOwDCJfWPNvh6bNwjI/TjBGlsyCAnhW/R2vnbjvTvFgC3KR1d+4YS/yd2aTVQMPbACY93YUAFobHSRjhRnFrQxUZRTXUYRIldr1dXsBXFAPG3+Khq/lhU1irqvgj9YgawNaIbQvQGq5HDZU0coSLMuhEi8eGyu2QF+gWBl2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOm2SpQiMUEOdheU2722eg0DN0nkyL2aqaeiPOs0j1M=;
 b=U7ZT1wluL6xXL64gowWh5nZLZzZ345LZEmQrSclzzb+7NqRxPuC7sG6HgSjI07kkd1Y2QltaQQlM2co2T/Oxhs9zXHbgq3Pz2clZC53BC5F38IjljLGKnGQiqa70doNtmHxuRd5aUZQ5B3ckCqGbY001HkTSybPPjhPW6bd/ISQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v6 08/12] xen: dt: Replace u64 with uint64_t as the callback function parameters for dt_for_each_range()
Date: Fri, 28 Apr 2023 18:55:39 +0100
Message-ID: <20230428175543.11902-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: d7398eb0-bf9e-433f-65d7-08db48124147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d71H0XCuBBnFgA4kyQ1y2Fhn2MDWnhQEAjsBhycx7F/cnP1Z5Peixv9KVmHxbt7fAompvA1yTA3iDqRtWIKytyHTiCUs+gmvtFgYWoCtM2yNUGZrqj8Jc2x5yAQHy57ryBuMqFC+gcqJZR5HuA4D/5S9huoToJN6BsvLx7hgOxlT16vi7hgjtlfmEmWGquuSXExz9VaeuxuQmwHPArO6xbpqwIdRNW2B6+0hzME8RyXS17iPaCEB21woZdlwTHFKdjFVFaqaW/bZqbfar3rCdfSK7F27cgssAzEtKrqX6N9A0djW/Z5AbDk/kTzJFrIX0BIGB5101O0NK05/7S1G0tqqRRgIy1LTonYy2Vdj6EjhBj/fliayahV31V8pYc46dyfaUZ0CHw3oNlstkL48p/zAHG+pXGOcpbxP7ZiqrxY4CCp6M4Oo720r+QUfHWk3eXbd9Pu7/Xig/UNX5U663cNnU46I+GpNQ6RNuWpLWmRl6J6PsG/Jcaw9ZPt6Xz7/C+CPN514fX9aRG4A5gdmv674M9yx9oz195+WXWL7G5lB3HPG5LCg9oY1LYvUThd1+Dq3n/89DOp807ws9OV5ib5ONsqWdI1Z+8tuN2qU4ZqyYvgD9k5AqY/RrSDngY/fPu8lmM8NbLJagEa6tb6vx7yPVxZYQd1qOdLOCnOv6z2OkpwwkRBPO6UA7bz5V1pDFNxqFIEvhmVjW06BYhm5u2RdJJHZiDCMFVMbMY8cRrc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(81166007)(103116003)(70206006)(40460700003)(82310400005)(70586007)(6666004)(2906002)(356005)(40480700001)(36756003)(1076003)(26005)(316002)(82740400003)(186003)(41300700001)(4326008)(6916009)(478600001)(36860700001)(5660300002)(86362001)(54906003)(8676002)(8936002)(336012)(426003)(83380400001)(7416002)(47076005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:59:04.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7398eb0-bf9e-433f-65d7-08db48124147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044

In the callback functions invoked by dt_for_each_range() ie handle_pci_range(),
map_range_to_domain(), 'u64' should be replaced with 'uint64_t' as the data type
for the parameters. Also dt_for_each_range() invokes the callback functions with
'uint64_t' arguments.

There is another callback function ie is_bar_valid() which uses 'paddr_t'
instead of 'u64' or 'uint64_t'. We will change it in the subsequent commit.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1-v5 - New patch introduced in v6.

 xen/arch/arm/domain_build.c      | 4 ++--
 xen/arch/arm/include/asm/setup.h | 2 +-
 xen/common/device_tree.c         | 4 ++--
 xen/include/xen/device_tree.h    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1c558fca0c..9865340eac 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1637,7 +1637,7 @@ out:
 }
 
 static int __init handle_pci_range(const struct dt_device_node *dev,
-                                   u64 addr, u64 len, void *data)
+                                   uint64_t addr, uint64_t len, void *data)
 {
     struct rangeset *mem_holes = data;
     paddr_t start, end;
@@ -2331,7 +2331,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
 }
 
 int __init map_range_to_domain(const struct dt_device_node *dev,
-                               u64 addr, u64 len, void *data)
+                               uint64_t addr, uint64_t len, void *data)
 {
     struct map_range_data *mr_data = data;
     struct domain *d = mr_data->d;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 47ce565d87..fe17cb0a4a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -166,7 +166,7 @@ u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
 int map_range_to_domain(const struct dt_device_node *dev,
-                        u64 addr, u64 len, void *data);
+                        uint64_t addr, uint64_t len, void *data);
 
 extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
 
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 2163cf26d0..ab5f8df66c 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -997,7 +997,7 @@ int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
 
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *,
-                                u64 addr, u64 length,
+                                uint64_t addr, uint64_t length,
                                 void *),
                       void *data)
 {
@@ -1060,7 +1060,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
 
     for ( ; rlen >= rone; rlen -= rone, ranges += rone )
     {
-        u64 a, s;
+        uint64_t a, s;
         int ret;
 
         memcpy(addr, ranges + na, 4 * pna);
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index ce25b89c4b..b3888c1b96 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -681,7 +681,7 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
  */
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *,
-                                u64 addr, u64 length,
+                                uint64_t addr, uint64_t length,
                                 void *),
                       void *data);
 
-- 
2.17.1


