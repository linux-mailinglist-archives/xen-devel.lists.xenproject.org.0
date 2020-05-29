Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002861E7F7F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:03:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefaw-0004qs-DC; Fri, 29 May 2020 14:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jefav-0004qn-AG
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:02:45 +0000
X-Inumbo-ID: 111e2da6-a1b5-11ea-81bc-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 111e2da6-a1b5-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97AUB9UKezqq0E2Ia39v4XMDJZMNKBJzPcztESS3ZLw=;
 b=KnJuUgwBKRJ8ixOuCx4uTHcjonG97/fv3DoUCvKM6dAJONh08RG6aQHsbsqXArYwlD/EWzlfIqS3e8vNlj8jDmypQ2WvkLhk/Yyn3mCnXUfmDJ4I19VWJ/xvLS5y9nM8QJEXh04QkMp/F+7f9nRqEmfOl+G+zfm89BuePXgwO9Q=
Received: from AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24)
 by VE1PR08MB4704.eurprd08.prod.outlook.com (2603:10a6:802:b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 14:02:41 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::d9) by AM6PR08CA0012.outlook.office365.com
 (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 14:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 14:02:40 +0000
Received: ("Tessian outbound 952576a3272a:v57");
 Fri, 29 May 2020 14:02:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3674b68a6b74deb4
X-CR-MTA-TID: 64aa7808
Received: from 8d5c88b0e0b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81A0429F-B201-4597-B761-C634A939EFB6.1; 
 Fri, 29 May 2020 14:02:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d5c88b0e0b7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 14:02:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0dGsYGgGgc4OjFT40K13gA2Jtv/oKjchl5s+K7CoZypLszutEhvW2ptprPsIRSAlC+A9oqeAdkyPhrvTHULK5AACa48VLOxYBhsdOOW1GmKiT3kKwyrFkA/g8uLVz5GKiHP3kWunzbpUHBXkvQDZuqrmk83D1jEQd48RgdGuSSYfPr9kBgyO8f5wOxdBYxnrqwudYBbidw0WTmCF7+LJTtb+QWEkOHQssPhNFMfmQv6gL+YD4T9IjsrVWd8e69KT9OipemRY2bNkEkVkXpJ/tRciflqtpzksHudjwffrFqC8ZJhQX0eC5UaM+IIDVUHme+bKZ+Yt7ydPLPYCaX21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97AUB9UKezqq0E2Ia39v4XMDJZMNKBJzPcztESS3ZLw=;
 b=gz5ScWkhWlQgY6v4EI48oSHgL2q3gOv9NwNXJ2tFp8ZKDSR1E6GZsVSMS3ySI05GHdWILqoD7kHrADtJ/HjEEb2gbkIi0IKLc0Xj0sk3ocPRttdrE4uH8SrvCK4/GTglDmveCsZuMh8ysdxnH0BSXgPA5/SXZAkSx9k8eVxuCtbhZSxBg9OQ+PcfEHW/mwmOYbGJxAqQMG+3s0XauNTfU5HQHdYy7pVXkgPufeEjy293hKJWevgiRD4XSvguA1CdDJuCocf9MtJcKbTJvTu/gTmVcDnScvU1rNvLzK506+DSFPzJGzi/OrAKe+1Io2u6MG1ZRdi4uqE8XEuGBHIy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97AUB9UKezqq0E2Ia39v4XMDJZMNKBJzPcztESS3ZLw=;
 b=KnJuUgwBKRJ8ixOuCx4uTHcjonG97/fv3DoUCvKM6dAJONh08RG6aQHsbsqXArYwlD/EWzlfIqS3e8vNlj8jDmypQ2WvkLhk/Yyn3mCnXUfmDJ4I19VWJ/xvLS5y9nM8QJEXh04QkMp/F+7f9nRqEmfOl+G+zfm89BuePXgwO9Q=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2969.eurprd08.prod.outlook.com (2603:10a6:5:20::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 14:02:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 14:02:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADfWQCAABkLAIAASFMA
Date: Fri, 29 May 2020 14:02:29 +0000
Message-ID: <1CEE9707-3201-4218-ACF0-7829181A769C@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <07a1008d-1acb-aab6-ab10-176e7856a296@xen.org>
In-Reply-To: <07a1008d-1acb-aab6-ab10-176e7856a296@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5fb8be7-504c-4a90-4e45-08d803d8f3c6
x-ms-traffictypediagnostic: DB7PR08MB2969:|VE1PR08MB4704:
X-Microsoft-Antispam-PRVS: <VE1PR08MB470442EA9056F214D97843749D8F0@VE1PR08MB4704.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 16YTx18od4txer2tIq2kdoab00SFEHFksLnUkSRPFlz8+9pBraih9kJBULszL8UI6UKvTjZyS2wC+mIlysf+ApvNBSCWovrYpuAk/dezFuNS645q1VwSfAfLYoH4VmrseyxPDT9UyvhZiAGsSuWeSwFKSLxICYLtL1/UzlobSRRpJfmAQkv8N3wBSTdDlXjBo14WVY6A0S97MlLED6ndT9FQ/vD13GJCPa+CbW8+KemYUCbWKsXfx0bStRI5iBypfT0mys9cM/Ckl2iJu4M6zjIROPMBwSWN4mr3d3Nk1CI6/3NgPU2BAujaOZTKKIspNcX2CRkC5yxhcUWY3MDypLNUJQ3j9cvKIduti7mKwmf/dH6fSv4wX8hcmxPytWH6
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(76116006)(91956017)(66556008)(66946007)(5660300002)(8936002)(316002)(2906002)(66476007)(7416002)(33656002)(71200400001)(54906003)(4326008)(6512007)(83380400001)(2616005)(6916009)(8676002)(36756003)(26005)(6486002)(53546011)(86362001)(478600001)(64756008)(66446008)(6506007)(186003)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Zu63oOBVPjXvm5GyTPkG18IF6UZhdDzMqFdpTdCX6MrYt9pzeIQ1KdxAzrzatvKLzp7N6c3W2wRW1v+xT+c4vVnkhDVi4gwbuPGsjqIT4xdlNcUCGWbdoHTS3zsSIPRkOptYUiAwrQl8iMYKZqMYgOg9CHnk9Tj2KI74pwfS5ng8m8lHQdmNLvHv6YG3hkAs8Cj7iLdW/F3a4CwQqzWtpP8pOgElo9Bo3cSbdqOQN9IKjWJemiVbm1Ogx1aiGSQeN+RRgJXipxV2jchpkeAK2wAP4u/tQE+vCBiDECTyhGLndkDmGyucS8pZ7kgyto4d9b8cHOuqhez1J2psNynZ5AygZ/k+iwCM6WrdilolmpV+ycJ+jLNmyJ+HNBbUjVxKC2WemFiHEhiCsNrRmYwLWlSMlHKWqQtfmKsNCQSIb9mlyARe1/YQubP2aP8pk+8K2TErgG+XDT9ORwONaqQW74AOkFlPypj7gksLub7/HRTkeBLnG0pkPtRe3y1of90S
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2D19437BD76B5468E1A2354D8E6845D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2969
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(6862004)(186003)(356005)(47076004)(4326008)(81166007)(82740400003)(6486002)(54906003)(33656002)(86362001)(316002)(36906005)(82310400002)(26005)(6512007)(6506007)(53546011)(70586007)(8936002)(478600001)(70206006)(2616005)(5660300002)(336012)(8676002)(2906002)(36756003)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cd43441c-4198-4322-2e61-08d803d8ecfd
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BltN9VW8GKGq6yYWpgVlYo9vx0A3TiBvRF5QcyJdfu9J+AxxoCNbah4KYFFqSLWZatXeCKYTuCvM/IFvBJbSxqz/mayBPaKtxwLUJ+G54Jp8soWh1jr0CChRJ6XpX0GgvHpZ2Yb7xF0iZAcpnFmKWE7f4zZUaD35BqVwgKI6OBa3bvnGQrKMETNl6dx+968m1/TpqMnyQlIPSx0I8kGb/Aiis6/WsgQec5etuynHsI9ik/2CFxBACsAwYpQe9LhX2UuuoPJbZdrb9YYuQFUjdrM5L2rnNRmNuneT88n2atB0HXVkjcBtooTW7iUfKcKcgy2NhItn9ZPL6xajKL+S3/a8rkOCh/CwmC3oCUALpJcxlhvNRYI+DDKXZDMiSnqfQEK2NdlGbCkFnUYUAKQXS2t5VRLOV/JQrKfWkMRSQFc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 14:02:40.9844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fb8be7-504c-4a90-4e45-08d803d8f3c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4704
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjkgTWF5IDIwMjAsIGF0IDEwOjQzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gMjkvMDUvMjAyMCAwOTox
MywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4+PiBPbiAyOCBNYXkg
MjAyMCwgYXQgMTk6NTQsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+
IA0KPj4+IEhpIEJlcnRyYW5kLA0KPj4+IA0KPj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0K
Pj4+IA0KPj4+IE9uIDI4LzA1LzIwMjAgMTY6MjUsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+
Pj4+IEF0IHRoZSBtb21lbnQgb24gQXJtLCBhIExpbnV4IGd1ZXN0IHJ1bm5pbmcgd2l0aCBLVFBJ
IGVuYWJsZWQgd2lsbA0KPj4+PiBjYXVzZSB0aGUgZm9sbG93aW5nIGVycm9yIHdoZW4gYSBjb250
ZXh0IHN3aXRjaCBoYXBwZW5zIGluIHVzZXIgbW9kZToNCj4+Pj4gKFhFTikgcDJtLmM6MTg5MDog
ZDF2MDogRmFpbGVkIHRvIHdhbGsgcGFnZS10YWJsZSB2YSAweGZmZmZmZjgzN2ViZTBjZDANCj4+
Pj4gVGhpcyBwYXRjaCBpcyBtb2RpZnlpbmcgcnVuc3RhdGUgaGFuZGxpbmcgdG8gbWFwIHRoZSBh
cmVhIGdpdmVuIGJ5IHRoZQ0KPj4+PiBndWVzdCBpbnNpZGUgWGVuIGR1cmluZyB0aGUgaHlwZXJj
YWxsLg0KPj4+PiBUaGlzIGlzIHJlbW92aW5nIHRoZSBndWVzdCB2aXJ0dWFsIHRvIHBoeXNpY2Fs
IGNvbnZlcnNpb24gZHVyaW5nIGNvbnRleHQNCj4+Pj4gc3dpdGNoZXMgd2hpY2ggcmVtb3ZlcyB0
aGUgYnVnDQo+Pj4gDQo+Pj4gSXQgd291bGQgYmUgZ29vZCB0byBzcGVsbCBvdXQgdGhhdCBhIHZp
cnR1YWwgYWRkcmVzcyBpcyBub3Qgc3RhYmxlLiBTbyByZWx5aW5nIG9uIGl0IGlzIHdyb25nLg0K
Pj4+IA0KPj4+PiBhbmQgaW1wcm92ZSBwZXJmb3JtYW5jZSBieSBwcmV2ZW50aW5nIHRvDQo+Pj4+
IHdhbGsgcGFnZSB0YWJsZXMgZHVyaW5nIGNvbnRleHQgc3dpdGNoZXMuDQo+Pj4gDQo+Pj4gV2l0
aCBTZWNyZXQgZnJlZSBoeXBlcnZpc29yIGluIG1pbmQsIEkgd291bGQgbGlrZSB0byBzdWdnZXN0
IHRvIG1hcC91bm1hcCB0aGUgcnVuc3RhdGUgZHVyaW5nIGNvbnRleHQgc3dpdGNoLg0KPj4+IA0K
Pj4+IFRoZSBjb3N0IHNob3VsZCBiZSBtaW5pbWFsIHdoZW4gdGhlcmUgaXMgYSBkaXJlY3QgbWFw
IChpLmUgb24gQXJtNjQgYW5kIHg4NikgYW5kIHN0aWxsIHByb3ZpZGUgYmV0dGVyIHBlcmZvcm1h
bmNlIG9uIEFybTMyLg0KPj4gRXZlbiB3aXRoIGEgbWluaW1hbCBjb3N0IHRoaXMgaXMgc3RpbGwg
YWRkaW5nIHNvbWUgbm9uIHJlYWwtdGltZSBiZWhhdmlvdXIgdG8gdGhlIGNvbnRleHQgc3dpdGNo
Lg0KPiANCj4gSnVzdCB0byBiZSBjbGVhciwgYnkgbWluaW1hbCBJIG1lYW50IHRoZSBtYXBwaW5n
IHBhcnQgaXMganVzdCBhIHZpcnRfdG9fbWZuKCkgY2FsbCBhbmQgdGhlIHVubWFwcGluZyBpcyBh
IE5PUC4NCj4gDQo+IElITU8sIGlmIHZpcnRfdG9fbWZuKCkgZW5kcyB1cCB0byBhZGQgbm9uLVJU
IGJlaGF2aW9yIHRoZW4geW91IGhhdmUgbXVjaCBiaWdnZXIgcHJvYmxlbSB0aGFuIGp1c3QgdGhp
cyBjYWxsLg0KPiANCj4+IEJ1dCBkZWZpbml0ZWx5IGZyb20gdGhlIHNlY3VyaXR5IHBvaW50IG9m
IHZpZXcgYXMgd2UgaGF2ZSB0byBtYXAgYSBwYWdlIGZyb20gdGhlIGd1ZXN0LCB3ZSBjb3VsZCBo
YXZlIGFjY2Vzc2libGUgaW4gWGVuIHNvbWUgZGF0YSB0aGF0IHNob3VsZCBub3QgYmUgdGhlcmUu
DQo+PiBUaGVyZSBpcyBhIHRyYWRlIGhlcmUgd2hlcmU6DQo+PiAtIHhlbiBjYW4gcHJvdGVjdCBi
eSBtYXAvdW5tYXBwaW5nDQo+PiAtIGEgZ3Vlc3Qgd2hpY2ggd2FudHMgdG8gc2VjdXJlIGhpcyBk
YXRhIHNob3VsZCBlaXRoZXIgbm90IHVzZSBpdCBvciBtYWtlIHN1cmUgdGhlcmUgaXMgbm90aGlu
ZyBlbHNlIGluIHRoZSBwYWdlDQo+IA0KPiBCb3RoIGFyZSB2YWxpZCBhbmQgZGVwZW5kcyBvbiB5
b3VyIHNldHVwLiBPbmUgbWF5IHdhbnQgdG8gcHJvdGVjdCBhbGwgdGhlIGV4aXN0aW5nIGd1ZXN0
cywgc28gbW9kaWZ5aW5nIGEgZ3Vlc3QgbWF5IG5vdCBiZSBhIHNvbHV0aW9uLg0KDQpUaGUgZmFj
dCB0byBtYXAvdW5tYXAgaXMgaW5jcmVhc2luZyB0aGUgcHJvdGVjdGlvbiBidXQgbm90IHJlbW92
aW5nIHRoZSBwcm9ibGVtIGNvbXBsZXRlbHkuDQoNCj4gDQo+PiBUaGF0IHNvdW5kcyBsaWtlIGEg
dGhyZWFkIGxvY2FsIHN0b3JhZ2Uga2luZCBvZiBwcm9ibGVtYXRpYyB3aGVyZSB3ZSB3YW50IGRh
dGEgZnJvbSB4ZW4gdG8gYmUgYWNjZXNzaWJsZSBmYXN0IGZyb20gdGhlIGd1ZXN0IGFuZCBlYXN5
IHRvIGJlIG1vZGlmaWVkIGZyb20geGVuLg0KPiANCj4gQWdyZWUuIE9uIHg4NiwgdGhleSBoYXZl
IGEgcGVyZG9tYWluIG1hcHBpbmcgc28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gZG8gaXQuIFdl
IHdvdWxkIG5lZWQgdG8gYWRkIHRoZSBmZWF0dXJlIG9uIEFybS4NCg0KVGhhdCB3b3VsZCBkZWZp
bml0ZWx5IGJlIGNsZWFuZXIuDQoNCj4gDQo+Pj4gDQo+Pj4gVGhlIGNoYW5nZSBzaG91bGQgYmUg
bWluaW1hbCBjb21wYXJlIHRvIHRoZSBjdXJyZW50IGFwcHJvYWNoIGJ1dCB0aGlzIGNvdWxkIGJl
IHRha2VuIGNhcmUgc2VwYXJhdGVseSBpZiB5b3UgZG9uJ3QgaGF2ZSB0aW1lLg0KPj4gSSBjb3Vs
ZCBhZGQgdGhhdCB0byB0aGUgc2VyaWUgaW4gYSBzZXBhcmF0ZSBwYXRjaCBzbyB0aGF0IGl0IGNh
biBiZSBkaXNjdXNzZWQgYW5kIHRlc3Qgc2VwYXJhdGVseSA/DQo+IA0KPiBJZiB5b3UgYXJlIHBp
Y2tpbmcgdGhlIHRhc2ssIHRoZW4gSSB3b3VsZCBzdWdnZXN0IHRvIGFkZCBpdCBkaXJlY3RseSBp
biB0aGlzIHBhdGNoLg0KDQpJIHdpbGwgc2VlIHRoYXQgYnV0IHRoZSBkaXNjdXNzaW9uIGlzIGxl
YWRpbmcgbW9yZSBvbiBhIHJlc3VsdCB3aGVyZSB3ZSBhY2NlcHQgdGhlIGN1cnJlbnQgc3RhdHVz
Lg0KDQo+IA0KPj4+IA0KPj4+PiAtLQ0KPj4+PiBJbiB0aGUgY3VycmVudCBzdGF0dXMsIHRoaXMg
cGF0Y2ggaXMgb25seSB3b3JraW5nIG9uIEFybSBhbmQgbmVlZHMgdG8NCj4+Pj4gYmUgZml4ZWQg
b24gWDg2IChzZWUgI2Vycm9yIG9uIGRvbWFpbi5jIGZvciBtaXNzaW5nIGdldF9wYWdlX2Zyb21f
Z3ZhKS4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFy
cXVpc0Bhcm0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gIHhlbi9hcmNoL2FybS9kb21haW4uYyAgIHwg
MzIgKysrKysrKysrLS0tLS0tLQ0KPj4+PiAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgfCA1MSAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+Pj4+ICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICB8
IDg0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+Pj4+ICB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCB8IDExICsrKystLQ0KPj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCAx
MjQgaW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+Pj4gaW5kZXggMzEx
NjkzMjZiMi4uNzk5YjBlMDEwMyAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bi5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4+PiBAQCAtMjc4LDMzICsy
NzgsMzcgQEAgc3RhdGljIHZvaWQgY3R4dF9zd2l0Y2hfdG8oc3RydWN0IHZjcHUgKm4pDQo+Pj4+
ICAvKiBVcGRhdGUgcGVyLVZDUFUgZ3Vlc3QgcnVuc3RhdGUgc2hhcmVkIG1lbW9yeSBhcmVhIChp
ZiByZWdpc3RlcmVkKS4gKi8NCj4+Pj4gIHN0YXRpYyB2b2lkIHVwZGF0ZV9ydW5zdGF0ZV9hcmVh
KHN0cnVjdCB2Y3B1ICp2KQ0KPj4+PiAgew0KPj4+PiAtICAgIHZvaWQgX191c2VyICpndWVzdF9o
YW5kbGUgPSBOVUxMOw0KPj4+PiAtICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gcnVuc3Rh
dGU7DQo+Pj4+ICsgICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3RhdGU7DQo+Pj4+
ICAtICAgIGlmICggZ3Vlc3RfaGFuZGxlX2lzX251bGwocnVuc3RhdGVfZ3Vlc3QodikpICkNCj4+
Pj4gKyAgICAvKiBYWFggd2h5IGRvIHdlIGFjY2VwdCBub3QgdG8gYmxvY2sgaGVyZSAqLw0KPj4+
PiArICAgIGlmICggIXNwaW5fdHJ5bG9jaygmdi0+cnVuc3RhdGVfZ3Vlc3RfbG9jaykgKQ0KPj4+
PiAgICAgICAgICByZXR1cm47DQo+Pj4+ICAtICAgIG1lbWNweSgmcnVuc3RhdGUsICZ2LT5ydW5z
dGF0ZSwgc2l6ZW9mKHJ1bnN0YXRlKSk7DQo+Pj4+ICsgICAgcnVuc3RhdGUgPSBydW5zdGF0ZV9n
dWVzdCh2KTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmIChydW5zdGF0ZSA9PSBOVUxMKQ0KPj4+PiAr
ICAgIHsNCj4+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnYtPnJ1bnN0YXRlX2d1ZXN0X2xvY2sp
Ow0KPj4+PiArICAgICAgICByZXR1cm47DQo+Pj4+ICsgICAgfQ0KPj4+PiAgICAgICAgaWYgKCBW
TV9BU1NJU1Qodi0+ZG9tYWluLCBydW5zdGF0ZV91cGRhdGVfZmxhZykgKQ0KPj4+PiAgICAgIHsN
Cj4+Pj4gLSAgICAgICAgZ3Vlc3RfaGFuZGxlID0gJnYtPnJ1bnN0YXRlX2d1ZXN0LnAtPnN0YXRl
X2VudHJ5X3RpbWUgKyAxOw0KPj4+PiAtICAgICAgICBndWVzdF9oYW5kbGUtLTsNCj4+Pj4gLSAg
ICAgICAgcnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSB8PSBYRU5fUlVOU1RBVEVfVVBEQVRFOw0K
Pj4+PiAtICAgICAgICBfX3Jhd19jb3B5X3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZSwNCj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKSgmcnVuc3RhdGUuc3RhdGVfZW50cnlf
dGltZSArIDEpIC0gMSwgMSk7DQo+Pj4+ICsgICAgICAgIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90
aW1lIHw9IFhFTl9SVU5TVEFURV9VUERBVEU7DQo+Pj4+ICAgICAgICAgIHNtcF93bWIoKTsNCj4+
PiANCj4+PiBCZWNhdXNlIHlvdSBzZXQgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSBiZWxv
dywgdGhlIHBsYWNlbWVudCBvZiB0aGUgYmFycmllciBzZWVtcyBhIGJpdCBvZGQuDQo+Pj4gDQo+
Pj4gSSB3b3VsZCBzdWdnZXN0IHRvIHVwZGF0ZSB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1l
IGZpcnN0IGFuZCB0aGVuIHVwZGF0ZSBydW5zdGF0ZS0+c3RhdGVfZW50cnlfdGltZS4NCj4+IFdl
IGRvIHdhbnQgdGhlIGd1ZXN0IHRvIGtub3cgd2hlbiB3ZSBtb2RpZnkgdGhlIHJ1bnN0YXRlIHNv
IHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoZSBYRU5fUlVOU1RBVEVfVVBEQVRFIGlzIGFjdHVhbGx5
IHNldCBpbiBhIHZpc2libGUgd2F5IGJlZm9yZSB3ZSBkbyB0aGUgbWVtY3B5Lg0KPj4gVGhhdOKA
mXMgd2h5IHRoZSBiYXJyaWVyIGlzIGFmdGVyLg0KPiANCj4gSSB0aGluayB5b3UgbWlzdW5kZXJz
dG9vZCBteSBjb21tZW50IGhlcmUuIEkgbWVhbnQgdG8gd3JpdGUgdGhlIGZvbGxvd2luZyBjb2Rl
Og0KPiANCj4gdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSA9IC4uLg0KPiBydW5zdGF0ZS0+
c3RhdGVfZW50cnlfdGltZSA9IC4uLg0KPiBzbXBfd21iKCkNCj4gDQo+IFNvIGl0IGlzIG11Y2gg
Y2xlYXJlciB0aGF0IHRoZSBiYXJyaWVyIGlzIGJlY2F1c2UgcnVuc3RhdGUtPnN0YXRlX2VudHJ5
X3RpbWUgbmVlZHMgdG8gYmUgdXBkYXRlZCBiZWZvcmUgdGhlIG1lbWNweSgpLg0KPiANCj4+Pj4g
Kw0KPj4+PiArI2lmZGVmIENPTkZJR19BUk0NCj4+Pj4gKyAgICBwYWdlID0gZ2V0X3BhZ2VfZnJv
bV9ndmEodiwgYXJlYS0+YWRkci5wLCBHVjJNX1dSSVRFKTsNCj4+PiANCj4+PiBBIGd1ZXN0IGlz
IGFsbG93ZWQgdG8gc2V0dXAgdGhlIHJ1bnN0YXRlIGZvciBhIGRpZmZlcmVudCB2Q1BVIHRoYW4g
dGhlIGN1cnJlbnQgb25lLiBUaGlzIHdpbGwgbGVhZCB0byBnZXRfcGFnZV9mcm9tX2d2YSgpIHRv
IGZhaWwgYXMgdGhlIGZ1bmN0aW9uIGNhbm5vdCB5ZXQgd29yayB3aXRoIGEgdkNQVSBvdGhlciB0
aGFuIGN1cnJlbnQuDQo+PiBJZiB0aGUgYXJlYSBpcyBtYXBwZWQgcGVyIGNwdSBidXQgaXNu4oCZ
dCB0aGUgYWltIG9mIHRoaXMgdG8gaGF2ZSBhIHdheSB0byBjaGVjayBvdGhlciBjcHVzIHN0YXR1
cyA/DQo+IA0KPiBUaGUgYWltIGlzIHRvIGNvbGxlY3QgaG93IG11Y2ggdGltZSBhIHZDUFUgaGFz
IGJlZW4gdW5zY2hlZHVsZWQuIFRoaXMgZG9lc24ndCBoYXZlIHRvIGJlIHJ1biBmcm9tIGEgZGlm
ZmVyZW50IHZDUFUuDQo+IA0KPiBBbnl3YXksIG15IHBvaW50IGlzIHRoZSBoeXBlcmNhbGwgYWxs
b3dzIGl0IHRvZGF5LiBJZiB5b3Ugd2FudCB0byBtYWtlIHN1Y2ggcmVzdHJpY3Rpb24sIHRoZW4g
d2UgbmVlZCB0byBhZ3JlZSBvbiBpdCBhbmQgZG9jdW1lbnQgaXQuDQo+IA0KPj4+IA0KPj4+IEFG
QUlDVCwgdGhlcmUgaXMgbm8gcmVzdHJpY3Rpb24gb24gd2hlbiB0aGUgcnVuc3RhdGUgaHlwZXJj
YWxsIGNhbiBiZSBjYWxsZWQuIFNvIHRoaXMgY2FuIGV2ZW4gYmUgY2FsbGVkIGJlZm9yZSB0aGUg
dkNQVSBpcyBicm91Z2h0IHVwLg0KPj4gSSB1bmRlcnN0YW5kIHRoZSByZW1hcmsgYnV0IGl0IHN0
aWxsIGZlZWxzIHZlcnkgd2VpcmQgdG8gYWxsb3cgYW4gaW52YWxpZCBhZGRyZXNzIGluIGFuIGh5
cGVyY2FsbC4NCj4+IFdvdWxkbuKAmXQgd2UgaGF2ZSBhIGxvdCBvZiBwb3RlbnRpYWwgaXNzdWVz
IGFjY2VwdGluZyBhbiBhZGRyZXNzIHRoYXQgd2UgY2Fubm90IGNoZWNrID8NCj4gDQo+IFdlbGws
IHRoYXQncyB3aHkgeW91IHNlZSBlcnJvcnMgd2hlbiB1c2luZyBLUFRJIDspLiBJZiB5b3UgdXNl
IGEgZ2xvYmFsIG1hcHBpbmcsIHRoZW4gaXQgaXMgbm90IHBvc3NpYmxlIHRvIGNvbnRpbnVlIHdp
dGhvdXQgdmFsaWRhdGluZyB0aGUgYWRkcmVzcy4NCj4gDQo+IEJ1dCB0byBkbyB0aGlzLCB5b3Ug
d2lsbCBoYXZlIHRvIHB1dCByZXN0cmljdGlvbiBvbiB0aGUgaHlwZXJjYWxscy4gSSB3b3VsZCBi
ZSBPSyB0byBtYWtlIHN1Y2ggcmVzdHJpY3Rpb24gb24gQXJtLg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

