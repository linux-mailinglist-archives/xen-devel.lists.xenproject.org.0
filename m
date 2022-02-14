Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9C4B4036
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271076.465478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRve-00014U-L1; Mon, 14 Feb 2022 03:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271076.465478; Mon, 14 Feb 2022 03:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRve-0000sr-4j; Mon, 14 Feb 2022 03:21:30 +0000
Received: by outflank-mailman (input) for mailman id 271076;
 Mon, 14 Feb 2022 03:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvb-0007B4-U8
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 318beeb5-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:27 +0100 (CET)
Received: from AM6PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:92::40)
 by VI1PR08MB3022.eurprd08.prod.outlook.com (2603:10a6:803:41::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:16 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::98) by AM6PR04CA0027.outlook.office365.com
 (2603:10a6:20b:92::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:15 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Mon, 14 Feb 2022 03:21:15 +0000
Received: from 2f95158a49a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83B4BB29-FEA0-4D64-A62A-0878618A94C8.1; 
 Mon, 14 Feb 2022 03:21:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2f95158a49a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:09 +0000
Received: from AS8PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:20b:331::31)
 by VI1PR08MB4590.eurprd08.prod.outlook.com (2603:10a6:803:c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 03:21:06 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::c4) by AS8PR04CA0176.outlook.office365.com
 (2603:10a6:20b:331::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:06 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:10 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:08 +0000
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
X-Inumbo-ID: 318beeb5-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA3/zFgsd8czwwlA2vS7TK6OY5eYCgsFdWBPbAyOYuI=;
 b=wfYRLJrq67BbINzObSsLLYvF68MlhQQ0sUbSTmyoy5KmgAiHcgd3LuS0yMJ+fBt+X5MXHhD0ut3m6wsQAl0ErYAPnJc8WuT89ZeDQPXhcwzU7M0QHkjzCPm7NauEDdeoxq0CcYp6rNYsumGqZG47wGMegirzz8xdC2ZicEpfHDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef95869d07175b08
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFTH8IxnJjqD2STISE2u8vrCQftScDLU7DiSLIZEh1FIZsS8V1aEfcBZHZMKYWZiGiO29esc4+9E2UMUjgxKFb0SzsHYPC9JRu0Y1zjzqtbrmJXa6uTaq2HygZ2D7Xp6WirzZ7Y9iOVK/kYjYGM1u8ra0N9I0fat6PlgCj5le/oLJ+PdmSWgl3TnIcWuceRMLi39J6Z5gZdb8l5LwtLBF0SFCDqO9hRmXyqgfamyKMdmqoA4PGZO5aPSjlq2tkMyoi6duzL5OPp/+lC3L00jQjxqrovrxuI4PfR5z1raJUFmbyIrQzF13hPvsjD+eucXTI/o+Hrf/uk/UXBbgG4o4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA3/zFgsd8czwwlA2vS7TK6OY5eYCgsFdWBPbAyOYuI=;
 b=aE/mVwJIl9qy/cY/okStLtDn5n8qXatoEneArWOpVPIrfce0VzJ156xJnMNVc1iwQJwvYAhVPg+67Vaf/idYdQ2Y9dZtprgDOAURFPRTAIgfj+reNWGEYDwVY0UH98GmVeCX6gfJysr6nYjIkDRzxHFIAu+SncembhMDQFn0Co3UMmKDxkV7S5QHiHNc6O5PUevH0L40Do5NZ4VAbxkgOcyE4orUzHsKUZpToHTrpeKihUsrkbrNPpbJruL6tZEhytsh0RX73Aaa8WcQoQCnhlgspIe9bhJ6OFoj6qigpCfg9ZMjkANgLqzbPF8qwPPrZO343JiqY6xwrnPHvgWjAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA3/zFgsd8czwwlA2vS7TK6OY5eYCgsFdWBPbAyOYuI=;
 b=wfYRLJrq67BbINzObSsLLYvF68MlhQQ0sUbSTmyoy5KmgAiHcgd3LuS0yMJ+fBt+X5MXHhD0ut3m6wsQAl0ErYAPnJc8WuT89ZeDQPXhcwzU7M0QHkjzCPm7NauEDdeoxq0CcYp6rNYsumGqZG47wGMegirzz8xdC2ZicEpfHDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 06/11] xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
Date: Mon, 14 Feb 2022 03:19:51 +0000
Message-ID: <20220214031956.3726764-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 8cf46b9c-100a-49a9-cc37-08d9ef690f6a
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4590:EE_|VE1EUR03FT027:EE_|VI1PR08MB3022:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3022D78899480CAB7B9B6585F7339@VI1PR08MB3022.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:326;OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8/Yuw2l6JSKob5EkCWsq+HxIVYNw2YnDp2eJm/iwL39VAAHnejz5zd1D9eQQy1BSmghWjlJurkO//SbTNabMeqo8Cmymwn04yeJj3JQ8jg5+vNCtHwH98icEr/OArXDyHOeBD03v+2b56r9p/cKw5qjtk0yRVlbawIVTHmKOvNU+/uVMsKFje3oo6UX0egvtDyMC/zwj9fCbubrQESsx0EPJSlMyOdox+zb21AhfJ1578yWPG37tMBhvZr/Y5gbd6wxdRRRm2wq6S1AYYdkERZtw0n1k2h+OVY108kHuWym0eiYzbYhZKjYjHgTmIlBarYwPejUwHCOnuKjDpw/RUJsdN4r6lWyDcFBFR7HpUQUXKpvBFkmZfeAE6S3yn/JVudpjJG5vHtlUusNKeLueIKQLn8XuKvZbeuDidfhqoxqN2d9+pPceXCE5as6Z7Fi/AZdZ2YRV6VhWSznuXm/EnLTB1nRZW8XVdKz3LcXU/Lfzm5RQhbjkrlW2uxNp+iSKzfiZIu4yseNDRYmxJJuWbTTtehfrr7EPHC3ZbGeq9P4pC+N31Vs0quKBuUyMoi1fm+sHhciGzwjdmN/tfawgT2kKSeqEq0+/qj6jbUP5TJjdZ4EBBWk6IDFGlo+kFvujTqTZq2LckyJDy+/ZyCxuZhllNRVqT+g/a1UXWpHrQsQi2yg1SaZAveDJbnCztyi/
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(47076005)(508600001)(54906003)(1076003)(6666004)(110136005)(316002)(2616005)(36860700001)(426003)(336012)(70586007)(70206006)(356005)(36756003)(81166007)(8676002)(4326008)(186003)(7696005)(26005)(8936002)(5660300002)(4744005)(44832011)(86362001)(82310400004)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4590
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ce4d7a6-3342-4bb2-07c5-08d9ef6909a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wund4c2iZ4camLE9JUYfaubc9q/gyzSkyw7HC1ncB/4jcwaqF6OSLhGiNoQPqz5RlRHIHZtfMXYTEhGHN0wqsr99jm07PFU1w2NC5+UcGVTu0rJd8lAd+EwtZL76S7tZsHPStz6NEXhb5bk2r1W3ZXXz0n49LFN0+qfUGqAVrFJLncWNkfH8d7Fgrby2g08zbnli38G6czoUjV7OOX8ulVT8SwbPJjWicAOB4G6BSZ0xE/5CHik05LxSQO+inPxLYaGTfnVpZIm3fOekWy+z0zwt4KV39S/E/DVXKrBeAlHUUe0ZaPnDj++qeuuMtTbMUD5+1Lj6i+NqvcwkqEpPLLWUM8iF2Wuj4kr0vSp926bfcroOoX7jKyKDLl2jGe9F9zXITfpotYYI/wItb6CVLpmKXu8NmUSDD+zyc0H7MeIjvvlbOz19LYiMHeiYDH+bUFnnZkqeYO0KecngW3/UVyss5Yd+ffXd4i5pNqnzcHaefa/K/xLcq4d+ds5MG5tEdX4oAkcu0eIZKanS+T1ofUgl8ORtgmeC0anCAQxroctv3zRg2Q/r+YIc6b+vZiLvz+XS1tRm/tlX2c6RbWahaCI8zTPG+FZtkTk0TxkHvtAL4OMBcBeyPg5BC5hKipmK8Gk+1o57ZsK7MNhV1xKwVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(70586007)(70206006)(6666004)(36756003)(82310400004)(316002)(5660300002)(336012)(426003)(2616005)(4744005)(2906002)(44832011)(26005)(186003)(1076003)(86362001)(4326008)(8936002)(8676002)(7696005)(36860700001)(508600001)(47076005)(81166007)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:15.7804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf46b9c-100a-49a9-cc37-08d9ef690f6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3022

Helper allocate_static_memory is not meant to be reachable when built with
!CONFIG_STATIC_MEMORY, so this commit adds ASSERT_UNREACHABLE in it to catch
potential misuse.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 changes:
- new commit
---
v4 changes:
- nothing changed
---
v5 changes:
- nothing changed
---
v6 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ec29bd302c..52f256de9c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -755,6 +755,7 @@ static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
+    ASSERT_UNREACHABLE();
 }
 
 static void __init assign_static_memory_11(struct domain *d,
-- 
2.25.1


