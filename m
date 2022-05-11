Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86785522934
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326112.548978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobW1-0002J3-4x; Wed, 11 May 2022 01:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326112.548978; Wed, 11 May 2022 01:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobW1-0002GM-1s; Wed, 11 May 2022 01:51:49 +0000
Received: by outflank-mailman (input) for mailman id 326112;
 Wed, 11 May 2022 01:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRs-0004GU-Rl
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 521906e1-d0cc-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 03:47:31 +0200 (CEST)
Received: from AS9PR06CA0501.eurprd06.prod.outlook.com (2603:10a6:20b:49b::26)
 by GV1PR08MB7314.eurprd08.prod.outlook.com (2603:10a6:150:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 11 May
 2022 01:47:28 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::82) by AS9PR06CA0501.outlook.office365.com
 (2603:10a6:20b:49b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 01:47:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 11 May 2022 01:47:27 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 11 May 2022 01:47:27 +0000
Received: from 749541d7139f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FABBF10E-55D3-4F8A-8A87-C0BB700317B8.1; 
 Wed, 11 May 2022 01:47:20 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 749541d7139f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:20 +0000
Received: from DB6P193CA0013.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::23) by
 DB6PR08MB2662.eurprd08.prod.outlook.com (2603:10a6:6:24::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.22; Wed, 11 May 2022 01:47:17 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::9e) by DB6P193CA0013.outlook.office365.com
 (2603:10a6:6:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Wed, 11 May 2022 01:47:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:47:17 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Wed, 11
 May 2022 01:47:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:13 +0000
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
X-Inumbo-ID: 521906e1-d0cc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h5xSsNM05uMwB3KRehpnBF3So183PuROCswDTndfEwToVMdpMaxsdh9XShVr3N4bkfM8j7//hTiQ0SWk8Ss/o5PYlmbU+nf7t1+EDrFZ6HTfAA0yrsrP43N8osGb+kskFAa+CsqX2wBNwsQrdOGEtrfAiIaada0zOpIdSwdZ75VZBpOA5pL6HNa14OMl9vok8dJiUJFQjYTnbRTDYbnbOpIkSgBMY8EC+7g7ujuOL4fbQ1uEmqkiEgcR47cvBsvLx0PEHEvoo2SNsSq7mcmrzGtsnAd27Rquo+yDw4cn6kkc50UiykIKJ0GiJ7QqrkWajtyHAI4RbChjme/5DhPjvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mklnp+4UtmYQx528gAiVFaums7OmdZxaBTqLvOripTs=;
 b=JmzMKZaeA7ohgMyzbIlL0Y9jojTDoFiWsPA9BUPv0s0QVpda7uhfZs9igNvgjFnoU/gdeazBfPmj6c/tHbcqmNKvaIblFAN0/KMB9BXcRhNL4NkFDAxmjM9azGfFjq57kDWeQ8Rq6M4DbDUg0VZ0pJsHGAP8ycLAPDgtnMzbh4lWKzFPJVCR6fNRDhNK+qTKcoVNgdFtlph/wlOFniv1B8yh1PlQS6rjGq3Fn5TG+4AWNHxioV3UvMScSZIUsxOwg7KJM4Kg/FbrUS/QCaDkihS8bmiOWHyN6CH+MyUV41Kd2CrvS+G/zNqAATJhJjNDkodNfNH/qGa49KYfXdE/Qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mklnp+4UtmYQx528gAiVFaums7OmdZxaBTqLvOripTs=;
 b=KzqdToHFwvMUNqZgWE3UybW3XORlErehdoHPKJtJHA+x7H5R3hnNU2MT8PsYPYJ9LCsYsE5veamIpj5TRWcMMNAqAbv2T7NeTLGsVhce/x+QhDbye/7ht45wsIsIGJFJzUPgi0jAgWYsZnbngVzTt/9Z/ZT5L/dqaaeI0KpkIc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8952d7c08438901
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dek1BgrnCa8Gxri9WobzMBIEOuDHykaX24N6XzvL2XCFXeC3/0SoW3XJSNMGhwdkUMMJi+sQJUrLm1CfC1PAEIHuU42sY58LpuL9PLcof38/o8tQpWUtc/RnrYqXZsOpgvipuaAi6H4b7nWpCstcBTU4mUXDQXvJwdzvy1NlEeoZ2eJhCQCWoeyg2GznPNvgeBDH2S+F8Twl00nPfFe2IBWTRO+t5sYefLVse6Hxd+k4EVErfZQewJYG0Pc/hner610qF7LAHGRDA3xbnQ8y5iVjiyuQClYyeMorsSLuMyou5uq9Yjfkwxgn8HjLYiC9aWgmP2TX4sTkD/ANvyTm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mklnp+4UtmYQx528gAiVFaums7OmdZxaBTqLvOripTs=;
 b=cGNixLu9h7hx51QEawccKOoOA6uXb2ZrLa+TN3g2z4x8Jm1hmTyZUloilV4LjKz+fn47wWoRkL8JuNz2KpEdguSiwl1ENlTIqreLE/CrHYRoP4vMUOWftKTrk/99k/Zrm7h+CSGdiiP+m9z10kGbZuMsWtZixi1lv6a7a+qei051y/E6IjbF5nIkf07oYQh3w/crcomWkFjAELRpmCsE8JcuVWGgZxj+7Y2ZBhTMpVyfiJx3WNXSNY8uilIqgJvnmaBgqS0J7nA0YuVLA+f2FRm30kVyaD/k9sV6X3VBH2qDs9hF3N1sn9U9EytRq3iVq8hZUEgYcmrP6sj6YX7hIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mklnp+4UtmYQx528gAiVFaums7OmdZxaBTqLvOripTs=;
 b=KzqdToHFwvMUNqZgWE3UybW3XORlErehdoHPKJtJHA+x7H5R3hnNU2MT8PsYPYJ9LCsYsE5veamIpj5TRWcMMNAqAbv2T7NeTLGsVhce/x+QhDbye/7ht45wsIsIGJFJzUPgi0jAgWYsZnbngVzTt/9Z/ZT5L/dqaaeI0KpkIc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v3 7/9] xen/x86: use paddr_t for addresses in NUMA node structure
Date: Wed, 11 May 2022 09:46:37 +0800
Message-ID: <20220511014639.197825-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 95284434-5fbe-423c-5f28-08da32f03448
X-MS-TrafficTypeDiagnostic:
	DB6PR08MB2662:EE_|VE1EUR03FT030:EE_|GV1PR08MB7314:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB73148624EEEB36C27720ECB59EC89@GV1PR08MB7314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GYMmS3yLFsriP4MgyZsrIjOTFFzl7kVj+mVmejyDMUzO50gmFV8DFwZDxvaR0ho0kYQ5oZsFSH3+oajyoATG0yzEt0Z+6MsIAxpSJOmFTa91k2GqKUB45FSK2LIORSHMedKnAOIT0Jhh1yM16IIe+zUV0KxxpHZp0dekJ5CAh+fHZEm38daUNMAsH4fWzZ8hAcaJfh7yvEaH2Q6lzKyRQ7CdGobEJ/TFAG0DM592J4dI/Ac+i71kfFDci29YC3JNtwO3py1ZP6/SfuQ/mGkT8NSfN5dufDNhUGfmXzGh5kVlEsC5YHcgnKQ4JUGwTK2e1JUj+ssf4IvNW+7V9Cqf/4ncNdqkUuvTai5DdJuOgpEcHO8KGorl400rnFdq5adsdSCLsjxKGhnmDxWDtNlIxDNLrETaJxLt41TTUQP0rO3lUr1ZVf/Lt5i6FYZJgPc58pHHl94vaeJ3Cld19Z6NIGslfkK7t2XFAblEWoLn7vyJZMs2IJgX8I7k4kfpwaCFtJYcXqZy6Fy9lTSOy3Zly//mM7CoxZ3wkkgXPcUsGxZGUBY8GuNnclmG3oWIglwUt7gFFxnykuFx1JSKJupyquhuoE7qA2LnPYecU26MOSXr2uQfN5KCxzWrisAVUGs6EEgqwLxu7DarcBJx3ZW2h7ZrzxMEuJUWpj1mC3OOOKB73Off47uLmSfcSBmdbzKI8t3BjfUBxSltNIEnAspZFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(2906002)(186003)(44832011)(336012)(47076005)(426003)(26005)(54906003)(5660300002)(1076003)(40460700003)(2616005)(7696005)(8936002)(70586007)(70206006)(356005)(81166007)(8676002)(6916009)(83380400001)(36860700001)(4326008)(86362001)(82310400005)(36756003)(316002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2662
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20c325b9-a60a-4f71-c4a0-08da32f02deb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPC+y4RFeupyme7HqrifpdO3dTxjEJRyqD9ooeQshij23vCKtptBUE1YIrd3D6KzLmzK5fIv6H1nlGDFU6f2GSAwRKAPVMOcu+TG9l8SVw+lDVGZt5UubmUFQtEoLTWtW3Opv3/UA4fgn/7JtI4Lb4H+Uoxu2XDd2PkTDrt3T1LPWDgWlcw83MeOYrAt2OatNuYOFEshC1Xh9aWRx67qPCQV73V4wqTlZLBY4HmnGLCJmy5BOBiptTg9LWaa6ZKwhnJNLs+GQzeD0tqi/IbHnIInDji5NkbJzyzqsRBqEG5yczXNGuTpc0UuI+geBI3LxE1WKdxsKiI9QSoCzZKSgsq30cX8jt84jT8UBaKycaKM4SBnCjcmWwuBPSUXmOtDGtUmDfE/zJUOe47snFSsag9jPVXxxtgKdOWAcw+CO73rKXlUG2OzZtmfrif4bRkT7CqpZHH8TkE0e8+qV6UOqgcLdUMnye81ZiprFtJ88BLofcz6ZwD7FAQ3R9t2SKDWlOr+8Ov1acesfC7xbaATsbFHa9DTeYw2ilM0GUlUmGRpo95A4n2NR8VqDz5e5+hVpqMPxDQhOmWYr/IRxZP4Ku5DCjY4rGHcqBxkrCOnywAHW7IhUl5OhIHJEbdarMkE9VWtu9SQIh8FAofCFKhU1Bii6tXbDSitZ+EvqKdBioC8e2ttO1t8Im1hSSLlOV4e
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(5660300002)(70586007)(508600001)(8676002)(54906003)(6916009)(7696005)(1076003)(70206006)(81166007)(47076005)(82310400005)(336012)(426003)(36756003)(186003)(8936002)(86362001)(44832011)(26005)(316002)(40460700003)(2616005)(4326008)(83380400001)(6666004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:27.5638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95284434-5fbe-423c-5f28-08da32f03448
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7314

NUMA node structure "struct node" is using u64 as node memory
range. In order to make other architectures can reuse this
NUMA node relative code, we replace the u64 to paddr_t. And
use pfn_to_paddr and paddr_to_pfn to replace explicit shift
operations. The relate PRIx64 in print messages have been
replaced by PRIpaddr at the same time. And some being-phased-out
types like u64 in the lines we have touched also have been
converted to uint64_t or unsigned long.

Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
1. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
2. Add Tb.
v1 -> v2:
1. Drop useless cast.
2. Use initializers of the variables.
3. Replace u64 by uint64_t.
4. Use unsigned long for start_pfn and end_pfn.
---
 xen/arch/x86/include/asm/numa.h |  8 ++++----
 xen/arch/x86/numa.c             | 32 +++++++++++++++-----------------
 xen/arch/x86/srat.c             | 25 +++++++++++++------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 5d8385f2e1..c32ccffde3 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -18,7 +18,7 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
 struct node { 
-	u64 start,end; 
+	paddr_t start, end;
 };
 
 extern int compute_hash_shift(struct node *nodes, int numnodes,
@@ -38,7 +38,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
@@ -76,9 +76,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 
-void srat_parse_regions(u64 addr);
+void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 680b7d9002..627ae8aa95 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -162,12 +162,10 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 /* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
-    unsigned long start_pfn, end_pfn;
-
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
@@ -198,11 +196,12 @@ void __init numa_init_array(void)
 static int numa_fake __initdata = 0;
 
 /* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
 {
     int i;
     struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
     if ( hweight64(sz) > 1 )
@@ -218,9 +217,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
     memset(&nodes,0,sizeof(nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
         if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
         nodes[i].end = nodes[i].start + sz;
         printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
                i,
@@ -246,6 +245,8 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
 void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 { 
     int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
 
 #ifdef CONFIG_NUMA_EMU
     if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
@@ -253,17 +254,15 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
+    if ( !numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
            numa_off ? "NUMA turned off" : "No NUMA configuration found");
 
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
@@ -276,8 +275,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     for ( i = 0; i < nr_cpu_ids; i++ )
         numa_set_node(i, 0);
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
+    setup_node_bootmem(0, start, end);
 }
 
 void numa_add_cpu(int cpu)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index cfe24c7e78..8ffe43bdfe 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
 
@@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(u64 start, u64 end)
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
 {
 	int i;
 
@@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
 	return -1;
 }
 
-static __init void cutoff_node(int i, u64 start, u64 end)
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 {
 	struct node *nd = &nodes[i];
 	if (nd->start < start) {
@@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	u64 start, end;
+	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
 	int i;
@@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
 		                !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
 		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
@@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
+		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
 		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
@@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->end = end;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
+	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
@@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
 
 	for (i = 0; i < e820.nr_map; i++) {
 		int j, found;
-		unsigned long long start, end;
+		paddr_t start, end;
 
 		if (e820.map[i].type != E820_RAM) {
 			continue;
@@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
 	}
@@ -432,7 +432,7 @@ static int __init cf_check srat_parse_region(
 	return 0;
 }
 
-void __init srat_parse_regions(u64 addr)
+void __init srat_parse_regions(paddr_t addr)
 {
 	u64 mask;
 	unsigned int i;
@@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	/* Finally register nodes */
 	for_each_node_mask(i, all_nodes_parsed)
 	{
-		u64 size = nodes[i].end - nodes[i].start;
+		uint64_t size = nodes[i].end - nodes[i].start;
+
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
 			       "BIOS Bug or mis-configured hardware?\n", i);
-- 
2.25.1


