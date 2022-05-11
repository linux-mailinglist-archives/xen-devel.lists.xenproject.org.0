Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8E52291E
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326064.548885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRX-0004Pq-Sx; Wed, 11 May 2022 01:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326064.548885; Wed, 11 May 2022 01:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRX-0004JW-NY; Wed, 11 May 2022 01:47:11 +0000
Received: by outflank-mailman (input) for mailman id 326064;
 Wed, 11 May 2022 01:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRW-0004GU-KJ
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44e79563-d0cc-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 03:47:09 +0200 (CEST)
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by DB7PR08MB3084.eurprd08.prod.outlook.com (2603:10a6:5:22::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 11 May
 2022 01:47:04 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::a7) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Wed, 11 May 2022 01:47:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:04 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Wed, 11 May 2022 01:47:04 +0000
Received: from 528f68de6e65.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9156CC9-2275-4435-84E1-B2C370CF5CDB.1; 
 Wed, 11 May 2022 01:46:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 528f68de6e65.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:46:57 +0000
Received: from DU2PR04CA0185.eurprd04.prod.outlook.com (2603:10a6:10:28d::10)
 by DB6PR08MB2903.eurprd08.prod.outlook.com (2603:10a6:6:25::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 11 May
 2022 01:46:48 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::88) by DU2PR04CA0185.outlook.office365.com
 (2603:10a6:10:28d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Wed, 11 May 2022 01:46:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:46:48 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:46:52 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:46:49 +0000
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
X-Inumbo-ID: 44e79563-d0cc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=E5/0jwIPQJSMeP1200t0R6hTzyrkTgyQjVDXwrS/GaOBN+shXnRaaF1d9om/NFZJx7TrCOOm/+JMczjYRqLAJEp5YRXYLjPYzctcC2+zTZqYmnchJSQKGeQWSAgr9srcBtjOXJVzUbl450lnyWHqZr6jZbLLmL4XAMLcAQqof9hKv+LNNld9kitcKMI3I3032o6JNVwnil/7s5+ZhF8xyKb3UY9ljJp1R2FIrYxr9Ox0fPPaPiWQC9Tc+BkVjiWA8zBpFQUBYpFtWZrJZrneBM3eP7oxSfeEfErjR6y5M9tJqGVgn5SIhz29LnNrx+U0Cmzc7v0do6nIG6zF2HeflA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31igy7T15kES4vLMfed76VenVkekjtONt3j8NseN5AI=;
 b=lVjK6uQh+8P74Xz0wDztQr/qU8EoA0vP2zHw3MKN/zzZQfw4GsCdZc5ZXPNJGTw716IovTY9vDt8kdgqtqWrNq54GrCqfBqLcfAs7VFniAMyodkoZ+aJ25m88yjlO4eLdHLGN/nTGrCfE5M5RXXiaUe+KuQo9WK0ymhlbvjFLlqmjXBSRCdgaHAsKDKcTiqvlpWNupYwCO7J3qS6OUJMX1Ie6ZjdJs7T/F9lELKigOPEn8sI6D/IXvVtGV9DGk6xpJPFeNnh+rTWVi1fhuTMEognutegS3KsWx3YzGSozOPzPt0WbewLplSlNx4crR8iOmmBd3TpT5TglwDMB5tkag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31igy7T15kES4vLMfed76VenVkekjtONt3j8NseN5AI=;
 b=YMOw8TBsfV72kJJh7RsbRGOiliRR2l75q/4S50BYbBH16r/NKm0d9OOULQd0szWbx9ip2XTJC5edyGuABMoi9R3dMpA0/DxuijePZP3jnwet/VGaCw4hFFKp8Js7+1XuASTi5RFujsy3XKFUUPKWeddKU3hn47RmRVjHVektrJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdda4f0fc244f13b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrGfFu37Wuy3aEXZTQan2PxWxO+U91OKCzkcqfjXm308VWqSCXKdFTEZsB4axnQBa10LAc1gAMKIRy+fwGhxzxhVxHJuGdJ6foeZ7Z/90FTz4Zd2koEnAGRZre9oNt7/IESI00cERiP4+qeu2nqdsxBZVEWXyBj4MG7Y2gJ3LGZxq0pfzC0BeadqDRGY2uhRH5AO/pmhtYCCxjIDtHsJxgQPFf2nIlJBkNeUDGUgmiI8z9SmCMx8ix1gQJkT6Jinu1j75FaUBuAz4c5q+a+Hpa2dWHMFEQcNB4gclwYBztbYmBaBG/u0tY4ifg0FQHDFJsS7OZjkdw241Y3GsfkgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31igy7T15kES4vLMfed76VenVkekjtONt3j8NseN5AI=;
 b=GcU+O5pMlhRYntSHMV9pvokUBL+Z0Ub9ppwxjGDrUwUtYXX91mdnKEK/RBBYrpZEXroNCl5jF3H9w2NuQ42JFJ9lYOnlURmX4Fej6adle/iCvw2V2H43Zdepn0epv8BIdYK3RBmCb87ex6g61/4oK5watwsXsTxopvy4q7rimunJuv7i8bp9SvmmBfd/LuXxDZfjcChVv9GXscWOduJbrAClRqujG/XyxA87Po0FVy4utjubVfXX645Xf+6/4n7C72DT+QYiHeNvaEdo420I0na7yyCtRb34qUX3TkszWn+xdNrS8d6OK+j8EPz/MmRIb8EI+EE9BhLul//KGW19kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31igy7T15kES4vLMfed76VenVkekjtONt3j8NseN5AI=;
 b=YMOw8TBsfV72kJJh7RsbRGOiliRR2l75q/4S50BYbBH16r/NKm0d9OOULQd0szWbx9ip2XTJC5edyGuABMoi9R3dMpA0/DxuijePZP3jnwet/VGaCw4hFFKp8Js7+1XuASTi5RFujsy3XKFUUPKWeddKU3hn47RmRVjHVektrJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v3 0/9] Device tree based NUMA support for Arm - Part#1
Date: Wed, 11 May 2022 09:46:30 +0800
Message-ID: <20220511014639.197825-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 9b59c7ec-64d8-4d20-11a5-08da32f0267e
X-MS-TrafficTypeDiagnostic:
	DB6PR08MB2903:EE_|DBAEUR03FT025:EE_|DB7PR08MB3084:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3084AFF550D20A81D14076389EC89@DB7PR08MB3084.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DoSJPfiBllTaadMl2leN4hyv4LxB8m41Ia5tV5JqKvbZsNqxb2NZ3ks8qNGkO9RuCLO/7Ve/kHLL61OVv6bwqhEofYRK70PGjSbix1akrNZqZ4Ey9N3W2E6XGSF6bX/Kziis3qGWJ0/XpjbfbqMTyJtbxrNIkupShqe+Ya9kTR7lYWyWrRfzp78dpMbGNqzDbaLaEB5sHEzbdUrigwevMlanUb+gJsPD3Ul17l7PK232CfnYcGutS1Zrn52milRXVp20WX4WJkzXuc1yozhqrnTSsstGK4TfyAwyrG/zaqcyEJ7FL33YoaphYyDBd8JsUyUG6LHG4hBgbCwUEnCrPBjIOT+vd0QhJpEgxNysLwUQW/UU60gmk8Mv+6/IE/bE6qHwXvLxIBS1E3GmS871GqBsOhFhqQVN7g1j61uw0AmHxa9J8oFXVnTYGec7hj41cC6ScYxIQ2vzKIOlCUneziF11EwVdkdM3Kc3Gt6x92Os3rNBCdBaUylP0/gLTxHuD6iPXMXuaxK10olpP6p3NY0DHlFJmNwUkZ11hfZ9KgWzeI0+pUjhZwdnLVMB3SHNe8rZVVoBdvdSuSxlIPgIs8greJiO9PSgKuh7xe9OJ7E7NQpn2uevzvnYmRuyQhCMepG/XgVBqFvoPSxiOruBwmhUKPoZVXknX31ZaaFgAWjGK66prx9Mn5gTTbRepkFZRiAGD7AeuoKqXTYD3mKdLgucugURIg6pFU4HCAIgeJKjQCdL3iP5jMcAvK6iKhLATXx7XlU4O9ccaZ5Tou7fLg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2616005)(1076003)(82310400005)(26005)(83380400001)(426003)(336012)(36860700001)(2906002)(47076005)(186003)(508600001)(44832011)(36756003)(5660300002)(70206006)(40460700003)(8676002)(70586007)(4326008)(86362001)(54906003)(8936002)(6666004)(81166007)(7696005)(6916009)(356005)(316002)(21314003)(17413003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2903
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c49895a-a05f-4611-2edf-08da32f01ce0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QSnciYeDpxB79WEUaPafyMcat1xRLwEO5H1mgxwLxj2iWuDtxzPn04a3sPDR+SbpAHLpfJQK/3tKV2xbEIMcCbLpxdrJky6OblL5Oq4q1H3JyyBJ4UZ5Jj/FximqlS76lZzZ0UsUrihujgjnNbXeUiFQKTDMHxKzOMeCyfSRAdTpYWrSHkQVuBA5kh8y54/zqReontDEujpYRByb+A8/7wCCcLREECm+NmtY9JTQEnPYQjiFrH7NYwO1WQj7HLr4tU6/Tvnp9yCrp4sG4BJnRIW+vy+SKiIDjtYq17ZF7Q/WNYtf52WIWCtb22qWH66156m2EBfSa2suQXq1xhy0nnT44oOvVUxUOHIrAG6Du3m5oFvVOPqMXyyvxfqnwAVh68SYJ4qVg8iduBP6kuoCSqhAnwM25/86dJxzJFWDfsEg+dlr326sR+LC2u1Ae/qI3njsGWTxa5Vxz2navqFKZMGotVl/m5joDYz8cUiDvdKcuC6Hg9gFmuWjp6lt/ipAt9c9FjD78nOl15Yb7p5Mh7PhEK8c6HEvl4CUGDOcab0mWHt6APfr9wN52HCppKSrXU0FCt/P/RbdSAsd7ofYBDV8Z7XmqbWv7gXz6PU+pKRUxPXHmzZPe5784FaIIrh2EnRCS7O4uSyHP91/LojzXAdIGNbqdqWtHDN5f16xsbX17L33QT8MDhpy1wttsU1zyvB5WqNcO8KGV+qJyC3CX6LZy2RiWGmPX2JwocvqcSw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(8936002)(2906002)(36860700001)(508600001)(54906003)(6916009)(40460700003)(47076005)(83380400001)(316002)(336012)(426003)(36756003)(82310400005)(44832011)(8676002)(86362001)(70206006)(70586007)(107886003)(7696005)(1076003)(4326008)(2616005)(6666004)(81166007)(5660300002)(26005)(17413003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:04.5682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b59c7ec-64d8-4d20-11a5-08da32f0267e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3084

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series.
2. Move generically usable code from x86 to common.
3. Add new code to support Arm.

This series only contains the first part patches.)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts. 

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

---
Part1 v2->v3:
1. Rework EFI stub patch:
   1.1. Add existed file check, if exists a regular stub files,
        the common/stub files' links will be ignored.
   1.2. Keep stub.c in x86/efi to include common/efi/stub.c
   1.3. Restore efi_compat_xxx stub functions to x86/efi.c.
        Other architectures will not use efi_compat_xxx.
   1.4. Remove ARM_EFI dependency from ARM_64.
   1.5. Add comment for adding stub.o to EFIOBJ-y.
   1.6. Merge patch#2 and patch#3 to one patch.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone
3. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
4. Merge the interleaves checking code from a separate function
   to conflicting_memblks.
5. Use INFO level for node's without memory log message.
6. Move "xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
   phys_to_nid" to part#2.
Part1 v1->v2:
1. Move independent patches from later to early of this series.
2. Drop the copy of EFI stub.c from Arm. Share common codes of
   x86 EFI stub for Arm.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI and remove help text
   and make CONFIG_ARM_EFI invisible.
4. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
6. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time for
   arch_have_default_dmazone.
7. Update commit messages.

Wei Chen (9):
  xen/arm: Print a 64-bit number in hex from early uart
  xen: reuse x86 EFI stub functions for Arm
  xen/arm: Keep memory nodes in device tree when Xen boots from EFI
  xen: introduce an arch helper for default dma zone status
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: use paddr_t for addresses in NUMA node structure
  xen/x86: add detection of memory interleaves for different nodes
  xen/x86: use INFO level for node's without memory log message

 xen/arch/arm/Kconfig              |   4 +
 xen/arch/arm/Makefile             |   2 +-
 xen/arch/arm/arm64/head.S         |  12 +--
 xen/arch/arm/bootfdt.c            |   8 +-
 xen/arch/arm/efi/Makefile         |   8 ++
 xen/arch/arm/efi/efi-boot.h       |  25 ------
 xen/arch/arm/include/asm/numa.h   |   6 ++
 xen/arch/x86/Kconfig              |   2 +-
 xen/arch/x86/efi/stub.c           |  32 +------
 xen/arch/x86/include/asm/config.h |   1 -
 xen/arch/x86/include/asm/numa.h   |   9 +-
 xen/arch/x86/numa.c               |  32 ++++---
 xen/arch/x86/srat.c               | 137 +++++++++++++++++++++---------
 xen/common/Kconfig                |   3 +
 xen/common/efi/efi-common.mk      |   3 +-
 xen/common/efi/stub.c             |  32 +++++++
 xen/common/page_alloc.c           |   2 +-
 xen/drivers/acpi/Kconfig          |   3 +-
 xen/drivers/acpi/Makefile         |   2 +-
 19 files changed, 193 insertions(+), 130 deletions(-)
 create mode 100644 xen/common/efi/stub.c

-- 
2.25.1


