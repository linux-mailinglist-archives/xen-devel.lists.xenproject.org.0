Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E8452B06
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 07:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226077.390601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms17-0002Ww-D4; Tue, 16 Nov 2021 06:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226077.390601; Tue, 16 Nov 2021 06:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mms17-0002Uv-9h; Tue, 16 Nov 2021 06:32:29 +0000
Received: by outflank-mailman (input) for mailman id 226077;
 Tue, 16 Nov 2021 06:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dk95=QD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mms15-0001ym-Ax
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 06:32:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6495b7b-46a6-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 07:32:26 +0100 (CET)
Received: from AM5PR0101CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::32) by DU2PR08MB7327.eurprd08.prod.outlook.com
 (2603:10a6:10:2e6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 06:32:21 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::3) by AM5PR0101CA0019.outlook.office365.com
 (2603:10a6:206:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 06:32:20 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Tue, 16 Nov 2021 06:32:20 +0000
Received: from 9dafb0a6f6de.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 458B4345-CA06-46C2-986B-52038B391A38.1; 
 Tue, 16 Nov 2021 06:32:14 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9dafb0a6f6de.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 06:32:14 +0000
Received: from DB7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:52::30)
 by AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 06:32:13 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::7f) by DB7PR02CA0017.outlook.office365.com
 (2603:10a6:10:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 06:32:12 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 06:32:12 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Tue, 16
 Nov 2021 06:32:11 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Tue, 16 Nov 2021 06:32:10 +0000
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
X-Inumbo-ID: f6495b7b-46a6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTvbQKFMQheq96sNMPCwR4J14nUtOJ+ZT+GaGaSW1qg=;
 b=W3g0XDkvJWFoFClP89oy6DYOTVcKYYRglsnkM2B7gvA09kJUiMWcEhjkav8YoXi8sHPucY6fm89PlSa9/3/xb+YEIJYp3f2sI5dN/v9jhV8Wbq2tUSb0FOvCxm6wrDsBzFL03fOXS+Ig57DziLULi1v5yunHy4RQvL5yef1p7P4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7ad8a9ac52c75f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGKCuuoUFe1wZlab21eyz+2dZV8micQoFYPCAz+OcllGIxQ9J+xJe5DYIgqGQs2sg5dkT+u9qG+2HT1EjvkhrxI9b9MaT4xEt5W8nl0P5pgrpvXccAJiZYQ3wke9fCEr0yFxRzP1eSk/QU2Lma0IAC9LXF69JqKOVf4s+1oid1V47Vx4BBTlpZOeegF1tlWeQb4O7HX7redbOKldEs3z6rSpRdQ2ASnG+oAF8Vi2A8m1XoLFARjIwfni7f3ZwRIuP8thfyJkYXk7mGevsx0C5sbwfJIK2ShPOMPBmWUJ/8+pDHOgcDKsYaMn02M7i6fIcPQe+P1DS+jJo0XphlfCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTvbQKFMQheq96sNMPCwR4J14nUtOJ+ZT+GaGaSW1qg=;
 b=aDmWc7g3hH9yNwH1KG/bmRll0VUA8xLklYTgop0oczxQHtGl0qU7z4XhOjLEBDg5zs3grnWwYpM8ZvUkYzdKKwL7N8BV1MJwUh0wEeKbIeUnaW7RnRdNh2srVT71Vlp8dRvgV1dDv1z6e2BX95Q4HvjGhVfU78QrWR4GU6ENAFAt32TnpJNzP1+4rab2JEgM48VloJrSYWK9zh7c1Iz3K2UEWaxb25H4M8uktj1sJbBaHjJ5NioGGJGfgoBqClF0MSEHPRhQuxD2Kkkb33mZktZ+zED/k20f24gZxIBd4TtvjCyrTDw9IMRyxnwlhFVQ3iC0KiYIrklAFDJBEo1oHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTvbQKFMQheq96sNMPCwR4J14nUtOJ+ZT+GaGaSW1qg=;
 b=W3g0XDkvJWFoFClP89oy6DYOTVcKYYRglsnkM2B7gvA09kJUiMWcEhjkav8YoXi8sHPucY6fm89PlSa9/3/xb+YEIJYp3f2sI5dN/v9jhV8Wbq2tUSb0FOvCxm6wrDsBzFL03fOXS+Ig57DziLULi1v5yunHy4RQvL5yef1p7P4=
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
Subject: [PATCH v3 02/10] xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when IOMMU off
Date: Tue, 16 Nov 2021 06:31:47 +0000
Message-ID: <20211116063155.901183-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116063155.901183-1-penny.zheng@arm.com>
References: <20211116063155.901183-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d03205a7-5f00-4e03-be81-08d9a8cad7dd
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:|DU2PR08MB7327:
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB73275B0F53450CF9852325E0F7999@DU2PR08MB7327.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:372;OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yu3iwiXZ2yfULRM7fFSS56omg/WGt8+Xk/rj8PgEjNqzU65+RDIUQFtw7kIslUbAdyNeG3s5ifPPtRwy/n6B8FSFcwk5qMYTmitzdHYp9NGHv0dDTiedHPW0sQt9ovP+8krdPOKvujGS5SNQnIp9hi+4wtF7OUbBRSEC4DTo6hYFR6r1HGAhdI6dYB8fuoGWrt+Fs7AxcH4B8VYe5FhIHVu8BGRbvvbRltTMbO3e/wzfUhdrtpHdTXd+VEMhDQeHtvdXAPWRy8vhKUwKBWs6yTosIh5Ps0jWeQ0rYzcb0mJRBprTcvlKVJv4OG3e0+XeCG9UST3mPzDIx1GHtxwEW5kJZb2gFPJMiGRXwFrQu0S1xCiuA7GLpPQe5waK6tikjHTy/JkNGFuGRhxWFKO9J2WadSI2p5pbw6AJ27yniZAnj9E13KLxDe9HY0GTTUGckUZ1njJg51tcCohfWGS2S3sXAcRG+QAm+4DF2rqj8QgRPR9LY9zLcfllnOzSMxpY7LXINq10GtKDPr8ByHBDkqGFRadhOPS8wBe+32LzgMjEzx97p+WG3rAeboAu18HOBSsRh1xtAwT1vqadigb4McC1G6GaU2I5VyRsTV0gKfzCHz5TobknlFmRwakEzyZZW7TJF5qnIEHkAecJf2+xIPA7/cjBqk4YK9yyy1/Yj9UBWLyOYpSw/RzMmkZOD35EwyWkWh4MFiUsdr/T8n/zb5drIv41IJM6GQAZCH7oXy4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(1076003)(356005)(81166007)(336012)(47076005)(2906002)(86362001)(83380400001)(4326008)(7696005)(6666004)(316002)(82310400003)(36860700001)(70586007)(26005)(186003)(54906003)(110136005)(70206006)(8936002)(2616005)(8676002)(5660300002)(426003)(44832011)(36756003)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7095
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4acab256-3561-48c9-a860-08d9a8cad333
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SIOcJsurzCMMkEG/Ot7jiIYAMJ1i0AECsxKSJRXnD+BNq2AYMEFRLVHI75XJwEGu1BJkA7e+LYBGNBBuhkMF6YNvnvgR0KQjUqcV1bvAA/N9oG/o2ZB83ixvjV7TD6qGFLu4bi3yJr54ZodGNyYWOzibbHZH2wOmrd3wqmMGvEQUrUYDUG/V+Z3U/bXH9EBmMAGnvOHnUEYScZz7xKe6eNpuv4PcQjGLVGbhpdleuTBLBdvydi4CQMnjRMG0C7BSU1JO5jGU9WRxfPgajOMl6NZuFNky8TwZ8IdbzQsTFvbWaseJ/++jTpY22OCmF9uNtgDqS13lhCC6FRmw+ID5oqbOW83PLijemb4ZZd5OvZzcRg9zCWR3BRXp8FJs2b0fN5TpWlcG8SgUL8KJIjYm8zn6Qp7vqxAbhx6lnI89kaHYRmlKJ9pzQl6czuy/LSnLMd8GmmxtNHljmcm2WW9L0ToJUbsP0/36POBzdFOk6VboF5vL/SGQVDrBguNtuVqliWE1TMjHXZu7IqWRDz5f75ox5CVf/AT11ZJ3rQUs9OKO8juUiX8hKuEWl4zOXndmJhb+g3skYYNY96O650plACcAB/rlPDK0PmmLvDBs1legZ/klGauj5z3RivWwcsyRTNeN5CroDRefhRaoT7KdLs+GELJB/GMpT2DXm2aWxQb9AreuHAFBDFs+GLLGhOsKsKygZngdfcCXA/NR/wc29w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(70206006)(82310400003)(54906003)(508600001)(70586007)(4326008)(47076005)(186003)(1076003)(44832011)(426003)(36860700001)(86362001)(6666004)(8936002)(26005)(336012)(110136005)(316002)(2906002)(83380400001)(7696005)(8676002)(5660300002)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 06:32:20.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03205a7-5f00-4e03-be81-08d9a8cad7dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7327

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

This commit avoids setting XEN_DOMCTL_CDF_iommu when the IOMMU is
absent/disabled, otherwise xen will fail later when handling
device assignment.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
v3 changes:
- new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
direct-map for domUs"
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 664c88ebe4..7a063f62fe 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2996,7 +2996,8 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
+             iommu_enabled )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.25.1


