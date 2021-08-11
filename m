Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A293E8EAF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165714.302901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlW5-0005ZZ-76; Wed, 11 Aug 2021 10:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165714.302901; Wed, 11 Aug 2021 10:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlW4-0005Rv-Me; Wed, 11 Aug 2021 10:31:20 +0000
Received: by outflank-mailman (input) for mailman id 165714;
 Wed, 11 Aug 2021 10:31:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlTr-0000BQ-Jj
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:29:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f69d0d80-9815-4f0f-b344-10710924f086;
 Wed, 11 Aug 2021 10:26:13 +0000 (UTC)
Received: from PR0P264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::19)
 by DBBPR08MB4508.eurprd08.prod.outlook.com (2603:10a6:10:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:26:10 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1b:cafe::16) by PR0P264CA0151.outlook.office365.com
 (2603:10a6:100:1b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:10 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Wed, 11 Aug 2021 10:26:09 +0000
Received: from de6e02881e24.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84F16701-ED76-4209-BDE7-67B91679EADA.1; 
 Wed, 11 Aug 2021 10:26:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de6e02881e24.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:03 +0000
Received: from DB6PR0201CA0011.eurprd02.prod.outlook.com (2603:10a6:4:3f::21)
 by DB9PR08MB6796.eurprd08.prod.outlook.com (2603:10a6:10:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:01 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::48) by DB6PR0201CA0011.outlook.office365.com
 (2603:10a6:4:3f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:01 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:01 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:52 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:50 +0000
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
X-Inumbo-ID: f69d0d80-9815-4f0f-b344-10710924f086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmBrAhy7WLonyjAWWI83mwWLyuxAd98SyWeYC4/1lnY=;
 b=0SuPGx4kP3ePgyyE3YPlv04R6Rfsw+iRcDwt780/laCKSANY3t+7T63Me1Mg7Sloi2simzZKfecILY7v5xVQ3Ti0Fq4I3zHMXEsKH3I3MdKAk83q2e4C7FZv/RUnHvQxcduPNDRFOvFUYasWCAid0/g2I5D4uSwDz26FIWvsIf0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77d86dbcfb6f5e2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np8irdwm+BAGgGfXMO42iTRJdK0LJMMvkJCAghFCAkQOI2VBW8rvcVZVfdKQN+62VAoIVW8GeDz55bSxvTZ95j9wxFMOjGOeKLqTMDFwnjFXc/0fkEmD3G6ojKzlHM7VQF33G8ZvG33K3dJQsXPLDjOSArQ5m5DmTOEhiALiDOdZ3Tcu7Th6j5V2MJsAk7USMwQSWnwk8F6O8GZUGiwxDwfSlS+r08xSwDGRjx2nYImbeFCSxtWXsplx1DzHz8woeJQlGidrK0+NqgV/sOAcPdskX4LIMsOsYkUxHQmEQWVLgDS1KALbsnaBfhTotaaxfFAWtcYsGx+tHLw8R8Fyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmBrAhy7WLonyjAWWI83mwWLyuxAd98SyWeYC4/1lnY=;
 b=mxkt+GiwNUH2ldxebRUoWZWnTfGoh0iKyP+JjOAixBA4KApmrXucGbrOXkhc2nadjDz2NVHM84yJMiizMjX7y/QBFM94FUouHU1/mPRRnOWcn6lSlUUXV1Wbuwf839uyex6AeTWhUEUnctI1Gylz27efxG61uLy8DFoxE1dR31KuZ2CGjM28wEL+VUAlOPmIDDWMcNEgrpghE0SG66b+TactjejK+6aK+qAYDtjAMSc8enpETH4qXVIAGs3f3b18e0acBZ5Ss02Z4y75mzJ1ZgdRaxF4eeKhkettD0OjtECDBkh4ubQ5EXm/RXAwfePryLlCqkh5YJwiDEyB1AVErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmBrAhy7WLonyjAWWI83mwWLyuxAd98SyWeYC4/1lnY=;
 b=0SuPGx4kP3ePgyyE3YPlv04R6Rfsw+iRcDwt780/laCKSANY3t+7T63Me1Mg7Sloi2simzZKfecILY7v5xVQ3Ti0Fq4I3zHMXEsKH3I3MdKAk83q2e4C7FZv/RUnHvQxcduPNDRFOvFUYasWCAid0/g2I5D4uSwDz26FIWvsIf0=
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
Subject: [XEN RFC PATCH 33/40] xen: export bad_srat and srat_disabled to extern
Date: Wed, 11 Aug 2021 18:24:16 +0800
Message-ID: <20210811102423.28908-34-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 120cf18a-1854-477b-b679-08d95cb27018
X-MS-TrafficTypeDiagnostic: DB9PR08MB6796:|DBBPR08MB4508:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB450863BE6D9D7874FA54973F9EF89@DBBPR08MB4508.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:530;OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3HMucFgcMqqWdO0mD2yewyB4A+fBXURZEqBt47uItVUY1ZqZx3mZkOYJse8fe9lL8Ya6RPKnBmHQtvhI5ZvW1C5nz7zwOzcjKc532VfXpYmTWqR3NaHtbQKqAtEbTUGNnkA/q4HsmsNSVBLjel//gdbgAP51s3WZjP9uOt/+WgKPgTALsqsEz3utnswqUonIjvEx0BHYJmgcjVaBX7BDGpFOLqzWnLM7xtQ6SzMP4JDagW2xGAgW2kmDXhDhq5jhl21Xs4OE43BlgXvKYfJ88E7HnIB5WpovOpB23Q5Jxg1ajgjX1AW50FaUgJjzhSCQCYXVjxFZpJRVRCH2/DVBCKXXziZGJKsTHfurfNhkPmeDf7Oea0cSsfHs6GwmGJ6tn0VhmlJEnu/UnoUBjldHS8uO4BZZ47Z576Bzyodztz4Z2K55RqYpRuF3CqrNTiD2CXQqtkW4fzHxpKp16CucJ1+O60Ex6fJaEKO0iizx0E14UuB8Yk38X2rn4FAxfht+rCkZodVGh6cyHbJIKuJPt2+WwERavIb9R2TEKoFemUAnKs1mtBtQxM6CjTX9eZORw/XKmys9ltt4FZrkphcnT6Dvts8dqBZ9++tR93Y2L8LF87vjfPj3WIdmCS2gh79oS3qFkj4eRYLWcyQ8GFJ/I+5sjLm20WQ5fAhVx3EMeOoZus7aUzwK3NJarZ36d31GD2SwJaWXonpStNUjLZj+ePnlwQ/puC87/XDpobS2QDQ8oZtT4t3R73+5rfKfQmsC/2vbbcu4py8MYpR8MFbkvsvvXY1O4Tu3kF8fl0BqSmI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(2906002)(186003)(70206006)(8676002)(81166007)(4326008)(336012)(83380400001)(70586007)(82740400003)(8936002)(478600001)(36756003)(47076005)(110136005)(82310400003)(356005)(7696005)(26005)(1076003)(36860700001)(2616005)(316002)(34070700002)(5660300002)(6666004)(86362001)(44832011)(426003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6796
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0538a474-f12f-418d-7303-08d95cb26ad0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qiTE+s8meOUL4M8YUBDqWb6KYBlwNCj8rGuGRu2Fd708qzNQgC45iXFFLYiyVj0r/Eivzk8t8BodM8LdVcouih9J5iSsqJph22MKs6E9NWP+HAw+4ed08SmGlyjvmncB2WbD4or93aErRb0VbGPnKTNNWYBsiMJGJKMYF/bwQjuzYGqZ8sY0RBRL26v0nW/7Q7n2vPgx8Q5xH+bESOUd72r3ULE8K+iI6tc37aPniwbXuibQHs1xOj22LxwaHYyUEPa+P5dnBNCDkvLNBw5AzMXHgPYKHND4Z5fcXmxd4E8M5V9wJ+EWdExIOKXc4TUx26YuI0P2OPIbG07jlV3cgEPI8FW/46DGHNf6mD9pobp808ZrhWJvitvoz+BRQz17NHwAbSvxuOhWswW4E/GpN2UaWWHCNGS+cIcY6psgdhRhD6boYNvAf7t1pHEbuAxhlVCSkO7zJ52Uw63qOAgVcu9F/5yZbpu3vQnDSPNWpGvaW6tuZqmvZ7PE5qW5WnKwbE/oPsYlW+phd7a1D85hSGvMIPKo0R/HbnKAGaxng3Zv2jivLJh+ortD/nGFzSUjA3qjoAqbmj9Xm7gLEGdLvttOQcfy4+IYO/tF1QWIoGmHG1xr9wDvXbRbFDGoEhuvW6I6pYTYg0fG3MjoHYHFoZbXgLTce5T0KXHCu/EWiQHbv1bKNSvWM3pBzgmHukxtrmcFrUt87OHf6cVYzCJCfV2jGgqOJ65UZHPZ+X8v+NA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(26005)(70586007)(1076003)(83380400001)(186003)(70206006)(110136005)(4326008)(5660300002)(47076005)(7696005)(36860700001)(316002)(44832011)(2906002)(82740400003)(81166007)(2616005)(426003)(336012)(8936002)(8676002)(478600001)(36756003)(6666004)(82310400003)(86362001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:10.3088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 120cf18a-1854-477b-b679-08d95cb27018
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4508

These two functions are architecture implementation. But common
code out of arch will invoke them, so we export them to extern.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 4 ++--
 xen/arch/x86/srat.c             | 2 +-
 xen/include/asm-x86/numa.h      | 1 -
 xen/include/xen/numa.h          | 2 ++
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index f74b7f6427..f7f2eeebc3 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -26,12 +26,12 @@
 
 s8 device_tree_numa = 0;
 
-static int srat_disabled(void)
+int srat_disabled(void)
 {
     return numa_off || device_tree_numa < 0;
 }
 
-static __init void bad_srat(void)
+__init void bad_srat(void)
 {
     printk(KERN_ERR "DT: NUMA information is not used.\n");
     device_tree_numa = -1;
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 3d4d90a622..c979939fdd 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -97,7 +97,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-static __init void bad_srat(void)
+__init void bad_srat(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index e0253c20b7..e63869135c 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -13,7 +13,6 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
-extern int srat_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 094ab904c9..490381bd13 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -75,6 +75,8 @@ extern int compute_hash_shift(struct node *nodes, int numnodes,
 extern int conflicting_memblks(u64 start, u64 end);
 extern void cutoff_node(int i, u64 start, u64 end);
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int srat_disabled(void);
+extern void bad_srat(void);
 
 extern void numa_init_array(void);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
-- 
2.25.1


