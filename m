Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688593C983E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156291.288396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlg-0007qG-1x; Thu, 15 Jul 2021 05:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156291.288396; Thu, 15 Jul 2021 05:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tlf-0007nH-SB; Thu, 15 Jul 2021 05:18:39 +0000
Received: by outflank-mailman (input) for mailman id 156291;
 Thu, 15 Jul 2021 05:18:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tle-0007nB-Cq
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:18:38 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ab1cd12-e52c-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 05:18:36 +0000 (UTC)
Received: from AM6PR10CA0058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::35)
 by AM6PR08MB3093.eurprd08.prod.outlook.com (2603:10a6:209:41::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Thu, 15 Jul
 2021 05:18:33 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::6e) by AM6PR10CA0058.outlook.office365.com
 (2603:10a6:209:80::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:33 +0000
Received: ("Tessian outbound 664b93226e0b:v99");
 Thu, 15 Jul 2021 05:18:33 +0000
Received: from 7893a497e64b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D6A6E59-8336-4936-A03A-AE19FB55A566.1; 
 Thu, 15 Jul 2021 05:18:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7893a497e64b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:27 +0000
Received: from DB3PR06CA0027.eurprd06.prod.outlook.com (2603:10a6:8:1::40) by
 AM6PR08MB4769.eurprd08.prod.outlook.com (2603:10a6:20b:d0::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23; Thu, 15 Jul 2021 05:18:25 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::b1) by DB3PR06CA0027.outlook.office365.com
 (2603:10a6:8:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:25 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Thu, 15
 Jul 2021 05:18:24 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:21 +0000
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
X-Inumbo-ID: 1ab1cd12-e52c-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edzc1ERAnnH92n0EA/COjnS7/1YJjgFDhgKYTVRzhVs=;
 b=4VxCkofhMvqepVjCEhsuLWgUnHyBfzGM053R+bQlnpT7bq+9LDkSG+VAG11IUVD7tp4LxPydkcW8ahy/xw7ZaCQOWlon6myngb/IyofehOE8L/pfUdfLjWGh6S+yNdMW/mBjhvkMYa120aVWpvsPL2B0UvPOPOZ9vPnlWCCbv7w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ccfeb7cb9973fa3e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzQrByR2v6s7jKwYBJHLJvHJMqdu8QATmlg2ainZ6JmzW7RVn3lYO97GMW4QwaPILeNamrV8t3MZMBtNNT8KdCU3ApqShuO9Y1XKhXRHKIeynZj6ZroHi/Lhn55hoYV4WnozXNWvjnYS26qBGgCMj8ddophThOCfxDSj2b/tdODO5x0fSBD1N4MhAfLEgUKqBzAVLq43T7HhcuTu8VFzPQcjf38yvqYRAymB3Zk6OtQqaBARmjY2Hn4QU2T0BsFWnX9XyqxmWEl8RIdrtJvelUdQrrSxkyCn5nZ431XutpC2jQeV7gNzJpAMuNt3vaEfy5GMr4G2DReCr/BYGYwKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edzc1ERAnnH92n0EA/COjnS7/1YJjgFDhgKYTVRzhVs=;
 b=iOogvVG295qq/Mj2jF6F7kaXtWSJRsN9Y5CD189+//iPI4xwJ/kh6NQfFiNtnxo+YCpn2H+PG0tiXXONGbv4nTRt3Bq8lyH0U0PyJGsD7Y9g/UyeVCbwLw5DfEay/MrDZyTpJU5g4Jsifewg32B/ZGucbld7FwPLMUPEo4QDC/1eg3V+CL0j6OfAsEWaLDD0TWO+CM0zjKx+HIWG47OsW5ijM2lzu5tE3jjOhepxXs4MuM/43MREOX7MjF951RHvDkZ//cv+sth81VqEH8DUGluP/DnMesCRA+mt8QK5Rr0PhEBlwgjCaxTfbmVFR2DdGPmUGhftVV9MzMbrvMnOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edzc1ERAnnH92n0EA/COjnS7/1YJjgFDhgKYTVRzhVs=;
 b=4VxCkofhMvqepVjCEhsuLWgUnHyBfzGM053R+bQlnpT7bq+9LDkSG+VAG11IUVD7tp4LxPydkcW8ahy/xw7ZaCQOWlon6myngb/IyofehOE8L/pfUdfLjWGh6S+yNdMW/mBjhvkMYa120aVWpvsPL2B0UvPOPOZ9vPnlWCCbv7w=
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
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 00/10] Domain on Static Allocation
Date: Thu, 15 Jul 2021 05:18:09 +0000
Message-ID: <20210715051819.3073628-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 370ad525-409e-4a4a-238c-08d9474ffde6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4769:|AM6PR08MB3093:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3093B12B0480083532E1AAA6F7129@AM6PR08MB3093.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BJjLHTHr8c/duK3bWPa7tJsS/B+Zcp89Iu9Dy/pIE6eKoRjdxjJyHQVcLL0lsk2fPmUwRxqVGVaz+HDBr5Udu+jBndez1JqDRXW7s9fI12P/4Ibd/loUussYgCyCyZ+ZbZJP9s8l6WDZe92s27WJQAtD7Tbd8FZ7cFAEcJOXPUZVLhfHkA3znPShQGBcJ4XtB6gLnV4p4NegqZ2WMrA0CF4qEqHwVmdKWpkqzeOVYXHysfOZYxNDPI+BlxkVq14huM8af4K0g71LTTvPMwLi1mjvbpplkfmJHXjInkM6LnJuqN0PlLo+/3CDKDEeulFg5ADrOQzegbrCGow5/qYfIW6tqvumNwreNQ7SPuTU+AkQcKejEWmJFtY8GPGIqphYGP5fqqvAYobNf2cxu1dCXmBtYXqQEZPuzQXR0mPdsUCIwgIPS71JO0x4aoogz0chuLfqGLNS6HS/IJGWNC80YnSw9BHMfcjxocPvLjrjPTrX6dmLeAeSso/FUlZFDS7UTq7VrAMWE0vpCsoiSI0CRu/mMB6Pt/sl6gLmEwFuX8J5m/UF1zhbwPCzm3Jhlrd3xrtK1tt9jx+UlI5n6/6Ad347Z6QR4L+kUDwbcnl53zvzQ86aGUixhcaAD+a4ary+G/5nylyHAsMhrdlYcj/jtR72TSnsFLgsYIU9PfvPzTBocTk5IZ+JTug77n6KFzQulYJda4GnzdmCLGNr3qXuBopRR50T0r+aHQnCyGXutg9jG+VNAm6U8i5BcbOBFFZDdsJ/J2+SxbhHckAXv0dQKmIzEy/eMyF7TjxW1YWjkHqCVYRMi6kn9qw6BwFgG0Jq
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(46966006)(36840700001)(478600001)(5660300002)(1076003)(2906002)(47076005)(8936002)(82740400003)(70206006)(2616005)(44832011)(7696005)(36756003)(82310400003)(26005)(186003)(36860700001)(70586007)(966005)(81166007)(316002)(8676002)(6666004)(426003)(54906003)(110136005)(356005)(83380400001)(336012)(86362001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4769
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76df146a-0728-429f-cf45-08d9474ff8f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8OLs3CQOxRw/BbS1rNxt8AZomqkjxBzkTdm2A7biVeWlYV/C3oyg7t2OWzslZx/2gExSgJK1ciqEeyNcNnDpgbC+H4ZZ6mEiuZy9aa3YE8lMGtcnPNV95H2+BMvnS0KTxOAJMGKq4A+86+kATZkd3UISWNJs5PGvbx5QyBuIYq8zrlRuZkvFWZdiqpFQdfu5n2sye81tHaKtgCY4zBD63+ZuHSaTPvkFGpGBr20FbCKY8TLW3wDujZ14i7mOAQLVd1op+UgfDKMX9GjT5VGpPUrZhKPk4eKAiIp12PJb0TKu6ALYADolhj0KSClvu4xyQ62yLYN5VLl1xhIXa6Hr/cWHbyJ7c/4cEBbySyv4fNyfwZ9pGaBl9lh9Fmp6GY/Zc/9Ur14DW6DWB6r3FnjUK7XJB9Th14tXwnB3zX2a8nu0PouNtuDJbSVT/ENApEsS0HJCIoMD/Ew0QCQTA0gYhtRrK3xA8aZ5rHm7Oz0/TnhjpPtF6kgetD4jWIMR6nQvOdysALD45UjSsQkRYN3ygfntlG/BIWWepla5Q/2enkHyNJS1vx6pmyh/bQ6fKjGThbPeddrXL3JV/1G8f3ziP6lnf2m6eOqUdBAOpJyR7vare+jk6txJRiVaO9a9ns0c4xRYiY+891WBpaoJzs2nI5u48DrZlwwz3PzObvY8vlUH3B71rO9BOfgT0pskc8YNryWs6++A0GJ/89F2X+d1g53PdqccXXFfvJpg4lNpIVBqXe8qgVdMpCu2h8/IbTWSTiU7l31gKLIwqlCJ5WTHeVlos9poQZLmdVT74KPUsOk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966006)(36840700001)(54906003)(1076003)(316002)(4326008)(478600001)(86362001)(336012)(44832011)(2616005)(83380400001)(70206006)(70586007)(7696005)(966005)(36860700001)(2906002)(82310400003)(8936002)(36756003)(8676002)(6666004)(82740400003)(5660300002)(26005)(47076005)(186003)(110136005)(426003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:33.6792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370ad525-409e-4a4a-238c-08d9474ffde6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3093

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
changes in v3:
- use "xen,static-mem" property to be compatible with System Sevice Tree
in the future
- introduce new helper device_tree_get_meminfo
- extract common codes for dealing with reserved memory stored in
bootinfo
- rename from "free_page" to "mark_page_free"
- remove non-trivial page_to_mfn conversion in "mark_page_free" due to
pdx compression, and let the MFN passed in
- let all switch-cases shared in "mark_page_free"
- change CONFIG_STATIC_ALLOCATION to CONFIG_STATIC_MEMORY
- put init_staticmem_pages in setup_mm
- rename assign_pages_nr to assign_pages
- alter the order of assign_pages parameters to help backporting
- change name from alloc_staticmem_pages/alloc_domstatic_pages to
acquire_staticmem_pages and acquire_domstatic_pages.
- remove hunks' #ifdef-ary by introducing PGC_reserved = 0
- remove DMA restriction
- "memory" property shall be mandatory
- rename allocate_static_bank_memory to append_static_memory_to_bank
- infer the next GFN from the bank information in append_static_memory_to_bank
- simplify the code of double loop in allocate_static_memory

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
 xen/arch/arm/Kconfig                  |   3 +
 xen/arch/arm/bootfdt.c                |  89 +++++++---
 xen/arch/arm/domain_build.c           | 170 +++++++++++++++++-
 xen/arch/arm/setup.c                  |  73 ++++++--
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 xen/common/grant_table.c              |   2 +-
 xen/common/memory.c                   |   4 +-
 xen/common/page_alloc.c               | 245 ++++++++++++++++++++------
 xen/include/asm-arm/mm.h              |   3 +
 xen/include/asm-arm/setup.h           |   2 +
 xen/include/xen/mm.h                  |  15 ++
 12 files changed, 546 insertions(+), 102 deletions(-)

-- 
2.25.1


