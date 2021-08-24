Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7D3F5B5E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170786.311765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5v-0004Bs-DU; Tue, 24 Aug 2021 09:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170786.311765; Tue, 24 Aug 2021 09:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5v-00047m-3u; Tue, 24 Aug 2021 09:51:47 +0000
Received: by outflank-mailman (input) for mailman id 170786;
 Tue, 24 Aug 2021 09:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5t-0001jx-Ik
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd066ed2-04c0-11ec-a8bd-12813bfff9fa;
 Tue, 24 Aug 2021 09:51:33 +0000 (UTC)
Received: from DB3PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:8::40) by
 PA4PR08MB6013.eurprd08.prod.outlook.com (2603:10a6:102:eb::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Tue, 24 Aug 2021 09:51:31 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::92) by DB3PR08CA0027.outlook.office365.com
 (2603:10a6:8::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:31 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Tue, 24 Aug 2021 09:51:31 +0000
Received: from c95121f8b9ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B45D01B-342F-4C4A-B795-CCD275B590C5.1; 
 Tue, 24 Aug 2021 09:51:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c95121f8b9ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:24 +0000
Received: from PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::12)
 by AS8PR08MB6262.eurprd08.prod.outlook.com (2603:10a6:20b:23e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 09:51:23 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:19e:cafe::33) by PR1P264CA0007.outlook.office365.com
 (2603:10a6:102:19e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:23 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:23 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:21 +0000
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
X-Inumbo-ID: dd066ed2-04c0-11ec-a8bd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCR1N5VD61Zz4i/4bAQFFEqhtNhHdIyamLBbOXBLKh0=;
 b=kVvxkvaFY4c6slOekkJJde7mVfQy0vZO/JY/YMYu9rZxl4qZxFL/mtQWC0FsQbnmYHhkkUiLZFroTLrE03XXaLdbkaKWzCkkpyZ1JyeVNfhOwievoMTfHxEbVBQnsDxL4Dxzo2RpbX3zQQXKp5TC0kRIX84/N1CHHBB0ThaRapU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47d3cdf982d824b1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYBGFN2OhbQBfw65VdFUirKULboshgBsVJOvDcGta8LYTUWpQkViGDKTOEJbvVsn2UpQYY/jclDfvB36XSbPoFeXO73z5iL3HE6fyiUp8kJ+NqOJpvx88+d03eo0pIpng4EScyfzMhMHzYNBOGOQBUWJCyw5gm4djq9hmLqSouVTbncrmfLakbHnA6pZUTvVRplyM2O6EwuOiTfuFMZSlUOfWocW+TQV1uDqZjWdXbSNuDxrUxrGEq32C6KOSyOorXK6rpPQLCQN5vMVswjPZieRL2dwwKir3w3Kezs6TXfYaBu8ZlbMHbtGB9A5pogqlRnzMmRqxxO+BkIng/OsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCR1N5VD61Zz4i/4bAQFFEqhtNhHdIyamLBbOXBLKh0=;
 b=HTS+zuNpDQRiQ8EBixACfsiDon5J/BfJVG2ztAzFCtI8HrenxNEZO9GIn8iw+TyeaucQpp1lipUllLtbnxrtc38VZpQN9ho573DZBRyJ4R36pYaqDGdM2fPnk9TmNeDjYJnpxyn684MGK2UAl7H21b1XyCDfjQsmJ9nIOfpBhsrYhuZlBiSD5ht70zzNlotVqye/WekGqPNSIVxUmur/w60J1BIMG3ynY1zIcbzrz/C4JukeneYXXhYaSGbRvhwv1HuBNSnx1wL9RWo32Kk7LLHsMcDxfcDxvUVRZZke6yJVRRnLgxgc0Two47QTsgCKkrQhWWazoFXLuKldPFQJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCR1N5VD61Zz4i/4bAQFFEqhtNhHdIyamLBbOXBLKh0=;
 b=kVvxkvaFY4c6slOekkJJde7mVfQy0vZO/JY/YMYu9rZxl4qZxFL/mtQWC0FsQbnmYHhkkUiLZFroTLrE03XXaLdbkaKWzCkkpyZ1JyeVNfhOwievoMTfHxEbVBQnsDxL4Dxzo2RpbX3zQQXKp5TC0kRIX84/N1CHHBB0ThaRapU=
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
Subject: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
Date: Tue, 24 Aug 2021 09:50:45 +0000
Message-ID: <20210824095045.2281500-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dba16fa7-e07d-4d4d-6e8d-08d966e4c06f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6262:|PA4PR08MB6013:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB60136B22CBBF458177DB4FBAF7C59@PA4PR08MB6013.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zGMIJDRfuXJz65eLzr+ldrdYHcy8jVzGYa5pMn8bo2YSG7JIzRQGDH+Lg4QFnjk5VEEjFlg32PXvrpw5D+wI4mc9RGpfV5KDH03BXDbtNTWSn0gdoh8ioQhSKKsAKKVHCPXukxlhdswYjB/yTZ9M3CI5XRWMYjcuqI3KOpGb526uAklFqEazc7s+ppHCDfNucArBaISYwU8euDfdx2uR5I7b9hg/RCOjkPkNBW29HuaopC1DH6pbs8JdagSqJnzAKm0ZmJ29ei3LytlUS2y+qj4bo+3QcezQqMbD+Yv1dKeuBOYOGl/LnFNT6RtCo01FAEiHtPYehTfU9p4ooAXZKfoUMqB3aspwpxXla2+ECXakvZnYnaikclJktsAoqmmznCrlbCeTvb1vN7+OS1i2Y20TBu95HKR+WZpSx2ok3W+q94FAT1CTzMya/niLtqPnjRy0tJJIWxMtiHLBqGqFSPpGwCKp66o54N8jlDEZLrqD5d6AA+8xU3bJx0Z+owCkJXBK3YIRlz+oQ671B1T9jFURg8OApl0PHwYKOUrp708SPw4psCz2RpV0Vn8cejkMke9vCwHLqcL9QQxdmucfN4dBn1S4StlbLW/RDKVX2GGG/pTWGdmhICVL6KFnqw6iAbq8SSgvOjPWtLSL9y033hyFvGwMv2f8sfE0jZjFnxr6rhWF3Hq0FAyokG1OApJssvA9RCL/P7qiFYSDq5M16XwARWi4o0feKNnKEZufwD4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(4326008)(7696005)(44832011)(8936002)(356005)(83380400001)(47076005)(82310400003)(2906002)(426003)(26005)(1076003)(54906003)(316002)(8676002)(110136005)(478600001)(336012)(70586007)(70206006)(36860700001)(36756003)(81166007)(5660300002)(86362001)(82740400003)(186003)(6666004)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6262
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f29032cb-0e61-4620-099e-08d966e4bb7d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+LcbmH3+uw1igaMzw8yG+tNzx1Si5pu5bO224trezPuDR3q7uo3E0NmhXrWsNVQa/JFBEGEjb0Hz/N6/GyNnLxM4lx8pyB8noa2duEndgYXkFJ+8qkExTpNRFOYgEGZinm7KV6FM2249nyfpDGDrY9ITJUHkxYuq+GzmKUDPCmh/kQyv+2VszUOcLbPaSq/9Hm5avzJcMBkVn8E0bUPvu+tA/I/0BdcmRFpuFIxbSF3bXZKeOiu8WMMXHP73TYPgd7vulYQ3Q88CphAKlgsgyyRzAMoAEvKrG5HpohuDsyrlZEFawl8XZ2irXOU1HJc7OUrQKaIA60appjQHk2siQRDAn9nOwAHLiubOydXfDX6hfp/oXgXWf9yElhHREbGtunSLKLxNu9tI3KGuM07z2fKEvGSFIObokf9a/roqoc9YXVMdXYsKBv6aiJaONslawnMAHM9invi/JMLWXnqK8IpDEhJwXcQhjxO4yBQ9PzbiLEssubznuEh8/yiwYO4mwD/Oe/W6mWmxtweOu68b6jSF8eys4tesJVvwQCAeb6CUDNULsAUsOPLodXbsH8HST/zUlLM+AsvrRmcmXCCBvODX0APhKJUbr39gxkaTO6E5DJg1rp8W83h8zkt1enixkqwrNGoCB4pyYZvKtFRhwk2YfRD0VEqwWQ2v/c3A/tSCB9o7YzZei8qvRGrKWGLiem4LMu2gZ+Xciwa4EtJVsw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(36756003)(26005)(4326008)(8676002)(336012)(8936002)(316002)(7696005)(1076003)(44832011)(508600001)(47076005)(2616005)(5660300002)(110136005)(186003)(70206006)(83380400001)(82310400003)(6666004)(81166007)(86362001)(70586007)(426003)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:31.6650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba16fa7-e07d-4d4d-6e8d-08d966e4c06f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6013

This commit introduces allocate_static_memory to allocate static memory as
guest RAM for Domain on Static Allocation.

It uses acquire_domstatic_pages to acquire pre-configured static memory
for this domain, and uses guest_physmap_add_pages to set up P2M table.
These pre-defined static memory banks shall be mapped to the fixed guest RAM
banks. And only when they exhausts the current guest RAM bank, it will seek
to the next one.

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit exports p2m_insert_mapping and introduce
a new function guest_physmap_add_pages to cope with adding guest RAM p2m
mapping with nr_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v5 changes:
- don't split comment over multi-line (even they are more than 80 characters)
- simply use dt_find_property(node, "xen,static-mem", NULL) to tell
whether using allocate_static_memory, and add error comment when
"xen,static-mem" is used but CONFIG_STATIC_MEMORY is not enabled.
- exporting p2m_insert_mapping() and introduce guest_physmap_add_pages
to cope with adding guest RAM p2m mapping with nr_pages.
- check both pbase and psize are page aligned
- simplify the code in the loops by moving append_static_memory_to_bank()
outside of the if/else.
---
 xen/arch/arm/domain_build.c | 156 +++++++++++++++++++++++++++++++++++-
 xen/arch/arm/p2m.c          |   7 +-
 xen/include/asm-arm/p2m.h   |  11 +++
 3 files changed, 168 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c86d52781..843b8514c7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -480,6 +480,148 @@ fail:
           (unsigned long)kinfo->unassigned_mem >> 10);
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+static bool __init append_static_memory_to_bank(struct domain *d,
+                                                struct membank *bank,
+                                                mfn_t smfn,
+                                                paddr_t size)
+{
+    int res;
+    unsigned int nr_pages = size >> PAGE_SHIFT;
+    /* Infer next GFN. */
+    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+
+    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
+        return false;
+    }
+
+    bank->size = bank->size + size;
+
+    return true;
+}
+
+/* Allocate memory from static memory as RAM for one specific domain d. */
+static void __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    const struct dt_property *prop;
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, gbank = 0, bank = 0;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
+    const __be32 *cell;
+    u64 tot_size = 0;
+    paddr_t pbase, psize, gsize;
+    mfn_t smfn;
+    int res;
+
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                               &addr_cells) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
+        goto fail;
+    }
+
+    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                               &size_cells) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+
+    /* Start with GUEST_RAM0. */
+    gsize = ramsize[gbank];
+    kinfo->mem.bank[gbank].start = rambase[gbank];
+
+    cell = (const __be32 *)prop->value;
+    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
+        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
+
+        smfn = maddr_to_mfn(pbase);
+        res = acquire_domstatic_pages(d, smfn, psize >> PAGE_SHIFT, 0);
+        if ( res )
+        {
+            printk(XENLOG_ERR
+                   "%pd: failed to acquire static memory: %d.\n", d, res);
+            goto fail;
+        }
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /*
+         * It shall be mapped to the fixed guest RAM banks(GUEST_RAM_BANK_BASES),
+         * And only when it exhausts the current guest RAM bank, it will seek
+         * to the next.
+         */
+        while ( 1 )
+        {
+            /* Map as much as possible the static range to the guest bank */
+            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
+                                               min(psize, gsize)) )
+                goto fail;
+
+            /*
+             * The current physical bank is fully mapped.
+             * Handle the next physical bank.
+             */
+            if ( gsize >= psize )
+            {
+                gsize = gsize - psize;
+                break;
+            }
+            /*
+             * When current guest bank size is not enough to map.
+             * Before seeking to the next, check if we still have available
+             * guest bank.
+             */
+            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
+            {
+                printk(XENLOG_ERR "Exhausted all fixed guest banks.\n");
+                goto fail;
+            }
+            else
+            {
+                psize = psize - gsize;
+                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                /* Update to the next guest bank. */
+                gbank++;
+                gsize = ramsize[gbank];
+                kinfo->mem.bank[gbank].start = rambase[gbank];
+            }
+        }
+
+        tot_size += psize;
+    }
+
+    kinfo->mem.nr_banks = ++gbank;
+    kinfo->unassigned_mem -= tot_size;
+    if ( kinfo->unassigned_mem )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
+        goto fail;
+    }
+
+    return;
+
+fail:
+    panic("Failed to allocate requested static memory for domain %pd.", d);
+}
+#endif
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -2452,7 +2594,19 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory(d, &kinfo);
+    if ( !dt_find_property(node, "xen,static-mem", NULL) )
+        allocate_memory(d, &kinfo);
+#ifdef CONFIG_STATIC_MEMORY
+    else
+        allocate_static_memory(d, &kinfo, node);
+#else
+    else
+    {
+        printk(XENLOG_ERR
+               "CONFIG_STATIC_MEMORY must be enabled to use \"xen,static-mem\".\n");
+        return -EINVAL;
+    }
+#endif
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index eff9a105e7..6e01e83967 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1293,11 +1293,8 @@ out:
     return resolved;
 }
 
-static inline int p2m_insert_mapping(struct domain *d,
-                                     gfn_t start_gfn,
-                                     unsigned long nr,
-                                     mfn_t mfn,
-                                     p2m_type_t t)
+int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn, p2m_type_t t)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 6a2108398f..f885cc522b 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -300,6 +300,9 @@ int map_dev_mmio_region(struct domain *d,
                         unsigned long nr,
                         mfn_t mfn);
 
+int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
+                       mfn_t mfn, p2m_type_t t);
+
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
@@ -315,6 +318,14 @@ static inline int guest_physmap_add_page(struct domain *d,
     return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
 }
 
+static inline int guest_physmap_add_pages(struct domain *d,
+                                          gfn_t gfn,
+                                          mfn_t mfn,
+                                          unsigned int nr_pages)
+{
+    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
+}
+
 mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
 
 /* Look up a GFN and take a reference count on the backing page. */
-- 
2.25.1


