Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E447A447
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249406.429846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7d-0000OC-Go; Mon, 20 Dec 2021 05:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249406.429846; Mon, 20 Dec 2021 05:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7d-0000LM-As; Mon, 20 Dec 2021 05:22:05 +0000
Received: by outflank-mailman (input) for mailman id 249406;
 Mon, 20 Dec 2021 05:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7c-0007eH-3d
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35552d3-6154-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 06:22:03 +0100 (CET)
Received: from DB6PR1001CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::27)
 by DB9PR08MB6505.eurprd08.prod.outlook.com (2603:10a6:10:23e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 05:21:59 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::80) by DB6PR1001CA0041.outlook.office365.com
 (2603:10a6:4:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:58 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Mon, 20 Dec 2021 05:21:58 +0000
Received: from b3702eb2c8a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 20A7C294-D398-43D1-9268-F691ACF9B383.1; 
 Mon, 20 Dec 2021 05:21:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3702eb2c8a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:52 +0000
Received: from DB6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::32) by
 VI1PR0801MB1984.eurprd08.prod.outlook.com (2603:10a6:800:8a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:21:51 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::6f) by DB6P191CA0022.outlook.office365.com
 (2603:10a6:6:28::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:51 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:50 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:49 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:47 +0000
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
X-Inumbo-ID: c35552d3-6154-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hGYW3cDcntczIjI51Up0+xBrq/unJHTNMFNvnTH4eo=;
 b=PRV0RRANcn2Lti8sVlkIStcF4YT72ivZ7tnLdytfQmcpo+Xe7bUqQSisLzHy+H1ZGxZhJzi4Jl0ETvBjXbgtY3VFyIwVROREvJuWPYvUcV/n7cdDcnb+hmh9Ogb8zABHyQvCfGtXN4oLd1sg58M6y82xw/8oUVrv3O3CtW4ivGA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d69331a78b09114
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqfJc4/x/bjv3W486RTD19ZK3dad4zdIGOQATtiVklaVOup0j7eiUKl25VWNooxV6kMLNUiZN2bnVT62FTjyoX3TCuAN9MzH8XCmkL8KHoQJTKTI/NEub282zi14DEStzSjxeIlRbm6J2kBOmudNF4DJOVcKzq5yFviiVOiAHaBeglhngZygb6GHSaGIS/uFkVBqHpsn/k4zOOjY6FvcvMbw56IeUALQueE+swZ4lNR886E1MhVnJJmLQMxoWiFfj4ntNBHeWORcm+r3mqFoWHV5JFq4JrnWI2sQjYO6xEaQuiCPigDcjQdl1y/bB1E1W/a8io/o4ZuBg3loLHSApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hGYW3cDcntczIjI51Up0+xBrq/unJHTNMFNvnTH4eo=;
 b=PLLw8IW1TTeEaA0Kg+QwZ1Ja8vSOD/+d4mAsD7cA+tQTMGMBXkKBXm06D68n9dQQgRxzb5WkSpS9LGky9iPVtdrwIjaMfAibVXQ4N1gNVGTsBt3G6ul2giAsIdOw9vxdaAjTi62VDslHkb9HrQ4O61SGsHrp/hgCZxR4wXgDgsW/qOLCaV0NPJqAFzqISX4JJD71M+A7f/vR8zhUGhU+fcfQUmQ9TAp+e2cXj9TIx2WcvderFqM/rxxbSLdzBEBNvDb31bWv/9jUIM76JpnbhAQ3xcTZC8k9bm8A+LSvmCfmLvVer+Kb6UZB9v4oGGr2mZHSGC/U6eoaKJqcJ0VQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hGYW3cDcntczIjI51Up0+xBrq/unJHTNMFNvnTH4eo=;
 b=PRV0RRANcn2Lti8sVlkIStcF4YT72ivZ7tnLdytfQmcpo+Xe7bUqQSisLzHy+H1ZGxZhJzi4Jl0ETvBjXbgtY3VFyIwVROREvJuWPYvUcV/n7cdDcnb+hmh9Ogb8zABHyQvCfGtXN4oLd1sg58M6y82xw/8oUVrv3O3CtW4ivGA=
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
Subject: [PATCH v4 05/11] xen/arm: introduce direct-map for domUs
Date: Mon, 20 Dec 2021 05:21:17 +0000
Message-ID: <20211220052123.969876-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: c8d1b557-70e5-418b-c94d-08d9c378a582
X-MS-TrafficTypeDiagnostic:
	VI1PR0801MB1984:EE_|DB5EUR03FT006:EE_|DB9PR08MB6505:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6505ABBA4F921317168C6669F77B9@DB9PR08MB6505.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5rkz5Th8QweEvQeJmmx0hY4JHXNUg5CjH3Ve03QWZzMRHcs6aFlhHC6aH2dEUlSiEJHAyriNAgZpfY3JyGLLtpaD1EQgYrSoT6/r27tbqjnyzHJrFI4Ha9gTSE2F7rmWaz/DQm57PpRp3Vu1LLHRR4dDe2UygpKVg7EVCOTghod1jPgbi/vdi/Isu4cs64e7X0kYH4gOwaYhbbjHduYXq9Zz1vwqA6xxxsM81uucpj/Dubd8lQWvpy2Yk8MoiGT7JDhNQ1QPWkYDORqz0udg+F3ztjM0c2l3xLAziXCaCKBcL+xnayaExlesZXLYDT0y32jXv/JHdQZgPVdXAXKk/WWktTcr5nEdRlxuw3vjvpwa1OwcAihGStVpbk+a0seixQ1yvj3XPyJIxTstuIghDQKgU+FQDEpSTz/aqnAJlPHA9D/c+fBg5qqKnX+BGglzRuIs5jMJQXoJFo4CUVWHW0etyIM7lEXQrkzbmzyWLER3/s5JoCIVKUf+Tuhzt5oJ+t44XdjOfu9DDWUZj3z4Qp7TxfiNho9NZjs7SrmP90lvY3Jjd0QBmiyRCm0JVI7LIkaQZhPDt4tPhyZEZUhwFiI8qZBMBU5XIeJaM2yrwG5bplwfIQlZV8IKm+VvzJwF6AbkAiICXPNl2l7pK8BiA8FcCjDi0/A+abFGaFbGsay4EDp2vxDbdfEhcY6cll4hbGAECLRpQUUS0Njg2snBfK1PElorGksCKmj4J+6tCiAgDYvQXun01zKgomGsKpIZKDC8IumOJd6g4qYEie84w4d9toJQWuxXVe9cJ3MGcyw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(356005)(81166007)(44832011)(70586007)(36860700001)(47076005)(110136005)(54906003)(70206006)(82310400004)(36756003)(316002)(4326008)(5660300002)(508600001)(8936002)(8676002)(2906002)(2616005)(7696005)(1076003)(83380400001)(26005)(426003)(86362001)(186003)(336012)(6666004)(40460700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1984
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a3d8c7a-4392-41c9-0eae-08d9c378a095
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slYPvGZXMicot24FPLZbhg5P8ZjCopFqZMkd8L1nj+mEC0gyWRexkA/tLU2KGLto0PxTSQ8E+Ej56cj+ckmG5m1bsChl3ydfB1UBis/cW/fx7vuwRbfVRzhwEYnYK3mO0i9n8W2bvuGLojAkQq5bap9VoQXC71ms8ZXwNCRhJr2XmWUv26rbaIDWAsUCwb4UA6aK9QgsFq6JusCIv1JJ/NOInOrB+57mt7wOj5Im+z+6LACQHm8BBHfVdLZGcTZJyK5UCHdigW7ji0N0quvI25KzB/Jj1k5VRZtL11fRJmKfL11LKvqSfS6JTOfDMnLp0aFBCF4v/+uDwcWu930KLu/w2d4VxRBL3Wg+YTcO5idCXpwlnePRFotFBIDmh0pBDvWV4P2lJetn0m8sfQv+Fyu+t5/apXI7aW3EalqhipJ/NTnOof05YIcvYdsPYoEfs/8MjDWI+d3EiG58sqKPtpY0x2KrDO1C1QzedyhouHq4KVUTj8DR+YPPDK00LsLapSL6C0Fd3KsVxOyFRNp2iX3AgIXup3aIKT7FDg00kS0AHmoBuA42gofWb2mq0FE0WS7qC+5wccy8hDixmOIk3naGTF0tCp93uWqUbgj1P5bpR3j5FfPF/WLopoE2m1FVMk9K/QwX7t6HJs7PKZgZCHB1hOFhC+nCFxq8JtvYi9fxinCnK7RhHMZERFWbni4OdJ5B63i1vy0Df6zWTGb2ZQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7696005)(316002)(186003)(54906003)(8936002)(36756003)(26005)(110136005)(44832011)(70206006)(70586007)(2906002)(6666004)(47076005)(5660300002)(426003)(36860700001)(81166007)(83380400001)(1076003)(508600001)(4326008)(336012)(82310400004)(8676002)(86362001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:21:58.9939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d1b557-70e5-418b-c94d-08d9c378a582
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505

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
  * Guest OS relies on the host memory layout

This commit introduces a new helper assign_static_memory_11 to allocate
static memory as guest RAM for direct-map domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove redundant use "bool direct_map", to be replaced by
d_cfg.flags & XEN_DOMCTL_CDF_directmap
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
---
v3 changes:
- doc refinement
- drop the pointless gbank
- add check of the size of nr_banks shall not exceed NR_MEM_BANKS
- add ASSERT_UNREACHABLE to catch any misuse
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
---
v4 changes:
- comment refinement
- rename function allocate_static_memory_11() to assign_static_memory_11()
to make clear there is actually no allocation done. Instead we are only
mapping pre-defined host regions to pre-defined guest regions.
- remove tot_size to directly substract psize from kinfo->unassigned_mem
- check kinfo->unassigned_mem doesn't underflow or overflow
- remove nested if/else
- refine "panic" info
---
 xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9206ec908d..d74a3eb908 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -494,8 +494,17 @@ static bool __init append_static_memory_to_bank(struct domain *d,
 {
     int res;
     unsigned int nr_pages = PFN_DOWN(size);
-    /* Infer next GFN. */
-    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+    gfn_t sgfn;
+
+    /*
+     * For direct-mapped domain, the GFN match the MFN.
+     * Otherwise, this is inferred on what has already been allocated
+     * in the bank.
+     */
+    if ( !is_domain_direct_mapped(d) )
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
 
     res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
     if ( res )
@@ -668,12 +677,92 @@ static void __init allocate_static_memory(struct domain *d,
  fail:
     panic("Failed to allocate requested static memory for domain %pd.", d);
 }
+
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be directly mapped in the guest(Guest Physical
+ * Address == Physical Address).
+ */
+static void __init assign_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, bank = 0;
+    const __be32 *cell;
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
+    if ( nr_banks > NR_MEM_BANKS )
+    {
+        printk(XENLOG_ERR
+               "%pd: exceed max number of supported guest memory banks.\n", d);
+        goto fail;
+    }
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( mfn_eq(smfn, INVALID_MFN) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /* One guest memory bank is matched with one physical memory bank. */
+        kinfo->mem.bank[bank].start = pbase;
+        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
+                                           smfn, psize) )
+            goto fail;
+
+        kinfo->unassigned_mem -= psize;
+    }
+
+    kinfo->mem.nr_banks = nr_banks;
+
+    /*
+     * The property 'memory' should match the amount of memory given to
+     * the guest.
+     * Currently, it is only possible to either acquire static memory or
+     * let Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem != 0 )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to assign requested static memory for direct-map domain %pd.",
+          d);
+}
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
 }
+
+static void __init assign_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 /*
@@ -3023,8 +3112,10 @@ static int __init construct_domU(struct domain *d,
 #endif
     if ( !dt_find_property(node, "xen,static-mem", NULL) )
         allocate_memory(d, &kinfo);
-    else
+    else if ( !is_domain_direct_mapped(d) )
         allocate_static_memory(d, &kinfo, node);
+    else
+        assign_static_memory_11(d, &kinfo, node);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


