Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A139D310
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137534.254848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5Eu-00031o-Qg; Mon, 07 Jun 2021 02:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137534.254848; Mon, 07 Jun 2021 02:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5Eu-0002zo-NU; Mon, 07 Jun 2021 02:43:44 +0000
Received: by outflank-mailman (input) for mailman id 137534;
 Mon, 07 Jun 2021 02:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5Et-0002zi-6v
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:43:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebaf0d1a-0a28-4a24-adc4-a3ffc5c9c8bd;
 Mon, 07 Jun 2021 02:43:40 +0000 (UTC)
Received: from DBBPR09CA0023.eurprd09.prod.outlook.com (2603:10a6:10:c0::35)
 by AM9PR08MB6228.eurprd08.prod.outlook.com (2603:10a6:20b:281::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 02:43:38 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::38) by DBBPR09CA0023.outlook.office365.com
 (2603:10a6:10:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:38 +0000
Received: ("Tessian outbound bf434e582664:v93");
 Mon, 07 Jun 2021 02:43:38 +0000
Received: from 43e9bd8c5705.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 217E8781-6E41-40BB-84C4-EF698A40DA7A.1; 
 Mon, 07 Jun 2021 02:43:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43e9bd8c5705.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:31 +0000
Received: from DU2PR04CA0209.eurprd04.prod.outlook.com (2603:10a6:10:28d::34)
 by DB7PR08MB3851.eurprd08.prod.outlook.com (2603:10a6:10:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Mon, 7 Jun
 2021 02:43:29 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::bf) by DU2PR04CA0209.outlook.office365.com
 (2603:10a6:10:28d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:29 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:27 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:25 +0000
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
X-Inumbo-ID: ebaf0d1a-0a28-4a24-adc4-a3ffc5c9c8bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n23ceT40gDkzpSs8YSi62lKBLmssTtyN4ZJ1rsXIaE=;
 b=64dp+n0zVNx71dEWRz4IPJCmvg2JJzj5bH/rC0JM901HIJ7MtBZcCqf1FrbrQ6m8P2/HglUiJJ0W0zXcvL4xOFGrHYVRF27hNPqcHJ9dpOu8H+0uhygbelu/N7b6wX6BZuwcnPEx//paMFIe5hxkYeu1xq08ICEPxtoKTTKRoTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c6bc1cacb9119fa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at3Br/HcUMBCYPgcTQZW1fw/tktcO8oHt/HFnRVJCm+QzkRVy/2NzxpCVeg1VrkXlfWUH75cbO3VLb3m+Vi5cpxv5fhMFO93LbCQ5857S0xOfK3IcMGZis7yI9S7loPhIq1EVzrbEXXvp3YjLHtgtxku6bBp/6hCGYt1xb2Eea4A2Xp0Yaei3WqEVNSP9AGnRpH7yyFl/CMIhOkWnWMoq2VlZm/bx5v5KlVhEm1x42Azeh30PHFRBTHaq3eXxDjfjHeIFSpe2gi3o0s0Lvk+sMhXgbVlaLFF4ZUC80SNjevSvHVbBXTzbVfKkK/ameoE5HLeV0z5khfoG3Uikl2baA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n23ceT40gDkzpSs8YSi62lKBLmssTtyN4ZJ1rsXIaE=;
 b=VO2SjmiLccopDdI14GqX0GgjMce0Tf5IYQBtkEVNdqvTj3SFnMvo/5q0MznI9bAtOyuxE3VaIY7K3TlhCL/b98gMdUMb2/yl0mLpuXcqiMTXlqusubJ+/xcc+y8KEz9rbnaL5LAg0dLR0ivsRLmlZQqkfwxDR+YRvFygiHCdoi5PQMMjgcflHj/QKkyBOT+FxgYqit4NNRpVG+8XZD7aTfYxe6aMzJSbCgeFk5RIBNdyY1QXz5OeJ2sW5PI5my080HHXzNPZkE4EV64J87eQkCXB55hXmXQWkIXtlyEeDx3UPmipz2dnEu5JLOQqIyC/eqA24i+OXqr82aIehDyr9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n23ceT40gDkzpSs8YSi62lKBLmssTtyN4ZJ1rsXIaE=;
 b=64dp+n0zVNx71dEWRz4IPJCmvg2JJzj5bH/rC0JM901HIJ7MtBZcCqf1FrbrQ6m8P2/HglUiJJ0W0zXcvL4xOFGrHYVRF27hNPqcHJ9dpOu8H+0uhygbelu/N7b6wX6BZuwcnPEx//paMFIe5hxkYeu1xq08ICEPxtoKTTKRoTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH V2 0/9] Domain on Static Allocation
Date: Mon, 7 Jun 2021 02:43:09 +0000
Message-ID: <20210607024318.3988467-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 053aba55-4f35-4f83-c316-08d9295e0d9a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3851:|AM9PR08MB6228:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6228096A547F0D6652B59537F7389@AM9PR08MB6228.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 83ajIFQM5ggxLdmrrc7blmKlMjlOCEoozlkdxv1ZZ8wiQco118C8EkTc2qsnLN0JB5vj/OUphpAiUxL6HhZsX0x/f2ycZ1bVIVG0xJiN3v1pkpaXj528xh3Q+oRXLn0z1ebMWAe0cVcu9eOWiqsiNfrShhHakPaiiuS+9pdxw7B30VuyopjnBpwiZY/eyHQz07ELksySejEIvQmXyfGZwiLYinGoAQtAE7hZOJ8CIr857VMOqc4phL6+5gAFIvok3Sfr8MfSuyhWBWx/dfGm9OQHy7l2ddXpNqK4oUrT0dtpPAfhCx0f0ywtW+EUdR+WhHXMPaUNkLxRcWpEcBNrXpLUIJMvRicFF0PHZnNbOCjr864cwZNLQ1cbJ6CWAax1wBhwtOIreuALcyVbbiW5HX9iJA6Cr/CextCl+aZHTYHThu+xz+GPSsDKwhkv9zE1GMWLHYz71wGNOEaPY4dPkM+DXyReoaKvwuio8+yUPavjNN9Qe0l7JaGi03/NC+PRJ8B2Lz10hp3N1BhigMywN7t5VB3Hj4UFwVv+wuz+Yw9cB13U2+fDcabIOaa79sXL/KPeUTOejH/nq30vT7BHScOKl1j/iXjNgoyddfgO/xPmfxJFrquD95eBawPdy1lLzQdEhQvEiSzxhWvc8TwrZeIq8Ni/RHBV0R4tf3XcHdq6f089le2vFogEhCHrKAWvQBqdfXhcRZWt7d+sZBKavH4yPUh5UaKtlFDPAPnv2sR4VFvlBUXPlLCplX0oKnKX3ocZuZ9gmkWCsB04m/GoJQIVvCHmY9YNdBR6dNa5zi0+7ykXHV514FazfwSi7hY1dnSUUdCo4Loh7iP+UniuWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(47076005)(426003)(336012)(81166007)(36756003)(6666004)(70586007)(5660300002)(86362001)(70206006)(44832011)(8676002)(82740400003)(36860700001)(2616005)(8936002)(82310400003)(966005)(110136005)(54906003)(4326008)(316002)(26005)(2906002)(83380400001)(356005)(186003)(478600001)(1076003)(7696005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3851
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8fdb5ebf-7c35-43ab-e441-08d9295e0842
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q3nRjMLtj2YhR0g6GtJSLLUNg2dc5ryr64/hlJ0u4MwFrFeZ9XVYsZzZVPqHt5CTbzElmcEB/VeuXH5wfPyQzU9mLxs4vi04X4Y/6ThObeZraPi7gtbHIiC1fB062Gj7uIPODLJzKIFqBPjn1tHvkWy6KpSQINLNyIqXPeXHgQ/F8W6/sx1aj9hk0ulclD/cPHNv4pvFbsPn3cOcsOqo25UcVcEi/n0CNafTZEn7/tsHYUcx8x5JxPa+tuundBWP6/BwGkneYIX5StIGVqLJIU9jrgPN6FG4D7c+msPpR8Hryr2BaPSw+XG5iZ1iM8k4cJxEwe7mT4qxA0YPYq5SXQFsWoA6ay2U418Djm7Lsg4VlzcN9+Qxntd6FlZUBoXHpDHbanuYDZLesGDeVwvp3NQJm33se0DOVUdbNQfPV9Yx7NHOr+Ei+yLaQE0HPwUxu6Xq1ROHNBeHyzgjquZfcOkWeWoAqfypP6JYklG8FEGAXIqbtmeKYPN4VwALTzIFtLqrwJxn/9XO3JGQuXxEjLi3A1kvvDCq/RWIyi6JhJjwLKuggfLFGTPsmwHvwvYzJhkcCHlByJ/7x8qMKa07r1Vb8o0norGpqjLjzY0Kmh9r0lZFJjhpMKhFlLNsqBCOqZ2cwWqfz5d178CaMCv+oOIJ1fS9oQP9mMQ1SUdHPgD630CPltoWIZr6JfwnUSLb9OhThUDmgKP8c3JWhXN5XBnnRXWyVna/JoOwjn5yUUUFW8qDoTgIa4eZGBnQZHJ/9pMOFp53kiRrT3CAO22K1f7mcDhDa4u9jrigENAPUGg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(8676002)(8936002)(4326008)(966005)(70586007)(70206006)(110136005)(54906003)(316002)(1076003)(2906002)(36860700001)(336012)(47076005)(2616005)(86362001)(82310400003)(186003)(44832011)(26005)(81166007)(83380400001)(5660300002)(6666004)(36756003)(426003)(82740400003)(7696005)(478600001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:43:38.1486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 053aba55-4f35-4f83-c316-08d9295e0d9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6228

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

This Patch Serie only talks about Domain on Static Allocation.

ABOUT IMPLEMENTATION ON DEVICE TREE FORMAT OF STAIIC ALLOCATION IS
STILL UNDER DISCUSSION, AND RELATED CHANGE WILL BE INCLUDED IN PATCH V3.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and 1:1 direct-map, and this
Patch Serie only covers parts of it, which are Domain on Static Allocation.
Other features will be delievered through different patch series.
---
changes in v2:
 - consider reserved-memory binding and use phandle to refer(still in
discussion)
 - remove unused reserved field in struct page_info, unused helper
page_get_reserved_owner and page_set_reserved_owner
 - introduce CONFIG_STATIC_ALLOCATION to avoid bringing dead codes in
other archs.
 - extract common code from free_heap_pages and free_staticmem_pages
 - introduce new interface assign_pages_nr
 - change pfn-named to mfn-named
 - remove meaningless MEMF_no_owner case
 - leave zone concept out of DMA limitation check
 - take care of concurrency issue on static memory allocation
 - ensure the consistency when `xen,static-mem` and `memory` are both defined
 - fix the scalability issue in allocate_static_memory
 - allocate static memory when parse

Penny Zheng (9):
  xen/arm: introduce domain on Static Allocation
  xen/arm: introduce PGC_reserved
  xen/arm: introduce CONFIG_STATIC_ALLOCATION
  xen/arm: static memory initialization
  xen: introduce assign_pages_nr
  xen/arm: introduce alloc_staticmem_pages and alloc_domstatic_pages
  xen/arm: take care of concurrency on static memory allocation
  xen/arm: check `xen,static-mem` property during domain construction
  xen/arm: introduce allocate_static_memory

 docs/misc/arm/device-tree/booting.txt |  49 ++++++
 xen/arch/arm/Kconfig                  |   3 +
 xen/arch/arm/bootfdt.c                |  12 +-
 xen/arch/arm/domain_build.c           | 188 +++++++++++++++++++-
 xen/arch/arm/setup.c                  |  27 +++
 xen/common/page_alloc.c               | 238 +++++++++++++++++++++++---
 xen/include/asm-arm/mm.h              |   3 +
 xen/include/asm-arm/setup.h           |   2 +
 xen/include/xen/mm.h                  |  18 +-
 9 files changed, 507 insertions(+), 33 deletions(-)

-- 
2.25.1


