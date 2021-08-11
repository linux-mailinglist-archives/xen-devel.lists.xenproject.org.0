Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB63E8EA4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165696.302807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVq-0002K6-2e; Wed, 11 Aug 2021 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165696.302807; Wed, 11 Aug 2021 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVp-0002DI-TM; Wed, 11 Aug 2021 10:31:05 +0000
Received: by outflank-mailman (input) for mailman id 165696;
 Wed, 11 Aug 2021 10:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlTw-0000BQ-Jl
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:29:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30ccf2c0-2a42-4497-92e0-c621481b8df3;
 Wed, 11 Aug 2021 10:26:14 +0000 (UTC)
Received: from AS8P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::11)
 by AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 10:26:12 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::9b) by AS8P250CA0006.outlook.office365.com
 (2603:10a6:20b:330::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:12 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:26:12 +0000
Received: from df66873e980b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6BB0B95-9AE4-4090-AC77-AC10317BAE2F.1; 
 Wed, 11 Aug 2021 10:26:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df66873e980b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:05 +0000
Received: from DB6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::17) by
 VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:26:04 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::d1) by DB6P191CA0007.outlook.office365.com
 (2603:10a6:6:28::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:04 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:04 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:26:02 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:26:03 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:00 +0000
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
X-Inumbo-ID: 30ccf2c0-2a42-4497-92e0-c621481b8df3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAOWUGxgQoZW9KSsCECQDLvP30ypWGfceAqtMnccDqI=;
 b=0+4RNNd9rIzQDgMAZALu0X/PrFSt9qdft4P+rkUzUMghkKU9bR60hBlQKUbxq4ywXjfgKL0AbUKj2F0/PgBdvxN2ppOMuMzbbSH0NXUCkFaBihmsUPt0Q5/tt6Td2QHnJVDuYcthe1mXldeBBuLJ+9bBK8YjGtSLS17C89M+L3A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6f26dd225189abc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ma7/fIYPLSgdIXfB2wv9QOcLAZfjTbs6vUWBgFXoHaL9/QBaRnpGXtdx21iz77YyJ1wPDyZvnKzD3q42oJGk9fmJcm/DYUx7eL80zQgLxnAw0zv6zA7x2dNEuQJsz4wChxeYKNWshajZRKNgoS9gwbRZ1KzgrEVPrHHIXKRAcsgl8wG/jUVZGviMN/tfkSRuaQfA+vYvpK7+qCAbjSQnVR1So2WDpwBGNKeUC9h5UQQKHnnEBHBQ44jsW/YvWPV3rurF41O9wk78kEj+LG61K3Dx36xO2sEAShBtjEqlURwAsKmwqqiw8XFxowUShOrS1unQZcYygAG5wJHZfbFdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAOWUGxgQoZW9KSsCECQDLvP30ypWGfceAqtMnccDqI=;
 b=PT8zSMHRUUPiVjBkXZEG2zUZRCGcFkUehTqGhc8+5HL5jYQXa464g9BFGfRJALUzztrccMMHfHarmwJqw3eK8lhrXWadWmoZScEPBRIf2AfgHaaOuKCDdaNX+Ydh4VCqMs/6rtZ12JXLXpc16f1aAgHy7bjrrRedUy8yHLzf4uRKDj7lg6sAypF87xGdsddFpO5od5jyNA08bS1jQlgUdHsFha+CGPhj95bWsxzgIFtecMd9gpkoWB/zAU8kbQd9LuzRjRFj3F19xjXJnbYsksoGNPkgNC2LeyXZVcWHRZCcHqgUaAX2yoZcDId6c9lRCJfmGGnPARE24PkT1XULVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAOWUGxgQoZW9KSsCECQDLvP30ypWGfceAqtMnccDqI=;
 b=0+4RNNd9rIzQDgMAZALu0X/PrFSt9qdft4P+rkUzUMghkKU9bR60hBlQKUbxq4ywXjfgKL0AbUKj2F0/PgBdvxN2ppOMuMzbbSH0NXUCkFaBihmsUPt0Q5/tt6Td2QHnJVDuYcthe1mXldeBBuLJ+9bBK8YjGtSLS17C89M+L3A=
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
Subject: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA init failed fallback
Date: Wed, 11 Aug 2021 18:24:20 +0800
Message-ID: <20210811102423.28908-38-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2451caa0-5cc1-473a-39a1-08d95cb27177
X-MS-TrafficTypeDiagnostic: VE1PR08MB5662:|AM6PR08MB4215:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4215BB62E57233A9131A1A7A9EF89@AM6PR08MB4215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MOJeYIqZ+6SGZoYBf5ezJYX/hRMcbW/Wfwq+39tVgYTnplpTIYhjD2+3+wo19UDIcDL5yTr2ru4gZ0guzj8UV5ms9Z5rLrAnGo16YIP/vig3KUAWpRAsDuTYSwjvOAns9ocTm8qxCl3Xx9JEgvHnzKdQyoLaxoO+ehbZA+xQaSklsVbug2kj8/l2S0ZlwKEnEkOTorcS6rKB02gFKa0fI6H3RiqYSdEwU5yrb2ZMYJ7jbTfYcNTb1BJg0M15b2XfTmc87hJp+tnvRYXjvPF02CQ9pDEOvEZ9/U6oVsYW3X0Zb+OSV6Da5sb+CjkNhByIjgTiaNGef1FkjlBKf6qq4aJIGmr1gcGzAxyhFa4xVjAwt7HdUFxQzuDiJup7xGaoIP4LpBJXXSh1avoPGoakgkZxxGkJQA5UjYAsvrMdqW+eD5vr4HcVbLnD2FBB1gQ+y3Jy7Prgc1T2KCsPKL4OJUxxfBmgPRraz8XuGuYs+IeD14NDCfxsdfVLIrvakUUok73mI+kUxVehjvXg6IbPAfagqVQofVGYmTp+J58CPPFWfc9cLXiS7BRAyir961D6YXrN7eBV0E1nCBNKS6cNFyqcmadPGD4uuVDi9/b1xY9TFp9QTDLzdDxJMg/7me8gsBuxf2ibXNg7WPwpD4Qim9R7A5NdiuRGcME9mfvcyipnFnl4RmjT4YoIfTQMkX6J0WW/7+SpWCmtbxxabbWRfbDyhg+nIHo+uZmp1qq4aJ+IWmJ/BUsVYGGJ8rTBpqE+p9ybF4+eIJFTeNhWxXCMDqa0qrtSudUAnNbfrk35hSA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(4326008)(5660300002)(86362001)(508600001)(82310400003)(8936002)(81166007)(34070700002)(426003)(336012)(36860700001)(26005)(6666004)(316002)(36756003)(83380400001)(186003)(47076005)(110136005)(356005)(70206006)(7696005)(44832011)(70586007)(8676002)(2616005)(1076003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4cdb308f-d60a-4e02-1af6-08d95cb26c53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SLOi23Q+MPSbOEPvPLPBmDPVxQiDRIPyZSKL08R837unH/tBEzuw/3emZmyCHo/tj3wgVQhPJ9i/rC5Ix30LRDsokn3zxNJqbtoY90urf0wg7HUxoeMvlfNvLNJxpbWfeF/Aia01qFktfBZCiaCXFP9sC/LI+tk90qbRw3vYxHgJNKtRQzecgRW+Yw41fT+TTreZMdoZSOlQgAJyNP5Gv7JHVYIAMpr1vhF49efVgdIFYQ+Ri6xieR1c8sXjjg6tbn7kJr4j3KHjUK7QFWUdSDfGA1b4bSQkpjl9HRNJClWKfDMfvjtZvGnoeBw8kPM8hP6z6khuekyD0OQD4aPGUtUQiFrsbBOWiTii5i1F10Pue1EYKtTVms3rDdE9MSb+BRdlqKkANdkzkOvUDcexnNeuhYi2yKsm22yvZI02mwEJBj8teB6mQQdW1lq1//niQ7CNUcqj7CJIhKIg/RNwASEfsJgpKatEKb71TqAkekoRPRPGjU239Nyyd6Sgc7UY9rcEID2s8hAPdUw7gjCpcGEeSwyV7etOFq9ovGqYoPjaHWJRPAyVrcUe75L+5p+p3theGJV5GUQs/FvTsB2w8cTK8Jsn075q3mbxnFs6vTRlyt1EjUstP6vafpr4DISmDX+uwEEqPVHWlfe+7FilWyYEI32iqL9mIQf5uZ6q2M4vj8tS4ALqiQGrkgcwff9TqiY9gQ2pnWSTb05IC+75JqwKUojvMItGfAPJ9souOTk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(82310400003)(44832011)(86362001)(36860700001)(2906002)(83380400001)(47076005)(5660300002)(316002)(110136005)(8676002)(8936002)(82740400003)(1076003)(36756003)(70586007)(70206006)(426003)(7696005)(186003)(26005)(81166007)(4326008)(336012)(6666004)(2616005)(478600001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:12.6619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2451caa0-5cc1-473a-39a1-08d95cb27177
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4215

When Xen initialize NUMA failed, some architectures may need to
do fallback actions. For example, in device tree based NUMA, Arm
need to reset the distance between any two nodes.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c        | 13 +++++++++++++
 xen/common/numa.c          |  3 +++
 xen/include/asm-arm/numa.h |  1 +
 xen/include/asm-x86/numa.h |  6 ++++++
 4 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 6eebf8e8bc..2a18c97470 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -140,3 +140,16 @@ int __init arch_meminfo_get_ram_bank_range(int bank,
 
 	return 0;
 }
+
+void __init arch_numa_init_failed_fallback(void)
+{
+    int i, j;
+
+    /* Reset all node distance to remote_distance */
+    for ( i = 0; i < MAX_NUMNODES; i++ ) {
+        for ( j = 0; j < MAX_NUMNODES; j++ ) {
+            numa_set_distance(i, j,
+                (i == j) ? NUMA_LOCAL_DISTANCE : NUMA_REMOTE_DISTANCE);
+        }
+    }
+}
diff --git a/xen/common/numa.c b/xen/common/numa.c
index d15c2fc311..88f1594127 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -405,4 +405,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
     setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
                     (u64)end_pfn << PAGE_SHIFT);
+
+    /* architecture specified fallback operations */
+    arch_numa_init_failed_fallback();
 }
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index dd31324b0b..a3982a94b6 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -28,6 +28,7 @@ extern s8 device_tree_numa;
 extern void numa_init(bool acpi_off);
 extern int numa_device_tree_init(const void *fdt);
 extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
+extern void arch_numa_init_failed_fallback(void);
 
 /*
  * Temporary for fake NUMA node, when CPU, memory and distance
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index e63869135c..26280b0f3a 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -22,4 +22,10 @@ extern void init_cpu_to_node(void);
 void srat_parse_regions(u64 addr);
 unsigned int arch_get_dma_bitsize(void);
 
+/* Dummy function for numa init failed in numa_initmem_init */
+static inline void arch_numa_init_failed_fallback(void)
+{
+    return;
+}
+
 #endif
-- 
2.25.1


