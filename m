Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F642E716
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209669.366229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcA-00040i-78; Fri, 15 Oct 2021 03:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209669.366229; Fri, 15 Oct 2021 03:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDcA-0003yY-1v; Fri, 15 Oct 2021 03:10:34 +0000
Received: by outflank-mailman (input) for mailman id 209669;
 Fri, 15 Oct 2021 03:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDc8-00031m-Ho
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 395ce30f-5fe7-405e-845d-6938379d9c0d;
 Fri, 15 Oct 2021 03:10:26 +0000 (UTC)
Received: from DB6PR07CA0160.eurprd07.prod.outlook.com (2603:10a6:6:43::14) by
 AM9PR08MB7181.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 03:10:24 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::f1) by DB6PR07CA0160.outlook.office365.com
 (2603:10a6:6:43::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:24 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 15 Oct 2021 03:10:24 +0000
Received: from ffe3fb46b1ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4BACB67-B6D9-4344-A018-674E412F48F7.1; 
 Fri, 15 Oct 2021 03:10:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffe3fb46b1ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:18 +0000
Received: from AS9PR06CA0401.eurprd06.prod.outlook.com (2603:10a6:20b:461::11)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 03:10:17 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::14) by AS9PR06CA0401.outlook.office365.com
 (2603:10a6:20b:461::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:16 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:15 +0000
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
X-Inumbo-ID: 395ce30f-5fe7-405e-845d-6938379d9c0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEsr4bkhs7W4ATHTkk+2qiqGbJjeKmz0+jICjq2cJtM=;
 b=se+Fsm/rlr2iGnZ0jz/7J23DSxaDhbSNqsngOBiKrM7NU6Vr2CXmarGtlBXVCmAoNlegQ0Jnoz2J75RsPrAK1BUu/yXP1hx7Qj8/nvsiGCQHWceHnWsVbA8cLjTifYWhBYqETOpBUCsNtK4/iZ9DSQ5AUTe0WNjP3Uq5UTkWJUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53ddc38c1662d605
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGrSBwJjWc/1WNHIzhck/57wvhvWUhiLTI56rJtX3Qg38Zj8ag8KoSce+oqfC6ALs1WMNilpRbJp/MIute7YGhO0lGWK3/KwAwa+8nO2woHnpRKFWg61HaMuLM6J1/IVNAoNM9kHnBaCXPZ5ihQFwfqPn8x6wLf3oRPeWqPAWjw6JcjgjNbpoWrNgP7BjZxvqFY4UtcrwDs8LZpVTT6yafgR/BqypKj/FRWYjQf2js/91wGTVuc6pMcq6/QV2FPaRvtNWwBlULKPKWPylIQMmvSKak8oY9EUGzbGPrWvQKyqyLnjmMK5m5X6W/xCNoenoLTTwbDdR0UApsKCgpPxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEsr4bkhs7W4ATHTkk+2qiqGbJjeKmz0+jICjq2cJtM=;
 b=NZ0dK1Phnlat+hBiXIYvG5VUprixcKAb9ge6TTyWa2Mj3NsL9QtmRhUpLwIwAXHH3cmgeTF8pJq43GMVdjNK04dNCjpavzlaaQipe5+zJnNN8u85rFzWkdAibIrd8GZJEUFpiO+epEGdc5pxiiwMRLiDAGAdZYwRJZlgPR5IhX3WysLJNv94SEioQxzSwpLgeN/YQhdtIxzjeM3CdXZiqEi6g/DKrCHeUzgi/rsb4T5Va6n4fEFyDZrDF1CmkhV4QCtpXDOCyObCHPh60w0RoMJVvZoBjn4lPrFyGOoX5OUf/QQ28apBIxk9HGLRzTcNSfsr5A0pWyupikA66jV/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEsr4bkhs7W4ATHTkk+2qiqGbJjeKmz0+jICjq2cJtM=;
 b=se+Fsm/rlr2iGnZ0jz/7J23DSxaDhbSNqsngOBiKrM7NU6Vr2CXmarGtlBXVCmAoNlegQ0Jnoz2J75RsPrAK1BUu/yXP1hx7Qj8/nvsiGCQHWceHnWsVbA8cLjTifYWhBYqETOpBUCsNtK4/iZ9DSQ5AUTe0WNjP3Uq5UTkWJUg=
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
Subject: [PATCH v2 3/6] xen/arm: if direct-map domain use native addresses for GICv2
Date: Fri, 15 Oct 2021 03:09:42 +0000
Message-ID: <20211015030945.2082898-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015030945.2082898-1-penny.zheng@arm.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d8afc69-c804-4b0e-b64d-08d98f8954e7
X-MS-TrafficTypeDiagnostic: PA4PR08MB6046:|AM9PR08MB7181:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7181FB4FD7152E9F975EDC6CF7B99@AM9PR08MB7181.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PNJ/67xkCIWFpb4KOY1KM16O5bPBFu0aG51Vw9J9hEPbVXYWxO+xyez4pIfsZVtXPrhlWMO6ntHcwLJRw9jNKqdYN+SrCoaAtLI97M00AgtLYhYTw/zu9E6CGduEpT3e/pZKu5Y5+oMDyYMKpEU/ldA2nILSQkcyXJfHjSRCjhEkOFQnrb4xThUOje+MGnT8dRxeCn88jPgV2dFtTVBjLEb1im+YidqiLPvC8CoYOkgNFzXZz4zlP6JJdgndJ2KDbc1LZtoumHet1SEfQG3oTiIUMpd1s+cJqt7ryK0pmRiJdXYctCzGjqzl5pvouaVYVENESnvjidoSS0lC+Cx9d4vmSymSwdBb/dGY4cZ6nWUBPdamRcRtUjGcSERGU2oYRBkYe4IlTxsG+y/t2TuWVNwcXCLns2QWEpRgwLosT+zYd5HBMAAz/0I/95IMmsFG4RJ4WxHoFikaQsHgNV05yPn5fHZPKubQ2SF2YacR+1hPB87cgbxI/jzAGvKtyxh9iR154CNm+ce6y/ocAdlfSotO5KA13txxcfKYD2HyFcIPvwWdRIch6SgnjFAd6YoFqhvk2Ir03l4CqQMAwO2Ung0eyZeZPjc1L3U4PcRBZlaZZjOLbw53F48NT8NwnrGPCnXRtva1inpZTHSbAd7rRKUQRdnn1gAXw4yoCD1OckAkvQRKMtKzzIioJrXzkOico1WIUzNp6dU6EHwnwQbthjSM46w4GAPwoCUNCcwiUWo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(8936002)(186003)(36860700001)(54906003)(6666004)(508600001)(36756003)(26005)(44832011)(1076003)(336012)(2616005)(426003)(70586007)(70206006)(83380400001)(5660300002)(2906002)(82310400003)(47076005)(316002)(110136005)(4326008)(7696005)(81166007)(356005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	971efdad-6d15-4ec7-7a81-08d98f895024
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AGlGs6QQ2pNmQ5tHqYMx33ZnW9g9ZNgRbZFwtYVq8sXVn9UIwEWBUVhXqyeSTrO0I2u6GrBXF3zZL917LqKHd7pWHrEaTSQXr6+yKLa8fw1BLsid9eSWH8HiUc08LwFllw1UZ/AbYYVfuS6SatFLz88KPO1fsXcoV9v3ET0eujOtr1SmpieltgSxpLaSHCtMt3mjXRgiO3nGhpahfYi8n72XqBdEi9FeFzZQh6ZKShm6PLI75qKVHq3pIHRcrkD1cskK9V8xDIrom4ltx90epwA5CZmng6HydokdiqGCLolR4xOTXxxZkOLaknfyKErMPpkEi228sPqRFSL03IN/64QoMpJ1w84wmtYNkL6CrdhWmeggGpfG6G9FcG324ASgjW8u/HpWcKD4dUo7FfY/bfTmfY0xBK0mus6XUKtI0YQYLT89uD9eZUg8mOk+3tffihB94g+FUNROUHYanzIIOIodFxKwvcwOrEx+4v5Mg61Slm9kcOSacENlt4hazGI9JLzHeUjZ3R33n0bL8RZQjwdzVgGHCpCPC0PD1RL9cXLz4obw5RDEYHxWoQztM5tL12l2CNKn2tCMKMg28qPnH+ZrozRqEIwVtn0I2ZqJjplFHyKcZ/BCVm8qVV7LCUZY/4wNI/83AW5+MupCISOKajmNYtUXjxADgB/UohA9QjI1i0p8U3KFocN0ScE9WDTkiaXQX9HKaKsMdly/yEcJzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(8676002)(36860700001)(508600001)(2616005)(4326008)(44832011)(81166007)(83380400001)(110136005)(54906003)(8936002)(47076005)(7696005)(70206006)(186003)(336012)(36756003)(70586007)(2906002)(86362001)(6666004)(82310400003)(5660300002)(1076003)(26005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:24.7319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8afc69-c804-4b0e-b64d-08d98f8954e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7181

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are direct-map memory map.

NEW VGIC has different naming schemes, like referring distributor base
address as vgic_dist_base, other than the dbase. So this patch also introduces
vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
address/cpu interface base address on varied scenarios,

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c    | 10 +++++++---
 xen/arch/arm/vgic-v2.c         | 26 +++++++++++++++++++++-----
 xen/arch/arm/vgic/vgic-v2.c    | 27 ++++++++++++++++++++++-----
 xen/include/asm-arm/new_vgic.h | 10 ++++++++++
 xen/include/asm-arm/vgic.h     | 12 +++++++++++-
 5 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d9118e5bc1..6cd03e4d0f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2207,8 +2207,12 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2230,9 +2234,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
+                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b2da886adc..a8cf8173d0 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -652,7 +652,7 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 static int vgic_v2_domain_init(struct domain *d)
 {
     int ret;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
 
     /*
@@ -669,10 +669,26 @@ static int vgic_v2_domain_init(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = vgic_v2_hw.cbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        /*
+         * For non-dom0 direct_mapped guests we only map a 8kB CPU
+         * interface but we make sure it is at a location occupied by
+         * the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.dbase = vgic_v2_hw.dbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase + vgic_v2_hw.aliased_offset;
+        csize = GUEST_GICC_SIZE;
+        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+    }
     else
     {
         d->arch.vgic.dbase = GUEST_GICD_BASE;
@@ -683,7 +699,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
@@ -692,8 +708,8 @@ static int vgic_v2_domain_init(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
         return ret;
 
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index b5ba4ace87..ce1f6e4373 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,7 +258,7 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
     int ret;
 
@@ -276,10 +276,27 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = gic_v2_hw_data.cbase;
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        /*
+         * For non-dom0 direct_mapped guests we only map a 8kB CPU
+         * interface but we make sure it is at a location occupied by
+         * the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase +
+                                     gic_v2_hw_data.aliased_offset;
+        csize = GUEST_GICC_SIZE;
+        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+    }
     else
     {
         d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
@@ -290,7 +307,7 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
@@ -308,8 +325,8 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
index 97d622bff6..28b0882798 100644
--- a/xen/include/asm-arm/new_vgic.h
+++ b/xen/include/asm-arm/new_vgic.h
@@ -186,6 +186,16 @@ struct vgic_cpu {
     uint32_t num_id_bits;
 };
 
+static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
+{
+    return vgic->vgic_cpu_base;
+}
+
+static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
+{
+    return vgic->vgic_dist_base;
+}
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
 
 /*
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index 62c2ae538d..3167bbb68b 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -152,6 +152,7 @@ struct vgic_dist {
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
+    paddr_t cbase; /* CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
@@ -271,13 +272,22 @@ static inline int REG_RANK_NR(int b, uint32_t n)
 
 enum gic_sgi_mode;
 
+static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
+{
+    return vgic->cbase;
+}
+
+static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
+{
+    return vgic->dbase;
+}
+
 /*
  * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
  * <b>-bits-per-interrupt.
  */
 #define REG_RANK_INDEX(b, n, s) ((((n) >> s) & ((b)-1)) % 32)
 
-
 extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq);
 extern void vgic_remove_irq_from_queues(struct vcpu *v, struct pending_irq *p);
 extern void gic_remove_from_lr_pending(struct vcpu *v, struct pending_irq *p);
-- 
2.25.1


