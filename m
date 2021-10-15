Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CF42E71A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209670.366239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcD-0004ND-H8; Fri, 15 Oct 2021 03:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209670.366239; Fri, 15 Oct 2021 03:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcD-0004Kg-BZ; Fri, 15 Oct 2021 03:10:37 +0000
Received: by outflank-mailman (input) for mailman id 209670;
 Fri, 15 Oct 2021 03:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDcB-0004HS-Gf
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 752004af-2d65-11ec-821f-12813bfff9fa;
 Fri, 15 Oct 2021 03:10:33 +0000 (UTC)
Received: from AM6P194CA0103.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::44)
 by PA4PR08MB6254.eurprd08.prod.outlook.com (2603:10a6:102:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 03:10:30 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::b2) by AM6P194CA0103.outlook.office365.com
 (2603:10a6:209:8f::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:30 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 15 Oct 2021 03:10:30 +0000
Received: from 1892b2dd4137.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A85FFAB-1DFF-4C36-95B7-A78E8F997131.1; 
 Fri, 15 Oct 2021 03:10:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1892b2dd4137.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:24 +0000
Received: from AS9PR06CA0415.eurprd06.prod.outlook.com (2603:10a6:20b:461::19)
 by AM9PR08MB7118.eurprd08.prod.outlook.com (2603:10a6:20b:41e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 03:10:22 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::78) by AS9PR06CA0415.outlook.office365.com
 (2603:10a6:20b:461::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:22 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:21 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:19 +0000
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
X-Inumbo-ID: 752004af-2d65-11ec-821f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz58lP2uAUPeaLDiq8X99/gL5SOx543GcdmK5jCjJBQ=;
 b=V/O85K8GRDCTb7UjAMZrxP02Gsilok1P1XPrsUwSbamhWumAvu6QdX2Xqdr9oo69T0LDwA1Rk9RfjVM//8whtwVnQWTMZTy6lj87EG2UhohvmbgKMtH4yNdIRdOllgZF2Hs6xT406+9u5eNwWX31tJ6UGPQcJeBAubvlO1/CBBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1c1336286f31a8c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSJzBIYNW2oQ6MErBnEETmjSpkWdW2XQPSNwH98bqGkpRXtBNfSkeATh8jAyRVMWeP67vnxfsrUJL2h2BI5bt4dk4bWu6RaSfPXrL+jQxTltM3ES5wJGpMhwD2Li3TuET26Aal+y93u8UlsIJcLl6xDl8/Mj3gwHH3jjWS9yKJ6LtsYmxp1PLgORl2FtcK6iOS1f0ZCU38dSeq6CMCM5loP4aepC8NGYeYmcJLMBhRZrLTtdzh/OBb7Ee0UJuLEqO4EzEfFGl/v1c+nO/4IyveN6vf1qCEQoMF1aCoLktmVf3nA6cuFXAQwsQF0/offpgMx/sn3iGcLpR+jUOBd/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz58lP2uAUPeaLDiq8X99/gL5SOx543GcdmK5jCjJBQ=;
 b=cxSKBtxeATY7zrZ5uyxUkEyhWc4VCcxJIUVtyTaHO8jnkzogiFY7bS0WdiA2ojP0wHP3cjghUJx+sRZvpzqGEdMLeucT1NblUuLyDfQIrz7rHNgg1Bfrs7UJ3TiN7nH8+nI/0ukp84ZvJTWiyQ/qrU/tzTpASb69LY+sN0x1m/MRuup4ny+vwQHaMXucQv+PSDUfIaq0r3Uv3kELNYUWzRopn8HWo7N25d9FSArfR02HbnrTYVux0pt+61Cr5U7T1RCPIR7LVpOuzXE6zW5eaDtvxcJdY1D+NOUamK7ydk9HUfS1Fi5POuFGix2xoHcWtrDjnxINEvwoAnOE4aFXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz58lP2uAUPeaLDiq8X99/gL5SOx543GcdmK5jCjJBQ=;
 b=V/O85K8GRDCTb7UjAMZrxP02Gsilok1P1XPrsUwSbamhWumAvu6QdX2Xqdr9oo69T0LDwA1Rk9RfjVM//8whtwVnQWTMZTy6lj87EG2UhohvmbgKMtH4yNdIRdOllgZF2Hs6xT406+9u5eNwWX31tJ6UGPQcJeBAubvlO1/CBBk=
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
CC: <Wei.Chen@arm.com>, <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 5/6] xen/arm: if direct-map domain use native UART address and IRQ number for vPL011
Date: Fri, 15 Oct 2021 03:09:44 +0000
Message-ID: <20211015030945.2082898-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015030945.2082898-1-penny.zheng@arm.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fb8f1a-1b73-4273-4ad6-08d98f895864
X-MS-TrafficTypeDiagnostic: AM9PR08MB7118:|PA4PR08MB6254:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB62546D3BEB191DB925CD535EF7B99@PA4PR08MB6254.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mZTk7GJ/OXb7lJCHStCxSUhves0syM1xZVWF8rNGgBN2UpRVuNt/btG4A6cnj29rZPHc/32KWzOMIbBA19+2vk6efucYWdYQpqThDaSQdavSNrwYp9MvzKmWG31zfVqaaM6MW0/DYL3BalWJH0/AA68X10eN9a7wrCjwPV6ucT8KcaDAXtMqRBTnIahLQ+C1B+/JTHB1Zs1GgbxqSkKXDeyU7GwZSrvo8zLeuePOZ8lyDCIptcXacNBmRntulwASjgxXc1vKK6sPxJm1GYt/Ns77pRC6ar/dKvs1dC3H5DkqVrzJ9Lb1tQk6YRUAjT9n31RDdzenqu3Po7zNFi3fEHGLf0BiMAbxR8Uch3XrcLJUv88L2UMNOnAk9IlFzDVUcsHBUaCcCgZuExeztBBiz4SBml+7noVFrZGWPbwmqSfzEcj2kVv+a5is6Zqwq7sh6EIxDIOFsN7Xai48aOinn3PTfK+Lt+gPPPFcMOu9xl8Gwm5Bdjv83MIroNik2+9pmyReY4WOi63eLXi4adiav27w3YKvqIj2g9xqLx3WeD8UVc9uY4eItX4t7RhSJG56rQ7xLLOGS92GswpxBUPqt2zRGlZ3t4MboFGFr0u/vG4t3T691fVKbaTwNv4ZmUqEUqYEsxlOKGjhanqGWHzhDo2JgXJOa1EuZD1i3V52ua1jyV1JM2HETJLY2S5oH3V/OEXO6lP+6JT8UeZ6wCyt3D/Fqg72fmi8ImQa5EPn7L8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(8936002)(426003)(8676002)(86362001)(82310400003)(336012)(70586007)(186003)(26005)(70206006)(1076003)(47076005)(2616005)(36860700001)(36756003)(356005)(508600001)(44832011)(7696005)(54906003)(4326008)(6666004)(110136005)(316002)(81166007)(5660300002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7118
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e454218-ecbf-4d35-cff3-08d98f8953b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xJVMe2D0bDU38cKa61JOOZVGa1nJXLQRd7wCqOoOoiSO10mTXZpz9v2ADuoR/ixzDx/2y6ZEgO36KtoE/tdhY4/S75CVZk6seNq5K6qWM4LaC2gBnPoZ/nvh3j32xN2oMpyKotTqhckVy5EdnNbcVOlYqBmRh+ANFB9DA5vPKsKE8uIjcPiVnUlKu4Fxd9OgpKAwDwzYXg/TdR4YEF6xZwvPSbDZL5/6n2T4oDd4OyJj3r6T28a/TqJxFyuX8Kp34SPSV8NEmvU5Cll+R5cLOMmyDm3uITz9yEB09+NCnqKbWeyWTbKK6Ko/emZDPNsrMKweu7r59uAyLjIUaTPZivmWhyAEBlIB1prfCkC0k4hndtpe7OvPwURWD/ncQgl+659765EWj6OxTmQX8HGBo0b1Fvuz4pZmRxSFUuuUgyC8Bh2eS1mGJLNsplWcOrVroN1EH63eZcgR53Yp+PB1NJskDNL0TTgYp9r5uh8YmkEQb6VIqYAx3Y3Vqs6+JmbXJoWYjcPTR/B3LjdTJpljnrjoVsNFAUNsgZXm+U2lzScytsDUByExlvI6nqvYUL0qN89OyieejroKyBOKZG1rX47/728fwI1jKlHTJIhrBO5Y0NXLcg5BNjXazbeOTHFMJ1qaB4v2XimNEpXmD7BJp/gp+0P6JUWv/xmn5+N3ZEOy4pEMeUzjxd4nR3lwu90VbCoTAy8RKDlgrHlhTVpXrg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(36756003)(47076005)(8936002)(336012)(7696005)(70206006)(186003)(1076003)(26005)(426003)(86362001)(2906002)(6666004)(82310400003)(5660300002)(36860700001)(8676002)(508600001)(316002)(81166007)(83380400001)(44832011)(54906003)(110136005)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:30.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fb8f1a-1b73-4273-4ad6-08d98f895864
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6254

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

We always use a fix address to map the vPL011 to domains. The address
could be a problem for direct-map domains.

So, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Do the same for the virtual IRQ number: instead of always using
GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c  | 41 ++++++++++++++++++++++-----
 xen/arch/arm/vpl011.c        | 54 +++++++++++++++++++++++++++++++-----
 xen/include/asm-arm/vpl011.h |  2 ++
 3 files changed, 83 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7e0ee07e06..f3e87709f6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -30,6 +30,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -2350,8 +2351,11 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[27];
 
-    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2361,14 +2365,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
                        GUEST_PL011_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if ( res )
         return res;
 
-    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
 
     res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
     if ( res )
@@ -3083,6 +3087,14 @@ static int __init construct_domU(struct domain *d,
             allocate_static_memory(d, &kinfo, node);
     }
 
+    /*
+     * Base address and irq number are needed when creating vpl011 device
+     * tree node in prepare_dtb_domU, so initialization on related variables
+     * shall be dealt firstly.
+     */
+    if ( kinfo.vpl011 )
+        rc = domain_vpl011_init(d, NULL);
+
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
@@ -3091,9 +3103,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
@@ -3132,15 +3141,33 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
+            unsigned int vpl011_virq = GUEST_VPL011_SPI;
+
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map in
+             * set, in which case we'll try to match the hardware.
+             *
+             * Typically, d->arch.vpl011.virq has the vpl011 irq number
+             * but at this point of the boot sequence it is not
+             * initialized yet.
+             */
+            if ( d_cfg.flags & XEN_DOMCTL_CDF_directmap )
+            {
+                vpl011_virq = serial_irq(SERHND_DTUART);
+                if ( vpl011_virq < 0 )
+                    panic("Error getting IRQ number for this serial port %d\n",
+                          SERHND_DTUART);
+            }
+
             /*
              * vpl011 uses one emulated SPI. If vpl011 is requested, make
              * sure that we allocate enough SPIs for it.
              */
             if ( dt_property_read_bool(node, "vpl011") )
                 d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         GUEST_VPL011_SPI - 32 + 1);
+                                         vpl011_virq - 32 + 1);
         }
 
         /*
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..2de59e584d 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/console.h>
+#include <xen/serial.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/pl011-uart.h>
@@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct domain *d)
      * status bit has been set since the last time.
      */
     if ( uartmis & ~vpl011->shadow_uartmis )
-        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
+        vgic_inject_irq(d, NULL, vpl011->virq, true);
 
     vpl011->shadow_uartmis = uartmis;
 #else
-    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
+    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
 #endif
 }
 
@@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
                             void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
                              void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -626,6 +629,43 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     if ( vpl011->backend.dom.ring_buf )
         return -EINVAL;
 
+    if ( is_domain_direct_mapped(d) )
+    {
+        const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
+        int vpl011_irq = serial_irq(SERHND_DTUART);
+
+        /*
+         * Since the PL011 we emulate for the guest requires a 4KB region,
+         * and on some Hardware (IIRC pine64), the UART MMIO region is
+         * less than 4KB, in which case, there may exist multiple devices
+         * within the same 4KB region, here adds the following check to
+         * prevent potential known pitfalls
+         */
+        if ( uart->size < GUEST_PL011_SIZE )
+        {
+            printk(XENLOG_ERR
+                   "The hardware UART region is smaller than GUEST_PL011_SIZE, impossible to emulate on direct-map guests.\n");
+            return -EINVAL;
+        }
+
+        if ( uart != NULL && vpl011_irq > 0 )
+        {
+            vpl011->base_addr = uart->base_addr;
+            vpl011->virq = vpl011_irq;
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "Unable to reuse physical UART address and irq for vPL011 on direct-mapped domain.\n");
+            return -EINVAL;
+        }
+    }
+    else
+    {
+        vpl011->base_addr = GUEST_PL011_BASE;
+        vpl011->virq = GUEST_VPL011_SPI;
+    }
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -661,7 +701,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
+    rc = vgic_reserve_virq(d, vpl011->virq);
     if ( !rc )
     {
         rc = -EINVAL;
@@ -673,12 +713,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     spin_lock_init(&vpl011->lock);
 
     register_mmio_handler(d, &vpl011_mmio_handler,
-                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
+                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
 out2:
-    vgic_free_virq(d, GUEST_VPL011_SPI);
+    vgic_free_virq(d, vpl011->virq);
 
 out1:
     if ( vpl011->backend_in_domain )
diff --git a/xen/include/asm-arm/vpl011.h b/xen/include/asm-arm/vpl011.h
index e6c7ab7381..c09abcd7a9 100644
--- a/xen/include/asm-arm/vpl011.h
+++ b/xen/include/asm-arm/vpl011.h
@@ -53,6 +53,8 @@ struct vpl011 {
     uint32_t    uarticr;        /* Interrupt clear register */
     uint32_t    uartris;        /* Raw interrupt status register */
     uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
     spinlock_t  lock;
     evtchn_port_t evtchn;
 };
-- 
2.25.1


