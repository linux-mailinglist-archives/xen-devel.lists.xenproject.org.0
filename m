Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6B47A44B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249405.429836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7a-0008V9-3j; Mon, 20 Dec 2021 05:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249405.429836; Mon, 20 Dec 2021 05:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7Z-0008RV-WA; Mon, 20 Dec 2021 05:22:01 +0000
Received: by outflank-mailman (input) for mailman id 249405;
 Mon, 20 Dec 2021 05:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7X-0007eG-Uq
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0e3d545-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:21:59 +0100 (CET)
Received: from AS8PR04CA0208.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::33)
 by DBBPR08MB6170.eurprd08.prod.outlook.com (2603:10a6:10:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 05:21:56 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::2b) by AS8PR04CA0208.outlook.office365.com
 (2603:10a6:20b:2f3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:56 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Mon, 20 Dec 2021 05:21:56 +0000
Received: from d2444726bbb5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47CDFF00-939B-410A-9EDA-B8AB5901C771.1; 
 Mon, 20 Dec 2021 05:21:49 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2444726bbb5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:49 +0000
Received: from DU2PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:10:2b0::25)
 by AM7PR08MB5365.eurprd08.prod.outlook.com (2603:10a6:20b:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:21:48 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::e4) by DU2PR04CA0170.outlook.office365.com
 (2603:10a6:10:2b0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:47 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:47 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:45 +0000
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
X-Inumbo-ID: c0e3d545-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhckbP+ZZBCq/1yalr4ay9gb/vsT94ZQVv4mh/pGOJs=;
 b=MtTvE1oEKQDVPx9VeEh8SmOmnLfATIVfLmm9/0z77ojylkaZYMeAmSPAHFQgkKgykMB/pc8KJ0kcqXWm8wzEsXf7HBHueSX5wXcSrrHABL1QVUo2qImF3Wg2xKN9IBT2id/Slg/Nr3jtxAjXfoYAJvDIhmZgCQWtCUgaWfJ+oJY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce3110d1358fcd53
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmQL8wwvslR6wNZEx9T2399lFz3SWb46Pcz4Kd+HRKDLcYtqCV2kgLAzPGb6chNWvZH6HRrfydJs4OuLo+p2kxC9rZBGx90YXYdgF8iilEg0Lnnyh7h9v1Bu6RVyEXdEIs9zDBKkr9SOlqce/40Uav3lYPznO2CJo6/1HkjfiyK0LXWPKowgm3ta2IXdbYwnZQyAd3J3wvDPJJtXTdK7oUqtm/Ll3lyOKsNEF27GRskVo/sKR1PthZ3tWA0UHw1XKKLU9ueJBk9BNsURQOowmWFIZ14ThUSb1i+VgI64ZG+/z7fFLA1Rr7juKBKuRbww1iajmeNTkfZLyCWW3tCicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhckbP+ZZBCq/1yalr4ay9gb/vsT94ZQVv4mh/pGOJs=;
 b=eFlVLLhtmBwKIvhKGxH6uK9reuGoVP0L1VTGvZbP0EBVigYOg42+kQj1bq7Mfrmdr7pFX884u6edVT/fabED22uxWkuuK7PEy6d+rZcpMsTBV6GH1U8/c9w7Pt5V1ux/nTpQoRRd96g6fOQO+ynC7rdoluVvmUJX9fxtWWm9XByqHLcvr91c/vKg+eFBNcM70c40WHoOZSEpa+Z+uaAJDDBmQXkl0KAweMwgTKt3pnBaB4rZQaBUguAGD6zLsoknsOOawfk+nKOxMn+wj2l+EQGt+L8f/LRuKSZ/Z7kkwtmi1t/smhjnBNsA1CCZIyYq/EyYPxCgcq+jU5DYO1TcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhckbP+ZZBCq/1yalr4ay9gb/vsT94ZQVv4mh/pGOJs=;
 b=MtTvE1oEKQDVPx9VeEh8SmOmnLfATIVfLmm9/0z77ojylkaZYMeAmSPAHFQgkKgykMB/pc8KJ0kcqXWm8wzEsXf7HBHueSX5wXcSrrHABL1QVUo2qImF3Wg2xKN9IBT2id/Slg/Nr3jtxAjXfoYAJvDIhmZgCQWtCUgaWfJ+oJY=
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
Subject: [PATCH v4 04/11] xen/arm: introduce new helper parse_static_mem_prop and acquire_static_memory_bank
Date: Mon, 20 Dec 2021 05:21:16 +0000
Message-ID: <20211220052123.969876-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: cbfcf30c-3c23-4aad-3dfd-08d9c378a404
X-MS-TrafficTypeDiagnostic:
	AM7PR08MB5365:EE_|AM5EUR03FT025:EE_|DBBPR08MB6170:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB617072E0AA0C077D4AC005AAF77B9@DBBPR08MB6170.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:331;OLM:331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wnSEqD9lVm2ZFN6rwrINuxgHk46MWk/V+umzCzOY0l2/TQUPExkKxBoXX2pujpRIMAhPYC5SjpOsFkX6fzTRISFy08dBu9s56wanH3KP5LTK5R2IPrBfzU/9eZpgp8oafbbWo9Ek/Ixz7TDJ+dB+UoB82LpnQwG86EwE3l/exLzgxjtI6UEuYrdiMWLG9OAqsc2xyRun8e70UE4N0jVpdtwbYKkT8/Qir7FP0QfrgfvbKHGVggJm2mqeQygXgapd4NpklbuLGFGim+LNlxdI6h/nkpMbuMPqOF9jGMT2uba6r8A2OOWBAJEIbzEwYE1cdd1gGV+ez1Kldr93r/mBxB0xLqOHc5eVVVQe+/HDAtHwYMAmeGfDms86h7dslnvgmwNbRGbeJYZbo9dOCGgO8MsTsyTl5aW2D+sMorW7ZjlLE9tCTlOAHck8KH77w5vMmkus81R1EJoyreR8iLXTEM7F5OG8kCQvKjOW8zQhsrPTAUiy0AZr6gRH43KbtkmI57MyxQxwGthZAS6hHRCp/m8kbXmpnPzWQr/pQXSM+Kg2ubcLv6cZ9uxMEgBth1UAGteZAU26ODrW4G0KNFs7l+Vtxib7IoYTYgp/W5v28qUUwGdpRe/1IgpXMFjEP1YQBgowEv6RDSQAZBnFEdKMcSFXyL7l6yBpVSQe3FlYAr29+IlGMitsrDd76O3gZJWkzd5N/FzJVcWA5K2SuoBcfnwrhLUjnsNfSzrKddiK37QBvi+f9tIEXasgyLKhDF1+l0qC7Gc/KXH9iZa8tVIdQ70XpzJZxNzhGt0hqgAACgE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(7696005)(110136005)(44832011)(356005)(26005)(1076003)(47076005)(36756003)(86362001)(70586007)(81166007)(54906003)(70206006)(2906002)(8676002)(82310400004)(426003)(6666004)(8936002)(83380400001)(40460700001)(316002)(36860700001)(5660300002)(336012)(4326008)(2616005)(186003)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5365
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c416d4b9-94de-4a74-1470-08d9c3789ef6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y0jlUJSUjRKfJUVPIvOnVJTrQ3VH6CPan83TEr5QzVGg+X+YHYcB2n5OmxuxOeTeZcJ5A99huTOyRq4M31XBkuXhRn2382SFVMzT4jnJqeQVaT6cjcC6E5ojjPVNOj+dX6zqaXFjniZ8qAYkDGdWYKzyLM8OJiW/WwDY2SJmMNgQuH5KcW32jFmu8b5ZuFg9/81ADcC5kIj7o0uRnre0Fe48a52FAtyc+5sk3Uc2VP4gtbPMFTyKE4r87+WM2FibED+bLFZflS5Ff1nK7ifnYTxK3605Lf3fdfReTrf218SiI2opH7zDKMMnBXhoi+QNYMvjNpcsgN4zrA+d58xTEYsDioCw7CQMh6dcvYbAP6yLxBjMQ57yut6lSxRWHQU2XllvQQBVKrJos7anSPXcaS5bgCeBX6SBLYDeK4cBhIAV7rOaX5DUJ9WSbjKDAGjzWfBTuHklfq21ezSlxr0no2B5BgTm8x32VMee51sOJgVsZfOtfbtAsbLoB1/G+ZtpR8Mb6W1xxAdR6/LEIKVmBPdcJLCQ7cJe+EbTvf1KwH1KJHCBIr+BJMucjHRtJo0RgrphVdO8fqpd2jnJ1D2Qp5GKIH5JRKKs2bmyF3JV9Dh5Q8jFTPzU7g/oqWPn8YHy9lrHOIQvXBH9aPKZ4B8PfTTWKukNZdusrbR5Pvft1s/LgidT50kuwEvCzeW+eGNyDdoMfGhJRUIXXtMpcFpLpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(110136005)(36756003)(54906003)(82310400004)(1076003)(186003)(70206006)(47076005)(2906002)(81166007)(4326008)(44832011)(2616005)(86362001)(6666004)(336012)(316002)(8936002)(36860700001)(7696005)(508600001)(5660300002)(83380400001)(8676002)(70586007)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:21:56.4244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfcf30c-3c23-4aad-3dfd-08d9c378a404
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6170

Later, we will introduce allocate_static_memory_11 for allocating static
memory for direct-map domains, and it will share a lot common codes with
the existing allocate_static_memory.

In order not to bring a lot of duplicate codes, and also to make the whole
code more readable, this commit extracts common codes into two new helpers
parse_static_mem_prop and acquire_static_memory_bank.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- new commit to move the split off of the code outside in a separate patch
---
v4 changes:
- use mfn_eq() instead, because it is the only value used to indicate
there is an error and this is more lightweight than mfn_valid()
---
 xen/arch/arm/domain_build.c | 100 +++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 5a106a977c..9206ec908d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -509,12 +509,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
     return true;
 }
 
+static mfn_t __init acquire_static_memory_bank(struct domain *d,
+                                             const __be32 **cell,
+                                             u32 addr_cells, u32 size_cells,
+                                             paddr_t *pbase, paddr_t *psize)
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


