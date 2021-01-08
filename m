Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3A2EED74
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 07:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63207.112249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxlI1-0003tm-LN; Fri, 08 Jan 2021 06:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63207.112249; Fri, 08 Jan 2021 06:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxlI1-0003tN-Hr; Fri, 08 Jan 2021 06:30:25 +0000
Received: by outflank-mailman (input) for mailman id 63207;
 Fri, 08 Jan 2021 06:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eC+b=GL=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kxlI0-0003tI-22
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 06:30:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a597f81-f4ad-48cb-900d-7128f231034d;
 Fri, 08 Jan 2021 06:30:22 +0000 (UTC)
Received: from AS8PR04CA0151.eurprd04.prod.outlook.com (2603:10a6:20b:331::6)
 by AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:30:19 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::da) by AS8PR04CA0151.outlook.office365.com
 (2603:10a6:20b:331::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:30:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:30:19 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Fri, 08 Jan 2021 06:30:19 +0000
Received: from c59a702a5285.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6417CAB8-A1A3-4BF4-ACB9-9221797BB9BB.1; 
 Fri, 08 Jan 2021 06:30:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c59a702a5285.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jan 2021 06:30:14 +0000
Received: from AS8PR04CA0218.eurprd04.prod.outlook.com (2603:10a6:20b:2f2::13)
 by DB9PR08MB6331.eurprd08.prod.outlook.com (2603:10a6:10:251::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:30:13 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::d3) by AS8PR04CA0218.outlook.office365.com
 (2603:10a6:20b:2f2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:30:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:30:12 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 8 Jan 2021
 06:30:02 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Fri, 8 Jan 2021 06:30:00 +0000
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
X-Inumbo-ID: 6a597f81-f4ad-48cb-900d-7128f231034d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1kznTpSO0ImK3gQ075WEn8T69BRrdKA5SL5H2MCV6A=;
 b=lY1rsWBpjEl/SDJpuqsErSHeFRJgqpq6Zd/cDC6ObX/FowNe7gLt0TA7hEtko42KEmvAcZAbsE43K6K9+eMRzq8C1b2fNH4EuI2Ard+MVTVXHjR7t6Eul3mCIXBoGKV988JSIckF1+HUNpRODfWlrElRSGftwZkXGUq50U2wTR0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d28614676ba5fb7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiifW5Ns4j0Icyl2b66nMz/uMZgtyraDdLAaw0HK9cla+nzOSkksWNlMfj0xmC6XIkBo0Xiha2yeVtA0ooMMr7hQXRHiYnphzMcCnMT06npEp7CMqERWZj1a3j/tjZ8NMzzNpoQZJXYGsxM2m1zW7Cd6rKwTFC0x60GV3YjSrUTz2Xito0Y1U6LRVIXUSaa2E7hDSGJnswLvd/uNjqvfCVt8eTPgHT7s6SPXfoeGeFOjQ43GBA3jN7vCfgK+puMO0UOimsLwG9ZwjyJYKj1XOOO/cWFDZnPac6s00f7oJpC/FgBsbVuqmTZys97gVFqgXVuy5CS1e+7tqkInnrSWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1kznTpSO0ImK3gQ075WEn8T69BRrdKA5SL5H2MCV6A=;
 b=I2MeU6FmqeWXllZjzzJr8hCVpqwMMum0cnKINbaQfPUr7jpxT0hQrefPKQKzA+lumXRpcYIjFl4SO+sbhtGxzHOIFQyPPf8ExS46WPpPmC/HipELLjz45Mt66vIYjKq+FEsKHpAds/e5u6V3u386Yy5LDcD/5GnQQxmejon1tM7IWxZeWAOxaXUCY+xRshCakWLJCw083EjMp4HqFoGD3wiLCDwT7WVTwjOzFcTT1tDunLb90gM4TuHJB6JuzwitLQWgBPDhIFsl9H5hdYzvCkEMKsm1uw4EYc0+mJ3tWubILTqhlrp00qnum4HsWll0FQcqLj6mxH4Qe85KAK/i+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1kznTpSO0ImK3gQ075WEn8T69BRrdKA5SL5H2MCV6A=;
 b=lY1rsWBpjEl/SDJpuqsErSHeFRJgqpq6Zd/cDC6ObX/FowNe7gLt0TA7hEtko42KEmvAcZAbsE43K6K9+eMRzq8C1b2fNH4EuI2Ard+MVTVXHjR7t6Eul3mCIXBoGKV988JSIckF1+HUNpRODfWlrElRSGftwZkXGUq50U2wTR0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Jiamei.Xie@arm.com>,
	<nd@arm.com>
Subject: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
Date: Fri, 8 Jan 2021 14:29:53 +0800
Message-ID: <20210108062953.2335932-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24a770b4-8a4f-41f1-d1e8-08d8b39edecd
X-MS-TrafficTypeDiagnostic: DB9PR08MB6331:|AM0PR08MB3987:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3987F178A1D5E4AABDD01D069EAE0@AM0PR08MB3987.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 niW4UJRmMyarIW+3oiswZvl0gj/StBPE9G/nGMKgcSmpNZcEMmuFzvTdJJhxpPekHi6KaqPccJ95Cy2Vrufkbzu/AdVnpIxM/PZa3Wxs7jyZWvbsa3a2DYcck+y//4q5kVZbwp7j+8Ad75Ygq45ThM+cLfOJrHRTZK3bVKDJ4fXIqm+Qg/VowkzdKFSU/xqAQcF3iMEoL9l54KgScK3j3C17T3NYesEJaLwsX/AMQbQPbsZCBc38FYy2a2DsgQxKcUilBsjSVzLNwy+y3Orr8ZI0U5ShTofA//XWLqcgzpT1JE3u3LC2qs25scdW5Z8VmSH3dakDHBrd/0i3Un01cmqPVWEI+j9RIaUZF+na/76J6hIWGwsnlR23X7NMk9CJH3y3nyet+qBejiLl92R3O2+UhPGUrN4IL6UFtmUsic6dj78c2ABh2bqggBbmDC/CF6Q+uv64orWFHwdt3aE2MH+E12QWCtXuWVWjkMONjS+J4teBXZRjjYa3QT5swc+s
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(8676002)(6666004)(2616005)(86362001)(7696005)(26005)(44832011)(70206006)(478600001)(70586007)(82740400003)(34020700004)(336012)(316002)(8936002)(82310400003)(54906003)(81166007)(4326008)(36756003)(110136005)(426003)(1076003)(2906002)(47076005)(356005)(5660300002)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6331
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bc70169-87a8-416d-ba0b-08d8b39eda7b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FuOuzeNkqzuRjn7fpAF5Lvufy3mexN2wTE4NgMzT8YU+XQh6mXtkwQkMraGdUVCr79UgXAw22JL3ClEpWQl+dNtvOsWiXfMzLz0/n0ea497sWYaC9ROIAScS4/uCiFENLLS214Nz384WLDytQIozsJ3da+qdm5/iqgUSADVcG/9GSSJMKnEMvF4N+uCG4zAQZC2WDnVLQ5hdnJz25A0IWmlovESrAJuwN7Tt7R6c4P/8zQZGaOQr6xlzjXqNs8++zl9TxSKwaDTAN6NZHAf8q3Pv2pe5M8vVurTnvcZntDBl7mcjM2jrl4g5zD26/ZTNDUXqEb7IkGpvVvEuNdNjdYVqTHg1IVq0mn08SfRxNPVhmaQp2xXByN/A6OrRuTUPVN5xNlh1E7MPpolRYrpni4WLWJicxxjfXC8I5VoZd8iYNZE9qrK38koffqcnoltYxu5QJ0RufVu6JVfG2M+Fds6V+lcv/I7JYOncE3MIMXxWfCQl12pXccz9L7DhWarH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(7696005)(36756003)(186003)(8676002)(5660300002)(82310400003)(81166007)(316002)(82740400003)(70586007)(8936002)(2906002)(54906003)(4326008)(44832011)(478600001)(6666004)(110136005)(1076003)(426003)(70206006)(34020700004)(86362001)(2616005)(26005)(336012)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:30:19.6560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a770b4-8a4f-41f1-d1e8-08d8b39edecd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3987

Currently, Xen is using UINT32 for MPIDR mask to retrieve
affinity[0,1,2,3] values for MPIDR_EL1 register. The value
of MPIDR_EL1 is 64-bit unsigned long. The 32-bit unsinged
integer will do unsigned extend while doing some operations
with 64-bit unsigned integer. This can lead to unexpected
result in some use cases.

For example, in gicv3_send_sgi_list of GICv3 driver:
uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;

When MPIDR_AFF0_MASK is 0xFFU, compiler output:
    f7c: 92785c16 and x22, x0, #0xffffff00
When MPIDR_AFF0_MASK is 0xFFUL, compiler output:
    f88: 9278dc75 and x21, x3, #0xffffffffffffff00

If cpu_logical_map(cpu) = 0x100000000UL and MPIDR_AFF0_MASK is
0xFFU, the cluster_id returns 0. But the expected value should
be 0x100000000.

So, in this patch, we force aarch64 to use unsigned long
as MPIDR mask to avoid such unexpected results.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Remove inaccurate descriptions
2. Update example description
 
---
 xen/include/asm-arm/processor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
index 87c8136022..5c1768cdec 100644
--- a/xen/include/asm-arm/processor.h
+++ b/xen/include/asm-arm/processor.h
@@ -75,11 +75,11 @@

 /* MPIDR Multiprocessor Affinity Register */
 #define _MPIDR_UP           (30)
-#define MPIDR_UP            (_AC(1,U) << _MPIDR_UP)
+#define MPIDR_UP            (_AC(1,UL) << _MPIDR_UP)
 #define _MPIDR_SMP          (31)
-#define MPIDR_SMP           (_AC(1,U) << _MPIDR_SMP)
+#define MPIDR_SMP           (_AC(1,UL) << _MPIDR_SMP)
 #define MPIDR_AFF0_SHIFT    (0)
-#define MPIDR_AFF0_MASK     (_AC(0xff,U) << MPIDR_AFF0_SHIFT)
+#define MPIDR_AFF0_MASK     (_AC(0xff,UL) << MPIDR_AFF0_SHIFT)
 #ifdef CONFIG_ARM_64
 #define MPIDR_HWID_MASK     _AC(0xff00ffffff,UL)
 #else
--
2.25.1


