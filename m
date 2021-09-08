Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E3403759
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181611.328814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHg-0000w8-8F; Wed, 08 Sep 2021 09:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181611.328814; Wed, 08 Sep 2021 09:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHg-0000tf-4j; Wed, 08 Sep 2021 09:54:24 +0000
Received: by outflank-mailman (input) for mailman id 181611;
 Wed, 08 Sep 2021 09:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuHe-0000bc-Ge
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8f14c5b-4e24-4dad-9847-be994e9b4b79;
 Wed, 08 Sep 2021 09:54:15 +0000 (UTC)
Received: from PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::21) by
 DB9PR08MB6764.eurprd08.prod.outlook.com (2603:10a6:10:2ac::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Wed, 8 Sep 2021 09:54:13 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:101:1:cafe::dd) by PR2P264CA0033.outlook.office365.com
 (2603:10a6:101:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:12 +0000
Received: ("Tessian outbound 610b9df843d5:v105");
 Wed, 08 Sep 2021 09:54:12 +0000
Received: from 056c89f01e9d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B14FAD12-741A-4612-B01D-4FCB12450E7A.1; 
 Wed, 08 Sep 2021 09:54:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 056c89f01e9d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:05 +0000
Received: from AM0PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::21)
 by AM6PR08MB3320.eurprd08.prod.outlook.com (2603:10a6:209:48::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:54:03 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::77) by AM0PR10CA0068.outlook.office365.com
 (2603:10a6:208:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:03 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:02 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:06 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Sep 2021 09:53:59 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:03 +0000
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
X-Inumbo-ID: e8f14c5b-4e24-4dad-9847-be994e9b4b79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBX0PwkTMiWyE/sx14ufn9c6BIC7mzVQZNMew7fmruw=;
 b=dHHcxkEsvmGks+u0JkP1kgCfQlkBHAJ8kkcLl+b8SEW+z+36LAq4PdpLdvXi02nQjyNn/+LnIZ/1eD+TWaiDYuQaZL5w3TqDy2cNBDGHCUYTn3UTbUARFzpCXi1qS4sUNtLoPBGGKO9WAeWvOhfR0tkDhDpxv04wC8gZ8Nuw0zA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b671d2233b8a19d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Six+12KXp1VJDlKtrW44SuymfQWgEU0qInacgt+tj1d3qoytge2Hmq1cECUcfnmMtrBgh3Og3PEcNCoY9MAlI3OQJgDRO+tCjqFX/Jt1iORS1Uj2Am9NrwoS8h0ktQ3cxCkbpWaZP/Dr3YGJtgLMwDMB4CF8/WlBSL6FMsf6Z1vuHfaSRn/QOsmwcd3EuuXJZF3ryJh+VJ/zq7sejM4hBXrQgazzy48VkXD3V1PJOR8Tsdhfd+vgFHb1QoURSSmtfw69QZVXUqY4Buew1hPRdMmczs1kvw1Z/1nHs8WXGPnQ42cIIc+Q30z0g2T0DPQi5DC/FXEm4nAYCXhBxC4wxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CBX0PwkTMiWyE/sx14ufn9c6BIC7mzVQZNMew7fmruw=;
 b=XgE+mXKkiSptOrvI33nM+Q7uHd+Cc1TWGLTwMretKSUi9wKK9dG1+UKQnVxILXtzLGfwh+Zk7aCToAVOvzSye4f7B6EtTP//1F2cFWm/X/nzfce0njI1XvKAK2/h1pxbXpy3pn/6wGVuH7bj+/u4BmZpveFYXD42oscMxo7J01DOI+NamLekCwJhDOiL353ly3yuCy2BqMIHeHPQPVRNNqYpLnXpqF4jQOnRdW0REFQfH/r7OpQfYZYf/AnyL7k+2/jjd9SSabKO9WunoX2oH1gwjjXT6vfnE+jon96xs9s+jUr5JYeVPmWmSx2HYs3yEFTH42xDGH+U6y7TnEy8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBX0PwkTMiWyE/sx14ufn9c6BIC7mzVQZNMew7fmruw=;
 b=dHHcxkEsvmGks+u0JkP1kgCfQlkBHAJ8kkcLl+b8SEW+z+36LAq4PdpLdvXi02nQjyNn/+LnIZ/1eD+TWaiDYuQaZL5w3TqDy2cNBDGHCUYTn3UTbUARFzpCXi1qS4sUNtLoPBGGKO9WAeWvOhfR0tkDhDpxv04wC8gZ8Nuw0zA=
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
Subject: [PATCH v6 0/7] Domain on Static Allocation
Date: Wed, 8 Sep 2021 09:52:41 +0000
Message-ID: <20210908095248.545981-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c073a9a-1d55-4a52-4e90-08d972ae9cb3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3320:|DB9PR08MB6764:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB676425EB9B27AE682F3CEE8FF7D49@DB9PR08MB6764.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qTqc/3a0/Vhag0ux6FztrgpkVCRp2tU8xpeBnXGqESCqDP2sQgL2iRt4c0aYDBOXbpsnVedMawd6PVFAIlsvCHS4zOhWAcFL7VQ0VZujJllM9Sw05m7cEV+UfXKGsjaUysOwRhiyVRh1huDZxrACy9RGxoQH0blcZFO8Bket4XEBwZyYE3t6iJMva5GRVUPwU/ixPYwHAot4+/lh83k6vBOEp5E6QRkcY7ujYdflSq+oNc8l7wB1tEgTgvKe0nne5Uu1/kQ5dEPao/MRL7Ov7Bwcfh4XWHW2itAyWY68wMk6qnAa07QFFwYFtczXU17OsFr2ziy0QB+ZSd0hIEv9OF7mApQDHnH6ff1yTc3mJnleTA3SFMuJqCTQkrsDgXrXol/2/BX/8Hso9lOngqJmngxf8ND+x/FmDxqxG4YcLp7y37K2/YRCy/5C/Ssle8Pw2QpNtnHXUSvUmNglwA9bXAhn71dk1jRdcbJni3n9r9OJTvDePdRTafIWNSq3pAGuB3q1BO8cYSpAK4QEJka0CSogryMjJxL2FKbVHCno/mOhgAZNUDYsrsNJRKSuOvUXwNTWvWFvTUfYDkoeDZFNiW6T3AWal4RS/Z982hgWISleczqmSuQsewPccg4+H1dQ8vtRnB5LUMhsc46/6QZJgP3OBXTkxtGqZ97HAiQA4uy7uCLTryZjYbUJNehYlnMxuZtUFfuWnzE1EJ2tc1ak8vx2Ovw2xjYAas/Mudidxry9n77t89I1Y+uerM3n1JacblQSlvzN14x61RQ/MLf+elE7voeIykDshHV0IXTa5e3ATvfeWkusaHZJqu4P48Ec
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(82740400003)(110136005)(316002)(36860700001)(1076003)(47076005)(83380400001)(86362001)(44832011)(82310400003)(8676002)(4326008)(2906002)(2616005)(26005)(6666004)(36756003)(426003)(356005)(478600001)(8936002)(336012)(5660300002)(81166007)(70206006)(186003)(966005)(7696005)(54906003)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3320
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a4a8db5-15e9-46d1-4ada-08d972ae96dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+UceenRdIteWWyKgdXjzXFzrESqBDbVvbbaOqs55uhGqTqEFO6HuQRzMqcJPsA31eArXJSE8xIqkOdn5Wc9+RFxFR/P2xFkj2gzKbW6rxTYelEVBMBiQxXTVuIkmd9pI5iBK+B7LKAleuu9Aq22f0RowjY/HRdd4H5g3sVV3KvObIB45QXDZo6iTd21Bbf7/u1AUcePCJY7d1sJDTlD0EEPI7XgyAFjzTdKFuTwnSDmHC1IvfYQqB+RCjEsCQe6uTM28LWTnePxoKSbeA9NyklhLhD9G2Tq2DFhOGoqN2MDMzvjykysD2vJTaXTIFJZ4bh/DQF4uSjPkXmKdaxNgG0issV/lvmDOVsCin2c9fpY/wJy4RflbVJUmjR1VWGlUjD5hI8oViYujf+bEXKBX0Thf/rdDzUXhIr2kYUFa5cKzULDcvHDCeulASboXzaKliHInHxjv132KLM4U5ddAM5rLTssTCVh7dwGXzHlivOXpy30+cQzO99ytl6P9iVsMCbobdXGI+zdyjwqIZQrxBHBXjpQpJZFgJN3Jeo2l+CeE+MAao5IDRSoyMeMaEmDcGm1a2OIGYlmrcRXbCb3Um2DTEMR0COqfcU45rmi0HdZPn7ZONr79OQ9+keedb1THAF7ZpxQyYxgomAjDlyRjMBCulRprP4kp62WFlD7lMuXGGyfOSk5ep686BqkioNW80AAlbv17mpLIIgjFbweHq4QmV3VCTiAvdMT3Ek+ByTZv+RYWNl85l0SGHmYfF4RauwEzxUKL95A8wvNynQdxavMs/DSgZL4qpmDvhPdkywY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(44832011)(82740400003)(26005)(4326008)(36756003)(426003)(36860700001)(186003)(70206006)(70586007)(110136005)(6666004)(54906003)(336012)(316002)(86362001)(107886003)(8676002)(5660300002)(7696005)(81166007)(2616005)(2906002)(47076005)(83380400001)(478600001)(82310400003)(8936002)(966005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:12.7089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c073a9a-1d55-4a52-4e90-08d972ae9cb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6764

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

 docs/misc/arm/device-tree/booting.txt |  39 ++++
 xen/arch/arm/bootfdt.c                | 108 +++++++----
 xen/arch/arm/domain_build.c           | 160 ++++++++++++++++-
 xen/arch/arm/p2m.c                    |   7 +-
 xen/arch/arm/setup.c                  |  27 +++
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 xen/common/Kconfig                    |  13 ++
 xen/common/grant_table.c              |   2 +-
 xen/common/memory.c                   |   6 +-
 xen/common/page_alloc.c               | 249 ++++++++++++++++++++------
 xen/include/asm-arm/mm.h              |   3 +
 xen/include/asm-arm/p2m.h             |  11 ++
 xen/include/asm-arm/setup.h           |   1 +
 xen/include/xen/mm.h                  |  14 ++
 14 files changed, 544 insertions(+), 98 deletions(-)

-- 
2.25.1


