Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3FA29EE15
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 15:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14208.35272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8px-0001Dt-8H; Thu, 29 Oct 2020 14:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14208.35272; Thu, 29 Oct 2020 14:23:33 +0000
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
	id 1kY8px-0001DT-2N; Thu, 29 Oct 2020 14:23:33 +0000
Received: by outflank-mailman (input) for mailman id 14208;
 Thu, 29 Oct 2020 14:23:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sh/s=EE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kY8pv-0001DO-LS
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:23:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d221d285-cb95-43ae-830f-47312e1848ad;
 Thu, 29 Oct 2020 14:23:28 +0000 (UTC)
Received: from AM6PR10CA0076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::17)
 by PA4PR08MB5885.eurprd08.prod.outlook.com (2603:10a6:102:e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 14:23:26 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::a7) by AM6PR10CA0076.outlook.office365.com
 (2603:10a6:209:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 14:23:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 14:23:26 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Thu, 29 Oct 2020 14:23:25 +0000
Received: from 981b874fd139.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 133E8170-7A5E-48D8-BFCC-9438021616E0.1; 
 Thu, 29 Oct 2020 14:22:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 981b874fd139.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Oct 2020 14:22:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 14:22:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 14:22:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sh/s=EE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kY8pv-0001DO-LS
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 14:23:31 +0000
X-Inumbo-ID: d221d285-cb95-43ae-830f-47312e1848ad
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe0d::60b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d221d285-cb95-43ae-830f-47312e1848ad;
	Thu, 29 Oct 2020 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E61SZG2vUV+Pu0oXHvXKigcaIzgjPeXzQD8dTqxzB9I=;
 b=GCYLMy9bIhrWHZxO5P7FVcCB98cWoNezMAUElQxalqTU5HDv2KQ4Q6BHUwRcTeMVPfGFws8oCfOTXo0UhS5WdfZM3PXBG7fi1X5zr9Hk6obcPgxNu4HmCVlh2VMUtpv+qETBwknIE+YFTxk9btQVrRmq53vXIT9sTe4DQiu+riA=
Received: from AM6PR10CA0076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::17)
 by PA4PR08MB5885.eurprd08.prod.outlook.com (2603:10a6:102:e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 14:23:26 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::a7) by AM6PR10CA0076.outlook.office365.com
 (2603:10a6:209:8c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 14:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 14:23:26 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Thu, 29 Oct 2020 14:23:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b66fb0a56fe10a4
X-CR-MTA-TID: 64aa7808
Received: from 981b874fd139.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 133E8170-7A5E-48D8-BFCC-9438021616E0.1;
	Thu, 29 Oct 2020 14:22:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 981b874fd139.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Oct 2020 14:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNJTbMm51qS3xPLWKGb6K0+1L6o4n2ZRgdAFjferw+Hq4A34Fh6dFB4cMo6rFkmqfXCPwr8zxHNwoLSQeoK5h2f9+R7n1qQrIXBT4iJNpnC7uIpdRcNutfCvAi9o+b8MehJ1cnPBbsaINUI6h4LJdP8e4VkztYcDwAO1uG5aS7q9wTKtVyFpJNrvmdIdn7HBt3K2ykY0sY90SA+PtgKi9a6Ixx8nYw3nqPOa2TRRWjjscBPfFJhnNu2zHSzMrW2gjrD7LZOCoKNOrdvPS64kQwO/00WQOrB0zfpiQzkmKk62mr6smnFaTYqxHXbg4aindbhMI6ZYw5JH3ed+85Wrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E61SZG2vUV+Pu0oXHvXKigcaIzgjPeXzQD8dTqxzB9I=;
 b=dlGueqsXYNLNRMHcy/FXVw5qJH0pedYsIy0FVimW3lbbzk8NP8fYxqmpvJgymP14oy5D13YbSiF/YMjn6SFATI+KLfWIKgK3ANDqn+QaLGoaWlxmNdicuTn/TIbQtUrATzWPl8KQQkOgFyWO4iWxnM5JnVy6qPo94ex8G99wsd/rknCnqjCulwmF+5uSQ2dTJ+i+E0VCfTKAQaWul/ZQPmHIeMYeDGPQlLWuhJnLNppiqwo+Y7eLayZOZKiQX7poRJQ+mT2hqDlHJgBXj0Sso9uFzxqB2KwJ5YfOigD67bWnSEs1VRJ06rw4ui2OmwV7S84/V5Ety4Y4Tj6xDQkAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E61SZG2vUV+Pu0oXHvXKigcaIzgjPeXzQD8dTqxzB9I=;
 b=GCYLMy9bIhrWHZxO5P7FVcCB98cWoNezMAUElQxalqTU5HDv2KQ4Q6BHUwRcTeMVPfGFws8oCfOTXo0UhS5WdfZM3PXBG7fi1X5zr9Hk6obcPgxNu4HmCVlh2VMUtpv+qETBwknIE+YFTxk9btQVrRmq53vXIT9sTe4DQiu+riA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 14:22:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 14:22:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvyGh0jWzCHpk6w/U7XN+08x6mgw0AAgAEzsQCAAWItgIABA+GAgADBXQCAABfAAIAAGI8AgAAORwCABG97AIADrU2AgAFBfQA=
Date: Thu, 29 Oct 2020 14:22:44 +0000
Message-ID: <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <bc697327-2750-9a78-042d-d45690d27928@xen.org>
In-Reply-To: <bc697327-2750-9a78-042d-d45690d27928@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 16d50ad4-be41-4781-0de0-08d87c163346
x-ms-traffictypediagnostic: DBBPR08MB6075:|PA4PR08MB5885:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB5885D29AF5C7025CA0352A649D140@PA4PR08MB5885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rXqex44ZzM4ktf+P3axY2pwoNjoYfIFRC0Sv59Or9+8JUjutgYydIYc7+MBaH6//ZNMrTuEBpzx/+v1rPE3Z46M5Vv1s/Feyepne7RHb3q0mNFl4CAMfjNGUPWgNpMdtcorjbGS5jyuVHfRa+Yo7eBvkjg603SIAsaGpv0EZyNKriGC+38Fc1i4wdxCbR80qg65Ax3mytYu0iFs8rxS3Iix5T/Qg1zS1fL/p6hnCmErzT/75j4injrIfNLXhrALu2kLJdBXCpeqnAN+n34pSXqeQIjJg+KdYEp2CR9gL99LCsDk5/XsKqkoUmCJ2LV1z29/XAZdasR7GR1Qbr+1C1w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(66556008)(66946007)(8936002)(26005)(316002)(5660300002)(8676002)(66476007)(2616005)(91956017)(54906003)(66446008)(6486002)(33656002)(6916009)(86362001)(64756008)(36756003)(186003)(76116006)(6512007)(83380400001)(71200400001)(53546011)(4326008)(6506007)(2906002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 LAd3RTHOSgc2pyTp9MX0A2Q7aFuLssqB+68wmeJGAM7M9/giVVvHEDYO4YJTjHUjQI7ujAZPHtZUexzex38SsEKLN4u3RroYLMSNvUXb8NbQIFT3+hoU1A7BlRq4ro3KxUeSIqyYJ7PFIJQ9d7Byqf6+PrPcvbEhsXeTVbNWu9+1hMo1yHJqQ9Q+4XpeNFCBSmG02r6qxeDvyF/1eEwQbO/tS3s4LRw7QElc3+vESz4y43dI00aoeQJIxtyL7v/kxXD9UsDoKXAUGUOVhpQmmoBrAzU6GpGWFbeOlhyq846IVRS8jN6lsZLOyuRu7ehFfYFjQBjWs0LFz14jv9VNMwKQvop5Sezl/QimB1DstrCDNc1rSikYM/amn9e17P0nq2yuY8o59nhW/+U1EzvKMkQvogc9C4YytDdoP0vvLM6o/nNH1Kku5JPAi7o+dnfojIDQr7umqkC6zsQb5nf/orKD/cLTcS5Y0MFLhSf1EXKfH2JO4XVSq7yfykUNUKQOZ8eBL/uH0rQycn3Cu96OFetsTYo06zuwq4nJBF4miVYVTkN/5j3qzEqH7GzO4l9niPDUwy9nDghEbv1FFETSKokxRdtE0mxvuC9yPLRwjGDmrB7Za+DvYYzg7+fzxjFPtokV+8QJzciW1nqaADkMEQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F268206986925A418AB085BF34BC14A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f678471c-d644-4141-3a39-08d87c161a53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gPgzupfL4Z6c9gFoajwfi9Z/MvDmrY0HjWNnrreSqJeveSn1IdfUhLbk/XExp7lMHxUx4Iz+5In6hpLdG2KeBBWD51g+clBqGTp+Ps5xA40cq7PXgWn7mOzt8r35EQWlxvr6t0tUHLWtaWZrrt5KJO1AMHpFgyd3bFvwH9qgyftMJGbfItlbTdm84XU5hBLW6HcDsyVQYls0A0mTiBFDduCVBhrGyfDLKkzxsGuntuy9mxNJZhSr0mYPwrZvG1Ktcreu4dkMCi+4x6ATXsEPEcQ9/Z06I+0lzmujZRO5/W20l5iQryEvXSlXJzmvaJkdh5PLfGEVJXFWx+0CaymKKEdaY+IVatZo9WJ6h3D2p0uk7HSinxagfWNF50ofRZvEzvac19zyoCWmFnAp/L5AYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966005)(6486002)(356005)(70586007)(70206006)(8676002)(53546011)(36756003)(8936002)(2616005)(478600001)(4326008)(5660300002)(36906005)(316002)(6512007)(54906003)(47076004)(81166007)(33656002)(6506007)(86362001)(336012)(26005)(82740400003)(186003)(83380400001)(107886003)(82310400003)(2906002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 14:23:26.2309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d50ad4-be41-4781-0de0-08d87c163346
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5885

SGkgSnVsaWVuLA0KDQo+IE9uIDI4IE9jdCAyMDIwLCBhdCAxOToxMiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI2LzEwLzIwMjAgMTE6MDMs
IFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGVsbG8gSnVsaWVuLA0KPiANCj4gSGkgUmFodWwsDQo+
IA0KPj4+IE9uIDIzIE9jdCAyMDIwLCBhdCA0OjE5IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiAyMy8xMC8yMDIwIDE1OjI3
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gSGVsbG8gSnVsaWVuLA0KPj4+Pj4gT24gMjMgT2N0
IDIwMjAsIGF0IDI6MDAgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gT24gMjMvMTAvMjAyMCAxMjozNSwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+Pj4+Pj4gSGVsbG8sDQo+Pj4+Pj4+IE9uIDIzIE9jdCAyMDIwLCBhdCAx
OjAyIGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3Rl
Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gVGh1LCAyMiBPY3QgMjAyMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4+Pj4+Pj4+PiBPbiAyMC8xMC8yMDIwIDE2OjI1LCBSYWh1bCBTaW5naCB3cm90ZToN
Cj4+Pj4+Pj4+Pj4+IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxl
bWVudGF0aW9ucy4gSXQgaXMgYmFzZWQgb24NCj4+Pj4+Pj4+Pj4+IHRoZSBMaW51eCBTTU1VdjMg
ZHJpdmVyLg0KPj4+Pj4+Pj4+Pj4gTWFqb3IgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgTGludXgg
ZHJpdmVyIGFyZSBhcyBmb2xsb3dzOg0KPj4+Pj4+Pj4+Pj4gMS4gT25seSBTdGFnZS0yIHRyYW5z
bGF0aW9uIGlzIHN1cHBvcnRlZCBhcyBjb21wYXJlZCB0byB0aGUgTGludXggZHJpdmVyDQo+Pj4+
Pj4+Pj4+PiAgICB0aGF0IHN1cHBvcnRzIGJvdGggU3RhZ2UtMSBhbmQgU3RhZ2UtMiB0cmFuc2xh
dGlvbnMuDQo+Pj4+Pj4+Pj4+PiAyLiBVc2UgUDJNICBwYWdlIHRhYmxlIGluc3RlYWQgb2YgY3Jl
YXRpbmcgb25lIGFzIFNNTVV2MyBoYXMgdGhlDQo+Pj4+Pj4+Pj4+PiAgICBjYXBhYmlsaXR5IHRv
IHNoYXJlIHRoZSBwYWdlIHRhYmxlcyB3aXRoIHRoZSBDUFUuDQo+Pj4+Pj4+Pj4+PiAzLiBUYXNr
bGV0cyBpcyB1c2VkIGluIHBsYWNlIG9mIHRocmVhZGVkIElSUSdzIGluIExpbnV4IGZvciBldmVu
dCBxdWV1ZQ0KPj4+Pj4+Pj4+Pj4gICAgYW5kIHByaW9yaXR5IHF1ZXVlIElSUSBoYW5kbGluZy4N
Cj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IFRhc2tsZXRzIGFyZSBub3QgYSByZXBsYWNlbWVudCBm
b3IgdGhyZWFkZWQgSVJRLiBJbiBwYXJ0aWN1bGFyLCB0aGV5IHdpbGwNCj4+Pj4+Pj4+Pj4gaGF2
ZSBwcmlvcml0eSBvdmVyIGFueXRoaW5nIGVsc2UgKElPVyBub3RoaW5nIHdpbGwgcnVuIG9uIHRo
ZSBwQ1BVIHVudGlsDQo+Pj4+Pj4+Pj4+IHRoZXkgYXJlIGRvbmUpLg0KPj4+Pj4+Pj4+PiANCj4+
Pj4+Pj4+Pj4gRG8geW91IGtub3cgd2h5IExpbnV4IGlzIHVzaW5nIHRocmVhZC4gSXMgaXQgYmVj
YXVzZSBvZiBsb25nIHJ1bm5pbmcNCj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucz8NCj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+PiBZZXMgeW91IGFyZSByaWdodCBiZWNhdXNlIG9mIGxvbmcgcnVubmluZyBvcGVy
YXRpb25zIExpbnV4IGlzIHVzaW5nIHRoZQ0KPj4+Pj4+Pj4+IHRocmVhZGVkIElSUXMuDQo+Pj4+
Pj4+Pj4gDQo+Pj4+Pj4+Pj4gU01NVXYzIHJlcG9ydHMgZmF1bHQvZXZlbnRzIGJhc2VzIG9uIG1l
bW9yeS1iYXNlZCBjaXJjdWxhciBidWZmZXIgcXVldWVzIG5vdA0KPj4+Pj4+Pj4+IGJhc2VkIG9u
IHRoZSByZWdpc3Rlci4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcsIGl0IGlzIHRpbWUtY29uc3Vt
aW5nIHRvDQo+Pj4+Pj4+Pj4gcHJvY2VzcyB0aGUgbWVtb3J5IGJhc2VkIHF1ZXVlcyBpbiBpbnRl
cnJ1cHQgY29udGV4dCBiZWNhdXNlIG9mIHRoYXQgTGludXgNCj4+Pj4+Pj4+PiBpcyB1c2luZyB0
aHJlYWRlZCBJUlEgdG8gcHJvY2VzcyB0aGUgZmF1bHRzL2V2ZW50cyBmcm9tIFNNTVUuDQo+Pj4+
Pj4+Pj4gDQo+Pj4+Pj4+Pj4gSSBkaWRu4oCZdCBmaW5kIGFueSBvdGhlciBzb2x1dGlvbiBpbiBY
RU4gaW4gcGxhY2Ugb2YgdGFza2xldCB0byBkZWZlciB0aGUNCj4+Pj4+Pj4+PiB3b3JrLCB0aGF0
4oCZcyB3aHkgSSB1c2VkIHRhc2tsZXQgaW4gWEVOIGluIHJlcGxhY2VtZW50IG9mIHRocmVhZGVk
IElSUXMuIElmDQo+Pj4+Pj4+Pj4gd2UgZG8gYWxsIHdvcmsgaW4gaW50ZXJydXB0IGNvbnRleHQg
d2Ugd2lsbCBtYWtlIFhFTiBsZXNzIHJlc3BvbnNpdmUuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFNv
IHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgWGVuIGNvbnRpbnVlIHRvIHJlY2VpdmVzIGludGVy
cnVwdHMsIGJ1dCB3ZSBhbHNvDQo+Pj4+Pj4+PiBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGEgdkNQ
VSBib3VuZCB0byB0aGUgcENQVSBpcyBhbHNvIHJlc3BvbnNpdmUuDQo+Pj4+Pj4+PiANCj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+PiBJZiB5b3Uga25vdyBhbm90aGVyIHNvbHV0aW9uIGluIFhFTiB0aGF0
IHdpbGwgYmUgdXNlZCB0byBkZWZlciB0aGUgd29yayBpbg0KPj4+Pj4+Pj4+IHRoZSBpbnRlcnJ1
cHQgcGxlYXNlIGxldCBtZSBrbm93IEkgd2lsbCB0cnkgdG8gdXNlIHRoYXQuDQo+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+IE9uZSBvZiBteSB3b3JrIGNvbGxlYWd1ZSBlbmNvdW50ZXJlZCBhIHNpbWlsYXIg
cHJvYmxlbSByZWNlbnRseS4gSGUgaGFkIGEgbG9uZw0KPj4+Pj4+Pj4gcnVubmluZyB0YXNrbGV0
IGFuZCB3YW50ZWQgdG8gYmUgYnJva2VuIGRvd24gaW4gc21hbGxlciBjaHVuay4NCj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4gV2UgZGVjaWRlZCB0byB1c2UgYSB0aW1lciB0byByZXNjaGVkdWxlIHRoZSB0
YXNsa2V0IGluIHRoZSBmdXR1cmUuIFRoaXMgYWxsb3dzDQo+Pj4+Pj4+PiB0aGUgc2NoZWR1bGVy
IHRvIHJ1biBvdGhlciBsb2FkcyAoZS5nLiB2Q1BVKSBmb3Igc29tZSB0aW1lLg0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBUaGlzIGlzIHByZXR0eSBoYWNraXNoIGJ1dCBJIGNvdWxkbid0IGZpbmQgYSBi
ZXR0ZXIgc29sdXRpb24gYXMgdGFza2xldCBoYXZlDQo+Pj4+Pj4+PiBoaWdoIHByaW9yaXR5Lg0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBNYXliZSB0aGUgb3RoZXIgd2lsbCBoYXZlIGEgYmV0dGVyIGlk
ZWEuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBKdWxpZW4ncyBzdWdnZXN0aW9uIGlzIGEgZ29vZCBvbmUu
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBCdXQgSSB0aGluayB0YXNrbGV0cyBjYW4gYmUgY29uZmlndXJl
ZCB0byBiZSBjYWxsZWQgZnJvbSB0aGUgaWRsZV9sb29wLA0KPj4+Pj4+PiBpbiB3aGljaCBjYXNl
IHRoZXkgYXJlIG5vdCBydW4gaW4gaW50ZXJydXB0IGNvbnRleHQ/DQo+Pj4+Pj4+IA0KPj4+Pj4+
ICBZZXMgeW91IGFyZSByaWdodCB0YXNrbGV0IHdpbGwgYmUgc2NoZWR1bGVkIGZyb20gdGhlIGlk
bGVfbG9vcCB0aGF0IGlzIG5vdCBpbnRlcnJ1cHQgY29uZXh0Lg0KPj4+Pj4gDQo+Pj4+PiBUaGlz
IGRlcGVuZHMgb24geW91ciB0YXNrbGV0LiBTb21lIHdpbGwgcnVuIGZyb20gdGhlIHNvZnRpcnEg
Y29udGV4dCB3aGljaCBpcyB1c3VhbGx5IChmb3IgQXJtKSBvbiB0aGUgcmV0dXJuIG9mIGFuIGV4
Y2VwdGlvbi4NCj4+Pj4+IA0KPj4+PiBUaGFua3MgZm9yIHRoZSBpbmZvLiBJIHdpbGwgY2hlY2sg
YW5kIHdpbGwgZ2V0IGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHRoZSB0YXNrbGV0IGhvdyBpdCB3
aWxsIHJ1biBpbiBYRU4uDQo+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gNC4gTGF0ZXN0IHZlcnNpb24g
b2YgdGhlIExpbnV4IFNNTVV2MyBjb2RlIGltcGxlbWVudHMgdGhlIGNvbW1hbmRzIHF1ZXVlDQo+
Pj4+Pj4+Pj4+PiAgICBhY2Nlc3MgZnVuY3Rpb25zIGJhc2VkIG9uIGF0b21pYyBvcGVyYXRpb25z
IGltcGxlbWVudGVkIGluIExpbnV4Lg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gQ2FuIHlvdSBw
cm92aWRlIG1vcmUgZGV0YWlscz8NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBJIHRyaWVkIHRvIHBv
cnQgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHRoZSBTTU1VdjMgY29kZSB0aGFuIEkgb2JzZXJ2ZWQg
dGhhdA0KPj4+Pj4+Pj4+IGluIG9yZGVyIHRvIHBvcnQgdGhhdCBjb2RlIEkgaGF2ZSB0byBhbHNv
IHBvcnQgYXRvbWljIG9wZXJhdGlvbiBpbXBsZW1lbnRlZA0KPj4+Pj4+Pj4+IGluIExpbnV4IHRv
IFhFTi4gQXMgbGF0ZXN0IExpbnV4IGNvZGUgdXNlcyBhdG9taWMgb3BlcmF0aW9uIHRvIHByb2Nl
c3MgdGhlDQo+Pj4+Pj4+Pj4gY29tbWFuZCBxdWV1ZXMgKGF0b21pY19jb25kX3JlYWRfcmVsYXhl
ZCgpLGF0b21pY19sb25nX2NvbmRfcmVhZF9yZWxheGVkKCkgLA0KPj4+Pj4+Pj4+IGF0b21pY19m
ZXRjaF9hbmRub3RfcmVsYXhlZCgpKSAuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFRoYW5rIHlvdSBm
b3IgdGhlIGV4cGxhbmF0aW9uLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gaW1wb3J0IHRo
ZSBhdG9taWMNCj4+Pj4+Pj4+IGhlbHBlcnMgYW5kIHVzZSB0aGUgbGF0ZXN0IGNvZGUuDQo+Pj4+
Pj4+PiANCj4+Pj4+Pj4+IFRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBkb24ndCByZS1pbnRyb2R1
Y2UgYnVncyBhbmQgYWxzbyBidXkgdXMgc29tZSB0aW1lDQo+Pj4+Pj4+PiBiZWZvcmUgdGhlIExp
bnV4IGFuZCBYZW4gZHJpdmVyIGRpdmVyZ2UgYWdhaW4gdG9vIG11Y2guDQo+Pj4+Pj4+PiANCj4+
Pj4+Pj4+IFN0ZWZhbm8sIHdoYXQgZG8geW91IHRoaW5rPw0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSB0
aGluayB5b3UgYXJlIHJpZ2h0Lg0KPj4+Pj4+IFllcywgSSBhZ3JlZSB3aXRoIHlvdSB0byBoYXZl
IFhFTiBjb2RlIGluIHN5bmMgd2l0aCBMaW51eCBjb2RlIHRoYXQncyB3aHkgSSBzdGFydGVkIHdp
dGggdG8gcG9ydCB0aGUgTGludXggYXRvbWljIG9wZXJhdGlvbnMgdG8gWEVOICB0aGVuIEkgcmVh
bGlzZWQgdGhhdCBpdCBpcyBub3Qgc3RyYWlnaHRmb3J3YXJkIHRvIHBvcnQgYXRvbWljIG9wZXJh
dGlvbnMgYW5kIGl0IHJlcXVpcmVzIGxvdHMgb2YgZWZmb3J0IGFuZCB0ZXN0aW5nLiBUaGVyZWZv
cmUgSSBkZWNpZGVkIHRvIHBvcnQgdGhlIGNvZGUgYmVmb3JlIHRoZSBhdG9taWMgb3BlcmF0aW9u
IGlzIGludHJvZHVjZWQgaW4gTGludXguDQo+Pj4+PiANCj4+Pj4+IEhtbW0uLi4gSSB3b3VsZCBu
b3QgaGF2ZSBleHBlY3RlZCBhIGxvdCBvZiBlZmZvcnQgcmVxdWlyZWQgdG8gYWRkIHRoZSAzIGF0
b21pY3Mgb3BlcmF0aW9ucyBhYm92ZS4gQXJlIHlvdSB0cnlpbmcgdG8gYWxzbyBwb3J0IHRoZSBM
U0Ugc3VwcG9ydCBhdCB0aGUgc2FtZSB0aW1lPw0KPj4+PiBUaGVyZSBhcmUgb3RoZXIgYXRvbWlj
IG9wZXJhdGlvbnMgdXNlZCBpbiB0aGUgU01NVXYzIGNvZGUgYXBhcnQgZnJvbSB0aGUgMyBhdG9t
aWMgb3BlcmF0aW9uIEkgbWVudGlvbi4gSSBqdXN0IG1lbnRpb24gMyBvcGVyYXRpb24gYXMgYW4g
ZXhhbXBsZS4NCj4+PiANCj4+PiBPay4gRG8geW91IGhhdmUgYSBsaXN0IHlvdSBjb3VsZCBzaGFy
ZT8NCj4+PiANCj4+IFllcy4gUGxlYXNlIGZpbmQgdGhlIGxpc3QgdGhhdCB3ZSBoYXZlIHRvIHBv
cnQgdG8gdGhlIFhFTiBpbiBvcmRlciB0byBtZXJnZSB0aGUgbGF0ZXN0IFNNTVV2MyBjb2RlLg0K
PiANCj4gVGhhbmtzIQ0KPiANCj4+IElmIHdlIHN0YXJ0IHRvIHBvcnQgdGhlIGJlbG93IGxpc3Qg
d2UgbWlnaHQgaGF2ZSB0byBwb3J0IGFub3RoZXIgYXRvbWljIG9wZXJhdGlvbiBiYXNlZCBvbiB3
aGljaCBiZWxvdyBhdG9taWMgb3BlcmF0aW9ucyBhcmUgaW1wbGVtZW50ZWQuIEkgaGF2ZSBub3Qg
c3BlbnQgdGltZSBvbiBob3cgdGhlc2UgYXRvbWljIG9wZXJhdGlvbnMgYXJlIGltcGxlbWVudGVk
IGluIGRldGFpbCBidXQgYXMgcGVyIG15IHVuZGVyc3RhbmRpbmcsIGl0IHJlcXVpcmVkIGFuIGVm
Zm9ydCB0byBwb3J0IHRoZW0gdG8gWEVOIGFuZCByZXF1aXJlZCBhIGxvdCBvZiB0ZXN0aW5nLg0K
PiANCj4gRm9yIHRoZSBiZWdpbm5pbmcsIEkgdGhpbmsgaXQgaXMgZmluZSB0byBpbXBsZW1lbnQg
dGhlbSB3aXRoIGEgc3Ryb25nZXIgbWVtb3J5IGJhcnJpZXIgdGhhbiBuZWNlc3Nhcnkgb3IgaW4g
YSBsZXNzIGVmZmljaWVudC4gVGhpcyBjYW4gYmUgcmVmaW5lZCBhZnRlcndhcmRzLg0KPiANCj4g
VGhvc2UgaGVscGVycyBjYW4gZGlyZWN0bHkgYmUgZGVmaW5lZCBpbiB0aGUgU01NVXYzIGRyaXZl
cnMgc28gd2Uga25vdyB0aGV5IGFyZSBub3QgZm9yIGdlbmVyYWwgcHVycG9zZSA6KS4NCj4gDQo+
PiAxLiBhdG9taWNfc2V0X3JlbGVhc2UNCj4gDQo+IFRoaXMgY291bGQgYmUgaW1wbGVtZW50ZWQg
YXM6DQo+IA0KPiBzbXBfbWIoKTsNCj4gYXRvbWljX3NldCgpOw0KPiANCj4+IDIuIGF0b21pY19m
ZXRjaF9hbmRub3RfcmVsYXhlZA0KPiANCj4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIGltcG9ydGVk
Lg0KPiANCj4+IDMuIGF0b21pY19jb25kX3JlYWRfcmVsYXhlZA0KPiANCj4gVGhpcyB3b3VsZCBu
ZWVkIHRvIGJlIGltcG9ydGVkLiBUaGUgc2ltcGxlc3QgdmVyc2lvbiBzZWVtcyB0byBiZSB0aGUg
Z2VuZXJpYyB2ZXJzaW9uIHByb3ZpZGVkIGJ5IGluY2x1ZGUvYXNtLWdlbmVyaWMvYmFycmllci5o
IChzZWUgc21wX2NvbmRfbG9hZF9yZWxheGVkKS4NCj4gDQo+PiA0LiBhdG9taWNfbG9uZ19jb25k
X3JlYWRfcmVsYXhlZA0KPj4gNS4gYXRvbWljX2xvbmdfeG9yDQo+IA0KPiBUaGUgdHdvIHdvdWxk
IHJlcXVpcmUgdGhlIGltcGxlbWVudGF0aW9uIG9mIGF0b21pYzY0LiBWb2xvZHlteXIgYWxzbyBy
ZXF1aXJlZCBhIHZlcnNpb24uIEkgb2ZmZXJlZCBteSBoZWxwLCBob3dldmVyIEkgZGlkbid0IGZp
bmQgZW5vdWdoIHRpbWUgdG8gZG8gaXQgeWV0IDooLg0KPiANCj4gRm9yIEFybTY0LCBpdCB3b3Vs
ZCBiZSBwb3NzaWJsZSB0byBkbyBhIGNvcHkvcGFzdGUgb2YgdGhlIGV4aXN0aW5nIGhlbHBlcnMg
YW5kIHJlcGxhY2UgYW55dGhpbmcgcmVsYXRlZCB0byBhIDMyLWJpdCByZWdpc3RlciB3aXRoIGEg
NjQtYml0IG9uZS4NCj4gDQo+IEZvciBBcm0zMiwgdGhleSBhcmUgYSBiaXQgbW9yZSBjb21wbGV4
IGJlY2F1c2UgeW91IG5vdyBuZWVkIHRvIHdvcmsgd2l0aCAyIHJlZ2lzdGVycy4NCj4gDQo+IEhv
d2V2ZXIsIGZvciB5b3VyIHB1cnBvc2UsIHlvdSB3b3VsZCBiZSB1c2luZyBhdG9taWNfbG9uZ190
LiBTbyB0aGUgdGhlIEFybTY0IGltcGxlbWVudGF0aW9uIHNob3VsZCBiZSBzdWZmaWNpZW50Lg0K
PiANCj4+IDYuIGF0b21pY19zZXRfcmVsZWFzZQ0KPiANCj4gU2FtZSBhcyAxLg0KPiANCj4+IDcu
IGF0b21pY19jbXB4Y2hnX3JlbGF4ZWQgbWlnaHQgYmUgd2UgY2FuIHVzZSBhdG9taWNfY21weGNo
ZyB0aGF0IGlzIGltcGxlbWVudGVkIGluIFhFTiBuZWVkIHRvIGNoZWNrLg0KPiBhdG9taWNfY21w
eGNoZygpIGlzIHN0cm9uZ2x5IG9yZGVyZWQuIFNvIGl0IHdvdWxkIGJlIGZpbmUgdG8gdXNlIGl0
IGZvciBpbXBsZW1lbnRpbmcgdGhlIGhlbHBlci4gQWx0aG91Z2gsIG1vcmUgaW5lZmZpY2llbnQg
OikuDQo+IA0KPj4gOC4gYXRvbWljX2RlY19yZXR1cm5fcmVsZWFzZQ0KPiANCj4gWGVuIGltcGxl
bWVudHMgYSBzdHJvbmdlciB2ZXJzaW9uIGF0b21pY19kZWNfcmV0dXJuKCkuIFlvdSBjYW4gcmUt
dXNlIGl0IGhlcmUuDQo+IA0KPj4gOS4gYXRvbWljX2ZldGNoX2luY19yZWxheGVkDQo+IA0KPiBU
aGlzIHdvdWxkIG5lZWQgdG8gYmUgaW1wb3J0ZWQuDQoNCldlIGRvIGFncmVlIHRoYXQgdGhpcyB3
b3VsZCBiZSB0aGUgd29yayByZXF1aXJlZCBidXQgc29tZSBvZiB0aGUgdGhpbmdzIHRvIGJlIGlt
cG9ydGVkIGhhdmUgZGVwZW5kZW5jaWVzIGFuZCB0aGlzIGlzIG5vdA0KYSBzaW1wbGUgY2hhbmdl
IG9uIHRoZSBwYXRjaCBkb25lIGJ5IFJhaHVsIGFuZCBpdCB3b3VsZCByZXF1aXJlIHRvIGFsbW9z
dCByZXN0YXJ0IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgdGVzdGluZyBmcm9tIHRoZQ0KdmVyeSBi
ZWdpbm5pbmcuDQoNCkluIHRoZSBtZWFudGltZSBjb3VsZCB3ZSBwcm9jZXNzIHdpdGggdGhlIHJl
dmlldyBvZiB0aGlzIFNNTVV2MyBkcml2ZXIgYW5kIGluY2x1ZGUgaXQgaW4gWGVuIGFzIGlzID8N
Cg0KV2UgY2FuIHNldCBtZSBhbmQgUmFodWwgYXMgbWFpbnRhaW5lcnMgYW5kIGZsYWcgdGhlIGRy
aXZlciBhcyBleHBlcmltZW50YWwgaW4gU3VwcG9ydC5tZCAoaXQgaXMgYWxyZWFkeQ0KcHJvdGVj
dGVkIGJ5IHRoZSBFWFBFUlQgY29uZmlndXJhdGlvbiBpbiBLY29uZmlnKS4NCg0KDQpDaGVlcnMN
CkJlcnRyYW5kDQoNCg==

