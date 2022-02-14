Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0FE4B4035
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271072.465441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvS-0008HF-RI; Mon, 14 Feb 2022 03:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271072.465441; Mon, 14 Feb 2022 03:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvS-0008EA-Jq; Mon, 14 Feb 2022 03:21:18 +0000
Received: by outflank-mailman (input) for mailman id 271072;
 Mon, 14 Feb 2022 03:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvQ-0007B4-JH
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a8a1568-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:15 +0100 (CET)
Received: from AS8P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::31)
 by VI1PR08MB3647.eurprd08.prod.outlook.com (2603:10a6:803:85::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 14 Feb
 2022 03:21:11 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::eb) by AS8P189CA0023.outlook.office365.com
 (2603:10a6:20b:31f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:10 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 14 Feb 2022 03:21:10 +0000
Received: from 30609cc8816b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC72F650-BF67-4D34-838E-9C43BA604C61.1; 
 Mon, 14 Feb 2022 03:21:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30609cc8816b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:03 +0000
Received: from AS9P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::22)
 by PR3PR08MB5818.eurprd08.prod.outlook.com (2603:10a6:102:8b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:02 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::49) by AS9P194CA0027.outlook.office365.com
 (2603:10a6:20b:46d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:02 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:06 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 14
 Feb 2022 03:21:00 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:04 +0000
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
X-Inumbo-ID: 2a8a1568-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsRjtoJi/dcXTUUD4SSPKSVxouxZVNwFWUBYcsUvmi8=;
 b=fofnIoQZwPXgw63GyUq5/Z9SuEkZyR+t0eanuA+BQenlPMm+H0d9j5VxEVFHzktHCvvczjJ/AqTq1cQXKJeJKfQigp+ivdKdoIflsW1TwQBPKk6ZIoZrveg72txQlaTgjG0B+gFR7FicHN/lY9F3dv8MLdLdmEgtOp1mYW7L3H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69b00cd927348eea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaLeEkK0a/EteRqRe4DJaluPeRcYh57lMCZj9tJm+fKJ/LM7Bxzs1bTAO0iIcyZrew759ZN1WiUKadDgYPwcHemCgPgfxFvB3XIIeK8YKDS4yAO1kmYvtevTuQHR6wQDZv4SjR7jhbCixvo4wqjHAURF9lcPxKdA+GdnqzMvnyvzkZ4SIWwe/m4K+oDD8MM378v8WFgq+xVxY3/78Qb36TLklGRezlWz6JcfqFTe9K4U+RS3PAYy1bpgXTmJURUSDwb5ujlDcjqTjYf5+Rc7kiQc8mhpsEoahibMwK2Bi/JAq1yvDjaSx8hoNn85IaXZvaBwwo5AuR+0emuW76IiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsRjtoJi/dcXTUUD4SSPKSVxouxZVNwFWUBYcsUvmi8=;
 b=VfZiKdxkgpR6wowdFIZtdDFqk3j64NyWb1KwlkSnfhVwD3RNcGnvOGOknhWxxmkoQMq9C8wQpM8ZuT9KhMpxcm0V2jItGCfXVKxGmNXRtCHxugcujXGt7UK9su0EzNUABrxCUaGAtKQgWWw07jhjdJOJHooPIibvh8pLI/0cgcFsvzo2l3/wcon4cup7V3TgD2Ih3Rxgs4+zHWLXQVo/UcJQFzINGjZqZQHk8PC4cA2/07vC7/uyaZkxabjzDia+Cz6euzjwxWs9IReXKA0aNpiM2g6T/gonJIcl8veaIr/y2LNQvSKi12R4zGC1G+Aj0GC8r4c/J0seepz3YMXJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsRjtoJi/dcXTUUD4SSPKSVxouxZVNwFWUBYcsUvmi8=;
 b=fofnIoQZwPXgw63GyUq5/Z9SuEkZyR+t0eanuA+BQenlPMm+H0d9j5VxEVFHzktHCvvczjJ/AqTq1cQXKJeJKfQigp+ivdKdoIflsW1TwQBPKk6ZIoZrveg72txQlaTgjG0B+gFR7FicHN/lY9F3dv8MLdLdmEgtOp1mYW7L3H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 04/11] xen/arm: introduce new helper parse_static_mem_prop and acquire_static_memory_bank
Date: Mon, 14 Feb 2022 03:19:49 +0000
Message-ID: <20220214031956.3726764-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 35907ce1-104b-4a40-ebb3-08d9ef690c39
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5818:EE_|VE1EUR03FT011:EE_|VI1PR08MB3647:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB36476A652192D7BBB57DEFB3F7339@VI1PR08MB3647.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:281;OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GD4RcxewPWLK6t3R5KHoKfXnSXNK6oNPvUFLMNkUkt64zcoQddi1VDMe2o4Wfe6ErKDLK59BJeij7HD/In7R4/U/MoLFfr+DzjRzW3u42j6QScuWut7+8zXW5myfEIWWaleqY4cPcUKzIEiZyu5/Kp+gTp49fV9x77Jnb4dN2dr93Y1RIAn/akCuETmHFb8nPJ0YK2DQ+jAbQVEhFOgURtThFZWQUzPPP5tTFGTpjpe4t3RC6BQskqiDIGXBuS2DpNRwb9R3cXjsRl89Q/TnEc360fkLhVofxKzxcNC8czS3eBo1s2CKjdNGeXW0q3xHHp25xAKks0/Zu5Ri3nxbL8+7LwFBsRMASvidJuM/GubiRTGUMJpQPIcw/4+Xt3LuiGiLM8jK5rSSReDFJlmI65cge+8gctG3zepaIbqiMJTHX8uPtlYpsG6W40wBvaUYsswTpYQoeM51XFR10jWmwGwytupGWLxGakn6Qi3vBVF0iUKmNWzrIcP7/1zEU/uSSz8pdbiBjl0bqB9Adr9u7cq1NFUWYaxXF/k0yASahELeq32gJyIVWA/+ndIcDIoPMkbUYmWMyUAbVr331rIf/BJAQDPRd0KJxtISj51TdwZhL0F5RErcpzErK47DPVld2F6NiiYbB+Lux35jyZXRnIWKjFy0YX91a/HY38C0qTQSwgXMK4mIt7htqqKl7Gbpt2600Dew8h63dX9jqW8JDQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(336012)(426003)(36756003)(82310400004)(44832011)(1076003)(186003)(26005)(2906002)(2616005)(47076005)(36860700001)(83380400001)(356005)(81166007)(70586007)(70206006)(4326008)(8676002)(8936002)(6666004)(7696005)(316002)(86362001)(508600001)(40460700003)(54906003)(110136005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5818
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cc47751-86f4-4140-07d5-08d9ef690730
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVjfpaaaROgCi2fsfysjOPTc7k/RPswQ8TrtpDrdps5V/oQkKi8Ftm5K5B7T82Gw0YwqDJVCdlPtsDe1TVL0sYQF0PaW6opAgi8scmpHjZYGFfjD9Ma1Vpx52yD7qCRM7HLlk94Oik45jNBVTzoHhILqL7EG+I1NQFo0xDtvYwdX89zKkwL03rI2RduBm3UoJQpYmKE3zIiHzOfDC4LcB91RiJg/XVCMU3GBB2yfreN/dN6jKcoiKVJ31kPw09MLPC1tiidcZD1MACvg58ZbBgVUnlNKOOVe7F8Pkn5FYpFdcXMcg/eRgKWke2cDfefgh6XLLYPE9uboKU1doJjE5eO2VO/wXlb4dZO/JTCB7Ws8KfLZHjiEG5Jf0+8eVOkvc2QORP8HzLK8Fbh5wk3c4Xt05ElSV+IppFqqyKWdi9UVCZUrW0Y8jzpGMfq8HpfHgLaj8ZJEtTI7jcdxRSo37kjpJYn0RNBYh7VO3h19SBcJdPe44s5eEyhNCJ205dgsdlCCVBTVa58b/NlGeFkPYR8F9NCK7pNUuDTgHsoXHTmPN2X6rwpnKCjJjO8z0mWIndyeTE2fd2ScLpcW6OJYE5T397fuC3e//8Z02YYQjkGTIwRX7K6bdXz3+LIpIgBKj50MVxGKR5vUh9ljaQPRNg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(4326008)(70586007)(70206006)(36756003)(5660300002)(8676002)(86362001)(8936002)(47076005)(82310400004)(83380400001)(81166007)(7696005)(54906003)(110136005)(2616005)(44832011)(316002)(2906002)(6666004)(26005)(186003)(1076003)(426003)(508600001)(36860700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:10.4269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35907ce1-104b-4a40-ebb3-08d9ef690c39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3647

Later, we will introduce assign_static_memory_11 for allocating static
memory for direct-map domains, and it will share a lot common codes with
the existing allocate_static_memory.

In order not to bring a lot of duplicate codes, and also to make the whole
code more readable, this commit extracts common codes into two new helpers
parse_static_mem_prop and acquire_static_memory_bank.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 changes:
- new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
direct-map for domUs"
---
v4 changes
- explain briefly in the commit message why we want to do device assignment
without IOMMU.
---
v5 changes
- fix coding style
---
v6 changes
- no changes
---
 xen/arch/arm/domain_build.c | 100 +++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c1e8c99f64..e61d2d53ba 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -509,12 +509,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
     return true;
 }
 
+static mfn_t __init acquire_static_memory_bank(struct domain *d,
+                                               const __be32 **cell,
+                                               u32 addr_cells, u32 size_cells,
+                                               paddr_t *pbase, paddr_t *psize)
+{
+    mfn_t smfn;
+    int res;
+
+    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
+    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
+    if ( PFN_DOWN(*psize) > UINT_MAX )
+    {
+        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
+               d, *psize);
+        return INVALID_MFN;
+    }
+
+    smfn = maddr_to_mfn(*pbase);
+    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
+    if ( res )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire static memory: %d.\n", d, res);
+        return INVALID_MFN;
+    }
+
+    return smfn;
+}
+
+static int __init parse_static_mem_prop(const struct dt_device_node *node,
+                                        u32 *addr_cells, u32 *size_cells,
+                                        int *length, const __be32 **cell)
+{
+    const struct dt_property *prop;
+
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
+                               addr_cells) )
+    {
+        printk(XENLOG_ERR
+               "failed to read \"#xen,static-mem-address-cells\".\n");
+        return -EINVAL;
+    }
+
+    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
+                               size_cells) )
+    {
+        printk(XENLOG_ERR
+               "failed to read \"#xen,static-mem-size-cells\".\n");
+        return -EINVAL;
+    }
+
+    *cell = (const __be32 *)prop->value;
+    *length = prop->length;
+
+    return 0;
+}
+
 /* Allocate memory from static memory as RAM for one specific domain d. */
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
-    const struct dt_property *prop;
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, gbank, bank = 0;
     const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
@@ -523,24 +580,10 @@ static void __init allocate_static_memory(struct domain *d,
     u64 tot_size = 0;
     paddr_t pbase, psize, gsize;
     mfn_t smfn;
-    int res;
-
-    prop = dt_find_property(node, "xen,static-mem", NULL);
-    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
-                               &addr_cells) )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
-        goto fail;
-    }
+    int length;
 
-    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
-                               &size_cells) )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
         goto fail;
-    }
     reg_cells = addr_cells + size_cells;
 
     /*
@@ -551,29 +594,14 @@ static void __init allocate_static_memory(struct domain *d,
     gbank = 0;
     gsize = ramsize[gbank];
     kinfo->mem.bank[gbank].start = rambase[gbank];
-
-    cell = (const __be32 *)prop->value;
-    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+    nr_banks = length / (reg_cells * sizeof (u32));
 
     for ( ; bank < nr_banks; bank++ )
     {
-        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
-        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
-
-        if ( PFN_DOWN(psize) > UINT_MAX )
-        {
-            printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
-                   d, psize);
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( mfn_eq(smfn, INVALID_MFN) )
             goto fail;
-        }
-        smfn = maddr_to_mfn(pbase);
-        res = acquire_domstatic_pages(d, smfn, PFN_DOWN(psize), 0);
-        if ( res )
-        {
-            printk(XENLOG_ERR
-                   "%pd: failed to acquire static memory: %d.\n", d, res);
-            goto fail;
-        }
 
         printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
                d, bank, pbase, pbase + psize);
-- 
2.25.1


