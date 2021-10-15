Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFC42E718
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209685.366262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcX-0005l3-FX; Fri, 15 Oct 2021 03:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209685.366262; Fri, 15 Oct 2021 03:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcX-0005j8-A1; Fri, 15 Oct 2021 03:10:57 +0000
Received: by outflank-mailman (input) for mailman id 209685;
 Fri, 15 Oct 2021 03:10:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDcV-0004HS-CC
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 799bfe36-2d65-11ec-821f-12813bfff9fa;
 Fri, 15 Oct 2021 03:10:40 +0000 (UTC)
Received: from AS9PR06CA0338.eurprd06.prod.outlook.com (2603:10a6:20b:466::32)
 by VE1PR08MB5648.eurprd08.prod.outlook.com (2603:10a6:800:1af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 03:10:30 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::31) by AS9PR06CA0338.outlook.office365.com
 (2603:10a6:20b:466::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:29 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 15 Oct 2021 03:10:29 +0000
Received: from 4e1d6899786e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8751317-415A-43BB-B316-49CF04254EDE.1; 
 Fri, 15 Oct 2021 03:10:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e1d6899786e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:22 +0000
Received: from AS9PR06CA0398.eurprd06.prod.outlook.com (2603:10a6:20b:461::17)
 by DBAPR08MB5639.eurprd08.prod.outlook.com (2603:10a6:10:1a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 03:10:20 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::89) by AS9PR06CA0398.outlook.office365.com
 (2603:10a6:20b:461::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:20 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:20 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:19 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 15
 Oct 2021 03:10:09 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:17 +0000
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
X-Inumbo-ID: 799bfe36-2d65-11ec-821f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imPNKA0H7eYyeIQsMpyGnIIqmigQJ3jDrzkFsH2EPao=;
 b=kEVIc37F96phUFViCOuJNrFF/1K1GuwA022WH4KZ3V2Uei2snOVK21lNSXG2qwo9JVL/t55l0GZjP6OI7KbhqanL+XwhUogX8OaKh13Ctf+CzHltFYwHW0DPwbgsOK9yJ4XM163rOmeJvCtOMBv2N86fI9adXQJqggQAMQU8pfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18f086eb5cd28944
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8VERSv3mkuqj0stD7mknQBK8A/QbWmTv+6KlzkX4nlLmntcDQgrRyUt9chE5o0+uEQAe7Ky3BknBfdIM8wbxbITmEU1Uz8dxrSpsXM25qNA+WAgEq37AhcGB/xuVj6F0VwA4BM8+yFOT6k2q5cWnTHFwqJAoywxQp6qkEzSbt4C6U7aYvoz6tFPqLuapPmxidrx3WuafEO1+SKOGNon3qtJJ5wj4ntET6pSjkQ3OMYxH1/F7FhfmXttPl8QJIji0k1v3VjBZeZfSTinW/BG7qJ8O4E5eNyQVxvC7t1MlL0YBnFbH4eZD0HQDdr5+Y+jsTf2W9LyOdACpM/96PopPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imPNKA0H7eYyeIQsMpyGnIIqmigQJ3jDrzkFsH2EPao=;
 b=jJvH7hlXphoMRa3RkgoD7n868B19GPiEygSu/0QUJ2Xa5ddsxjEEvjcplMyiMIvBkSQxUKa3U2WNb7wwhlnVqv9ZWqfybz0SxeBVJWlfs74KGtJEIo/TxfeiybczpNGyDE7WAxrOkBaWvbRkKSrbFCnt0J+WJhivSFHn3HjlHrzs33hMIoIDw/3J9XIWutk6nVL+viLjAvl90i+EXJ3HCoRWcSoyZp0yX9K8+a3D92GUAlJOEJGQ66FYqDLCcNqTdbPsD/Yoc9qyCxaGZOItA/I9WmkGYclSGgvfEOuMsppUUwiA7bX+WQNhmgDnE6O8dluSS7DDAZJK2T2JM+W9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imPNKA0H7eYyeIQsMpyGnIIqmigQJ3jDrzkFsH2EPao=;
 b=kEVIc37F96phUFViCOuJNrFF/1K1GuwA022WH4KZ3V2Uei2snOVK21lNSXG2qwo9JVL/t55l0GZjP6OI7KbhqanL+XwhUogX8OaKh13Ctf+CzHltFYwHW0DPwbgsOK9yJ4XM163rOmeJvCtOMBv2N86fI9adXQJqggQAMQU8pfg=
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
Subject: [PATCH v2 4/6] xen/arm: if direct-map domain use native addresses for GICv3
Date: Fri, 15 Oct 2021 03:09:43 +0000
Message-ID: <20211015030945.2082898-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015030945.2082898-1-penny.zheng@arm.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b0e14b7-1853-4a51-c54d-08d98f8957d3
X-MS-TrafficTypeDiagnostic: DBAPR08MB5639:|VE1PR08MB5648:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5648A6AC25A09CFFE85B4426F7B99@VE1PR08MB5648.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NDozGu6S7ZOrgIBvkIn1ccJ5NjUg80/i3GDFQso6RUr0/TW4Q2/n2BbVt/B2VSVzCPhUfvXbM6uWblLf2RGwor9kMNZ9DTIPg/2n3zv2+ARPYiiZODLnsdBOlyfTajLhEfbwWIjKSKut1jQdO5O/z6d983Iij85gTSt1R6CoSSFLqQu/NUuxKuNY+OEL/SEoQoq8b8IImXonDPziHtFmNBoFNEnOkLsyO8xhuG/H7QosKhOfwi1ji/1nZEDb2iKFken92G6Nl4G27C75bqokck2idvvsomKbacEO8Zqh1UzCHe8kbSPr1xH0b1yFZff1fe2bDYffu26jYyimEPEKyldBTTRCCRpnsQiuLBE8LQUF1NNWTdk3surLfQL361Bl3SjXhWhrPcfV0+UATalnDCNs7sxv/POM+fbTMwk/U3mhpcXjM+mQ6xCtdh8URP2EffUPkD0IYgmh2Taam9KDGMX2OtMsGlqm3oBh3NJzETUZAFgC5IhJka8fpF4C6Rc/lLPHHB6LMQxAwKgRTqofCqTLP30db3tpYkL1Untz4lD/GDgBjeJMZmHRol0DMQneptVz6UDHflWqJQHwZp/LNwqWnsx/bEDawpVdmQ/mCB142NEQwqRSkdjX1qJcPL0OK9Do6UlxTNRUQHGsli9dZx1uZFDU7motXkAHZIj9CAc2rPaF//WjujlLV+aGcVNdydnpqjW2DpkXIQIxouP74rlFPx3c6CXHpFmhsBGleZo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(70586007)(2616005)(44832011)(8676002)(7696005)(508600001)(426003)(356005)(8936002)(70206006)(86362001)(110136005)(54906003)(81166007)(4326008)(47076005)(26005)(186003)(83380400001)(5660300002)(336012)(6666004)(36860700001)(1076003)(36756003)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5639
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f97f0dc6-6be6-4887-e2b3-08d98f895270
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nHl6mVwcN0gSxhu26QdTNBh+UEblMFIQCVEgiB5bv3f7v4NuTkOFuS8piuRPNvpVRDIE42oTtOAyOLZza/AzkePf9AHRK9UTfNtWm0GvSGWjQEJ7+2WnPKzJ2OR3WzuyOa4ge7tw7uObkfrkDblbOoAo4Dhz9EajiaXR7ltO8PkeVn9Dq+VMZ3UMVNqX7yzqll8nXQ3MN3AwaauZnzM4P1x4uxnGMh9GRTW8SLANn8qRIfV0dB9bZ0Nbdd+3ubwyB0fFZeDC2Fjl4+WXR2VnCiYs2FFCBG/QZ6c/mYOXWMuEWXJ2c+aGLp01t2enJAR282OuIqR279QkQyo0Bal1S+bwlSassAvILqsfnj0saZFGVaqccnSU4sJLN222L+f4Z5DOHwmPBi8LeUXkMbqx2Hygp4w6gBJaIT3YXdxlA4hdmMeQNZDpnH7YRU9v9LCN3Fx82Rjkc6ghpjXuXoEVdYFtKvOgqzERaY278ghXBwewySkJCNQWWmrdCgR5Yj7VTo+Dpus0etm/lhX1pvSBw4uFKbnYi+1olilv6s3S+9TQjU2P/P/qbBbN+vpCJuTI++jbfZiBvsQMhpWB9oABWEUK3hIdeArRgcSKJSj6mXcoqQsfYTWCoFafJjTAuNQNdX2UEOu17r0PAdOTTxfVEescQaN0u4xzlOUeTJzKaMUSr+zegw4yZV0rqPm2pvA9PtFAdh93KH8zUOgjpQKv+w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(1076003)(82310400003)(110136005)(54906003)(8676002)(36756003)(86362001)(2906002)(7696005)(83380400001)(4326008)(2616005)(6666004)(508600001)(316002)(36860700001)(44832011)(336012)(70206006)(26005)(5660300002)(426003)(186003)(70586007)(81166007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:29.5334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0e14b7-1853-4a51-c54d-08d98f8957d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5648

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all direct-map domains(including Dom0).

Considering that dom0 may not always be directly mapped in the future,
this patch introduces a new helper "is_domain_use_host_layout()" that
wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
for more flexible useage.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c  | 46 +++++++++++++++++++++++++++---------
 xen/arch/arm/vgic-v3.c       | 20 +++++++++-------
 xen/include/asm-arm/domain.h |  3 +++
 3 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6cd03e4d0f..7e0ee07e06 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2255,16 +2255,20 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     return res;
 }
 
+#ifdef CONFIG_ARM_64
 static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
+    __be32 *reg;
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[38];
+    unsigned int i, len = 0;
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
-    if ( res )
-        return res;
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
 
     res = fdt_property_cell(fdt, "#address-cells", 0);
     if ( res )
@@ -2282,35 +2286,55 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
+
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    for ( i = 0;
+          i < d->arch.vgic.nr_regions;
+          i++, cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) )
+    {
+        dt_child_set_range(&cells,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           d->arch.vgic.rdist_regions[i].base,
+                           d->arch.vgic.rdist_regions[i].size);
+    }
+
+    res = fdt_property(fdt, "reg", reg, len);
     if (res)
-        return res;
+        goto out;
 
     res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
     if (res)
-        return res;
+        goto out;
 
     res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
     if (res)
-        return res;
+        goto out;
 
     res = fdt_end_node(fdt);
 
+ out:
+    xfree(reg);
     return res;
 }
+#endif
 
 static int __init make_gic_domU_node(struct kernel_info *kinfo)
 {
     switch ( kinfo->d->arch.vgic.version )
     {
+#ifdef CONFIG_ARM_64
     case GIC_V3:
         return make_gicv3_domU_node(kinfo);
+#endif
     case GIC_V2:
         return make_gicv2_domU_node(kinfo);
     default:
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cb5a70c42e..70168ca1ac 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1641,14 +1641,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
      * Normally there is only one GICv3 redistributor region.
      * The GICv3 DT binding provisions for multiple regions, since there are
      * platforms out there which need those (multi-socket systems).
-     * For Dom0 we have to live with the MMIO layout the hardware provides,
-     * so we have to copy the multiple regions - as the first region may not
-     * provide enough space to hold all redistributors we need.
+     * For direct-map domain(including dom0), we have to live with the MMIO
+     * layout the hardware provides, so we have to copy the multiple regions
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
      * However DomU get a constructed memory map, so we can go with
      * the architected single redistributor region.
      */
-    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
-               GUEST_GICV3_RDIST_REGIONS;
+    return is_domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
+                                          GUEST_GICV3_RDIST_REGIONS;
 }
 
 static int vgic_v3_domain_init(struct domain *d)
@@ -1670,10 +1671,13 @@ static int vgic_v3_domain_init(struct domain *d)
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
     /*
-     * Domain 0 gets the hardware address.
-     * Guests get the virtual platform layout.
+     * Since we map the whole GICv3 register memory map(64KB) for
+     * all guests(including DOM0), DOM0 and direct-map guests could be
+     * treated the same way here.
+     * direct-map domain (including Dom0) gets the hardware address.
+     * Other guests get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( is_domain_use_host_layout(d) )
     {
         unsigned int first_cpu = 0;
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index fc42c6a310..e8ce3ac8d2 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -32,6 +32,9 @@ enum domain_type {
 /* Check if domain is direct-map memory map. */
 #define is_domain_direct_mapped(d) (d->options & XEN_DOMCTL_CDF_directmap)
 
+#define is_domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
+                                      is_hardware_domain(d))
+
 struct vtimer {
     struct vcpu *v;
     int irq;
-- 
2.25.1


