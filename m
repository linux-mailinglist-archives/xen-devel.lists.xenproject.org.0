Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95649DBF2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261228.452118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYm-0003f3-UL; Thu, 27 Jan 2022 07:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261228.452118; Thu, 27 Jan 2022 07:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYm-0003Za-Mn; Thu, 27 Jan 2022 07:51:12 +0000
Received: by outflank-mailman (input) for mailman id 261228;
 Thu, 27 Jan 2022 07:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYk-0000Xj-P4
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:51:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1fd8c1a-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:51:06 +0100 (CET)
Received: from AS9PR06CA0175.eurprd06.prod.outlook.com (2603:10a6:20b:45c::25)
 by PA4PR08MB6128.eurprd08.prod.outlook.com (2603:10a6:102:f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 07:51:03 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::1e) by AS9PR06CA0175.outlook.office365.com
 (2603:10a6:20b:45c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:51:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:51:02 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Thu, 27 Jan 2022 07:51:02 +0000
Received: from 3aa213c0726f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A40001FB-D96D-4334-9974-9672E1538D2D.1; 
 Thu, 27 Jan 2022 07:50:56 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3aa213c0726f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:56 +0000
Received: from DB6PR0301CA0058.eurprd03.prod.outlook.com (2603:10a6:4:54::26)
 by VI1PR08MB4029.eurprd08.prod.outlook.com (2603:10a6:803:ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:54 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::e2) by DB6PR0301CA0058.outlook.office365.com
 (2603:10a6:4:54::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:53 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:32 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 27
 Jan 2022 07:50:31 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:29 +0000
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
X-Inumbo-ID: e1fd8c1a-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl3pkQoUExfheoWKn2LL1MYHodWIJQAVAKmSODsmtEM=;
 b=vwMHaAuwe9WJ5uX602CpgHOUFjwzJG/w04emSjL0YtI438gWd7vjnv4KyEXYy2c5SexBk/o7x/kkX5T45YDe4Oui/dnSv7TV7+AA3Sx7Vo5BbZxMWBPOx7zXHHmu4tTtPp/Iaozc1Od/OWS6rHD5lz92bs+ta9JLN/93EuvRQGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c844911c2d0f9d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEAwo/xv1/topxQPlBp6JoeF2VhN/T61cESr/Ghdfq0YwbjX0bPkyFrqYB8iM56NEIQZShbc01WhlyeSgCFYb4OS/m+DCPqQdD/MSgdezQh2lQA+K/PHfURaULzgSDbaqBx2LlknAgwJDc92MUXPsqUZFRLcETRB9gCF9JZqWdfagSNL8r/wZVd+vzFXc8P3TB2blTmQB953Sxe02MyDVnxE/KS9Dfpt8A5xolUME/xdJDnWncSv+TLi+jzKJgz+AfNUUbOSg4czzE0olYjmZbT7V0IysMD+Ji9d2YBIOioo5+bGxxzLsRQ3F1h9mSkrufYUl6S6aOOzQRlD+YnOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl3pkQoUExfheoWKn2LL1MYHodWIJQAVAKmSODsmtEM=;
 b=PP7HDOL8M5HYSdUzE42w5OIGGhMB43wD/oODVYTMmpjSg3A2OjRVdJQehv7MzH5LizpN/UNXU/2+TmCa1GNDogkxSqp1D2Cd8z2y0hH2g3qqjNOG+0HsBnhekaKfMwuOHKEt4+A3FstBktPa7ztGYDJoXEx5Ps+s/M+O0k13uNNbI207LqBQ1jd5PE42umtVz/PWSmt2DKMgR/REFJq7dYMuI3/DL54gm+C3KQPsKD3mF7ySPgBjZdcaTTggTq1+grzrbZU8VDPs75eNTgmfADgHYcW8FC5dT3+wNJjQ6SWY+hC+KAeAvkVZ+vWt821IZUHBHVLi+MM8NreN39vn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl3pkQoUExfheoWKn2LL1MYHodWIJQAVAKmSODsmtEM=;
 b=vwMHaAuwe9WJ5uX602CpgHOUFjwzJG/w04emSjL0YtI438gWd7vjnv4KyEXYy2c5SexBk/o7x/kkX5T45YDe4Oui/dnSv7TV7+AA3Sx7Vo5BbZxMWBPOx7zXHHmu4tTtPp/Iaozc1Od/OWS6rHD5lz92bs+ta9JLN/93EuvRQGs=
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
Subject: [PATCH v5 03/11] xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when IOMMU off
Date: Thu, 27 Jan 2022 07:49:21 +0000
Message-ID: <20220127074929.502885-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 07f30cc9-8caf-48d9-975f-08d9e169c42e
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4029:EE_|VE1EUR03FT028:EE_|PA4PR08MB6128:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6128D102BE6130C1CEC22E97F7219@PA4PR08MB6128.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7i0Lwtjjnn9mIYEafqA1AdQBTpadhLbvhbjjyuAhDsTR43wWjUnaABxkYdtOA467gE8sk0svFIbMq0JOzuZYeR1ok29Wd8jB6ODZa1C0ALqnMdTsJGhTicxENIx+vyYSPk9sfWHd1Eu5DkxLCUdPNd5zSRYy7QWfD7XO51HtoDCkcxuLKJjNg3GeSj376F1qhoodRCickYmiAaAK103OfqMvx5nBTKanGvJliwdqqMMWmvv9/V3STxWtgaBHZekHgUetlqkboMXLIEGW3bDmnobZEYKFqLOLbDrKhcjd7BSRcB9DLK5qOy7bNDq8Vk5ii0UQ/aJv4ZGW3aZYcZlZD1Zawc9INr5mQ4wCjxvSiWS6vCHu+UKamCmmj+DrnLLmZJxFw77CWfAMmhRWWi1KB9Ih1nVwGJdB8rIFT8FN4pHzD3hDhDIT9Z+JLD/UgsFhQcLomcJriMEv34pg02myD8tIlFCxv4/Sp8HaGzK94CuhJEV8IXWp3mvzuCw5Kr6T3OXhEMS0+hJxegLmLuSt15OP7I+fF5xYvXPdevqxCGRFWB6l5DZLLEHq5EBxJfUCk7mnYFUY3IWPSOy1hK3QJjFsKq4jy7fUmOq3xrMw9WRNXsxbkLwOb2FrbaXMdew3AuG62yQ9wQtlgIAuyl6ain7htXf1gZssc25EODByDv7cwIclJabfN0uHg7Lm/ml+iKe0S4pLneuMy1NFgcmT0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(44832011)(81166007)(2906002)(356005)(36860700001)(83380400001)(1076003)(47076005)(82310400004)(186003)(26005)(70586007)(5660300002)(508600001)(426003)(336012)(4326008)(8936002)(8676002)(6666004)(36756003)(70206006)(316002)(86362001)(40460700003)(54906003)(7696005)(110136005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4029
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	325893ee-de7e-4d49-fe4c-08d9e169be94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FJSZ6Y7PhGn4YEMb3Y+2+zPflBvIAnU1zYI446sa3ZxvX8g6LuWiEcRIl1Lb/+vxQXJOF2V813E5HiVZj6ZA4M0dQJRbEjizzGGrQUhUGWMJAFRhjdTT3LFPcdwKhhzDsVHaLcW1JGSwc0mtwDJ3hg6CEtAQ14fIR3wxJ4eVU8h5aiBilLlER6IMiYeH4w4v7+ihoh+YAfVT+Kjxa5hNu7ymoMN6ML5HAl79+KCi/AtK0SL9k4omMye/i56K5wRUDoc4S43o8uIfEOy8YWI5KX1LEREjp3PcG6zwy4pr8REWRhSiFhYcHeAYljY8RXJT9TghugwqH0Gf5BuKTrMsNssIAiknbRTnSevLXMQFOgdJa5jQ6BID/ruAhMH7o61VodBnoY5jwuG89WrxfT/uT8Cw7zLVsD84iLyfQQE6mabCKzw1GcztXjfFqKU3BV1bDSB0MgD7FZJtmNyx155cy0XNKYLvDGB6CFBB+lifeBuDOdJJ/YzzQtx4XIRUShrfQT/Z5VI6G0FXKpf8NEg1MM4tvOZhSpvlIABam7lZnV7hiCHk/bDCnsQKFEia6dmwf7NAoPsyYIHqHvYZL6d3+AizVXpWs98pd0qBIKwxGEGPV0z9yNXgC8dMBqikRe3KZOsetsaodiZCXwhXDNcH1Pl3nG1wI/jSwQtkAcCowsXPBeH1LmiFy12Ilf7n/FAOVWobexZGdpKZcnLxrUoYBvcPxBb7k01/3InRTmpuxvaehMLTe+QEJMVnLkU7MpABBOiW6MwWhqT8ufVn5vXD+w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(4326008)(86362001)(8676002)(83380400001)(47076005)(5660300002)(2616005)(81166007)(2906002)(7696005)(6666004)(1076003)(26005)(44832011)(508600001)(36756003)(186003)(40460700003)(82310400004)(110136005)(54906003)(70586007)(70206006)(426003)(316002)(8936002)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:51:02.7745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f30cc9-8caf-48d9-975f-08d9e169c42e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6128

From: Stefano Stabellini <sstabellini@kernel.org>

When IOMMU is absent or shall not be used (trusted domain, performance,
hardware limitation, ..., etc), in which cases this commit avoids setting
XEN_DOMCTL_CDF_iommu to make those user cases possible and prevent failure
later during device assignment.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 changes:
- new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
direct-map for domUs"
---
v4 changes:
- explain briefly in the commit message why we want to do device assignment
without IOMMU.
---
v5 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6467e8ee32..c1e8c99f64 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3047,7 +3047,8 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
+             iommu_enabled )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.25.1


