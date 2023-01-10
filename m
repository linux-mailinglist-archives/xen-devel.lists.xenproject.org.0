Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A57663BEC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474450.735700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOv-00014v-V7; Tue, 10 Jan 2023 08:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474450.735700; Tue, 10 Jan 2023 08:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOv-0000yX-MP; Tue, 10 Jan 2023 08:54:33 +0000
Received: by outflank-mailman (input) for mailman id 474450;
 Tue, 10 Jan 2023 08:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOt-0005s6-KG
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a89fc5-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:29 +0100 (CET)
Received: from AS9PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::31) by DBBPR08MB5994.eurprd08.prod.outlook.com
 (2603:10a6:10:20d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:28 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::b8) by AS9PR0301CA0031.outlook.office365.com
 (2603:10a6:20b:469::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:27 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Tue, 10 Jan 2023 08:54:27 +0000
Received: from bf9eea3806c2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09505C98-CD7C-42E8-8219-4CA26EC3D753.1; 
 Tue, 10 Jan 2023 08:54:22 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf9eea3806c2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:22 +0000
Received: from FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::17)
 by PAVPR08MB9796.eurprd08.prod.outlook.com (2603:10a6:102:2f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:19 +0000
Received: from VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::60) by FR3P281CA0138.outlook.office365.com
 (2603:10a6:d10:95::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:19 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT039.mail.protection.outlook.com (100.127.144.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:17 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:15 +0000
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
X-Inumbo-ID: 64a89fc5-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tafurYy+S0foZPSXVs4MXxTgGOhH6a719Sg+5VUNEA=;
 b=5/AeyROb+LeKOthAZWhDuLaaOHSdhHoqXe89J+OFwYmqaEHJbQ/p26ThxEdc7/oeHPuOc2WIbPW3IHdbJMS0SvF18Vbd+UMyH1PGVR6Yzq1OFIiafVYEWOnCoPZYnm9uDaCatD3x81Uh2oP/4KHrvvQnA9UgBFTO4xlJG0iIw3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 827b35e3b0659489
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yd640jTkooDsJVKnYpwGL2IyfeIc+q89tWKjGoRO2+++EWCtkw0cL5hOIvZ4TA9Oswvxi9QZYzLw5m73tnIV/FNqnfLkD5k54IpA33ovMJQytgg6n43eMZ20W+43lOCkWbNhs1YI4gDMz1O0TmQWyzXRjL7TJuvt4A7lLqHnlhJbb2wI2x3L5iJjYw8fSjw1M6R274S76TuxjHLtIxlGypGK8yEQCZNizc11d0Z9GIZfZMOwjit6EAHk8aNpiC71GVNyR74jwilKOHFI9E8+ocCKHC/FJy5f/1eVmIdDEEiQh/iaM3k6SrOp55qd1gQ9N/47akDEs2N3y2aHO1p6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tafurYy+S0foZPSXVs4MXxTgGOhH6a719Sg+5VUNEA=;
 b=nsX61tnhkj6pgZa0K1lwVigNsujVBQSGZLIL+b1pqLR3UVX5bK3GejX/Xr1HJkvkxHZmZ3SZbyfGMg9qzb1qQtxbDqDCIEVQwE6/Xb9n7zHMohOVJBHRtvHhrx9T68KcUvC3vk/wFXclGyAj/4bu84rr8iCWuv9ciX3go+eNbrhDY6u6ifpEB738nOiDLDz7FMf8/dzU6EbYx56W1NVj69yjoaQOL11EgBmLKyJKwClLLNXgY4HpW1p9uJn/F2MsV4k6VClknhWz0DM9UeY05Z7xAgSqEJlxBWUhiE1ouXeIZLywVzj/NqWZrYAlxBmVTsQQu5sgPgEv4qZZs9mUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tafurYy+S0foZPSXVs4MXxTgGOhH6a719Sg+5VUNEA=;
 b=5/AeyROb+LeKOthAZWhDuLaaOHSdhHoqXe89J+OFwYmqaEHJbQ/p26ThxEdc7/oeHPuOc2WIbPW3IHdbJMS0SvF18Vbd+UMyH1PGVR6Yzq1OFIiafVYEWOnCoPZYnm9uDaCatD3x81Uh2oP/4KHrvvQnA9UgBFTO4xlJG0iIw3Y=
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
Subject: [PATCH v2 12/17] xen/arm: enable device tree based NUMA in system init
Date: Tue, 10 Jan 2023 16:49:25 +0800
Message-ID: <20230110084930.1095203-13-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT039:EE_|PAVPR08MB9796:EE_|AM7EUR03FT005:EE_|DBBPR08MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 138bac64-1cf9-491f-337e-08daf2e847fe
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tFL1VHCIgog4EcjhUb5e1C+fl4yWwZDlNsu8Lz4J9UzPyTrIpY1uVdEg0imcGH7oFjObb43VZurc+6X6FrLeCPzSySIhqtzQpr0O1vlO7wFm+PcKfpysIGh7hZQxoPCXo+x+sfAhBz8P+T6ZWOqKOV/JTPGJ3BJhLnRZDb/k8UqIZsIByPeBtvqHFkRi1bqODETcn81a5Wpmyl6ngrPu/55Z+BHU6inJxr0fH+FLIWktwzc+/9FnDXROzYIPb6/h/QUp0/Reut6ORPGTksBog7vZeHWGoNhX7liMo7MIHvJX/WLe9Ur9z8nLc3XoHqE9cQgbj8GfWPprC1yeDIaBXsY+a09dQqFoiwB3hyrFwRbmpO5FXYbUq2X8uK2TZyw7lmJIAbAg8c7FJtmXf3oKwnRsWGxBb+u8HR65vz1IIHq3+BiVkYSiOpNkV0r12daMObaizryWLKHrKQbmCIUJihlVNc2cT97UkDnLodmbaD2PokC5lGr52/k9tdM034PDcsIddHvOZYQ9rl91Eg+G4H+4q6l2UJnqESKlHydVsDEmuAFC18iI95nwkgocrIublHEt2tXXhi+P2u9aCAnsQYmfS/RMMRzQqd73/eSykzhhdrcNveij7+SLgOMZezcGGB2he0cU1xpPFn9PHyDoxt1Q+irKC9SvAhq7bnsBkyCM91nPliiiADnWDy0joenzTQ2buVtU/KNwhOQzTriM/Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(6916009)(356005)(54906003)(82310400005)(41300700001)(478600001)(2906002)(316002)(82740400003)(6666004)(36860700001)(44832011)(336012)(1076003)(83380400001)(4326008)(8676002)(86362001)(186003)(26005)(40480700001)(7696005)(5660300002)(36756003)(2616005)(81166007)(70206006)(70586007)(47076005)(426003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9796
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df9ab331-527d-4f18-6fef-08daf2e84297
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/AuKOjvJa5ALwIqEwyKhhk9yBW10GhuhWy/H3Qr9VfJd045mSfOaRD2Z8dW65j2KsiDwNzi5W1k+us/bJbxxETGL1jcmauSeo5bp5wtu4M/QMuwBuovrDbFaLmAaq7btrIu7FTX2oPSEXzsYY3ELTz8DCj6ry8P1Lq/lRJ/kEv/Xi9H9CoUjgu9g7b82jxKRv+G7F3N+1+d2O/DWgENB/64WWGMN47+FAHCt597r7PSyQ9upCLeHlAuGlmjVKGXOG9lrT5pGVL1MCXZ34z8OMisLGUPb6Uw+nvTPRc/EDtYw7d9MZY78rp2h4uUreN2+X10NvdDXd9ofU6WWtxbSjQ4p9QwaEAH5BgBHrnofcYTawVMeqNcsUDMFmUgiBZtwfOkcdnlPD89JK8PhMYvFihBoowAGBRTYiuZPlphwoXBz+HBhliGKy8a8jrM6I00xybKp6TMAJA0xXyVfstIHcPZVycLtyLxRcTINf3clhwt2MzSG5wLyUssAF2wXEkiKw/FTJE80dmTG3Q19+lq1jHcTNig7K51hbjVk3sX1d30mFG+TfFj6u5g+Led3/HMeI6OXp2hn7Z5vGe/cco5iJu4lUpnbGuXf+VTpSa0EuFhEBRPhPO2hiRQKOA8tjzr3CxjLvTR7Gvj4YIeNNy2OjuOb+ca6Bec7imD3PfwLIAHz5CmsMXS73ArJSvrsDB4fHte/gWHGYRkj/36EpoaMWw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(8676002)(8936002)(4326008)(41300700001)(82310400005)(70206006)(70586007)(5660300002)(86362001)(40480700001)(6666004)(82740400003)(107886003)(316002)(2906002)(54906003)(6916009)(44832011)(36756003)(81166007)(36860700001)(40460700003)(478600001)(1076003)(7696005)(83380400001)(47076005)(426003)(26005)(2616005)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:27.9897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138bac64-1cf9-491f-337e-08daf2e847fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5994

In this patch, we can start to create NUMA system that is
based on device tree.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1->v2:
1. replace ~0 by INVALID_PADDR.
2. only print error messages for invalid dtb data.
3. remove unnecessary return.
4. remove the parameter of numa_init.
---
 xen/arch/arm/include/asm/numa.h |  5 +++
 xen/arch/arm/numa.c             | 57 +++++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c            |  7 ++++
 3 files changed, 69 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 1213d30ce0..34eec9378c 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -45,6 +45,7 @@ extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
 extern void numa_detect_cpu_node(unsigned int cpu);
 extern int numa_device_tree_init(const void *fdt);
+extern void numa_init(void);
 
 #else
 
@@ -86,6 +87,10 @@ static inline void numa_detect_cpu_node(unsigned int cpu)
 {
 }
 
+static inline void numa_init(void)
+{
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 3e02cec646..e9081d45ce 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -18,7 +18,11 @@
  *
  */
 #include <xen/init.h>
+#include <xen/device_tree.h>
+#include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/pfn.h>
+#include <xen/acpi.h>
 
 enum dt_numa_status __read_mostly device_tree_numa;
 
@@ -103,6 +107,59 @@ unsigned char __node_distance(nodeid_t from, nodeid_t to)
 
 EXPORT_SYMBOL(__node_distance);
 
+void __init numa_init(void)
+{
+    unsigned int idx;
+    paddr_t ram_start = INVALID_PADDR;
+    paddr_t ram_size = 0;
+    paddr_t ram_end = 0;
+
+    /* NUMA has been turned off through Xen parameters */
+    if ( numa_off )
+        goto mem_init;
+
+    /* Initialize NUMA from device tree when system is not ACPI booted */
+    if ( acpi_disabled )
+    {
+        int ret = numa_device_tree_init(device_tree_flattened);
+        if ( ret )
+        {
+            numa_off = true;
+            if ( ret == -EINVAL )
+                printk(XENLOG_WARNING
+                       "Init NUMA from device tree failed, ret=%d\n", ret);
+        }
+    }
+    else
+    {
+        /* We don't support NUMA for ACPI boot currently */
+        printk(XENLOG_WARNING
+               "ACPI NUMA has not been supported yet, NUMA off!\n");
+        numa_off = true;
+    }
+
+mem_init:
+    /*
+     * Find the minimal and maximum address of RAM, NUMA will
+     * build a memory to node mapping table for the whole range.
+     */
+    ram_start = bootinfo.mem.bank[0].start;
+    ram_size  = bootinfo.mem.bank[0].size;
+    ram_end   = ram_start + ram_size;
+    for ( idx = 1 ; idx < bootinfo.mem.nr_banks; idx++ )
+    {
+        paddr_t bank_start = bootinfo.mem.bank[idx].start;
+        paddr_t bank_size = bootinfo.mem.bank[idx].size;
+        paddr_t bank_end = bank_start + bank_size;
+
+        ram_size  = ram_size + bank_size;
+        ram_start = min(ram_start, bank_start);
+        ram_end   = max(ram_end, bank_end);
+    }
+
+    numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
+}
+
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 {
     if ( idx >= bootinfo.mem.nr_banks )
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 8c02cf6cd4..4cdc7e2edb 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1031,6 +1031,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+    /*
+     * Try to initialize NUMA system, if failed, the system will
+     * fallback to uniform system which means system has only 1
+     * NUMA node.
+     */
+    numa_init();
+
     end_boot_allocator();
 
     /*
-- 
2.25.1


