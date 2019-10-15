Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD51D808B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 21:50:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKSn4-0006OQ-Sp; Tue, 15 Oct 2019 19:47:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKSn3-0006OL-P7
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 19:47:29 +0000
X-Inumbo-ID: 9cce1700-ef84-11e9-bbab-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cce1700-ef84-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 19:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6wHIzwmUje14Vjr2J1xsMZaMQ+++uRyRMTYR+/tt7g=;
 b=Kdsa1R3g+4jS+IIZtrkrVi0N2OuyVXaBvzsD8yfg94KmQSvToN441zLvtsjTcfpQt8CxBVRa0xZTmnR2cPjfPvyfcNSLXIu8YfvIsAM0JXHPDyVzAFR8AT7XZN48+ysWcO9EXMMt8rV4L9c0uXbTxlcZYdpFCHiPctYgtRI/PcI=
Received: from AM4PR08CA0069.eurprd08.prod.outlook.com (2603:10a6:205:2::40)
 by HE1PR0802MB2331.eurprd08.prod.outlook.com (2603:10a6:3:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Tue, 15 Oct
 2019 19:47:19 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by AM4PR08CA0069.outlook.office365.com
 (2603:10a6:205:2::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 19:47:19 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 19:47:18 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Tue, 15 Oct 2019 19:47:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 800c975a8f6cfb7e
X-CR-MTA-TID: 64aa7808
Received: from b2e860b0b4e8.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06D42375-D81C-4A48-9D67-4DDB15C1B3AA.1; 
 Tue, 15 Oct 2019 19:47:06 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2e860b0b4e8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 19:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGjObBlxnu0CcDglbEyEN2LTdt1NyptD+TalLszXFGarxVs3CLfmXu52FwGU2xVPQm86h+NbpMM9bkCtVEuWqm2Csbk0Wfak/IAociyrO325S6EL9P915ABQIIT73E8u7w9bvtoaGB+b0KuHybb2P01j0E3IVZ+EvGhz+xyeitBW/U+W40+Gij3CUZQdswA82XU60IHdpXkBMydIxQTDj6bmYjnfUW4Mr/BR8AeIJSRyaQK+oGbmwgpoV0zkJiz73CVznnmxK9xDtuarViKWI6osM4Qrr5FsBtUXA37LL2XPIjT7Nvj+QqMp0510FkuuKezUIrUeqUgsbFK/YV4HCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6wHIzwmUje14Vjr2J1xsMZaMQ+++uRyRMTYR+/tt7g=;
 b=Z0Uqy8vGCB5KWx3nnVobmx0tg6Dr6OTnmGrRQVCzjrwCCl3FyMONmNFH20jObJprAjfW5lTjH4paRxOl2TdGdsPL1xU8taDCgtjGxAOIH8QDV/Ml9k2IgfW4u4K5adUjIPXkgBLqiL30TbhHoQ86tnCh0ZJ8aQ54nLVSahUGusr7gct6sWgOD/djhu/QH5M+tpTIF1V8qGxX1fLb+xhzNrYJkieE28T1nkLcBDk/+wZzpvFJhMk6IrHRANXINmVKUJsc+4L5gyl8ZCx9exaErU2gdDiFFOM3sst5JhnMuDdaVMVq5B4mPQGy3g6GtQnMzhTT96GGCmPaUoLK/txfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6wHIzwmUje14Vjr2J1xsMZaMQ+++uRyRMTYR+/tt7g=;
 b=Kdsa1R3g+4jS+IIZtrkrVi0N2OuyVXaBvzsD8yfg94KmQSvToN441zLvtsjTcfpQt8CxBVRa0xZTmnR2cPjfPvyfcNSLXIu8YfvIsAM0JXHPDyVzAFR8AT7XZN48+ysWcO9EXMMt8rV4L9c0uXbTxlcZYdpFCHiPctYgtRI/PcI=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4521.eurprd08.prod.outlook.com (20.179.43.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 19:47:04 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 19:47:04 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH for-4.13] xen/arm: Don't use _end in is_xen_fixed_mfn()
Thread-Index: AQHVg467lwMKdvMkWkmKN32oZFn8VqdcG4KA
Date: Tue, 15 Oct 2019 19:47:04 +0000
Message-ID: <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 526dd56f-7e7c-4218-d23e-08d751a87c9c
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DBBPR08MB4521:|HE1PR0802MB2331:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB233177E0D16D477BB753021880930@HE1PR0802MB2331.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(199004)(189003)(51444003)(8676002)(7736002)(6116002)(14454004)(14444005)(3846002)(31686004)(71200400001)(256004)(305945005)(478600001)(7416002)(316002)(2906002)(229853002)(66946007)(6436002)(71190400001)(6246003)(8936002)(81166006)(81156014)(64756008)(66476007)(66556008)(66446008)(6486002)(31696002)(44832011)(476003)(86362001)(6512007)(25786009)(36756003)(66066001)(102836004)(6916009)(4326008)(6506007)(386003)(99286004)(26005)(53546011)(2616005)(54906003)(76176011)(486006)(446003)(52116002)(5660300002)(11346002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4521;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: VT8DZjvFRXcWlSd8Z8u2EwHj/QzULeZ7MmW7zNkouJL6tISpPPdiZvYhEpV9QeSqbLa6Hb2QBhOPkLEqq+s421Q45HEaUhBngPk3ZscQTlVA75H/QixJje1q0wgqb1EMYLtNKx0zyIJHhuJySOOjwRHXxu0fE6WHEeK6sglTOdU7k1dPrGknJhZv4O3eRTwTtst/c7BwLBm3EIRwstNDT8aG6nFnqewLKXr/+J+VmK5XbPBavsKqOTEYZhKba4nq6XeJOIXjgkLCWuVQyH7kPuSzgfC+US4AdAW9Rryiq0/fTxglH48tDIY8aheqWGk1fj1IS/W2YrvxgLzB7boisBqTDoEdWiRRyReMX2ztCqH9DrLJav50GAoMm5iiQfeXmLfgZ356lBY5LWcAEjg/B68QOOW8TE6Mf8RGPxW8Z5o=
x-ms-exchange-transport-forked: True
Content-ID: <F322D1CA9C8DD5498C10AD38C1278CBB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4521
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(199004)(189003)(51444003)(63350400001)(36756003)(70206006)(76130400001)(446003)(436003)(70586007)(8936002)(2616005)(316002)(81166006)(81156014)(8676002)(22756006)(11346002)(47776003)(5660300002)(476003)(66066001)(86362001)(126002)(31696002)(305945005)(2906002)(7736002)(4326008)(6246003)(76176011)(336012)(23676004)(14444005)(2486003)(26826003)(6512007)(54906003)(486006)(25786009)(478600001)(99286004)(14454004)(6862004)(26005)(186003)(386003)(6506007)(53546011)(31686004)(102836004)(6116002)(3846002)(229853002)(356004)(6486002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2331;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aee4ed2f-cef7-4dda-a097-08d751a87460
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIPG/tVJDzOceWw/E3nXO7D9PCQbq4Gy/GQMfvlBicnbBHHXVS4dmHgcEpANrdALgMrjkI8ltbPp174BnCVBF2avLi2H0O5Z9usJG7ih7ILQ3h9Tq+gBDR5u0xauQZI4SlN5dAXgbrqFldeWO98RExgx+7K5CB2Dnw6OTw4Zhr6SXu6NtJFc6GINVG3QlTibA7MkoJiQPqTJQtq74d412WHu6RpsmkBF7lC4FXvF3kk5FoRDO2U839kkJD3lK5QZiCmW4xn77sNzzTC30hTZi1PW+he+TJV0+2IEqFVwwt7ylTYiuZZBAbCrpjIuMq312wgz1Z8wiNdIgvb+A14gyemHMx9miMCF/JL/Rz4Vz12e6r0LqyIx6zCS2A52vEJIV2StNOZduO/RShLZKoq7+F+pgcPnYQYjxGzJtyTP2TI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 19:47:18.2550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 526dd56f-7e7c-4218-d23e-08d751a87c9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2331
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDE1LzEwLzIwMTkgMjA6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVHVlLCAxNSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gdmlydF90b19tYWRk
cigpIGlzIHVzaW5nIHRoZSBoYXJkd2FyZSBwYWdlLXRhYmxlIHdhbGsgaW5zdHJ1Y3Rpb25zIHRv
DQo+PiB0cmFuc2xhdGUgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gcGh5c2ljYWwgYWRkcmVzcy4gVGhl
IGZ1bmN0aW9uIHNob3VsZA0KPj4gb25seSBiZSBjYWxsZWQgb24gdmlydHVhbCBhZGRyZXNzIG1h
cHBlZC4NCj4+DQo+PiBfZW5kIHBvaW50cyBwYXN0IHRoZSBlbmQgb2YgWGVuIGJpbmFyeSBhbmQg
bWF5IG5vdCBiZSBtYXBwZWQgd2hlbiB0aGUNCj4+IGJpbmFyeSBzaXplIGlzIHBhZ2UtYWxpZ25l
ZC4gVGhpcyBtZWFucyB2aXJ0X3RvX21hZGRyKCkgd2lsbCBub3QgYmUgYWJsZQ0KPj4gdG8gZG8g
dGhlIHRyYW5zbGF0aW9uIGFuZCB0aGVyZWZvcmUgY3Jhc2ggWGVuLg0KPj4NCj4+IE5vdGUgdGhl
cmUgaXMgYWxzbyBhbiBvZmYtYnktb25lIGlzc3VlIGluIHRoaXMgY29kZSwgYnV0IHRoZSBwYW5p
YyB3aWxsDQo+PiB0cnVtcCB0aGF0Lg0KPj4NCj4+IEJvdGggaXNzdWVzIGNhbiBiZSBmaXhlZCBi
eSB1c2luZyBfZW5kIC0gMSBpbiB0aGUgY2hlY2suDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4+DQo+PiAtLS0NCj4+DQo+PiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+IENjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQo+PiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+PiBDYzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPj4gQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+IENjOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4NCj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4gQ2M6IGpn
cm9zc0BzdXNlLmNvbQ0KPj4NCj4+IHg4NiBzZWVtcyB0byBiZSBhZmZlY3RlZCBieSB0aGUgb2Zm
LWJ5LW9uZSBpc3N1ZS4gSmFuLCBBbmRyZXc/DQo+Pg0KPj4gVGhpcyBjb3VsZCBiZSByZWFjaGVk
IGJ5IGEgZG9tYWluIHZpYSBYRU5fU1lTQ1RMX3BhZ2Vfb2ZmbGluZV9vcC4NCj4+IEhvd2V2ZXIs
IHRoZSBvcGVyYXRpb24gaXMgbm90IHNlY3VyaXR5IHN1cHBvcnRlZCAoc2VlIFhTQS03NykuIFNv
IHdlIGFyZQ0KPj4gZmluZSBoZXJlLg0KPj4gLS0tDQo+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0v
bW0uaCB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPj4gaW5kZXggMjYyZDkyZjE4ZC4uMTc0YWNkODg1OSAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPj4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9tbS5oDQo+PiBAQCAtMTUzLDcgKzE1Myw3IEBAIGV4dGVybiB1bnNpZ25l
ZCBsb25nIHhlbmhlYXBfYmFzZV9wZHg7DQo+PiAgIA0KPj4gICAjZGVmaW5lIGlzX3hlbl9maXhl
ZF9tZm4obWZuKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gICAgICAg
KChtZm5fdG9fbWFkZHIobWZuKSA+PSB2aXJ0X3RvX21hZGRyKCZfc3RhcnQpKSAmJiAgICAgICAg
ICAgXA0KPj4gLSAgICAgKG1mbl90b19tYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFkZHIoJl9lbmQp
KSkNCj4+ICsgICAgIChtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKF9lbmQgLSAx
KSkpDQo+IA0KPiBUaGFuayB5b3UgZm9yIHNlbmRpbmcgdGhlIHBhdGNoIGFuZCBJIHRoaW5rIHRo
YXQgIl9lbmQgLSAxIiBpcyB0aGUgcmlnaHQNCj4gZml4LiBJIGFtIGp1c3Qgd29uZGVyaW5nIHdo
ZXRoZXIgd2Ugd2FudC9uZWVkIGFuIGV4cGxpY2l0IGNhc3Qgb2Ygc29tZQ0KPiBzb3J0IGhlcmUs
IGJlY2F1c2UgdGVjaG5pY2FsbHkgX2VuZCBpcyBhIGNoYXJbXSBhbmQgMSBpcyBhIGludGVnZXIu
DQo+IE1heWJlOg0KPiANCj4gICAgKCh2YWRkcl90KV9lbmQgLSAxKQ0KPiANCj4gPw0KDQpJIHZh
Z3VlbHkgcmVtZW1iZXIgYSBsZW5ndGh5IGRpc2N1c3Npb24gYWJvdXQgaXQgbGFzdCB5ZWFyLiBC
dXQgSSBkb24ndCANCnRoaW5rIHRoZXJlIHdhcyBhbnkgY29uY2x1c2lvbiBpbiBpdC4NCg0KSW4g
dGhpcyBjYXNlLCB3aGF0IGFyZSB5b3UgdHJ5aW5nIHRvIHByZXZlbnQgd2l0aCB0aGUgY2FzdD8g
SXMgaXQgDQp1bmRlcmZsb3cgb2YgYW4gYXJyYXk/IElmIHNvLCBob3cgdGhlIGNhc3QgaXMgYWN0
dWFsbHkgZ29pbmcgdG8gcHJldmVudCANCnRoZSBjb21waWxlciB0byBkbyB0aGUgd3JvbmcgdGhp
bmc/DQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
