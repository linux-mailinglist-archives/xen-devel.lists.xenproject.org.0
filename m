Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB8415DEB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193902.345502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNWG-0001TO-Du; Thu, 23 Sep 2021 12:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193902.345502; Thu, 23 Sep 2021 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNWG-0001PJ-9J; Thu, 23 Sep 2021 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 193902;
 Thu, 23 Sep 2021 12:08:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNUV-0006xV-S3
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6aa254d0-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:35 +0000 (UTC)
Received: from AS9PR06CA0215.eurprd06.prod.outlook.com (2603:10a6:20b:45e::22)
 by AM7PR08MB5512.eurprd08.prod.outlook.com (2603:10a6:20b:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:33 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::ee) by AS9PR06CA0215.outlook.office365.com
 (2603:10a6:20b:45e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Thu, 23 Sep 2021 12:04:31 +0000
Received: from 8bbf188dc31c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB224C83-4C73-46AF-AA37-8CA59E27886A.1; 
 Thu, 23 Sep 2021 12:04:13 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8bbf188dc31c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:13 +0000
Received: from AS9PR06CA0160.eurprd06.prod.outlook.com (2603:10a6:20b:45c::23)
 by AM6PR08MB3127.eurprd08.prod.outlook.com (2603:10a6:209:43::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:11 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::7b) by AS9PR06CA0160.outlook.office365.com
 (2603:10a6:20b:45c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:11 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:44 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:42 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:42 +0000
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
X-Inumbo-ID: 6aa254d0-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRu3DqWp6Kxy08JOeoeKkmzqLqGRX3WyhcKxeUsjENI=;
 b=f3+QNwG5gv8tBCRPDeU/ScmG2COmblcHwAtLsafJ+qPRKDWUjI3iRZlSF8venrqt5YhMk9nw1vh5gWbtZTDZvF0LKPdNsgDL2asdhEZXH51SNw3/uHH2v3Lcnk8mDDjxGt2eJ4X2S1Y8L2NX0HmTugCf7nnbp1FeMBf5ldyjA0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d27630bc127e496c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsWc91N7wotNCfQYJQSblyn5soI+l19yZcCcqtgbYNHZy7ujJeSUgm0ZKWXHpXafMB1Tu7xyUaduStWf3//FHKuMcZcV+5yaBvdnQJn1lj/a1yGdPF4KyuCXjk8RNI0yzJ5sCMbjmmwYwuT1MXubVwl7c3Xy/9Dbx+VW75/bCQcDe1MtMvRZ6bTFb96Bfy0HpKuzjbdqx/pHkcKVG2c/+NytDSbE531G8MvWhJBGMjm4B0PWXdyUEDjwkuFyjg99jd/kt8eb51dxJ1zT4CQeaXmVIPzVJwSTKL3zB/StCdxOSxdf8FqHA6XOlZqexMMBA8A2y/tYwXuVmRIlchGMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nRu3DqWp6Kxy08JOeoeKkmzqLqGRX3WyhcKxeUsjENI=;
 b=hPP2BO4ubKHJgr/aDkxkxUvexH59T69iEU+N03XeyeXoBtmkVCq1wAeemZS3cHgWy9jTcFy+Y2Z0jf4M3nmCSEPXYfd+aBBd6SJGgo3m/jWtjyCeCe6OclZZ03fkabyRkZ1+U0WnBS2adDVbNp8qX9jm3t2GLZh+fCrTFO1RRB98gXm4tvPCLan/l6o2gq3itGncsiYGGXHB/ZZyHFEHJV9tISvX8/at/cZ6HdJ2w11kHizz5hHMqrsBmaKrFs+jcf909ItK9E/nneneZPfYH9O4WjEm/g/Bxmj9quAMnksNnDUzK2fgxbwo/Zm7TjwrGS4tw6Zlog/dg7aiZfCG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRu3DqWp6Kxy08JOeoeKkmzqLqGRX3WyhcKxeUsjENI=;
 b=f3+QNwG5gv8tBCRPDeU/ScmG2COmblcHwAtLsafJ+qPRKDWUjI3iRZlSF8venrqt5YhMk9nw1vh5gWbtZTDZvF0LKPdNsgDL2asdhEZXH51SNw3/uHH2v3Lcnk8mDDjxGt2eJ4X2S1Y8L2NX0HmTugCf7nnbp1FeMBf5ldyjA0U=
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
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 16/37] xen/x86: export srat_bad to external
Date: Thu, 23 Sep 2021 20:02:15 +0800
Message-ID: <20210923120236.3692135-17-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b117b6a4-261e-42c5-cf10-08d97e8a4e22
X-MS-TrafficTypeDiagnostic: AM6PR08MB3127:|AM7PR08MB5512:
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB55128982062A610673F70C949EA39@AM7PR08MB5512.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tl4oJhYkJoAEc85m2rxUHeB/01EDB3APB/lLhCx2y3V6pcew5lf6k6356OL/dsQbcAY6G1cPn0NqyOplt2qfiXNaRSS6NijqHyguBuZU3pc8ydjdm8/AIBtAPt42lw3B5vSlWFXD0GO+Rif9yxDqhAiFT44oAiX1zbdOsfUlzymq9rYLKTAUAGUkwmtZdbSVcNgM3G28xLGOKceHXgewpEpahoTW07xM/CIMaI+3RyUJ0QKDucauw2uGnHXQHm701Jll9vJFQyX+qmgf0YpPoISGWEDqErOssi2hXlPqqjna2ks8bhK1HqPPL8ZNVPoCHWKGNCMqZVYPyWFRGjUV5QLyiu5pG+r4efKPIUEpWCkXh69q7Sbsg1w2lGjmU4Cllmu6sZ6m3mD+sDeciK22aU3O2k7nR7ektzUjkINSkQEjQJ6epa3XroDVORtRXFSiNQVabbQtmSbN+jZdk1sQSiZ037or4b8o7vHWWgCPYHUwprU4mOzf9HcOsNK829AI87MNs2AclN6WQFz2PjjFU/uZvwHo622fhvLs9crbdr6SoRVuJtGT23xuPks/8BlO/mjkMCmH528WeyB5cOKKR9pG6m/vQ42wvZrZ4klonbWY8Og3yW+Fe4v9U9w/d04XKR6B9/TSmmPQK499QPcPmjl/zCmRRlqfxWw6Ou2Qla3fGwD8I+posZP5mS/+D3vitbybfiITUZraDRoFD9rj8jXNffcaKNPjJcUwRLEg0eQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(316002)(4326008)(1076003)(82310400003)(186003)(36860700001)(8936002)(86362001)(70586007)(26005)(5660300002)(70206006)(426003)(2616005)(44832011)(81166007)(7696005)(8676002)(110136005)(83380400001)(6666004)(36756003)(356005)(47076005)(2906002)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3127
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6bd857c0-879b-4429-e87f-08d97e8a4157
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rh1Z+JkeW468ZBycuiSBV6I+KFI68EmSkYxPYB5bHxA9Z6BqqspB61XQQRua1VDBb+sR+tEpI1ZeIh9rrgn4FDWm5QBK8H7/M2EKzhgC4Sp/oxxaaj5qqPo/3s6vkbPRIog2XIjOzhr1CoSK/ezecn+ZC52kplUa+TpbNluiKiRJuMIgm2DCL3A4qhmHhhr0qUeI4OnOD0sxzB/IELH9/fn0IOCLZcdTnWeq+zXGHcF3CeaTk3QzL5LAVDxYN+8tvR2IjwrBrouA3gObmo8HSRbc+pW8nz8tTar7vc8xyba9xNVtwQOuofzEbuh5zl6VkKSEnMl8dAHlCliP/x9oscFaXrndZ2+EA1dChesCCOdfh88uDijBNuzp8kuSXihgEK5x76LYYKYdL8g+en9I1lEr1wDoku8bgdtMhgB7uMUcPurrHNyTYJTqednIIDxL7HIChBVfN3AaLsFmJy6elCGmSIt7+WjvCVNTFIMBjsukjiYas/5MUFI/jhSEFgp+OzgIDpNMJTkwtqe8pidhDfMVctsYxER6G9iZdqKw5F9tcdKn+KZiKbz2RZLTEm3XtaNDS2o23sQ6EtdMHO4fUKaQtie5BoDIJPg3j438SwCuUUL/KfHHqUZ2RWvcJ5CoETPS8eoAo7HbVeI5hJhIf00RYpjjBxNygb6jUUIjnkyJeB2X69iPzQxbNKuHVYWDR1OoGfYMnExSFR+F5+BJdQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(1076003)(36860700001)(508600001)(8936002)(70586007)(7696005)(70206006)(426003)(316002)(5660300002)(86362001)(110136005)(4326008)(6666004)(336012)(2616005)(81166007)(2906002)(44832011)(26005)(186003)(83380400001)(8676002)(36756003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:33.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b117b6a4-261e-42c5-cf10-08d97e8a4e22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5512

srat_bad is used when NUMA initialization code scan SRAT failed.
It will turn fw_numa to disabled status. Its implementation depends
on NUMA implementation. We want every NUMA implementation to provide
this function for common initialization code.

In this patch, we export srat_bad to external. This will allow to
have the code mostly common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c        | 2 +-
 xen/include/asm-x86/numa.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 0b8b0b0c95..94bd5b34da 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -163,7 +163,7 @@ static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 	}
 }
 
-static __init void bad_srat(void)
+__init void bad_srat(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 295f875a51..a5690a7098 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -32,6 +32,7 @@ extern bool numa_off;
 
 
 extern int srat_disabled(void);
+extern void bad_srat(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
-- 
2.25.1


