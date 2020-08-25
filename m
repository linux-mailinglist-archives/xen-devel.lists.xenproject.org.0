Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAED251672
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAW15-0002gV-Fa; Tue, 25 Aug 2020 10:17:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvT3=CD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAW13-0002gP-9x
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:17:21 +0000
X-Inumbo-ID: 879e91bb-f7a8-4000-a89b-3b810c61e23b
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 879e91bb-f7a8-4000-a89b-3b810c61e23b;
 Tue, 25 Aug 2020 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S/5j9a/YyG5MzeyWtfVruiCfV1sFnE/kzZW4KXlYqM=;
 b=liO2LAPe51xWSrNCkWM3ru6Un1HslBoVc4Xeq7ivuucU0GBGYGJNYQiC8enZMv6AkKMQhsSpVfsb+K+Yxb726SmIZ+aBPIzeL0cM4p8JWKK2O4bJSer6XdaZSOIg4IgvbG+peR1XEyYeYpmw6qPKQmq4r8UbRdW6XC9Ivs5j0VQ=
Received: from DB6P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::28) by
 DB7PR08MB3514.eurprd08.prod.outlook.com (2603:10a6:10:49::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.26; Tue, 25 Aug 2020 10:17:17 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::13) by DB6P191CA0018.outlook.office365.com
 (2603:10a6:6:28::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 10:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:17:17 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 25 Aug 2020 10:17:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6fa04c5ae81643a
X-CR-MTA-TID: 64aa7808
Received: from 9077ae706144.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93805B48-68AB-42C0-A7E5-25854738BA24.1; 
 Tue, 25 Aug 2020 10:17:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9077ae706144.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 10:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORbNUVBQWO3nFV3S0x3seWdRUtlZE5Y7CMWC8SFPH95wsl3vwe3p12PgUtLV8g+IeUlR0PMwMWqNvZw4JkA3fbJXWluSoyy9e2QrvFBp/rP1jfUQ2ZktOrIWQnlSdXq3nkAztuvcFho3QcBuUTpd2ooIXxS9B+Mt/LjsZ2PHO6eH8PNm+SJfdt/AsDfJEKbKfJaIKbTY+EjO3+7DGKpcZ1TMbhIXJ+oLgSsCYauThtMokXVDkMrZncpjNL9tWu5Xz+NMg1gYnRWoj5J8lcrCqtVBEEUAtC9ZJjPq1NMbY0XAXS3/7Tw7zyAEJyBvRNAtBbEibmqmKclqaWWn5py3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S/5j9a/YyG5MzeyWtfVruiCfV1sFnE/kzZW4KXlYqM=;
 b=dcWhk+CqR37VwjfPdnYff14HnchFhYzEVt6p+5Zb+QqvOTCTfWZNhmOxe7rGBJt/1vPqwup9athMI9wz9Grcb8l2OZXPDaHv9EcfD0x36zmB9EXNlb9DcJNeLRhfC6pSd4ZZmLi9OLaOZuWaAarsIV7npLgBzGbNHMan6YrTrpz0LlmY+MiRRfNpQNTHoICV684g6tDDKcSgMDyx8wXT6ZmItel8OCGDhpNCJsVLqmzh2MEWjRH6p7fHNoUm7hgWQcDG6jkygwmNNS7tc74JEJjMWxvlivRxGNslJAp66tHh4l1JIXzIRkbEsmWm2opw6VB0NQ1Y6yTPVK5puSyGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S/5j9a/YyG5MzeyWtfVruiCfV1sFnE/kzZW4KXlYqM=;
 b=liO2LAPe51xWSrNCkWM3ru6Un1HslBoVc4Xeq7ivuucU0GBGYGJNYQiC8enZMv6AkKMQhsSpVfsb+K+Yxb726SmIZ+aBPIzeL0cM4p8JWKK2O4bJSer6XdaZSOIg4IgvbG+peR1XEyYeYpmw6qPKQmq4r8UbRdW6XC9Ivs5j0VQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2295.eurprd08.prod.outlook.com (2603:10a6:4:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 10:17:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 10:17:10 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, nd <nd@arm.com>
Subject: Re: Kconfig vs tool chain capabilities
Thread-Topic: Kconfig vs tool chain capabilities
Thread-Index: AQHWeqm1rojPQ5A/KUSCBM6rLJEMwalIaPuAgAAF9YCAAAK5gIAAAUmAgAAFm4CAAAsfgIAAEPWAgAAH04A=
Date: Tue, 25 Aug 2020 10:17:10 +0000
Message-ID: <B6E80F54-20D1-4ABF-AA19-8B3D0566DA7B@arm.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
 <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
 <61d2adc1-c28f-7ed6-237e-45444249173c@suse.com>
 <cf7e8e5f-de4b-3046-8ffc-7ae4502d06c9@suse.com>
 <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
In-Reply-To: <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc6e9a34-e29a-4031-a692-08d848e00b3e
x-ms-traffictypediagnostic: DB6PR0802MB2295:|DB7PR08MB3514:
X-Microsoft-Antispam-PRVS: <DB7PR08MB3514F0B1C1385A1A88C582CE9D570@DB7PR08MB3514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2QXwDIiUbYqlmdMGNfbZSzIRFYxu1EYbbdqeKuR1QU93HEjintoozWlXGPvBdMTj+gWbBkbyWP3x8ebGgl4p0NB1kjPFsGKwKmqj3hGn4j1n+1p2Aig1vR8xPXx+mL5e2Scdqy+OJOVNQENqg7A/3oORfT0i6HdznTOHrGWvaCJKqPzOcByJvk+8oj0qCnivkeVyEU9C7EY7ewAULGnscfOtm/m+rrqzwtWKyLkmx816YPz9C1A2ahj19XJT8Dbydxe3SwZ3LPLhJTo/uWbTpGBTHNcSinIAj37xZdPvqWCC2JhW/aaiYI56XVd+PDj1CObnJTYt26uOe+hjOT7cxUjRoFV4fPywy+d0NW2i29ZtseReNDnyEHK881L2rUx/
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(53546011)(54906003)(6916009)(71200400001)(4326008)(2906002)(6506007)(91956017)(66946007)(76116006)(186003)(316002)(64756008)(2616005)(66446008)(66556008)(66476007)(478600001)(26005)(66574015)(8676002)(33656002)(5660300002)(6512007)(8936002)(86362001)(36756003)(6486002)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: gmc39xl6x+5447sVkXKPmXpEmcDowkFxDau4gQJMZ3/5Dzas+nQrd6RUvUVzsUFc/RFNjoueTWTEImhUQPOsLWG9wK9Mq4sqAgP5CQmrp0RBbErbl3QtwWX/dxBjQsIhFSEA8M2Ths9h2l4OL8UNvdkXTuMSGisWTCfTeLATdlGTK8bp+Wd4t0KtWbk4kB0HPVonL5Cdp1J7XiNJQ+ctdCUKgPRj/yx/LFvxDMvLzLx6CD/neWM5Fw9Jti2y9WS3OU8Vog8Z8mhP4bo3GlSnrEWLuriAhJc7MjFYhpbOx84unucVtmW3fkK542s8TMCAqdlMqchTY/Q/XpgFrODaTzeN/rW3yF/4RP8pEKm8Q+e3EgFFjqMNlOgJ3JXMSFNseXTsO7i+a+f14gSVs9T84v2i0rRF+5VUIAd0dPAvTH0hBmOt60I1thEnYhVaoW9QSvPTHIhgMljS9YKzKxG5ATWpzCAs7yAiI1esivTQ8bwh9x2HgY5iYo6HNaMbFGaazuh4Ad1A7gStyvOYX29fRTZ/Db3nYHDgRvFzlkZIjlV8VpUlwilH/U/U7mSCQXocDvXxKGKj8ZflRu6P2lNRGC3VaYtqm24X6WqQpsX8QHoRC0eaaMkV4attLQ/KZSFfUjJosvhqGhkAHpKpCGDsaw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <41CD25FA9DDD4643A311DDC9AACBBADF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2295
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2581935e-a651-4ba1-fe44-08d848e0074f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZ0vDa9ljvpE9rG0xq2PB8QOBmk+F55KdJRZV19O0CSHd1PPHtn5V17PWaimkqxpn+p/mOZ1e6GDLk05TTaKOxb44+18xle/FXXCY2EynQLl2GJXnZKQg5HNYyGcCu87f3jSUDztWshuXU0AAPkBWMi9fFeDUZUSGRYpopX00FFpJQNJuU2W5PyE3r9n5+jhA5AK3zeE3Z9eFmZvH3WiWYgUkFGTE1wGPyBnVguFmGipNb7/dqhTZl+YhJ60gPjWYilrDm2R4Jath8JAHkiQUpAMe6qDBxA0oSJiFmd2JowEIcwGCPgbZFv9WGbTyOfIKfOtS4H/zPJ7/1f+3AhohIx9p12nq6TsRn0e1N0HI7WT2b42GAfdJWEVoEXqDQ7qbqeqO5iUmxtweWp3JxWdER9MVy4Z8qjPF+9qwsNl1Jw=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(8936002)(47076004)(478600001)(82740400003)(82310400002)(186003)(6512007)(6486002)(356005)(33656002)(2616005)(81166007)(4326008)(2906002)(336012)(6862004)(70206006)(8676002)(86362001)(26005)(54906003)(5660300002)(53546011)(6506007)(36756003)(316002)(83380400001)(66574015)(70586007)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 10:17:17.1374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6e9a34-e29a-4031-a692-08d848e00b3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3514
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDEwOjQ5LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDguMjAgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4gT24gMjUuMDguMjAyMCAxMDowOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAy
NS4wOC4yMCAwOTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDI1LjA4LjIwMjAgMDk6
NDMsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+PiBPbiAyNS4wOC4yMCAwOTozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMjUuMDguMjAyMCAwOToxMiwgSsO8cmdlbiBHcm/DnyB3
cm90ZToNCj4+Pj4+Pj4gSSB0aGluayBib3RoIHByb2JsZW1zIGNhbiBiZSBzb2x2ZWQgYXQgdGhl
IHNhbWUgdGltZSB2aWEgdGhlIGZvbGxvd2luZw0KPj4+Pj4+PiBhcHByb2FjaDoNCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IC0gY29sbGVjdCB0aGUgZGF0YSB3aGljaCBpcyByZWZsZWN0ZWQgaW4gdG9kYXkn
cyBDT05GSUdfIHZhcmlhYmxlcyBpbiBhDQo+Pj4+Pj4+ICAgICAgc2luZ2xlIHNjcmlwdCBhbmQg
c3RvcmUgaXQgaW4gYSBmaWxlLCBlLmcgaW4gYSBmb3JtYXQgbGlrZToNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+ICAgICAgQ0NfSVNfR0NDIHkNCj4+Pj4+Pj4gICAgICBHQ0NfVkVSU0lPTiA3MDUwMA0KPj4+
Pj4+PiAgICAgIENMQU5HX1ZFUlNJT04gMA0KPj4+Pj4+PiAgICAgIENDX0hBU19WSVNJQklMSVRZ
X0FUVFJJQlVURSB5DQo+Pj4+Pj4+IA0KPj4+Pj4+PiAtIGNoZWNrIHRoZSB0b29sIGRhdGEgYXQg
ZWFjaCBidWlsZCB0byBtYXRjaCB0aGUgY29udGVudHMgb2YgdGhhdCBmaWxlDQo+Pj4+Pj4+ICAg
ICAgYW5kIGVpdGhlciBmYWlsIHRoZSBidWlsZCBvciB1cGRhdGUgdGhlIGZpbGUgYW5kIHJlcnVu
IGtjb25maWcgaWYgdGhleQ0KPj4+Pj4+PiAgICAgIGRvbid0IG1hdGNoIChJIHRoaW5rIGZhaWxp
bmcgdGhlIGJ1aWxkIGFuZCByZXF1aXJpbmcgdG8gcnVuIGENCj4+Pj4+Pj4gICAgICAibWFrZSBj
b25maWciIHdvdWxkIGJlIHRoZSBiZXR0ZXIgYXBwcm9hY2gpDQo+Pj4+Pj4+IA0KPj4+Pj4+PiAt
IGZpbGwgdGhlIENPTkZJR18gdmFyaWFibGUgY29udGVudHMgZnJvbSB0aGF0IGZpbGUgaW4ga2Nv
bmZpZyBpbnN0ZWFkDQo+Pj4+Pj4+ICAgICAgb2YgaXNzdWluZyB0aGUgc2luZ2xlIHNoZWxsIGNv
bW1hbmRzDQo+Pj4+Pj4gDQo+Pj4+Pj4gV2hpbGUgSSBhZ3JlZSB0aGlzIGlzIGEgcG9zc2libGUg
bW9kZWwgdG8gdXNlIChidXQgc3RpbGwgbm90IHRoZQ0KPj4+Pj4+IG9uZSB3ZSd2ZSBpbmhlcml0
ZWQgZnJvbSBMaW51eCksIEkgZmFpbCB0byBzZWUgaG93IHRoaXMgYWRkcmVzc2VzDQo+Pj4+Pj4g
bXkgImRldmVsb3BlcnMgc2hvdWxkIGJlIGF3YXJlIG9mIHdoYXQgdGhleSBkbyAobm90KSBidWls
ZCBhbmQNCj4+Pj4+PiB0ZXN0IiBjb25jZXJuOiBUaGVyZSdkIHN0aWxsIGJlIGRlcGVuZGVuY2ll
cyBvZiBLY29uZmlnIG9wdGlvbnMNCj4+Pj4+PiBvbiB0aGUgdG9vbCBjaGFpbiBjYXBhYmlsaXRp
ZXMsIGFuZCB0aGVpciBwcm9tcHRzIHRoZXJlZm9yZSB3b3VsZA0KPj4+Pj4+IHN0aWxsIGJlIGlu
dmlzaWJsZSB3aXRob3V0IHRoZSB0b29sIGNoYWluIGhhdmluZyB0aGUgbmVlZGVkDQo+Pj4+Pj4g
Y2FwYWJpbGl0aWVzLiBJT1cgSSBvbmx5IHNlZSB0aGlzIHRvIGFkZHJlc3MgMiksIGJ1dCBub3Qg
MSkuDQo+Pj4+PiANCj4+Pj4+IFNvcnJ5LCBJIGZhaWwgdG8gc2VlIGEgcHJvYmxlbSBoZXJlLg0K
Pj4+Pj4gDQo+Pj4+PiBXaGF0IHNlbnNlIGRvZXMgaXQgbWFrZSB0byBiZSBhYmxlIHRvIGNvbmZp
Z3VyZSBhbiBvcHRpb24gd2hpY2ggdGhlDQo+Pj4+PiB0b29scyBkb24ndCBzdXBwb3J0Pw0KPj4+
PiANCj4+Pj4gVGFrZSBDRVQgYXMgYW4gZXhhbXBsZSAoY2hvc2VuIGJlY2F1c2UgdGhhdCdzIHRo
ZSBvbmUgd2hpY2gNCj4+Pj4gYWxyZWFkeSB1c2VzIHRoZSBLY29uZmlnIGFwcHJvYWNoLCBkZXNw
aXRlIG15IGRpc2FncmVlbWVudCk6IEl0J3MNCj4+Pj4gcXVpdGUgcmVsZXZhbnQgdG8ga25vdyB3
aGV0aGVyIHlvdSdyZSB0ZXN0aW5nIFhlbiB3aXRoIGl0IGVuYWJsZWQsDQo+Pj4+IG9yIHdpdGgg
aXQgZGlzYWJsZWQgKGFuZCBoZW5jZSB5b3UgcG90ZW50aWFsbHkgbWlzc2luZyBjaGFuZ2VzIHlv
dQ0KPj4+PiBuZWVkIHRvIG1ha2UgdG8gcmVsZXZhbnQgY29kZSBwb3J0aW9ucykuDQo+Pj4gDQo+
Pj4gQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBhc3N1bWluZyBteSBzdWdnZXN0ZWQgY2hh
bmdlcyBiZWluZyBtYWRlLA0KPj4+IHdvdWxkbid0IGEgLmNvbmZpZyBmaWxlIHNldHVwIG9uY2Ug
d2l0aCBDRVQgZW5hYmxlZCAoYW5kIEkgYXNzdW1lIHlvdSdkDQo+Pj4gdHJ5IHRvIGVuYWJsZSBD
RVQgb24gcHVycG9zZSB3aGVuIHRyeWluZyB0byB0ZXN0IENFVCBhbmQgeW91J2QgcmVhbGl6ZQ0K
Pj4+IG5vdCBiZWluZyBhYmxlIHRvIGRvIHNvIGluIGNhc2UgeW91ciB0b29scyBkb24ndCBzdXBw
b3J0IENFVCkgZW5zdXJlDQo+Pj4geW91J2QgbmV2ZXIgYmVlbiBoaXQgYnkgc3VycHJpc2Ugd2hl
biBzb21lIHRvb2wgdXBkYXRlcyB3b3VsZCByZW1vdmUNCj4+PiBDRVQgc3VwcG9ydD8NCj4+IFBy
b2JhYmx5LCBidXQgdGhhdCdzIG5vdCBteSBwb2ludC4gV2l0aCBhIENFVC1pbmNhcGFibGUgdG9v
bCBjaGFpbg0KPj4geW91J3JlIG5vdCBwcm9tcHRlZCB3aGV0aGVyIHRvIGVuYWJsZSBDRVQgaW4g
dGhlIGZpcnN0IHBsYWNlLCB3aGVuDQo+PiBjcmVhdGluZyB0aGUgaW5pdGlhbCAuY29uZmlnLiBJ
dCBpcyB0aGlzIHVuYXdhcmVuZXNzIG9mIGEgY3J1Y2lhbA0KPj4gcGFydCBvZiBjb2RlIG5vdCBn
ZXR0aW5nIGJ1aWx0IGFuZCB0ZXN0ZWQgKGFuZCBsaWtlbHkgdW5rbm93aW5nbHkpDQo+PiB0aGF0
IEkgZGlzbGlrZS4gSW4gZmFjdCwgYWZ0ZXIgQW5kcmV3J3MgcGF0Y2hlcyBoYWQgZ29uZSBpbiwg
aXQNCj4+IGhhZCB0YWtlbiBtZSBhIHdoaWxlIHRvIHJlYWxpemUgdGhhdCBpbiBjZXJ0YWluIG9m
IG15IGJ1aWxkcyBJIGRvbid0DQo+PiBoYXZlIENFVCBlbmFibGVkIChkZXNwaXRlIG1lIGhhdmlu
ZyBkb25lIG5vdGhpbmcgdG8gZGlzYWJsZSBpdCksIGFuZA0KPj4gaGVuY2UgdGhvc2UgYnVpbGRz
IHdvcmtpbmcgZmluZSBhcmUgbWVhbmluZ2xlc3MgZm9yIGFueSBjaGFuZ2VzDQo+PiBhZmZlY3Rp
bmcgQ0VUIGNvZGUgaW4gYW55IHdheS4NCj4gDQo+IFllcywgdGhpcyBpcyB0aGUgcmVzdWx0IG9m
IGxldHRpbmcgc29tZSBvcHRpb25zIGRlcGVuZCBvbiBvdGhlcnMuDQo+IA0KPiBUaGlzIGlzIHdo
YXQgSSBtZWFudCByZWdhcmRpbmcgdGhlIGFyY2hpdGVjdHVyZTogdGhlcmUgYXJlIGUuZy4gbXVs
dGlwbGUNCj4gc291cmNlIGZpbGVzIGluIGRyaXZlcnMvY2hhci8gYmVpbmcgYnVpbHQgb25seSBm
b3IgQVJNIG9yIFg4NiwgaW4gc3BpdGUNCj4gb2YgYmVpbmcgbG9jYXRlZCBvdXRzaWRlIGFyY2gv
LiBBbmQgeWV0IHlvdSBkb24ndCBzZWUgdGhpcyBhcyBhIHByb2JsZW0sDQo+IGV2ZW4gaWYgeW91
IGFyZSBub3QgYWJsZSB0byBzZWxlY3QgdGhvc2UgZHJpdmVycyB0byBiZSBidWlsdCB3aGVuIHVz
aW5nDQo+ICJ0aGUgb3RoZXIiIGFyY2guIFRoZXkgYXJlIHNpbGVudGx5IGRpc2FibGVkLiBKdXN0
IGxpa2UgQ0VUIGluIGNhc2Ugb2YNCj4gYW4gaW5jYXBhYmxlIHRvb2wgY2hhaW4uDQo+IA0KPiBT
byBJTU8gZWl0aGVyIHdlIGJhbiAiZGVwZW5kcyBvbiIgZnJvbSBvdXIgS2NvbmZpZyBmaWxlcyAo
bm8sIEkgZG9uJ3QNCj4gd2FudCB0byBkbyB0aGF0KSwgb3Igd2UgdXNlIGl0IGFzIGRlc2lnbmVk
IGFuZCBtYWtlIGl0IGFzIHVzZXIgZnJpZW5kbHkNCj4gYXMgcG9zc2libGUuIEluIGNhc2Ugd2Ug
YXMgZGV2ZWxvcGVycyBoYXZlIGEgc3BlY2lhbCB0ZXN0IGNhc2UgdGhlbiB3ZQ0KPiBuZWVkIHRv
IGNoZWNrIHRoZSAuY29uZmlnIHdoZXRoZXIgdGhlIGRlc2lyZWQgc2V0dGluZ3MgYXJlIHJlYWxs
eQ0KPiBwcmVzZW50LiBIYXZpbmcgdGhvc2Ugc2V0dGluZ3MgZGVwZW5kaW5nIG9uIHRvb2wgY2Fw
YWJpbGl0aWVzIGluIGENCj4gc3BlY2lmaWMgZmlsZSB3aWxsIG1ha2UgdGhpcyBjaGVjayBtdWNo
IGVhc2llci4NCj4gDQo+IEFuZCBCVFcsIEkgY2FuJ3Qgc2VlIGhvdyBzZXR0aW5nIHRoZSB0b2xs
cycgY2FwYWJpbGl0aWVzIGZyb20gZS5nLg0KPiBhcmNoL3g4Ni9SdWxlcy5tayBpcyBiZXR0ZXIg
aW4gYW55IHdheSAoc2VlIGhvdyBDT05GSUdfSU5ESVJFQ1RfVEhVTksNCj4gZ290IGl0cyB2YWx1
ZSBpbiBvbGRlciBYZW4gdmVyc2lvbnMgbGlrZSA0LjEyKS4NCj4gDQo+IFdlIGNhbid0IGhhdmUg
ZXZlcnl0aGluZyBhbmQgSSBiZWxpZXZlIGF1dG9tYXRpY2FsbHkgZGlzYWJsaW5nIGZlYXR1cmVz
DQo+IHdoaWNoIGNhbid0IHdvcmsgd2l0aCB0aGUgY3VycmVudCB0b29scyBpcyBhIHNhbmUgZGVj
aXNpb24uIERvaW5nIHRoaXMNCj4gdmlhIEtjb25maWcgaXMgdGhlIGJldHRlciBhcHByb2FjaCBj
b21wYXJlZCB0byBNYWtlZmlsZSBzbmlwbGV0cyBJTU8uDQoNClRoYXQgc291bmRzIGxpa2UgYSBu
aWNlIGZlYXR1cmUgdG8gaGF2ZSBzb21lIGNvbXBpbGVyIG9yIHRvb2xzIG9wdGlvbnMgdGhhdA0K
Y2FuIGJlIHNlbGVjdGVkIG9yIGFjdGl2YXRlZCBpbiBLY29uZmlnLiBUaGVyZSBhcmUgc29tZSBj
b21waWxlciBvcHRpb25zDQptYW5kYXRvcnkgdG8gaGFuZGxlIHNvbWUgZXJyYXRhcyBvciBYU0Eg
dGhhdCBvbmUgbWlnaHQgd2FudCB0byBleHBsaWNpdGVseQ0Kc2VsZWN0Lg0KDQpJIGFtIGJpdCB1
bnN1cmUgYWJvdXQgdGhlIHBhcnQgd2hlcmUgc29tZSBrY29uZmlnIG9wdGlvbnMgd291bGQgb25s
eQ0KYmUgYXZhaWxhYmxlIG9yIG5vdCBkZXBlbmRpbmcgb24gc29tZSB0ZXN0cyB3aXRoIHRoZSBj
b21waWxlciBiZWluZyBkb2luZw0KcHJpb3IgdG8gb3BlbmluZyB0aGUgZWRpdG9yLiBJIHdvdWxk
IGd1ZXNzIHRoZSBtZW51Y29uZmlnIHByb2Nlc3Mgd291bGQNCmhhdmUgdG8gZmlyc3QgcnVuIHNv
bWUgdGVzdHMgYW5kIHRoZW4gZ2VuZXJhdGVkIHNvbWUgSEFTXyBjb25maWd1cmF0aW9uDQpvcHRp
b25zIGRlcGVuZGluZyBvbiB0aGUgcmVzdWx0IG9mIHRoZSB0ZXN0cy4NCkRpZCBpIGdvdCB0aGUg
aWRlYSByaWdodCBoZXJlID8NCklzIHRoaXMgc29tZXRoaW5nIHNvbWVib2R5IHRyaWVkIHRvIGRv
ID8NCg0KQXMgYSB1c2VyIEkgd291bGQgbW9yZSBleHBlY3QgdGhhdCB0aGUgYnVpbGQgcHJvY2Vz
cyB3b3VsZCB0ZWxsIG1lIHRoYXQgbXkNCmNvbmZpZ3VyYXRpb24gaXMgaW52YWxpZCBiZWNhdXNl
IGkgc2VsZWN0ZWQgc29tZXRoaW5nIHRoYXQgaXMgbm90IHN1cHBvcnRlZA0KYnkgbXkgY29tcGls
ZXIuIEkgbWlnaHQgaGF2ZSB0aGUgY2hhbmNlIHRvIGp1c3QgZml4IG15IGJ1aWxkIHRvIHVzZSB0
aGUgcmlnaHQNCmNvbXBpbGVyIChsaWtlIGJ5IG1pc3Rha2UgdXNpbmcgeDg2IHRvb2xjaGFpbiB0
byBjb21waWxlIGZvciBhcm0pLg0KDQpXZSBzaG91bGQgYWxzbyBiZSBjYXJlZnVsIG5vdCB0byBz
aWxlbnRseSBpZ25vcmUgc29tZSBjb25maWd1cmF0aW9uIG9wdGlvbiBpZg0Kb25lIGlzIGNoYW5n
aW5nIHRoZSBjb21waWxlciBhbmQgdGhlIG5ldyBvbmUgZG9lcyBub3Qgc3VwcG9ydCBhbiBvcHRp
b24uDQpBIHVzZXIgd291bGQgaGF2ZSBoaXMgY29uZmlndXJhdGlvbiBhbmQgY29tcGlsZSB1c2lu
ZyBpdCB3aXRob3V0DQpwYXNzaW5nIHRocm91Z2ggdGhlIGVkaXRvciBpbnRlcmZhY2UgYW5kIG1p
Z2h0IG5lZWQgdG8gYmUgYXdhcmUgdGhhdCBhIHBhcnQNCm9mIGhpcyBjb25maWd1cmF0aW9uIGlz
IG5vdCB2YWxpZCBhbnltb3JlIGJlY2F1c2UgdGhlIHRvb2xzIGhlIGlzIHVzaW5nIGNoYW5nZWQu
DQpUaGlzIGlzIHNvbWV0aGluZyB0aGF0IGNvdWxkIG9jY3VyIGEgbG90IHdoZW4gdXNpbmcgYSBk
aXN0cmlidXRpb24gdG9vbGNoYWluLg0KDQpBbHNvIHRoZXJlIGFyZSBzb21lIGNvbXBpbGVyIG9w
dGlvbiBjaGFuZ2luZyBzbyBpIHdvdWxkIG1vcmUgdGhpbmsgdGhhdA0KdGhlcmUgc2hvdWxkIGJl
IGdlbmVyaWMgY29uZmlndXJhdGlvbiBvcHRpb25zIHNvIHRoYXQgaW4gdGhlIG1ha2VmaWxlcyB3
ZQ0KY291bGQgaGF2ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gYWRkIGRpZmZlcmVudCBjb21waWxlciBv
cHRpb25zIGZvciBkaWZmZXJlbnQNCnRvb2xjaGFpbnMgZGVwZW5kaW5nIG9uIHRoZSB2ZXJzaW9u
IG9yIHRoZSB0eXBlIG9mIHRoZSB0b29sY2hhaW4uDQoNClRvIGJlIGNsZWFyIGkgd291bGQgc2Vl
IHNvbWV0aGluZyBsaWtlOg0KDQppbiBrY29uZmlnOg0KQ09NUElMRVJfT1BUSU9OX1hYWA0KCWJv
b2wg4oCcYWN0aXZhdGUgWFhYIGNvbXBpbGVyIGZsYWcNCg0KaW4gTWFrZWZpbGU6DQppZmVxICgk
KENPTkZJR19DT01QSUxFUl9PUFRJT05fWFhYKSwgdHJ1ZSkNCnRlc3RfY29tcGlsZXJfY3h4Og0K
CSQoQ0MpIC14eHggZHVtbXkuYyAtbyBkdW1teSB8fCAkKGVycm9yIFlvdXIgY29tcGlsZXIgZG9l
cyBub3Qgc3VwcG9ydCAteHh4KQ0KDQpjYy1mbGFncyArPSAteHh4DQplbmRpZg0KDQpUaGUgc3lu
dGF4IGlzIHdyb25nIGhlcmUgYnV0IHlvdSBnZXQgdGhlIGlkZWEgOi0pDQoNClJlZ2FyZHMNCkJl
cnRyYW5kDQoNCg0K

