Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECE387133
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128615.241448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB8-0001Cm-GH; Tue, 18 May 2021 05:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128615.241448; Tue, 18 May 2021 05:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB8-0001AC-Bs; Tue, 18 May 2021 05:22:02 +0000
Received: by outflank-mailman (input) for mailman id 128615;
 Tue, 18 May 2021 05:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisB7-0000oV-2K
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dd5b481-45ae-4d0b-843f-89b10c884e13;
 Tue, 18 May 2021 05:21:55 +0000 (UTC)
Received: from AM6P191CA0091.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::32)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:21:46 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::8a) by AM6P191CA0091.outlook.office365.com
 (2603:10a6:209:8a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:45 +0000
Received: ("Tessian outbound 3c5232d12880:v92");
 Tue, 18 May 2021 05:21:45 +0000
Received: from 8e78856243c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28167E2F-E4E9-4F96-A7DC-125E3053516C.1; 
 Tue, 18 May 2021 05:21:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e78856243c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:38 +0000
Received: from AM6PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:20b:b2::22)
 by VE1PR08MB5598.eurprd08.prod.outlook.com (2603:10a6:800:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Tue, 18 May
 2021 05:21:33 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::c) by AM6PR08CA0010.outlook.office365.com
 (2603:10a6:20b:b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 18 May 2021 05:21:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:33 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 18
 May 2021 05:21:30 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:28 +0000
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
X-Inumbo-ID: 7dd5b481-45ae-4d0b-843f-89b10c884e13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04Kt5IDhcODuyzlAcnmdKfPcs/5dhHEBgwMoFTW8ze0=;
 b=ro/GdX5ypMYTeaywINLsfHtCrfO2vThTnqs4eVzDiz307WdxBZFYje8dhg1d4XuN3HNPUAXCt+y7OAxURSvGnp8PDztZA8XxFSpOnEW9TlimyMjOs+7Dp5TytyCLAw8Ym3LrQTghc7j4LuT5DX8N72krrRV+h0b1/kSG2uTk/mY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1f9d5eb67de605c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy5VgMKCfjKFIBwgc53M7xtCEIqrqYt4MEfH6a4sWVwj5LfcFlFQ2guWLIs6AuDDFe55ko4bBO1lUUtOo5ax3lKicEswz/nsKmxZLLmYkzWJtxNjzKxjS3i8xHyjr8hoVO9DIvtSXYDDAyVUiD9zhcZZsEQcbHu4ynPIAeDNt7r5OZP/HCEBor85u7OHL92uT1HNGZIqAMwcitopUnHWy3gErrpaMtlBOdkZmq6pGePVAoaEgpmlrSfE/xVTvTNSRjCcPr5jTnaoGRf9Pa8G/aq5tCax1H7UTP1Y1tWvR+sO3drYGn8Dpap4TEKZmPabc2vS2ZYVarHTMbvZoBO1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04Kt5IDhcODuyzlAcnmdKfPcs/5dhHEBgwMoFTW8ze0=;
 b=dAYEAuT9SeZOVqs0lh2UUP3MG5dlL8+cxQ2s/PJyZ7q2srEMabsn91JY8YpOFxpsmU01AzcPwcvaRX17zvh7go/Pd38THz9M1aRHkAl78Y2EOBcGY5cvtrAi5tUXys9IIDTLlVlHC4h4jh1EUF6SF3OvqLBy2FvnQ3KU7e5H7giVoRxRWn5A2OqkKcxk5mm9hcUKQs+NhFDN9qVPOnkn3rCJ4srWerSRm3M5lSistpCNy/6lqAQviFdi1oHYRs6aPm/fTvXJWjQR7M6xyIW0FW3A+S/uLzJ+Q/ys/pH+KS+Fz2M/tT5deZpQYvtDyQV+m3vD2bV/TVp3DuYYby9x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04Kt5IDhcODuyzlAcnmdKfPcs/5dhHEBgwMoFTW8ze0=;
 b=ro/GdX5ypMYTeaywINLsfHtCrfO2vThTnqs4eVzDiz307WdxBZFYje8dhg1d4XuN3HNPUAXCt+y7OAxURSvGnp8PDztZA8XxFSpOnEW9TlimyMjOs+7Dp5TytyCLAw8Ym3LrQTghc7j4LuT5DX8N72krrRV+h0b1/kSG2uTk/mY=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH 00/10] Domain on Static Allocation
Date: Tue, 18 May 2021 05:21:03 +0000
Message-ID: <20210518052113.725808-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6f758ff-6e8d-426c-f007-08d919bcd453
X-MS-TrafficTypeDiagnostic: VE1PR08MB5598:|AS8PR08MB6469:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB64698A8EC5C754999ADDD82FF72C9@AS8PR08MB6469.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yvs3tBFIuhlrRwcHAwF0ABEO7Au7dgo9w824Gsb//vp1rvnUowKAcBI6ODxZ5eXEzrAzmU/SqyPkBPdFKUKui6HQL9S7jzJH6pB5VrO4phB8EAqdFTahw6RtzhjtkqIombm4xxj0sPzm5lCd1XzM+woO8e53q0ACmTP/uNe1+La3nIMb/3d3QH/2yJBioV0bPxyewr81Ipt9kUyr7kI9VdME9B6wPlL0s4ATPd0NRDTTlgOxERM3LJo0o7tkLS9lQ57omGZ3ZtgUpzoMQeCYmP2EUFKchGLYyoSbh3WCVVFg7/L5EyjbEjX+KeTJtn7oxvij9ShN+8OXr3QC/t3Jxl41nHPfREF8XBwTrArjqepC+8P9ol/yoI3voJU2O3l37iGnO25wXbbcN1Rh3FypqNFzImzAtIm1Z3lw7J5IDDKVOqtLlWvShrwdkepra8Eomm/kdl3TR7ay3bzQp9G5tySgwZ5AaBAtxzLIq1lOoc5lfupGH9Lk0jjgudSv6X7UzddMWgT6Ie08KQBkS+AoDDSpwrXeTevH7xAjaqx+LwSy+r7Pnp5iSx2/+xpl+gg15ppvIkkBR+lC/xXuyunmE/rqzqyRnEfXDXEi91QuX/1kkTDQAGnnPgKZ9Dto6CvRrxJVF6SPheV3yhD2gMVfQzYx1hvE8oxY40LevRX1r6pq5WOzEN3mG/mMdIyqYFmxhu1wF3NBE2k3WX8pW+xDKqCz8rPtntpsuIZX/ahD/i7xRu8R/9yhRNQQ3MHZCre87QiV5v9muLSgdsPP8cJ5kQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(46966006)(36840700001)(70586007)(47076005)(82740400003)(83380400001)(5660300002)(2616005)(70206006)(86362001)(1076003)(36860700001)(36756003)(4326008)(186003)(7696005)(82310400003)(8936002)(54906003)(26005)(478600001)(8676002)(6666004)(966005)(44832011)(316002)(2906002)(426003)(336012)(81166007)(110136005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5598
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c89c5324-3c5f-45f6-718e-08d919bccd08
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5o6ZNudDoaUD6ehT1aZMyLLlyi2EJRhVjrh9BgZ6uPBccKneJIZe11uLISSoo1X538ZyCxH9pfi2JT0hbeeEo6wLIuT6hXGH+a7/tPlj6x7ljrcO8Fqaqu6+ksiqRKB0dYciGHByiJ71ewKITR7ujjNSHQl47t1Q1X9P6ZPtKi1RAyJNYd3FPRXn/JvmE3jXYyoPAOy15nUGoI1m7e76fRHkmHlMxAObBohWN1cm89LjfQCMNb5Sw08ndWtjpZw8sg6oWavzTEnd1LK0A+zScfB7vp2n7RWF1bz1WCSSYgCsPfat+04CQDgE3fAolobfqWP85Oqe55DzHopn9ALGYIWDVY3UkgBF9AmEjQHQG7tnrgfD+jeBhu9R90PrR2fIRkFBUCXv7EQyE4PKUjiBCLiaubkmRdS0JmVfy0pOIZmLOy7i1yn+BEoGsVDz7VytRH4/3w441K4OF+CIoWeXx+RVTbpG40D4Z+VKhieIS3U7ZcujnnLZgykBlOo8SllORVQHxfccD5t5vO2jweiQ4rsRMCyypEaLGSDS1ZSqV1mRBjV5z/5QmbJTbeSpSwS4edcIhITFeyTl6pMP9Q5NWLmBQaiBPnSb0ShgHxfr3MTQ0aeUoo0H3S2aNqOJGpnWCABnVQQlMiU+2sHy2i50/n+3IUcNFeYL8nOszSOMqTUd8nYxJ9kuygLFyws+ZsiYFyIM+RQB/a892Qas6eqtOSkjTfpx0iynmuXhhSbXI50=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(36840700001)(46966006)(86362001)(54906003)(186003)(82310400003)(2616005)(316002)(36860700001)(2906002)(7696005)(336012)(26005)(110136005)(6666004)(82740400003)(44832011)(47076005)(81166007)(8676002)(5660300002)(83380400001)(478600001)(70206006)(966005)(1076003)(8936002)(426003)(36756003)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:45.5922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f758ff-6e8d-426c-f007-08d919bcd453
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469

Static allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Momery, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

This Patch Serie only talks about Domain on Static Allocation.

Domain on Static Allocation is supported through device tree property
`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
By default, they shall be mapped to the fixed guest RAM address
`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and 1:1 direct-map, and this
Patch Serie only covers parts of it, which are Domain on Static Allocation.
Other features will be delievered through different patch series.

Penny Zheng (10):
  xen/arm: introduce domain on Static Allocation
  xen/arm: handle static memory in dt_unreserved_regions
  xen/arm: introduce PGC_reserved
  xen/arm: static memory initialization
  xen/arm: introduce alloc_staticmem_pages
  xen: replace order with nr_pfns in assign_pages for better
    compatibility
  xen/arm: intruduce alloc_domstatic_pages
  xen/arm: introduce reserved_page_list
  xen/arm: parse `xen,static-mem` info during domain construction
  xen/arm: introduce allocate_static_memory

 docs/misc/arm/device-tree/booting.txt |  33 ++++
 xen/arch/arm/bootfdt.c                |  52 +++++++
 xen/arch/arm/domain_build.c           | 211 +++++++++++++++++++++++++-
 xen/arch/arm/setup.c                  |  41 ++++-
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 xen/common/domain.c                   |   1 +
 xen/common/grant_table.c              |   2 +-
 xen/common/memory.c                   |   4 +-
 xen/common/page_alloc.c               | 210 +++++++++++++++++++++++--
 xen/include/asm-arm/domain.h          |   3 +
 xen/include/asm-arm/mm.h              |  16 +-
 xen/include/asm-arm/setup.h           |   2 +
 xen/include/xen/mm.h                  |   9 +-
 xen/include/xen/sched.h               |   5 +
 14 files changed, 564 insertions(+), 27 deletions(-)

-- 
2.25.1


