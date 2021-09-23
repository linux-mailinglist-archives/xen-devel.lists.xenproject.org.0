Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2D415DC4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193818.345303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS8-0006Yk-9v; Thu, 23 Sep 2021 12:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193818.345303; Thu, 23 Sep 2021 12:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS8-0006UY-5C; Thu, 23 Sep 2021 12:03:48 +0000
Received: by outflank-mailman (input) for mailman id 193818;
 Thu, 23 Sep 2021 12:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNS6-0005KP-Ua
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:46 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94fad7ee-6acf-4700-ba31-be03a623c15e;
 Thu, 23 Sep 2021 12:03:44 +0000 (UTC)
Received: from AS8PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:20b:331::17)
 by AM6PR08MB4151.eurprd08.prod.outlook.com (2603:10a6:20b:a2::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:40 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::1e) by AS8PR04CA0162.outlook.office365.com
 (2603:10a6:20b:331::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:40 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:39 +0000
Received: ("Tessian outbound 8b24208353e0:v103");
 Thu, 23 Sep 2021 12:03:39 +0000
Received: from 82cee3a26ade.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6607CB9A-6AB8-4598-A9DB-7D96F11BFD3B.1; 
 Thu, 23 Sep 2021 12:03:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82cee3a26ade.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:23 +0000
Received: from DB6P193CA0013.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::23) by
 HE1PR0801MB1787.eurprd08.prod.outlook.com (2603:10a6:3:80::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Thu, 23 Sep 2021 12:03:21 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::39) by DB6P193CA0013.outlook.office365.com
 (2603:10a6:6:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:21 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:16 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:15 +0000
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
X-Inumbo-ID: 94fad7ee-6acf-4700-ba31-be03a623c15e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPIL4uOxlIkWYH7gl2Qha1lsYRJ9hENlygoMT/WdWDg=;
 b=FPUwJr6Bcqw32TxYJGyhzXXnUnlgvka6mmIAwg7QWWOzKrzDBLsadKhY0GpjNKHZAgPp5PaP6VR5oQ8nepXvBiTAKg1npKDNzfVDvrT/bGYpyhbJLWd76gl50YaIqaO8+cIyvM6neu4RDlQAo7K3z+dsMCxk9WXVz4tiP8NXJfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: aff0860eda26db16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WguwpjDgffGzGmCOjpptiVNbdB5ARbRxQBkFoQkXWga29AVz76bmf/b4Bb3VJEjc2xn/X5tuolfiCV46JQwJmOPvKrZxw0FHK0SY8shufHrdUpDDhE8Itca1TIMoNNAaUpJjTFqtC6HAXp7RhyfkzzKaUEX5dRK6b+eAcXI3G6D8E2TzS9WFyOCE/pJLf0cFW0kHgboi4xnhG1X4ddtNLjSJT0qjRSQ5KWRfiVQtAvXN+Apg9uv4mL+ggBeu/Mkb5UEnAuDW8DVAkvjlBxIKd0Jjh2G80KDSpo+WztJjDJfcRI0Oo+Mx1GuYwfL/6xeH8oUnNT289h+XxPqSxro9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qPIL4uOxlIkWYH7gl2Qha1lsYRJ9hENlygoMT/WdWDg=;
 b=aG9cg9/8imlY/aA0JURYkQFoGnFEakVZtjh8WoFVwECH8cvyg1J7UAUyNpFSqUcFhLngqZx5wQU3y/BQIzA4M7slDS98yZazGwjW+Psbsz+dUI0mke8nkN58Krx3uFb7q1o9ASRTwY0u4qTX1Xrya9nmHAAE71itkmeOshe3yClGEn92xCePffFu3H8gK9E0hPDLXqj0gIEbG+DIhP2IO2jdBIENQDht3v2Y4ivhBfsU7aRyNeH8a4ppAY8LPg9bFBXQ3pPzz84SzljcRZ2nRNjetQuwjch0S06ndZphkEw1mm8Mbqd4T65H2cyiN7WIj77Qaon2tN4UMfcJdWKJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPIL4uOxlIkWYH7gl2Qha1lsYRJ9hENlygoMT/WdWDg=;
 b=FPUwJr6Bcqw32TxYJGyhzXXnUnlgvka6mmIAwg7QWWOzKrzDBLsadKhY0GpjNKHZAgPp5PaP6VR5oQ8nepXvBiTAKg1npKDNzfVDvrT/bGYpyhbJLWd76gl50YaIqaO8+cIyvM6neu4RDlQAo7K3z+dsMCxk9WXVz4tiP8NXJfY=
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
Subject: [PATCH 04/37] xen: introduce an arch helper for default dma zone status
Date: Thu, 23 Sep 2021 20:02:03 +0800
Message-ID: <20210923120236.3692135-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b836271-0681-4ed1-e560-08d97e8a2e78
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1787:|AM6PR08MB4151:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB415103EC7436240FECE597C89EA39@AM6PR08MB4151.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AOwDhD/TmYkLa/GO9jAAw9enNGXp5w83DjDe55s6mMacHPzb3G3SpB0sdBpw3x4oT0udK7m0Yb2LcH0wleZNSLWq2ANRhD+LUAcUhMVUEL+ZcpRfGFMTuswmkaTzoiXwjjE2zOHDVx/PtTTRmwxaDgF3K+J272WXTW36Vf3LK+2pdh4OaFXMYKdX5p2arNPMEk/0Hrj8tz5uiPnSS3yhgigdUQqqBKP5yV8T+pHKBmKiJZKFNYXRkNmCXB5VZ8tj6uq3jzznV0DOhBMEkRx32DF2vLP+2BQjLoFaPg2sRRirNmY58lhL4HXnRMMUjBmScDKexpN63qzC3UbbMy8oNINmyZAOl0NJNk6Umcb784nvKBA3bRcxNcgJq2KOkKIDeVOOqLkIEQNrbdugHHxKg4sfI/pXIX7mN/j3Q46b84e7XY3KUXCmapMdxk7lEa4xgSUKHvU/UmtmFWWtB4NqgrirOsW5BtfyfLPEAaxauWra9xizQfYR95Eta4dk42YXOTSDK9U2qqhuz0v/UAvFRbppHW1PZc/QbI6zE0AB1NuTgNwl32+8B5Fu7xscL3/uQ8XNx4Ge06sLKcQpQEbIhoZl+eYwvOYzW3ZmhtW3y+meW5f6YtV67OZFanm+2Cw5HjhYG2XKoUySQ08wGzJQXbm5brXU3Q4e+ErLUltdJzB3rhi86iS8GZugxekRT0VHfOIKQH22QjQ3Wrm93GdrNkvBC0onMwCxt6yOuzEuZvM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(8676002)(426003)(508600001)(44832011)(70586007)(82310400003)(86362001)(2616005)(316002)(336012)(81166007)(8936002)(70206006)(2906002)(4326008)(5660300002)(186003)(1076003)(36756003)(356005)(7696005)(36860700001)(6666004)(26005)(83380400001)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1787
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52c3eb3d-7cce-4a24-3bff-08d97e8a2333
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ulnXWjjtAl+f0X5ZF5BmbiTCTSr+5XK1fnakEfgIet6V9D04b6BkuJF1b5qYAJQ8SKMJVYNOvaHNUVWBueDcO+XEJ/fAVQ3S6FK/1PHlHthiuoux/g3n9qRbOwk70SPgBTguodYvvd1dOKM+WAQXNy0Ub2MvM5TtLtEz3+uh8LVqB9E6d5SYQ0hVmFKuDilyGE/RHknFGr95UtfF5a1Z7NW8wxya0pJrx2GhoW7a60XXDr0WS2SST+WIZDOdBUuJYSZJX0vx7eZJxmEYqSOmmdh6dBnP39mrpuFfT1z7inQJEbPqtREJuPoy0V49szpR4nGu1XshumKslqK8mjLnjqlBewXSQ3oOU/SoRyiRHd/Si5At+7M4GdzCkRPsdUtzXlAWchWhDpbIvSMJm9zQguA2MPcj/7p9X26jUQzBKOc9ka0ggLajt28SUgdUWAz7XvrzVxpQOGPrXDTbDO/w9qx+gBYTA8QgGBjFvK5u8FOk+UJBeuYwCdoeVDRwTG5eCiY5eRs5yjFIeOktXNzd4KI8/188dCAb1NsTlrFbC3P4iQocYFyvccVus6xzltDTkI3cvHNta9u65lzF0nwqgu0hBfRzfYcf9tHqoyl/ec9P/kPRzeW9NZmY8DfOYXPqblkgI4Ppd238SeU7JOlqWN8U3Awul+M4NHxHgoOk6wsJyasITQ1j5qhs4dMAYigyV3BUoXCG5OuwumsH3mrhzw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(81166007)(36860700001)(426003)(5660300002)(508600001)(336012)(82310400003)(2616005)(2906002)(6666004)(36756003)(7696005)(8676002)(26005)(83380400001)(1076003)(316002)(110136005)(44832011)(70206006)(47076005)(70586007)(8936002)(86362001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:39.8789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b836271-0681-4ed1-e560-08d97e8a2e78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4151

In current code, when Xen is running in a multiple nodes NUMA
system, it will set dma_bitsize in end_boot_allocator to reserve
some low address memory for DMA.

There are some x86 implications in current implementation. Becuase
on x86, memory starts from 0. On a multiple nodes NUMA system, if
a single node contains the majority or all of the DMA memory. x86
prefer to give out memory from non-local allocations rather than
exhausting the DMA memory ranges. Hence x86 use dma_bitsize to set
aside some largely arbitrary amount memory for DMA memory ranges.
The allocations from these memory ranges would happen only after
exhausting all other nodes' memory.

But the implications are not shared across all architectures. For
example, Arm doesn't have these implications. So in this patch, we
introduce an arch_have_default_dmazone helper for arch to determine
that it need to set dma_bitsize for reserve DMA allocations or not.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        | 5 +++++
 xen/common/page_alloc.c    | 2 +-
 xen/include/asm-arm/numa.h | 5 +++++
 xen/include/asm-x86/numa.h | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index ce79ee44ce..1fabbe8281 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -371,6 +371,11 @@ unsigned int __init arch_get_dma_bitsize(void)
                  + PAGE_SHIFT, 32);
 }
 
+unsigned int arch_have_default_dmazone(void)
+{
+    return ( num_online_nodes() > 1 ) ? 1 : 0;
+}
+
 static void dump_numa(unsigned char key)
 {
     s_time_t now = NOW();
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5801358b4b..80916205e5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
     }
     nr_bootmem_regions = 0;
 
-    if ( !dma_bitsize && (num_online_nodes() > 1) )
+    if ( !dma_bitsize && arch_have_default_dmazone() )
         dma_bitsize = arch_get_dma_bitsize();
 
     printk("Domain heap initialised");
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 31a6de4e23..9d5739542d 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -25,6 +25,11 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+static inline unsigned int arch_have_default_dmazone(void)
+{
+    return 0;
+}
+
 #endif /* __ARCH_ARM_NUMA_H */
 /*
  * Local variables:
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 3cf26c2def..8060cbf3f4 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -78,5 +78,6 @@ extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 void srat_parse_regions(u64 addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
+unsigned int arch_have_default_dmazone(void);
 
 #endif
-- 
2.25.1


