Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2154065D1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183853.332227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWek-0004Bo-Ur; Fri, 10 Sep 2021 02:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183853.332227; Fri, 10 Sep 2021 02:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWek-00049h-RP; Fri, 10 Sep 2021 02:52:46 +0000
Received: by outflank-mailman (input) for mailman id 183853;
 Fri, 10 Sep 2021 02:52:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWej-00049b-PL
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:52:45 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.63]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b8db406-11e2-11ec-b209-12813bfff9fa;
 Fri, 10 Sep 2021 02:52:43 +0000 (UTC)
Received: from DB8P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::24)
 by PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Fri, 10 Sep
 2021 02:52:42 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::e) by DB8P191CA0014.outlook.office365.com
 (2603:10a6:10:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:52:41 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 10 Sep 2021 02:52:41 +0000
Received: from 860f5e1d0fde.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 829D0E2F-8CD4-4B8F-98FE-785383FBBCED.1; 
 Fri, 10 Sep 2021 02:52:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 860f5e1d0fde.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:35 +0000
Received: from AS9PR06CA0180.eurprd06.prod.outlook.com (2603:10a6:20b:45c::27)
 by AS8PR08MB6727.eurprd08.prod.outlook.com (2603:10a6:20b:393::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:34 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::2c) by AS9PR06CA0180.outlook.office365.com
 (2603:10a6:20b:45c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:34 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:39 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:37 +0000
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
X-Inumbo-ID: 2b8db406-11e2-11ec-b209-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAwD+O7ALEnhbk9hWFjHxBehgLgxUIQfpBy8konpdig=;
 b=vcpkQ5OrrnCLq8S9OD7vKXVb1hyiiLAVfwcz/fuXQnU1UW24uGj6belg5iSm5Dc6Q+r2v91jIeAe0nLPy2psEJATcLp6BjbxqaqnfG7j/Bo7jD3t9fT0PnBg0FWp0LxPOpWOkMl27b8nzhWOnVmKw2puendDV+mhvxRb03TUef4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6939813991210d9f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3SoljXG8pYWWqWR7pgTW8kz3Ub+IMw71/XrpPT3fshdi/gNWHKgIdl9boO205Ulgs5kSwK/+Z8DMXVOXdCaWa4QvwVd+KbZd2iPLC82CnIepGQT/INjpdwtG/0AzEmg+8krL9j9z8AvNb8kL/HvyL6Tqcdf/UHCozMX8wI7PvuNoCZM0cQCFl5kMU1v28JnikD7n6iRj86QNZJ9d6i92LUR2AkGn3MG383huVjDGbnYarbaNkk++zwfPuH6XmlPTf2t68tyFSiLA6oKf1H8dBPGonmNLyP7JYXqF4E5/jc8j9R78GLAVyK/sszwGrFw3gm74aC1pQ+h144XIoTB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TAwD+O7ALEnhbk9hWFjHxBehgLgxUIQfpBy8konpdig=;
 b=BGbmjdQlkP88xgJXyBihQNh8OiFTJVC4Nz3G1gZ/zhsqOyLOIi3exlsQA9tPYdQFWPgdk0cEk3JxUkm+MZ0VJp4YyumTrMjPVh+/aschMa9ep4G6g3RHwBu2GyrwJUZ6pw3ubzY3RfC/nHR4sN5G4Y8JRZFBdFI+bIaiLcwOT1PvAhg2vwNupeT+OcOpKENpFwG8ceaIkYHm1oIa8wuiVOJ/TOnnF6eImS/VTdYUVbnyyrJlTq8P+oujhqZvFAg6qYjlm4IskWzXNHC1DVSgMdudiTPns4sMq0pwWKLA1zuhzLJ7kq5pqbnGdQ8hIb4FdukWuGaRL1KL8ttnPiO7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAwD+O7ALEnhbk9hWFjHxBehgLgxUIQfpBy8konpdig=;
 b=vcpkQ5OrrnCLq8S9OD7vKXVb1hyiiLAVfwcz/fuXQnU1UW24uGj6belg5iSm5Dc6Q+r2v91jIeAe0nLPy2psEJATcLp6BjbxqaqnfG7j/Bo7jD3t9fT0PnBg0FWp0LxPOpWOkMl27b8nzhWOnVmKw2puendDV+mhvxRb03TUef4=
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
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v7 0/7] Domain on Static Allocation
Date: Fri, 10 Sep 2021 02:52:08 +0000
Message-ID: <20210910025215.1671073-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af1dc25e-75e1-4c25-d778-08d974060f00
X-MS-TrafficTypeDiagnostic: AS8PR08MB6727:|PR3PR08MB5593:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB559392DE98419EB4BD3692EBF7D69@PR3PR08MB5593.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dYqj5cf2hLFpHgRSKc7eVqRGJtwgTSBkj8c2mqwlJaUVJPLvhV9hcn1vjNnygWE2L0JA/do79rHlNJR1J2kWR2WEbJIhEb1CvbLpwH+xLsyPmIJ4IffSI8O7mIIwQxyLJJi0/E32ee7PusSBwBM+q7ilmnEz9CN5UANbYj3S1N9P8xnm46MKioAokgQm5yJ4qcY3gMgVPkGcAI57NPdkvkusAtZMwVvevdi8CJZytujNrG1vvN+j84MYxWwRsbR5Y8DSMY60/4Wiu8I9vpF+ezultxuO9T9iM69V2cB6lcMFWehWYNsxfH5UOdQASL4Wp9i7ba7V08QmobmHjENeHChUoSAd+Bm/Pz43GQHjJN2SWHhd7+hhPXmdPlItUyXPV1FYrF0QS+8i4t4O/BFCTflX+1f4k0dl7TFabPV5yD2AaYmSIx9K6Tj/Y+YgKv2CZCaFAVjZLvTuvrPdhAEfV9+29bPl10Z7rxo0y8hH+uG9VgZ+9lIcQ182mYbitPtEy6iCTspTF5rKqxRGeQn19/yPY/AHwVdkIiP2Tn9XZSwxr9l2t9q2Pi6KK2+WKc2n24Arc5+tgYdBYUNyZZ1y8dRqRe66wdsZXmMhM30RYeH6RSfmTuR/piOsi0QjYybFUm8T4uayN40oYvw9ZCe61OZZXipxyYCTsVBhzdqneokxaW5asGA3/8A4BLdZ/I2s1TIpbzKYNp4cH8o2Whsg8/LVwFDU6pEgm65cKWyHtTLNWzlyQpFQRwNRW8Am67PP/9NpLKJJsxcAIUAkYbeVzNrYbotExixNfvZUZRTwqODAfAd7xnlyBt1ZQWEofAa6
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(186003)(316002)(110136005)(5660300002)(36756003)(44832011)(54906003)(8936002)(82310400003)(336012)(1076003)(478600001)(26005)(2906002)(966005)(8676002)(36860700001)(6666004)(70586007)(70206006)(4326008)(82740400003)(47076005)(2616005)(7696005)(83380400001)(81166007)(426003)(86362001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6727
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e54dafaf-b35d-4c85-3cfe-08d974060a59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LxqPFEzCW7XTHEvN0E3sQt6FVHn1g/89hWpmKR5oJxXPAzzHqMJCkOlLNswQLQOS0qguH1uObPMoO/htTuS3xf0c0bOl0fIvYQh/aiLPLALxm5ewyiZLDcQR79WPIXaX1rqvxfI0j90LAjbrypSB/MabiWXrWhYgCL7Mp6tfhxRj73WSZjiUMcguMXDAWzKLER/IIZ3cPFgBQnDlTeJuizHrBRirGrD0T9FyG8hhb/9d6IM5RJJDBB6OJieJN1RKF2MU+4BBDLjwRyfxBE233upR08jUJx+JYhtOE2S35s0nh0chTDgw02qjfsrUPPyTqQzr1ms9e3C0US7WpBpbCrmRppBo3CjIqucQRHljcK7KiijI7DNP/rhHBIu6QUdoVNNSPS9AZBSgUHKO9x9OkCAOGrAyNvCJrtnz+uFYDTN8PDJunHZ8KWELt8/JFWu9hnlQFmOrgqAnVYjh9bhLQfVbpIxMNT8EeSUBkwXaKYSkaOhz+mVtOZAr5WJHLWK4B7xF3P3MoQMlxcYTHGaLdsxSQxvYVCemWokTturYk2DG8DmPDm2z/y05xW8weh1nQpG+p6CtzpzTDV8mC4u3xoy/R+ZsbNhu1JsKwnchTFUibP7NcLNPkEcZuwYcFre8L9s7VZQTUJ9FJNYpknGS1EzyEnoKfwL9waEgyF9NeYakVav+LhquRVp+vAt5tMCPsdQFv+/JNGz2NfekX440g20l279gRYZMsCaEKYmLRKMA84x+oEGqSKiGCZ2JKpQtZLhNWjKXnxK53ULWoub9qHKofOoK3mHJAYi4XaSNC+4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(46966006)(107886003)(316002)(7696005)(478600001)(6666004)(336012)(82310400003)(1076003)(426003)(83380400001)(186003)(44832011)(5660300002)(70206006)(966005)(70586007)(47076005)(36756003)(86362001)(36860700001)(8676002)(8936002)(82740400003)(4326008)(2906002)(81166007)(110136005)(54906003)(2616005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:41.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1dc25e-75e1-4c25-d778-08d974060f00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.

Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Memory can be statically allocated to a domain using the property "xen,static-
mem" defined in the domain configuration. The number of cells for the address
and the size must be defined using respectively the properties
"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".

The property 'memory' is still needed and should match the amount of memory
given to the guest. Currently, it either comes from static memory or lets Xen
allocate from heap. *Mixing* is not supported.

The static memory will be mapped in the guest at the usual guest memory
addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
xen/include/public/arch-arm.h.

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
change v6:
- move address_cells and size_cells check into device_tree_get_meminfo
- doc and comment refinement
- indentation, and the kconfig message fix
- let assign_page have a different order for the arguments, not assign_pages
- fix variable declaration and some format
- use PFN_DOWN(...)
- provide a stub allocate_static_memory implementation for
!CONFIG_STATIC_MEMORY
- add a statement to clarify the binding between the "memory" property
and "xen,static-mem"
---
change v7:
- harmonize the argument order of assign_pages and assign_page
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
  xen: re-define assign_pages and introduce a new function assign_page
  xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
  xen/arm: introduce allocate_static_memory

 docs/misc/arm/device-tree/booting.txt |  42 +++++
 xen/arch/arm/bootfdt.c                | 109 +++++++----
 xen/arch/arm/domain_build.c           | 161 ++++++++++++++++-
 xen/arch/arm/p2m.c                    |   7 +-
 xen/arch/arm/setup.c                  |  27 +++
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 xen/common/Kconfig                    |  13 ++
 xen/common/grant_table.c              |   2 +-
 xen/common/memory.c                   |   6 +-
 xen/common/page_alloc.c               | 251 ++++++++++++++++++++------
 xen/include/asm-arm/mm.h              |   3 +
 xen/include/asm-arm/p2m.h             |  11 ++
 xen/include/asm-arm/setup.h           |   1 +
 xen/include/xen/mm.h                  |  14 ++
 14 files changed, 550 insertions(+), 99 deletions(-)

-- 
2.25.1


