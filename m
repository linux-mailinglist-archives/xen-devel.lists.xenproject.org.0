Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C5387139
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128635.241525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBd-00053w-2m; Tue, 18 May 2021 05:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128635.241525; Tue, 18 May 2021 05:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBc-00051f-U2; Tue, 18 May 2021 05:22:32 +0000
Received: by outflank-mailman (input) for mailman id 128635;
 Tue, 18 May 2021 05:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisBb-00019F-7m
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 599ea074-c24c-4eab-97e5-6cd0e1c41332;
 Tue, 18 May 2021 05:22:18 +0000 (UTC)
Received: from AM0PR04CA0120.eurprd04.prod.outlook.com (2603:10a6:208:55::25)
 by DB6PR0802MB2598.eurprd08.prod.outlook.com (2603:10a6:4:97::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:22:16 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:55:cafe::61) by AM0PR04CA0120.outlook.office365.com
 (2603:10a6:208:55::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:22:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:15 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Tue, 18 May 2021 05:22:15 +0000
Received: from a8228ba31155.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22C9CDE8-865D-4F08-95D8-F9829E163804.1; 
 Tue, 18 May 2021 05:22:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8228ba31155.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:22:08 +0000
Received: from AM5PR0601CA0044.eurprd06.prod.outlook.com
 (2603:10a6:203:68::30) by DB7PR08MB3338.eurprd08.prod.outlook.com
 (2603:10a6:5:1b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:22:07 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::fa) by AM5PR0601CA0044.outlook.office365.com
 (2603:10a6:203:68::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:22:07 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:06 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:54 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:52 +0000
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
X-Inumbo-ID: 599ea074-c24c-4eab-97e5-6cd0e1c41332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8m43zx7x8u+u5yr2EVRgwygvKFWL/IN38zVtxS/SDg=;
 b=JmWBMpF4NraHMaTK5kI4Os0kGwewpd12qeakHYdubxm7l6C+2JPRidUwONaWFZCnZWED5YQ0woyRwGXmurm0kR2SASMrgiUDPZKr+7yF7I/aGHZ595nJNQ2yVvIfqij2lWLb4DmWElWFp2fd7KABZsu/zmyIGtvxG6lL9y5CH0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 146620f27eb284f0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4jPM40N69hYTMhvI75fN7KlbGig55PO4u/gP2b4rY39s2UlT/79cy6rg4WJ/6JW87hFyDt6XeUj27W9h/tqYouu3xUXK/9uThzGT2fNh9fmdItfWuDnN1feroRq8MkEJYZxzp1xqwj4JNOgH62cgPAjWNl8QdJozwtBSht4UKXrqqSyfKyy4E7hPrmqLBK7dZDEoKTRfgUDymO/Knt5RKzsSQpczJVQJ5tRgJctwCRD8s727F3IU9XxBZNWu85pNCAxUtL1+P1S3eQV5lP3glzzrmRexmBY4oVSvwx9StHeIEQUz4tpf/bgzoGhEgOLiBspgIshVFx9YfujeIYbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8m43zx7x8u+u5yr2EVRgwygvKFWL/IN38zVtxS/SDg=;
 b=cpd3Lj3Jfi+yoTAoxfXZTRq10LI3pjZecetiQNJTbNX2UyJwG79TrFEG6YWLX7qUwD4UD5JYasTyiaPw/obKJ/c8PBYAkSF2MKm74RceSbgTR4ykXX3h/mIH/a9zMwqmabQtxTA/NPeQbsvlZhER46ZCcC+v7WrKEg6t7Q5cMEKO4K0GPDMIaeRc7CSXDTgDiPpyEagIyk33p4OByhZaKYwj7V4G1jJNMY6BAG5/+jeS4MT/yBgQKOtSysC+h2E7hKYX/KoYmMABsPCJVMg6s4x1zV3bdKQ8m0ys2AmyrTXgXtbIl3FZcfQJsMPrY3wlXq/HDg5kUypgNA2O/Rb+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8m43zx7x8u+u5yr2EVRgwygvKFWL/IN38zVtxS/SDg=;
 b=JmWBMpF4NraHMaTK5kI4Os0kGwewpd12qeakHYdubxm7l6C+2JPRidUwONaWFZCnZWED5YQ0woyRwGXmurm0kR2SASMrgiUDPZKr+7yF7I/aGHZ595nJNQ2yVvIfqij2lWLb4DmWElWFp2fd7KABZsu/zmyIGtvxG6lL9y5CH0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH 09/10] xen/arm: parse `xen,static-mem` info during domain construction
Date: Tue, 18 May 2021 05:21:12 +0000
Message-ID: <20210518052113.725808-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a905f5fe-fd47-4f2b-247f-08d919bce630
X-MS-TrafficTypeDiagnostic: DB7PR08MB3338:|DB6PR0802MB2598:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2598BAE51FDC5CD8F03789E2F72C9@DB6PR0802MB2598.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jnNDjiU2nU/HY1AORxFCFCTAGP2pCTFhyhvse5NTOrWByXqEdOq2FC0Jz82+NjyAvxBbf96Qsy1/M7pk4Fkd0u2hvPI4h0BiSogj5txcOqGzyuAFAjUMcRULgbhf9rGdHxRPYqW1baWm39T6/5dv2IO5yara3kcF/Ydmyn9P4fLa2+K52oyDsmhfaLgbLjrd7YEzMXa89bLAZDFaYWY+NvXFE970TCkX+T/WSF+cfzZ/HQTfwVng8+p61SvdD8uujcvvbt54tXTdg15ZAO1z6W6BBiwvt402YBSMsKA+GccfPX3bmKtc8kZnSeTHD6y6DJHU4uESm7BHfr1LjBraj3/Nars4D6bxWGs32MEAeuZxZ4QR1Jp1+c2zmXJ6UZxEaxg2E60BNuoWI4xw1luqqvMFQxKa4zUQJm/Zd43c+xUWXAaP1XYANSj537Z0ueGgG3rZDULI/kYCZbB9xHmBPxG0RhhMPTGsO4suzxqnv2I0rczyYEkM2BoQXM/1FcJDN5Ir6x8OAVSRuNb1LDueqrMycZq7efaiyfrPF42h0NcgRoDOuK9FguM4pJs+cpita8MrJ35qH7KT9KSx08NNHX90Lddp6yvFBmWHviozzgiAC+sbU35RK/tPjWwKnrTJbTtSBR6iM58P7JUsBux4V0372B3oeW/uN1DOFNTRfB9MOM0pOprBifrHcmzGMf2uq7kLTsUzBLrmzCsereIbRQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(36840700001)(46966006)(426003)(110136005)(54906003)(70586007)(4326008)(336012)(186003)(316002)(47076005)(8676002)(5660300002)(70206006)(2906002)(86362001)(7696005)(6666004)(82740400003)(8936002)(81166007)(36860700001)(82310400003)(44832011)(36756003)(356005)(83380400001)(1076003)(2616005)(26005)(478600001)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3338
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20edcc16-d774-43e2-b8db-08d919bce10b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Af0pTLUmx8CTPEk0bdl3eAZflXMSVL3UryWs3i1sEveOiYpY2oqPxqJjSY9nGAyAW3vMDVmrExfLxXLeC9POw1zkbVH1OB3HrnbUpHnjTcneHZKIcrBk96VnZPyOy0OCZsI1LEVXAsEIMH6VSj/pm3MNHKXLSArnEEEF1BMVlREf0peNRd4tMui5v3Lhc+k1VmGmchvdBI6q/4xUiVo3LoyCaSzcPJbqBEEc4+e12B/eU1o3q2a8N8kPEEPX7P0k8uh3LwbFGWLrln0MS9rtNv5QEKEJgUmHzJi+O0DHVJa+q/gct0e/X6386uKllG4w0ydrw5ZI2I0kGiArhBWt6n2Whvn6//jXz2M7GAoTP28gPxZ1a4grLaztuJq+COZ7KUfVbZDIHY4YCUir/ECALNTomTJ+g4pq37qq8bpAiABTexosZwAM0bDMpNirB+a7Ti4L22DnKXxDmwP8FsgqZacw7ZyDrsZUOH9U23q5BQuTHmPdB2YR4+kmsem7BRWRTFX5veg0r1EO6J1Sw/UQ5mhaXuvo3NfPZ2HL5ZobFqIq7VSQqxbC0yUgHVJ0qk6ctQg4DIKykbFYfa+fKnBaGmv+EtRTjwvNygd7uSGGdpPYCfsxB/lD1gK4qxmRAp6RqfRcSOiVJrNsKzTV6USs0XiLH8jKnGrHgX5bKotC6uqEYwf4W97SjliIJmTOEy9m
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(36840700001)(46966006)(110136005)(54906003)(8936002)(7696005)(26005)(44832011)(316002)(81166007)(36756003)(478600001)(86362001)(47076005)(8676002)(36860700001)(4326008)(82310400003)(82740400003)(186003)(1076003)(5660300002)(336012)(6666004)(426003)(70206006)(83380400001)(2616005)(2906002)(70586007)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:22:15.5516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a905f5fe-fd47-4f2b-247f-08d919bce630
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2598

This commit parses `xen,static-mem` device tree property, to acquire
static memory info reserved for this domain, when constructing domain
during boot-up.

Related info shall be stored in new static_mem value under per domain
struct arch_domain.

Right now, the implementation of allocate_static_memory is missing, and
will be introduced later. It just BUG() out at the moment.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c  | 58 ++++++++++++++++++++++++++++++++----
 xen/include/asm-arm/domain.h |  3 ++
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 282416e74d..30b55588b7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2424,17 +2424,61 @@ static int __init construct_domU(struct domain *d,
 {
     struct kernel_info kinfo = {};
     int rc;
-    u64 mem;
+    u64 mem, static_mem_size = 0;
+    const struct dt_property *prop;
+    u32 static_mem_len;
+    bool static_mem = false;
+
+    /*
+     * Guest RAM could be of static memory from static allocation,
+     * which will be specified through "xen,static-mem" property.
+     */
+    prop = dt_find_property(node, "xen,static-mem", &static_mem_len);
+    if ( prop )
+    {
+        const __be32 *cell;
+        u32 addr_cells = 2, size_cells = 2, reg_cells;
+        u64 start, size;
+        int i, banks;
+        static_mem = true;
+
+        dt_property_read_u32(node, "#address-cells", &addr_cells);
+        dt_property_read_u32(node, "#size-cells", &size_cells);
+        BUG_ON(size_cells > 2 || addr_cells > 2);
+        reg_cells = addr_cells + size_cells;
+
+        cell = (const __be32 *)prop->value;
+        banks = static_mem_len / (reg_cells * sizeof (u32));
+        BUG_ON(banks > NR_MEM_BANKS);
+
+        for ( i = 0; i < banks; i++ )
+        {
+            device_tree_get_reg(&cell, addr_cells, size_cells, &start, &size);
+            d->arch.static_mem.bank[i].start = start;
+            d->arch.static_mem.bank[i].size = size;
+            static_mem_size += size;
+
+            printk(XENLOG_INFO
+                    "Static Memory Bank[%d] for Domain %pd:"
+                    "0x%"PRIx64"-0x%"PRIx64"\n",
+                    i, d,
+                    d->arch.static_mem.bank[i].start,
+                    d->arch.static_mem.bank[i].start +
+                    d->arch.static_mem.bank[i].size);
+        }
+        d->arch.static_mem.nr_banks = banks;
+    }
 
     rc = dt_property_read_u64(node, "memory", &mem);
-    if ( !rc )
+    if ( !static_mem && !rc )
     {
         printk("Error building DomU: cannot read \"memory\" property\n");
         return -EINVAL;
     }
-    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
+    kinfo.unassigned_mem = static_mem ? static_mem_size : (paddr_t)mem * SZ_1K;
 
-    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
+    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n",
+            d->max_vcpus, (kinfo.unassigned_mem) >> 10);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
@@ -2452,7 +2496,11 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( static_mem )
+        /* allocate_static_memory(d, &kinfo); */
+        BUG();
+    else
+        allocate_memory(d, &kinfo);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c9277b5c6d..81b8eb453c 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -10,6 +10,7 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
+#include <asm/setup.h>
 #include <public/hvm/params.h>
 
 struct hvm_domain
@@ -89,6 +90,8 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+    struct meminfo static_mem;
 }  __cacheline_aligned;
 
 struct arch_vcpu
-- 
2.25.1


