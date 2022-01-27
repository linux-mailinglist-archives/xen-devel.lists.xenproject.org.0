Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917F49DBEB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261215.452051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYR-0000bS-UB; Thu, 27 Jan 2022 07:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261215.452051; Thu, 27 Jan 2022 07:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYR-0000ZB-PR; Thu, 27 Jan 2022 07:50:51 +0000
Received: by outflank-mailman (input) for mailman id 261215;
 Thu, 27 Jan 2022 07:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYQ-0000Xj-Bj
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:50:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d737afb7-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:50:49 +0100 (CET)
Received: from DB6P18901CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::20)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:43 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::ec) by DB6P18901CA0010.outlook.office365.com
 (2603:10a6:4:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:43 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 27 Jan 2022 07:50:43 +0000
Received: from c34b16ce37c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8846CCC2-29D0-4286-9D8E-C4CE81294CE9.1; 
 Thu, 27 Jan 2022 07:50:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c34b16ce37c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:37 +0000
Received: from AS8PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:20b:31e::8)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 07:50:34 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::24) by AS8PR04CA0093.outlook.office365.com
 (2603:10a6:20b:31e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:34 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:34 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 27
 Jan 2022 07:50:33 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:32 +0000
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
X-Inumbo-ID: d737afb7-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH+JDxJqSi4MWsWTFqNhTsipHdTKsPE2NyugzwEu6T4=;
 b=Vc7dnXhke1WEMCeyxX0IS8a4Un2a+xHRKrZuuuo8cASs3NGbMo/8E3/7yILtWEpwYRQIF0Tks496X3ga03/7Um9LxC1k7JhrpKPefuOjlswZH9M/CNJoR6OJK4wlOJZ1pcNMZHI250fx/duzCyX7hG0if97Q1dnxMP7ftjiKGMc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cb73171e516e849
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esla83ufDgRB4Mm+JNxkW8Cx5CPCE/329La6LqyBPqYWGSKxzsKl1kWx3+qjk3C88/Q7PXQ07j3PsoJ+9qa/FB+b/8Pxr0nLuQ1XEXP/8Jp6PGeQLBimI2T+sLI1cB4+X4T7qdl5FA1HA+NpnVacJZKktl2h1q2TIKogGPXRy8wTM+wJgY3ZthkYRU0kJ7uA9haD9li2IWBaIYZWvMrNomD0Y6Z7P149UBu672DwnpnsKUDl5ppgyHpd9Lo350GZ4Hrpcb4pfoZs6VaNJguUDG73FpNbK9Z+sWLT7D416Ul0QJHu35f++SGGIIEo3HVS03cgFeW1exI2HM6C3nct3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH+JDxJqSi4MWsWTFqNhTsipHdTKsPE2NyugzwEu6T4=;
 b=Y1N0SWOyn0LGqBRpg55Z807evmue0+VIjv/vvaEftB6pMqpZlBzy4EabEzWbTd9OXsOTOp5q46nu4Xs0mcNB40erlK2J1tdYar2djrx6Ofqg/k/EVSkIkoYd+6P5ryW0v0cbvy1t2J9l5kP4OPkVraCgy7OvP3vmXNJclTrA44VoNH0htPKYcBOu9LmtOpEjhq252wiA7kndqt+eQGB7r34UP2iGBsvDXcHrSU53Melyw1dP2kHGj6wsybyMIyFC4/Acvw+3rg4pS7DbMslujgfOkX8MUV18tEvap0V9isUq6Kbrdx4WRcamfKK8xDyNu6D4rT5yusVIdr1/2oVkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH+JDxJqSi4MWsWTFqNhTsipHdTKsPE2NyugzwEu6T4=;
 b=Vc7dnXhke1WEMCeyxX0IS8a4Un2a+xHRKrZuuuo8cASs3NGbMo/8E3/7yILtWEpwYRQIF0Tks496X3ga03/7Um9LxC1k7JhrpKPefuOjlswZH9M/CNJoR6OJK4wlOJZ1pcNMZHI250fx/duzCyX7hG0if97Q1dnxMP7ftjiKGMc=
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
Subject: [PATCH v5 04/11] xen/arm: introduce new helper parse_static_mem_prop and acquire_static_memory_bank
Date: Thu, 27 Jan 2022 07:49:22 +0000
Message-ID: <20220127074929.502885-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 46d47487-b43b-4e15-6e9a-08d9e169b883
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4405:EE_|DB5EUR03FT044:EE_|AM5PR0801MB1651:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB16512A1456974F797524E939F7219@AM5PR0801MB1651.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:281;OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SpR9G3ONgDxJ6mcbjZJRKREMM6lJ3FmLvqotqI8Qv4qs+OYzWUWo28pL3jjpnGBIWGC+usm2+LBFqgjaRTp7Wcrz7/KzZkD0IL7fB37oag+bLWxButVm2Of385pg1ANN8USn8XWX/x/y4Fxv0PmJcUH2Wg3QOkfFee0N7wbV1H8bwZ0edIpIl9MHFgAe7/O6X1Im19k++mokagStbsjb3WOYHaBOpZhW+HFc9DslGkMjj70w4wQ1hOoMLLWii7Q34+dsVDodz/t0CHkNBymLNrZ86tsNvtbwspSsAhc2x1JrNntdg3cJB/aXiNyLOWPifQhHt0Z40jI4xiDF6D44Oan0eaXNfmwRS1AnRA3OgUoml7koU/po/znK6S1UCBd5kI+S/BRAzbv8Kn5lZjojHo4EH7y9nhdO1qqQTM9zQq6MSt7+EDfesuf6osWI6P632JuulHRA4ozHTvvnDo9w4GghS8SPoejXSAl+QBZoECNEEU0xpOXjJGSLv63X/h/uRlzewS34yBkkKfOs1dpi/Y6nKIn+L+i5Dv9nThqLI0n/lcUXOfyt7KwC3NDvbHFAh1CybfQbKlX5eKvHJCAu5L8EcCk6doVr8+abXI16moM0mi1COmZqgGh17Nn48L6msiKn+U5eywQc0dEfvX2sHMGWJf3zOlLkCKGK2IHvXA//XnO1NfIyKYYMRTvk5tcFbq3Cr7YUMXb/OoSITlPE/jlEXwXwqSFHYEMW7pdXsxLJGr3Psu43xJDcVzjmDBBDxvRODdgDhHsR2tCnIoJ8ZfLjkpYU0tqbVUAyKpDTcj8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700004)(46966006)(36840700001)(7696005)(44832011)(5660300002)(6666004)(83380400001)(8936002)(2616005)(86362001)(70206006)(40460700003)(47076005)(356005)(4326008)(81166007)(110136005)(54906003)(316002)(26005)(336012)(36860700001)(82310400004)(2906002)(508600001)(70586007)(426003)(8676002)(1076003)(186003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d86766de-d184-44c4-29b3-08d9e169b36a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4aB5jJX/dS19+0SWGdMla0w+zcXmYCndCxWhRBzUFT3TmDuusOnS/HuFpHO4wr3bOQrRK/zaDGUIX5buS7AutgVaJ00Y00zbETTn+3fRh1tj9vWSu6VSDiKJaNLyImCN4FRzKijQdYqRhU9Y9sU5kdmm6KXqUA0I1MtnppJDUiYKEvGkvotqYYkMcsKQIMl3cJoGR7CHJ4kEbwxh1mTbu2km5Ar/6S8DXVmAlfd7tZPQ1OuXKHRZGrMp7QJn75JTROEm+tOl3BNB/jsItbo3qdsffNUDALjaxXhpUTN6pZ3pF3XELTIiJw4TN85NZbEYSSehXa/gITVPVCIsqoXYO7Sf7lNJVnagnXYqumQZltpQCM8HCN5skKzTnraImuqROdlLYZITELSNGyiNkz48X4GrkIhMXmWCUzkaQHYmKDMRNRN7oxoiOfEBidR7EoxAn5ZBMt3GhBUdKKYYI61tcswMDu12vcu7aLRnDuY456FZjHR53oN2Q47aGioxR8NBgP1wlBBtzg8epaHMAyE93iJAxnwBM8ASnlz/d46yo4Ab8J6N/AxULmhqq0Ornh5dZewKbWboRQyFYBWTdxn7mWkCpNnr4ZjPMoz89OHNg31YwEYEubzHGq1/IzUIlB30CIb2oHdOWmHJZuyxIvVh17zu++3xiXvmmYY18S9986mQY9QeJQ/wkYlLeRNOekZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(110136005)(54906003)(26005)(426003)(336012)(47076005)(1076003)(83380400001)(186003)(6666004)(7696005)(508600001)(2616005)(86362001)(36860700001)(70586007)(8936002)(8676002)(4326008)(70206006)(2906002)(44832011)(5660300002)(40460700003)(316002)(81166007)(36756003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:43.3072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d47487-b43b-4e15-6e9a-08d9e169b883
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651

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


