Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE453E8E86
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165617.302658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQ1-00019w-Ff; Wed, 11 Aug 2021 10:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165617.302658; Wed, 11 Aug 2021 10:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQ1-000169-BU; Wed, 11 Aug 2021 10:25:05 +0000
Received: by outflank-mailman (input) for mailman id 165617;
 Wed, 11 Aug 2021 10:25:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlPz-0000BQ-BL
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0edcda4c-df00-4efd-91ba-a593fcf1007b;
 Wed, 11 Aug 2021 10:24:58 +0000 (UTC)
Received: from DB6PR0802CA0043.eurprd08.prod.outlook.com (2603:10a6:4:a3::29)
 by AM0PR08MB3299.eurprd08.prod.outlook.com (2603:10a6:208:60::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:24:55 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::4c) by DB6PR0802CA0043.outlook.office365.com
 (2603:10a6:4:a3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:55 +0000
Received: ("Tessian outbound d9f41274f41a:v101");
 Wed, 11 Aug 2021 10:24:55 +0000
Received: from 6eaccd0753e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F39B0819-696B-4335-B644-51F7C8F87498.1; 
 Wed, 11 Aug 2021 10:24:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6eaccd0753e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:44 +0000
Received: from AM7PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:110::18)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:24:42 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::2d) by AM7PR04CA0008.outlook.office365.com
 (2603:10a6:20b:110::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:24:42 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:39 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:37 +0000
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
X-Inumbo-ID: 0edcda4c-df00-4efd-91ba-a593fcf1007b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSDZcA/RWL9vV9pltePO7Er9bgZ7P1bFBHq5K5ZpEXI=;
 b=4erjMjor/BUxHHBYly3vqOSvB/xsHA42KzIW7zlTecXKQzeGj2uTlHaJ74x6+wC0iTebQafkfn7vC01kLM2dqlO1fOPdLJtzfxD99n/xFqqMh8jCGmIq6qQ6AJAzL1u8hhhf7ipPQXopZlMXq7nhNfKrOx0NcVuNcdT8BnbN48k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03faa8a320c1bcbc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+SEo2BeALNU/DnHnteFsidG4HambSxoZzxEs0OHRg2sKqI1xHkJ5f5OypcV54cbcDUWngZC5onVM+oSLBA2l1fYMnGo6JHJR7edozVHF0ez4jfxtEYIzHMx/n5dxtdaflW5aOsE3E0KvRJ4UmloUP7+D+tr/TaPvZtxGij/qDyAQTxDdFkIehgYwtFHsxgbjJwoTP5Vregdrk2fHzWXNK8KGiKFW8ImeuD4R1Z7tNv73eSOad+hTCCGMiK6dogBaFXIkvY5d0Gp9LJRKP37J4aQmMy0qiwkXflzYjq6UuCHTeSgpkzK0NgLqkkAthYwY+HODK2qqWVHvTiDlYSffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSDZcA/RWL9vV9pltePO7Er9bgZ7P1bFBHq5K5ZpEXI=;
 b=ZEHZ3toKix3CIpK2RPqM8uDzvifc2a5Xipl70B4bVPF2y59A238cjh9jRutNiTumRtBRq8xrTTe/S2Yae0O22K5lEl5WkGGTM41AyOtMKsznSHG0a3q9uE7pV6zdmdnWPGYTxP88/b2nZt/IKLwS7fOEbOR6QmBC44KJaMIPbWCobPBRQcz6f9SVX4hCtS3fAOnWB2J1cvYWEpYZMkBW0JyJiv4x1/hwCstJSJZ/z9r9fPGqdO0nXvZf0EKruZgPbgPl8aIKuC+aYW6YsZegI9V3S/UBzbT9tugpsSz7OSoWvp/+sxOY8QPtkO5Pap4AwUEe/tw3gtYsxqmqiFJtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSDZcA/RWL9vV9pltePO7Er9bgZ7P1bFBHq5K5ZpEXI=;
 b=4erjMjor/BUxHHBYly3vqOSvB/xsHA42KzIW7zlTecXKQzeGj2uTlHaJ74x6+wC0iTebQafkfn7vC01kLM2dqlO1fOPdLJtzfxD99n/xFqqMh8jCGmIq6qQ6AJAzL1u8hhhf7ipPQXopZlMXq7nhNfKrOx0NcVuNcdT8BnbN48k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 03/40] xen/x86: Initialize memnodemapsize while faking NUMA node
Date: Wed, 11 Aug 2021 18:23:46 +0800
Message-ID: <20210811102423.28908-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 464a32c3-251d-4f5d-da98-08d95cb24397
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:|AM0PR08MB3299:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB32992DAAC48BD1264FB1D5C89EF89@AM0PR08MB3299.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z6bfNvc+NOU7Yt9Zv21nC1BoveRrI5bHcVyU5hbPXMVDDZINrjwkNkrzqu7fPpjAmblBF2JQF7Vi8rzEAKrXZ5SMnjze9xkss7kbgtfYYGcRqD7F0DcMrFoluHdgnyaRurynzQPGPvPMpHckOnTSUHuGcgthj1WMMYX6mjM6gizXtBMjzl7in+ZUtTLFtcDYi0/9s1rexMUIKDqcEtFg6mEmi6u/ngVnjsh8Cqh/JXgrWAreXK5RlWwiM6tc2LZZVyb9AJkVD3qdAbNL4aU5OvrmEE3CK8xWulLX/o5oIr/RaOV42YqbUoLpB+9E0c3+OF5v5LuJGAe6yL88UGbQVx9aiHj0DbQyDpFOl7M9n1EmH6rl8/Z2mm690CLTegYYoFv8sMnK3JJifKOE5mbehHYOKtv2tKY0wTkMSDjdiRJj+ylXKfTfHjxywhtMW55fAgzC4r2sby/Xxd6ydEe2zWUsbbDYZT8eTHOF3AlHfldfrCmtgyKHLXCU6b53pkkhrQXzlKxmMuW5l1LZzQ3aMh/U49qjRdhuis/V6Nh73lmjwSi3mJzxHrvk9JQdEBgvp0boCkBDyUE3qw0QOFDPfUw1vXUnw24OqEekl9i3HtazM91Us4x8Tndk8v/qvqaowRTwQUqPrLFyfH2jE7niH3Xl8eyG2LOtpceU4GSSU/Gd0yio0+E782P1YbNdASUjhH6n/FpWVhxkJvKzwwzOKvAPjYvcNJM5g3seVBvnyuWrlOCgoZ4UEd9z5vYgNBYH7Z0mPz/6g+GKr/K/1/4bZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(46966006)(36840700001)(2616005)(34070700002)(26005)(478600001)(5660300002)(82310400003)(6666004)(4326008)(82740400003)(7696005)(44832011)(336012)(426003)(186003)(83380400001)(356005)(36860700001)(8676002)(36756003)(110136005)(1076003)(70206006)(8936002)(70586007)(81166007)(316002)(2906002)(86362001)(47076005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c0bdac3-9b18-4c23-53ba-08d95cb23bc4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XTxSV2sNVXR0xHfhMgxscMI/wkR22brdxGlzGGNx/Jrt4q24sx4ES4gEbWZfLOpixb3K8JBcI9l6bOIBg4H4cQwGHoUFf1ihTTdlGXpcETVwoCLPus10CwHdSv+JkD75oqUyRC4gmLgQIlNYE4MFpnK5p7mtKXa74JGgvlUYhix/z8uqU+5DAGno7jaLHs6LhP48Q0qTYldLJYFUAJwb2kQEBmfvXTkDYSmItDMJ13+1yQhDnJhrSsvSZ4v35PPpw+UIL2aU3ABLJErwSIeejo7KWLcU8K8xmYkPuQyPKoCWu22Ugt7I0QyHfhrn8Aq8pT1jm1EOTq7VzuouvJTTK73T5vCvaiSXjOkR8YEGTS0P7dBiZgY0zW7Chosx7DSlWOEXPNtNq259a+u6qDp4dm3rVldu7DPU90v+9CSqg72Jmcx7hPLI/jf+Itl5cUX7IJGtHffKhOXf0ThOsO+v7qsVQY/646qHWJuA9a9GXcAIQM+3Tdx7fPZlXOscioHCzd0o7JG38XeY6ny7QWkw5ci9rS3w2DjzaM+FuWBNJYLikwRPacaKscX3vfekgFiPCQjntJcO/EeWwabOp79Z7n+iR4Q6MCiW7BcuoO2Jjur5ZZ4O1MWBNua9jtQ863EZVaGCGFnSieAwSiIpUQbxUi5G75TluW19uwWf7APSct4F29l8PFJTWEMGCEEXaUJjB1JYW4mTUAD5YB9aqjeiIg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(36840700001)(46966006)(2906002)(110136005)(316002)(336012)(426003)(81166007)(26005)(186003)(8936002)(83380400001)(8676002)(1076003)(478600001)(70586007)(44832011)(86362001)(6666004)(82310400003)(5660300002)(82740400003)(4326008)(2616005)(7696005)(47076005)(36860700001)(36756003)(70206006)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:24:55.7525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 464a32c3-251d-4f5d-da98-08d95cb24397
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3299

When system turns NUMA off or system lacks of NUMA support,
Xen will fake a NUMA node to make system works as a single
node NUMA system.

In this case the memory node map doesn't need to be allocated
from boot pages. But we should set the memnodemapsize to the
array size of _memnodemap. Xen hadn't done it, and Xen should
assert in phys_to_nid. But because x86 was using an empty
macro "VIRTUAL_BUG_ON" to replace ASSERT, this bug will not
be triggered.

In this patch, we set memnodemapsize to ARRAY_SIZE(_memnodemap)
to fix it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index f1066c59c7..d23f4f7919 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -270,6 +270,8 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
+    memnodemapsize = ARRAY_SIZE(_memnodemap);
+
     nodes_clear(node_online_map);
     node_set_online(0);
     for ( i = 0; i < nr_cpu_ids; i++ )
-- 
2.25.1


