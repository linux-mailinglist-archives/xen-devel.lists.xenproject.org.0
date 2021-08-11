Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6ED3E8E90
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165642.302736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQT-0004tI-QT; Wed, 11 Aug 2021 10:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165642.302736; Wed, 11 Aug 2021 10:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQT-0004oK-IP; Wed, 11 Aug 2021 10:25:33 +0000
Received: by outflank-mailman (input) for mailman id 165642;
 Wed, 11 Aug 2021 10:25:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQR-0002Qj-F0
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70d698ea-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:25:25 +0000 (UTC)
Received: from AM7PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:110::18)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:23 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::6c) by AM7PR04CA0008.outlook.office365.com
 (2603:10a6:20b:110::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:23 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Wed, 11 Aug 2021 10:25:23 +0000
Received: from cb0805c421e9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E34D7B39-1354-4DD9-9092-6B475D6125D9.1; 
 Wed, 11 Aug 2021 10:25:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb0805c421e9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:16 +0000
Received: from DB6PR07CA0191.eurprd07.prod.outlook.com (2603:10a6:6:42::21) by
 HE1PR0801MB1659.eurprd08.prod.outlook.com (2603:10a6:3:86::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17; Wed, 11 Aug 2021 10:25:13 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::67) by DB6PR07CA0191.outlook.office365.com
 (2603:10a6:6:42::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:12 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:51 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:49 +0000
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
X-Inumbo-ID: 70d698ea-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TClhxrxl6qSnMv1gYK81n4014+4dXYvGoukVIaGd8Xw=;
 b=KzR68+vexDymW0QDHLVzL/AzITDSfRkxFNhCfbF3g4Nsis7j9DyB9cz8L3ZlmxUMMfl6EN7+4JGIxNgcZVJhYsKxVNXZCxRePN34JtXjLVjcsmgMgp610v7GVIsh9A1poQjFYp5suFyHyZMUlgCHkJh1NuKK959KCCwJksii42w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d78d04ce681d2b3b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZdJ33f4gjR0SwyXbINPHOrDgYW0+BwMMNHS6W6eLF9zusuCsARrdD8hbIsUJSW0fiNVAGTPNKwgeuKz1nRpQS8WHDZG3FkMu/3rUt7ro/7Ob668/04c35/hhkr24cT8B79jc9CfWU8fo2+g72punwIsucQ1xdXIGGE3j+H3Z4MLZn3tGEBy6Ov5ecFisEpG+EE2WjPmvchOn6f5GipaI+ALBuuYQkhyspJOOsbpafH9zPytXxrozzleB/9zZKWtr1j0Dm4wFhlVZs8x4BlBc9BUqZN41718OwU+9f1Sb5pc4IaShk1e7I5WLWfJK3oh1nUWeIHZ7RhRJA90CzaK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TClhxrxl6qSnMv1gYK81n4014+4dXYvGoukVIaGd8Xw=;
 b=mu20WjhuKQSZBtltK3rqBUTo/bpZXEzdglvErrzJ+fe0pBwE8ffN5dksfDz2l5LaT6BrawfaWK3DD386AhLDcg/NmU9hi4AomXy4kabO0SJoMeXSCMiOTExtlClCvieVGkRDDgGr3sjoeOmApnChI6HD+durNfjtTYeShx3aEEujYOvI3R1L5+QiklRpA+z+UpTNH9abkInsjZi6c9uvqi0NSH9Wqsqu1YlT2CL8zP776OaGSHwYgbUv9Ev3xmzyl9w86ZzBiMour4SxAewpB8ASM3roqXTQK61GXuCQ/1Nw+4ZeXoZjlT8hDqahFVtoGfIBZJOMkXi/iXOghRVs/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TClhxrxl6qSnMv1gYK81n4014+4dXYvGoukVIaGd8Xw=;
 b=KzR68+vexDymW0QDHLVzL/AzITDSfRkxFNhCfbF3g4Nsis7j9DyB9cz8L3ZlmxUMMfl6EN7+4JGIxNgcZVJhYsKxVNXZCxRePN34JtXjLVjcsmgMgp610v7GVIsh9A1poQjFYp5suFyHyZMUlgCHkJh1NuKK959KCCwJksii42w=
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
Subject: [XEN RFC PATCH 08/40] xen/x86: Move NUMA memory node map functions to common
Date: Wed, 11 Aug 2021 18:23:51 +0800
Message-ID: <20210811102423.28908-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed566965-dbcb-4644-869c-08d95cb2542d
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1659:|AS8PR08MB6280:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB628016426997B039350B551B9EF89@AS8PR08MB6280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mjC5l9u2glMuoqMqEFihDEpYCZ0lpPgWP/CBz4PWdv7jJyMZL1JOgpIYuaoBFb6NsE5vkQoY16CE7RjiY7aZV20BxK1N4gGMWHQmtasLgYIz1bjRKmjDiMfL92NZL01D6bjryD0VcDKJrndRGZRj8PSFbB+CXuHS/loDEtOJfAjgiW05NA6UglklyIcbyBEBkfk0anbl3g1T7kgQMlws9Sh2BH6ZGdIJ8pNIcbpxAzDfqb1rL5iiRv1ZYSjW5M+BFsxcM3xASyg4yKAVH7kzx/Y1tbOsSojQ0aCLKxGHkGZlNoFvigfIslNVQx1EEo+pAsd5VxyQTHioRFqrMmZJFRFK0rhLiUJAREdI+kYepvCVwcDUK20+sXIgk5XLPkmE6Hlp5fu6DS2v9NOE39d/KwFLyVfCGaANvaH9HWkYMTejDdpuXUDbjtSvG5+sab4exyK62dllWzpXRwR3qUUwUVpr+Nr1SLzkZwE+ELyk/imPdSRaPVW4uCUPE0K146Y+/KHXXzGSxMzAHpstelSvxodM+wz7r4aNaztRE7tgh/CkILTzrKuClolrP6hs1QPe2MAlc2LDh0wsoteqdBrO/SgvJc9gJ/ilNN3vfmZmlzA4rpDDoiEis4QvhRVCrvimGy2YRiboNvdCkBFYglVyG6bB+pApxB21E0zvZR1AcXjnQSP7bjjCI5kF0Viq3iv7qNWTpZdH5Lp6Nw3K2Bigd/2ZHOAFTHU+7rLIq+iAPtKQZng1nwyGY3ua1u30Kx3cMOuUIkWBy60PCHXe6ltGWj2a0/jkM9bFgm6YlI70fPE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(36840700001)(46966006)(336012)(1076003)(2616005)(26005)(426003)(47076005)(34070700002)(44832011)(81166007)(186003)(82740400003)(86362001)(4326008)(8676002)(5660300002)(7696005)(83380400001)(110136005)(70206006)(356005)(70586007)(316002)(36860700001)(36756003)(82310400003)(478600001)(2906002)(30864003)(6666004)(8936002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1659
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f8ddc93-d814-417a-dddd-08d95cb24ddd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eVa4CFSYupvRPt6wFaAbpzbCKiRS5xW5a1b+lO86QjDGG2E+jD5pJIsuCS+zU7YnN0C8A2Uj9Lox3sF1Ol23//lsLww/GErYPnHUGbopCK5dwjpLwixCgVCKpfjEQebAYB47IPS8GS+zgEQG1S6MYQ6GNS4bHCkqSR053RvrZwQxNfzxIYxN6tQa2tgMGIoGKpGhzVcLkb+6WbF4/L7OCgiyikjfrjxlfgOiUyuJ/MX4EFVrh5I0qIK8wkKHlu4bLZt1wYnC/haO20rLWfePb1ux+oSQQy1lyHhPfng0ooGjI29N7OIDpEDjUYSxJOSPD6y3WVwfnCGYZxgqymp3uW31Sgj8sksr5tTAX6ZU3rI9NwopRwRl2w+QnLk2eAWMN7+aosV9HU8KTUUOrBHdYsEpQ9AjkxOkTrV52sEaBDa7vHDY5DaNcTKfbYCHOoPN6QDD1o3QDjkCBdeoud4nZoR3alrxlLyWkIpWq8vjlHwPd4vP0Eo6KXEEYChBX4oDdAAQkoRU0eBJLWqGVUoncrK/R+XWnVnVLBHEeNz+FtfQmOl4YloFoNqvyzGS2dyqkBiEo4+cH7waArGPz/QHXFPOTT3fu2DPBzyr9YfUuFbpYPBtFD8cO368LVu96s+1LGHClL3oxv5ec4CuxnJMgzZQEwSo5zC4Tkf3lrFVnni/dap4RMIBJhV//qn+OhEjbimTxH6Or6Z9zEDA9dHsO7jUAiaGtQLBFNdqYWstHCY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(46966006)(36840700001)(2616005)(26005)(478600001)(5660300002)(82310400003)(6666004)(4326008)(82740400003)(7696005)(44832011)(336012)(426003)(186003)(83380400001)(36860700001)(8676002)(36756003)(110136005)(1076003)(70206006)(8936002)(70586007)(81166007)(316002)(2906002)(30864003)(86362001)(47076005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:23.4260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed566965-dbcb-4644-869c-08d95cb2542d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280

In the later patches we will add NUMA support to Arm. Arm
NUMA support will follow current memory node map management
as x86. So this part of code can be common, in this case,
we move this part of code from arch/x86 to common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        | 114 --------------------------------
 xen/common/Makefile        |   1 +
 xen/common/numa.c          | 131 +++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/numa.h |  29 --------
 xen/include/xen/numa.h     |  35 ++++++++++
 5 files changed, 167 insertions(+), 143 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index d23f4f7919..a6211be121 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -29,14 +29,6 @@ custom_param("numa", numa_setup);
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
 nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
     [0 ... NR_CPUS-1] = NUMA_NO_NODE
 };
@@ -58,112 +50,6 @@ int srat_disabled(void)
     return numa_off || acpi_numa < 0;
 }
 
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    unsigned long spdx, epdx;
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx < epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start and end addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        bitfield |= spdx;
-        nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = (memtop >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
 /* initialize NODE_DATA given nodeid and start/end */
 void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
 { 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 54de70d422..f8f667e90a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -54,6 +54,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-$(CONFIG_XENOPROF) += xenoprof.o
 obj-y += xmalloc_tlsf.o
+obj-$(CONFIG_NUMA) += numa.o
 
 obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
 
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..e65b6a6676
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,131 @@
+/*
+ * Generic VM initialization for x86-64 NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/mm.h>
+#include <xen/string.h>
+#include <xen/init.h>
+#include <xen/ctype.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/time.h>
+#include <xen/smp.h>
+#include <xen/pfn.h>
+#include <xen/sched.h>
+
+struct node_data node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+int memnode_shift;
+typeof(*memnodemap) _memnodemap[64];
+unsigned long memnodemapsize;
+u8 *memnodemap;
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      int numnodes, int shift, nodeid_t *nodeids)
+{
+    unsigned long spdx, epdx;
+    int i, res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx < epdx );
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start and end addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static int __init extract_lsb_from_nodes(const struct node *nodes,
+                                         int numnodes)
+{
+    int i, nodes_used = 0;
+    unsigned long spdx, epdx;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        spdx = paddr_to_pdx(nodes[i].start);
+        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+        if ( spdx >= epdx )
+            continue;
+        bitfield |= spdx;
+        nodes_used++;
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+    if ( nodes_used <= 1 )
+        i = BITS_PER_LONG - 1;
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
+    memnodemapsize = (memtop >> i) + 1;
+    return i;
+}
+
+int __init compute_hash_shift(struct node *nodes, int numnodes,
+                              nodeid_t *nodeids)
+{
+    int shift;
+
+    shift = extract_lsb_from_nodes(nodes, numnodes);
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%d\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index bada2c0bb9..abe5617d01 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -26,7 +26,6 @@ extern int compute_hash_shift(struct node *nodes, int numnodes,
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
 extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
@@ -47,34 +46,6 @@ static inline void clear_node_cpumask(int cpu)
 	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
 }
 
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
-
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
 void srat_parse_regions(u64 addr);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..39e8a4e00a 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,39 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#if defined(CONFIG_NUMA)
+
+/* Simple perfect hash to map pdx to node numbers */
+extern int memnode_shift;
+extern unsigned long memnodemapsize;
+extern u8 *memnodemap;
+extern typeof(*memnodemap) _memnodemap[64];
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+#define VIRTUAL_BUG_ON(x)
+
+static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
+{
+	nodeid_t nid;
+	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+	return nid;
+}
+
+#define NODE_DATA(nid)		(&(node_data[nid]))
+
+#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+				 NODE_DATA(nid)->node_spanned_pages)
+
+#endif /* CONFIG_NUMA */
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


