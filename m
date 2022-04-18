Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D071A5050A7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307208.522545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQb-0005Tg-Bo; Mon, 18 Apr 2022 12:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307208.522545; Mon, 18 Apr 2022 12:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQb-0005Ru-7P; Mon, 18 Apr 2022 12:24:25 +0000
Received: by outflank-mailman (input) for mailman id 307208;
 Mon, 18 Apr 2022 12:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQQZ-0002c3-49
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:24:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7278a62d-bf12-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 14:24:18 +0200 (CEST)
Received: from AS8PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:20b:451::31)
 by AM0PR08MB3634.eurprd08.prod.outlook.com (2603:10a6:208:d6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:24:06 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::85) by AS8PR07CA0002.outlook.office365.com
 (2603:10a6:20b:451::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.12 via Frontend
 Transport; Mon, 18 Apr 2022 12:24:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:24:05 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 18 Apr 2022 12:24:05 +0000
Received: from e4e3ea6435ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40C510F7-811A-4D4C-AD76-32739D5FC527.1; 
 Mon, 18 Apr 2022 12:23:59 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4e3ea6435ab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:59 +0000
Received: from AS8P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::28)
 by DB9PR08MB6633.eurprd08.prod.outlook.com (2603:10a6:10:23d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:58 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::44) by AS8P251CA0013.outlook.office365.com
 (2603:10a6:20b:2f2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:57 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 18
 Apr 2022 12:23:54 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:47 +0000
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
X-Inumbo-ID: 7278a62d-bf12-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpppyH+TZRPMImSMb65msgwXr8BDg+yB7jYmPGh/pdI=;
 b=1rVz0EKHXAFIUCMUxXT1dInfz/BwBq7Pd3RkzgzBbbwbsiuPsNoU/jkciSX6HtOVis1yw4FtaZBN3Er7SBFCKOD9NMg+Pp+AfelIIZOcEeVvmHFBjHg3Q2FfUHEip+cYYODwN6n/BxjVNV85KXQOADN0+9wO5ehWXNduW7irHbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b244345b88eeedf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjWGpL5fQ0fNuvmUduLTGOrJxUMWmvOIMyZZy1wlYP8OrlWOV6Yt6/gBJIhU/MX70DgMQ1/3xmPtYm4gJ+P5KQ5apLARF8LngJvcLcCeN5PgPZ/oH89PWzQOhg6gFA401sIZBL4qhdZJItIwu2xIf3phXQWPOgPHWJU+8SmBxXmDmD0h+Cn2Ine2kVdWeiC1+hLEkEN/vO7ekdsRDkGX0pin14/g9C1EUdUr++BwK2E3xQe2YuZeoGgoyvB8v7n4XMXAIDdkkbSx6lukz1J/S6S9nnAWLQTQ6uMSM9qRQ+vmE7pMWrEYLbqXkgm2xnBA+rv8KhBidZljIrD9b3vl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpppyH+TZRPMImSMb65msgwXr8BDg+yB7jYmPGh/pdI=;
 b=PqpgCseApIDd0YTSoWNfojInYWQspPzDvckhhD0cBJq05WhFoKJDkvSOizkyfEQURo5tJ96/nzHd+V6t2Pcp0QEcJvMq2g1+TuJIQGDRxhuDDF2hfcZOBq8P+yzH93M/vYD2g3QO0QqHcTsRvCFkkEntpwRyW5R4c777NwRQTK80+acENv2hZnrI3AjzgizPJhU54XiEXC2rkgHyg6PHmSH72CBF98L8Ve1AkKGSpxvidms2LKxmXblGowYNgfINKobncMP5PTWaSwypNvCyZ3eTlI7N4dQG4OWPdwGw9f+OpNjk1Tb/JKkG9gOXKqGI2gfSm6jzi2xOVScOUn9lAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpppyH+TZRPMImSMb65msgwXr8BDg+yB7jYmPGh/pdI=;
 b=1rVz0EKHXAFIUCMUxXT1dInfz/BwBq7Pd3RkzgzBbbwbsiuPsNoU/jkciSX6HtOVis1yw4FtaZBN3Er7SBFCKOD9NMg+Pp+AfelIIZOcEeVvmHFBjHg3Q2FfUHEip+cYYODwN6n/BxjVNV85KXQOADN0+9wO5ehWXNduW7irHbc=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v2 6/6] xen/arm: retrieve reserved pages on populate_physmap
Date: Mon, 18 Apr 2022 20:22:51 +0800
Message-ID: <20220418122251.3583049-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 350dfaa3-c7ac-4f11-8f93-08da213654cc
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB6633:EE_|VE1EUR03FT025:EE_|AM0PR08MB3634:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB36346B6D14CB4350E0653F05F7F39@AM0PR08MB3634.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yZHreejEepp+S4felBM7EMQVtmCTlQr34VytMaysREGzNcXtiJd60MIlPCOeT2jlKvNsFUAQH72n1Fd4dbYHJz3Q6QtZdWB+oZIPIn02pu07gqqHP9UZz9M4OrmBajdJ51B6YLZKPQtkJUeLO0Z6ien6Q4dRDoe5I35fqwYYts6QfNglv7kAbIYcHEgZjoJG0zh3BsLE1vJF/QwqfN/b+Oje4vBU42HrFdmNAoHFPE3/Hc9+fa3zwz3VBfS0uVBMVETMVlQhY1Ky7jOGW8X8+6Rhu+aUVWRjyFfsa6YhvVDBdR4tTymbiJufRz34LiuUqXXWC9PtSPcV9DAWwNDtC/sQJFZxDwebqgxsVt7b2cMaf5DVWxAu0QIDUuwlh/UEyZwiO5XINXkllbg4roN9ZF693vnjNlQp1RJqWUz+lgzE+xBYauv7X5MziDJTsN8Njva9Xe6TNbpizCyGUFDtsbxNgIh+CPxvB7CivXPnNV4nStUCmlNiHivsq6Io7csEjLfcQXPUE9wry7I3b69YZ9s/VYmS849ruLsrm9iXyynSrp+UyEhGTSibByghJSh5So89THrM33mTslbuEDi8EhYQC7HX5hJ1XGDcAjj3oE1A2D9E/igWqfvVsc887R/mCFfGitC5xojJGchhq/dOIHhpxsrTYTolpUsXsHnDmqOmYEuIlzRLiuD8YcswdcjjViq2KygZzlVv4ckgz2HAiA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(426003)(5660300002)(47076005)(6666004)(86362001)(83380400001)(6916009)(54906003)(70586007)(336012)(70206006)(316002)(26005)(186003)(356005)(36860700001)(40460700003)(2616005)(1076003)(4326008)(8676002)(81166007)(508600001)(8936002)(36756003)(7696005)(2906002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6633
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08f7a41c-bed6-4869-df99-08da21364fa3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bk898ASg9yrzEoDJJ0v4wdiLXfu0dpP2bD5/GwdDMDyFHTLRuUVjJvySydwjdeMxDXhBoqQWpFm6HgAD6Bd6+VAwVlrIH6dknNrWDHFdxg/iVHZ2Ll3HMv8zIHgFvBDpHnEAYOrwxfDYQYxdM5DlqeTBYR2TIWrX9Hh6G3wjxcnLgjyJwPnd4+nuA6Fh0E2ZL+Z67KVizuO+5lfKfH6AZ/uPbQXUyyCaQJWRTj/EppVpfhyIgE9qSf7q5eZTkpvtoPipw4/6g4gjubdZOCWlA4BNsRV5j41WoqQCyH4JuaprWtFgqoAhSiFUjIjoTOhl8lYUOFOcbTBZakFYItdVbWysFkwGya6S9nXI7bKteGHn71jWW99oQQYlOheFH5aC8zF66s7d47F4BwK3yfB5K46E67Vz4lNevn5hRYiWgoNrDHnOVpQ4X4zRQdyilcizUU0sdCK3rNn5zmO8KPLRzSHMhFbPL+6IMHe2G3ykqcWOH/Z6Tlmi8TeZ+U+FFM/w/e9Z6kGCSUUs5HnJt15ksOF3GsTeqhj5IvySx6kV0kje9GkzpnFtx/wgSwahTb/RXKYWm0VgjxnqZW0ubEkgOEg142admvH5T+0ONQFnOSVosPkyniKTaQeZN4HvVIGC1FGNksPoB2UEtWkW3lZvu2qAmeqjiUlA3QSflpOzVCHj6h2+GwJSDRZD9UEKf9h6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(36860700001)(81166007)(4326008)(8676002)(8936002)(498600001)(54906003)(70206006)(5660300002)(70586007)(336012)(426003)(26005)(86362001)(186003)(36756003)(83380400001)(2616005)(40460700003)(47076005)(7696005)(2906002)(6916009)(6666004)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:24:05.9951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 350dfaa3-c7ac-4f11-8f93-08da213654cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634

When static domain populates memory through populate_physmap on runtime,
other than allocating from heap, it shall retrieve reserved pages from
resv_page_list to make sure that guest RAM is still restricted in statically
configured memory regions. And this commit introduces a new helper
acquire_reserved_page to make it work.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- introduce acquire_reserved_page to retrieve reserved pages from
resv_page_list
- forbid non-zero-order requests in populate_physmap
- let is_domain_static return ((void)(d), false) on x86
---
 xen/common/memory.c     | 29 +++++++++++++++++++++++++++++
 xen/common/page_alloc.c | 28 ++++++++++++++++++++++++++++
 xen/include/xen/mm.h    |  1 +
 3 files changed, 58 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 69b0cd1e50..f7729dfa5c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -35,6 +35,10 @@
 #include <asm/guest.h>
 #endif
 
+#ifndef is_domain_static
+#define is_domain_static(d) ((void)(d), false)
+#endif
+
 struct memop_args {
     /* INPUT */
     struct domain *domain;     /* Domain to be affected. */
@@ -245,6 +249,31 @@ static void populate_physmap(struct memop_args *a)
 
                 mfn = _mfn(gpfn);
             }
+#ifdef CONFIG_STATIC_MEMORY
+            else if ( is_domain_static(d) )
+            {
+                /*
+                 * No easy way to guarantee the retreived pages are contiguous,
+                 * so forbid non-zero-order requests here.
+                 */
+                if ( a->extent_order != 0 )
+                {
+                    gdprintk(XENLOG_INFO,
+                             "Could not allocate non-zero-order pages for static %pd.\n.",
+                             d);
+                    goto out;
+                }
+
+                mfn = acquire_reserved_page(d, a->memflags);
+                if ( mfn_eq(mfn, INVALID_MFN) )
+                {
+                    gdprintk(XENLOG_INFO,
+                             "%pd: failed to retrieve a reserved page.\n.",
+                             d);
+                    goto out;
+                }
+            }
+#endif
             else
             {
                 page = alloc_domheap_pages(d, a->extent_order, a->memflags);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 8ba38bca9a..759d612eb8 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2770,6 +2770,34 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 
     return 0;
 }
+
+/*
+ * Acquire a page from reserved page list(resv_page_list), when populating
+ * memory for static domain on runtime.
+ */
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
+{
+    struct page_info *page;
+    mfn_t smfn;
+
+    /* Acquire a page from reserved page list(resv_page_list). */
+    page = page_list_remove_head(&d->resv_page_list);
+    if ( unlikely(!page) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire a reserved page %"PRI_mfn".\n",
+               d, mfn_x(page_to_mfn(page)));
+        return INVALID_MFN;
+    }
+    d->resv_pages--;
+
+    smfn = page_to_mfn(page);
+
+    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )
+        return INVALID_MFN;
+
+    return smfn;
+}
 #endif
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3be754da92..6ef5a6adcd 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -91,6 +91,7 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 #endif
 
 /* Map machine page range in Xen virtual address space. */
-- 
2.25.1


