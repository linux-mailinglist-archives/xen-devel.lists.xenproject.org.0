Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58042E719
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209668.366217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDc4-0003dt-NL; Fri, 15 Oct 2021 03:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209668.366217; Fri, 15 Oct 2021 03:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDc4-0003bF-JX; Fri, 15 Oct 2021 03:10:28 +0000
Received: by outflank-mailman (input) for mailman id 209668;
 Fri, 15 Oct 2021 03:10:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDc3-00031m-HZ
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 478e79c3-3b59-4c9c-ab95-54e4fa51142d;
 Fri, 15 Oct 2021 03:10:23 +0000 (UTC)
Received: from AM5PR0602CA0006.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::16) by VI1PR0801MB2094.eurprd08.prod.outlook.com
 (2603:10a6:800:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 15 Oct
 2021 03:10:17 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::bf) by AM5PR0602CA0006.outlook.office365.com
 (2603:10a6:203:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:17 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 15 Oct 2021 03:10:16 +0000
Received: from b4fc1aacf8d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8527F6A6-7927-4526-A454-593505795FBC.1; 
 Fri, 15 Oct 2021 03:10:10 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4fc1aacf8d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:10 +0000
Received: from AM6P193CA0133.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::38)
 by VI1PR0802MB2493.eurprd08.prod.outlook.com (2603:10a6:800:b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 15 Oct
 2021 03:10:09 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::4b) by AM6P193CA0133.outlook.office365.com
 (2603:10a6:209:85::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:14 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:12 +0000
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
X-Inumbo-ID: 478e79c3-3b59-4c9c-ab95-54e4fa51142d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA93ev71jjsQB5bD/Q4KXU6rMKPVBWXpRQqghqNRYuk=;
 b=A0YwAEDoKcoO/0kegpd9NoB30Qrcaxd05VYFQQECycJKOYy4dB71hWlko5Fcl5ud3lv0f6Q2vGL2//sQEq0pd+jC0KHqLZNA/DbBZwTieMC2aM/bggFuj1FJ7O6ejzLstqh+I6ORhmzbYaLxxXmLsiSM1+YE7Z0BbwgO6JnlqFI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7f61cf881b5bfb6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBGFasJdHTeoNAUWibNZsrpRAH6dI2edm+1LOXVqFLx4Iro6FZhnEv9sTGJUni4pYDFOjB6lqFGDrRQH+ehlpu6jG991xD6cMWrd2Qt7+/WlfzHFE9az7rIZogIXkHveDcbw2RImI3AL3/JBZ9VUkFAWfpRnas1eHoOomZ0E4wYQ5xdKl9fTTSHrL2YAh8qAfxCkgiprJWRngx/wIdS7g8EWWeLgqcr85FJT19HpNhyTupJoOCeGtblsH3DuCdNClVL8nYi69oNOSnopHRB6ZUJbyKepvEakHYp+u7N3rb7kCo0o8LeXC4Y60/Rx86J8msDS5uJmn0/ViwTaFVIjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA93ev71jjsQB5bD/Q4KXU6rMKPVBWXpRQqghqNRYuk=;
 b=bsodUXocBRVGcnOoZHXz0HL4gE5SPHK8QDa+xEFApVUWhChW5PEg9hbmVokYhXr9sXnFKH6dzXcVm+WNfZ2yHKzktmZg6TOjG76rQA+RQgQvgpPW7MMv2wg90/FVdoCaX1naq3RIIe8+CTSo9X5mgd/z91vn5B6hlfvr6zcQ+SlNpqZnZsT8K5Pxs4VHndQFCE3osAvwGYbE/ip8uN7WKW3r36dysZ7AzGGddvS5JCkJtr7kDiWLMB5w0xJQSZAZGYYzcDoRHEam58dHT1vczRkvDIsS7bDSU3J4lEmjzkhvYy1FkhMnN+lfgiFzgZeXBolTOl+UtZrXZSyyIVoEHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA93ev71jjsQB5bD/Q4KXU6rMKPVBWXpRQqghqNRYuk=;
 b=A0YwAEDoKcoO/0kegpd9NoB30Qrcaxd05VYFQQECycJKOYy4dB71hWlko5Fcl5ud3lv0f6Q2vGL2//sQEq0pd+jC0KHqLZNA/DbBZwTieMC2aM/bggFuj1FJ7O6ejzLstqh+I6ORhmzbYaLxxXmLsiSM1+YE7Z0BbwgO6JnlqFI=
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
Subject: [PATCH v2 2/6] xen/arm: introduce direct-map for domUs
Date: Fri, 15 Oct 2021 03:09:41 +0000
Message-ID: <20211015030945.2082898-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015030945.2082898-1-penny.zheng@arm.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b49a3d1b-72ab-41b6-792a-08d98f895064
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2493:|VI1PR0801MB2094:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB209419E9C6DA8BC06E6C42FEF7B99@VI1PR0801MB2094.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:758;OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hfQkLJSxiWRx3p7LVMfI9H56F6vN1B12Z1VcSqAtXXwciwErU79/kA19r2SLOLD6FzeMt9KBG5wCYHhAfmdWchf99wDTCFd/p+T0sPD9/gDgnbVO17kgYHDPzx1MNkmIFLIMZ+XwNqNgwArrABJvxPwiu+xUsvu1VpsJY/Z+MbHh3Jx7CzF2Ur713ZUn4+ipi5+6z8+c1ekQG451qRVGUfDX3z/poXNa2j54pwWWca1zYtQeDlZxKFFp5ERpeyrqRHwrxg6Adg60XXnFJgwLOzsNa2RwlIz6B3mC8PSRdiQHYmZbDXt8DSOZDZtn1CFKuebcBuL/Q4m3SIRDjySc8UYxnrbI5vaJtgleOjYDtDbslGL0tqgy13nrGen1qsinMd0u3ptJL5FESnwQ6vNrm5ydGVOs/7LCU09ng5V08yxVYBasmx6yivzFNqbjOLvBfCqcQ2mbnw0zau6fT6cTNTXbFVpOiSowxtdYInWjeK2vmTcaUjNT360NliijPke4/P09PXhm+P+juz1cj/UhWZyCHNvUIyDGeT1CaJzCelwYisbX3yZysHuLGjiQmrBAupbJn0TPw2wggW7Z7ZH7TC7OWfJIeUUx3tUtkAvl34hIt2RNYtH0SkdmvoztnA1CiN6WBOZSD9jBhtXd279eRN+waIPvzmA0Cjtoo3f5kINUWe8SW8CZkXxSc8LwvyfYyMDH33zHU1qhWH3sD++JoQlkRmOhMelTUDNiVUUuXbE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(1076003)(81166007)(2616005)(82310400003)(110136005)(6666004)(86362001)(2906002)(316002)(54906003)(47076005)(508600001)(44832011)(83380400001)(356005)(186003)(4326008)(7696005)(8936002)(8676002)(336012)(5660300002)(426003)(70206006)(30864003)(70586007)(36756003)(26005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2493
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b9fc805-f6ca-4aec-5bd0-08d98f894b25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9uXFreIAbpys7NN/1RdbF9sQMW7DCW9rbxnRCbXJdq8K1QAiCs1RD8RmKFN/xQohV4ho1QF0CaOp+KCur8VX8kFqrWJXLyS6bjK/GGsrmeP2TFJOhitSF0Mf7g636+tZKkJQLqKOD0AvZfoiaEBslpl0nyCyyDTryJ+veOW1yaCDTl3RRkd+nqd+K2h+lXr8ib4b8wk3RS0datyyw/JkbsrWElXl9JR81fk87nj2ytlQYvGrkC3CNid9u2xs8a3iJXFJPGsS8uD/PrxVvd2MFQqu6tR013pfVTyKruJ5s0qUli45sj0dnfd+Q9wbl/QEN7b3CyKsvVgQWyjJFy5Q8Rbq/RF/zMA2rhwbNpoW5URqq9laF2jY9697HpQLwL/gS+HiRDW7tvCFSqXj5/z61ono4bFPq6LaANX2PdsFV/IrMk4zJNeDaIggFBdozspQNKPws1bxAshd6MhDLnpLi0ho6zLtxDVgC00k5H3abTv6vY5pV264JcjKp4//qekUuMO0QxhgkbbEo/80d8cHXibMngxI+2GEYlFIpnH3+gA5IRhsIfdvNJtFdnZ+NiZtkAzqJB0M9ymBJOzG8NcoX+RXh8W2DkU+rIGIgNT97VzfEXVNdocpqQQ2YmKECYR1zEy5duMX61mKWlc/XO5zAJoNJCsNLjZ1IveVEU4W9Q+M3rqj3zL73obRrP8aKqbcXo8YGRtACwynO6e+BlucPg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(8936002)(2906002)(1076003)(2616005)(336012)(36756003)(81166007)(82310400003)(83380400001)(316002)(30864003)(508600001)(7696005)(4326008)(26005)(36860700001)(70586007)(110136005)(5660300002)(8676002)(44832011)(86362001)(6666004)(426003)(70206006)(54906003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:17.1019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b49a3d1b-72ab-41b6-792a-08d98f895064
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2094

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Cases where domU needs direct-map memory map:
  * IOMMU not present in the system.
  * IOMMU disabled if it doesn't cover a specific device and all the guests
are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
a few without, then guest DMA security still could not be totally guaranteed.
So users may want to disable the IOMMU, to at least gain some performance
improvement from IOMMU disabled.
  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
To be specific, in a few extreme situation, when multiple devices do DMA
concurrently, these requests may exceed IOMMU's transmission capacity.
  * IOMMU disabled when it adds too much latency on DMA. For example,
TLB may be missing in some IOMMU hardware, which may bring latency in DMA
progress, so users may want to disable it in some realtime scenario.
  * Guest OS relies on the host memory layout-capablei

*WARNING:
Users should be aware that it is not always secure to assign a DMA-capable
device without IOMMU protection.
The administrator should make sure that:
 1. The device is assigned to a trusted guest.
 2. Users have additional security mechanism on the platform.

This commit also avoids setting XEN_DOMCTL_CDF_iommu when the IOMMU is
absent/disabled.

For now, direct-map is only supported when domain on Static Allocation, that is,
"xen.static-mem" must be also defined in the domain configuration.

This commit also introduces a new helper allocate_static_memory_11 to allocate
static memory as guest RAM for direct-map domain.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt |  10 ++
 xen/arch/arm/domain_build.c           | 215 ++++++++++++++++++++------
 2 files changed, 179 insertions(+), 46 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 71895663a4..297f8fa0c8 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -182,6 +182,16 @@ with the following properties:
     Both #address-cells and #size-cells need to be specified because
     both sub-nodes (described shortly) have reg properties.
 
+- direct-map
+
+    Optional for Domain on Static Allocation.
+    An empty property to request the memory of the domain to be
+    direct-map (guest physical address == physical address).
+    WARNING:
+    Users must be aware of this risk, when doing DMA-capable device assignment,
+    direct-map guest must be trusted or have additional security mechanism,
+    otherwise it could use the DMA engine to access any other memory area.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 37e2d62d47..d9118e5bc1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -492,8 +492,14 @@ static bool __init append_static_memory_to_bank(struct domain *d,
 {
     int res;
     unsigned int nr_pages = PFN_DOWN(size);
-    /* Infer next GFN. */
-    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+    gfn_t sgfn;
+
+    if ( !is_domain_direct_mapped(d) )
+        /* Infer next GFN when GFN != MFN. */
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
+
 
     res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
     if ( res )
@@ -507,12 +513,69 @@ static bool __init append_static_memory_to_bank(struct domain *d,
     return true;
 }
 
-/* Allocate memory from static memory as RAM for one specific domain d. */
+static int __init acquire_static_memory_bank(struct domain *d,
+                                             const __be32 **cell,
+                                             u32 addr_cells, u32 size_cells,
+                                             paddr_t *pbase, paddr_t *psize)
+{
+    int res = 0;
+
+    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
+    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
+    if ( PFN_DOWN(*psize) > UINT_MAX )
+    {
+        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
+               d, *psize);
+        return -EINVAL;
+    }
+
+    res = acquire_domstatic_pages(d, maddr_to_mfn(*pbase), PFN_DOWN(*psize), 0);
+    if ( res )
+        printk(XENLOG_ERR
+               "%pd: failed to acquire static memory: %d.\n", d, res);
+
+    return res;
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
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be mapped in the guest at the usual guest
+ * memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+ * xen/include/public/arch-arm.h.
+ */
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
-    const struct dt_property *prop;
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, gbank, bank = 0;
     const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
@@ -521,61 +584,31 @@ static void __init allocate_static_memory(struct domain *d,
     u64 tot_size = 0;
     paddr_t pbase, psize, gsize;
     mfn_t smfn;
-    int res;
+    int length;
 
-    prop = dt_find_property(node, "xen,static-mem", NULL);
-    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
-                               &addr_cells) )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to read \"#xen,static-mem-address-cells\".\n", d);
-        goto fail;
-    }
+    gbank = 0;
+    gsize = ramsize[gbank];
+    kinfo->mem.bank[gbank].start = rambase[gbank];
 
-    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
-                               &size_cells) )
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
     {
         printk(XENLOG_ERR
-               "%pd: failed to read \"#xen,static-mem-size-cells\".\n", d);
+               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
         goto fail;
     }
     reg_cells = addr_cells + size_cells;
-
-    /*
-     * The static memory will be mapped in the guest at the usual guest memory
-     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
-     * xen/include/public/arch-arm.h.
-     */
-    gbank = 0;
-    gsize = ramsize[gbank];
-    kinfo->mem.bank[gbank].start = rambase[gbank];
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
+        if ( acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                        &pbase, &psize) )
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
 
+        smfn = maddr_to_mfn(pbase);
         while ( 1 )
         {
             /* Map as much as possible the static range to the guest bank */
@@ -638,12 +671,91 @@ static void __init allocate_static_memory(struct domain *d,
  fail:
     panic("Failed to allocate requested static memory for domain %pd.", d);
 }
+
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be directly mapped in the guest(Guest Physical
+ * Address == Physical Address).
+ */
+static void __init allocate_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, gbank = 0, bank = 0;
+    const __be32 *cell;
+    u64 tot_size = 0;
+    paddr_t pbase, psize;
+    mfn_t smfn;
+    int length;
+
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+    nr_banks = length / (reg_cells * sizeof (u32));
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        if ( acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                        &pbase, &psize) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /*
+         * One guest memory bank is matched with one physical
+         * memory bank.
+         */
+        smfn = maddr_to_mfn(pbase);
+        gbank = bank;
+        kinfo->mem.bank[gbank].start = pbase;
+
+        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
+                                           smfn, psize) )
+            goto fail;
+
+        tot_size += psize;
+    }
+
+    kinfo->mem.nr_banks = ++gbank;
+
+    kinfo->unassigned_mem -= tot_size;
+    /*
+     * The property 'memory' should match the amount of memory given to the
+     * guest.
+     * Currently, it is only possible to either acquire static memory or let
+     * Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to allocate requested static memory for direct-map domain %pd.",
+          d);
+}
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
 }
+
+static void __init allocate_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
+{
+}
 #endif
 
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
@@ -2936,7 +3048,12 @@ static int __init construct_domU(struct domain *d,
     if ( !dt_find_property(node, "xen,static-mem", NULL) )
         allocate_memory(d, &kinfo);
     else
-        allocate_static_memory(d, &kinfo, node);
+    {
+        if ( is_domain_direct_mapped(d) )
+            allocate_static_memory_11(d, &kinfo, node);
+        else
+            allocate_static_memory(d, &kinfo, node);
+    }
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
@@ -2976,8 +3093,14 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
+        if ( dt_property_read_bool(node, "direct-map") )
+            d_cfg.flags |= XEN_DOMCTL_CDF_directmap;
+
         if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        {
+            if ( iommu_enabled )
+                d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        }
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
-- 
2.25.1


