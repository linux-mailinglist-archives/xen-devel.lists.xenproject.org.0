Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC603D8BB4
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161421.296381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gns-00042t-MN; Wed, 28 Jul 2021 10:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161421.296381; Wed, 28 Jul 2021 10:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gns-00040H-Ih; Wed, 28 Jul 2021 10:28:44 +0000
Received: by outflank-mailman (input) for mailman id 161421;
 Wed, 28 Jul 2021 10:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8gnr-00040B-La
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4f6de1c-0ca9-4b60-80a1-89cf8af9dcb7;
 Wed, 28 Jul 2021 10:28:40 +0000 (UTC)
Received: from DB6PR07CA0204.eurprd07.prod.outlook.com (2603:10a6:6:42::34) by
 AM0PR08MB3124.eurprd08.prod.outlook.com (2603:10a6:208:5e::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Wed, 28 Jul 2021 10:28:38 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::7d) by DB6PR07CA0204.outlook.office365.com
 (2603:10a6:6:42::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:38 +0000
Received: ("Tessian outbound 4c02392472aa:v100");
 Wed, 28 Jul 2021 10:28:38 +0000
Received: from 9f4a7ab902a7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A6B651B-C33F-4DDD-9309-D579423E3610.1; 
 Wed, 28 Jul 2021 10:28:31 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f4a7ab902a7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:31 +0000
Received: from AS8P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::15)
 by PR2PR08MB4667.eurprd08.prod.outlook.com (2603:10a6:101:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:29 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::6d) by AS8P189CA0029.outlook.office365.com
 (2603:10a6:20b:31f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:28 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:22 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 28
 Jul 2021 10:28:10 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:06 +0000
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
X-Inumbo-ID: f4f6de1c-0ca9-4b60-80a1-89cf8af9dcb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7/UIJts4MNIYNmIi3gGj53g6WJvY6i2WJS5qMZ0p9g=;
 b=3rR4zvip9g8fhfqGtZsbFjve8RCoDeCi87sTHObQHHsJLzKA+8IeaJg/raGQrVgEjbU84B9ivOQgcB8BYdPpH88+IJ+OV36qeSfCoQ4FBZHeboc0Y+gVhp+KuWMzDhtLKEN1m9UwLNwtuLnoFBzjfDT1hPfrzib0rv+VJ6r+Bas=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1629ff1da8368ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajGuH38yy89nLbnOwcqrF8K1yyTvx2jStfwQextFN1mzN3FRVadI/0z0zv8YunK7JPZE/o1N+heyjmh1988nxvrpTS5vzcgSUeRX5UH7rDBKxZq6blOwYFrMZAUuEweYvUxxbbxIa8APmb26plmi64frDbodRTdqa2eLHw9ytj5pr/cXoLL2plbc4cCJkPrt0HFSfba+VIGvPhq8NHA8EEvzmX0jhSU1NON5pUjNZ8siGyiSp01wA3086VE1Z+27ZwgC1UoRXTaD2d+Exlzptayt8hASxYoMlIoxffGxWJPL96rD+udhZLKbawxCWXNiZgTEKz6+pqlIJqiNeQOnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7/UIJts4MNIYNmIi3gGj53g6WJvY6i2WJS5qMZ0p9g=;
 b=RJ4ZfWQ69Gp7yKo+++6qExR+60YJmXLvMCSoPc6gwjPwb3CsRyNVm4XqgNfTTLeTZgMQAI+yiyOdIBYIl6thAiX6pU/nJKWoPWxSDUDztlQHat7qYkIoYlg2f8NXrC6NrMPTPBAH16dSnzEv0u+N6GDynfVgZkmMzoV2AspawGB7LFn9qED89YDw6LCbvmdP0jN4glvLyYlMZPynv7wGzPMd/6OU+4KtT+vCoPEAJGAj1/0QYDRR8T8hbIJ5Ki1dg1wzGHdz3ioKZZG/grtiP30W0UZ66W4ZkI71hM1zfHfGhMnxdm8FwZfykEarXjDD5u0RrriAfEcrvDkEZ39cVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7/UIJts4MNIYNmIi3gGj53g6WJvY6i2WJS5qMZ0p9g=;
 b=3rR4zvip9g8fhfqGtZsbFjve8RCoDeCi87sTHObQHHsJLzKA+8IeaJg/raGQrVgEjbU84B9ivOQgcB8BYdPpH88+IJ+OV36qeSfCoQ4FBZHeboc0Y+gVhp+KuWMzDhtLKEN1m9UwLNwtuLnoFBzjfDT1hPfrzib0rv+VJ6r+Bas=
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
Subject: [PATCH V4 00/10] Domain on Static Allocation
Date: Wed, 28 Jul 2021 10:27:47 +0000
Message-ID: <20210728102758.3269446-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96a1f9ff-1188-40fb-510b-08d951b2764b
X-MS-TrafficTypeDiagnostic: PR2PR08MB4667:|AM0PR08MB3124:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3124CEFC6E55E2636938231AF7EA9@AM0PR08MB3124.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YWSCEW0QKZ2l1coRw9LM6KrpMkAWNlKoirJcasFzDYlAsb7Ba/j+ty6p76yeMS5dk4AsLXizRGWHJiVQw3Ud3jOOXCfsgFQ8kIhzQi6PMA1kewKt6G8ShViAdnea/m0OcvU3rTGIz6vVeK1tQKL0JSScwY/xoospJdzte6jOsg6IDHftxOSaxS+wQg3yphGWbdrnE4hkSKjvo9KOLo6hwzrawIeCycxq0zhQ+2GUfsAo6LNICpr5ur4M1rifiF1zKBqgNX2+s1fDfsC7I91AZrjbjK/icT+PzHnRrFYvuvUTrFzSgPOKZz7jtjQJCgK+JumvHk3ATW9F8EypunGk/s8Ul1fvJK4wE3n5cN3YaOJ74yUBhvWUu+8hcZUvq3eyM52F/DS9GWammRQHgxI9UpgiXb0+64nQArAo+zNMRbsyUSRMVW4UgY5/fzOpteQX7FREpBZiBB4+tyZZpC3E/kAWJdS9O7GU6/pWOleNgXz46nYi0wYBO1FnzjM+6Z34zBqxGeuv0fIBMKLXtG0TPPF9Leyar4E6NFSMsNgb2vAMZrmwDWsE5apApZt7IJ0VQg/8eQ5JFaNGaLrdMjyCR/MSpbFH5r/jJuMYJYaeDrF7u9o3piICU51ue7o/IKw7mX1QNvcwp0Z/TCMiohLEagVtKTysOzDvt/ZKiy5EWzVEd3yqmWlg4P3po/W0q2OD6xIJaFzKZ2V/e4749nBE/uU691ASnEbvbBZoFX+huFhhjMfARzrJkFnCjKiLUSFmqKcM1inUmZ/POv4CJpv/5c84VGJJuM3sU3YDpdAOC/eYelkE/GZ6nZCPBXZnK2AF
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(426003)(47076005)(1076003)(70586007)(83380400001)(8676002)(8936002)(4326008)(54906003)(316002)(70206006)(110136005)(186003)(82310400003)(36756003)(336012)(6666004)(26005)(2906002)(5660300002)(7696005)(86362001)(508600001)(36860700001)(44832011)(966005)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4667
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5589e229-c19a-4bfb-2085-08d951b270c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NvF3AVGn/IiIZBjB5tF8yPwgRoI1oONS0qobJaElhnNBYFrvdTvZOI/+prJ2F8VIU4P04CGEO8Cl0XGrTjkbE68U4JvT1MeEpvyyPRzHFNVN12qXii1A2IZmo3X81qmK8RW8eUzUgYQc8Svk+YRLErGebag8/raZmE9ZfShD+ad+56T1emnRYozNLJUWP8YLCmTtdMDehy5v3UTBKzel1rrBGXDWJMz6E6QCR5YjtiusNYutcShCdmd1shZXCHNN1/YGeSkhQEbNHOKANa96j+quo5sPdjkprVvHmDm2G3OXcn9+/IrZ5V1tFUy0r6B6cDbDK0v7oNOM9QlZIdKyQs1457gv5dVuC9asJ++HhkNYr+NnLX6hRn90Q/Uu4LM364sApf8M0mBjUKMulsLaalGy+eCpAPlvFlX1h2jAt3rP9Fn3GjVRjV4cGTbVa74JL8n76PBeHLr7IF0UqNtPtOGSQtfURdGc4JRWxim6FNdYrp4rq71JSIj184ydQ+zi0ab9l2Hyrym4RK5MobKS2sDYsSSVLb2d14MoWdHtOJrzdhjqsxLXWKqR6bWbfLE6BIW0euYc0ZUWAjyJmq36iwpSpCLeCqqUHXC8rm6AsgWSnz4xA4UqwqXFKVqiFu697DmMg7KXlMifrWaMpULHeiqWW9QEzUrbSP60TTNeoMJXlo68ONIDeU55t0npGWoUAgBOqkJpImJF2ENXPA3pHtqYSN/eimwSXxLTLVDvsX+wMrDXMPR1ILqdomWcNlA/fG8DyoidbMq+Hfrng1ilrB/T9RYL7m7yeAKJ3q7GEik=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(8676002)(81166007)(6666004)(2906002)(2616005)(44832011)(5660300002)(82740400003)(86362001)(316002)(8936002)(83380400001)(966005)(4326008)(7696005)(36756003)(82310400003)(186003)(426003)(54906003)(70586007)(70206006)(478600001)(36860700001)(336012)(1076003)(47076005)(110136005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:38.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a1f9ff-1188-40fb-510b-08d951b2764b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3124

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Domain on Static Allocation is supported through device tree property
`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
The size of address-cells/size-cells must be defined in
"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".

This Patch Serie only talks about Domain on Static Allocation.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and 1:1 direct-map, and this
Patch Serie only covers parts of it, which are Domain on Static Allocation.
Other features will be delievered through different patch series.

---
changes in v4:
- move the option CONFIG_STATIC_MEMORY to common code, and with Arm
"select"ing it
- replace round_pg{down,up}() with PFN_DOWN()/PFN_UP()
- in all cases where order-0 pages get passed, prefer using new assign_pages
to pass literal 1
- reconstruct the order of assign_pages parameters
- moving tlb/cache flush outside of the locked region, considering XSA-364
and reducing the amount of work happening with the heap_lock held
- remove MEMF_no_refcount case
- make acquire_staticmem_pages/acquire_domstatic_pages being __init

TODO:
- reboot domain on static allocation
- Implement all memory-ops(hypercalls) regarding domain on static allocation
to balloon in/out memory
- asynchronously scrubbing PGC_reserved pages
- consider domain on static allocation on NUMA-support scenario

Penny Zheng (10):
  xen/arm: introduce domain on Static Allocation
  xen/arm: introduce new helper device_tree_get_meminfo
  xen/arm: handle static memory in dt_unreserved_regions
  xen: introduce mark_page_free
  xen/arm: static memory initialization
  xen/arm: introduce PGC_reserved
  xen: re-define assign_pages and introduce assign_page
  xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
  xen/arm: check "xen,static-mem" property during domain construction
  xen/arm: introduce allocate_static_memory

 docs/misc/arm/device-tree/booting.txt |  40 +++++
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/bootfdt.c                |  89 +++++++---
 xen/arch/arm/domain_build.c           | 170 +++++++++++++++++-
 xen/arch/arm/setup.c                  |  71 ++++++--
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 xen/common/Kconfig                    |   3 +
 xen/common/grant_table.c              |   2 +-
 xen/common/memory.c                   |   4 +-
 xen/common/page_alloc.c               | 243 ++++++++++++++++++++------
 xen/include/asm-arm/mm.h              |   3 +
 xen/include/asm-arm/setup.h           |   2 +
 xen/include/xen/mm.h                  |  15 ++
 13 files changed, 542 insertions(+), 103 deletions(-)

-- 
2.25.1


