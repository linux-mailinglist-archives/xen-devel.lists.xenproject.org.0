Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291B505085
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307189.522479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQPm-0002M7-A1; Mon, 18 Apr 2022 12:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307189.522479; Mon, 18 Apr 2022 12:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQPm-0002K9-6x; Mon, 18 Apr 2022 12:23:34 +0000
Received: by outflank-mailman (input) for mailman id 307189;
 Mon, 18 Apr 2022 12:23:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQPl-0002K3-2v
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:23:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aca533a-bf12-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 14:23:30 +0200 (CEST)
Received: from AM6PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::46)
 by DB6PR0801MB1621.eurprd08.prod.outlook.com (2603:10a6:4:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:23 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::27) by AM6PR10CA0105.outlook.office365.com
 (2603:10a6:209:8c::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:22 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Mon, 18 Apr 2022 12:23:22 +0000
Received: from a8f67386c85d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F57D3D2B-A9CB-4177-B502-625DCAB600EC.1; 
 Mon, 18 Apr 2022 12:23:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8f67386c85d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:15 +0000
Received: from AS9PR06CA0096.eurprd06.prod.outlook.com (2603:10a6:20b:465::25)
 by VE1PR08MB5054.eurprd08.prod.outlook.com (2603:10a6:803:10d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 12:23:13 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::3d) by AS9PR06CA0096.outlook.office365.com
 (2603:10a6:20b:465::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:12 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:03 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:00 +0000
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
X-Inumbo-ID: 5aca533a-bf12-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jEisy1eATjqY9YTsVOUYfJAJGD5K6BvzhFoHMEHvwc=;
 b=Aurocu2ta85DIMxDSXdWrUAVExaSkmxjbRbewCZrPD7yUpwb4SX3HLuyOmeN1nz0cJHLe/FSj8u34xZPejW3uTvM5gvZnJ5wMI6YnE+JSDGN0XGK1r9JbV65Tar+bACmn4lPOf19eJdLH2/715iD96vv9G7aby+2UjtV4PvpdNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83e03bd944504bf7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFpVpHDXLh79SvgSwqlheMNes2IiWkmVApWwBntPZeWiydOhQ+i7V9R3QvCs+aCniK9YL0aHFAG4tU1ixyoYl04RWBc5YDyNM1s+29ifCoDk8OztJL+OwakHo7O99LAx+BtibUqwyGgJHmbfYpihiiNfuk8GCme0/WtA9Gzx45meVKovbYczV999OWJl+3qIL3/QP7BIeVXXWQKHuX63K661Poiiw91GKzo8ATvG3kBme61rV41uNVJKwkBwi7A2FH1vouMw7Pas+iDnF/Jv9sN18iuUl6BuLk0PBWPY8I/LBiZ21Khvk3IjTkS/7frbpnZ1HiEynqIlhe5kLQTqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jEisy1eATjqY9YTsVOUYfJAJGD5K6BvzhFoHMEHvwc=;
 b=SnUfKrv6eu7bgl2oSQ1tRSBMOJJ6lRC2Jrl7PrEHkdP2qrJGI4FisRn4ccrTbNkp1IOar4OqS2Xv2euRCiSX2ECQhWjUPwY1rXOSvEEyGBQvRA2DOvMkR3pZwADaXXlG+aVn/ApsdvW2Xfx31MGjCkPXpqYcKRPOr78G1rKoURPQQpK6d7Z1WQgsjIPo7rWKh0Jg93oFp1T/KN/lzhDB8AWjTGNGkFiPnYKrJQMIsNmQ8NHiq0LP8EEfF9ADg0FqIL5tQ6+9Sne37gRbnUGbtbKAHFQmFQQVfFde9AEmj8jj/0PHEttKy8mvpAvntNDSAVW0ib8bc+C/Y6XZKzHXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jEisy1eATjqY9YTsVOUYfJAJGD5K6BvzhFoHMEHvwc=;
 b=Aurocu2ta85DIMxDSXdWrUAVExaSkmxjbRbewCZrPD7yUpwb4SX3HLuyOmeN1nz0cJHLe/FSj8u34xZPejW3uTvM5gvZnJ5wMI6YnE+JSDGN0XGK1r9JbV65Tar+bACmn4lPOf19eJdLH2/715iD96vv9G7aby+2UjtV4PvpdNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V2 0/6] populate/unpopulate memory when domain on static
Date: Mon, 18 Apr 2022 20:22:45 +0800
Message-ID: <20220418122251.3583049-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 3a7e17bb-2b4f-4aa9-7291-08da21363b09
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5054:EE_|AM5EUR03FT042:EE_|DB6PR0801MB1621:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1621FD995E04EBB8419A0371F7F39@DB6PR0801MB1621.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FlW3t7DM/7MFyp9HnD0kqQqPgbXIskpZNCoedInVbj8GUhxv4p9YulCweRInId8muHqJ2IwychS/PM6QpJBv93Z/e3pSs0Rh4Csuf4Qtx7x4JcWuSKCGEpjS4klzmcUAZj4GG7FsCnlXzr9K8Vrq+PAT/WffWYbId9jRk6gJl3HKwMptNjbsTxTQpneulhonjnrs4XXX4Z5jzhOXY0FUfcRkJqQTVUYqkBX5S99heNHBpgRLRYMiJEXcAKebpLOpg1dMYz2IRNWM+XBrrf7WuZ1IZZ29+sUlDWCksvOJ/+UX3Qd9Zm6HVGHe1QkpqATEfmGm8UOiTX3o+Ntjx086hdehKDN/8Xh7s2t1OkmgynErxIJN1USZRgpu/dSYdwEnRY1vjhwGYAHRlP783kAlcILIgpTO9f2EEnehNMWG5jidQ5D4cJqcxib+6DSSGJlu/xIAh9FkHzYc1BClfCOQxBkQJWMNLuopG1cAunXvj8sy9Pyh8SjriqTh1YolDFnVY4p9xX766w2vrgIYJfR5i/R9lHiml6NomDG7YPhIMC0LEmpgG2HM0PlVdisZhm5KcSt5RiPYRQue7tUpHmjkRXI4Hb/pyVNCJ6jAymZQW/PHtBC5lBLqT/CeTdEjkyasXtZcQobFnvhckZig9Hcdcxfop4IO2Wa8/uZSuveG3aVS+ngMO2UUkQDgU6c8RBCYekIZJuAQwX8JfjxN1VDv/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(47076005)(2906002)(356005)(81166007)(4326008)(70206006)(8676002)(5660300002)(70586007)(8936002)(36756003)(26005)(36860700001)(86362001)(54906003)(7696005)(83380400001)(508600001)(6916009)(336012)(186003)(426003)(2616005)(6666004)(1076003)(316002)(82310400005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5054
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f14227bc-b6f5-43dc-201d-08da213634fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uHzrKeS4/JkxH2yQVzDD9VtQL0rHl+qVYOjUXTLjfIPLd1u+VI2q1hG4Y8dAJtoMLhdP4UysPvvAxmobFSvhErNXyZcaKQFR8IxatYyD4EM76iFyqtYiyXQU6KQP5g/0gjUpxIzehSmbAP6OCBVL80LLqcyzM7plkfO/wilhDFXR8/x791AOgo/CdgaEdCUC64ZyIjnpgmpfQOH/OwIqUX5AHQRO6BPTwPA0qxAKE6Yw8Y+y+vGX/yrR1U+HknQ0QH+nQxI5YJBotw5LVaFTQbcXktcK2PfBpKujzorcOzOFAWcOo/t1HUtXWX7XlE/Cm8+GFRdx7tmnF2MaFCaXDbRPDSgIaSriBFzNUezs5ARmCWvgXAIkVK/xv9hOiqqTaj1zSLvNVgKRmlW4zFHHF0h7eOKiwZYzO0aIv08dpRwCMpQjummF+kbqApXnDuNG/JFJBO35InmPI654CJINUGszAlRANLqZqBkLQW3E8jyOeNu1F+UXE8kjYmzmAzbSRvO5hUldpskNBaXm6lMrqMSMot4E3StCcb7ovQ8M0L2DSMpJrBVWIXmUzQItMet7cQgc+sTrZOjubFSDXMKgkKjJXr9ywuelE7Pgj6kyuaHFEUso0b389lrOSEiww8il4QNVbaaAOu8XoPwhz7JfwrjuYEXwXjt/mOVqKB/8a1Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(5660300002)(6666004)(2906002)(7696005)(8676002)(336012)(86362001)(1076003)(107886003)(2616005)(26005)(186003)(47076005)(426003)(83380400001)(508600001)(8936002)(6916009)(4326008)(54906003)(81166007)(316002)(36756003)(36860700001)(70586007)(82310400005)(70206006)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:23:22.8143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7e17bb-2b4f-4aa9-7291-08da21363b09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1621

Today when a domain unpopulates the memory on runtime, they will always
hand the memory over to the heap allocator. And it will be a problem if it
is a static domain. Pages as guest RAM for static domain shall always be
reserved to only this domain and not be used for any other purposes, so
they shall never go back to heap allocator.

This patch serie intends to fix this issue, by adding pages on the new list
resv_page_list after having taken them off the "normal" list, when unpopulating
memory, and retrieving pages from resv page list(resv_page_list) when
populating memory.

---
v2 changes:
- let "flags" live in the struct domain. So other arch can take
advantage of it in the future
- change name from "is_domain_on_static_allocation" to "is_domain_static()"
- put reserved pages on resv_page_list after having taken them off
the "normal" list
- introduce acquire_reserved_page to retrieve reserved pages from
resv_page_list
- forbid non-zero-order requests in populate_physmap
- let is_domain_static return ((void)(d), false) on x86
- fix coding style

Penny Zheng (6):
  xen/arm: do not free reserved memory into heap
  xen/arm: do not merge reserved pages in free_heap_pages()
  xen: add field "flags" to cover all internal CDF_XXX
  xen/arm: introduce CDF_staticmem
  xen/arm: unpopulate memory when domain is static
  xen/arm: retrieve reserved pages on populate_physmap

 xen/arch/arm/domain.c             |  2 --
 xen/arch/arm/domain_build.c       |  5 +++-
 xen/arch/arm/include/asm/domain.h |  5 ++--
 xen/arch/arm/include/asm/mm.h     | 17 +++++++++++++
 xen/common/domain.c               |  7 ++++++
 xen/common/memory.c               | 29 ++++++++++++++++++++++
 xen/common/page_alloc.c           | 40 +++++++++++++++++++++++++++++--
 xen/include/xen/domain.h          |  2 ++
 xen/include/xen/mm.h              |  1 +
 xen/include/xen/sched.h           |  9 +++++++
 10 files changed, 110 insertions(+), 7 deletions(-)

-- 
2.25.1


