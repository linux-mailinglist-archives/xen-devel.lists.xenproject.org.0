Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9668A5F988
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2G5-0006vy-KV; Thu, 04 Jul 2019 13:58:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj2G4-0006vt-Au
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 13:58:44 +0000
X-Inumbo-ID: d5140fa1-9e63-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5140fa1-9e63-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 13:58:43 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 13:58:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 13:57:59 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 13:57:59 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3412.namprd18.prod.outlook.com (10.255.136.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Thu, 4 Jul 2019 13:57:58 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 13:57:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 4/4] x86/vLAPIC: avoid speculative out of
 bounds accesses
Thread-Index: AQHVMm6mTJlD4xI56EKEmgGwHjiShqa6fAwA
Date: Thu, 4 Jul 2019 13:57:57 +0000
Message-ID: <2df89186-5c22-000e-40ca-a7db95799a31@suse.com>
References: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
 <5C5305BC0200007800212CB9@prv1-mh.provo.novell.com>
 <a97c084c-5784-97e9-9ddd-9441045ab38f@citrix.com>
In-Reply-To: <a97c084c-5784-97e9-9ddd-9441045ab38f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96b18e34-0ebb-4ba2-34a7-08d700879e75
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3412; 
x-ms-traffictypediagnostic: BY5PR18MB3412:
x-microsoft-antispam-prvs: <BY5PR18MB341214E2C4B86AF5F328568BB3FA0@BY5PR18MB3412.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(476003)(6486002)(2616005)(107886003)(6506007)(386003)(53546011)(4326008)(81156014)(66066001)(6512007)(6246003)(14454004)(186003)(446003)(53936002)(305945005)(26005)(7736002)(31696002)(66556008)(66946007)(11346002)(73956011)(5660300002)(102836004)(81166006)(8676002)(66446008)(64756008)(2906002)(66476007)(86362001)(486006)(14444005)(72206003)(31686004)(54906003)(68736007)(229853002)(52116002)(256004)(316002)(36756003)(6116002)(3846002)(25786009)(76176011)(6436002)(4744005)(99286004)(8936002)(110136005)(71190400001)(80792005)(71200400001)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3412;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q76Vf/sbBFvhETc6JeWNUTwKIkUrcEUxkS3Z2ndmL5WNRNvmh08TC/ovS8/fEQrD0mXEF6avBi1x1UK1fsPkKcbNxh74J+Y+kuPwzauSpjm6InJ+mupghBLYKTrhWq0ky+HTX3miKv42i3IqGuuAfe51Br8fVDh2Krplv33TPV8zEGIjiE3fA8h5hbqkDS5qW2LL25CbVHA2Ii2AR99DAGbeFqPfMOXvkGuzdVW/lRNRkIZer4mmgj7p9fmGI8JAjmTs3yfQGr4u5eQVRgq2RvWGLb9Qe/MROygUdta18FvrOivT9inffxI2jQGBvkEaqcBvCyrcHrYip75G4D7PaGeRiRKcX8c1yLCgof5N1AeiThF15GgB6caN/JH4miO5z4evmE7Uu1/wBLOxw7JOjVfGydHmoBEGCPO3VTW35jI=
Content-ID: <95C56FF449A031478ED2E6983BBAF91D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b18e34-0ebb-4ba2-34a7-08d700879e75
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 13:57:57.8368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3412
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/4] x86/vLAPIC: avoid speculative out of
 bounds accesses
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
Cc: Juergen Gross <JGross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 "nmanthey@amazon.de" <nmanthey@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxNTo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzEvMDEvMjAx
OSAxNDoyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBBcnJheSBpbmRleGVzIHVzZWQgaW4gdGhl
IE1NSU8gYW5kIE1TUiByZWFkL3dyaXRlIGVtdWxhdGlvbiBmdW5jdGlvbnMNCj4+IGFyZSBkZXJp
dmVkIGZyb20gZ3Vlc3QgY29udHJvbGxlZCB2YWx1ZXMuIFJlc3RyaWN0IHRoZWlyIHJhbmdlcyB0
byBsaW1pdA0KPj4gdGhlIHNpZGUgZWZmZWN0cyBvZiBzcGVjdWxhdGl2ZSBleGVjdXRpb24uDQo+
Pg0KPj4gUmVtb3ZlIHRoZSB1bnVzZWQgdmxhcGljX2x2dF97dmVjdG9yLGRtfSgpIGluc3RlYWQg
b2YgYWRqdXN0aW5nIHRoZW0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gV2hpbGUgdGhleSBhcmUgYWxsIGd1ZXN0IGNvbnRyb2xs
ZWQsIHRoZSBNTUlPIHNpZGUgb2YgdGhpbmdzIGlzIG9uIHRoZQ0KPiBlbmQgb2YgYSBmdW5jdGlv
biBwb2ludGVyIGNhbGwsIHdoaWNoIGhhcyBhbHJlYWR5IGRldGVybWluZWQgdGhhdCB0aGUNCj4g
YWNjZXNzIGlzIHdpdGhpbiA0ay7CoCBJIGRvbid0IHRoaW5rIHRoZXJlIGFueSBzYWZldHkgY29u
Y2VybnMgaGVyZS4NCg0KSS5lLiBhcmUgeW91IHN1Z2dlc3RpbmcgdGhlcmUncyBubyBzcGVjdWxh
dGlvbiB0aHJvdWdoIGluZGlyZWN0DQpjYWxscz8NCg0KPiBndWVzdF9yZG1zcl94MmFwaWMoKSBk
b2VzIGdldCB2YWx1ZXMgaW4gdGhlIHJhbmdlIDB4ODAwLi4uMHhiZmYsIHNvIEkNCj4gdGhpbmsg
dGhpcyBpcyB0aGUgb25seSBjYXNlIHdoaWNoIG5lZWRzIHByb3RlY3RpbmcuDQoNCldoYXQgYWJv
dXQgdmxhcGljX2FwaWN2X3dyaXRlKCksIHdoaWNoIGRvZXMgZ2V0IGNhbGxlZCBkaXJlY3RseT8N
Cg0KQW5kIHdoYXQgYWJvdXQgdGhlIHZsYXBpY19sdnRfbWFza1tdIGFjY2Vzc2VzPw0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
