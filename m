Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD53F5B60
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170779.311709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5f-0002CB-Vv; Tue, 24 Aug 2021 09:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170779.311709; Tue, 24 Aug 2021 09:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5f-00029u-SL; Tue, 24 Aug 2021 09:51:31 +0000
Received: by outflank-mailman (input) for mailman id 170779;
 Tue, 24 Aug 2021 09:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5e-0001jx-IE
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d863c26c-04c0-11ec-a8bd-12813bfff9fa;
 Tue, 24 Aug 2021 09:51:25 +0000 (UTC)
Received: from AM6PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:20b:2e::49)
 by VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:21 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::8a) by AM6PR05CA0036.outlook.office365.com
 (2603:10a6:20b:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:20 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Tue, 24 Aug 2021 09:51:20 +0000
Received: from adc004bf6f7e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B52D7D6-362E-4D86-AEFD-C85867EF2FA3.1; 
 Tue, 24 Aug 2021 09:51:12 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adc004bf6f7e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:12 +0000
Received: from PR3P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::9) by
 PAXPR08MB6413.eurprd08.prod.outlook.com (2603:10a6:102:de::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Tue, 24 Aug 2021 09:51:04 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:54:cafe::7c) by PR3P191CA0004.outlook.office365.com
 (2603:10a6:102:54::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:04 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:04 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:04 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:02 +0000
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
X-Inumbo-ID: d863c26c-04c0-11ec-a8bd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hSXwV+LF8aZ6rr1B6EiK6NpwkJjwqXzs3QVlw9mGFM=;
 b=TeczPd6c0M1xBSz9cSegDTF96DeK5W4ksnCmA1FrR48r5u9ta8oT5wToWI4wLg3lVp8sbW6qGbj5JtQsaA8z2+th1u37R/DyUVonDXEq6qHj9YPT0Lm6aVQXw+qrRFpXkpUkvXE9bYeXboNvbSBdmazHlDruGRiDbDSjjuwAG+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e60c7edc7a8b935
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjAzDU+FwZyqJjo1puhQBZyOCSuRrb7ZLK4Vwwiue+YB3SNSh4uSHSdGU+u66Ktyo3nniwyz+PCVzwT3DecfBKenrUWIZymNq+ptE1GfGg8eV9Yv98aLaVka4r3JIdZCmw5JkVffhavV69kYXuxtxl2GRc/nPRCuFzQXODoUj8JeHGdtW2NIm8Bo2O209lTuehc+St/E4aWqiD1Kvt+O1Xwn69zUhvJuIKBwXzGRgQp0m52fYP8cfxEooB1zhS8jQpI81vFt3dnaUGk/BneINX4dWzEMhH3eYGljOcpr3ZGNORuOThqSsA5Rgxdpvfr3dUVceGxXrIlFftbkP97/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hSXwV+LF8aZ6rr1B6EiK6NpwkJjwqXzs3QVlw9mGFM=;
 b=TgPEYMnlifej0llVdjG/DiPldqVWLvJDFjplC6EWC0pGbnNzD7IHroA8DvfVmkkQZGv7M5k8Svvy0D5A1/4BxXLcjJ44bywdLDND/K7bf6FqsvKzNk56To+0LNq46OKYOrJBOXrR+4l+T2jmrddQHLcqzFQ53M0XzNB+nwa55gJs5XeYnFjzRW47rj9dSI1fhIOOk8B4pg0Px/VlJyMpGa3qb8GeMPiILw1rdY/VRaREONPJw3CgDGfwgNKPR3PH2qK7VS8wxbpmklFKNP6PKB+LMdJLbgY7CCapD2q+H8QA8X26AQjFfIllX6rT1xzCngtXVgEWaLE/NAw0ayITAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hSXwV+LF8aZ6rr1B6EiK6NpwkJjwqXzs3QVlw9mGFM=;
 b=TeczPd6c0M1xBSz9cSegDTF96DeK5W4ksnCmA1FrR48r5u9ta8oT5wToWI4wLg3lVp8sbW6qGbj5JtQsaA8z2+th1u37R/DyUVonDXEq6qHj9YPT0Lm6aVQXw+qrRFpXkpUkvXE9bYeXboNvbSBdmazHlDruGRiDbDSjjuwAG+A=
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
Subject: [PATCH v5 0/7] Domain on Static Allocation
Date: Tue, 24 Aug 2021 09:50:38 +0000
Message-ID: <20210824095045.2281500-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2166c4db-796f-4ac7-76d2-08d966e4b9e3
X-MS-TrafficTypeDiagnostic: PAXPR08MB6413:|VE1PR08MB5789:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5789E34FE389E25F5DF379FEF7C59@VE1PR08MB5789.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WRbfUylmS4Be0WRfI611HRbEniCgbhWe1o6MVNLLwg8SmXb4t0XHi+3tIjSHyblX613l4sGp9GwVDEzoaYwPaBebyKY/f1UwXkn7+dlyCW4dhuzJTPLKHnCMZNjip11aGnpDIo4xcBD2wmuFVXJlG0rbC4nyT8KtTab333jko8Ur++obYOEgjg+yR3RId8m9rZrESdNuG7BrLEhm1uE8OEwbsC1eqc1n78dwXncIk3JIveLZywarBWf0NcSQvxNph4lX1lhpbdeL5De+b8X9EnjvDvqlCZAjsoZpcrBtslHc5CiR7XzZX2m+fK+y3lbHujsR7/XfqCzR6GSCegFNGxnbeYXylSQfYYwmHqxj/X7+dMajja78oGmzaQgylX1q96ifVppXmR+KPug/cfrzbfpigWOtMdg6uE/W6QJJcsdyopGKG3/Mv8VrDqgojS37t7iXHlPcQkQb8y/wzgQSbJ5JjnB0bhv/1ptwrRCcsaxnOTR1AA24zJix28ngTuyl0Smjqw5cmp1UoRUSRvc0w4OoOxp7Yzw8mJ/dbGzVCX5ELO9otLiidTHa63483J8OXXbDDdSjvFv95qVcBYNU5oLSbm6tvwJZ/WUoB/Y3dqHTppo9zX9YPvtba7vUpImD8WMutAZkSHOzs7TVR/gFClgwJaBZO6jhCkDznCsUfRCsIizNtwFDEyhKviSpZyVf6oc3/Z+kTyIfha6xHYgOGJbQN3c1RFxoSpsZvOjKwQ/4t+DbKkE2FmxXF70HgRZ6JZJnlEWnXb/DdBYoyPnExudCkMI0VJ5jkv2nYL2tXvynbUWlCC6Vo6FXww8z6L+d
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966006)(36840700001)(186003)(36860700001)(2906002)(336012)(8676002)(82310400003)(83380400001)(5660300002)(47076005)(110136005)(7696005)(8936002)(426003)(2616005)(4326008)(966005)(6666004)(478600001)(86362001)(44832011)(70586007)(26005)(356005)(70206006)(316002)(1076003)(36756003)(54906003)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6413
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46ad7f5e-498d-4b5d-14db-08d966e4b043
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2T0RimhRTTFHQ4iPks+VBacCEzTNbxMf3iUjUkGweSaJuwO1Dnxixuafpg7pJNug0mAAr3IRxQW3PQdb9o+/vLJU0wP7V9nPGmpBWpwMY7zqYf/NDagyjcmVB0OYycNWpG+7PWiNv9ImgdtGOsc918npOa9fQswHX9h/flmWP6jU/8FWml+aLYYubjpoqfO5XEorNtOuln6fmSHvWfRsXLk1Mpxlq2PGhruF00eYA0+EpOw1bmiPQaKPD6T+FF5PaJiDagW2/ldS1Xd7cOx52mqasR5B6PZ5NaWyZxK7I5dx85WS9CVTd0BQ9nN3Q6evP54Hc2/TKgi4EACwC8N56cDQnjyK5z753H/gvPDKElBuqIC0Ah42DSfwBeYqolfKWZtMIXWOfUzbR17iMKbq0r9aBhO+xi6Usckmcl1du9qokfBUanELR7MxZ6wxAnBw6Pd+UmKcg2/xL7K7n1qHGWCpWSj4iChXW20qxLDid/PTmoDYYwzMswiNblAMpwftB9ofUchDbgQSLvAhajowt6an97+DEEvSCY21Co8ZUcayGU1iZN7w+6U0qMGEYRCVgiaAoDfax7hnrcXnONY+oN5qF5OJR9Z1kKntKTvDLtbXwkNbhbZC7oNgOytk/dzDdLpJzf5WcVHdw68cHJ7UAbBjQh7ofQyxbKcp0XtiWUylmQZJhIeZrp4etmDZOaFRvynLIqhhrgHeNj7agZILGys3o/SqDN7JIq7LBCiwTXtc1bXYsKuJpGOQI6ak/2F0msCqkQ1MsfQJIOJViaQCuAHO+qfcmM9VB5aLVZsiFgw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(83380400001)(36860700001)(2616005)(2906002)(36756003)(966005)(478600001)(47076005)(1076003)(44832011)(26005)(426003)(336012)(70586007)(7696005)(82310400003)(186003)(4326008)(70206006)(54906003)(6666004)(81166007)(316002)(8936002)(82740400003)(8676002)(110136005)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:20.5855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2166c4db-796f-4ac7-76d2-08d966e4b9e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Memory can be statically allocated to a domain using the property "xen,static-
mem" defined in the domain configuration. The number of cells for the address
and the size must be defined using respectively the properties
"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".

This Patch Serie only talks about Domain on Static Allocation.

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
---
changes in v5:
- check the node using the Xen domain binding whether contains the property
"xen,static-mem", not the property itself
- add "rc = ..." to get the error propagated
- introduce new field "bool xen_domain", then static memory shall be also stored
as reserved memory(bootinfo.reserved_mem), but being bind to one
specific Xen domain node.
- make CONFIG_STATIC_MEMORY user selectable and gated by UNSUPPORTED.
- wrap all static-allocation-related codes with CONFIG_STATIC_MEMORY
even in arm-specific file.
- make bank_start/bank_end type of mfn_t, and rename bank_size to
bank_pages.
- Having both functions assign_pages/assign_page with similar parameter
arrangement
- bundle all the functions for static allocation in a single place
- return an error and revert the changes, when the page is not free
and reserved.
- check the MFN is valid for every page and also add a comment to warn
that this function needs to be reworked if used outside of boot.
- use less of mfn_to_page/page_to_mfn
- use ASSERT_UNREACHABLE() to also check that the two flags are clear
- pass the start MFN first and then the number of pages in both
acquire_staticmem_pages and acquire_domstatic_pages
- make acquire_domstatic_pages() to return an errno
- don't split comment over multi-line (even they are more than 80 characters)
- simply use dt_find_property(node, "xen,static-mem", NULL) to tell
whether using allocate_static_memory, and add error comment when
"xen,static-mem" is used but CONFIG_STATIC_MEMORY is not enabled.
- exporting p2m_insert_mapping() and introduce guest_physmap_add_pages
to cope with adding guest RAM p2m mapping with nr_pages.
- check both pbase and psize are page aligned
- simplify the code in the loops by moving append_static_memory_to_bank()
outside of the if/else.
---
TODO:
- reboot domain on static allocation
- Implement all memory-ops(hypercalls) regarding domain on static allocation
to balloon in/out memory
- asynchronously scrubbing PGC_reserved pages

Penny Zheng (7):
  xen/arm: introduce new helper device_tree_get_meminfo
  xen/arm: introduce domain on Static Allocation
  xen: introduce mark_page_free
  xen/arm: static memory initialization
  xen: re-define assign_pages and introduce assign_page
  xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
  xen/arm: introduce allocate_static_memory

 docs/misc/arm/device-tree/booting.txt |  33 ++++
 xen/arch/arm/bootfdt.c                | 100 ++++++++---
 xen/arch/arm/domain_build.c           | 156 +++++++++++++++-
 xen/arch/arm/p2m.c                    |   7 +-
 xen/arch/arm/setup.c                  |  31 ++++
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 xen/common/Kconfig                    |  17 ++
 xen/common/grant_table.c              |   2 +-
 xen/common/memory.c                   |   4 +-
 xen/common/page_alloc.c               | 250 ++++++++++++++++++++------
 xen/include/asm-arm/mm.h              |   3 +
 xen/include/asm-arm/p2m.h             |  11 ++
 xen/include/asm-arm/setup.h           |   1 +
 xen/include/xen/mm.h                  |  14 ++
 14 files changed, 540 insertions(+), 91 deletions(-)

-- 
2.25.1


