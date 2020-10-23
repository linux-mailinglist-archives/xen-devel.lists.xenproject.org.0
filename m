Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEB296DDC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 13:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10878.29018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVvRw-0001VG-Ll; Fri, 23 Oct 2020 11:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10878.29018; Fri, 23 Oct 2020 11:41:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVvRw-0001Uu-I9; Fri, 23 Oct 2020 11:41:36 +0000
Received: by outflank-mailman (input) for mailman id 10878;
 Fri, 23 Oct 2020 11:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP8M=D6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kVvRu-0001Up-Q3
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 11:41:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 991fe2f9-23f2-4339-96c4-8c464eb99903;
 Fri, 23 Oct 2020 11:41:33 +0000 (UTC)
Received: from DB6PR0501CA0038.eurprd05.prod.outlook.com (2603:10a6:4:67::24)
 by PA4PR08MB6109.eurprd08.prod.outlook.com (2603:10a6:102:e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 11:41:31 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::a6) by DB6PR0501CA0038.outlook.office365.com
 (2603:10a6:4:67::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 23 Oct 2020 11:41:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 11:41:29 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Fri, 23 Oct 2020 11:41:29 +0000
Received: from ac0a0d56d676.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E51EDE9C-8625-49B9-A823-103ECC6C4F61.1; 
 Fri, 23 Oct 2020 11:41:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac0a0d56d676.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Oct 2020 11:41:05 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB3491.eurprd08.prod.outlook.com (2603:10a6:208:d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Fri, 23 Oct
 2020 11:41:02 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 11:41:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SP8M=D6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kVvRu-0001Up-Q3
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 11:41:34 +0000
X-Inumbo-ID: 991fe2f9-23f2-4339-96c4-8c464eb99903
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [40.107.7.54])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 991fe2f9-23f2-4339-96c4-8c464eb99903;
	Fri, 23 Oct 2020 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UglLBGLZ5V1tj8IgCmnb7EYeOzzLeZk/KUGgNgTsFo=;
 b=lkY8EaKppfa4dWm0QrYCHCTw4JMFNLzUuZMmbbUOjg08uS2ksvkw/Jt1x64ezVgq7veBF5TtKPHPPChM9a93OzvMsjC5gVV8riGPYEgNUKhLyaLu63x4EHMBn98mn4I3D3sSgfLtt1U7aofGz97f1n9A5oa1BkK38eWFmMIhDes=
Received: from DB6PR0501CA0038.eurprd05.prod.outlook.com (2603:10a6:4:67::24)
 by PA4PR08MB6109.eurprd08.prod.outlook.com (2603:10a6:102:e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 23 Oct
 2020 11:41:31 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::a6) by DB6PR0501CA0038.outlook.office365.com
 (2603:10a6:4:67::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 23 Oct 2020 11:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 11:41:29 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Fri, 23 Oct 2020 11:41:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f9ac5679c940023
X-CR-MTA-TID: 64aa7808
Received: from ac0a0d56d676.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E51EDE9C-8625-49B9-A823-103ECC6C4F61.1;
	Fri, 23 Oct 2020 11:41:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac0a0d56d676.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 23 Oct 2020 11:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZNTaWxiMoPo1n3mmEo6nCRh+rZBCok/28zROfpdLfAGgCgba/iea3pvXqWuuI/xaAdwTpYGfzMzH7AQ4OuF7eWqiDQp1kCgjrUbt3Ucsl6VyJJmnTpOe8ri7e9mR/vpjCJyFa4JwNn3hs9/Z+p/f+cwuPqcLA7XMwDqSoywSj8NK23lkeXrvP1zWZyZoYxtPIbzcf7bKDowO3Eyfe/fyjPgv32kVmMvZPy4fIwg9aEF8xXj5Yw9KC4GMf8o7spOkka61c/YShFiKpRHz14zGtQ6Hwglrq1KEnhk6rpYTL2I2dUhPXXnxWeb1RD5Cxsb+COr1n/icwPooexJlC/ssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UglLBGLZ5V1tj8IgCmnb7EYeOzzLeZk/KUGgNgTsFo=;
 b=ALng+dWjKzGdoxRogD5QiikW0h6xpoF7Gt++TDWrqcCpGKRyJlQnXR5ARzItCR7YqNrWUm1u0TNzRuC31Aq1RSN+XYv0WsOpgRmU5R6kL1F7X6hK7d4tQ2kE/w5o5YsqoYjN/xQh7V7hLY45ff21VQQ58g62DqZO0mqPCtowfniiEHjfgej841VmWO2Mi0056RR25ubNvIolKXTP84OsA/ODfOdmqvKmVlBYxEysO3czMfxBlG2/DIZZEZ7ls8Q3ISr7CEBUan8HvFpBPe3OlBUs1Ph0/hmBMnSqbTb1/YNmfLmehuddQ7MBtZAQ45qPoK4NA4EHdSMiurG8gQIsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UglLBGLZ5V1tj8IgCmnb7EYeOzzLeZk/KUGgNgTsFo=;
 b=lkY8EaKppfa4dWm0QrYCHCTw4JMFNLzUuZMmbbUOjg08uS2ksvkw/Jt1x64ezVgq7veBF5TtKPHPPChM9a93OzvMsjC5gVV8riGPYEgNUKhLyaLu63x4EHMBn98mn4I3D3sSgfLtt1U7aofGz97f1n9A5oa1BkK38eWFmMIhDes=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB3491.eurprd08.prod.outlook.com (2603:10a6:208:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Fri, 23 Oct
 2020 11:41:02 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 11:41:02 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABxu0A
Date: Fri, 23 Oct 2020 11:41:02 +0000
Message-ID: <B339BB42-A4E1-4EE6-BD29-B3AD48D6B621@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
In-Reply-To: <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcab4d95-1093-440f-26fd-08d87748952b
x-ms-traffictypediagnostic: AM0PR08MB3491:|PA4PR08MB6109:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB61096C345039DA44BAF15509FC1A0@PA4PR08MB6109.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4SnUKURCFr5Q6qtjnHWy4xu0W7x7dGg6HHZsxOEudw9SwR7fNhuAeKBVIOxznB7nM4hKjO+T6LiJqCpp+0jFCXH/MOvnmDPinsNCRWTMsMS97qLLiOxwc7DJGM+ljmwWGrWflKQYFp05xjLrUhAnZTVJ/+bVtVioITxwiSRQ+uOCveZMshrqkGDP8DggJumC8t+jzXj34GZbTqhFqMHqPz1y2MHYMKlrqDN2r9zuxrs7SugHdPODWdnMyXTONUp2tkFksprTxTubc2VEDQzpa16wBdWpxoLytAlYs9fJy2k0tAW3lQjmF2trcD/nQLXy9T9WKA6y5EotTwl/+HRLJA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(4326008)(478600001)(33656002)(6506007)(186003)(6486002)(54906003)(26005)(53546011)(91956017)(66446008)(6916009)(316002)(6512007)(55236004)(76116006)(66556008)(66476007)(66946007)(64756008)(86362001)(2906002)(71200400001)(83380400001)(8936002)(5660300002)(8676002)(36756003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 c0MRc7G7LstX+xRA1QVWEHDTL7NROHnN1K4S4nmxyfvQ0QvIBYrgfUFzM4IWCQ+KAnZVcZzpmLyxo/o+eoxUC4FJQtubEmwbG1QyBvfGwkxCL8zDOMkqiDrQ6x5DcWNkbeOVJZyM2Pn520adY7O+CSlXAD7dL6ejOnu/yKNu6mxVzxN6NWC+FqmVX+i5S+MsN217lDhxkpTCwU+a0G0+k71wxnJwQkyFszltfyJrzv+/cGQqlycyy3SYpmAPKw3UUZSRIqNgAAm0vX3e6E2WCH9O8GbhFexRSmsMkBv2wua8lKK3hhcNyPnNpnrbP2g5UtsRO/AFa24Yoj9Q13yVk6fnjOWtzk7cjLPOjPskQHyu1k604vd/pdJFxUI83KP6f6XEkBUrscdiTDQBS/68tpxmQSLiVD2FjAdi7xEd5g5J5KVambjhTE4m8KQKX5nKCvzCJHUaVsOvBX3/ATjwcG9tk1Tw/aRw+9tJDsVL3aUSjRabUtbPDMvtuqk57Ly+fWANhHChEi6R1S9TJIaoFeCGgbd6R+ZqugjmyMIpMjlLnng7XTEg5rMDBEVvI0mnmE74wiaLIBeO3rLoETA70VbP2C0DIOd5ytF+keBP2d4/Lt4Q/9P0q59EF/L0ts/gfFXcKVTfBE/pzzf+GSOShg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5536C43CCE36C64E896D78B6BE6E2F44@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3491
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce3ae4be-2317-4f41-8e97-08d877488538
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Twg689vLvxy1gyuZR8UmPX2GJ9nPTSwovs7+lV0TAJVDglgtobbGATNJ8Z+eKuS3qQNOcsGbk12fi6wuEnNBzHyreG20M4UYzA4JencDUMai1EVREYK4qwKTCr5zILvx6aHJqUiX6r5Rg2eKZz4Fb/XxH7VEhM7L/0VRgOgNKbFwflH35U9vAnxddhE9aSAsFbgidnXZp4QYbVT9j1RaNIhixABzyyDYPCjnteZkn7VYz3zh/F+FeOF7k0sJs+sZXY3VXxPKho0uaIYR4g28OAugxPPSotQl71WK8Vy3tfLk0nJqOekUWoclHgdEBF7lDauIC5J5bV2dReuuk8Dj7/zbI7R2hjo2dAbk9WdzTfd+wH+vsn7Ko0tIdasOFImZ7osk+ufrm0lVr7F5bcAsKw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966005)(26005)(356005)(81166007)(36756003)(83380400001)(8676002)(478600001)(47076004)(4326008)(6862004)(6506007)(53546011)(55236004)(336012)(82310400003)(2616005)(107886003)(186003)(70586007)(70206006)(33656002)(54906003)(6512007)(5660300002)(8936002)(2906002)(316002)(82740400003)(86362001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 11:41:29.6834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcab4d95-1093-440f-26fd-08d87748952b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6109

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDIyIE9jdCAyMDIwLCBhdCA5OjMyIGFtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjEvMTAvMjAyMCAx
MjoyNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIZWxsbyBKdWxpZW4sDQo+IA0KPiBIaSBSYWh1
bCwNCj4gDQo+Pj4gT24gMjAgT2N0IDIwMjAsIGF0IDY6MDMgcG0sIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIFJhaHVsLA0KPj4+IA0KPj4+IFRoYW5r
IHlvdSBmb3IgdGhlIGNvbnRyaWJ1dGlvbi4gTGV0cyBtYWtlIHN1cmUgdGhpcyBhdHRlbXB0IHRv
IFNNTVV2MyBzdXBwb3J0IGluIFhlbiB3aWxsIGJlIG1vcmUgc3VjY2Vzc2Z1bCB0aGFuIHRoZSBv
dGhlciBvbmUgOikuDQo+PiBZZXMgc3VyZS4NCj4+PiANCj4+PiBJIGhhdmVuJ3QgcmV2aWV3ZWQg
dGhlIGNvZGUgeWV0LCBidXQgSSB3YW50ZWQgdG8gcHJvdmlkZSBmZWVkYmFjayBvbiB0aGUgY29t
bWl0IG1lc3NhZ2UuDQo+Pj4gDQo+Pj4gT24gMjAvMTAvMjAyMCAxNjoyNSwgUmFodWwgU2luZ2gg
d3JvdGU6DQo+Pj4+IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxl
bWVudGF0aW9ucy4gSXQgaXMgYmFzZWQgb24NCj4+Pj4gdGhlIExpbnV4IFNNTVV2MyBkcml2ZXIu
DQo+Pj4+IE1ham9yIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIExpbnV4IGRyaXZlciBhcmUgYXMg
Zm9sbG93czoNCj4+Pj4gMS4gT25seSBTdGFnZS0yIHRyYW5zbGF0aW9uIGlzIHN1cHBvcnRlZCBh
cyBjb21wYXJlZCB0byB0aGUgTGludXggZHJpdmVyDQo+Pj4+ICAgIHRoYXQgc3VwcG9ydHMgYm90
aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4gMi4gVXNlIFAyTSAgcGFn
ZSB0YWJsZSBpbnN0ZWFkIG9mIGNyZWF0aW5nIG9uZSBhcyBTTU1VdjMgaGFzIHRoZQ0KPj4+PiAg
ICBjYXBhYmlsaXR5IHRvIHNoYXJlIHRoZSBwYWdlIHRhYmxlcyB3aXRoIHRoZSBDUFUuDQo+Pj4+
IDMuIFRhc2tsZXRzIGlzIHVzZWQgaW4gcGxhY2Ugb2YgdGhyZWFkZWQgSVJRJ3MgaW4gTGludXgg
Zm9yIGV2ZW50IHF1ZXVlDQo+Pj4+ICAgIGFuZCBwcmlvcml0eSBxdWV1ZSBJUlEgaGFuZGxpbmcu
DQo+Pj4gDQo+Pj4gVGFza2xldHMgYXJlIG5vdCBhIHJlcGxhY2VtZW50IGZvciB0aHJlYWRlZCBJ
UlEuIEluIHBhcnRpY3VsYXIsIHRoZXkgd2lsbCBoYXZlIHByaW9yaXR5IG92ZXIgYW55dGhpbmcg
ZWxzZSAoSU9XIG5vdGhpbmcgd2lsbCBydW4gb24gdGhlIHBDUFUgdW50aWwgdGhleSBhcmUgZG9u
ZSkuDQo+Pj4gDQo+Pj4gRG8geW91IGtub3cgd2h5IExpbnV4IGlzIHVzaW5nIHRocmVhZC4gSXMg
aXQgYmVjYXVzZSBvZiBsb25nIHJ1bm5pbmcgb3BlcmF0aW9ucz8NCj4+IFllcyB5b3UgYXJlIHJp
Z2h0IGJlY2F1c2Ugb2YgbG9uZyBydW5uaW5nIG9wZXJhdGlvbnMgTGludXggaXMgdXNpbmcgdGhl
IHRocmVhZGVkIElSUXMuDQo+PiBTTU1VdjMgcmVwb3J0cyBmYXVsdC9ldmVudHMgYmFzZXMgb24g
bWVtb3J5LWJhc2VkIGNpcmN1bGFyIGJ1ZmZlciBxdWV1ZXMgbm90IGJhc2VkIG9uIHRoZSByZWdp
c3Rlci4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcsIGl0IGlzIHRpbWUtY29uc3VtaW5nIHRvIHBy
b2Nlc3MgdGhlIG1lbW9yeSBiYXNlZCBxdWV1ZXMgaW4gaW50ZXJydXB0IGNvbnRleHQgYmVjYXVz
ZSBvZiB0aGF0IExpbnV4IGlzIHVzaW5nIHRocmVhZGVkIElSUSB0byBwcm9jZXNzIHRoZSBmYXVs
dHMvZXZlbnRzIGZyb20gU01NVS4NCj4+IEkgZGlkbuKAmXQgZmluZCBhbnkgb3RoZXIgc29sdXRp
b24gaW4gWEVOIGluIHBsYWNlIG9mIHRhc2tsZXQgdG8gZGVmZXIgdGhlIHdvcmssIHRoYXTigJlz
IHdoeSBJIHVzZWQgdGFza2xldCBpbiBYRU4gaW4gcmVwbGFjZW1lbnQgb2YgdGhyZWFkZWQgSVJR
cy4gSWYgd2UgZG8gYWxsIHdvcmsgaW4gaW50ZXJydXB0IGNvbnRleHQgd2Ugd2lsbCBtYWtlIFhF
TiBsZXNzIHJlc3BvbnNpdmUuDQo+IA0KPiBTbyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IFhl
biBjb250aW51ZSB0byByZWNlaXZlcyBpbnRlcnJ1cHRzLCBidXQgd2UgYWxzbyBuZWVkIHRvIG1h
a2Ugc3VyZSB0aGF0IGEgdkNQVSBib3VuZCB0byB0aGUgcENQVSBpcyBhbHNvIHJlc3BvbnNpdmUu
DQoNClllcyBJIGFncmVlLg0KPiANCj4+IElmIHlvdSBrbm93IGFub3RoZXIgc29sdXRpb24gaW4g
WEVOIHRoYXQgd2lsbCBiZSB1c2VkIHRvIGRlZmVyIHRoZSB3b3JrIGluIHRoZSBpbnRlcnJ1cHQg
cGxlYXNlIGxldCBtZSBrbm93IEkgd2lsbCB0cnkgdG8gdXNlIHRoYXQuDQo+IA0KPiBPbmUgb2Yg
bXkgd29yayBjb2xsZWFndWUgZW5jb3VudGVyZWQgYSBzaW1pbGFyIHByb2JsZW0gcmVjZW50bHku
IEhlIGhhZCBhIGxvbmcgcnVubmluZyB0YXNrbGV0IGFuZCB3YW50ZWQgdG8gYmUgYnJva2VuIGRv
d24gaW4gc21hbGxlciBjaHVuay4NCj4gDQo+IFdlIGRlY2lkZWQgdG8gdXNlIGEgdGltZXIgdG8g
cmVzY2hlZHVsZSB0aGUgdGFzbGtldCBpbiB0aGUgZnV0dXJlLiBUaGlzIGFsbG93cyB0aGUgc2No
ZWR1bGVyIHRvIHJ1biBvdGhlciBsb2FkcyAoZS5nLiB2Q1BVKSBmb3Igc29tZSB0aW1lLg0KPiAN
Cj4gVGhpcyBpcyBwcmV0dHkgaGFja2lzaCBidXQgSSBjb3VsZG4ndCBmaW5kIGEgYmV0dGVyIHNv
bHV0aW9uIGFzIHRhc2tsZXQgaGF2ZSBoaWdoIHByaW9yaXR5Lg0KPiANCj4gTWF5YmUgdGhlIG90
aGVyIHdpbGwgaGF2ZSBhIGJldHRlciBpZGVhLg0KDQpMZXQgbWUgdHJ5IHRvIHVzZSB0aGUgdGlt
ZXIgYW5kIHdpbGwgc2hhcmUgbXkgZmluZGluZ3MuDQo+IA0KPj4+PiA0LiBMYXRlc3QgdmVyc2lv
biBvZiB0aGUgTGludXggU01NVXYzIGNvZGUgaW1wbGVtZW50cyB0aGUgY29tbWFuZHMgcXVldWUN
Cj4+Pj4gICAgYWNjZXNzIGZ1bmN0aW9ucyBiYXNlZCBvbiBhdG9taWMgb3BlcmF0aW9ucyBpbXBs
ZW1lbnRlZCBpbiBMaW51eC4NCj4+PiANCj4+PiBDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxz
Pw0KPj4gSSB0cmllZCB0byBwb3J0IHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGUgU01NVXYzIGNv
ZGUgdGhhbiBJIG9ic2VydmVkIHRoYXQgaW4gb3JkZXIgdG8gcG9ydCB0aGF0IGNvZGUgSSBoYXZl
IHRvIGFsc28gcG9ydCBhdG9taWMgb3BlcmF0aW9uIGltcGxlbWVudGVkIGluIExpbnV4IHRvIFhF
Ti4gQXMgbGF0ZXN0IExpbnV4IGNvZGUgdXNlcyBhdG9taWMgb3BlcmF0aW9uIHRvIHByb2Nlc3Mg
dGhlIGNvbW1hbmQgcXVldWVzIChhdG9taWNfY29uZF9yZWFkX3JlbGF4ZWQoKSxhdG9taWNfbG9u
Z19jb25kX3JlYWRfcmVsYXhlZCgpICwgYXRvbWljX2ZldGNoX2FuZG5vdF9yZWxheGVkKCkpIC4N
Cj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJlc3QgdG8gaW1wb3J0IHRoZSBhdG9taWMgaGVscGVycyBhbmQgdXNlIHRoZSBsYXRlc3QgY29k
ZS4NCj4gDQo+IFRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBkb24ndCByZS1pbnRyb2R1Y2UgYnVn
cyBhbmQgYWxzbyBidXkgdXMgc29tZSB0aW1lIGJlZm9yZSB0aGUgTGludXggYW5kIFhlbiBkcml2
ZXIgZGl2ZXJnZSBhZ2FpbiB0b28gbXVjaC4NCj4gDQo+IFN0ZWZhbm8sIHdoYXQgZG8geW91IHRo
aW5rPw0KPiANCj4+PiANCj4+Pj4gICAgQXRvbWljIGZ1bmN0aW9ucyB1c2VkIGJ5IHRoZSBjb21t
YW5kcyBxdWV1ZSBhY2Nlc3MgZnVuY3Rpb25zIGlzIG5vdA0KPj4+PiAgICBpbXBsZW1lbnRlZCBp
biBYRU4gdGhlcmVmb3JlIHdlIGRlY2lkZWQgdG8gcG9ydCB0aGUgZWFybGllciB2ZXJzaW9uDQo+
Pj4+ICAgIG9mIHRoZSBjb2RlLiBPbmNlIHRoZSBwcm9wZXIgYXRvbWljIG9wZXJhdGlvbnMgd2ls
bCBiZSBhdmFpbGFibGUgaW4gWEVODQo+Pj4+ICAgIHRoZSBkcml2ZXIgY2FuIGJlIHVwZGF0ZWQu
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0K
Pj4+PiAtLS0NCj4+Pj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcgICAgICAgfCAg
IDEwICsNCj4+Pj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZSAgfCAgICAx
ICsNCj4+Pj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMgfCAyODQ3ICsr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMjg1OCBpbnNl
cnRpb25zKCspDQo+Pj4gDQo+Pj4gVGhpcyBpcyBxdWl0ZSBzaWduaWZpY2FudCBwYXRjaCB0byBy
ZXZpZXcuIElzIHRoZXJlIGFueSB3YXkgdG8gZ2V0IGl0IHNwbGl0IChtYXliZSBhIHZlcmJhdGlt
IExpbnV4IGNvcHkgKyBYZW4gbW9kaWZpY2F0aW9uKT8NCj4+IFllcywgSSB1bmRlcnN0YW5kIHRo
aXMgaXMgYSBxdWl0ZSBzaWduaWZpY2FudCBwYXRjaCB0byByZXZpZXcgbGV0IG1lIHRoaW5rIHRv
IGdldCBpdCBzcGxpdC4gSWYgaXQgaXMgb2sgZm9yIHlvdSB0byByZXZpZXcgdGhpcyBwYXRjaCBh
bmQgcHJvdmlkZSB5b3VyIGNvbW1lbnRzIHRoZW4gaXQgd2lsbCBncmVhdCBmb3IgdXMuDQo+IEkg
d2lsbCB0cnkgdG8gaGF2ZSBhIGxvb2sgbmV4dCB3ZWVrLg0KDQpUaGFua3MgaW4gYWR2YW5jZSDi
mLrvuI8NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KUmVnYXJk
cywNClJhaHVsDQoNCg==

