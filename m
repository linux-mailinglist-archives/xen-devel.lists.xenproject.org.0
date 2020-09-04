Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3225D6D2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:51:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9Ik-0004NT-8i; Fri, 04 Sep 2020 10:50:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G2Q=CN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kE9Ii-0004NL-U4
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:50:36 +0000
X-Inumbo-ID: 1ffd0c42-e3dd-4dac-8460-a7d5426640e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ffd0c42-e3dd-4dac-8460-a7d5426640e4;
 Fri, 04 Sep 2020 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkZBXGb0g51usoDzzZYQ5I8oB1TyYz1o7zIeB8C+gIQ=;
 b=ikaiRkn2F3/FcnllXoGGBOeaA5xxsi2D91ru2bEaVdD0UizybC7agUjgr+Vb7Lk7viFJqQCWJG3TJxfutpzG13dptw0XiSGuQYStNDD9FoPKv+AzKdAqt7Aerr+NMAh48tAvmiCub8IFjOy1+hgC3qVqh865Jt8Yi6DlYIrkUXc=
Received: from AM6P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::23)
 by DB8PR08MB5129.eurprd08.prod.outlook.com (2603:10a6:10:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 10:50:33 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::b0) by AM6P195CA0010.outlook.office365.com
 (2603:10a6:209:81::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Fri, 4 Sep 2020 10:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Fri, 4 Sep 2020 10:50:32 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 04 Sep 2020 10:50:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 868c50c77f37be85
X-CR-MTA-TID: 64aa7808
Received: from f8fd52f5f24d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F6BB355-6C9C-4C83-A312-2FD2D2C5368F.1; 
 Fri, 04 Sep 2020 10:49:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8fd52f5f24d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Sep 2020 10:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMA4sVxxU8CNPjkRAMEpjl6eh2US+QhYop5r1H1yeLLvO9kA1734P0yiybsrOs8Xxvg3z0QzWsVmnYYljTWmk76JD7A7lMBA7mM0L7511CnS6X/FgfJZMJMy8AaMa5IkXfzStx4xD2jpE/Y7yW25lQMU9+tKR85kcybv11G9EsYgLOy00epOwysr4R7bfhlw9+5XKYVGkdUxL/AAWT+rdceannFYJxiwMgg2qCQ8mIeYhx2BZC3ws5ibgEDcfCHcH/Etqoe+hxv20PZsAFBqqEJNqwIk2mJWvG79L8pgKAwBHJSY1x4NQ0pDpPBlxWEq7DvLnCVHEhfwPWKPLUlplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkZBXGb0g51usoDzzZYQ5I8oB1TyYz1o7zIeB8C+gIQ=;
 b=XL7lECj5DwSGycwmfQDSBpR7haeFc3p1ZvjPtXS1RnzEWU3a4fwPDynBaOX42v2uy+Vp+f7uKOgEFxKTZZT9CEhG2ruEx4ZOAPSOtgYbu5yIWiNPWMJvL2dEinZWyNzobwDKKgas9Xd+oLARaNKfNPygbNfxI+l6bUZCnf+X+3gCeFLqVObnQuD6AUEZ5wQhML255TndnHlReUpcKcejjM9ofOWNqJ9J714MjJazkN6AJqX1qY78Yi5UnUIaqEt1zIqSzuw5OMTE9M3O0mCBDXri7fX3qYvVbU0tyuPn+h33AvMpx1HacUBjhUEPS3/K6fmzRoNJNk2uinM6/lXOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkZBXGb0g51usoDzzZYQ5I8oB1TyYz1o7zIeB8C+gIQ=;
 b=ikaiRkn2F3/FcnllXoGGBOeaA5xxsi2D91ru2bEaVdD0UizybC7agUjgr+Vb7Lk7viFJqQCWJG3TJxfutpzG13dptw0XiSGuQYStNDD9FoPKv+AzKdAqt7Aerr+NMAh48tAvmiCub8IFjOy1+hgC3qVqh865Jt8Yi6DlYIrkUXc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4823.eurprd08.prod.outlook.com (2603:10a6:10:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 10:49:53 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 10:49:53 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQIv5YQfrx8UWhPeAs1v6hhqlYRMuAgAAGaQCAAAHFAA==
Date: Fri, 4 Sep 2020 10:49:52 +0000
Message-ID: <48BB5235-F9FD-4E81-8CAE-59BEFB24DDC0@arm.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
In-Reply-To: <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2328b114-6299-4e7f-87b6-08d850c0590c
x-ms-traffictypediagnostic: DBBPR08MB4823:|DB8PR08MB5129:
X-Microsoft-Antispam-PRVS: <DB8PR08MB512903643298CC9CEEEE00F19D2D0@DB8PR08MB5129.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RMKC5mFQRcGdtfdli9sSFszy48CCBusEcPZ4L+C4UOZ1Dd480rbSHRtpbXVycOBUwCE42Pq8OqJpCILuU3L3KOA8zRpcn5i9nTisyZmhCNZOuiujr+u8/hJFGWve+RiLRAWSO7amjKmvFKAN8g1MpjMy6rndX8cZ81oD3iLNKa9j5Gglxnf3XyxbSFfCA2aCj6xKuO9CVnO1Sni1J1a9CE0ziRxe0uURFatYSNhB1kRehAYacaZMgU81G9ru0nMxeDTePhUzEr+wZQsF/1VWSVWmU/xlgTCPO57AZJSuXIvy4fT9zaAVOcDmNucV4rUTys9cxj5cY3adbKRq+/xFoNxRd72f8AR0PPB3pXuDZK7XqLg5S6ZbgJmJHDNf+yfwyFd/kS4wCsh7W5JRShoeMA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(53546011)(33656002)(316002)(86362001)(36756003)(6916009)(6512007)(71200400001)(6506007)(2616005)(54906003)(5660300002)(8936002)(66946007)(66446008)(6486002)(478600001)(186003)(91956017)(8676002)(83380400001)(2906002)(66556008)(64756008)(966005)(76116006)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1tpEVgT5UZ6UoeVdfSPMOj6egc6YQRfNqfi+ZzAEY5i55nyp8fhGuqO4JJM8Rce1G2EEJzX391qiYlF4oGk0Mpzm52jWjfsCABcNO1ia//da4tp6wLAFojtgQ0udPw6483KPDLn8PidKcjxZLiV/rdSGFx0z2Q9BYl/wvPwxRpxtfq1ZIGQvE1YIJ4WI95shtK4AIQv+BO6cnFA1wu256aVOdGQyMc8ocsSY9Ch3bRFHRpu/w3gv6QqYR4rHXzCQQZb/Xzq9Nen57UP8MGrdUJB8p/qj/z4zroxw6ponNmYdzU6bs8X7hirZTmSFmWo4+CwWeJM1HAcceKKLY1yWR+qkyvH2lvIbPStTsZmP3zkxEG3SU29jzwpElI1sPo6aI0gliMMsZt3VeEiUruCyvVTDNEgje3/TCbLD12xT8NiE7HEcuHfGxNmV+Tx8k9NBcR10W8pRicYMkNyRdh9FfzSVrBAEuuyHC91FyrxaskCB9CorWIFLuo9psA4X7rl6zH/wrDm5j6CrbpM0UmtKokWrRLKcSodXqpYuzHdQAqXfr+kL/xh4dhE2L4uapZGmEAbP4O8gX2+e3CezLUND5dD9H05EGqBvjJOdbUQWOPI6T3gXBfUo7zxlEIXEaY24bVXz/EH5VGhQiFanCwCCvw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <433FD72A91F6094C9CB76A926EBA2003@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4823
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3a9a3a94-1714-422a-91bb-08d850c04142
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJ3yEk5Qk+EIw5oTOlprmfuMqre6COWeTfsNmDoejsumkz/B/5L/g3QUrJR5tnnyHfM3uQ5ZdSp/j4/430TuVKdjBUtY5Ts4gI0GfvkVpxX6VfnFf492qx5ZQFm7d+1RdN9y3DNl3yRBNPuSToHbF/PGrB+tOiDfXQRwpumRbhDG7yAP+LsgDzF4D1XqZM0EkKdnOu4wNEgkmxh/znP5+SEAxusYUCsfmeOdL1ZrvrZv9HFNjSt2EDA0h37hmIJZrLawBHufbUDguR00HgU3k5zUxB82fhtRrDHzb41un5BtiWxHU59/7BXBuESUTHUt6i1Q+gEtg/WTD0txKfplxOZAlxX8HL/7BPp2GB6FTh472lb1fAmg9+9EzofSURPNzK7pOV/PnoJl5auXNMxs9XmjuouB1FZSQmYwAHKJR5FmOzLJITW1H3B+Fw6595mkBtZAxwxnRuKt/VKtKuiLhZd4oFWLGi6xYE4+Pn44tBY=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(6512007)(86362001)(70586007)(70206006)(53546011)(2616005)(6506007)(83380400001)(82310400003)(36756003)(356005)(82740400003)(54906003)(81166007)(47076004)(8936002)(6862004)(478600001)(316002)(33656002)(6486002)(5660300002)(8676002)(36906005)(186003)(4326008)(2906002)(336012)(966005)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 10:50:32.9752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2328b114-6299-4e7f-87b6-08d850c0590c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5129
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gNCBTZXAgMjAyMCwgYXQgMTE6NDMsIEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiA0IFNlcCAyMDIwLCBh
dCAxMToyMCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+IA0KPj4g
T24gMDQuMDkuMjAyMCAxMTo1NCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+PiBBdCB0aGUgY29t
bXVuaXR5IGNhbGwgbGFzdCBtb250aCBhcyB3ZWxsIGFzIHRoaXMsIHdlIGRpc2N1c3NlZCB3aGV0
aGVyIHRvIGNvbnRpbnVlIHRoZSDigJxHaXRsYWIgZXhwZXJpbWVudOKAnS4gIEl0IHdhcyBnZW5l
cmFsbHkgYWdyZWVkIHRoYXQgcmV2aWV3aW5nIEp1ZXJnZW7igJlzIGxvbmcgc2VyaWVzIHdhcyBm
YWlybHkgc3ViLW9wdGltYWwsIGFuZCB0aGF0IGVtYWlsIHdhcyBtb3JlIHN1aXRlZCB0byB0aGF0
IHNvcnQgb2Ygc2VyaWVzLg0KPj4+IA0KPj4+IFRoYXQgc2FpZCwgdGhlcmUgd2FzIGdlbmVyYWwg
YWdyZWVtZW50IHRoYXQgcmVxdWlyaW5nIGFsbCBwYXRjaGVzIHRvIGdvIHRocm91Z2ggZW1haWwg
d2FzIGdvaW5nIHRvIGxpbWl0IGNvbnRyaWJ1dGlvbiwgcGFydGljdWxhcmx5IG9mIG9uZS1vZmYg
4oCcZHJpdmUtYnnigJ0gY29udHJpYnV0aW9ucy4gIEFzIHN1Y2gsIGl0IHdhcyBwcm9wb3NlZCB0
aGF0IHdlIGNvbnNpZGVyIGFsbG93aW5nIGJvdGggR2l0bGFiIFBScywgYW5kIGVtYWlsOiB0aGF0
IGZvciBvbmUtb2ZmIG9yIHNob3J0IHNlcmllcywgR2l0bGFiIFBScyB3b3VsZCBiZSBhY2NlcHRl
ZCwgYnV0IHRoYXQgZm9yIGxvbmdlciBzZXJpZXMgYW5kL29yIGxvbmdlciB0ZXJtIGNvbnRyaWJ1
dG9ycywgd2Ugd291bGQgZW5jb3VyYWdlIHBlb3BsZSB0byBzd2l0Y2ggdG8gcGF0Y2hib21iaW5n
IHRoZSBtYWlsaW5nIGxpc3QuDQo+Pj4gDQo+Pj4gV2UgZGVjaWRlZCB0byBjb250aW51ZSB0aGUg
4oCcR2l0bGFiIEV4cGVyaW1lbnTigJ0sIGJ1dCB3aXRoIHNob3J0IFBScy4gIEFzIHN1Y2gsIEFu
ZHkgQ29vcGVyIGhhcyBwb3N0ZWQgdHdvIFBSczoNCj4+PiANCj4+PiBodHRwczovL2dpdGxhYi5j
b20veGVuLXByb2plY3QveGVuLy0vbWVyZ2VfcmVxdWVzdHMvMg0KPj4gDQo+PiBUaGlzIGxvb2tz
IHRvIGJlIGNvbmZ1c2luZywgdG8gbWUgYXQgbGVhc3QuIEZvbGxvd2luZyB0aGlzIGxpbmsgSQ0K
Pj4gY2FuJ3Qgc2VlIHRoZSBhY3R1YWwgY2hhbmdlIGRpcmVjdGx5LiBGb2xsb3dpbmcgZWl0aGVy
IG9mIHRoZSBsaW5rcw0KPj4gYWZ0ZXIgIlJlcXVlc3QgdG8gbWVyZ2UiIGdpdmVzIGEgNDA0IGVy
cm9yIChhZnRlciBnaXRsYWIgbm90IGJlaW5nDQo+PiBhYmxlIHRvIHNpZ24gbWUgaW4gdmlhIEdv
b2dsZSwgYnV0IHRoZW4gYmVpbmcgYWJsZSB0byBzaWduIG1lIGluDQo+PiB2aWEgZ2l0aHViKSBv
biBib3RoDQo+PiANCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5k
eWhocC94ZW4NCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWho
cC94ZW4vLS90cmVlL3hlbi1wdi1zZWdiYXNlDQo+IA0KPiBJIHRoaW5rIHlvdSBtaXNzZWQgb24g
dG9wIHRoZSDigJxDb21taXRz4oCdIGFuZCDigJxDaGFuZ2VzIg0KPiANCj4gSnVzdCBjbGljayBv
biBjaGFuZ2VzIGFuZCB5b3Ugd2lsbCBzZWUgdGhlIGRpZmYgb3Igb24gY29tbWl0IGFuZCB0aGVu
IHlvdSB3aWxsIHNlZSB0aGUgd2hvbGUgdGhpbmcuDQo+IA0KPj4gDQo+PiBUaGVyZSdzIGFsc28g
YW4gZW5kbGVzc2x5IGNpcmNsaW5nIGtpbmQtb2YtaWNvbiBuZXh0IHRvICJDaGVja2luZw0KPj4g
cGlwZWxpbmUgc3RhdHVzIiwgaW5kaWNhdGluZyB0byBtZSB0aGUgcGFnZSB0cmllcyB0byBsb2Fk
IHNvbWUNCj4+IGluZm9ybWF0aW9uLCBidXQgY2FuJ3QgcXVpdGUgY29tcGxldGUgZG9pbmcgc28u
DQo+IA0KPiBJIGhhdmUgdGhlIHNhbWUgaGVyZS4NCj4gDQo+PiANCj4+IEkgYWxzbyB3b25kZXIg
aG93IG9uZSBpcyB0byBiZWNvbWUgYXdhcmUgb2YgcGVuZGluZyBtZXJnZSByZXF1ZXN0cy4NCj4+
IEZvciB0aGUgb25lcyBoZXJlLCB5b3VyIG1haWwgd2FzIHRoZSBvbmx5IGluZGljYXRpb24gc28g
ZmFyIHRoYXQNCj4+IHRoZXkgZXhpc3RlZC4gSSBob3BlIHRoZSBhbnN3ZXIgdG8gdGhpcyBpcyBu
b3QgZ29pbmcgdG8gYmUgdG8gcG9sbA0KPj4gZ2l0bGFiLmNvbS4gSSdtIHNvcnJ5IGlmIEknbSBt
YWtpbmcgbmV3YmllIG1pc3Rha2VzIG9yIGFzc3VtcHRpb25zDQo+PiBoZXJlLCBidXQgYXMgZmFy
IGFzIGdpdGxhYiBnb2VzIEknbSBhZnJhaWQgSSBhbS4NCj4gDQo+IE9uIG90aGVyIGdpdGxhYiBw
cm9qZWN0cyAoZm9yIGV4YW1wbGUgWGVuLUZ1c2EpLCBpIHJlY2VpdmUgbWFpbHMgZnJvbSBnaXRs
YWINCj4gd2hlbiB0aGVyZSBpcyBhIHB1bGwgcmVxdWVzdCBhbmQgaSBhbHNvIHNlZSBhIGxpc3Qg
b2YgcGVuZGluZyByZXF1ZXN0cyB3aGVuDQo+IEkgZ28gdG8gbXkgdGhlIGZ1c2EgZ2l0bGFiIGFj
Y291bnQuDQo+IA0KPiANCj4gDQo+PiANCj4+IEFzIGl0IHN0YW5kcyBJJ20gYWZyYWlkIEknbGwg
YmUgYWJsZSB0byBzZWUgd2hhdCBpcyBwcm9wb3NlZCB0byBiZQ0KPj4gY29tbWl0dGVkIChhbmQg
YWZhaWNzIGFsc28gYXBwcm92ZWQgYWxyZWFkeSkgb25seSB3aGVuIGl0IGhpdHMgdGhlDQo+PiBz
dGFnaW5nIHRyZWUuDQo+IA0KPiBJIHRyaWVkIHRvIGFkZCBhIGNvbW1lbnQgYW5kIHRoYXQgaXMg
d29ya2luZyB3ZWxsDQo+IA0KPiBSZW1hcmtzIGZyb20gbXkgc2lkZToNCj4gLSBIb3cgY2FuIGkg
YWNrL3Rlc3QvcmVqZWN0IG9uIHRoaXMgPw0KDQphbnN3ZXIgbXlzZWxmIGFzIGkgZm91bmQgdGhl
IHRodW1icyB1cCB0aGF0IGkgaGF2ZSB0byBjbGljayA6LSkNCg0KPiAtIEkgZm91bmQgbm8gd2F5
IHRvIHB1dCBhIOKAnGdsb2JhbOKAnSBjb21tZW50IG9yIHRvIHB1dCBhIGNvbW1lbnQgb24gdGhl
IGNvbW1pdCBtZXNzYWdlLCBkaWQgSSBtaXNzIHNvbWV0aGluZyA/DQo+IA0KPiBCZXJ0cmFuZA0K
PiANCj4+IA0KPj4gSmFuDQo+PiANCj4+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3Qv
eGVuLy0vbWVyZ2VfcmVxdWVzdHMvMw0KPj4+IA0KPj4+IEFuZCBJ4oCZZCBlbmNvdXJhZ2Ugb3Ro
ZXJzIHRvIHRyeSBzdWJtaXR0aW5nIHNpbXBsZSBvbmUtb3ItdHdvLXBhdGNoIHNlcmllcyBhcyBQ
UnMgdG8gR2l0bGFiIGluc3RlYWQsIGFzIHdlIGNvbnRpbnVlIHRoZSBleHBlcmltZW50Lg0KPj4+
IA0KPj4+IC1HZW9yZ2UNCg0K

