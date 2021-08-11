Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D23E8EAC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165703.302844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVt-0003DL-EP; Wed, 11 Aug 2021 10:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165703.302844; Wed, 11 Aug 2021 10:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVt-00034W-39; Wed, 11 Aug 2021 10:31:09 +0000
Received: by outflank-mailman (input) for mailman id 165703;
 Wed, 11 Aug 2021 10:31:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlR7-0000BQ-Dz
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bd42a6d-93c6-42fe-8e7d-367cca279870;
 Wed, 11 Aug 2021 10:25:31 +0000 (UTC)
Received: from DB6PR1001CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::14)
 by VI1PR0801MB1869.eurprd08.prod.outlook.com (2603:10a6:800:88::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:29 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::ce) by DB6PR1001CA0028.outlook.office365.com
 (2603:10a6:4:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:29 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Wed, 11 Aug 2021 10:25:29 +0000
Received: from 62d2127e0534.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 203BACA2-52EE-4AFA-A944-1E75A2440C43.1; 
 Wed, 11 Aug 2021 10:25:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62d2127e0534.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:23 +0000
Received: from DB8PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:110::29)
 by AM0PR08MB5089.eurprd08.prod.outlook.com (2603:10a6:208:15b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 11 Aug
 2021 10:25:21 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::3b) by DB8PR04CA0019.outlook.office365.com
 (2603:10a6:10:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:21 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:08 +0000
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
X-Inumbo-ID: 5bd42a6d-93c6-42fe-8e7d-367cca279870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2kC8piroqCMG6BjsTu+cHiImjGbMH3XMGZi5wNR5AE=;
 b=nvCsyurQgJO7ZLRAmbbnhRz3fuGj+PKvAlcJ2qRtYUcR/v4vJfMIEFC04Iz9ZUf2gQWk6MLRn3XxBP5LgxfKgO2UgguVC5xXOLU4CmEOi0FPaA6nPz7iS69j+JnnniKUMIAm8eqvfV9DegadhsjB4WC8MA8dzv56CYxAQ6E2FCM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d158891a400b4171
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2pFLTuOdbm9rqxgCbIbqjDsaJGGOmnzNC2LJXNOdsMzQisYS6skl0EyT/E+7GfaOVXPZQlb7rhbRPyMc+HUwyLpUJ6UhWvLtXapjYsWdelVTa67JHWcbAsFIZy3Gwm0/dW0W8/gw8anAX8zraHlXBnyTpKs0ilcURuR6VcB0yFFRe17DbGIyB5CJi/GDjULyamvSmPQFrjBn7g9CoCuz9p6SBEDhVZoA87TnyHGnVnlrFb+LoXwocsTwInE/YCPrnS9UGaoovQDnfSJHqyyHJf89vQPRuoHVuvU6cCVgNp8qhmLOB9Yza8dtqbxKZpGVPVSkyHyrZyUgOeXvpHAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2kC8piroqCMG6BjsTu+cHiImjGbMH3XMGZi5wNR5AE=;
 b=hDJcUfCOISeGZKNCF2LVWPh/mvQl7f9eRhTt9ZmgapdtAd0LkEICbFXWBiyOD+AtNVqQ3Dr2wvb91qaFlckQy75ykk8vZtyfX5nOAMAxAk44KZKX8Nm1RkUIp7R9rMXUcSvlA71HpNCb+ADCz70z0/P8pb4DAz8E72BKf5JGLckD0mSnBUjCsIDLYLP1f0S1VWuf8ZexMPCsN3NciNezZoy4FJZxWPI+UcQaXGqiiHVqKATrKg/5ApegPHpJN+VbMWqWsknRX0YgQOrt65wU6vQ886K/Vi6J5EUf4zNZ6sK7NKSaamCx28HXc3knnZNQDgPaz4X3rxoUROUEWOalGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2kC8piroqCMG6BjsTu+cHiImjGbMH3XMGZi5wNR5AE=;
 b=nvCsyurQgJO7ZLRAmbbnhRz3fuGj+PKvAlcJ2qRtYUcR/v4vJfMIEFC04Iz9ZUf2gQWk6MLRn3XxBP5LgxfKgO2UgguVC5xXOLU4CmEOi0FPaA6nPz7iS69j+JnnniKUMIAm8eqvfV9DegadhsjB4WC8MA8dzv56CYxAQ6E2FCM=
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
Subject: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use common code
Date: Wed, 11 Aug 2021 18:23:59 +0800
Message-ID: <20210811102423.28908-17-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 278ff1cc-1184-460b-c768-08d95cb25787
X-MS-TrafficTypeDiagnostic: AM0PR08MB5089:|VI1PR0801MB1869:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1869891ABA3F7633135D3CC69EF89@VI1PR0801MB1869.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yOBWMeB91wpoaksoiU82B2AXNrO2LGG6cpB/h42bAr5rWGZyNEWDI+ODJDBZUFTGOca+sU21eKjyEG1BTlcDuz6YWmdf+P9sInzzV19DftmqOUM77ze9GT0nYjw5iCuv9Q4aJz//KUR6mlehgUw+qCTbRnpcXGLFaiKZCv50zkWHnh+MHFjwUq38eAP+bTLILPD2vwoqMBOhcdbMDVbB+GN1LV37UtEGJhNXufJT6oBEV2+W9NJQ5ErRbbRw4fr8Reyz60Jy7sTFs5hkJKs80Vnw7SCp2AVjlkyjGy1DxHaAUHUChRlEvigHF+qGsVwwNvT1dqtN7AfimiF5AyYSBhnkBl6McOPDATIsLytwDT1ooPn4Qp2UPW1IMg6UkTDfHry3iql6HZXGVIAqIoxEzIAH2sg4GxqBYHnmo29IsCugKE1H7GOuhx63iIQecyossGLf9d/b1J48f9BTf+Jjv7mt3ocRz7xDK49X972ZTpefphdWcxaZUJGwz5INerZLKICxodAVqmXzD5LUAw0YPwbwQHSKvLEucRCy1Ot7sFaCCJ3QF06EYzuWZm1c0BlBXJ+wDGQNZCzEYwASEAleM0UtbnGa+ZWUtmgos/8J0KsKVn0KrWIckNhDDc6ej622wbWRp8KxZdwqvXh+P3DBCY2PwtcZwkHKCwqYwKst85RO3qFS6QC0KRkIddEXopDXaL3gA092OlBTFrlMR6E5JIRT2dMq7b1PRppygmHAqdV9LJ1KlS8bErfR92DjW2VuY35M5drb8zzNA0D4GR52XiBrtsKqEACVLd7z0zyRu84=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(46966006)(26005)(478600001)(426003)(34070700002)(36756003)(86362001)(5660300002)(4326008)(6666004)(1076003)(82740400003)(316002)(81166007)(110136005)(2906002)(2616005)(36860700001)(186003)(44832011)(8676002)(70586007)(70206006)(8936002)(7696005)(82310400003)(356005)(336012)(83380400001)(47076005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5089
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d976adf-232e-44e0-0fcf-08d95cb252df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y5xQ5a+Cy1WpSp3DqvaVUJ9hdj2YZftzdHp7NMNbdpjPDgOPx3FTiuM4T1VEUpaGZJO7e+5icvPpW/tk8lUJLYlwPOayuO6hjaGSLP3gycjnJjvgGg9JUu14GOs5I2nzTkigysyjgn4Os7UVFIRtKVLseHArKJgb5pCYuhML8O2qW3Z+7ZQxY73H7MRZmaYGIXuCvtjxzgxUVOK8LJ/EtI1vlR/6Y12I8FExWdwIaO+/9DnBC6w7f5lDreXjtPsxXtZXVeOKxibC32vJSfWWsrFUrHQ19A6mo5DxizPZ4aM8p3r1+j0akw4Urahn61l0rG7Z/AmqopQcEeqPnsSDpL2ugRpefQrdkkbfIE1Em+RD4nLGnZggvVf4FpN8HyF+tnxTC2cPvHjA2JcGHS08zdJT6rawpJLIaWB7PtDBnfFbDnBMD1y3Nr3ZDIl9fchq593RmGTDbu7uJE47auHjAAEqwYaML6rWALVxZXC733iKhzqfzAoR4qLxHuW8p/p58dbYEnbH3M8k7BcY64nFppgx4pgUBCsd4BRcRq/9sZF9CD/fCUqimeCj5ENgmqw5Lj7cxgSua6rhPqKC2cE7aLoRPKPo/40nrwpq6GdFRsvWzuQ9wnDpOP7TRa4MZwBB2ElRs1ehwGG9qjBhm0krffRSPkQ6fcrWLi3CIrLTR9c2huknH8CKRKxC/hoTQxpATQiGDmYvomdADyWnMZ1MnTcKVEche7HdeDEbYZb2jzg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(46966006)(36840700001)(83380400001)(110136005)(2616005)(1076003)(47076005)(8936002)(426003)(44832011)(36756003)(2906002)(478600001)(86362001)(70206006)(7696005)(26005)(6666004)(81166007)(70586007)(36860700001)(186003)(336012)(82310400003)(4326008)(316002)(8676002)(5660300002)(82740400003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:29.2016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 278ff1cc-1184-460b-c768-08d95cb25787
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1869

When CONFIG_NUMA is enabled for Arm, Xen will switch to use common
NUMA API instead of previous fake NUMA API. Before we parse NUMA
information from device tree or ACPI SRAT table, we need to init
the NUMA related variables, like cpu_to_node, as single node NUMA
system.

So in this patch, we introduce a numa_init function for to
initialize these data structures as all resources belongs to node#0.
This will make the new API returns the same values as the fake API
has done.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c        | 53 ++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c       |  8 ++++++
 xen/include/asm-arm/numa.h | 11 ++++++++
 3 files changed, 72 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 1e30c5bb13..566ad1e52b 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -20,6 +20,8 @@
 #include <xen/init.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/pfn.h>
+#include <asm/setup.h>
 
 void numa_set_node(int cpu, nodeid_t nid)
 {
@@ -29,3 +31,54 @@ void numa_set_node(int cpu, nodeid_t nid)
 
     cpu_to_node[cpu] = nid;
 }
+
+void __init numa_init(bool acpi_off)
+{
+    uint32_t idx;
+    paddr_t ram_start = ~0;
+    paddr_t ram_size = 0;
+    paddr_t ram_end = 0;
+
+    printk(XENLOG_WARNING
+        "NUMA has not been supported yet, NUMA off!\n");
+    /* Arm NUMA has not been implemented until this patch */
+    numa_off = true;
+
+    /*
+     * Set all cpu_to_node mapping to 0, this will make cpu_to_node
+     * function return 0 as previous fake cpu_to_node API.
+     */
+    for ( idx = 0; idx < NR_CPUS; idx++ )
+        cpu_to_node[idx] = 0;
+
+    /*
+     * Make node_to_cpumask, node_spanned_pages and node_start_pfn
+     * return as previous fake APIs.
+     */
+    for ( idx = 0; idx < MAX_NUMNODES; idx++ ) {
+        node_to_cpumask[idx] = cpu_online_map;
+        node_spanned_pages(idx) = (max_page - mfn_x(first_valid_mfn));
+        node_start_pfn(idx) = (mfn_x(first_valid_mfn));
+    }
+
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
+    return;
+}
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 63a908e325..3c58d2d441 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -30,6 +30,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/numa.h>
 #include <xen/param.h>
 #include <xen/softirq.h>
 #include <xen/keyhandler.h>
@@ -874,6 +875,13 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
 
+    /*
+     * Try to initialize NUMA system, if failed, the system will
+     * fallback to uniform system which means system has only 1
+     * NUMA node.
+     */
+    numa_init(acpi_disabled);
+
     end_boot_allocator();
 
     /*
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index b2982f9053..bb495a24e1 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -13,6 +13,16 @@ typedef u8 nodeid_t;
  */
 #define NODES_SHIFT      6
 
+extern void numa_init(bool acpi_off);
+
+/*
+ * Temporary for fake NUMA node, when CPU, memory and distance
+ * matrix will be read from DTB or ACPI SRAT. The following
+ * symbols will be removed.
+ */
+extern mfn_t first_valid_mfn;
+#define __node_distance(a, b) (20)
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
@@ -35,6 +45,7 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+#define numa_init(x) do { } while (0)
 #define numa_set_node(x, y) do { } while (0)
 
 #endif
-- 
2.25.1


