Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124D4D5B6C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288709.489666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYVq-0008SN-Nl; Fri, 11 Mar 2022 06:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288709.489666; Fri, 11 Mar 2022 06:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYVq-0008QF-JO; Fri, 11 Mar 2022 06:12:30 +0000
Received: by outflank-mailman (input) for mailman id 288709;
 Fri, 11 Mar 2022 06:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYVp-0008Q3-0T
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 386adf47-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:12:25 +0100 (CET)
Received: from AS8PR04CA0197.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::22)
 by VI1PR0801MB1805.eurprd08.prod.outlook.com (2603:10a6:800:58::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 06:12:22 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::f5) by AS8PR04CA0197.outlook.office365.com
 (2603:10a6:20b:2f3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:21 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 11 Mar 2022 06:12:21 +0000
Received: from e89924f2a56e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0B1AE4F-380E-430B-B3BD-EFD62DB2D3E7.1; 
 Fri, 11 Mar 2022 06:12:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e89924f2a56e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:14 +0000
Received: from AS8PR04CA0206.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::31)
 by AM0PR08MB3586.eurprd08.prod.outlook.com (2603:10a6:208:e1::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 06:12:11 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::6e) by AS8PR04CA0206.outlook.office365.com
 (2603:10a6:20b:2f3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:11 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:09 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:06 +0000
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
X-Inumbo-ID: 386adf47-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYrJwC7mNWpHkKnyQLyh0ZZfxbUzI1fqragYXrD7bOc=;
 b=kyXSoQcvUOJgTmR52Oq3+P/jDYlSuRH2/ea3ixGI8wqfFYHzr/5FaxDV2yy6+4DPdiUzR8l9tQLY+xJFTpgH0yI69UDLyHN/1diWCXjcJUGVoRsSCwceC7r/VbaA2U9duRcc5C0M4gwdh/PPtzYOpw2hUsCdUE9iJlreygLfHHc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38cf4bca022dc8fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=davKaJ5dn+BBwP/ZUMmxRAgGt6p01FLVTo/byok1d9ep4bHkJ/YFZuDYgEgz+Q+B3LpniU8ZpltaCIYBsn1AN7ymwOcw5yDTYW+3eZuxvgPKqnqK/q/MG/QjSJcT4ZznB3bUJwvQ+fAioDf3348P/ZaEOAxXssLOl2A6gRe6W7YyKXR7Cci0lVIGOmiPd+7lUnK9l1fa3Hvoi8EU6I82IbXHb3nqTU4GouJT4uhIxfSo4uJQiP5cD+Pl+pKeRkceu/VKQguvMeeofLC3Ad5+5H/klxr0YqjLPT5sKndsAYnJWQGG3s5PgYVW7Eeh3rVuBsuP4HKn6aqZX0W4dSlOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYrJwC7mNWpHkKnyQLyh0ZZfxbUzI1fqragYXrD7bOc=;
 b=VFCoGx/RYMAGLxkIfkc4euT28HZppzOkw8G+3hjc8DERMYZsfpS7buRKT1F3oTdR2z0CdYxKa8Qyn6DvLa+9oAkKhPJuWSp+FnwGH+J1XTvzGPkF1dgC4iuOG0oWNcgbiLwQ1zd8Vw6uGo/CcYvlKkePZe2wfpo+UBSNtOdKUW0OXGVENJQ70f3e26lPGggNAfxoGnVw4tYF5fonqFHmC1DkfxSo6LvYVYxncPJzTTpi6WpMofs/RZJhZK9vNEoPm7kLNJhUBc2/j68WbIbOp4b3kzeJcpVtpj0Pii/ZBvLEXEBvtmIdIeqWeAIHmaQYkbDA0w7S0OuryGqnONY5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYrJwC7mNWpHkKnyQLyh0ZZfxbUzI1fqragYXrD7bOc=;
 b=kyXSoQcvUOJgTmR52Oq3+P/jDYlSuRH2/ea3ixGI8wqfFYHzr/5FaxDV2yy6+4DPdiUzR8l9tQLY+xJFTpgH0yI69UDLyHN/1diWCXjcJUGVoRsSCwceC7r/VbaA2U9duRcc5C0M4gwdh/PPtzYOpw2hUsCdUE9iJlreygLfHHc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v1 00/13] Static shared memory on dom0less system 
Date: Fri, 11 Mar 2022 14:11:10 +0800
Message-ID: <20220311061123.1883189-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: d97a0d10-13b1-4643-6ef0-08da03261aae
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3586:EE_|AM5EUR03FT045:EE_|VI1PR0801MB1805:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1805BF9F82FE7EFA83C41707F70C9@VI1PR0801MB1805.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pww8//JWT5OD5OJxP8IP9jom+3adUlDKWKVKmBYWY8iYAS9veC81VCpUCFZqbgN5zHZmukOjlwPj5qVgkIsEx5kdY51DgXVeOcUd9PfhU93lOg31WprYxlY7y+1n+tQttfpMg41M1H6K2YmaLY6uUtJtyvgF4kFQng9FunmsJC5lKWXSUMAW1TrUJXMWT54SahnacxDNb1SAO+XDRA7LP+esJSwSXIv7XY0Ql/FgYQz3I4FXBH59FBfTrxvmxf3ioEgDXHJ6GWoUajYKUASNpGFjxwo+LSZGSokDtBEEFBrwar9FquIj39tYY3ukVV9TZksOTu5Xv6OoJwjM0xSDt6EOCVkbQMV5jrcaTfskn6qzAFzf6gCqhmoXYyT8vp0tIpuF7gC5BZiTXrIHYSaXIjGAxwfHuB0OhnQYR5DtnECDnO5J1VOX0Hv8PiinUmk7G/DIeI8uJeNoolaPfYeNrOkgzPb/8e44/VXUs/WtYRM8E3l7BoqEH5BEQR1APDEUqO9pOmJGfYUniizeLp0VOjUDCLgyYwPU+MSe8QKuplp45/mXLDE5Hst4/Zm1NrSmw9GiFtM6wpL7NHoQS6Hz96M2z8SAflZK2FeNutCc9aZ/KfJJI7LOmFVvLVoGwmaz7qm0ufbHMMfnp64LvineDki34wvForg44ohgMplgzYChjaKA5NC7STL7J/4wOzqQtD1SNEXpWKTIfZhxSxRgG2Y2nbNwMafS3pgGnRxVDi9foSIHDk9wL+T5CU2J5ecyTlfnKDsmrYADnMl43Ej6C15+i5k1lrXQDY5jHza+0bnJPywVxTKyjkdMCAHOQIyQ5Uxd5bnaTitCuLA+pBixGHkwdZCmcT8+0Psb2fZ8UoA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(2906002)(5660300002)(8676002)(508600001)(70206006)(4326008)(8936002)(70586007)(83380400001)(1076003)(2616005)(356005)(336012)(316002)(26005)(186003)(6916009)(426003)(4743002)(7696005)(6666004)(54906003)(47076005)(82310400004)(36756003)(36860700001)(966005)(81166007)(40460700003)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3586
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6eb525be-5304-4fab-5691-08da03261472
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rhlPZS1p2fXXjJVMdJc0pcbsucmGwTfw7q6Yx34Syoquujy0YAhIS3qfFZn1ad0nWuqBbpTjnY+lLXk42wvO4N+/VHJbR/CyJ8ad8DvcqwlBfB+1zlZibL0+pemvC1yFmz/XCDT8nF+/gb0k19EO/ui8+NUR3eeQR6+7xnwhfZgHhU+NSJ9OCfZQlQkGjOuDkG7IzSoLqoC+OrxncVRAztfDGMOTMEPt6eojuVxE8fX1Q5ikSnxQMyczEXHvjjaPUIGbu9nID/ThS/tDCXhrMWddb+ERCqxo7HTeMZG3gCK+ufHBXHQswjEehQaGim3jRf/ojoo6YbIHCoFJXD4bR4k7vBkoKN6zgnaXYJgGo1M5aUgVH04XlR0Q5/eaz1n5fkHwZERE/ss5avUKXvu563Goq6j36ylvQnnCFkyFK8pCjE2TKnqUzImKuraxiRD/biSGqkEqR6tznk8Og3EZ2F8gj99CRbiZ7/OOiBc6kaw2fHdba6as6Ontx81XSWB3iCGWScqW5zxusH0PiAzqCVxwwVS6ZMZE+7Ovh7mh7ctWMWnBt/4J1Gkw52iiQKJDG4DwwFAmflS++Lxj+4Zk47H0PhOSmYOcw+JV3UUhDL62KdzMRqWmdMn1YObWkTch57hdgKPYqMqFVxtCg1q9u9fln5k7Nb4k5hwOEySza1GYkbuuVwc0IhdXFIZp7+6XLtKk8wcSOXOY7bbNJOPJBAPwZ6aZedfcFFmOUr38IA8gEfPEUNWTDddaMoJcfbXSRh1JP29R0xegjg1DI8zx0IsIrUxSD2knlS9NtbPxsKbclCHWG7gFyWADtQZV0AnJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(2906002)(5660300002)(40460700003)(8936002)(70206006)(70586007)(54906003)(6916009)(316002)(86362001)(966005)(508600001)(4743002)(2616005)(426003)(336012)(186003)(1076003)(6666004)(7696005)(26005)(81166007)(47076005)(4326008)(8676002)(36860700001)(82310400004)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:21.7092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d97a0d10-13b1-4643-6ef0-08da03261aae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1805

The static shared memory device tree nodes allow users to statically set up
shared memory on dom0less system, enabling domains to do shm-based
communication.

The new feature is driven by the need of finding a way to build up
communication channels on dom0less system, since the legacy ways including
grant table, etc are all absent there.

It was inspired by the patch serie of ["xl/libxl-based shared mem](
https://marc.info/?l=xen-devel&m=154404821731186ory").

Looking into related [design link](
https://lore.kernel.org/all/a50d9fde-1d06-7cda-2779-9eea9e1c0134@xen.org/T/)
for more details.

Penny Zheng (13):
  xen/arm: introduce static shared memory
  xen/arm: introduce a special domain DOMID_SHARED
  xen/arm: allocate static shared memory to dom_shared
  xen/arm: add P2M type parameter in guest_physmap_add_pages
  xen/arm: introduce get_pages_from_gfn
  xen/arm: set up shared memory foreign mapping for borrower domain
  xen/arm: create shared memory nodes in guest device tree
  xen/arm: destroy static shared memory when de-construct domain
  xen/arm: enable statically shared memory on Dom0
  xen/arm: allocate static shared memory to a specific owner domain
  xen/arm: store shm-info for deferred foreign memory map
  xen/arm: defer foreign memory map in shm_init_late
  xen/arm: unmap foreign memory mapping when destroyed domain is owner
    domain

 docs/misc/arm/device-tree/booting.txt | 118 +++++++
 xen/arch/arm/Kconfig                  |   7 +
 xen/arch/arm/bootfdt.c                |  52 +++
 xen/arch/arm/domain.c                 | 117 ++++++-
 xen/arch/arm/domain_build.c           | 445 +++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h     |  33 ++
 xen/arch/arm/include/asm/p2m.h        |  42 ++-
 xen/arch/arm/include/asm/setup.h      |   3 +
 xen/arch/arm/setup.c                  |  28 ++
 xen/common/domain.c                   |  11 +-
 xen/common/page_alloc.c               |   5 +
 xen/common/vsprintf.c                 |   9 +-
 xen/include/public/xen.h              |   6 +
 xen/include/xen/sched.h               |   2 +
 14 files changed, 864 insertions(+), 14 deletions(-)

-- 
2.25.1


